#!/usr/bin/env node

process.env.PORT = 3066;

import models, {sequelize} from '../../server/models';
import _ from 'lodash';
import Promise from 'bluebird';
import { formatCurrency, formatArrayToString, formatCurrencyObject } from '../../server/lib/utils';
import emailLib from '../../server/lib/email';

const d = new Date;
const startDate = new Date(`${d.getFullYear()}`);
const endDate = new Date(`${d.getFullYear()+1}`);

console.log("startDate", startDate, "endDate", endDate);

const GetUserTransactionsQuery = `
with "UserTransactions" as (
  SELECT
    "CollectiveId",
    SUM("amountInHostCurrency") as "amountInHostCurrency",
    MAX("hostCurrency") as "hostCurrency",
    SUM("platformFeeInHostCurrency") as "platformFeeInHostCurrency",
    MAX("hostFeeInHostCurrency") as "hostFeeInHostCurrency",
    MAX("paymentProcessorFeeInHostCurrency") as "paymentProcessorFeeInHostCurrency"
  FROM "Transactions"
  WHERE "CreatedByUserId"=:userid AND amount > 0 AND "deletedAt" IS NULL AND "PaymentMethodId" IS NOT NULL
  GROUP BY "CollectiveId"
)
SELECT
  ut.*,
  host.username as "hostSlug",
  CONCAT(host."firstName", ' ', host."lastName") as "hostName",
  host.image as "hostLogo", host."twitterHandle" as "hostTwitterHandle", host.description as "hostDescription", host.mission as "hostMission",
  g.slug, g.name, g.mission, g.image, g."backgroundImage", g."twitterHandle", g.settings, g.data
FROM "UserTransactions" ut 
LEFT JOIN "Collectives" g ON ut."CollectiveId" = g.id
LEFT JOIN "Members" ug ON ut."CollectiveId" = ug."CollectiveId" AND ug.role='HOST'
LEFT JOIN "Users" host ON ug."CreatedByUserId" = host.id`;

const buildTweet = (collectives, totalDonations) => {
  let tweet;
  const totalCollectives = Object.keys(collectives).length;
  const collectivesNames = [], collectivesDonationsNames = [];
  for (const slug in collectives) {
    const collective = collectives[slug];
    const collectiveName = (collective.twitterHandle) ? `@${collective.twitterHandle}` : collective.name;
    collectivesNames.push(collectiveName);
    collectivesDonationsNames.push(`${formatCurrency(collective.totalDonations, collective.currency)} to ${collectiveName}`);
  }

  if (totalCollectives > 2) {
    tweet = `🎁 In 2016, I have contributed a total of ${formatCurrencyObject(totalDonations)} to ${totalCollectives} collectives`;
    const listCollectives = formatArrayToString(collectivesNames);
    if ( `${tweet}: ${listCollectives}`.length < 120 )
      tweet = `${tweet}: ${listCollectives}`;
  } else if (totalCollectives === 1) {
    tweet = `🎁 In 2016, I have contributed ${collectivesDonationsNames[0].replace(' to ',' to the ')} collective`;
  } else {
    tweet = `🎁 In 2016, I have contributed ${formatArrayToString(collectivesDonationsNames)}'s collective`;
  }

  return tweet;
}

const processUser = (user) => {
  return sequelize.query(GetUserTransactionsQuery, {
    type: sequelize.QueryTypes.SELECT,
    replacements: { userid: user.id }
  })
  .then(rows => {
    if (!rows || rows.length === 0) {
      return Promise.reject(`No transaction for ${user.username}, skipping`);
    }
    const hosts = { opencollective: { name: 'Platform fees'}, stripe: { name: 'Credit Card Processing Fees (Stripe)' } };
    const totalCollectives = rows.length;
    const totalDonations = {};
    const collectives = {};
    rows.forEach(row => {
      if (typeof hosts[row.hostSlug] === 'undefined') {
        hosts[row.hostSlug] = {
          slug: row.hostSlug,
          name: row.hostName.trim() || row.hostSlug,
          image: row.hostLogo,
          twitterHandle: row.hostTwitterHandle,
          description: row.hostDescription || row.hostMission,
          collectives: {}
        };
      }

      collectives[row.slug] = {
        slug: row.slug,
        name: row.name || row.slug,
        mission: row.mission,
        image: row.image,
        backgroundImage: row.backgroundImage || 'https://opencollective.com/public/images/collectives/default-header-bg.jpg',
        twitterHandle: row.twitterHandle,
        settings: row.settings,
        data: row.data,
        totalDonations: Number(row.amountInHostCurrency),
        currency: row.hostCurrency
      };

      hosts[row.hostSlug].collectives[row.slug] = collectives[row.slug];

      if (typeof totalDonations[row.hostCurrency] === 'undefined')
        totalDonations[row.hostCurrency] = 0;

      _.set(hosts, [row.hostSlug, 'totalFees', row.hostCurrency], 0);
      _.set(hosts, ['stripe', 'totalFees', row.hostCurrency], 0);
      _.set(hosts, ['opencollective', 'totalFees', row.hostCurrency], 0);

      totalDonations[row.hostCurrency] += Number(row.amountInHostCurrency);
      hosts[row.hostSlug]['totalFees'][row.hostCurrency] += Number(row.hostFeeInHostCurrency);
      hosts['opencollective']['totalFees'][row.hostCurrency] += Number(row.platformFeeInHostCurrency);
      hosts['stripe']['totalFees'][row.hostCurrency] += Number(row.paymentProcessorFeeInHostCurrency);
    })

    const fees = {
      stripe: hosts['stripe'].totalFees,
      opencollective: hosts['opencollective'].totalFees,
    };

    delete hosts['stripe'];
    delete hosts['opencollective'];

    if (hosts['host-org']) {
      delete hosts['host-org'].name; // don't show the default host OpenCollective, Inc.
    }

    const profileUrl = `https://opencollective.com/${user.username}`;
    const tweetText = buildTweet(collectives, totalDonations);
    const tweetUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(tweetText)}&url=${profileUrl}`;
    return {
      stats: { totalCollectives, totalDonations },
      tweet: { text: tweetText.substr(2), url: tweetUrl },
      fees,
      hosts
    }
  })
  .then(data => {
    data.recipient = user;
    return emailLib.send('user.yearlyreport', user.email, data);
  })
  .catch(console.error);
};

const processUsers = (users) => {
  console.log("Processing ", users.length, "users");
  return Promise.map(users, processUser);
};

const getRecipients = () => {
  const where = {};

  if (process.env.DEBUG && process.env.DEBUG.match(/preview/)) {
    where.username = { $in : ['4sa1da2','xdamman','asood','piamancini','digitalocean','auth0','timberio','mrlnmarce'] };
  }

  return models.Notification.findAll({
    where: {
      channel: 'email',
      type: 'user.yearlyreport'
    },
    include: [{ model: models.User, where }]
  }).then(results => results.map(r => r.User.dataValues));
}

const init = () => {

  const startTime = new Date;

  getRecipients()
  .then(processUsers)
  .then(() => {
    const timeLapsed = Math.round((new Date - startTime)/1000);
    console.log(`Total run time: ${timeLapsed}s`);
    process.exit(0);
  });
}

init();
