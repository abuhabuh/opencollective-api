toc.dat                                                                                             0000600 0004000 0002000 00000175305 13174666341 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       	    u           wwcode_test    9.6.5    10.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    1644923    wwcode_test    DATABASE     }   CREATE DATABASE wwcode_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE wwcode_test;
             opencollective    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                     3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                     3079    1644924    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    4         �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2         1           1247    1646898    enum_Groups_membership_type    TYPE     i   CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);
 0   DROP TYPE public."enum_Groups_membership_type";
       public       aseem    false    4         4           1247    1646906    enum_UserGroups_role    TYPE     X   CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);
 )   DROP TYPE public."enum_UserGroups_role";
       public       aseem    false    4         �            1259    1646913 
   Activities    TABLE     �   CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);
     DROP TABLE public."Activities";
       public         opencollective    false    4         �            1259    1646919    Activities_id_seq    SEQUENCE     u   CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Activities_id_seq";
       public       opencollective    false    4    201         �           0    0    Activities_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;
            public       opencollective    false    202         �            1259    1646934    PaymentMethods    TABLE     �  CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);
 $   DROP TABLE public."PaymentMethods";
       public         opencollective    false    4         �            1259    1646941    Cards_id_seq    SEQUENCE     p   CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Cards_id_seq";
       public       opencollective    false    203    4         �           0    0    Cards_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;
            public       opencollective    false    204         �            1259    1646995    CollectiveHistories    TABLE       CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);
 )   DROP TABLE public."CollectiveHistories";
       public         opencollective    false    2    4    2    4    2    4    2    4    2    4    2    4    2    4    2    4    4         �            1259    1647003    Collectives    TABLE     �  CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);
 !   DROP TABLE public."Collectives";
       public         opencollective    false    4    2    4    2    4    2    4    2    4    2    4    2    4    2    4    2    4         �            1259    1646951    ConnectedAccounts    TABLE     �  CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);
 '   DROP TABLE public."ConnectedAccounts";
       public         opencollective    false    4         �            1259    1646957    ConnectedAccounts_id_seq    SEQUENCE     |   CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ConnectedAccounts_id_seq";
       public       opencollective    false    4    205         �           0    0    ConnectedAccounts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;
            public       opencollective    false    206         �            1259    1646959    Orders    TABLE     q  CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);
    DROP TABLE public."Orders";
       public         opencollective    false    4         �            1259    1646967    Donations_id_seq    SEQUENCE     t   CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Donations_id_seq";
       public       opencollective    false    4    207         �           0    0    Donations_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;
            public       opencollective    false    208         �            1259    1646978    ExpenseHistories    TABLE     �  CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public."ExpenseHistories";
       public         opencollective    false    4         �            1259    1646984    ExpenseHistories_hid_seq    SEQUENCE     |   CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExpenseHistories_hid_seq";
       public       opencollective    false    209    4         �           0    0    ExpenseHistories_hid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;
            public       opencollective    false    210         �            1259    1646986    Expenses    TABLE     �  CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);
    DROP TABLE public."Expenses";
       public         opencollective    false    4         �            1259    1646993    Expenses_id_seq    SEQUENCE     s   CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Expenses_id_seq";
       public       opencollective    false    211    4         �           0    0    Expenses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;
            public       opencollective    false    212         �            1259    1647001    GroupHistories_hid_seq    SEQUENCE     z   CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."GroupHistories_hid_seq";
       public       opencollective    false    213    4         �           0    0    GroupHistories_hid_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;
            public       opencollective    false    214         �            1259    1647012    Groups_id_seq    SEQUENCE     q   CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Groups_id_seq";
       public       opencollective    false    4    215         �           0    0    Groups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;
            public       opencollective    false    216         �            1259    1647086    Members    TABLE     �  CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);
    DROP TABLE public."Members";
       public         opencollective    false    4         �            1259    1647014    Notifications    TABLE     r  CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);
 #   DROP TABLE public."Notifications";
       public         opencollective    false    4         �            1259    1647039    SequelizeMeta    TABLE     K   CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         opencollective    false    4         �            1259    1647042    Sessions    TABLE     �   CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Sessions";
       public         opencollective    false    4         �            1259    1647056    Subscriptions    TABLE       CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);
 #   DROP TABLE public."Subscriptions";
       public         opencollective    false    4         �            1259    1647064    Subscriptions_id_seq    SEQUENCE     x   CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Subscriptions_id_seq";
       public       opencollective    false    217    4         �           0    0    Subscriptions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;
            public       opencollective    false    221         �            1259    1647066    Subscriptions_id_seq1    SEQUENCE     y   CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Subscriptions_id_seq1";
       public       opencollective    false    4    220         �           0    0    Subscriptions_id_seq1    SEQUENCE OWNED BY     D   ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;
            public       opencollective    false    222         �            1259    1647068    Tiers    TABLE       CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(510),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);
    DROP TABLE public."Tiers";
       public         opencollective    false    4         �            1259    1647075    Tiers_id_seq    SEQUENCE     p   CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Tiers_id_seq";
       public       opencollective    false    223    4         �           0    0    Tiers_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;
            public       opencollective    false    224         �            1259    1647077    Transactions    TABLE     �  CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInHostCurrency" integer,
    "hostFeeInHostCurrency" integer,
    "paymentProcessorFeeInHostCurrency" integer,
    "hostCurrency" character varying(255),
    "hostCurrencyFxRate" double precision,
    "amountInHostCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer,
    "TransactionGroup" uuid
);
 "   DROP TABLE public."Transactions";
       public         opencollective    false    4         �            1259    1647084    Transactions_id_seq    SEQUENCE     w   CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Transactions_id_seq";
       public       opencollective    false    225    4         �           0    0    Transactions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;
            public       opencollective    false    226         �            1259    1647090    UserGroups_id_seq    SEQUENCE     u   CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."UserGroups_id_seq";
       public       opencollective    false    227    4         �           0    0    UserGroups_id_seq    SEQUENCE OWNED BY     :   ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;
            public       opencollective    false    228         �            1259    1647092    Users    TABLE     4  CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "isHost" boolean DEFAULT false,
    "CollectiveId" integer
);
    DROP TABLE public."Users";
       public         opencollective    false    4         �            1259    1647103    Users_id_seq    SEQUENCE     p   CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       opencollective    false    229    4         �           0    0    Users_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;
            public       opencollective    false    230         �           0    0    geography_columns    ACL     8   GRANT ALL ON TABLE geography_columns TO opencollective;
            public       aseem    false    189         �           0    0    geometry_columns    ACL     7   GRANT ALL ON TABLE geometry_columns TO opencollective;
            public       aseem    false    190         �           0    0    raster_columns    ACL     5   GRANT ALL ON TABLE raster_columns TO opencollective;
            public       aseem    false    199         �           0    0    raster_overviews    ACL     7   GRANT ALL ON TABLE raster_overviews TO opencollective;
            public       aseem    false    200         �           0    0    spatial_ref_sys    ACL     �   REVOKE ALL ON TABLE spatial_ref_sys FROM aseem;
REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
            public       opencollective    false    187         �           2604    1647105    Activities id    DEFAULT     d   ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);
 >   ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    202    201         �           2604    1647113    CollectiveHistories hid    DEFAULT     s   ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);
 H   ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    214    213         �           2604    1647114    Collectives id    DEFAULT     a   ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);
 ?   ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    216    215         �           2604    1647108    ConnectedAccounts id    DEFAULT     r   ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);
 E   ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    206    205         �           2604    1647111    ExpenseHistories hid    DEFAULT     r   ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);
 E   ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
       public       opencollective    false    210    209         �           2604    1647112    Expenses id    DEFAULT     `   ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);
 <   ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    212    211         �           2604    1647123 
   Members id    DEFAULT     a   ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);
 ;   ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    228    227         �           2604    1647115    Notifications id    DEFAULT     j   ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);
 A   ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    221    217         �           2604    1647109 	   Orders id    DEFAULT     _   ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);
 :   ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    208    207         �           2604    1647117    PaymentMethods id    DEFAULT     c   ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);
 B   ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    204    203         �           2604    1647120    Subscriptions id    DEFAULT     k   ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);
 A   ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    222    220         �           2604    1647121    Tiers id    DEFAULT     Z   ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);
 9   ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    224    223         �           2604    1647122    Transactions id    DEFAULT     h   ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);
 @   ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    226    225         �           2604    1647124    Users id    DEFAULT     Z   ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       opencollective    false    230    229         �          0    1646913 
   Activities 
   TABLE DATA               g   COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
    public       opencollective    false    201       4001.dat �          0    1646995    CollectiveHistories 
   TABLE DATA               �  COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
    public       opencollective    false    213       4013.dat �          0    1647003    Collectives 
   TABLE DATA               �  COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
    public       opencollective    false    215       4015.dat �          0    1646951    ConnectedAccounts 
   TABLE DATA               �   COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
    public       opencollective    false    205       4005.dat �          0    1646978    ExpenseHistories 
   TABLE DATA                 COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
    public       opencollective    false    209       4009.dat �          0    1646986    Expenses 
   TABLE DATA               �   COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
    public       opencollective    false    211       4011.dat �          0    1647086    Members 
   TABLE DATA               �   COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
    public       opencollective    false    227       4027.dat �          0    1647014    Notifications 
   TABLE DATA                  COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
    public       opencollective    false    217       4017.dat �          0    1646959    Orders 
   TABLE DATA                 COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
    public       opencollective    false    207       4007.dat �          0    1646934    PaymentMethods 
   TABLE DATA               �   COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
    public       opencollective    false    203       4003.dat �          0    1647039    SequelizeMeta 
   TABLE DATA               (   COPY "SequelizeMeta" (name) FROM stdin;
    public       opencollective    false    218       4018.dat �          0    1647042    Sessions 
   TABLE DATA               K   COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public       opencollective    false    219       4019.dat �          0    1647056    Subscriptions 
   TABLE DATA               �   COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public       opencollective    false    220       4020.dat �          0    1647068    Tiers 
   TABLE DATA               �   COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
    public       opencollective    false    223       4023.dat �          0    1647077    Transactions 
   TABLE DATA               �  COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId", "TransactionGroup") FROM stdin;
    public       opencollective    false    225       4025.dat �          0    1647092    Users 
   TABLE DATA                  COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM stdin;
    public       opencollective    false    229       4029.dat �          0    1645221    spatial_ref_sys 
   TABLE DATA               Q   COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       opencollective    false    187       3752.dat �           0    0    Activities_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);
            public       opencollective    false    202         �           0    0    Cards_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);
            public       opencollective    false    204         �           0    0    ConnectedAccounts_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1026, true);
            public       opencollective    false    206         �           0    0    Donations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);
            public       opencollective    false    208         �           0    0    ExpenseHistories_hid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);
            public       opencollective    false    210         �           0    0    Expenses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);
            public       opencollective    false    212         �           0    0    GroupHistories_hid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);
            public       opencollective    false    214         �           0    0    Groups_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Groups_id_seq"', 857, true);
            public       opencollective    false    216         �           0    0    Subscriptions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);
            public       opencollective    false    221         �           0    0    Subscriptions_id_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);
            public       opencollective    false    222         �           0    0    Tiers_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('"Tiers_id_seq"', 128, true);
            public       opencollective    false    224         �           0    0    Transactions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Transactions_id_seq"', 11354, true);
            public       opencollective    false    226         �           0    0    UserGroups_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('"UserGroups_id_seq"', 4728, true);
            public       opencollective    false    228         �           0    0    Users_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);
            public       opencollective    false    230         �           2606    1647128    Activities Activities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
       public         opencollective    false    201         �           2606    1647134    PaymentMethods Cards_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
       public         opencollective    false    203         �           2606    1647138 (   ConnectedAccounts ConnectedAccounts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
       public         opencollective    false    205         �           2606    1647140    Orders Donations_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);
 C   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
       public         opencollective    false    207         �           2606    1647144 &   ExpenseHistories ExpenseHistories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);
 T   ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
       public         opencollective    false    209         �           2606    1647146    Expenses Expenses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
       public         opencollective    false    211         �           2606    1647148 '   CollectiveHistories GroupHistories_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);
 U   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
       public         opencollective    false    213         �           2606    1647150    Collectives Groups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
       public         opencollective    false    215         �           2606    1647158     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         opencollective    false    218         �           2606    1647160    Sessions Sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);
 D   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
       public         opencollective    false    219         �           2606    1647164     Notifications Subscriptions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
       public         opencollective    false    217         �           2606    1647166 !   Subscriptions Subscriptions_pkey1 
   CONSTRAINT     \   ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
       public         opencollective    false    220         �           2606    1647168    Tiers Tiers_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
       public         opencollective    false    223         �           2606    1647170    Transactions Transactions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
       public         opencollective    false    225         �           2606    1647172    Members UserGroups_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
       public         opencollective    false    227         �           2606    1647174    Users Users_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public         opencollective    false    229         �           2606    1647176    Users Users_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         opencollective    false    229         �           2606    1647180    Users email_unique_idx 
   CONSTRAINT     M   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);
 B   ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
       public         opencollective    false    229         �           1259    1647550    CollectiveId    INDEX     E   CREATE INDEX "CollectiveId" ON "Users" USING btree ("CollectiveId");
 "   DROP INDEX public."CollectiveId";
       public         opencollective    false    229         �           1259    1647551 "   CollectiveId-FromCollectiveId-type    INDEX     �   CREATE INDEX "CollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");
 8   DROP INDEX public."CollectiveId-FromCollectiveId-type";
       public         opencollective    false    225    225    225         �           1259    1647553    CollectiveId-deletedAt    INDEX     \   CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");
 ,   DROP INDEX public."CollectiveId-deletedAt";
       public         opencollective    false    223    223         �           1259    1647549    CollectiveId-role    INDEX     R   CREATE INDEX "CollectiveId-role" ON "Members" USING btree ("CollectiveId", role);
 '   DROP INDEX public."CollectiveId-role";
       public         opencollective    false    227    227         �           1259    1647552    CollectiveId-type    INDEX     W   CREATE INDEX "CollectiveId-type" ON "Transactions" USING btree ("CollectiveId", type);
 '   DROP INDEX public."CollectiveId-type";
       public         opencollective    false    225    225         �           1259    1647405 
   DonationId    INDEX     E   CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");
     DROP INDEX public."DonationId";
       public         opencollective    false    225         �           1259    1647548 $   MemberCollectiveId-CollectiveId-role    INDEX     {   CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);
 :   DROP INDEX public."MemberCollectiveId-CollectiveId-role";
       public         opencollective    false    227    227    227         �           1259    1647547    ParentCollectiveId    INDEX     W   CREATE INDEX "ParentCollectiveId" ON "Collectives" USING btree ("ParentCollectiveId");
 (   DROP INDEX public."ParentCollectiveId";
       public         opencollective    false    215         �           1259    1647181    Transactions_GroupId    INDEX     a   CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");
 *   DROP INDEX public."Transactions_GroupId";
       public         opencollective    false    225    225         �           1259    1647183    UniqueSlugIndex    INDEX     K   CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);
 %   DROP INDEX public."UniqueSlugIndex";
       public         opencollective    false    215         �           1259    1647185 %   subscriptions_type__group_id__user_id    INDEX     {   CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");
 9   DROP INDEX public.subscriptions_type__group_id__user_id;
       public         opencollective    false    217    217    217         �           1259    1647419    transactions_uuid    INDEX     L   CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);
 %   DROP INDEX public.transactions_uuid;
       public         opencollective    false    225         �           1259    1647546 	   type-tags    INDEX     D   CREATE INDEX "type-tags" ON "Collectives" USING btree (type, tags);
    DROP INDEX public."type-tags";
       public         opencollective    false    215    215         �           2606    1647187 "   Activities Activities_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
       public       opencollective    false    215    3805    201                     2606    1647192 (   Activities Activities_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
       public       opencollective    false    3826    225    201                    2606    1647197 !   Activities Activities_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
       public       opencollective    false    229    201    3836                    2606    1647212     PaymentMethods Cards_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
       public       opencollective    false    3836    203    229                    2606    1647456 <   CollectiveHistories CollectiveHistories_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 j   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
       public       opencollective    false    3836    213    229                    2606    1647462 =   CollectiveHistories CollectiveHistories_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 k   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
       public       opencollective    false    3805    215    213                    2606    1647467 ?   CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 m   ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
       public       opencollective    false    3805    215    213                    2606    1647430 ,   Collectives Collectives_CreatedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
       public       opencollective    false    229    215    3836                    2606    1647435 -   Collectives Collectives_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 [   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
       public       opencollective    false    215    3805    215                    2606    1647440 /   Collectives Collectives_ParentCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
       public       opencollective    false    3805    215    215                    2606    1647232 0   ConnectedAccounts ConnectedAccounts_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
       public       opencollective    false    205    3805    215                    2606    1647237 /   ConnectedAccounts ConnectedAccounts_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
       public       opencollective    false    205    229    3836                    2606    1647242    Orders Donations_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
       public       opencollective    false    3805    215    207         	           2606    1647247 %   Orders Donations_PaymentMethodId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
       public       opencollective    false    207    203    3793         
           2606    1647257 $   Orders Donations_SubscriptionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 R   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
       public       opencollective    false    207    3817    220                    2606    1647262    Orders Donations_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
       public       opencollective    false    207    3836    229                    2606    1647282    Expenses Expenses_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
       public       opencollective    false    215    211    3805                    2606    1647287    Expenses Expenses_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
       public       opencollective    false    211    3836    229                    2606    1647292 %   Expenses Expenses_lastEditedById_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
       public       opencollective    false    211    3836    229                    2606    1647297 *   Collectives Groups_lastEditedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
       public       opencollective    false    3836    215    229                     2606    1647536 '   Members Members_MemberCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
       public       opencollective    false    215    3805    227         !           2606    1647541    Members Members_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
       public       opencollective    false    227    223    3820                    2606    1647490 #   Orders Orders_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
       public       opencollective    false    207    215    3805                    2606    1647485    Orders Orders_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
       public       opencollective    false    207    3820    223                    2606    1647554 /   PaymentMethods PaymentMethods_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
       public       opencollective    false    3805    203    215                    2606    1647327 (   Notifications Subscriptions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
       public       opencollective    false    3805    215    217                    2606    1647332 '   Notifications Subscriptions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
       public       opencollective    false    3836    229    217                    2606    1647414    Tiers Tiers_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
       public       opencollective    false    215    3805    223                    2606    1647342 %   Transactions Transactions_CardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
       public       opencollective    false    3793    225    203                    2606    1647347 )   Transactions Transactions_DonationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
       public       opencollective    false    225    207    3797                    2606    1647352 (   Transactions Transactions_ExpenseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
       public       opencollective    false    225    3801    211                    2606    1647502 /   Transactions Transactions_FromCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
       public       opencollective    false    3805    225    215                    2606    1647357 &   Transactions Transactions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
       public       opencollective    false    225    215    3805                    2606    1647507 /   Transactions Transactions_HostCollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
       public       opencollective    false    215    225    3805                    2606    1647367 %   Transactions Transactions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
       public       opencollective    false    3836    225    229         "           2606    1647372    Members UserGroups_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);
 M   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
       public       opencollective    false    3805    227    215         #           2606    1647377    Members UserGroups_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
       public       opencollective    false    3836    227    229         $           2606    1647480    Users Users_CollectiveId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
       public       opencollective    false    3805    229    215                                                                                                                                                                                                                                                                                                                                   4001.dat                                                                                            0000600 0004000 0002000 00000000005 13174666341 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4013.dat                                                                                            0000600 0004000 0002000 00000000005 13174666341 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4015.dat                                                                                            0000600 0004000 0002000 00000472446 13174666341 0014277 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        275	WWCode Hong Kong 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:08:19.455-04	2016-12-27 11:53:38.119-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Hong Kong**](https://www.womenwhocode.com/hk). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodehongkong#support) to support WWCode Hong Kong \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/adea85b0-9c7a-11e6-a3da-b7d8fa4b13cd.png	wwcodehongkong	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
525	Women Who Code Pune	\N	USD	2017-02-21 15:16:59.055-05	2017-02-21 15:18:19.484-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/pune) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodepune#support) to support WWCode Pune \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodepune	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
510	Women Who Code Richmond	\N	USD	2017-02-21 11:25:28.328-05	2017-02-21 11:25:28.5-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!	\N	wwcoderichmond	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
283	WWCode Paris	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 14:16:17.095-04	2016-12-27 13:09:21.598-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Paris**](https://www.womenwhocode.com/paris). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeparis#support) to support WWCode Paris \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/17525ef0-9d44-11e6-9116-db595ff259df.png	wwcodeparis	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
515	Women Who Code Philadelphia	\N	USD	2017-02-21 13:49:14.309-05	2017-02-21 13:55:30.087-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodephiladelphia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
14	WWCode Seattle	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 19:00:00-05	2016-12-27 14:51:31.023-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Seattle**](https://www.womenwhocode.com/seattle). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcode-seattle#support) to support WWCode Seattle \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/48297200-90a8-11e6-a134-f381d4cd2713.png	wwcodeseattle	https://www.womenwhocode.com/seattle	wwcode-seattle	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
523	Women Who Code Sofia	\N	EUR	2017-02-21 15:04:48.889-05	2017-02-21 15:06:29.574-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sofia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesofia#support) to support WWCode Sofia \n\nQuestions? Email us at global@womenwhocode.com	\N	wwcodesofia	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
584	WWCode Edinburgh	\N	GBP	2017-04-03 12:22:45.923-04	2017-04-03 12:22:46-04	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n\n# Contribute\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSczqJwa2qByhFFHXavunDYPzXRh1p0lOVa8nfyMSvCCySkd0Q/viewform)\n[**Attend**](https://www.womenwhocode.com/edinburgh) 	\N	wwcodeedinburgh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	3206	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
48	WWCode Twin Cities	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-03-06 19:00:00-05	2016-12-28 11:23:57.622-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in the Twin Cities**](https://www.womenwhocode.com/twin-cities). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetwincities#support) to support WWCode Twin Cities \n\nQuestions? Email us at global@womenwhocode.com.  \n\n[**Sponsors**](https://drive.google.com/file/d/0ByjnHHy83oCsS3hjMjRNZktkYmM/view?usp=sharing)\n      	https://opencollective-production.s3-us-west-1.amazonaws.com/079974c0-cd1a-11e6-a033-c553d2fe46df.png	wwcodetwincities	https://www.womenwhocode.com/twin-cities	wwcodetc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
51	Women Who Code	WWCode is a global non-profit organization dedicated 	USD	2015-10-31 20:00:00-04	2017-05-22 15:33:15.968-04	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	wwcode	http://womenwhocode.com	wwcode	We are on a mission to inspire women to excel in tech careers.	\N	10	{"HostId": 3, "lang":"wwcode","superCollectiveTag":"wwcode","githubOrg":"wwcode","style":{"hero": {"cover":{"background":"black"}}}}	{"UserId":3}	{wwcode,meetup,"diversity in tech"}	t	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
261	WWCode Al-Jazair	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 13:49:43.012-04	2016-12-23 11:44:45.61-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Al-Jaza'ir**](https://www.womenwhocode.com/al-jaza-ir-algeria). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodealjazair#support) to support WWCode Al-Jaza'ir\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/5cc6b9c0-9562-11e6-add0-93faa9a7296f.png	wwcodealjazair	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
59	WWCode Portland	We are women who code: in any framework with any level of experience from any size of company for any reason (even just for fun)!	USD	2016-03-18 20:00:00-04	2017-05-22 15:33:20.319-04	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Portland**](https://www.womenwhocode.com/portland). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeportland#support) to support WWCode Portland \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/WoL-XXTWSH.png	wwcodeportland	https://www.womenwhocode.com/portland	WWCodePortland	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode","githubOrg":"wwcodeportland"}	{"githubContributors":{"caterinasworld":380,"rk101288":5,"jminnier":1,"sajoy":12,"cynful":12,"aliaward":8,"Tradcliffe":5,"thejensen":1,"morganpdx":8,"Ksan8":2},"repos":{"networking-nights":{"stars":1},"wwc-speaker-series":{"stars":1},"iot-hackathon-2016":{"stars":0},"study-nights":{"stars":32},"wwcodeportland.github.io":{"stars":7},"about-us":{"stars":1},"workshops":{"stars":0}}}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
273	WWCode Greenville	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:06:00.939-04	2016-12-27 11:48:30.075-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Greenville**](https://www.womenwhocode.com/greenville). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegreenville#support) to support WWCode Greenville \n\nQuestions? Email us at global@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/d1719000-8fd7-11e6-b320-5125b901f984.png	wwcodegreenville	\N	wwcodegville	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
263	WWCode Beijing	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 13:53:00.452-04	2016-12-23 11:58:56.927-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Beijing**](https://www.womenwhocode.com/beijing). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebeijing#support) to support WWCode Beijing\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f6793200-961b-11e6-a6e9-23ce753be86b.png	wwcodebeijing	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
195	WWCode Boston	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 19:14:54.028-05	2016-12-23 12:29:46.034-05	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 50,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boston**](https://www.womenwhocode.com/boston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an upcoming event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Boston \n\nQuestions?  Email global@womenwhocode.com	https://cldup.com/E6Hx_qyE9A.png	wwcodeboston	https://www.womenwhocode.com/boston	wwcboston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
266	WWCode Brisbane	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 13:59:15.405-04	2016-12-23 12:39:30.07-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Brisbane**](https://www.womenwhocode.com/brisbane). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebrisbane#support) to support WWCode Brisbane\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/abcc78e0-c936-11e6-9af0-47fca5e686db.png	wwcodebrisbane	\N	wwcodebrisbane	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
267	WWCode Bristol 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 14:00:01.773-04	2016-12-23 12:54:17.915-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bristol**](https://www.womenwhocode.com/bristol). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebristol#support) to support WWCode Bristol \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/bea58950-c938-11e6-9af0-47fca5e686db.png	wwcodebristol	\N	wwcbristol	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
10	WWCode Mexico City	Nos dedicamos a inspirar inspirar a más mujeres a ser parte y destacar en carreras del mundo tecnológico.	MXN	2016-01-08 19:22:34.216-05	2016-12-27 12:59:26.298-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Mexico City**](https://www.womenwhocode.com/df). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedf#support) to support WWCode Mexico City \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/XMv1EFIxek.png	wwcodedf	http://www.meetup.com/Women-Who-Code-Mexico-City/	wwcodedf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
284	WWCode Phoenix	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:16:52.055-04	2016-12-27 13:33:28.693-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Phoenix**](https://www.womenwhocode.com/phoenix). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephoenix#support) to support WWCode Phoenix \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dd27b4d0-9d45-11e6-9116-db595ff259df.png	wwcodephoenix	\N	wwcodephoenix	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
3	WWCode New York	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 19:14:54.028-05	2016-12-27 13:05:42.126-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in New York City**](https://www.womenwhocode.com/nyc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodenyc#support) to support WWCode New York City \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/sjus3sm9uv.png	wwcodenyc	http://www.meetup.com/WomenWhoCodeNYC/	wwcodenyc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
300	WWCode Silicon Valley	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:41:11.03-04	2016-12-28 10:46:08.715-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Silicon Valley**](https://www.womenwhocode.com/sv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesv#support) to support WWCode Silicon Valley \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc80e4c0-90ad-11e6-a134-f381d4cd2713.png	wwcodesv	\N	wwcodesv	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
285	WWCode Reno/Tahoe	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:17:47.232-04	2016-12-27 14:29:59.63-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Reno/Tahoe**](https://www.womenwhocode.com/reno). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderenotahoe#support) to support WWCode Reno/Tahoe\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/caae3800-a2be-11e6-b669-1f602f2f2eec.png	wwcoderenotahoe	\N	WWCodeRenoTahoe	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
686	Michelle Sun	\N	USD	2016-09-29 14:08:19.492-04	\N	\N	t	\N	\N	michellesun	\N	\N	\N	\N	\N	\N	{"UserId":1328}	{user}	f	\N	1328	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
687	Dana Dalling	\N	USD	2016-09-29 14:09:42.785-04	\N	\N	t	\N	\N	danadalling	\N	\N	\N	\N	\N	\N	{"UserId":1329}	{user}	f	\N	1329	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
271	WWCode Dallas	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:03:46.779-04	2016-12-27 11:14:29.745-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dallas/Fort Worth**](https://www.womenwhocode.com/dfw). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedallas#support) to support WWCode Dallas/Fort Worth\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f1679990-9a18-11e6-8650-f92e594d5de8.png	wwcodedallas	\N	wwcodedfw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
688	Xavier Damman	Entrepreneur sharing ideas in copyleft	USD	2015-11-05 08:44:30.93-05	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet);	https://opencollective-production.s3-us-west-1.amazonaws.com/5c825534ad62223ae6a539f6a5076d3cjpeg_1699f6e0-917c-11e6-a567-3f53b7b5f95c.jpeg	xdamman	http://xdamman.com	xdamman	\N	\N	\N	\N	{"UserId":2}	{user}	f	\N	2	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
689	MakerSquare	\N	USD	2016-03-02 16:31:50.497-05	\N	\N	t	\N	https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/268/s300/makersquare-logo.png	makersquare	http://www.makersquare.com	MakerSquareATX	\N	\N	\N	\N	{"UserId":129}	{user}	f	\N	129	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
690	WWCode	\N	USD	2017-02-21 11:55:29.631-05	\N	\N	t	\N	\N	global	\N	\N	\N	\N	\N	\N	{"UserId":3206}	{user}	f	\N	3206	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
691	Pia Mancini	\N	USD	2016-01-09 16:31:01.954-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9EflVQqM_400x400jpg_2aee92e0-858d-11e6-9fd7-73dd31eb7c0c.jpeg	piamancini	\N	piamancini	\N	\N	\N	\N	{"UserId":30}	{user}	f	\N	30	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
692	androidchick88	\N	USD	2017-02-01 12:30:43.176-05	\N	\N	t	\N	\N	androidchick88	\N	\N	\N	\N	\N	\N	{"UserId":2906}	{user}	f	\N	2906	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
693	Anne Brown	\N	USD	2017-04-11 22:05:32.736-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/92dd7480-1f24-11e7-9a73-15e29bd9381e.png	abrown1411	\N	\N	\N	\N	\N	\N	{"UserId":4173}	{user}	f	\N	4173	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
694	Georgia Andrews	\N	USD	\N	\N	\N	t	\N	\N	georgia	\N	\N	\N	\N	\N	\N	{"UserId":577}	{user}	f	\N	577	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
695	Chee Yim Goh	 I am generalist who are curious about a lot of things and often find myself dabble in both technical and management.	USD	2016-09-29 14:10:43.391-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/b06d105a90d849daae3cee823078ffbc_4c27ac00-0dcb-11e7-92a0-730911003b33.jpeg	cheeyimgoh	\N	\N	\N	\N	\N	\N	{"UserId":1331}	{user}	f	\N	1331	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
696	Sarah Olson	Director of Women Who Code Twin Cities	USD	2016-03-07 04:51:08.328-05	\N	\N	t	I'm a Senior Software Engineer, currently working on the iOS app at Trello. I'm the Director of Women Who Code Twin Cities.	https://opencollective-production.s3-us-west-1.amazonaws.com/306b9860-dd87-11e6-aabd-af731cff2f24.jpeg	saraholson	https://www.linkedin.com/in/saraheolson	\N	\N	\N	\N	\N	{"UserId":142}	{user}	f	\N	142	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
697	Tamouse Temple	\N	USD	2017-01-18 08:49:53.082-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8e79f1498f3e4a4ab53bec89d5dfc1e5_43f16060-dd85-11e6-bf52-5b99c6274a65.jpeg	tamouse1	http://www.tamouse.org	tamouse	\N	\N	\N	\N	{"UserId":2594}	{user}	f	\N	2594	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
698	Karina	I am web developer, Director WWcode Recife - Brazil	USD	2016-09-29 14:19:11.45-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/a6711e2eef3c42dbaa7b9e658670e44e_65470050-13c0-11e7-8edd-59205a885cb5.jpeg	karinamachado	\N	\N	\N	\N	\N	\N	{"UserId":1344}	{user}	f	\N	1344	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
699	Cameron 🐳✨	\N	USD	2016-12-18 20:41:26.473-05	\N	\N	t	\N	\N	cameron1	\N	\N	\N	\N	\N	\N	{"UserId":2220}	{user}	f	\N	2220	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
700	Amanda Folson	\N	USD	2017-01-16 13:03:53.479-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2150894e-87e2-4dab-8ffa-894342f0336b	ambassadorawsum	http://amandafolson.net/about/#twitter	AmbassadorAwsum	\N	\N	\N	\N	{"UserId":2561}	{user}	f	\N	2561	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
701	Portland Modern Manufacturing Collective	\N	USD	2016-11-22 10:22:35.912-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8cb68090-b0c7-11e6-8d75-191d15208aa9.png	mrlnmarce	http://www.uncorkedstudios.com	mrlnmarce	\N	\N	\N	\N	{"UserId":1846}	{user}	f	\N	1846	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
702	Shirley Hicks	Network director, Women Who Code Birmingham	USD	2016-09-29 13:43:14.052-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7d7b2ba6c0a24e269f7853f4eb9fdced_72776110-b138-11e6-afe2-6129fbf4c498.png	shirleyhicks	\N	\N	\N	\N	\N	\N	{"UserId":1303}	{user}	f	\N	1303	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
703	Nataliia Ilchenko	WWCode Kyiv Director	USD	2017-01-03 19:00:00-05	\N	\N	t	\N	/public/images/users/avatar-04.svg	nataliia	\N	\N	\N	\N	\N	\N	{"UserId":2431}	{user}	f	\N	2431	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
704	Alaina Percival	\N	USD	2016-03-01 23:41:59.905-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/fb1f0fd9-4da7-4c66-847b-0eaaf5fe88e9	alaina	http://womenwhocode.com	alaina	\N	\N	\N	\N	{"UserId":126}	{user}	f	\N	126	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
705	Afia Owusu-Forfie	\N	USD	2016-09-29 13:44:40.419-04	\N	\N	t	\N	\N	afiaowusu-forfie	\N	\N	\N	\N	\N	\N	{"UserId":1304}	{user}	f	\N	1304	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
706	Snehal Patil	\N	USD	2016-09-29 14:41:11.059-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/eea1cd90-adc6-11e6-97ba-67ed1cda3697.png	snehalpatil	\N	\N	\N	\N	\N	\N	{"UserId":1374}	{user}	f	\N	1374	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
707	Wooga	\N	USD	2016-11-29 05:03:21.301-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/24be6ad0-b61b-11e6-9f3b-115a2450f71e.jpg	maikesteinweller	http://www.wooga.com	wooga	\N	\N	\N	\N	{"UserId":1908}	{user}	f	\N	1908	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
708	Rigado	\N	USD	2016-11-17 12:43:26.15-05	\N	\N	t	\N	https://logo.clearbit.com/rigado.com	christinepechette	https://www.rigado.com/	RigadoLLC	\N	\N	\N	\N	{"UserId":1808}	{user}	f	\N	1808	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
709	Kelly Erickson	\N	USD	2017-01-03 15:59:33.995-05	\N	\N	t	\N	\N	kellyerickson	\N	\N	\N	\N	\N	\N	{"UserId":2416}	{user}	f	\N	2416	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
710	Maddy Lau	\N	USD	2016-11-30 11:11:38.749-05	\N	\N	t	\N	https://logo.clearbit.com/nycda.com	maddylau	http://nycda.com	nycodedesign	\N	\N	\N	\N	{"UserId":1957}	{user}	f	\N	1957	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
711	Kristine Paas	\N	USD	2017-05-09 01:59:11.628-04	\N	\N	t	\N	\N	kjcpaas	\N	\N	\N	\N	\N	\N	{"UserId":4711}	{user}	f	\N	4711	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
712	Wei-Juin Lin	\N	USD	2016-10-07 12:49:14.297-04	\N	\N	t	\N	\N	wei-juinlin	\N	\N	\N	\N	\N	\N	{"UserId":1446}	{user}	f	\N	1446	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
713	Hector Torres	\N	USD	2016-10-06 14:36:34.986-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7aOKGnA1_normaljpg_f6ea41c0-8bf3-11e6-8916-b3b1b8ac2e00.jpeg	hectortorres	http://summit.ulahealth.me	ulahealth	\N	\N	\N	\N	{"UserId":1438}	{user}	f	\N	1438	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
714	Britten Kuckelman	\N	USD	2016-09-29 14:32:00.979-04	\N	\N	t	\N	\N	brittenkuckelman	\N	\N	\N	\N	\N	\N	{"UserId":1357}	{user}	f	\N	1357	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
715	Ksenia Barshchyk	\N	USD	2016-09-29 14:30:08.971-04	\N	\N	t	\N	\N	kseniabarshchyk	\N	\N	\N	\N	\N	\N	{"UserId":1354}	{user}	f	\N	1354	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
716	Sarrah Vesselov	\N	USD	2016-09-29 14:28:08.475-04	\N	\N	t	\N	\N	sarrahvesselov	\N	\N	\N	\N	\N	\N	{"UserId":1352}	{user}	f	\N	1352	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
717	Grain	\N	USD	2016-09-20 16:58:49.633-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/grainappio_20c2d740-7f75-11e6-998a-b5046561186d.png	grain_app	https://grainapp.io	grain_app	\N	\N	\N	\N	{"UserId":1244}	{user}	f	\N	1244	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
718	Travis Swicegood	\N	USD	2016-05-19 15:24:40.738-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/03134eb6a2764594808716e5c3f0dc6c_690fce70-1df7-11e6-b09a-bd4f4a904ffe.jpeg	tswicegood	http://www.travisswicegood.com	tswicegood	\N	\N	\N	\N	{"UserId":392}	{user}	f	\N	392	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
719	Dinah Shi	\N	USD	2016-09-29 14:30:54.244-04	\N	\N	t	\N	\N	dinahshi	\N	\N	\N	\N	\N	\N	{"UserId":1356}	{user}	f	\N	1356	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
720	Ria Riaz	\N	USD	2016-09-29 14:28:54.276-04	\N	\N	t	\N	\N	riariaz	\N	\N	\N	\N	\N	\N	{"UserId":1353}	{user}	f	\N	1353	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
721	Kathy Trammell	\N	USD	2016-09-29 14:28:08.47-04	\N	\N	t	\N	\N	kathytrammell	\N	\N	\N	\N	\N	\N	{"UserId":1351}	{user}	f	\N	1351	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
722	Yoka Liu	\N	USD	2016-09-29 14:26:35.139-04	\N	\N	t	\N	\N	yokaliu	\N	\N	\N	\N	\N	\N	{"UserId":1350}	{user}	f	\N	1350	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
727	Ashma Sethi	\N	USD	2016-09-29 14:24:17.802-04	\N	\N	t	\N	\N	ashmasethi	\N	\N	\N	\N	\N	\N	{"UserId":1345}	{user}	f	\N	1345	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
734	Isabel Yepes	\N	USD	2016-09-29 14:13:48.772-04	\N	\N	t	\N	\N	isabelyepes	\N	\N	\N	\N	\N	\N	{"UserId":1337}	{user}	f	\N	1337	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
739	Jane Shih	\N	USD	2016-09-07 18:13:23.624-04	\N	\N	t	\N	\N	janeshih	\N	\N	\N	\N	\N	\N	{"UserId":1145}	{user}	f	\N	1145	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
742	KeSha Shah	\N	USD	2016-09-29 14:06:44.745-04	\N	\N	t	\N	\N	keshashah	\N	\N	\N	\N	\N	\N	{"UserId":1326}	{user}	f	\N	1326	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
748	Radhika Malik	\N	USD	2016-08-02 20:00:00-04	\N	\N	t	\N	\N	radhikam	\N	\N	\N	\N	\N	\N	{"UserId":897}	{user}	f	\N	897	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
755	Rylee	\N	USD	2016-01-29 18:18:13.688-05	\N	\N	t	\N	\N	rylee	\N	\N	\N	\N	\N	\N	{"UserId":68}	{user}	f	\N	68	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
759	Geoff Domoracki	\N	USD	2016-08-03 13:47:13.173-04	\N	\N	t	\N	\N	geoffdomoracki	\N	\N	\N	\N	\N	\N	{"UserId":896}	{user}	f	\N	896	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
762	Eileen C	\N	USD	2017-01-14 12:11:39.224-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7be57fdf74ce40868c36ec561b515b9d_8a6a4900-da7c-11e6-af11-676b2b71a93b.jpeg	eileenc	\N	\N	\N	\N	\N	\N	{"UserId":2549}	{user}	f	\N	2549	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
767	Xinhui Li	\N	USD	2016-09-29 13:53:00.503-04	\N	\N	t	\N	\N	xinhuili	\N	\N	\N	\N	\N	\N	{"UserId":1312}	{user}	f	\N	1312	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
770	Smitha Radhakrishnan	\N	USD	2016-09-29 13:51:29.334-04	\N	\N	t	\N	\N	smitharadhakrishnan	\N	\N	\N	\N	\N	\N	{"UserId":1310}	{user}	f	\N	1310	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
771	Lindsey Barrett	\N	USD	2016-06-22 16:09:43.896-04	\N	\N	t	\N	\N	lindseybarrett	\N	\N	\N	\N	\N	\N	{"UserId":646}	{user}	f	\N	646	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
774	Elizabeth Ferrao	\N	USD	2016-01-29 18:19:22.243-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/0addaf63-25c3-4f61-85bd-9ddec639dbaa	musingmurmurs	\N	MusingMurmurs	\N	\N	\N	\N	{"UserId":72}	{user}	f	\N	72	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
779	Gabriela Adamova	\N	USD	2016-01-29 18:19:43.713-05	\N	\N	t	\N	\N	gabrielaadamova	\N	\N	\N	\N	\N	\N	{"UserId":75}	{user}	f	\N	75	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
785	Lacey Reinoehl	\N	USD	2017-05-01 13:13:32.139-04	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/8207c9a5-55ed-41a7-a238-4ef4d22a6059	laceyreinoehl	\N	\N	\N	\N	\N	\N	{"UserId":4550}	{user}	f	\N	4550	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
789	Lucy Shang	\N	USD	2016-09-29 13:53:00.502-04	\N	\N	t	\N	\N	lucyshang	\N	\N	\N	\N	\N	\N	{"UserId":1311}	{user}	f	\N	1311	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
797	Saranya Karuppusamy	\N	USD	2016-01-11 13:54:33.296-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/35f74ebjpg_d2d1c140-35a4-11e7-8caa-3b6f8e012814.jpeg	saranyawwc	\N	\N	\N	\N	\N	\N	{"UserId":32}	{user}	f	\N	32	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
804	Ana Castro	\N	USD	2016-09-29 14:38:54.934-04	\N	\N	t	\N	\N	anacastro	\N	\N	\N	\N	\N	\N	{"UserId":1368}	{user}	f	\N	1368	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
812	Peggy Kuo	\N	USD	2016-09-29 14:34:59.505-04	\N	\N	t	\N	\N	peggykuo	\N	\N	\N	\N	\N	\N	{"UserId":1364}	{user}	f	\N	1364	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
822	Fernanda	\N	USD	2016-01-11 14:02:41.058-05	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAJzAAAAJGZiYzM3MzEyLTVkYzgtNDg2Mi04Yzg3LWI1NDM0NDhhZjRhNQ.jpg	fsantander	\N	\N	\N	\N	\N	\N	{"UserId":37}	{user}	f	\N	37	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
824	Dev Bootcamp 	\N	USD	2016-04-28 11:01:14.69-04	\N	\N	t	\N	https://logo.clearbit.com/devbootcamp.com	devbootcamp	http://www.devbootcamp.com	devbootcamp 	\N	\N	\N	\N	{"UserId":283}	{user}	f	\N	283	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
831	Jecelyn	\N	USD	2016-09-29 14:10:43.392-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8146ec1d435a48c9a5f9d45600963c05_98566490-0ab0-11e7-85e3-cf8c26b6ca26.jpeg	jecelynyeen	\N	\N	\N	\N	\N	\N	{"UserId":1332}	{user}	f	\N	1332	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
835	Alicia	\N	USD	2016-01-29 18:18:47.287-05	\N	\N	t	\N	\N	alicia	\N	\N	\N	\N	\N	\N	{"UserId":69}	{user}	f	\N	69	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
839	Rackspace	\N	USD	2016-08-01 11:54:10.844-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/rackspacecom_a7d669f0-5800-11e6-a2a8-bb3ee7158535.png	rackspace	https://www.rackspace.com/	rackspace	\N	\N	\N	\N	{"UserId":883}	{user}	f	\N	883	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
844	Jigyasa Grover	\N	USD	2016-03-07 04:50:58.721-05	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483042743/ext_a8caeh.jpg	jigyasagrover	https://www.linkedin.com/in/jigyasagrover	\N	\N	\N	\N	\N	{"UserId":141}	{user}	f	\N	141	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
524	Women Who Code Barcelona	\N	EUR	2017-02-21 15:11:44.714-05	2017-02-21 15:13:31.987-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/barcelona) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebarcelona#support) to support WWCode Barcelona\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodebarcelona	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
723	Qianyi Zheng	\N	USD	2016-09-29 14:26:35.133-04	\N	\N	t	\N	\N	qianyizheng	\N	\N	\N	\N	\N	\N	{"UserId":1349}	{user}	f	\N	1349	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
728	Andreza Leite	\N	USD	2016-09-29 14:19:11.446-04	\N	\N	t	\N	\N	andrezaleite	\N	\N	\N	\N	\N	\N	{"UserId":1343}	{user}	f	\N	1343	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
736	Tiffany Andrews	\N	USD	2016-09-29 14:12:58.852-04	\N	\N	t	\N	\N	tiffanyandrews	\N	\N	\N	\N	\N	\N	{"UserId":1336}	{user}	f	\N	1336	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
746	Casey Gruppioni	\N	USD	2016-08-02 20:00:00-04	\N	\N	t	\N	\N	casey	\N	\N	\N	\N	\N	\N	{"UserId":898}	{user}	f	\N	898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
752	Candice Haddad	\N	USD	2016-09-29 14:02:54.555-04	\N	\N	t	\N	\N	candicehaddad	\N	\N	\N	\N	\N	\N	{"UserId":1321}	{user}	f	\N	1321	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
753	Neha Kaura	\N	USD	2016-09-29 14:01:49.703-04	\N	\N	t	\N	\N	nehakaura	\N	\N	\N	\N	\N	\N	{"UserId":1319}	{user}	f	\N	1319	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
758	Amber Joyner	\N	USD	2016-09-29 14:01:04.636-04	\N	\N	t	\N	\N	amberjoyner	\N	\N	\N	\N	\N	\N	{"UserId":1317}	{user}	f	\N	1317	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
763	beth laing	\N	USD	2016-01-29 18:18:53.83-05	\N	\N	t	\N	\N	beth	\N	\N	\N	\N	\N	\N	{"UserId":70}	{user}	f	\N	70	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
768	Maru Lango	\N	USD	2016-02-02 11:52:02.222-05	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483038929/8vJ-Prbe_imotym.png	marulango	http://maruma.ru	Marulango	\N	\N	\N	\N	{"UserId":80}	{user}	f	\N	80	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
773	Zoe Madden-Wood	\N	USD	2016-01-29 18:19:53.922-05	\N	\N	t	\N	\N	zoemadden-wood	\N	\N	\N	\N	\N	\N	{"UserId":77}	{user}	f	\N	77	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
778	Fanya	\N	USD	2016-01-29 18:20:00.061-05	\N	\N	t	\N	\N	fanya	\N	\N	\N	\N	\N	\N	{"UserId":78}	{user}	f	\N	78	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
783	Judith Agbotse	\N	USD	2016-09-29 13:44:40.429-04	\N	\N	t	\N	\N	judithagbotse	\N	\N	\N	\N	\N	\N	{"UserId":1305}	{user}	f	\N	1305	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
788	Google Fiber	\N	USD	2016-09-13 00:15:01.959-04	\N	\N	t	\N	\N	googlefiber	http://fiber.google.com	googlefiber	\N	\N	\N	\N	{"UserId":1178}	{user}	f	\N	1178	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
791	Sonia Prabhu	\N	USD	2016-09-29 14:41:11.058-04	\N	\N	t	\N	\N	soniaprabhu	\N	\N	\N	\N	\N	\N	{"UserId":1373}	{user}	f	\N	1373	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
794	Radhika Rayadu	\N	USD	2016-09-29 14:41:11.058-04	\N	\N	t	\N	\N	radhikarayadu	\N	\N	\N	\N	\N	\N	{"UserId":1372}	{user}	f	\N	1372	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
798	Cisco	\N	USD	2016-04-29 14:46:16.143-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dAmHQYgjpg_6d4cc930-1130-11e6-9815-b7ee6884387f.jpg	cisco	http://cisco.com	cisco	\N	\N	\N	\N	{"UserId":308}	{user}	f	\N	308	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
801	ericalucaterochapman	\N	USD	2017-02-01 10:16:17.461-05	\N	\N	t	\N	\N	ericalucaterochapman	\N	\N	\N	\N	\N	\N	{"UserId":2898}	{user}	f	\N	2898	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
806	Erica	\N	USD	2016-01-11 13:59:41.948-05	\N	\N	t	\N	https://pbs.twimg.com/profile_images/672467424273395712/m0VtgmYQ.jpg	estanley	\N	\N	\N	\N	\N	\N	{"UserId":35}	{user}	f	\N	35	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
809	Paige Hubbell	\N	USD	2016-03-19 18:11:44.881-04	\N	\N	t	\N	\N	phubbell	\N	\N	\N	\N	\N	\N	{"UserId":170}	{user}	f	\N	170	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
811	Laura Uzcátegui	\N	USD	2016-09-29 14:37:07.337-04	\N	\N	t	\N	\N	laurauzcátegui	\N	\N	\N	\N	\N	\N	{"UserId":1365}	{user}	f	\N	1365	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
818	Aya Nakagawa	\N	USD	2016-09-29 14:33:37.088-04	\N	\N	t	\N	\N	ayanakagawa	\N	\N	\N	\N	\N	\N	{"UserId":1360}	{user}	f	\N	1360	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
821	Marcela Lango	\N	USD	2015-11-19 05:09:51.192-05	\N	\N	t	\N	https://pbs.twimg.com/profile_images/445400536569749504/8vJ-Prbe.png	maru	\N	\N	\N	\N	\N	\N	{"UserId":7}	{user}	f	\N	7	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
826	Caterina Paun	Director, WWCode Portland	USD	2016-03-19 18:11:53.101-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/7446276v3s466_4d6a9940-90b9-11e6-a134-f381d4cd2713.png	cpaun	\N	\N	\N	\N	\N	\N	{"UserId":171}	{user}	f	\N	171	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
829	Anouk Ruhaak	\N	USD	2016-09-29 14:43:49.04-04	\N	\N	t	\N	\N	anoukruhaak	\N	\N	\N	\N	\N	\N	{"UserId":1375}	{user}	f	\N	1375	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
836	Allie Winkelman	\N	USD	2017-04-04 15:51:02.718-04	\N	\N	t	\N	\N	lwinkelman	\N	\N	\N	\N	\N	\N	{"UserId":3999}	{user}	f	\N	3999	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
840	Craft CMS	Content-first. Faceless like Jaqen.	USD	2017-04-20 05:34:08.219-04	\N	\N	t	Craft is a content-first CMS that aims to make life enjoyable for developers and content managers alike. It’s the tool of choice for thousands of [remarkably attractive](https://craftcms.com/community) web professionals around the world.	https://opencollective-production.s3-us-west-1.amazonaws.com/8e9cfe00-25ae-11e7-8c00-677620cd0201.png	craftcms	https://craftcms.com	craftcms	\N	\N	\N	\N	{"UserId":4348}	{user}	f	\N	4348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
847	Holly	\N	USD	2015-12-21 11:34:26.053-05	\N	\N	t	\N	https://media.licdn.com/media/AAEAAQAAAAAAAAUUAAAAJDVjMTAxNGYxLWZhZmUtNDQ4Yi1hMzFjLWIzYmU3MTZjNGYxNA.jpg	ogibson	\N	\N	\N	\N	\N	\N	{"UserId":28}	{user}	f	\N	28	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
724	Roxane Castelein	\N	USD	2016-09-29 14:25:21.969-04	\N	\N	t	\N	\N	roxanecastelein	\N	\N	\N	\N	\N	\N	{"UserId":1348}	{user}	f	\N	1348	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
729	Jennifer Hoover	\N	USD	2016-09-29 14:16:52.099-04	\N	\N	t	\N	\N	jenniferhoover	\N	\N	\N	\N	\N	\N	{"UserId":1341}	{user}	f	\N	1341	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
732	Princy James	\N	USD	2016-09-29 14:14:46.606-04	\N	\N	t	\N	\N	princyjames	\N	\N	\N	\N	\N	\N	{"UserId":1338}	{user}	f	\N	1338	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
737	Pieceofr	\N	USD	2016-09-09 23:42:48.933-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/2c8df290-7709-11e6-a96a-b97f0af14723.jpg	pieceofr	\N	\N	\N	\N	\N	\N	{"UserId":1158}	{user}	f	\N	1158	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
744	Candace Lazarou	\N	USD	2016-09-29 14:05:19.079-04	\N	\N	t	\N	\N	candacelazarou	\N	\N	\N	\N	\N	\N	{"UserId":1324}	{user}	f	\N	1324	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
749	Carole Bennett	\N	USD	2016-09-29 14:03:46.798-04	\N	\N	t	\N	\N	carolebennett	\N	\N	\N	\N	\N	\N	{"UserId":1322}	{user}	f	\N	1322	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
754	Polson & Polson, P.C.	\N	USD	2017-03-09 13:29:51.939-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/9R0XXM9_normalpng_75889240-04f6-11e7-8ab4-9b0a3890c09e.png	nalini	http://www.polsonlawfirm.com/	\N	\N	\N	\N	\N	{"UserId":3442}	{user}	f	\N	3442	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
761	Isabella Oliveira	\N	USD	2016-09-29 13:58:16.63-04	\N	\N	t	\N	\N	isabellaoliveira	\N	\N	\N	\N	\N	\N	{"UserId":1315}	{user}	f	\N	1315	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
766	Sandra	\N	USD	2016-01-11 13:53:43.73-05	\N	\N	t	\N	https://media.licdn.com/media/p/1/000/056/1e1/1c4c4e1.jpg	sandrawwc	\N	\N	\N	\N	\N	\N	{"UserId":31}	{user}	f	\N	31	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
775	Joey Rosenberg	\N	USD	2016-06-21 12:02:52.874-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/IndianVisa_RosenbergJPG_17d93090-37ca-11e6-90ee-0555971b7ddd.JPG	joeycrose	\N	joeycrose	\N	\N	\N	\N	{"UserId":642}	{user}	f	\N	642	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
784	Rose THERESA	\N	USD	2016-01-29 18:19:47.116-05	\N	\N	t	\N	\N	rosetheresa	\N	\N	\N	\N	\N	\N	{"UserId":76}	{user}	f	\N	76	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
790	Irina Muchnik	\N	USD	2016-09-29 14:12:58.838-04	\N	\N	t	\N	\N	irinamuchnik	\N	\N	\N	\N	\N	\N	{"UserId":1335}	{user}	f	\N	1335	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
792	Isaac Potoczny-Jones	\N	USD	2016-09-22 21:07:06.058-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/466bd3a0-812a-11e6-8430-9f6ee94192cb.png	tozny	https://tozny.com	Tozny	\N	\N	\N	\N	{"UserId":1263}	{user}	f	\N	1263	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
793	Glenna Buford	\N	USD	2016-09-29 14:43:49.205-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/8a3d40b0-8fed-11e6-b320-5125b901f984.jpg	glennabuford	\N	\N	\N	\N	\N	\N	{"UserId":1378}	{user}	f	\N	1378	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
800	Aleksandra Gavriloska	\N	USD	2016-09-29 14:43:49.211-04	\N	\N	t	\N	\N	aleksandragavriloska	\N	\N	\N	\N	\N	\N	{"UserId":1379}	{user}	f	\N	1379	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
805	RigUp	\N	USD	2016-03-25 11:11:02.011-04	\N	\N	t	\N	https://a2.mzstatic.com/us/r30/Purple7/v4/23/90/cc/2390cca9-c82f-6700-4f13-f1cb4ca15991/icon350x350.jpeg	rigup	https://www.rigup.com	deepinsand	\N	\N	\N	\N	{"UserId":192}	{user}	f	\N	192	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
810	Jamie Lu	\N	USD	2016-11-28 10:33:11.726-05	\N	\N	t	\N	https://logo.clearbit.com/narrativescience.com	jamielu	http://www.narrativescience.com	\N	\N	\N	\N	\N	{"UserId":1890}	{user}	f	\N	1890	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
813	Emily Heist Moss	\N	USD	2016-02-18 14:54:08.5-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/18b8dbe9-bc4b-4e82-b6db-b41eff9ca2e5	emilyheistmoss	\N	EmilyHeistMoss	\N	\N	\N	\N	{"UserId":108}	{user}	f	\N	108	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
817	Kaylyn	\N	USD	2016-01-11 13:57:18.467-05	\N	\N	t	\N	https://res.cloudinary.com/opencollective/image/upload/v1483039249/i8n9dw-4_vxdyyi.jpg	kgibilterra	\N	\N	\N	\N	\N	\N	{"UserId":33}	{user}	f	\N	33	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
819	Aseem Sood	Cofounder, Open Collective.	USD	2015-11-30 15:20:11.257-05	\N	\N	t	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)	https://opencollective-production.s3-us-west-1.amazonaws.com/jMoeGBOJjpg_d83f6890-a13d-11e6-a8af-411ab4a2c609.jpeg	aseem	\N	AseemSood_	\N	\N	\N	\N	{"UserId":8}	{user}	f	\N	8	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
827	Dayra	\N	USD	2016-01-11 14:01:43.411-05	\N	\N	t	\N	https://media.licdn.com/media/p/6/005/04f/283/2b9ae46.jpg	dchiu	\N	\N	\N	\N	\N	\N	{"UserId":36}	{user}	f	\N	36	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
833	Laura Scholl	\N	USD	2016-09-29 14:32:00.983-04	\N	\N	t	\N	\N	laurascholl	\N	\N	\N	\N	\N	\N	{"UserId":1358}	{user}	f	\N	1358	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
838	Flock: Accelerating Women In Tech	\N	USD	2017-02-09 15:42:02.01-05	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/findmyflockcom_b7503b70-efb0-11e6-bcba-ed56440ee54a.png	kate	http://www.findmyflock.com	FindMyFlock	\N	\N	\N	\N	{"UserId":3053}	{user}	f	\N	3053	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
842	Nikko Patten	\N	USD	2017-04-10 21:09:47.41-04	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2e150bf7-d054-400f-8f23-35dab9acf9c9	nikko	https://twitter.com/NikkoPatten	NikkoPatten	\N	\N	\N	\N	{"UserId":4153}	{user}	f	\N	4153	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
843	Pamela Wood Browne	\N	USD	2016-09-29 14:06:00.962-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f08e3667929b4091bb398793543c458b_3c79dff0-89a8-11e6-b81f-a9802cdb670c.jpeg	pamelawoode-browne	\N	\N	\N	\N	\N	\N	{"UserId":1325}	{user}	f	\N	1325	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
725	Barbara	\N	USD	2016-01-29 18:19:28.648-05	\N	\N	t	\N	\N	barbara	\N	\N	\N	\N	\N	\N	{"UserId":73}	{user}	f	\N	73	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
730	Veronica Cannon	\N	USD	2016-09-29 14:17:47.289-04	\N	\N	t	\N	\N	veronicacannon	\N	\N	\N	\N	\N	\N	{"UserId":1342}	{user}	f	\N	1342	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
731	Emily Reese	\N	USD	2016-09-29 14:16:17.115-04	\N	\N	t	\N	\N	emilyreese	\N	\N	\N	\N	\N	\N	{"UserId":1340}	{user}	f	\N	1340	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
735	Vinita Khandelwal Rathi	\N	USD	2016-09-29 14:11:53.843-04	\N	\N	t	\N	\N	vinitakhandelwalrathi	\N	\N	\N	\N	\N	\N	{"UserId":1334}	{user}	f	\N	1334	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
745	Maira Bejamin	\N	USD	2016-09-29 14:05:19.073-04	\N	\N	t	\N	\N	mairabejamin	\N	\N	\N	\N	\N	\N	{"UserId":1323}	{user}	f	\N	1323	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
756	Marisol Acuna	\N	USD	2016-09-29 14:25:21.95-04	\N	\N	t	\N	\N	marisolacuna	\N	\N	\N	\N	\N	\N	{"UserId":1347}	{user}	f	\N	1347	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
765	Sheree Atcheson	\N	USD	2016-09-29 13:54:53.462-04	\N	\N	t	\N	\N	shereeatcheson	\N	\N	\N	\N	\N	\N	{"UserId":1314}	{user}	f	\N	1314	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
772	Shwetha Lakshman Rao	\N	USD	2016-09-29 13:51:29.333-04	\N	\N	t	\N	\N	shwethalakshmanrao	\N	\N	\N	\N	\N	\N	{"UserId":1309}	{user}	f	\N	1309	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
777	Racha Bella	\N	USD	2016-09-29 13:49:43.061-04	\N	\N	t	\N	\N	rachabella	\N	\N	\N	\N	\N	\N	{"UserId":1308}	{user}	f	\N	1308	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
780	Fatma Djoudjou	\N	USD	2016-09-29 13:49:43.051-04	\N	\N	t	\N	\N	fatmadjoudjou	\N	\N	\N	\N	\N	\N	{"UserId":1307}	{user}	f	\N	1307	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
781	Allison Canestaro	\N	USD	2016-06-06 15:04:33.418-04	\N	\N	t	\N	\N	allisoncanestaro	\N	\N	\N	\N	\N	\N	{"UserId":551}	{user}	f	\N	551	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
782	Silvia Pina	\N	USD	2016-09-29 14:43:49.189-04	\N	\N	t	\N	\N	silviapina	\N	\N	\N	\N	\N	\N	{"UserId":1377}	{user}	f	\N	1377	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
787	Nupur Kapoor	\N	USD	2016-01-29 18:16:09.038-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/572a82f0-a28a-4e61-ba19-a0f09f1e812b	kapoornupur	\N	kapoornupur	\N	\N	\N	\N	{"UserId":67}	{user}	f	\N	67	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
795	data.world Swider	\N	USD	2016-09-28 17:47:14.881-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dataworld_6f037d50-85c5-11e6-9fd7-73dd31eb7c0c.png	gabrielaswider	http://data.world	datadotworld	\N	\N	\N	\N	{"UserId":1299}	{user}	f	\N	1299	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
799	Brian Vinci	\N	USD	2017-05-15 08:07:56.682-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/4fc0a750-3967-11e7-955e-43d656f05f49.jpg	brian1	http://expeditionhacks.com/seattle	expeditionhacks	\N	\N	\N	\N	{"UserId":4834}	{user}	f	\N	4834	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
802	Erika Aguayo	\N	USD	2016-09-29 14:38:54.935-04	\N	\N	t	\N	\N	erikaaguayo	\N	\N	\N	\N	\N	\N	{"UserId":1369}	{user}	f	\N	1369	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
808	The Human Geo Group	\N	USD	2016-04-29 09:51:16.619-04	\N	\N	t	\N	https://logo.clearbit.com/thehumangeo.com	thehumangeo	\N	\N	\N	\N	\N	\N	{"UserId":303}	{user}	f	\N	303	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
814	Lucy Bain	\N	USD	2016-09-29 14:34:59.504-04	\N	\N	t	\N	\N	lucybain	\N	\N	\N	\N	\N	\N	{"UserId":1363}	{user}	f	\N	1363	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
820	Bonsai.io	\N	USD	2016-04-13 12:46:07.217-04	\N	\N	t	\N	https://img.stackshare.io/service/228/c0daef6c2bf692d268e53a799111789c.png	bonsai	https://bonsai.io/	bonsaisearch	\N	\N	\N	\N	{"UserId":224}	{user}	f	\N	224	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
825	Viv Del Rio	\N	USD	2016-09-29 14:38:54.951-04	\N	\N	t	\N	\N	vivdelrio	\N	\N	\N	\N	\N	\N	{"UserId":1370}	{user}	f	\N	1370	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
832	Mami Enomoto	\N	USD	2016-09-29 14:33:37.095-04	\N	\N	t	\N	\N	mamienomoto	\N	\N	\N	\N	\N	\N	{"UserId":1361}	{user}	f	\N	1361	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
834	Karen Farzam	\N	USD	2016-09-29 14:08:19.487-04	\N	\N	t	\N	\N	karenfarzam	\N	\N	\N	\N	\N	\N	{"UserId":1327}	{user}	f	\N	1327	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
837	Sue Sinclair	\N	USD	2017-02-27 19:25:15.503-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c50d2350-ae0b-4347-9e9b-3b51d55fd22d	sue	\N	\N	\N	\N	\N	\N	{"UserId":3301}	{user}	f	\N	3301	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
845	Chantal	\N	USD	2016-01-29 18:19:36.407-05	\N	\N	t	\N	\N	chantal	\N	\N	\N	\N	\N	\N	{"UserId":74}	{user}	f	\N	74	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
726	Shruti Sethi	\N	USD	2016-09-29 14:24:17.81-04	\N	\N	t	\N	\N	shrutisethi	\N	\N	\N	\N	\N	\N	{"UserId":1346}	{user}	f	\N	1346	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
733	Grisel Ancona	\N	USD	2016-09-29 14:15:23.931-04	\N	\N	t	\N	\N	griselancona	\N	\N	\N	\N	\N	\N	{"UserId":1339}	{user}	f	\N	1339	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
738	thirteen23	\N	USD	2016-09-01 10:41:33.243-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/thirteen23com_805f0980-7052-11e6-8e5a-492f532f3a40.png	thirteen23	http://www.thirteen23.com	thirteen23	\N	\N	\N	\N	{"UserId":1094}	{user}	f	\N	1094	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
740	FJ Genus	\N	USD	2016-09-29 14:09:42.794-04	\N	\N	t	\N	\N	fjgenus	\N	\N	\N	\N	\N	\N	{"UserId":1330}	{user}	f	\N	1330	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
741	Ellevest	\N	USD	2016-05-23 16:27:26.092-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/ellevestcom_0882df80-2125-11e6-9a76-e98f5a4a50b6.png	ellevest	http://www.ellevest.com	Ellevest	\N	\N	\N	\N	{"UserId":426}	{user}	f	\N	426	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
743	Shahnaz Kamberi	\N	USD	2016-06-06 20:53:44.829-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/dcacmorg_5f260cb0-2c4a-11e6-80e4-310475aa5f5c.png	dcacm	http://dcacm.org	dcacm	\N	\N	\N	\N	{"UserId":555}	{user}	f	\N	555	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
747	Elijah Van Der Giessen	\N	USD	2017-05-10 19:45:43.307-04	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d7d17c0e-20b0-40ae-a128-eaf85a311f0c	eli	\N	\N	\N	\N	\N	\N	{"UserId":4749}	{user}	f	\N	4749	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
750	New York Code + Design Academy (Austin)	\N	USD	2016-08-01 11:55:23.132-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/rlc8ysokffcsnalr5jav_normalgif_7ff2c640-5800-11e6-a2a8-bb3ee7158535.gif	nycda	http://nycda.com/austin	atxcodedesign	\N	\N	\N	\N	{"UserId":884}	{user}	f	\N	884	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
751	Amber Houle	\N	USD	2016-09-29 14:02:54.546-04	\N	\N	t	\N	\N	amberhoule	\N	\N	\N	\N	\N	\N	{"UserId":1320}	{user}	f	\N	1320	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
757	Sally Kingston	\N	USD	2016-09-29 14:01:04.636-04	\N	\N	t	\N	\N	sallykingston	\N	\N	\N	\N	\N	\N	{"UserId":1318}	{user}	f	\N	1318	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
760	Mia Zhu	\N	USD	2016-09-29 13:59:15.428-04	\N	\N	t	\N	\N	miazhu	\N	\N	\N	\N	\N	\N	{"UserId":1316}	{user}	f	\N	1316	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
764	Gillian Colan-O'Leary	\N	USD	2016-09-29 13:54:53.45-04	\N	\N	t	\N	\N	gilliancolan-o'leary	\N	\N	\N	\N	\N	\N	{"UserId":1313}	{user}	f	\N	1313	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
769	Oksana Denesiuk	\N	USD	2016-09-29 14:30:08.978-04	\N	\N	t	\N	\N	oksanadenesiuk	\N	\N	\N	\N	\N	\N	{"UserId":1355}	{user}	f	\N	1355	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
776	Christina Lynch	\N	USD	2016-09-29 14:37:07.344-04	\N	\N	t	\N	\N	christinalynch	\N	\N	\N	\N	\N	\N	{"UserId":1367}	{user}	f	\N	1367	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
786	Carola Nitz	\N	USD	2016-09-29 14:43:49.157-04	\N	\N	t	\N	\N	carolanitz	\N	\N	\N	\N	\N	\N	{"UserId":1376}	{user}	f	\N	1376	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
796	Guiti Nabavi	\N	USD	2016-09-29 14:41:11.052-04	\N	\N	t	\N	\N	guitinabavi	\N	\N	\N	\N	\N	\N	{"UserId":1371}	{user}	f	\N	1371	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
803	pkmass	\N	USD	2016-07-01 18:31:42.541-04	\N	\N	t	\N	\N	pkmass	\N	\N	\N	\N	\N	\N	{"UserId":686}	{user}	f	\N	686	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
807	Vicky Twomey-Lee	\N	USD	2016-09-29 14:37:07.344-04	\N	\N	t	\N	\N	vickytwomey-lee	\N	\N	\N	\N	\N	\N	{"UserId":1366}	{user}	f	\N	1366	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
815	Daphne Chong	\N	USD	2016-09-29 14:34:59.499-04	\N	\N	t	\N	\N	daphnechong	\N	\N	\N	\N	\N	\N	{"UserId":1362}	{user}	f	\N	1362	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
816	Brenda	\N	USD	2016-01-29 18:19:12.899-05	\N	\N	t	\N	\N	brenda	\N	\N	\N	\N	\N	\N	{"UserId":71}	{user}	f	\N	71	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
823	Kelly	\N	USD	2016-01-11 13:58:47.796-05	\N	\N	t	\N	https://pbs.twimg.com/profile_images/523157919999602688/00l1ZQIf.jpeg	kshuster	\N	\N	\N	\N	\N	\N	{"UserId":34}	{user}	f	\N	34	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
828	Himi Sato	\N	USD	2016-09-29 14:33:37.087-04	\N	\N	t	\N	\N	himisato	\N	\N	\N	\N	\N	\N	{"UserId":1359}	{user}	f	\N	1359	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
830	Gen Ashley	Director, Women Who Code London	USD	2016-09-29 14:11:53.842-04	\N	\N	t	\N	https://opencollective-production.s3-us-west-1.amazonaws.com/f739ff80-86fd-11e6-9561-f9be8e5da60b.jpeg	genashley	\N	\N	\N	\N	\N	\N	{"UserId":1333}	{user}	f	\N	1333	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
841	Erin Spiceland	\N	USD	2017-03-07 14:01:52.704-05	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/4dedad77-5def-4d84-8e72-47bf0051649c	erin	\N	\N	\N	\N	\N	\N	{"UserId":3419}	{user}	f	\N	3419	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
846	Nicole Giannone	\N	USD	2017-05-09 14:14:19.572-04	\N	\N	t	\N	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/5bd8eb7d-65e2-482e-b9dd-ff7f33bf804b	nicole1	\N	\N	\N	\N	\N	\N	{"UserId":4720}	{user}	f	\N	4720	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
2	WWCode Austin	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 19:14:54.028-05	2016-12-23 10:30:21.805-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Austin**](https://www.womenwhocode.com/austin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaustin#support) to support WWCode Austin \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/mX6wUEonFH.png	wwcodeaustin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
298	WWCode Dublin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 14:37:07.255-04	2016-12-27 11:33:19.532-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dublin**](https://www.womenwhocode.com/wwcode-dublin). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedublin#support) to support WWCode Dublin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/70bbbe00-9ba5-11e6-84fe-5d5e57220970.png	wwcodedublin	\N	wwcodedublin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
260	WWCode Accra	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 13:44:40.394-04	2016-12-23 10:39:43.815-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Accra**](https://www.womenwhocode.com/accra). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaccra#support) to support WWCode Accra\n\nQuestions? Email us at global@womenwhocode.com.  	https://opencollective-production.s3-us-west-1.amazonaws.com/c4810040-8a89-11e6-9ae7-452ac38279da.png	wwcodeaccra	\N	wwcodeaccra	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
299	WWCode Colima	WWCode is a global non-profit organization that inspires women to excel in technology careers.	MXN	2016-09-29 14:38:52.23-04	2016-12-27 11:09:39.74-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Colima**](https://www.womenwhocode.com/colima). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecolima#support) to support WWCode Colima \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a02c3dc0-9ba2-11e6-84fe-5d5e57220970.png	wwcodecolima	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
513	Women Who Code Fort Collins	\N	USD	2017-02-21 13:35:34.492-05	2017-02-21 13:37:34.054-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/fortcollins) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodefortcollins#support) to support WWCode Fort Collins \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodefortcollins	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
520	Women Who Code San Diego	\N	USD	2017-02-21 14:34:46.927-05	2017-02-21 14:36:23.416-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sandiego) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesandiego#support) to support WWCode San Diego\n\nQuestions? Email us at global@womenwhocode.com.\n\n\n\n	\N	wwcodesandiego	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
848	MakerSquare	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":129}	\N	f	\N	129	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
849	thirteen23	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":1094}	\N	f	\N	1094	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
850	New York Code + Design Academy (Austin)	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":884}	\N	f	\N	884	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
851	Cisco	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":308}	\N	f	\N	308	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
852	RigUp	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":192}	\N	f	\N	192	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
853	The Human Geo Group	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":303}	\N	f	\N	303	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
854	Bonsai.io	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":224}	\N	f	\N	224	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
855	Dev Bootcamp 	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":283}	\N	f	\N	283	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
856	Rackspace	\N	USD	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"UserId":883}	\N	f	\N	883	\N	\N	USER	\N	\N	\N	\N	\N	\N	\N	\N
280	WWCode Medellín 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:13:48.754-04	2016-12-27 12:47:24.671-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Medellin**](https://www.womenwhocode.com/medellin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Medellin \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/85a55000-cc5c-11e6-be07-3dfc36c6d12c.png	wwcodemedellin	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
857	Women Who Code org	WWCode is a global non-profit organization dedicated 	USD	2015-10-31 20:00:00-04	2017-05-22 15:33:15.968-04	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	wwcode Org	http://womenwhocode.com	wwcode	We are on a mission to inspire women to excel in tech careers.	\N	10	\N	{"UserId":3}	\N	f	3	3	\N	\N	ORGANIZATION	\N	\N	\N	\N	\N	\N	\N	\N
286	WWCode Recife	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:19:11.423-04	2016-12-27 13:40:34.452-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Recife**](https://www.womenwhocode.com/recife). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderecife#support) to support WWCode Recife \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc234080-9d47-11e6-9116-db595ff259df.png	wwcoderecife	\N	WWCode_Recife	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
519	Women Who Code Cleveland	\N	USD	2017-02-21 14:25:28.662-05	2017-02-21 14:28:23.116-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform)\n\n[**Attend**](https://www.womenwhocode.com/cleveland) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecleveland#support) to support WWCode Cleveland \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodecleveland	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
517	Women Who Code Manila	\N	USD	2017-02-21 14:07:25.163-05	2017-02-21 14:09:27.391-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reWWCode is a non-profit organization that inspires women to excel in technology careers.\nach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a member\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/manila) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemanila#support) to support WWCode Manila \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodemanila	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
511	Women Who Code Monterrey	\N	MXN	2017-02-21 11:55:29.596-05	2017-02-21 12:26:29.52-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/monterrey) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemonterrey#support) to support WWCode Boston \n\n\n\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/d32e97d0-f85a-11e6-aebb-a9d659d01ec2.png	wwcodemonterrey	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3206	3206	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
4	WWCode San Francisco	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 19:14:54.028-05	2016-12-27 14:54:09.597-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in San Francisco**](https://www.womenwhocode.com/sf). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesf#support) to support WWCode San Francisco\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/6kFcX-6H5l.png	wwcodesf	http://www.meetup.com/Women-Who-Code-SF	wwcodesf	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
293	WWCode Waterloo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 14:30:54.225-04	2016-12-28 11:29:14.91-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Waterloo**](https://www.womenwhocode.com/waterloo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewaterloo#support) to support WWCode Waterloo\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/485e6710-a6d5-11e6-bdef-45bfa9f9c1b0.png	wwcodewaterloo	\N	womenwhocodekw	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
272	WWCode East Bay	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:05:19.056-04	2016-12-27 11:38:30.14-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Oakland/East Bay**](https://www.womenwhocode.com/east-bay). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeeastbay#support) to support WWCode Oakland/East Bay \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/d9a7fc70-9c5f-11e6-84fe-5d5e57220970.png	wwcodeeastbay	\N	wwcode_eastbay	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
277	WWCode Kuala Lumpur	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:10:43.356-04	2016-12-27 12:02:13.485-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kuala Lumpur**](https://www.womenwhocode.com/kl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekualalumpur#support) to support WWCode Kuala Lumpur\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/35b70760-cc56-11e6-be07-3dfc36c6d12c.png	wwcodekualalumpur	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
241	WWCode Taipei	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-07 18:13:23.305-04	2016-12-28 10:57:33.798-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Taipei**](https://www.womenwhocode.com/taipei). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetaipei#support) to support WWCode Taipei \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/lGiwq5JAPy.png	wwcodetaipei	\N	wwcodetaipei	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
301	WWCode Berlin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 14:43:48.834-04	2016-12-23 12:11:29.559-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Berlin**](https://www.womenwhocode.com/berlin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeberlin#support) to support WWCode Berlin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/81940c10-8fd8-11e6-b320-5125b901f984.png	wwcodeberlin	\N	wwcodeberlin	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
297	WWCode Sydney	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 14:34:59.472-04	2016-12-28 10:55:06.005-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sydney**](https://www.womenwhocode.com/sydney-australia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesydney#support) to support WWCode Sydney \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/405f1180-a514-11e6-b4fe-6966ef500b6b.png	wwcodesydney	\N	wwcsyd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
259	WWCode Birmingham	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 13:43:14.021-04	2016-12-23 12:19:36.878-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Birmingham**](https://www.womenwhocode.com/birmingham). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebirmingham#support) to WWCode Birmingham financially by making a donation below\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f9d834f0-c933-11e6-9af0-47fca5e686db.png	wwcodebirmingham	\N	wwcbirmingham	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
12	Women Who Code Atlanta	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 19:00:00-05	2016-12-23 11:56:56.09-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Atlanta**](https://www.womenwhocode.com/atl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeatl#support) to support WWCode Atlanta\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/NzLkW4RcED.png	wwcodeatl	\N	wwcodeatl	We are on a mission to inspire women to excel in tech careers.	\N	25	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
521	Women Who Code Raleigh Durham	\N	USD	2017-02-21 14:39:46.205-05	2017-02-21 14:41:19.26-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/raleigh) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderaleigh#support) to support WWCode Raleigh Durham \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcoderaleigh	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
278	WWCode London	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 14:11:53.804-04	2016-12-27 12:29:43.796-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in London**](https://www.womenwhocode.com/london). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelondon#support) WWCode London \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/8df462c0-9091-11e6-a134-f381d4cd2713.png	wwcodelondon	\N	wwclondon	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
281	WWCode Melbourne	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 14:14:46.59-04	2016-12-27 12:51:32.497-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Melbourne**](https://www.womenwhocode.com/melbourne). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemelbourne#support) to support WWCode Melbourne\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/19756e50-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemelbourne	\N	WWCodeMelbourne	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
270	WWCode Chicago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:02:54.513-04	2016-12-23 14:48:12.132-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chicago**](https://www.womenwhocode.com/chicago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechicago#support) to support WWCode Chicago \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/aef68840-9b9a-11e6-b592-e7f426067276.png	wwcodechicago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
268	WWCode Charleston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:01:04.477-04	2016-12-23 14:37:13.42-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Charleston**](https://www.womenwhocode.com/charleston). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecharleston#support) to support WWCode Charleston\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a185ed40-9b95-11e6-b592-e7f426067276.png	wwcodecharleston	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
291	WWCode Toronto	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 14:28:54.255-04	2016-12-28 11:20:52.347-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Toronto**](https://www.womenwhocode.com/toronto). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Global**](https://opencollective.com/wwcodetoronto#support) to support WWCode Toronto \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/6dbdcea0-a519-11e6-b4fe-6966ef500b6b.png	wwcodetoronto	\N	womenwhocodeto	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
13	WWCode Washington DC	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 19:00:00-05	2016-12-27 11:21:52.463-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Washington D.C.**](https://www.womenwhocode.com/dc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedc#support) to support WWCode Washington D.C. \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/rhyrbLvkli.png	wwcodedc	https://www.womenwhocode.com/dc	wwcodedc	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
47	WWCode Delhi	WWCode inspires women to excel in technology careers.	USD	2016-03-06 19:00:00-05	2016-12-27 11:24:21.89-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Delhi**](https://www.womenwhocode.com/delhi). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedelhi#support) to support WWCode Delhi \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/MFUk1nU_IQ.png	wwcodedelhi	https://www.womenwhocode.com/dc	wwcode_delhi	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
292	WWCode Vinnytsia	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:30:08.953-04	2016-12-28 11:27:20.161-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Vinnytsia**](https://www.womenwhocode.com/vinnytsia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevinnytsia#support) to support WWCode Vinnytsia \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fcac9e50-a51b-11e6-b4fe-6966ef500b6b.png	wwcodevinnytsia	\N	WWCodeVinnytsia	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
290	WWCode Tampa	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:28:08.446-04	2016-11-07 13:27:01.762-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tampa**](https://www.womenwhocode.com/tampa). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcodetampa#support) WWCode Tampa financially by making a donation below\n\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\n\nQuestions? Email us at contact@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/638dcdc0-a516-11e6-b4fe-6966ef500b6b.png	wwcodetampa	\N	wwcodetampa	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
295	WWCode Tokyo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:33:36.887-04	2016-12-28 11:00:36.071-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tokyo**](https://www.womenwhocode.com/tokyo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetokyo#support) to support WWCode Tokyo \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/bf15e4a0-a518-11e6-b4fe-6966ef500b6b.png	wwcodetokyo	\N	wwcode_tokyo	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
522	Women Who Code Vancouver	\N	CAD	2017-02-21 14:45:19.101-05	2017-02-21 14:48:46.905-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/vancouver) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevancouver#support) to support WWCode Vancouver \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodevancouver	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
294	WWCode Wichita	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:32:00.962-04	2016-12-28 11:31:16.784-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Wichita**](https://www.womenwhocode.com/wichita). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewichita#support) to support WWCode Wichita \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/6cae1920-a6d6-11e6-bdef-45bfa9f9c1b0.png	wwcodewichita	\N	wwcodewichita	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
512	Women Who Code Cincinnati	\N	USD	2017-02-21 13:11:30.741-05	2017-02-21 13:14:42.695-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Attend**](https://www.womenwhocode.com/cincinnati) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecincinnati#support) to support WWCode Cincinnati \n\nQuestions? Email us at global@womenwhocode.com.\n\n\n	\N	wwcodecincinnati	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
430	WWCode Kyiv	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2017-01-03 19:00:00-05	2017-01-04 14:36:29.052-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kyiv**](https://www.womenwhocode.com/kyiv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekyiv#support) to support WWCode Kyiv \n\nQuestions? Email us at global@womenwhocode.com.  \n	\N	wwcodekyiv	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
262	WWCode Bangalore	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 13:51:29.29-04	2016-12-23 11:55:34.516-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bangalore**](https://www.womenwhocode.com/bangalore). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebangalore#support) to support WWCode Bangalore\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fe02eee0-961a-11e6-a6e9-23ce753be86b.png	wwcodebangalore	\N	wwcodebangalore	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
15	WWCode Boulder/Denver	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 19:00:00-05	2016-12-27 11:29:26.21-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boulder/Denver**](https://www.womenwhocode.com/boulder). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebd#support) to support WWCode Boulder/Denver \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/OSosQI7_aV.png	wwcodebd	\N	wwcodebd	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	\N	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
282	WWCode Merida	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:15:23.91-04	2016-12-27 12:55:44.4-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Merida**](https://www.womenwhocode.com/merida). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemerida#support) to support WWCode Merida \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/af808880-cc5d-11e6-be07-3dfc36c6d12c.png	wwcodemerida	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
265	WWCode Belo Horizonte	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 13:58:16.617-04	2016-12-23 12:07:51.328-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belo Horizonte**](https://www.womenwhocode.com/belo-horizonte). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelohorizonte#support) to support WWCode Belo Horizonte \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	\N	wwcodebelohorizonte	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
288	WWCode Santiago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:25:21.912-04	2016-12-27 14:48:06.766-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Santiago**](https://www.womenwhocode.com/santiago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesantiago#support) to support WWCode Santiago \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/595593e0-a2c0-11e6-b669-1f602f2f2eec.png	wwcodesantiago	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
287	WWCode Sacramento 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:24:17.771-04	2016-12-27 14:44:07.667-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sacramento**](https://www.womenwhocode.com/sacramento). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesacramento#support) to support WWCode Sacramento \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dca653c0-a2bf-11e6-b669-1f602f2f2eec.png	wwcodesacramento	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
279	WWCode Los Angeles	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:12:58.808-04	2016-12-27 12:24:20.031-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Los Angeles**](https://www.womenwhocode.com/la). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelosangeles#support) WWCode Los Angeles \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f55b4680-9097-11e6-a134-f381d4cd2713.png	wwcodelosangeles	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
274	WWCode Gujarat	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:06:44.732-04	2016-12-27 11:50:50.189-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Gujarat**](https://www.womenwhocode.com/gujarat). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegujarat#support) to support WWCode Gujarat\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/52506d70-9c78-11e6-a3da-b7d8fa4b13cd.png	wwcodegujarat	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
289	WWCode Shanghai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:26:35.114-04	2016-12-28 10:51:25.097-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Shanghai**](https://www.womenwhocode.com/shanghai). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeshanghai#support) to support WWCode Shanghai\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/7be08da0-cd15-11e6-a033-c553d2fe46df.png	wwcodeshanghai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
264	WWCode Belfast	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 13:54:53.422-04	2016-12-23 12:01:33.569-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belfast**](https://www.womenwhocode.com/belfast). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelfast#support) to support WWCode Belfast\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/e1bb8200-96e8-11e6-baa3-69f47ab52eed.png	wwcodebelfast	\N	WWCBelfast	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
269	WWCode Chennai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:01:49.683-04	2016-12-23 14:40:22.493-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chennai**](https://www.womenwhocode.com/chennai). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechennai#support) to WWCode Chennai \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/f50c62b0-9b99-11e6-b592-e7f426067276.png	wwcodechennai	\N	\N	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
276	WWCode Kingston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 14:09:42.765-04	2016-12-27 11:58:14.247-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kingston**](https://www.womenwhocode.com/kingston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Kingston \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/a7236520-cc55-11e6-be07-3dfc36c6d12c.png	wwcodekingston	\N	wwcodekingston	We are on a mission to inspire women to excel in tech careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
518	Women Who Code Singapore	\N	USD	2017-02-21 14:13:03.341-05	2017-02-21 14:19:36.571-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/singapore) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesingapore#support) to support WWCode Singapore\n\nQuestions? Email us at global@womenwhocode.com.\n	\N	wwcodesingapore	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
516	Women Who Code Huntsville	\N	USD	2017-02-21 14:02:21.542-05	2017-02-21 14:05:00.852-05	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	wwcodehuntsville	\N	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	10	{"lang":"wwcode"}	{}	{wwcode,meetup,"diversity in tech"}	f	3	3	857	51	COLLECTIVE	\N	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                          4005.dat                                                                                            0000600 0004000 0002000 00000000751 13174666341 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	github	piamancini	*****	*****	\N	2016-05-23 13:23:51.553-04	2016-05-23 13:24:25.036-04	\N	30	\N	\N
3	github	asood123	*****	*****	\N	2016-05-23 13:14:54.648-04	2016-08-13 07:56:21.771-04	\N	8	\N	\N
4	github	xdamman	*****	*****	\N	2016-05-23 13:19:57.6-04	2017-05-03 10:31:33.249-04	\N	2	\N	\N
1026	stripe	acct_xxxxxxxxxxxxxxxx	\N	sk_test_Hcsz2JJdMzEsU2xxxxxxxxxx	{"publishableKey":"pk_test_OSQ8IaRSyLe9FVxxxxxxxxxx"}	2017-10-27 13:29:04.564-04	2017-10-27 13:29:04.564-04	\N	\N	51	\N
\.


                       4009.dat                                                                                            0000600 0004000 0002000 00000000005 13174666341 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4011.dat                                                                                            0000600 0004000 0002000 00000131127 13174666341 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        737	171	59	USD	2439	Event supplies for Leads	\N	******	Leadership Supplies	\N	3	PAID	2017-01-20 15:05:09.337-05	2017-01-21 15:30:22.616-05	2017-02-07 13:38:15.924-05	\N	paypal
57	28	2	USD	15316	Mar 7 Lightning Talks	\N	******	Lightning Talks	\N	3	PAID	2016-03-20 14:06:09.887-04	2016-03-20 14:06:09.887-04	2017-03-14 13:21:29.439-04	\N	paypal
887	3	282	MXN	50616	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 16:54:10.307-05	2017-03-07 08:02:11.16-05	2017-03-14 14:17:52.017-04	\N	manual
907	70	12	USD	20000	payment to artists (spoken word) for performance at IWD event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-11 19:06:03.02-05	2017-03-12 14:10:39.133-04	2017-03-27 08:47:26.687-04	\N	paypal
101	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-26 23:56:08.086-04	2016-04-26 23:56:08.086-04	2016-06-14 14:14:21.062-04	\N	manual
653	3	284	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 13:13:06.365-05	2016-12-27 13:34:55.519-05	2016-12-27 13:35:08.976-05	\N	manual
650	3	282	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:56:16.269-05	2016-12-27 12:57:29.639-05	2016-12-27 12:57:54.703-05	\N	manual
648	3	280	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:48:20.364-05	2016-12-27 12:49:26.92-05	2016-12-27 12:49:40.165-05	\N	manual
649	3	281	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:52:26.758-05	2016-12-27 12:53:15.394-05	2016-12-27 12:54:01.244-05	\N	manual
652	3	283	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 13:10:37.485-05	2016-12-27 13:11:36.927-05	2016-12-27 13:11:52.22-05	\N	manual
651	3	10	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:58:18.741-05	2016-12-27 13:00:31.933-05	2016-12-27 13:01:07.996-05	\N	manual
654	3	59	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 13:35:56.094-05	2016-12-27 13:38:25.72-05	2016-12-27 13:38:47.561-05	\N	manual
655	3	287	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 14:33:09.199-05	2016-12-27 14:46:38.03-05	2016-12-27 14:46:51.448-05	\N	manual
656	3	288	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 14:47:27.946-05	2016-12-27 14:49:57.05-05	2016-12-27 14:50:17.29-05	\N	manual
657	3	14	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 14:51:59.27-05	2016-12-27 14:52:56.386-05	2016-12-27 14:53:07.813-05	\N	manual
658	3	4	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 14:53:23.261-05	2016-12-27 14:55:42.961-05	2016-12-28 10:44:45.209-05	\N	manual
659	3	300	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 10:46:39.253-05	2016-12-28 10:49:03.856-05	2016-12-28 10:49:16.715-05	\N	manual
660	3	289	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 10:51:51.23-05	2016-12-28 10:52:34.697-05	2016-12-28 10:53:06.333-05	\N	manual
661	3	297	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 10:54:27.49-05	2016-12-28 10:56:08.504-05	2016-12-28 10:56:29.497-05	\N	manual
662	3	241	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 10:56:55.397-05	2016-12-28 10:58:20.587-05	2016-12-28 10:58:50.601-05	\N	manual
663	3	291	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 11:20:10.433-05	2016-12-28 11:21:39.298-05	2016-12-28 11:21:52.881-05	\N	manual
664	3	48	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 11:24:24.058-05	2016-12-28 11:25:18.14-05	2016-12-28 11:25:49.763-05	\N	manual
665	3	292	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 11:26:41.188-05	2016-12-28 11:28:01.61-05	2016-12-28 11:28:16.458-05	\N	manual
736	171	59	USD	4431	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	\N	******	Other	\N	3	PAID	2017-01-20 15:05:09.337-05	2017-01-21 15:28:40.38-05	2017-02-07 13:40:28.327-05	\N	paypal
790	171	59	USD	9050	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	\N	******	Leadership Development	\N	3	PAID	2017-02-01 17:40:18.153-05	2017-02-01 18:46:50.968-05	2017-02-07 13:40:50.169-05	\N	paypal
80	3	59	USD	10000	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-12 14:52:16.188-04	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.052-04	\N	manual
86	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-15 13:29:50.291-04	2016-04-15 13:29:50.291-04	2016-06-14 14:14:21.055-04	\N	manual
195	3	48	USD	3418	FedEx Office	\N	\N	Leadership Supplies	\N	3	PAID	2016-01-24 19:00:00-05	2016-01-24 19:00:00-05	2016-06-14 14:14:21.118-04	\N	manual
888	69	12	USD	54783	Plaques for IWD awards ceremony​ 	\N	******	Other WWCode Event	\N	3	PAID	2017-03-06 16:54:10.307-05	2017-03-07 10:45:43.298-05	2017-03-15 09:57:14.51-04	\N	paypal
814	142	48	USD	25700	Movie screening for "She Started It"	\N	******	Other WWCode Event	\N	3	PAID	2017-02-09 21:26:00.889-05	2017-02-10 19:22:48.586-05	2017-03-14 13:59:53.192-04	\N	paypal
74	3	14	USD	11815	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	\N	\N	Conference	\N	3	PAID	2016-04-05 15:44:01.338-04	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.046-04	\N	manual
190	3	48	USD	20000	Conference Grant - Sarah Olson	\N	\N	Scholarship	\N	3	PAID	2016-05-25 12:39:09.882-04	2016-05-25 12:39:09.882-04	2016-06-14 14:14:21.116-04	\N	manual
75	3	59	USD	6500	Reimburse Caterina for travel expenses to CONNECT 2016	\N	\N	Scholarship	\N	3	PAID	2016-04-05 15:44:01.338-04	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.047-04	\N	manual
82	3	4	USD	163	Meetup Transaction Fee	\N	\N	Transaction Fees	\N	3	REJECTED	2016-04-12 14:52:16.188-04	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.052-04	\N	manual
97	3	13	USD	100	Global Developement	\N	\N	Global Development	\N	3	REJECTED	2016-04-17 18:19:12.094-04	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.06-04	\N	manual
156	3	48	USD	110000	Conference Grant - Sarah Olson	Conference Grant - Airfare/Board	\N	Scholarship	\N	3	PAID	2016-05-10 15:19:21.785-04	2016-05-10 15:19:21.785-04	2016-06-14 14:14:21.099-04	\N	manual
95	3	13	USD	125	WePay fee	Jasna	\N	Transaction Fees	\N	3	PAID	2016-04-17 18:19:12.094-04	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.06-04	\N	manual
189	3	3	USD	100000	Conference Grant	Google Event - Elizabeth	\N	Scholarship	\N	3	PAID	2016-05-24 15:42:50.307-04	2016-05-24 15:42:50.307-04	2016-06-14 14:14:21.116-04	\N	manual
175	3	12	USD	120000	Conference Grant	Alicia V Carr - Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 15:07:13.723-04	2016-05-19 15:07:13.723-04	2016-06-14 14:14:21.109-04	\N	manual
136	68	15	USD	1115	Mile High Agile outreach- supplies	\N	\N	Leadership Supplies	\N	68	PAID	2016-04-02 20:00:00-04	2016-04-02 20:00:00-04	2016-06-14 14:14:21.091-04	\N	paypal
194	3	48	USD	12700	A Small Orange	\N	\N	Other WWCode Event	\N	3	PAID	2016-02-01 19:00:00-05	2016-02-01 19:00:00-05	2016-06-14 14:14:21.119-04	\N	manual
774	31	14	USD	6100	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	\N	******	Other	\N	3	PAID	2017-01-28 09:06:40.223-05	2017-01-28 18:49:43.515-05	2017-02-22 10:27:02.688-05	\N	paypal
889	3419	516	USD	14630	Stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-03-06 16:54:10.307-05	2017-03-07 14:01:52.82-05	2017-04-07 08:58:45.571-04	\N	paypal
815	142	48	USD	33412	Wearable Clothing Workshop	\N	******	Workshop	\N	3	PAID	2017-02-09 21:26:00.889-05	2017-02-10 19:23:45.137-05	2017-03-14 14:00:11.49-04	\N	paypal
198	3	13	USD	80000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-31 13:47:01.276-04	2016-05-31 13:47:01.276-04	2016-06-14 14:14:21.121-04	\N	manual
218	31	14	USD	5161	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	\N	\N	Leadership Development	\N	3	PAID	2016-06-06 20:21:31.531-04	2016-06-06 20:21:31.531-04	2016-06-14 14:14:21.131-04	\N	paypal
79	3	4	USD	150	Global Developement	\N	\N	Global Development	\N	3	PAID	2016-04-12 14:46:49.263-04	2016-04-12 14:46:49.263-04	2016-06-14 14:14:21.05-04	\N	manual
99	3	14	USD	2452	CONNECT 2016	Reimbursement for Sara Adineh	\N	Conference	\N	3	PAID	2016-04-25 20:00:00-04	2016-04-25 20:00:00-04	2016-06-14 14:14:21.061-04	\N	manual
104	3	48	USD	400	WePay Fee	For Andrea and Leslie donation 	\N	Transaction Fees	\N	3	PAID	2016-04-10 20:00:00-04	2016-04-10 20:00:00-04	2016-06-14 14:14:21.064-04	\N	manual
92	3	15	USD	2322	Stacey Schipper Reimbursement	April 6, 2016 Expense	\N	Other WWCode Event	\N	3	REJECTED	2016-04-17 18:19:12.094-04	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.058-04	\N	paypal
164	3	10	MXN	50000	Conference Grant	Conference Grant - Elsa Balderrama	\N	Scholarship	\N	3	PAID	2016-05-16 10:49:37.27-04	2016-05-16 10:49:37.27-04	2016-06-14 14:14:21.102-04	\N	manual
188	3	13	USD	15000	Conference Grant	Grant to Udisha 	\N	Scholarship	\N	3	PAID	2016-05-24 15:42:50.307-04	2016-05-24 15:42:50.307-04	2016-06-14 14:14:21.115-04	\N	manual
193	3	48	USD	65000	Photographer: Mike Ross	 	\N	Conference	\N	3	PAID	2016-01-05 19:00:00-05	2016-01-05 19:00:00-05	2016-06-14 14:14:21.118-04	\N	manual
224	3	59	USD	9995	Reimburse Caterina Paun for Program Expenses	Gift cards and thank you notes for workshop presenters	\N	Other WWCode Event	\N	3	PAID	2016-02-24 19:00:00-05	2016-02-24 19:00:00-05	2016-06-14 14:14:21.134-04	\N	manual
81	3	4	USD	163	Meetup Donation Transaction Fee	\N	\N	Transaction Fees	\N	3	PAID	2016-04-12 14:52:16.188-04	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.051-04	\N	manual
96	3	48	USD	250	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 18:19:12.094-04	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.06-04	\N	manual
225	3	59	USD	5504	Reimburse Caterina Paun for supplies and mailing expenses	\N	\N	Leadership Supplies	\N	3	PAID	2015-12-14 19:00:00-05	2015-12-14 19:00:00-05	2016-06-14 14:14:21.135-04	\N	manual
196	3	59	USD	50000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-10 20:00:00-04	2016-05-10 20:00:00-04	2016-06-14 14:14:21.12-04	\N	manual
775	31	14	USD	5458	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	\N	******	Other	\N	3	PAID	2017-01-28 09:06:40.223-05	2017-01-28 18:56:09.32-05	2017-02-22 10:27:45.559-05	\N	paypal
103	3	48	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-27 12:21:00.228-04	2016-04-27 12:21:00.228-04	2016-06-14 14:14:21.063-04	\N	manual
145	3	13	USD	50000	Conference Grant	Conference Grant: Udisha	\N	Scholarship	\N	3	PAID	2016-05-04 17:14:39.136-04	2016-05-04 17:14:39.136-04	2016-06-14 14:14:21.094-04	\N	manual
227	3	59	USD	5000	Global Development	Nike Donation	\N	Global Development	\N	3	PAID	2016-02-21 19:00:00-05	2016-02-21 19:00:00-05	2016-06-14 14:14:21.135-04	\N	manual
76	3	59	USD	3798	Reimburse Caterina for program materials	\N	\N	Other WWCode Event	\N	3	PAID	2016-04-05 15:44:01.338-04	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.048-04	\N	manual
93	3	4	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 18:19:12.094-04	2016-04-17 18:19:12.094-04	2016-07-08 23:52:41.064-04	\N	manual
255	31	14	USD	10294	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	\N	******	Leadership Development	\N	31	PAID	2016-07-02 20:00:00-04	2016-07-04 16:23:49.309-04	2016-08-02 09:38:06.274-04	\N	paypal
374	171	59	USD	2077	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 22:15:48.098-04	2016-09-27 22:46:35.645-04	2016-10-05 12:43:29.036-04	\N	paypal
293	142	48	USD	10212	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 20:00:00-04	2016-07-20 16:35:52.294-04	2016-08-16 10:58:32.981-04	\N	paypal
192	3	48	USD	2698	Leadership Tools (director tees)	Sarah Olson	\N	Leadership Supplies	\N	3	PAID	2015-12-14 19:00:00-05	2015-12-14 19:00:00-05	2016-06-14 14:14:21.117-04	\N	manual
294	142	48	USD	8496	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 20:00:00-04	2016-07-20 16:41:41.183-04	2016-08-16 10:58:02.246-04	\N	paypal
318	142	48	USD	1500	Coding books for our study groups (Humble Bundle -- Joy of Coding)	\N	******	Technical Study Group	\N	3	PAID	2016-08-18 08:03:51.47-04	2016-08-18 08:07:07.685-04	2016-08-19 16:58:55.155-04	\N	paypal
346	171	59	USD	3224	Event food	\N	******	Food & Beverage	\N	3	PAID	2016-09-09 12:56:27.706-04	2016-09-09 12:56:59.265-04	2016-09-13 10:57:05.808-04	\N	paypal
345	171	59	USD	2911	Event food	\N	******	Supplies & materials	\N	3	PAID	2016-09-09 12:47:46.738-04	2016-09-09 12:56:23.297-04	2016-09-15 20:09:43.894-04	\N	paypal
366	142	48	USD	4898	Two VR headsets for our AR/VR event at Best Buy.	\N	******	Supplies & materials	\N	3	PAID	2016-09-21 16:21:09.898-04	2016-09-21 16:23:17.18-04	2016-09-27 15:31:43.772-04	\N	paypal
367	142	48	USD	2500	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	\N	******	Other	\N	3	PAID	2016-09-22 11:22:21.436-04	2016-09-22 11:24:30.617-04	2016-09-27 15:33:54.695-04	\N	paypal
256	31	14	USD	749	Transportation for Sandra and Cici to get to meeting location with core team members	\N	******	Leadership Development	\N	31	PAID	2016-07-02 20:00:00-04	2016-07-04 16:25:35.824-04	2016-08-02 09:39:16.46-04	\N	paypal
197	3	59	USD	34750	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-26 15:05:53.771-04	2016-05-26 15:05:53.771-04	2016-06-14 14:14:21.121-04	\N	manual
222	3	4	USD	150	Global Development 	\N	\N	Global Development	\N	3	PAID	2016-06-09 14:38:16.857-04	2016-06-09 14:38:16.857-04	2016-06-14 14:14:21.133-04	\N	manual
307	31	14	USD	11757	Leadership team dinner - Sondry interview	\N	******	Scholarship	\N	31	PAID	2016-08-02 09:42:02.991-04	2016-08-02 09:43:29.423-04	2016-08-02 09:44:04.899-04	\N	paypal
333	142	48	USD	53720	Conference Travel	\N	******	Conference	\N	3	PAID	2016-08-26 20:03:45.469-04	2016-08-26 20:13:37.309-04	2016-11-03 17:27:23.523-04	\N	paypal
319	142	48	USD	13526	Dinner for last night's HackNight	\N	******	Hack Night	\N	3	PAID	2016-08-18 09:17:48.926-04	2016-08-18 09:19:12.087-04	2016-08-19 16:58:34.842-04	\N	paypal
375	171	59	USD	2715	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2016-09-27 22:46:42.795-04	2016-09-27 22:53:14.232-04	2016-10-05 12:44:00.917-04	\N	paypal
500	171	59	USD	2374	We Code Hackathon 2016	\N	******	Sponsorship	\N	3	PAID	2016-11-20 15:26:33.118-05	2016-11-20 15:29:20.497-05	2016-12-06 11:50:36.397-05	\N	paypal
158	3	48	USD	8320	Conference Expense	Sarah Olson	\N	Conference	\N	3	REJECTED	2016-05-10 15:19:21.785-04	2016-05-10 15:19:21.785-04	2016-06-14 14:14:21.1-04	\N	manual
178	3	3	USD	70000	Conference Grant	Sara Morsi Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 15:07:13.723-04	2016-05-19 15:07:13.723-04	2016-06-14 14:14:21.11-04	\N	manual
378	171	59	USD	7167	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 22:55:23.801-04	2016-09-27 22:58:27.408-04	2016-10-05 12:44:48.383-04	\N	paypal
376	171	59	USD	2475	Marketing Materials	\N	******	Other	\N	3	PAID	2016-09-27 22:53:17.638-04	2016-09-27 22:54:27.309-04	2016-10-05 12:45:15.524-04	\N	paypal
377	171	59	USD	6471	Event Food	\N	******	Other WWCode Event	\N	3	PAID	2016-09-27 22:54:30.186-04	2016-09-27 22:55:20.669-04	2016-11-03 15:43:51.901-04	\N	paypal
372	142	48	USD	2200	Website - Domain Name	\N	******	Other	\N	3	PAID	2016-09-26 18:46:40.46-04	2016-09-26 18:48:04.38-04	2016-12-22 17:19:53.18-05	\N	paypal
395	3	15	USD	32000	90/10 split: Hackathon donation	\N	******	Global Development	\N	3	PAID	2016-07-14 20:00:00-04	2016-10-04 18:04:41.846-04	2016-10-04 18:05:23.579-04	\N	manual
389	3	12	USD	100000	90/10 split: AT&T Sponsorship (April 2015)	 	******	Global Development	\N	3	PAID	2016-10-04 11:40:50.076-04	2016-10-04 11:44:06.971-04	2016-10-04 11:44:29.326-04	\N	manual
387	3	12	USD	10000	Google I/O: Alicia Carr	\N	******	Scholarship	\N	3	PAID	2016-05-25 20:00:00-04	2016-10-04 11:31:40.439-04	2016-10-04 11:44:36.611-04	\N	manual
393	3	12	USD	500	90/10 split: Turner matching donation	\N	******	Global Development	\N	3	PAID	2016-10-04 11:52:24.157-04	2016-10-04 11:53:03.718-04	2016-10-04 12:06:02.71-04	\N	manual
391	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 11:50:56.293-04	2016-10-04 11:51:48.623-04	2016-10-04 12:06:11.584-04	\N	manual
392	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 11:50:56.293-04	2016-10-04 11:51:59.211-04	2016-10-04 12:06:17.663-04	\N	manual
390	3	12	USD	250	90/10 split: Syema Ailia	\N	******	Global Development	\N	3	PAID	2016-10-04 11:49:30.068-04	2016-10-04 11:50:45.734-04	2016-10-04 12:06:24.611-04	\N	manual
394	3	2	USD	56266	Net budget balance pre-Open Collective	\N	******	Other WWCode Event	\N	3	PAID	2016-01-14 19:00:00-05	2016-10-04 17:41:43.853-04	2016-10-04 17:57:46.063-04	\N	manual
411	3	59	USD	31950	WWCode Portland Stickers	\N	******	Leadership Supplies	\N	3	PAID	2016-10-10 16:10:50.586-04	2016-10-10 16:11:36.293-04	2016-10-10 16:12:34.385-04	\N	manual
412	3	195	USD	1000	Test	\N	******	Fees	\N	3	REJECTED	2016-10-11 12:11:05.021-04	2016-10-11 12:13:18.686-04	2016-10-11 12:17:02.494-04	\N	paypal
413	3	195	USD	1000	Test	\N	******	Fees	\N	3	PAID	2016-10-11 12:17:09.527-04	2016-10-11 12:18:10.423-04	2016-10-11 12:18:39.64-04	\N	manual
401	31	14	USD	3080	Monthly core team meeting. Beverages with dinner for six members 	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 23:13:51.147-04	2016-10-04 23:14:45.394-04	2016-10-31 13:59:54.551-04	\N	paypal
409	70	12	USD	2838	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	\N	******	Workshop	\N	3	PAID	2016-10-08 11:03:22.819-04	2016-10-08 11:11:18.293-04	2016-11-03 17:13:32.781-04	\N	paypal
400	31	14	USD	3323	Monthly team meeting w core six members. Food/pizza	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 23:12:18.236-04	2016-10-04 23:13:43.629-04	2016-10-31 17:02:17.181-04	\N	paypal
402	31	14	USD	729	Transportation to get to GeekWire Summit social event 	\N	******	Conference	\N	3	PAID	2016-10-04 23:14:49.674-04	2016-10-04 23:17:22.898-04	2016-11-01 12:16:03.421-04	\N	paypal
396	3	272	USD	25000	DIANA A. SCHOLARSHIP GOOGLE I/O	\N	******	Conference	\N	3	PAID	2016-10-04 18:22:45.384-04	2016-10-04 18:23:45.863-04	2016-11-21 17:59:44.22-05	\N	manual
417	1371	300	USD	48435	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	\N	******	Hackathon	\N	3	PAID	2016-10-12 15:47:17.894-04	2016-10-12 15:50:24.464-04	2016-10-31 17:08:49.808-04	\N	paypal
416	1371	300	USD	51962	500 gift cards, 19.62 printed awards	\N	******	Hackathon	\N	3	PAID	2016-10-12 15:45:46.133-04	2016-10-12 15:47:13.682-04	2016-10-31 17:09:12.082-04	\N	paypal
415	1371	300	USD	70000	pre payment for dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 15:44:25.684-04	2016-10-12 15:45:38.031-04	2016-10-27 17:05:29.785-04	2016-11-02 20:00:00-04	paypal
418	1371	300	USD	64978	lunch ordered at Costco	\N	******	Hackathon	\N	3	PAID	2016-10-12 15:50:37.851-04	2016-10-12 15:52:06.282-04	2016-10-28 17:31:00.087-04	\N	paypal
427	31	14	USD	1305	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	\N	******	Workshop	\N	3	PAID	2016-10-15 18:59:26.409-04	2016-10-15 19:01:05.534-04	2016-10-31 13:52:13.785-04	\N	paypal
420	32	14	USD	2700	WWCode Seattle planning lunch with Sara	\N	******	Other	\N	3	PAID	2016-10-13 13:26:11.421-04	2016-10-13 13:30:27.473-04	2016-10-31 13:52:45.81-04	\N	paypal
419	171	59	USD	1446	Food for JavaScript Study Night - Oct. 11th	\N	******	Study Group	\N	3	PAID	2016-10-12 16:24:40.763-04	2016-10-12 16:48:15.148-04	2016-10-31 14:19:13.146-04	\N	paypal
453	28	2	USD	35000	DJ (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-26 00:34:19.335-04	2016-10-26 00:34:51.547-04	2016-10-27 17:08:49.13-04	\N	paypal
450	28	2	USD	6497	September Ruby Tuesday	\N	******	Study Group	\N	3	PAID	2016-10-25 23:53:42.508-04	2016-10-25 23:54:47.132-04	2016-10-31 17:11:37.246-04	\N	paypal
452	28	2	USD	26800	May AI Workshop	\N	******	Workshop	\N	3	PAID	2016-10-26 00:06:16.475-04	2016-10-26 00:07:27.314-04	2016-10-31 17:10:54.78-04	\N	paypal
447	28	2	USD	5518	Drinks for Happy Hour (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:40:29.898-04	2016-10-25 20:41:14.743-04	2016-10-31 17:13:40.764-04	\N	paypal
451	28	2	USD	20568	June South Hack Night	\N	******	Hack Night	\N	3	PAID	2016-10-25 23:57:37.783-04	2016-10-25 23:59:03.214-04	2016-10-31 17:11:21.759-04	\N	paypal
449	28	2	USD	75932	Drinks and snacks (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 23:43:46.209-04	2016-10-25 23:50:39.086-04	2016-10-31 17:13:06.494-04	\N	paypal
448	28	2	USD	2108	Markers, pens, sticky notes (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:41:19.411-04	2016-10-25 20:42:15.042-04	2016-10-31 17:13:20.6-04	\N	paypal
446	28	2	USD	1192	Almond milk for coffee (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:39:05.875-04	2016-10-25 20:40:23.911-04	2016-10-31 17:13:54.099-04	\N	paypal
445	28	2	USD	1136	Painters tape for signs  	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:18:03.746-04	2016-10-25 20:39:01.083-04	2016-10-31 17:14:52.301-04	\N	paypal
470	1379	301	EUR	1019	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 15:01:53.197-05	2016-11-09 15:15:40.819-05	2016-12-07 16:30:48.755-05	\N	paypal
414	1371	300	USD	76800	second half of dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 15:28:23.372-04	2016-10-12 15:44:15.333-04	2016-10-27 17:07:24.861-04	2016-11-02 20:00:00-04	paypal
467	28	2	USD	339421	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 18:10:25.089-04	2016-11-02 18:11:15.724-04	2016-11-21 10:23:08.924-05	\N	manual
464	3	14	USD	60000	Matthews Group - Leadership Development for Seattle team	Paid via PayPal	******	Leadership Development	\N	3	PAID	2016-10-31 18:03:17.783-04	2016-10-31 18:05:08.929-04	2016-11-29 16:46:31.974-05	\N	manual
466	28	2	USD	119954	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 18:08:55.076-04	2016-11-02 18:10:20.431-04	2016-11-18 16:01:44.79-05	\N	paypal
494	1378	301	EUR	4728	European Leadership Development Workshop -- Transportation, Flight	\N	******	Leadership Development	\N	3	PAID	2016-09-30 20:00:00-04	2016-11-19 08:21:57.651-05	2016-11-22 17:07:58.565-05	\N	manual
498	171	59	USD	4874	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	\N	******	Hackathon	\N	3	PAID	2016-11-20 15:18:30.305-05	2016-11-20 15:20:36.467-05	2016-11-22 16:55:11.103-05	\N	paypal
493	1378	301	EUR	4400	European Leadership Development Workshop -- Transportation, Taxi	\N	******	Leadership Development	\N	3	PAID	2016-10-26 20:00:00-04	2016-11-19 08:13:48.078-05	2016-11-22 17:07:41.878-05	\N	manual
471	1379	301	EUR	6444	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 15:15:46.133-05	2016-11-09 15:16:50.117-05	2016-12-07 16:38:07.749-05	\N	paypal
483	1325	273	USD	4351	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	\N	******	Hack Night	\N	3	PAID	2016-08-31 20:00:00-04	2016-11-16 19:12:31.06-05	2016-12-06 12:58:42.358-05	\N	manual
484	1325	273	USD	7773	Food for October Hack Night.	\N	******	Hack Night	\N	3	PAID	2016-10-05 20:00:00-04	2016-11-16 19:29:48.238-05	2016-12-06 12:56:13.801-05	\N	manual
501	171	59	USD	1700	Thank you gift to an amazing sponsor!	\N	******	Hackathon	\N	3	PAID	2016-11-20 15:29:28.692-05	2016-11-20 15:34:51.872-05	2016-11-22 07:31:01.064-05	\N	paypal
499	171	59	USD	8181	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	\N	******	Hackathon	\N	3	PAID	2016-11-20 15:20:40.018-05	2016-11-20 15:26:02.323-05	2016-11-22 16:54:34.067-05	\N	paypal
506	1333	278	GBP	6000	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	\N	******	Leadership Development	\N	3	PAID	2016-09-10 20:00:00-04	2016-11-22 15:36:49.712-05	2016-11-29 16:17:33.829-05	\N	manual
502	171	59	USD	1082	Marketing for IoT Hackathon	\N	******	Hackathon	\N	3	PAID	2016-11-20 15:36:16.598-05	2016-11-20 15:36:41.928-05	2016-12-06 11:50:57.444-05	\N	paypal
508	171	59	USD	3918	Supplies	\N	******	Hackathon	\N	3	PAID	2016-11-22 19:39:47.569-05	2016-11-22 20:16:59.692-05	2016-12-06 11:51:21.271-05	\N	paypal
509	171	59	USD	2698	T-shirt order - Design Lead	\N	******	Leadership Supplies	\N	3	PAID	2016-11-22 20:17:03.111-05	2016-11-22 20:18:21.842-05	2016-12-06 11:51:55.906-05	\N	paypal
507	1333	278	GBP	4000	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	\N	******	Leadership Development	\N	3	PAID	2016-10-01 20:00:00-04	2016-11-22 15:39:49.327-05	2016-11-29 16:17:22.193-05	\N	manual
474	31	14	USD	227646	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	\N	******	Leadership Development	\N	3	PAID	2016-11-15 10:52:03.936-05	2016-11-15 10:54:05.532-05	2016-11-29 16:46:42.977-05	\N	manual
639	3	273	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:49:03.664-05	2016-12-27 11:49:52.742-05	2016-12-27 11:50:06.731-05	\N	manual
573	171	59	USD	1058	Goodie Bags	\N	******	Hackathon	\N	3	PAID	2016-12-06 22:01:09.941-05	2016-12-06 22:01:33.246-05	2016-12-07 15:49:56.687-05	\N	paypal
485	1325	273	USD	1106	October Hack Night Drinks/Food.	\N	******	Hack Night	\N	3	PAID	2016-10-05 20:00:00-04	2016-11-16 19:45:56.588-05	2016-12-06 12:58:10.939-05	\N	manual
486	1325	273	USD	4444	Food/Drinks for Anniversary Reception with guest WWCode Directors!	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 20:00:00-04	2016-11-16 20:08:09.48-05	2016-11-22 17:21:43.596-05	\N	manual
492	1325	273	USD	713	Food for Anniversary Reception	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 20:00:00-04	2016-11-17 15:36:37.444-05	2016-12-06 12:55:40.485-05	\N	manual
591	142	48	USD	30496	3D Printer & Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-13 13:22:16.435-05	2016-12-13 15:33:52.789-05	2016-12-14 08:03:22.881-05	\N	paypal
602	142	48	USD	9240	Leadership - Planning for 2017 - Dinner	\N	******	Leadership Development	\N	3	PAID	2016-12-18 16:03:11.586-05	2016-12-18 16:03:54.509-05	2016-12-19 13:45:09.955-05	\N	paypal
604	142	48	USD	20397	Robotics: Coding with Your Kids HackNight Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-18 16:04:48.665-05	2016-12-18 16:05:52.891-05	2016-12-19 11:20:41.101-05	\N	paypal
601	142	48	USD	1175	Leadership - Planning for 2017 - Afternoon Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 15:54:41.356-05	2016-12-18 16:03:08.099-05	2016-12-19 13:42:59.885-05	\N	paypal
613	3	260	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:32:39.612-05	2016-12-23 11:35:32.89-05	2016-12-23 11:37:59.658-05	\N	manual
603	142	48	USD	875	Leadership - Planning for 2017 - Evening Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 16:03:57.719-05	2016-12-18 16:04:44.175-05	2016-12-19 13:43:54.758-05	\N	paypal
605	1374	300	USD	46419	Mugs for WWCode-SV	\N	******	Global Development	\N	3	PAID	2016-12-19 17:19:05.439-05	2016-12-19 17:20:00.599-05	2016-12-20 13:57:28.737-05	\N	paypal
607	3	2	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 13:50:58.117-05	2016-12-21 13:53:15.213-05	2016-12-21 13:53:47.768-05	\N	manual
608	3	3	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 13:51:15.967-05	2016-12-21 13:54:08.982-05	2016-12-21 13:54:31.514-05	\N	manual
619	3	265	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:06:10.893-05	2016-12-23 12:09:46.554-05	2016-12-23 12:10:35.083-05	\N	manual
614	3	261	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:45:31.739-05	2016-12-23 11:48:42.88-05	2016-12-23 11:49:17.798-05	\N	manual
617	3	263	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:58:06.292-05	2016-12-23 12:00:11.888-05	2016-12-23 12:00:26.307-05	\N	manual
615	3	12	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:51:12.278-05	2016-12-23 11:52:04.132-05	2016-12-23 11:52:23.784-05	\N	manual
616	3	262	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:52:52.588-05	2016-12-23 11:55:02.457-05	2016-12-23 11:56:04.914-05	\N	manual
618	3	264	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:03:12.871-05	2016-12-23 12:05:23.588-05	2016-12-23 12:05:42.262-05	\N	manual
621	3	259	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:20:24.371-05	2016-12-23 12:21:36.713-05	2016-12-23 12:21:53.364-05	\N	manual
620	3	301	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:13:56.172-05	2016-12-23 12:14:45.703-05	2016-12-23 12:15:16.44-05	\N	manual
622	3	195	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:26:09.212-05	2016-12-23 12:32:25.111-05	2016-12-23 12:32:56.293-05	\N	manual
623	3	266	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:41:23.136-05	2016-12-23 12:42:05.736-05	2016-12-23 12:42:19.013-05	\N	manual
624	3	267	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 12:43:55.758-05	2016-12-23 12:58:18.148-05	2016-12-23 13:04:06.163-05	\N	manual
626	3	268	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 14:36:30.003-05	2016-12-23 14:38:32.584-05	2016-12-23 14:38:47.127-05	\N	manual
644	3	279	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:25:07.236-05	2016-12-27 12:26:20.227-05	2016-12-27 12:27:10.046-05	\N	manual
627	3	269	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 14:39:34.326-05	2016-12-23 14:41:36.646-05	2016-12-23 14:41:48.635-05	\N	manual
628	3	270	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 14:47:22.609-05	2016-12-23 14:49:40.181-05	2016-12-23 14:50:08.905-05	\N	manual
632	3	299	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:10:47.262-05	2016-12-27 11:12:04.183-05	2016-12-27 11:12:26.594-05	\N	manual
633	3	271	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:13:47.179-05	2016-12-27 11:15:24.708-05	2016-12-27 11:16:27.404-05	\N	manual
640	3	274	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 11:51:06.223-05	2016-12-27 11:52:25.022-05	2016-12-27 11:52:46.541-05	\N	manual
634	3	13	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:22:16.78-05	2016-12-27 11:23:20.484-05	2016-12-27 11:23:36.529-05	\N	manual
636	3	15	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:30:20.153-05	2016-12-27 11:31:33.602-05	2016-12-27 11:31:59.233-05	\N	manual
637	3	298	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:35:19.064-05	2016-12-27 11:35:50.321-05	2016-12-27 11:36:05.685-05	\N	manual
641	3	275	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:54:08.966-05	2016-12-27 11:54:50.244-05	2016-12-27 11:55:07.749-05	\N	manual
638	3	272	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:39:04.447-05	2016-12-27 11:41:02.05-05	2016-12-27 11:41:27.62-05	\N	manual
642	3	276	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:58:36.204-05	2016-12-27 11:59:15.911-05	2016-12-27 11:59:34.226-05	\N	manual
647	3	278	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:28:20.017-05	2016-12-27 12:33:16.816-05	2016-12-27 12:34:46.927-05	\N	manual
643	3	277	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 12:02:39.037-05	2016-12-27 12:03:12.312-05	2016-12-27 12:03:23.471-05	\N	manual
666	3	293	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 11:28:38.36-05	2016-12-28 11:30:00.14-05	2016-12-28 11:30:16.798-05	\N	manual
667	3	294	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 11:30:41.349-05	2016-12-28 11:32:05.407-05	2016-12-28 11:32:19.79-05	\N	manual
62	31	14	USD	1000	Nike Dinner	Ride home after Nike dinner. Shared ride with Sara Adineh. 	******	Conference	\N	31	PAID	2016-03-17 20:00:00-04	2016-03-17 20:00:00-04	2016-06-14 14:14:21.031-04	\N	paypal
72	32	14	USD	6800	Connect 2016 event setup day dinner	\N	******	Conference	\N	32	PAID	2016-03-17 20:00:00-04	2016-03-17 20:00:00-04	2016-06-14 14:14:21.044-04	\N	paypal
635	3	47	INR	6000	Meetup Fees	\N	******	Fees	\N	141	APPROVED	2016-12-27 11:24:45.938-05	2016-12-27 11:25:59.379-05	2017-01-11 05:50:47.014-05	\N	manual
724	142	48	USD	2093	Drinks (La Croix water) for Jan HackNight	\N	******	Hack Night	\N	3	PAID	2017-01-15 19:34:19.312-05	2017-01-16 15:30:30.683-05	2017-01-25 13:41:34.763-05	\N	paypal
725	142	48	USD	22137	Amazon Echo Dot devices for HackNight and first book for our book club.	\N	******	Hack Night	\N	3	PAID	2017-01-15 19:34:19.312-05	2017-01-16 15:32:05.491-05	2017-01-25 13:44:34.015-05	\N	paypal
743	70	12	USD	30000	travel to NY for bell ringing at NYSE	\N	******	Other WWCode Event	\N	3	PAID	2017-01-23 16:57:02.837-05	2017-01-23 21:35:07.349-05	2017-01-25 13:20:55.157-05	\N	paypal
167	31	14	USD	2948	Connect Conference video footage review	Date is 4/28/2016	******	Conference	\N	31	PAID	2016-05-16 20:31:54.682-04	2016-05-16 20:31:54.682-04	2016-06-14 14:14:21.103-04	\N	paypal
768	3	278	GBP	40970	Travel Scholarship for WWCode Director	\N	******	Leadership Development	\N	3	PAID	2017-01-26 18:23:43.983-05	2017-01-27 10:34:47.447-05	2017-04-17 18:32:02.795-04	\N	manual
46	68	15	USD	14000	Food for March Boulder, CO event	\N	******	Other WWCode Event	\N	68	PAID	2016-03-17 14:48:54.413-04	2016-03-17 14:48:54.413-04	2016-06-14 14:14:21.021-04	\N	paypal
53	28	2	USD	10284	Feb 4 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 14:06:09.887-04	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.026-04	\N	paypal
55	28	2	USD	4951	Mar 3 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 14:06:09.887-04	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.026-04	\N	paypal
785	3	47	INR	6000	Meetup Fees	\N	******	Leadership Development	\N	3	REJECTED	2017-01-30 18:17:44.823-05	2017-01-31 11:46:45.519-05	2017-02-14 16:17:53.548-05	\N	manual
497	171	59	USD	1798	Domain name for hackathon and study night projects	\N	******	Fees	\N	3	PAID	2016-11-20 15:00:51.642-05	2016-11-20 15:06:26.088-05	2017-02-20 15:53:02.93-05	\N	paypal
56	28	2	USD	22568	Feb 1, Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-03-20 14:06:09.887-04	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.027-04	\N	paypal
137	68	15	USD	14100	WWC Boulder- April event's food	\N	******	Other WWCode Event	\N	3	PAID	2016-04-06 20:00:00-04	2016-04-06 20:00:00-04	2016-06-14 14:14:21.09-04	\N	paypal
138	68	15	USD	7000	WWC Stickers	\N	******	Network supplies	\N	68	REJECTED	2016-03-17 20:00:00-04	2016-03-17 20:00:00-04	2016-06-14 14:14:21.091-04	\N	paypal
184	28	2	USD	8979	May 2 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 19:46:04.647-04	2016-05-22 19:46:04.647-04	2016-06-14 14:14:21.113-04	\N	paypal
183	28	2	USD	13315	April 4 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 19:46:04.647-04	2016-05-22 19:46:04.647-04	2016-06-14 14:14:21.113-04	\N	paypal
180	28	2	USD	5037	April 7 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 19:46:04.647-04	2016-05-22 19:46:04.647-04	2016-06-14 14:14:21.112-04	\N	paypal
181	28	2	USD	5325	May 5 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 19:46:04.647-04	2016-05-22 19:46:04.647-04	2016-06-14 14:14:21.112-04	\N	paypal
147	32	14	USD	14000	Quarterly planning meeting	\N	******	Leadership Development	\N	32	PAID	2016-05-05 20:18:43.265-04	2016-05-05 20:18:43.265-04	2016-06-14 14:14:21.095-04	\N	paypal
211	28	2	USD	20000	6/2/16 Fireside Chat at Orange Coworking	\N	******	Fireside Chat	\N	3	PAID	2016-06-04 17:37:03.991-04	2016-06-04 17:37:03.991-04	2016-06-14 14:14:21.127-04	\N	paypal
186	28	2	USD	30000	05-21-16 AI workshop	\N	******	Workshop	\N	3	PAID	2016-05-22 20:26:36.061-04	2016-05-22 20:26:36.061-04	2016-10-31 17:16:10.268-04	\N	paypal
213	28	2	USD	2400	3/30/16 Python Gameathon prize - Udemy course	\N	******	Hackathon	\N	3	PAID	2016-06-04 17:37:03.991-04	2016-06-04 17:37:03.991-04	2016-06-14 14:14:21.128-04	\N	paypal
48	68	15	USD	7800	Order for stickers of our official WWC Boulder/Denver chapter logo	We'll include these at our booth at the Mile High Agile conference in two weeks.	******	Leadership Supplies	\N	3	PAID	2016-03-17 23:23:34.628-04	2016-03-17 23:23:34.628-04	2016-11-03 15:45:25.209-04	\N	paypal
59	31	14	USD	4656	WwConnect planning meeting	Seattle team ordered in an evening meal to continue planning meeting	******	Conference	\N	31	PAID	2016-03-10 19:00:00-05	2016-03-10 19:00:00-05	2016-06-14 14:14:21.029-04	\N	paypal
60	31	14	USD	2519	WwConnect Planning Meeting	Two bottles of beverage for the Seattle team to have dinner brought in while working	******	Conference	\N	31	PAID	2016-03-10 19:00:00-05	2016-03-10 19:00:00-05	2016-06-14 14:14:21.03-04	\N	paypal
61	31	14	USD	709	WwConnect Conference Set Up Day 1	Cab ride to get on location	******	Conference	\N	31	PAID	2016-03-18 20:00:00-04	2016-03-18 20:00:00-04	2016-06-14 14:14:21.03-04	\N	paypal
64	31	14	USD	1025	WwConnect2016	Coffee for team. Day2	******	Conference	\N	31	PAID	2016-03-19 20:00:00-04	2016-03-19 20:00:00-04	2016-06-14 14:14:21.032-04	\N	paypal
34	7	10	MXN	166080	IVA Libretas Hackathon	Impuesto por la factura para las libretas	******	Hackathon	\N	3	REJECTED	2016-02-16 13:58:04.663-05	2016-02-16 13:58:04.663-05	2016-08-16 11:05:09.996-04	\N	paypal
63	31	14	USD	658	WwConnect Conference	Morning coffee day 2	******	Conference	\N	31	PAID	2016-03-19 20:00:00-04	2016-03-19 20:00:00-04	2016-06-14 14:14:21.032-04	\N	paypal
33	7	10	MXN	1038000	Libretas Hackathon	Pago entero para libretas de Hack for Equality	******	Hackathon	\N	3	REJECTED	2016-02-16 13:56:17.216-05	2016-02-16 13:56:17.216-05	2016-08-16 11:05:15.471-04	\N	paypal
776	31	14	USD	59040	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	\N	******	Other WWCode Event	\N	3	PAID	2017-01-28 09:06:40.223-05	2017-01-28 18:59:18.982-05	2017-02-07 13:32:49.378-05	\N	paypal
820	28	2	USD	10680	February Lightning Talks food	\N	******	Lightning Talks	\N	3	PAID	2017-02-11 22:22:39.341-05	2017-02-12 22:04:37.319-05	2017-03-14 13:17:54.1-04	\N	paypal
899	70	12	USD	20950	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 23:15:52.943-05	2017-03-09 00:17:56.148-05	2017-03-14 13:22:10.775-04	\N	paypal
900	70	12	USD	9732	IWD event -- wine for event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 23:15:52.943-05	2017-03-09 00:20:17.878-05	2017-03-14 13:22:31.507-04	\N	paypal
858	171	59	USD	5798	Supplies for Agile workshop (2/26)	\N	******	Workshop	\N	3	PAID	2017-02-25 16:41:40.394-05	2017-02-26 16:29:05.754-05	2017-03-14 14:16:43.254-04	\N	paypal
886	3	511	MXN	14915	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 16:54:10.307-05	2017-03-07 07:57:52.472-05	2017-03-14 14:18:46.39-04	\N	manual
924	1332	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-16 16:16:54.952-04	2017-03-16 21:25:25.526-04	2017-03-20 11:39:23.558-04	\N	paypal
926	1333	278	GBP	85000	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	\N	******	Scholarship	\N	3	PAID	2017-03-16 16:16:54.952-04	2017-03-17 02:43:54.949-04	2017-03-27 12:01:27.361-04	\N	paypal
935	1331	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-20 15:19:06.997-04	2017-03-20 20:17:43.895-04	2017-03-27 13:54:16.852-04	\N	paypal
952	69	12	USD	50000	Google I/O	\N	******	Conference	\N	3	PAID	2017-03-26 12:01:07.917-04	2017-03-27 09:44:34.926-04	2017-03-27 13:11:39.352-04	\N	paypal
949	69	12	USD	37500	Google I/O ticket	\N	******	Conference	\N	3	PAID	2017-03-25 09:46:14.921-04	2017-03-25 11:06:03.662-04	2017-03-27 13:12:00.205-04	\N	paypal
965	1344	286	USD	37500	Google I/O Ticket  2017	\N	******	Leadership Development	\N	1344	APPROVED	2017-03-29 13:01:30.368-04	2017-03-29 16:36:36.032-04	2017-03-31 09:27:39.284-04	\N	paypal
966	171	59	USD	3405	Snacks for Unity 101 workshop.	\N	******	Workshop	\N	171	APPROVED	2017-03-29 13:01:30.368-04	2017-03-29 22:17:35.707-04	2017-03-29 22:19:03.184-04	\N	manual
967	171	59	USD	2085	Small thank you gifts for workshop instructors,	\N	******	Workshop	\N	171	APPROVED	2017-03-29 13:01:30.368-04	2017-03-29 22:21:03.723-04	2017-03-29 22:21:29.532-04	\N	manual
962	1344	286	USD	100000	Travel stipend to attend the Google I/O 2017 Conference.	\N	******	Conference	\N	3	PAID	2017-03-28 12:31:20.932-04	2017-03-29 12:18:26.633-04	2017-03-31 18:33:59.762-04	\N	paypal
974	3	286	USD	20000	Leadership Development: Conference Support: Karina M. 	\N	******	Conference	\N	1344	APPROVED	2017-03-31 13:33:05.687-04	2017-03-31 18:54:08.585-04	2017-03-31 21:11:20.009-04	\N	manual
988	3	295	USD	6000	Meetup Fees	\N	******	Leadership Development	\N	3	PAID	2017-04-05 10:08:17.838-04	2017-04-05 10:18:18.821-04	2017-04-05 10:19:21.382-04	\N	manual
998	3	12	USD	235699	Atlanta IWD Event	\N	******	Other WWCode Event	\N	3	PAID	2017-04-07 10:53:35.266-04	2017-04-07 16:27:41.491-04	2017-04-17 15:17:23.077-04	\N	manual
1001	171	59	USD	2891	Hackathon 2017 planning meeting	\N	******	Hackathon	\N	3	PAID	2017-04-09 11:46:01.525-04	2017-04-09 18:04:51.227-04	2017-04-11 15:15:09.869-04	\N	paypal
1002	171	59	USD	1527	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2017-04-09 11:46:01.525-04	2017-04-09 18:37:03.724-04	2017-04-11 15:13:28.739-04	\N	paypal
1016	1333	278	GBP	85000	WWCode CONNECT Conference Travel Stipend	\N	******	Conference	\N	3	PAID	2017-04-11 17:35:01.731-04	2017-04-12 10:42:51.103-04	2017-04-17 17:18:35.71-04	\N	paypal
1003	171	59	USD	3306	Event supplies	\N	******	Leadership Supplies	\N	171	APPROVED	2017-04-09 11:33:04.72-04	2017-04-09 18:37:53.717-04	2017-04-09 18:38:34.586-04	\N	manual
1007	142	48	USD	11948	Business cards and stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-04-10 12:14:55.686-04	2017-04-10 17:31:17.015-04	2017-05-16 18:00:30.445-04	\N	manual
1027	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	******	Other WWCode Event	\N	3	PAID	2017-04-17 15:15:50.71-04	2017-04-17 18:11:05.461-04	2017-04-17 18:12:23.057-04	\N	manual
1028	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta\tL.	Reimbursed via Western Union	******	Conference	\N	3	APPROVED	2017-04-17 15:15:52.793-04	2017-04-17 18:41:52.852-04	2017-04-17 18:42:06.121-04	2017-05-04 20:00:00-04	manual
1054	171	59	USD	2390	Planning meetings - Unity + VR workshops	\N	******	Workshop	\N	171	APPROVED	2017-04-24 18:33:05.343-04	2017-04-24 22:53:38.096-04	2017-04-24 23:08:41.521-04	\N	manual
1056	171	59	USD	33534	Hotel - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 18:31:39.131-04	2017-04-24 22:55:35.127-04	2017-04-24 23:08:38.705-04	\N	manual
1055	171	59	USD	13896	Flights for Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 18:31:39.131-04	2017-04-24 22:54:40.938-04	2017-04-24 23:08:40.259-04	\N	manual
1084	142	48	USD	1554	Snacks and batteries for our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 20:00:00-04	2017-05-02 14:26:59.045-04	2017-05-16 18:00:04.484-04	\N	manual
1070	171	59	USD	1785	Tech Summit Lunch	\N	******	Conference	\N	171	APPROVED	2017-04-28 19:37:09.548-04	2017-04-29 17:42:39.653-04	2017-04-29 17:42:52.753-04	\N	manual
1093	171	59	USD	6513	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 20:47:33.174-04	2017-05-03 16:05:13.476-04	2017-05-03 16:15:30.301-04	\N	manual
1099	3	430	USD	101200	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	\N	******	Scholarship	\N	3	PAID	2017-05-03 21:36:17.701-04	2017-05-04 15:05:15.03-04	2017-05-04 15:06:09.066-04	\N	manual
1085	142	48	USD	9777	Supplies for decorating our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 20:00:00-04	2017-05-02 14:28:49.091-04	2017-05-16 18:00:15.589-04	\N	manual
1086	142	48	USD	2989	Leadership meeting	\N	******	Leadership Development	\N	3	PAID	2017-04-21 20:00:00-04	2017-05-02 14:29:43.581-04	2017-05-16 17:59:48.244-04	\N	manual
1088	142	48	USD	100000	Google I/O Travel Stipend	\N	******	Conference	\N	3	PAID	2017-03-14 20:00:00-04	2017-05-02 14:34:08.158-04	2017-05-16 18:00:40.397-04	\N	manual
1092	171	59	USD	1950	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 21:02:09.827-04	2017-05-03 15:52:47.919-04	2017-05-03 16:15:31.455-04	\N	manual
1137	171	59	USD	2680	Nametags	\N	******	Leadership Supplies	\N	171	APPROVED	2017-05-16 15:37:26.124-04	2017-05-16 18:26:29.898-04	2017-05-16 18:30:08.546-04	\N	paypal
1120	1378	301	EUR	2700	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 20:00:00-04	2017-05-10 16:08:43.707-04	2017-05-10 16:08:43.707-04	\N	paypal
1121	1378	301	EUR	2505	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 20:00:00-04	2017-05-10 16:09:17.149-04	2017-05-10 16:09:17.149-04	\N	paypal
1119	32	14	USD	11500	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	\N	******	Other	\N	3	PAID	2017-05-10 06:03:37.039-04	2017-05-10 13:19:29.682-04	2017-05-16 17:55:26.77-04	\N	manual
1138	171	59	USD	3450	Color printing - flyers and signage for events. 	\N	******	Other	\N	171	APPROVED	2017-05-16 15:37:26.124-04	2017-05-16 18:41:15.044-04	2017-05-16 18:42:18.673-04	\N	paypal
1122	1378	301	EUR	19398	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-10 01:18:16.903-04	2017-05-10 16:10:54.588-04	2017-05-16 17:49:07.922-04	\N	manual
1123	3206	12	USD	500000	Deposit- We Rise Conference Hosting Location	\N	******	Conference	\N	3	PAID	2017-05-10 01:18:16.903-04	2017-05-10 21:32:36.838-04	2017-05-16 17:51:10.633-04	\N	manual
1143	32	14	USD	19017	Intro to Docker workshop food for attendees	\N	******	Workshop	\N	32	PENDING	2017-05-18 16:25:06.712-04	2017-05-19 00:24:00.964-04	2017-05-19 00:24:00.964-04	\N	paypal
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         4027.dat                                                                                            0000600 0004000 0002000 00000051063 13174666341 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2016-01-18 18:54:06.501-05	2016-01-18 18:54:06.501-05	\N	2	10	BACKER	61	\N	688	\N
2016-01-29 17:23:53.527-05	2016-01-29 17:23:53.527-05	\N	30	12	BACKER	87	\N	691	\N
2016-02-02 11:36:39.043-05	2016-02-02 11:36:39.043-05	\N	30	14	BACKER	101	\N	691	\N
2016-02-02 12:04:56.333-05	2016-02-02 12:04:56.333-05	\N	30	13	BACKER	103	\N	691	\N
2016-01-08 19:22:34.641-05	2016-01-08 19:22:34.64-05	\N	3	10	HOST	27	\N	51	\N
2016-01-12 19:00:00-05	\N	\N	3	12	HOST	29	\N	51	\N
2016-09-20 16:58:51.903-04	2016-09-20 16:58:51.903-04	\N	1244	4	BACKER	1544	\N	717	\N
2016-09-09 23:42:51.435-04	2016-09-09 23:42:51.435-04	\N	1158	241	BACKER	1471	\N	737	\N
2016-02-02 11:52:02.312-05	2016-02-02 11:52:02.312-05	\N	80	10	BACKER	102	\N	768	\N
2016-06-21 12:02:55.799-04	2016-06-21 12:02:55.799-04	\N	642	12	BACKER	841	\N	775	\N
2016-06-21 12:05:00.99-04	2016-06-21 12:05:00.99-04	\N	642	4	BACKER	842	\N	775	\N
2016-06-21 12:06:05.21-04	2016-06-21 12:06:05.21-04	\N	642	48	BACKER	843	\N	775	\N
2016-07-01 18:31:46.068-04	2016-07-01 18:31:46.068-04	\N	686	2	BACKER	894	\N	803	\N
2016-02-02 16:46:44.979-05	2016-02-02 16:46:44.979-05	\N	8	14	BACKER	108	\N	819	\N
2016-06-09 13:28:14.08-04	2016-06-09 13:28:14.08-04	\N	8	3	BACKER	717	\N	819	\N
2016-05-19 15:24:42.921-04	2016-05-19 15:24:42.921-04	\N	392	2	BACKER	533	\N	718	54
2016-06-22 16:09:46.034-04	2016-06-22 16:09:46.034-04	\N	646	2	BACKER	846	\N	771	54
2016-08-01 11:55:26.732-04	2016-08-01 11:55:26.732-04	\N	884	2	BACKER	1131	\N	750	54
2016-09-28 17:47:19.401-04	2016-09-28 17:47:19.401-04	\N	1299	2	BACKER	1634	\N	795	54
2016-05-03 09:07:28-04	2016-05-03 09:07:28-04	\N	308	2	BACKER	437	\N	798	54
2016-06-06 20:53:47.104-04	2016-06-06 20:53:47.104-04	\N	555	13	BACKER	708	\N	743	61
2016-04-29 09:51:18.812-04	2016-04-29 09:51:18.812-04	\N	303	13	BACKER	425	\N	808	61
2016-04-28 11:01:17.535-04	2016-04-28 11:01:17.535-04	\N	283	13	BACKER	407	\N	824	61
2016-08-01 11:54:14.068-04	2016-08-01 11:54:14.068-04	\N	883	2	BACKER	1130	\N	839	54
2016-04-13 12:46:10.223-04	2016-04-13 12:46:10.223-04	\N	224	2	BACKER	330	\N	820	54
2016-02-18 14:54:08.738-05	2016-02-18 14:54:08.738-05	\N	108	2	BACKER	138	\N	813	54
2016-09-29 14:10:43.419-04	2016-09-29 14:10:43.419-04	\N	1331	277	ADMIN	1666	\N	695	\N
2016-08-03 13:47:17.3-04	2016-08-03 13:47:17.3-04	\N	896	4	BACKER	1147	\N	759	64
2016-03-25 11:11:05.1-04	2016-03-25 11:11:05.1-04	\N	192	2	BACKER	268	\N	805	54
2016-09-22 21:07:10.698-04	2016-09-22 21:07:10.698-04	\N	1263	59	BACKER	1568	\N	792	96
2016-06-09 20:00:00-04	\N	\N	577	4	ADMIN	738	\N	694	\N
2016-09-29 14:26:35.151-04	2016-09-29 14:26:35.151-04	\N	1349	289	ADMIN	1684	\N	723	\N
2017-01-14 12:11:43.287-05	2017-01-14 12:11:43.287-05	\N	2549	270	BACKER	2767	\N	762	\N
2017-02-27 19:25:20.392-05	2017-02-27 19:25:20.392-05	\N	3301	522	BACKER	3424	\N	837	\N
2017-02-10 11:47:34.941-05	2017-02-10 11:47:34.941-05	\N	3053	15	BACKER	3214	\N	838	55
2016-11-28 10:33:15.87-05	2016-11-28 10:33:15.87-05	\N	1890	2	BACKER	2289	\N	810	54
2017-02-01 10:16:22.449-05	2017-02-01 10:16:22.449-05	\N	2898	48	BACKER	3042	\N	801	100
2016-09-29 14:30:54.26-04	2016-09-29 14:30:54.26-04	\N	1356	293	ADMIN	1691	\N	719	\N
2016-09-29 14:28:54.298-04	2016-09-29 14:28:54.298-04	\N	1353	291	ADMIN	1688	\N	720	\N
2016-09-29 14:28:08.489-04	2016-09-29 14:28:08.489-04	\N	1351	290	ADMIN	1686	\N	721	\N
2016-09-29 14:26:35.16-04	2016-09-29 14:26:35.16-04	\N	1350	289	ADMIN	1685	\N	722	\N
2016-09-29 14:30:08.999-04	2016-09-29 14:30:08.999-04	\N	1355	292	ADMIN	1690	\N	769	\N
2016-09-29 14:37:07.378-04	2016-09-29 14:37:07.378-04	\N	1367	298	ADMIN	1701	\N	776	\N
2016-09-29 14:43:49.259-04	2016-09-29 14:43:49.259-04	\N	1377	301	ADMIN	1713	\N	782	\N
2016-09-29 14:43:49.259-04	2016-09-29 14:43:49.259-04	\N	1376	301	ADMIN	1712	\N	786	\N
2016-09-29 14:41:11.097-04	2016-09-29 14:41:11.097-04	\N	1373	300	ADMIN	1709	\N	791	\N
2016-09-29 14:43:49.259-04	2016-09-29 14:43:49.259-04	\N	1378	301	ADMIN	1714	\N	793	\N
2016-09-29 14:41:11.089-04	2016-09-29 14:41:11.089-04	\N	1372	300	ADMIN	1707	\N	794	\N
2016-09-29 14:41:11.077-04	2016-09-29 14:41:11.077-04	\N	1371	300	ADMIN	1706	\N	796	\N
2016-09-29 14:43:49.258-04	2016-09-29 14:43:49.258-04	\N	1379	301	ADMIN	1711	\N	800	\N
2016-09-29 14:38:54.983-04	2016-09-29 14:38:54.983-04	\N	1369	299	ADMIN	1704	\N	802	\N
2016-09-29 14:38:54.974-04	2016-09-29 14:38:54.974-04	\N	1368	299	ADMIN	1703	\N	804	\N
2016-09-29 14:37:07.378-04	2016-09-29 14:37:07.378-04	\N	1366	298	ADMIN	1702	\N	807	\N
2016-09-29 14:37:07.37-04	2016-09-29 14:37:07.37-04	\N	1365	298	ADMIN	1700	\N	811	\N
2016-09-29 14:34:59.53-04	2016-09-29 14:34:59.53-04	\N	1364	297	ADMIN	1699	\N	812	\N
2016-09-29 14:34:59.53-04	2016-09-29 14:34:59.53-04	\N	1363	297	ADMIN	1698	\N	814	\N
2016-09-29 14:34:59.522-04	2016-09-29 14:34:59.522-04	\N	1362	297	ADMIN	1697	\N	815	\N
2016-09-29 14:33:37.221-04	2016-09-29 14:33:37.221-04	\N	1360	295	ADMIN	1696	\N	818	\N
2016-09-29 14:38:54.983-04	2016-09-29 14:38:54.983-04	\N	1370	299	ADMIN	1705	\N	825	\N
2016-09-29 14:33:37.213-04	2016-09-29 14:33:37.213-04	\N	1359	295	ADMIN	1694	\N	828	\N
2016-09-29 14:43:49.24-04	2016-09-29 14:43:49.24-04	\N	1375	301	ADMIN	1710	\N	829	\N
2016-09-29 14:33:37.221-04	2016-09-29 14:33:37.221-04	\N	1361	295	ADMIN	1695	\N	832	\N
2016-09-29 14:32:01.003-04	2016-09-29 14:32:01.003-04	\N	1358	294	ADMIN	1693	\N	833	\N
2016-02-02 18:09:06.035-05	2016-02-02 18:09:06.035-05	\N	2	13	BACKER	109	\N	688	\N
2016-01-12 19:00:00-05	\N	\N	3	13	HOST	30	\N	51	\N
2016-01-12 19:00:00-05	\N	\N	3	14	HOST	31	\N	51	\N
2016-01-12 19:00:00-05	\N	\N	3	15	HOST	32	\N	51	\N
2016-03-06 19:00:00-05	\N	\N	3	47	HOST	203	\N	51	\N
2016-03-06 19:00:00-05	\N	\N	3	48	HOST	205	\N	51	\N
2015-10-31 20:00:00-04	2015-10-31 20:00:00-04	\N	3	51	HOST	213	\N	51	\N
2016-01-31 19:00:00-05	\N	\N	3	2	HOST	18	\N	51	\N
2016-01-31 19:00:00-05	\N	\N	3	3	HOST	19	\N	51	\N
2016-01-31 19:00:00-05	\N	\N	3	4	HOST	20	\N	51	\N
2016-03-18 20:00:00-04	2016-03-18 20:00:00-04	\N	3	59	HOST	246	\N	51	\N
2016-08-01 20:00:00-04	2016-08-01 20:00:00-04	\N	3	195	HOST	1149	\N	51	\N
2016-09-07 18:13:23.811-04	2016-09-07 18:13:23.811-04	\N	3	241	HOST	1458	\N	51	\N
2016-09-29 14:43:49.259-04	2016-09-29 14:43:49.259-04	\N	3	301	HOST	1715	\N	51	\N
2016-09-29 14:41:11.097-04	2016-09-29 14:41:11.097-04	\N	3	300	HOST	1716	\N	51	\N
2016-09-29 14:38:54.983-04	2016-09-29 14:38:54.983-04	\N	3	299	HOST	1717	\N	51	\N
2016-09-29 14:37:07.378-04	2016-09-29 14:37:07.378-04	\N	3	298	HOST	1718	\N	51	\N
2016-09-29 14:34:59.53-04	2016-09-29 14:34:59.53-04	\N	3	297	HOST	1719	\N	51	\N
2016-09-29 14:33:37.221-04	2016-09-29 14:33:37.221-04	\N	3	295	HOST	1720	\N	51	\N
2016-09-29 14:32:01.003-04	2016-09-29 14:32:01.003-04	\N	3	294	HOST	1721	\N	51	\N
2016-09-29 14:30:54.26-04	2016-09-29 14:30:54.26-04	\N	3	293	HOST	1722	\N	51	\N
2016-09-29 14:30:08.999-04	2016-09-29 14:30:08.999-04	\N	3	292	HOST	1723	\N	51	\N
2016-09-29 14:28:54.298-04	2016-09-29 14:28:54.298-04	\N	3	291	HOST	1724	\N	51	\N
2016-09-29 14:28:08.494-04	2016-09-29 14:28:08.494-04	\N	3	290	HOST	1725	\N	51	\N
2016-09-29 14:26:35.16-04	2016-09-29 14:26:35.16-04	\N	3	289	HOST	1726	\N	51	\N
2016-09-29 14:25:22.012-04	2016-09-29 14:25:22.012-04	\N	3	288	HOST	1727	\N	51	\N
2016-09-29 14:24:17.83-04	2016-09-29 14:24:17.83-04	\N	3	287	HOST	1728	\N	51	\N
2016-09-29 14:19:11.467-04	2016-09-29 14:19:11.467-04	\N	3	286	HOST	1729	\N	51	\N
2016-09-29 14:17:47.337-04	2016-09-29 14:17:47.337-04	\N	3	285	HOST	1730	\N	51	\N
2016-09-29 14:16:52.145-04	2016-09-29 14:16:52.145-04	\N	3	284	HOST	1732	\N	51	\N
2016-09-29 14:16:17.13-04	2016-09-29 14:16:17.13-04	\N	3	283	HOST	1733	\N	51	\N
2016-09-29 14:15:23.948-04	2016-09-29 14:15:23.948-04	\N	3	282	HOST	1734	\N	51	\N
2016-09-29 14:14:46.62-04	2016-09-29 14:14:46.62-04	\N	3	281	HOST	1735	\N	51	\N
2016-09-29 14:13:48.784-04	2016-09-29 14:13:48.784-04	\N	3	280	HOST	1736	\N	51	\N
2016-09-29 14:12:58.888-04	2016-09-29 14:12:58.888-04	\N	3	279	HOST	1737	\N	51	\N
2016-09-29 14:11:53.87-04	2016-09-29 14:11:53.87-04	\N	3	278	HOST	1738	\N	51	\N
2016-09-29 14:10:43.445-04	2016-09-29 14:10:43.445-04	\N	3	277	HOST	1739	\N	51	\N
2016-09-29 14:09:42.812-04	2016-09-29 14:09:42.812-04	\N	3	276	HOST	1740	\N	51	\N
2016-09-29 14:08:19.528-04	2016-09-29 14:08:19.528-04	\N	3	275	HOST	1741	\N	51	\N
2016-09-29 14:06:44.758-04	2016-09-29 14:06:44.758-04	\N	3	274	HOST	1742	\N	51	\N
2016-09-29 14:06:00.979-04	2016-09-29 14:06:00.979-04	\N	3	273	HOST	1743	\N	51	\N
2016-09-29 14:05:19.101-04	2016-09-29 14:05:19.101-04	\N	3	272	HOST	1744	\N	51	\N
2016-09-29 14:03:46.814-04	2016-09-29 14:03:46.814-04	\N	3	271	HOST	1745	\N	51	\N
2016-09-29 14:02:54.581-04	2016-09-29 14:02:54.581-04	\N	3	270	HOST	1746	\N	51	\N
2016-09-29 14:01:49.724-04	2016-09-29 14:01:49.724-04	\N	3	269	HOST	1747	\N	51	\N
2016-09-29 14:01:04.753-04	2016-09-29 14:01:04.753-04	\N	3	268	HOST	1748	\N	51	\N
2016-09-29 14:00:01.891-04	2016-09-29 14:00:01.891-04	\N	3	267	HOST	1749	\N	51	\N
2016-09-29 13:59:15.446-04	2016-09-29 13:59:15.446-04	\N	3	266	HOST	1750	\N	51	\N
2016-09-29 13:58:16.643-04	2016-09-29 13:58:16.643-04	\N	3	265	HOST	1751	\N	51	\N
2016-09-29 13:54:53.501-04	2016-09-29 13:54:53.501-04	\N	3	264	HOST	1752	\N	51	\N
2016-09-29 13:53:00.559-04	2016-09-29 13:53:00.559-04	\N	3	263	HOST	1753	\N	51	\N
2016-09-29 13:51:29.396-04	2016-09-29 13:51:29.396-04	\N	3	262	HOST	1754	\N	51	\N
2016-09-29 13:49:43.088-04	2016-09-29 13:49:43.088-04	\N	3	261	HOST	1755	\N	51	\N
2016-09-29 13:44:40.461-04	2016-09-29 13:44:40.461-04	\N	3	260	HOST	1756	\N	51	\N
2015-11-19 05:07:53.479-05	2017-10-27 13:28:55.857-04	\N	3	51	HOST	4719	\N	51	\N
2016-09-29 13:43:14.112-04	2016-09-29 13:43:14.112-04	\N	3	259	HOST	1757	\N	51	\N
2017-01-03 19:00:00-05	2017-01-03 19:00:00-05	\N	3	430	HOST	2682	\N	51	\N
2017-02-21 11:25:28.555-05	2017-02-21 11:25:28.555-05	\N	3	510	HOST	3326	\N	51	\N
2017-02-21 11:55:29.765-05	2017-02-21 11:55:29.765-05	\N	3	511	HOST	3328	\N	51	\N
2017-02-21 13:11:30.855-05	2017-02-21 13:11:30.855-05	\N	3	512	HOST	3332	\N	51	\N
2017-02-21 13:35:34.613-05	2017-02-21 13:35:34.613-05	\N	3	513	HOST	3334	\N	51	\N
2017-02-21 13:49:14.435-05	2017-02-21 13:49:14.435-05	\N	3	515	HOST	3338	\N	51	\N
2017-02-21 14:02:21.646-05	2017-02-21 14:02:21.646-05	\N	3	516	HOST	3341	\N	51	\N
2017-02-21 14:07:25.321-05	2017-02-21 14:07:25.321-05	\N	3	517	HOST	3343	\N	51	\N
2017-02-21 14:13:03.538-05	2017-02-21 14:13:03.538-05	\N	3	518	HOST	3345	\N	51	\N
2017-02-21 14:25:28.822-05	2017-02-21 14:25:28.822-05	\N	3	519	HOST	3347	\N	51	\N
2017-02-21 14:34:47.427-05	2017-02-21 14:34:47.427-05	\N	3	520	HOST	3349	\N	51	\N
2017-02-21 14:39:46.29-05	2017-02-21 14:39:46.29-05	\N	3	521	HOST	3351	\N	51	\N
2017-02-21 14:45:19.309-05	2017-02-21 14:45:19.309-05	\N	3	522	HOST	3353	\N	51	\N
2017-02-21 15:04:49.156-05	2017-02-21 15:04:49.156-05	\N	3	523	HOST	3355	\N	51	\N
2017-02-21 15:11:44.893-05	2017-02-21 15:11:44.893-05	\N	3	524	HOST	3357	\N	51	\N
2017-02-21 15:16:59.184-05	2017-02-21 15:16:59.184-05	\N	3	525	HOST	3359	\N	51	\N
2017-04-03 12:22:46.049-04	2017-04-03 12:22:46.049-04	\N	3	584	HOST	3951	\N	51	\N
2017-05-10 19:45:46.804-04	2017-05-10 19:45:46.804-04	\N	4749	522	BACKER	4528	\N	747	\N
2017-04-30 21:40:31.703-04	2017-04-30 21:40:31.703-04	\N	3419	516	BACKER	4353	\N	841	\N
2017-02-01 12:30:50.44-05	2017-02-01 12:30:50.44-05	\N	2906	271	BACKER	3045	\N	692	57
2017-04-11 22:05:36.09-04	2017-04-11 22:05:36.09-04	\N	4173	13	BACKER	4093	\N	693	61
2017-04-10 21:09:50.695-04	2017-04-10 21:09:50.695-04	\N	4153	13	BACKER	4088	\N	842	61
2017-04-04 15:51:04.96-04	2017-04-04 15:51:04.96-04	\N	3999	2	BACKER	3972	\N	836	54
2016-03-02 16:31:50.622-05	2016-03-02 16:31:50.622-05	\N	129	2	BACKER	178	\N	689	54
2017-03-09 13:29:55.806-05	2017-03-09 13:29:55.806-05	\N	3442	259	BACKER	3521	\N	754	80
2017-04-20 06:17:23.321-04	2017-04-20 06:17:23.321-04	\N	4348	59	BACKER	4200	\N	840	96
2017-01-18 08:54:51.032-05	2017-01-18 08:54:51.032-05	\N	2594	48	BACKER	2794	\N	697	100
2017-05-01 13:13:36.311-04	2017-05-01 13:13:36.311-04	\N	4550	516	BACKER	4371	\N	785	121
2017-05-15 08:07:59.716-04	2017-05-15 08:07:59.716-04	\N	4834	14	BACKER	4597	\N	799	125
2016-09-29 14:08:19.528-04	2016-09-29 14:08:19.528-04	\N	1328	275	ADMIN	1663	\N	686	\N
\N	\N	\N	1094	738	ADMIN	4721	\N	849	\N
\N	\N	\N	224	820	ADMIN	4726	\N	854	\N
2016-09-01 10:41:37.755-04	2016-09-01 10:41:37.755-04	\N	1094	2	BACKER	1388	\N	738	54
2016-06-06 15:04:36.955-04	2016-06-06 15:04:36.955-04	\N	551	2	BACKER	702	\N	781	54
2017-05-09 14:14:23.365-04	2017-05-09 14:14:23.365-04	\N	4720	2	BACKER	4500	\N	846	54
2016-12-18 20:41:29.216-05	2016-12-18 20:41:29.216-05	\N	2220	259	BACKER	2545	\N	699	80
2017-01-16 13:03:56.965-05	2017-01-16 13:03:56.965-05	\N	2561	48	BACKER	2772	\N	700	100
2017-05-09 01:59:17.562-04	2017-05-09 01:59:17.562-04	\N	4711	517	BACKER	4493	\N	711	105
2017-01-03 19:00:00-05	2017-01-03 19:00:00-05	\N	2431	430	ADMIN	2681	\N	703	\N
2016-09-29 14:32:00.998-04	2016-09-29 14:32:00.998-04	\N	1357	294	ADMIN	1692	\N	714	\N
2016-09-29 14:30:08.992-04	2016-09-29 14:30:08.992-04	\N	1354	292	ADMIN	1689	\N	715	\N
2016-09-29 14:28:08.494-04	2016-09-29 14:28:08.494-04	\N	1352	290	ADMIN	1687	\N	716	\N
2016-01-31 19:00:00-05	\N	\N	74	4	ADMIN	95	\N	845	\N
\N	\N	\N	308	798	ADMIN	4723	\N	851	\N
\N	\N	\N	883	839	ADMIN	4728	\N	856	\N
2016-03-01 23:42:00.064-05	2016-03-01 23:42:00.064-05	\N	126	13	BACKER	169	\N	704	\N
2016-11-30 11:11:42.605-05	2016-11-30 11:11:42.605-05	\N	1957	2	BACKER	2339	\N	710	54
2017-01-03 15:59:38.784-05	2017-01-03 15:59:38.784-05	\N	2416	2	BACKER	2665	\N	709	54
2016-11-17 12:43:31.221-05	2016-11-17 12:43:31.221-05	\N	1808	59	BACKER	2202	\N	708	96
2016-09-29 13:43:14.112-04	2016-09-29 13:43:14.112-04	\N	1303	259	ADMIN	1637	\N	702	\N
2016-09-29 13:44:40.454-04	2016-09-29 13:44:40.454-04	\N	1304	260	ADMIN	1638	\N	705	\N
\N	\N	\N	192	805	ADMIN	4724	\N	852	\N
2016-05-23 16:27:28.294-04	2016-05-23 16:27:28.294-04	\N	426	2	BACKER	573	\N	741	54
2016-09-13 00:15:05.534-04	2016-09-13 00:15:05.534-04	\N	1178	2	BACKER	1494	\N	788	54
2016-10-06 14:36:39.082-04	2016-10-06 14:36:39.082-04	\N	1438	2	BACKER	1815	\N	713	54
2016-10-07 12:49:20.388-04	2016-10-07 12:49:20.388-04	\N	1446	241	BACKER	1822	\N	712	83
2016-11-29 05:03:23.974-05	2016-11-29 05:03:23.974-05	\N	1908	301	BACKER	2296	\N	707	85
2016-11-22 10:22:40.419-05	2016-11-22 10:22:40.419-05	\N	1846	59	BACKER	2246	\N	701	96
2016-09-29 14:25:22.012-04	2016-09-29 14:25:22.012-04	\N	1348	288	ADMIN	1683	\N	724	\N
2016-01-31 19:00:00-05	\N	\N	73	3	ADMIN	94	\N	725	\N
2016-09-29 14:24:17.825-04	2016-09-29 14:24:17.825-04	\N	1345	287	ADMIN	1680	\N	727	\N
2016-09-29 14:24:17.83-04	2016-09-29 14:24:17.83-04	\N	1346	287	ADMIN	1681	\N	726	\N
2016-09-29 14:19:11.462-04	2016-09-29 14:19:11.462-04	\N	1343	286	ADMIN	1678	\N	728	\N
2016-09-29 14:16:52.145-04	2016-09-29 14:16:52.145-04	\N	1341	284	ADMIN	1676	\N	729	\N
2016-09-29 14:17:47.337-04	2016-09-29 14:17:47.337-04	\N	1342	285	ADMIN	1677	\N	730	\N
2016-09-29 14:14:46.62-04	2016-09-29 14:14:46.62-04	\N	1338	281	ADMIN	1673	\N	732	\N
2016-09-29 14:16:17.13-04	2016-09-29 14:16:17.13-04	\N	1340	283	ADMIN	1675	\N	731	\N
2016-09-29 14:15:23.948-04	2016-09-29 14:15:23.948-04	\N	1339	282	ADMIN	1674	\N	733	\N
2016-09-29 14:13:48.784-04	2016-09-29 14:13:48.784-04	\N	1337	280	ADMIN	1672	\N	734	\N
2016-09-29 14:11:53.87-04	2016-09-29 14:11:53.87-04	\N	1334	278	ADMIN	1669	\N	735	\N
2016-09-29 14:12:58.888-04	2016-09-29 14:12:58.888-04	\N	1336	279	ADMIN	1671	\N	736	\N
2016-09-07 18:13:23.641-04	2016-09-07 18:13:23.641-04	\N	1145	241	ADMIN	1457	\N	739	\N
2016-09-29 14:09:42.812-04	2016-09-29 14:09:42.812-04	\N	1330	276	ADMIN	1665	\N	740	\N
2016-09-29 14:06:44.758-04	2016-09-29 14:06:44.758-04	\N	1326	274	ADMIN	1661	\N	742	\N
2016-09-29 14:05:19.093-04	2016-09-29 14:05:19.093-04	\N	1323	272	ADMIN	1658	\N	745	\N
2016-09-29 14:05:19.101-04	2016-09-29 14:05:19.101-04	\N	1324	272	ADMIN	1659	\N	744	\N
2016-08-01 20:00:00-04	2016-08-01 20:00:00-04	\N	897	195	ADMIN	1150	\N	748	\N
2016-08-01 20:00:00-04	2016-08-01 20:00:00-04	\N	898	195	ADMIN	1151	\N	746	\N
2016-09-29 14:03:46.814-04	2016-09-29 14:03:46.814-04	\N	1322	271	ADMIN	1657	\N	749	\N
2016-09-29 14:02:54.576-04	2016-09-29 14:02:54.576-04	\N	1320	270	ADMIN	1655	\N	751	\N
2016-09-29 14:02:54.581-04	2016-09-29 14:02:54.581-04	\N	1321	270	ADMIN	1656	\N	752	\N
2016-09-29 14:01:49.724-04	2016-09-29 14:01:49.724-04	\N	1319	269	ADMIN	1654	\N	753	\N
2016-09-29 14:25:22-04	2016-09-29 14:25:22-04	\N	1347	288	ADMIN	1682	\N	756	\N
2016-01-31 19:00:00-05	\N	\N	68	15	ADMIN	89	\N	755	\N
2016-09-29 14:01:04.72-04	2016-09-29 14:01:04.72-04	\N	1317	268	ADMIN	1652	\N	758	\N
2016-09-29 14:01:04.753-04	2016-09-29 14:01:04.753-04	\N	1318	268	ADMIN	1653	\N	757	\N
2016-09-29 13:59:15.446-04	2016-09-29 13:59:15.446-04	\N	1316	266	ADMIN	1650	\N	760	\N
2016-09-29 13:58:16.643-04	2016-09-29 13:58:16.643-04	\N	1315	265	ADMIN	1649	\N	761	\N
2016-01-31 19:00:00-05	\N	\N	70	12	ADMIN	91	\N	763	\N
2016-09-29 13:54:53.485-04	2016-09-29 13:54:53.485-04	\N	1313	264	ADMIN	1647	\N	764	\N
2016-09-29 13:54:53.501-04	2016-09-29 13:54:53.501-04	\N	1314	264	ADMIN	1648	\N	765	\N
2016-09-29 14:00:01.891-04	2016-09-29 14:00:01.891-04	\N	1314	267	ADMIN	1651	\N	765	\N
2016-01-10 19:00:00-05	\N	\N	31	14	ADMIN	13	\N	766	\N
2016-09-29 13:53:00.559-04	2016-09-29 13:53:00.559-04	\N	1312	263	ADMIN	1646	\N	767	\N
2016-09-29 13:51:29.396-04	2016-09-29 13:51:29.396-04	\N	1310	262	ADMIN	1644	\N	770	\N
2016-09-29 13:51:29.377-04	2016-09-29 13:51:29.377-04	\N	1309	262	ADMIN	1643	\N	772	\N
2016-01-31 19:00:00-05	\N	\N	77	4	ADMIN	98	\N	773	\N
2016-01-31 19:00:00-05	\N	\N	72	3	ADMIN	93	\N	774	\N
2016-09-29 13:49:43.088-04	2016-09-29 13:49:43.088-04	\N	1308	261	ADMIN	1642	\N	777	\N
2016-01-31 19:00:00-05	\N	\N	78	4	ADMIN	99	\N	778	\N
2016-01-31 19:00:00-05	\N	\N	75	4	ADMIN	96	\N	779	\N
2016-09-29 13:49:43.081-04	2016-09-29 13:49:43.081-04	\N	1307	261	ADMIN	1641	\N	780	\N
2016-09-29 13:44:40.461-04	2016-09-29 13:44:40.461-04	\N	1305	260	ADMIN	1639	\N	783	\N
2016-01-31 19:00:00-05	\N	\N	76	4	ADMIN	97	\N	784	\N
2016-01-31 19:00:00-05	\N	\N	67	13	ADMIN	88	\N	787	\N
2016-09-29 13:53:00.559-04	2016-09-29 13:53:00.559-04	\N	1311	263	ADMIN	1645	\N	789	\N
2016-09-29 14:12:58.877-04	2016-09-29 14:12:58.877-04	\N	1335	279	ADMIN	1670	\N	790	\N
2016-01-10 19:00:00-05	\N	\N	32	14	ADMIN	14	\N	797	\N
2016-01-10 19:00:00-05	\N	\N	35	12	ADMIN	11	\N	806	\N
2016-03-18 20:00:00-04	2016-03-18 20:00:00-04	\N	170	59	ADMIN	247	\N	809	\N
2016-01-31 19:00:00-05	\N	\N	71	3	ADMIN	92	\N	816	\N
2016-01-10 19:00:00-05	\N	\N	33	13	ADMIN	12	\N	817	\N
2016-01-10 19:00:00-05	\N	\N	7	10	ADMIN	8	\N	821	\N
2016-01-10 19:00:00-05	\N	\N	37	10	ADMIN	10	\N	822	\N
2016-01-10 19:00:00-05	\N	\N	34	15	ADMIN	15	\N	823	\N
2016-01-10 19:00:00-05	\N	\N	36	10	ADMIN	9	\N	827	\N
2016-03-18 20:00:00-04	2016-03-18 20:00:00-04	\N	171	59	ADMIN	248	\N	826	\N
2016-09-29 14:11:53.863-04	2016-09-29 14:11:53.863-04	\N	1333	278	ADMIN	1668	\N	830	\N
2016-09-29 14:10:43.445-04	2016-09-29 14:10:43.445-04	\N	1332	277	ADMIN	1667	\N	831	\N
2016-09-29 14:08:19.514-04	2016-09-29 14:08:19.514-04	\N	1327	275	ADMIN	1662	\N	834	\N
2016-01-31 19:00:00-05	\N	\N	69	12	ADMIN	90	\N	835	\N
2016-09-29 14:06:00.979-04	2016-09-29 14:06:00.979-04	\N	1325	273	ADMIN	1660	\N	843	\N
2016-03-06 19:00:00-05	\N	\N	141	47	ADMIN	202	\N	844	\N
2015-05-02 20:00:00-04	\N	\N	28	2	ADMIN	5	\N	847	\N
2016-09-29 14:09:42.806-04	2016-09-29 14:09:42.806-04	\N	1329	276	ADMIN	1664	\N	687	\N
2017-04-03 12:22:45.962-04	2017-04-03 12:22:45.962-04	\N	3206	584	ADMIN	3950	\N	690	\N
2017-02-21 11:25:28.457-05	2017-02-21 11:25:28.457-05	\N	3	510	ADMIN	3325	\N	51	\N
2017-02-21 13:11:30.773-05	2017-02-21 13:11:30.773-05	\N	3	512	ADMIN	3331	\N	51	\N
2017-02-21 11:55:29.655-05	2017-02-21 11:55:29.655-05	\N	3	511	ADMIN	3327	\N	51	\N
2017-02-21 13:35:34.524-05	2017-02-21 13:35:34.524-05	\N	3	513	ADMIN	3333	\N	51	\N
2017-02-21 13:49:14.345-05	2017-02-21 13:49:14.345-05	\N	3	515	ADMIN	3337	\N	51	\N
2017-02-21 14:02:21.568-05	2017-02-21 14:02:21.568-05	\N	3	516	ADMIN	3340	\N	51	\N
2017-02-21 14:07:25.188-05	2017-02-21 14:07:25.188-05	\N	3	517	ADMIN	3342	\N	51	\N
2017-02-21 14:13:03.394-05	2017-02-21 14:13:03.394-05	\N	3	518	ADMIN	3344	\N	51	\N
2017-02-21 14:25:28.725-05	2017-02-21 14:25:28.725-05	\N	3	519	ADMIN	3346	\N	51	\N
2017-02-21 14:34:47.02-05	2017-02-21 14:34:47.02-05	\N	3	520	ADMIN	3348	\N	51	\N
2017-02-21 14:39:46.239-05	2017-02-21 14:39:46.239-05	\N	3	521	ADMIN	3350	\N	51	\N
2017-02-21 14:45:19.169-05	2017-02-21 14:45:19.169-05	\N	3	522	ADMIN	3352	\N	51	\N
2017-02-21 15:04:48.979-05	2017-02-21 15:04:48.979-05	\N	3	523	ADMIN	3354	\N	51	\N
2017-02-21 15:11:44.767-05	2017-02-21 15:11:44.767-05	\N	3	524	ADMIN	3356	\N	51	\N
2017-02-21 15:16:59.092-05	2017-02-21 15:16:59.092-05	\N	3	525	ADMIN	3358	\N	51	\N
2016-03-06 19:00:00-05	\N	\N	142	48	ADMIN	204	\N	696	\N
2016-09-29 14:19:11.467-04	2016-09-29 14:19:11.467-04	\N	1344	286	ADMIN	1679	\N	698	\N
2016-09-29 14:41:11.097-04	2016-09-29 14:41:11.097-04	\N	1374	300	ADMIN	1708	\N	706	\N
\N	\N	\N	129	689	ADMIN	4720	\N	848	\N
\N	\N	\N	884	750	ADMIN	4722	\N	850	\N
\N	\N	\N	303	808	ADMIN	4725	\N	853	\N
\N	\N	\N	283	824	ADMIN	4727	\N	855	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                             4017.dat                                                                                            0000600 0004000 0002000 00000162062 13174666341 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8141	email	mailinglist.host	t	2017-02-21 15:04:49.157-05	2017-02-21 15:04:49.157-05	3	523	http://****
8147	email	mailinglist.host	t	2017-02-21 15:11:44.894-05	2017-02-21 15:11:44.894-05	3	524	http://****
8153	email	mailinglist.host	t	2017-02-21 15:16:59.184-05	2017-02-21 15:16:59.184-05	3	525	http://****
595	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	286	http://****
596	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	287	http://****
597	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	195	http://****
598	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	288	http://****
599	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	289	http://****
735	email	mailinglist.backers	t	2016-10-10 16:37:16.762-04	2016-10-10 16:37:16.762-04	108	2	http://****
16243	email	mailinglist.backers	t	2017-05-09 14:14:23.366-04	2017-05-09 14:14:23.366-04	4720	2	http://****
1360	email	mailinglist.backers	t	2016-10-10 16:37:16.984-04	2016-10-10 16:37:16.984-04	686	2	http://****
1911	email	mailinglist.backers	t	2016-10-10 16:37:17.146-04	2016-10-10 16:37:17.146-04	1178	2	http://****
2645	email	mailinglist.backers	t	2016-11-22 10:22:40.421-05	2016-11-22 10:22:40.421-05	1846	59	http://****
6351	email	mailinglist.backers	t	2017-01-14 12:11:43.288-05	2017-01-14 12:11:43.288-05	2549	270	http://****
6368	email	mailinglist.backers	t	2017-01-16 13:03:56.966-05	2017-01-16 13:03:56.966-05	2561	48	http://****
6433	email	mailinglist.backers	t	2017-01-18 08:54:51.032-05	2017-01-18 08:54:51.032-05	2594	48	http://****
16640	email	mailinglist.backers	t	2017-05-15 08:07:59.717-04	2017-05-15 08:07:59.717-04	4834	14	http://****
7122	email	mailinglist.backers	t	2017-02-01 12:30:50.441-05	2017-02-01 12:30:50.441-05	2906	271	http://****
7610	email	mailinglist.backers	t	2017-02-10 11:47:34.942-05	2017-02-10 11:47:34.942-05	3053	15	http://****
8040	email	mailinglist.host	t	2017-02-21 11:25:28.556-05	2017-02-21 11:25:28.556-05	3	510	http://****
8048	email	mailinglist.host	t	2017-02-21 11:55:29.765-05	2017-02-21 11:55:29.765-05	3	511	http://****
8064	email	mailinglist.host	t	2017-02-21 13:11:30.856-05	2017-02-21 13:11:30.856-05	3	512	http://****
8074	email	mailinglist.host	t	2017-02-21 13:35:34.614-05	2017-02-21 13:35:34.614-05	3	513	http://****
8140	email	collective.monthlyreport	t	2017-02-21 15:04:48.984-05	2017-02-21 15:04:48.984-05	3	523	http://****
8146	email	collective.monthlyreport	t	2017-02-21 15:11:44.769-05	2017-02-21 15:11:44.769-05	3	524	http://****
8152	email	collective.monthlyreport	t	2017-02-21 15:16:59.094-05	2017-02-21 15:16:59.094-05	3	525	http://****
8039	email	collective.monthlyreport	t	2017-02-21 11:25:28.459-05	2017-02-21 11:25:28.459-05	3	510	http://****
8047	email	collective.monthlyreport	t	2017-02-21 11:55:29.66-05	2017-02-21 11:55:29.66-05	3206	511	http://****
8063	email	collective.monthlyreport	t	2017-02-21 13:11:30.775-05	2017-02-21 13:11:30.775-05	3	512	http://****
8073	email	collective.monthlyreport	t	2017-02-21 13:35:34.526-05	2017-02-21 13:35:34.526-05	3	513	http://****
8142	email	collective.transaction.created	t	2017-02-21 15:04:49.157-05	2017-02-21 15:04:49.157-05	3	523	http://****
8148	email	collective.transaction.created	t	2017-02-21 15:11:44.895-05	2017-02-21 15:11:44.895-05	3	524	http://****
8154	email	collective.transaction.created	t	2017-02-21 15:16:59.185-05	2017-02-21 15:16:59.185-05	3	525	http://****
8041	email	collective.transaction.created	t	2017-02-21 11:25:28.556-05	2017-02-21 11:25:28.556-05	3	510	http://****
8049	email	collective.transaction.created	t	2017-02-21 11:55:29.765-05	2017-02-21 11:55:29.765-05	3	511	http://****
8065	email	collective.transaction.created	t	2017-02-21 13:11:30.856-05	2017-02-21 13:11:30.856-05	3	512	http://****
8145	email	collective.expense.created	t	2017-02-21 15:11:44.769-05	2017-02-21 15:11:44.769-05	3	524	http://****
8151	email	collective.expense.created	t	2017-02-21 15:16:59.094-05	2017-02-21 15:16:59.094-05	3	525	http://****
2919	email	collective.expense.created	t	2016-11-28 17:28:52.444-05	2017-01-10 19:00:00-05	3	295	http://****
2926	email	collective.expense.created	t	2016-11-28 17:28:52.445-05	2017-01-10 19:00:00-05	3	288	http://****
2931	email	collective.expense.created	t	2016-11-28 17:28:52.446-05	2017-01-10 19:00:00-05	3	283	http://****
2936	email	collective.expense.created	t	2016-11-28 17:28:52.447-05	2017-01-10 19:00:00-05	3	278	http://****
5772	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1339	282	http://****
5558	email	collective.expense.created	f	2016-12-28 19:13:56.268-05	2017-01-17 19:00:00-05	34	15	http://****
5789	email	collective.expense.created	f	2016-12-28 19:13:56.345-05	2017-01-17 19:00:00-05	1371	300	http://****
16437	email	collective.donation.created	f	2017-05-11 12:41:40.872-04	2017-05-11 12:41:40.872-04	171	59	http://****
8088	email	mailinglist.host	t	2017-02-21 13:49:14.435-05	2017-02-21 13:49:14.435-05	3	515	http://****
8095	email	mailinglist.host	t	2017-02-21 14:02:21.647-05	2017-02-21 14:02:21.647-05	3	516	http://****
16332	email	mailinglist.backers	t	2017-05-10 19:45:46.805-04	2017-05-10 19:45:46.805-04	4749	522	http://****
8426	email	mailinglist.backers	f	2017-02-27 19:25:20.393-05	2017-02-27 19:25:20.393-05	3301	522	http://****
12034	email	mailinglist.backers	t	2017-03-09 13:29:55.807-05	2017-03-09 13:29:55.807-05	3442	259	http://****
16214	email	mailinglist.backers	t	2017-05-09 01:59:17.564-04	2017-05-09 01:59:17.564-04	4711	517	http://****
13800	email	mailinglist.host	t	2017-04-03 12:22:46.049-04	2017-04-03 12:22:46.049-04	3	584	http://****
13887	email	mailinglist.backers	t	2017-04-04 15:51:04.96-04	2017-04-04 15:51:04.96-04	3999	2	http://****
14398	email	mailinglist.backers	t	2017-04-10 21:09:50.696-04	2017-04-10 21:09:50.696-04	4153	13	http://****
14447	email	mailinglist.backers	t	2017-04-11 22:05:36.091-04	2017-04-11 22:05:36.091-04	4173	13	http://****
15002	email	mailinglist.backers	t	2017-04-20 06:17:23.322-04	2017-04-20 06:17:23.322-04	4348	59	http://****
15657	email	mailinglist.backers	t	2017-04-30 21:40:31.704-04	2017-04-30 21:40:31.704-04	3419	516	http://****
15717	email	mailinglist.backers	t	2017-05-01 13:13:36.324-04	2017-05-01 13:13:36.324-04	4550	516	http://****
79	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	2	http://****
80	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	3	http://****
81	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	4	http://****
82	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	10	http://****
83	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	12	http://****
84	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	13	http://****
85	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	14	http://****
86	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	15	http://****
87	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	47	http://****
88	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	48	http://****
89	slack	all	t	2016-07-18 20:00:00-04	2016-07-18 20:00:00-04	\N	59	http://****
566	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	261	http://****
567	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	10	http://****
568	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	268	http://****
569	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	262	http://****
570	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	269	http://****
8087	email	collective.monthlyreport	t	2017-02-21 13:49:14.347-05	2017-02-21 13:49:14.347-05	3	515	http://****
8094	email	collective.monthlyreport	t	2017-02-21 14:02:21.57-05	2017-02-21 14:02:21.57-05	3	516	http://****
13799	email	collective.monthlyreport	t	2017-04-03 12:22:45.964-04	2017-04-03 12:22:45.964-04	3206	584	http://****
8089	email	collective.transaction.created	t	2017-02-21 13:49:14.436-05	2017-02-21 13:49:14.436-05	3	515	http://****
13801	email	collective.transaction.created	t	2017-04-03 12:22:46.049-04	2017-04-03 12:22:46.049-04	3	584	http://****
70	email	collective.transaction.created	t	2016-07-06 20:00:00-04	2016-07-06 20:00:00-04	577	4	http://****
39	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	142	48	http://****
40	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	28	2	http://****
41	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	33	13	http://****
42	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	67	13	http://****
43	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	71	3	http://****
44	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	72	3	http://****
45	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	73	3	http://****
46	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	170	59	http://****
47	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	171	59	http://****
48	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	35	12	http://****
49	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	69	12	http://****
50	email	collective.transaction.created	t	2016-06-09 20:00:00-04	2016-06-09 20:00:00-04	70	12	http://****
8093	email	collective.expense.created	t	2017-02-21 14:02:21.57-05	2017-02-21 14:02:21.57-05	3	516	http://****
13798	email	collective.expense.created	t	2017-04-03 12:22:45.964-04	2017-04-03 12:22:45.964-04	3206	584	http://****
13802	email	collective.expense.created	t	2017-04-03 12:22:46.05-04	2017-04-03 12:22:46.05-04	3	584	http://****
571	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	263	http://****
572	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	270	http://****
573	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	264	http://****
574	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	265	http://****
575	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	15	http://****
576	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	259	http://****
577	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	266	http://****
578	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	271	http://****
579	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	260	http://****
580	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	267	http://****
581	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	272	http://****
582	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	273	http://****
583	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	14	http://****
584	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	274	http://****
585	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	275	http://****
586	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	276	http://****
587	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	277	http://****
588	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	279	http://****
589	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	280	http://****
590	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	281	http://****
591	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	282	http://****
592	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	283	http://****
593	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	284	http://****
594	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	285	http://****
600	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	290	http://****
601	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	291	http://****
602	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	292	http://****
603	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	293	http://****
604	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	294	http://****
605	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	295	http://****
606	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	297	http://****
607	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	298	http://****
608	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	299	http://****
609	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	13	http://****
610	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	278	http://****
611	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	59	http://****
612	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	2	http://****
613	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	51	http://****
614	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	241	http://****
615	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	3	http://****
616	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	48	http://****
617	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	47	http://****
618	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	4	http://****
619	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	300	http://****
620	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	301	http://****
621	email	group.transactions.created	t	2016-10-04 16:38:40-04	2016-10-04 16:38:40-04	3	12	http://****
655	email	mailinglist.backers	t	2016-10-10 16:37:16.676-04	2016-10-10 16:37:16.676-04	126	13	http://****
658	email	mailinglist.backers	t	2016-10-10 16:37:16.677-04	2016-10-10 16:37:16.677-04	2	10	http://****
698	email	mailinglist.backers	t	2016-10-10 16:37:16.722-04	2016-10-10 16:37:16.722-04	2	13	http://****
865	email	mailinglist.backers	t	2016-10-10 16:37:16.826-04	2016-10-10 16:37:16.826-04	192	2	http://****
1003	email	mailinglist.backers	t	2016-10-10 16:37:16.887-04	2016-10-10 16:37:16.887-04	308	2	http://****
680	email	mailinglist.backers	t	2016-10-10 16:37:16.704-04	2016-10-10 16:37:16.704-04	30	12	http://****
690	email	mailinglist.backers	t	2016-10-10 16:37:16.719-04	2016-10-10 16:37:16.719-04	30	14	http://****
691	email	mailinglist.backers	t	2016-10-10 16:37:16.72-04	2016-10-10 16:37:16.72-04	80	10	http://****
697	email	mailinglist.backers	t	2016-10-10 16:37:16.722-04	2016-10-10 16:37:16.722-04	8	14	http://****
912	email	mailinglist.backers	t	2016-10-10 16:37:16.84-04	2016-10-10 16:37:16.84-04	224	2	http://****
990	email	mailinglist.backers	t	2016-10-10 16:37:16.883-04	2016-10-10 16:37:16.883-04	303	13	http://****
1089	email	mailinglist.backers	t	2016-10-10 16:37:16.922-04	2016-10-10 16:37:16.922-04	392	2	http://****
692	email	mailinglist.backers	t	2016-10-10 16:37:16.72-04	2016-10-10 16:37:16.72-04	30	13	http://****
799	email	mailinglist.backers	t	2016-10-10 16:37:16.803-04	2016-10-10 16:37:16.803-04	129	2	http://****
987	email	mailinglist.backers	t	2016-10-10 16:37:16.883-04	2016-10-10 16:37:16.883-04	283	13	http://****
1244	email	mailinglist.backers	t	2016-10-10 16:37:16.958-04	2016-10-10 16:37:16.958-04	8	3	http://****
1322	email	mailinglist.backers	t	2016-10-10 16:37:16.976-04	2016-10-10 16:37:16.976-04	642	48	http://****
1232	email	mailinglist.backers	t	2016-10-10 16:37:16.955-04	2016-10-10 16:37:16.955-04	551	2	http://****
1237	email	mailinglist.backers	t	2016-10-10 16:37:16.956-04	2016-10-10 16:37:16.956-04	555	13	http://****
1321	email	mailinglist.backers	t	2016-10-10 16:37:16.975-04	2016-10-10 16:37:16.975-04	642	4	http://****
1128	email	mailinglist.backers	t	2016-10-10 16:37:16.931-04	2016-10-10 16:37:16.931-04	426	2	http://****
1320	email	mailinglist.backers	t	2016-10-10 16:37:16.975-04	2016-10-10 16:37:16.975-04	642	12	http://****
1325	email	mailinglist.backers	t	2016-10-10 16:37:16.976-04	2016-10-10 16:37:16.976-04	646	2	http://****
1595	email	mailinglist.backers	t	2016-10-10 16:37:17.04-04	2016-10-10 16:37:17.04-04	884	2	http://****
1609	email	mailinglist.backers	t	2016-10-10 16:37:17.062-04	2016-10-10 16:37:17.062-04	896	4	http://****
1594	email	mailinglist.backers	t	2016-10-10 16:37:17.04-04	2016-10-10 16:37:17.04-04	883	2	http://****
1805	email	mailinglist.backers	t	2016-10-10 16:37:17.119-04	2016-10-10 16:37:17.119-04	1094	2	http://****
1888	email	mailinglist.backers	t	2016-10-10 16:37:17.141-04	2016-10-10 16:37:17.141-04	1158	241	http://****
1961	email	mailinglist.backers	t	2016-10-10 16:37:17.158-04	2016-10-10 16:37:17.158-04	1244	4	http://****
1985	email	mailinglist.backers	t	2016-10-10 16:37:17.168-04	2016-10-10 16:37:17.168-04	1263	59	http://****
2045	email	mailinglist.backers	t	2016-10-10 16:37:17.194-04	2016-10-10 16:37:17.194-04	1299	2	http://****
2233	email	mailinglist.backers	t	2016-10-10 16:37:17.237-04	2016-10-10 16:37:17.237-04	1446	241	http://****
2226	email	mailinglist.backers	t	2016-10-10 16:37:17.235-04	2016-10-10 16:37:17.235-04	1438	2	http://****
2392	email	collective.monthlyreport	t	2016-11-06 19:37:19.104-05	2016-11-06 19:37:19.104-05	1303	259	http://****
2397	email	collective.monthlyreport	t	2016-11-06 19:37:19.104-05	2016-11-06 19:37:19.104-05	1309	262	http://****
2401	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1313	264	http://****
2406	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1317	268	http://****
2411	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1322	271	http://****
2416	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1327	275	http://****
2421	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1332	277	http://****
2426	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1337	280	http://****
2431	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1342	285	http://****
2436	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1347	288	http://****
2441	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1352	290	http://****
2446	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1357	294	http://****
2451	email	collective.monthlyreport	t	2016-11-06 19:37:19.111-05	2016-11-06 19:37:19.111-05	1362	297	http://****
2456	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1366	298	http://****
2461	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1372	300	http://****
2466	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1376	301	http://****
2597	email	mailinglist.backers	t	2016-11-17 12:43:31.222-05	2016-11-17 12:43:31.222-05	1808	59	http://****
2697	email	mailinglist.backers	t	2016-11-28 10:33:15.871-05	2016-11-28 10:33:15.871-05	1890	2	http://****
3000	email	mailinglist.backers	t	2016-11-29 05:03:23.975-05	2016-11-29 05:03:23.975-05	1908	301	http://****
3047	email	mailinglist.backers	t	2016-11-30 11:11:42.607-05	2016-11-30 11:11:42.607-05	1957	2	http://****
3286	email	mailinglist.backers	t	2016-12-18 20:41:29.217-05	2016-12-18 20:41:29.217-05	2220	259	http://****
6045	email	mailinglist.backers	t	2017-01-03 15:59:38.785-05	2017-01-03 15:59:38.785-05	2416	2	http://****
2917	email	collective.expense.created	t	2016-11-28 17:28:52.443-05	2017-01-10 19:00:00-05	3	298	http://****
2922	email	collective.expense.created	t	2016-11-28 17:28:52.445-05	2017-01-10 19:00:00-05	3	292	http://****
2927	email	collective.expense.created	t	2016-11-28 17:28:52.446-05	2017-01-10 19:00:00-05	3	287	http://****
2932	email	collective.expense.created	t	2016-11-28 17:28:52.447-05	2017-01-10 19:00:00-05	3	282	http://****
2937	email	collective.expense.created	t	2016-11-28 17:28:52.448-05	2017-01-10 19:00:00-05	3	277	http://****
2942	email	collective.expense.created	t	2016-11-28 17:28:52.449-05	2017-01-10 19:00:00-05	3	272	http://****
2947	email	collective.expense.created	t	2016-11-28 17:28:52.45-05	2017-01-10 19:00:00-05	3	267	http://****
2953	email	collective.expense.created	t	2016-11-28 17:28:52.451-05	2017-01-10 19:00:00-05	3	261	http://****
2897	email	collective.expense.created	t	2016-11-28 17:28:52.436-05	2017-01-10 19:00:00-05	3	241	http://****
2915	email	collective.expense.created	t	2016-11-28 17:28:52.443-05	2017-01-10 19:00:00-05	3	300	http://****
2920	email	collective.expense.created	t	2016-11-28 17:28:52.444-05	2017-01-10 19:00:00-05	3	294	http://****
2925	email	collective.expense.created	t	2016-11-28 17:28:52.445-05	2017-01-10 19:00:00-05	3	289	http://****
2929	email	collective.expense.created	t	2016-11-28 17:28:52.446-05	2017-01-10 19:00:00-05	3	285	http://****
2935	email	collective.expense.created	t	2016-11-28 17:28:52.447-05	2017-01-10 19:00:00-05	3	279	http://****
2939	email	collective.expense.created	t	2016-11-28 17:28:52.448-05	2017-01-10 19:00:00-05	3	275	http://****
7114	email	mailinglist.backers	t	2017-02-01 10:16:22.45-05	2017-02-01 10:16:22.45-05	2898	48	http://****
8101	email	mailinglist.host	t	2017-02-21 14:07:25.322-05	2017-02-21 14:07:25.322-05	3	517	http://****
8107	email	mailinglist.host	t	2017-02-21 14:13:03.539-05	2017-02-21 14:13:03.539-05	3	518	http://****
8113	email	mailinglist.host	t	2017-02-21 14:25:28.823-05	2017-02-21 14:25:28.823-05	3	519	http://****
8119	email	mailinglist.host	t	2017-02-21 14:34:47.428-05	2017-02-21 14:34:47.428-05	3	520	http://****
8125	email	mailinglist.host	t	2017-02-21 14:39:46.291-05	2017-02-21 14:39:46.291-05	3	521	http://****
8131	email	mailinglist.host	t	2017-02-21 14:45:19.314-05	2017-02-21 14:45:19.314-05	3	522	http://****
8144	email	mailinglist.admins	t	2017-02-21 15:11:44.768-05	2017-02-21 15:11:44.768-05	3	524	http://****
8150	email	mailinglist.admins	t	2017-02-21 15:16:59.093-05	2017-02-21 15:16:59.093-05	3	525	http://****
763	email	mailinglist.admins	t	2016-10-10 16:37:16.793-04	2016-10-10 16:37:16.793-04	70	12	http://****
764	email	mailinglist.admins	t	2016-10-10 16:37:16.793-04	2016-10-10 16:37:16.793-04	71	3	http://****
769	email	mailinglist.admins	t	2016-10-10 16:37:16.795-04	2016-10-10 16:37:16.795-04	76	4	http://****
2052	email	mailinglist.admins	t	2016-10-10 16:37:17.196-04	2016-10-10 16:37:17.196-04	1307	261	http://****
2059	email	mailinglist.admins	t	2016-10-10 16:37:17.197-04	2016-10-10 16:37:17.197-04	1314	264	http://****
2064	email	mailinglist.admins	t	2016-10-10 16:37:17.198-04	2016-10-10 16:37:17.198-04	1318	268	http://****
8099	email	collective.monthlyreport	t	2017-02-21 14:07:25.189-05	2017-02-21 14:07:25.189-05	3	517	http://****
8106	email	collective.monthlyreport	t	2017-02-21 14:13:03.397-05	2017-02-21 14:13:03.397-05	3	518	http://****
8112	email	collective.monthlyreport	t	2017-02-21 14:25:28.726-05	2017-02-21 14:25:28.726-05	3	519	http://****
8118	email	collective.monthlyreport	t	2017-02-21 14:34:47.023-05	2017-02-21 14:34:47.023-05	3	520	http://****
8124	email	collective.monthlyreport	t	2017-02-21 14:39:46.24-05	2017-02-21 14:39:46.24-05	3	521	http://****
8130	email	collective.monthlyreport	t	2017-02-21 14:45:19.171-05	2017-02-21 14:45:19.171-05	3	522	http://****
8075	email	collective.transaction.created	t	2017-02-21 13:35:34.614-05	2017-02-21 13:35:34.614-05	3	513	http://****
8096	email	collective.transaction.created	t	2017-02-21 14:02:21.647-05	2017-02-21 14:02:21.647-05	3	516	http://****
8102	email	collective.transaction.created	t	2017-02-21 14:07:25.322-05	2017-02-21 14:07:25.322-05	3	517	http://****
8108	email	collective.transaction.created	t	2017-02-21 14:13:03.539-05	2017-02-21 14:13:03.539-05	3	518	http://****
8114	email	collective.transaction.created	t	2017-02-21 14:25:28.823-05	2017-02-21 14:25:28.823-05	3	519	http://****
5770	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1337	280	http://****
5759	email	collective.expense.created	f	2016-12-28 19:13:56.34-05	2017-01-17 19:00:00-05	1317	268	http://****
5760	email	collective.expense.created	f	2016-12-28 19:13:56.34-05	2017-01-17 19:00:00-05	1319	269	http://****
5788	email	collective.expense.created	f	2016-12-28 19:13:56.344-05	2017-01-17 19:00:00-05	1365	298	http://****
5781	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1353	291	http://****
5765	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1325	273	http://****
5782	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1354	292	http://****
5768	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1331	277	http://****
8037	email	mailinglist.admins	t	2017-02-21 11:25:28.458-05	2017-02-21 11:25:28.458-05	3	510	http://****
8045	email	mailinglist.admins	t	2017-02-21 11:55:29.657-05	2017-02-21 11:55:29.657-05	3206	511	http://****
8061	email	mailinglist.admins	t	2017-02-21 13:11:30.774-05	2017-02-21 13:11:30.774-05	3	512	http://****
8071	email	mailinglist.admins	t	2017-02-21 13:35:34.525-05	2017-02-21 13:35:34.525-05	3	513	http://****
8085	email	mailinglist.admins	t	2017-02-21 13:49:14.347-05	2017-02-21 13:49:14.347-05	3	515	http://****
8092	email	mailinglist.admins	t	2017-02-21 14:02:21.569-05	2017-02-21 14:02:21.569-05	3	516	http://****
13797	email	mailinglist.admins	t	2017-04-03 12:22:45.963-04	2017-04-03 12:22:45.963-04	3206	584	http://****
624	email	mailinglist.admins	t	2016-10-10 16:37:16.649-04	2016-10-10 16:37:16.649-04	7	10	http://****
625	email	mailinglist.admins	t	2016-10-10 16:37:16.65-04	2016-10-10 16:37:16.65-04	36	10	http://****
626	email	mailinglist.admins	t	2016-10-10 16:37:16.65-04	2016-10-10 16:37:16.65-04	37	10	http://****
627	email	mailinglist.admins	t	2016-10-10 16:37:16.651-04	2016-10-10 16:37:16.651-04	35	12	http://****
628	email	mailinglist.admins	t	2016-10-10 16:37:16.652-04	2016-10-10 16:37:16.652-04	33	13	http://****
629	email	mailinglist.admins	t	2016-10-10 16:37:16.652-04	2016-10-10 16:37:16.652-04	31	14	http://****
630	email	mailinglist.admins	t	2016-10-10 16:37:16.654-04	2016-10-10 16:37:16.654-04	32	14	http://****
633	email	mailinglist.admins	t	2016-10-10 16:37:16.654-04	2016-10-10 16:37:16.654-04	34	15	http://****
669	email	mailinglist.admins	t	2016-10-10 16:37:16.688-04	2016-10-10 16:37:16.688-04	141	47	http://****
671	email	mailinglist.admins	t	2016-10-10 16:37:16.69-04	2016-10-10 16:37:16.69-04	142	48	http://****
765	email	mailinglist.admins	t	2016-10-10 16:37:16.794-04	2016-10-10 16:37:16.794-04	72	3	http://****
770	email	mailinglist.admins	t	2016-10-10 16:37:16.795-04	2016-10-10 16:37:16.795-04	77	4	http://****
705	email	mailinglist.admins	t	2016-10-10 16:37:16.725-04	2016-10-10 16:37:16.725-04	28	2	http://****
844	email	mailinglist.admins	t	2016-10-10 16:37:16.819-04	2016-10-10 16:37:16.819-04	170	59	http://****
761	email	mailinglist.admins	t	2016-10-10 16:37:16.792-04	2016-10-10 16:37:16.792-04	68	15	http://****
768	email	mailinglist.admins	t	2016-10-10 16:37:16.795-04	2016-10-10 16:37:16.795-04	75	4	http://****
760	email	mailinglist.admins	t	2016-10-10 16:37:16.792-04	2016-10-10 16:37:16.792-04	67	13	http://****
766	email	mailinglist.admins	t	2016-10-10 16:37:16.794-04	2016-10-10 16:37:16.794-04	73	3	http://****
771	email	mailinglist.admins	t	2016-10-10 16:37:16.796-04	2016-10-10 16:37:16.796-04	78	4	http://****
762	email	mailinglist.admins	t	2016-10-10 16:37:16.793-04	2016-10-10 16:37:16.793-04	69	12	http://****
767	email	mailinglist.admins	t	2016-10-10 16:37:16.794-04	2016-10-10 16:37:16.794-04	74	4	http://****
845	email	mailinglist.admins	t	2016-10-10 16:37:16.819-04	2016-10-10 16:37:16.819-04	171	59	http://****
1261	email	mailinglist.admins	t	2016-10-10 16:37:16.962-04	2016-10-10 16:37:16.962-04	577	4	http://****
1613	email	mailinglist.admins	t	2016-10-10 16:37:17.063-04	2016-10-10 16:37:17.063-04	898	195	http://****
1612	email	mailinglist.admins	t	2016-10-10 16:37:17.063-04	2016-10-10 16:37:17.063-04	897	195	http://****
1873	email	mailinglist.admins	t	2016-10-10 16:37:17.137-04	2016-10-10 16:37:17.137-04	1145	241	http://****
2069	email	mailinglist.admins	t	2016-10-10 16:37:17.199-04	2016-10-10 16:37:17.199-04	1323	272	http://****
2075	email	mailinglist.admins	t	2016-10-10 16:37:17.201-04	2016-10-10 16:37:17.201-04	1329	276	http://****
2080	email	mailinglist.admins	t	2016-10-10 16:37:17.202-04	2016-10-10 16:37:17.202-04	1334	278	http://****
2085	email	mailinglist.admins	t	2016-10-10 16:37:17.203-04	2016-10-10 16:37:17.203-04	1339	282	http://****
2091	email	mailinglist.admins	t	2016-10-10 16:37:17.204-04	2016-10-10 16:37:17.204-04	1345	287	http://****
2096	email	mailinglist.admins	t	2016-10-10 16:37:17.205-04	2016-10-10 16:37:17.205-04	1350	289	http://****
2100	email	mailinglist.admins	t	2016-10-10 16:37:17.206-04	2016-10-10 16:37:17.206-04	1355	292	http://****
2104	email	mailinglist.admins	t	2016-10-10 16:37:17.207-04	2016-10-10 16:37:17.207-04	1358	294	http://****
2109	email	mailinglist.admins	t	2016-10-10 16:37:17.208-04	2016-10-10 16:37:17.208-04	1363	297	http://****
2114	email	mailinglist.admins	t	2016-10-10 16:37:17.209-04	2016-10-10 16:37:17.209-04	1368	299	http://****
2119	email	mailinglist.admins	t	2016-10-10 16:37:17.21-04	2016-10-10 16:37:17.21-04	1374	300	http://****
2124	email	mailinglist.admins	t	2016-10-10 16:37:17.212-04	2016-10-10 16:37:17.212-04	1377	301	http://****
2049	email	mailinglist.admins	t	2016-10-10 16:37:17.195-04	2016-10-10 16:37:17.195-04	1304	260	http://****
2055	email	mailinglist.admins	t	2016-10-10 16:37:17.196-04	2016-10-10 16:37:17.196-04	1310	262	http://****
2060	email	mailinglist.admins	t	2016-10-10 16:37:17.197-04	2016-10-10 16:37:17.197-04	1315	265	http://****
2065	email	mailinglist.admins	t	2016-10-10 16:37:17.198-04	2016-10-10 16:37:17.198-04	1319	269	http://****
2070	email	mailinglist.admins	t	2016-10-10 16:37:17.199-04	2016-10-10 16:37:17.199-04	1324	272	http://****
2076	email	mailinglist.admins	t	2016-10-10 16:37:17.201-04	2016-10-10 16:37:17.201-04	1330	276	http://****
2081	email	mailinglist.admins	t	2016-10-10 16:37:17.202-04	2016-10-10 16:37:17.202-04	1335	279	http://****
2086	email	mailinglist.admins	t	2016-10-10 16:37:17.203-04	2016-10-10 16:37:17.203-04	1340	283	http://****
2090	email	mailinglist.admins	t	2016-10-10 16:37:17.204-04	2016-10-10 16:37:17.204-04	1344	286	http://****
2093	email	mailinglist.admins	t	2016-10-10 16:37:17.204-04	2016-10-10 16:37:17.204-04	1347	288	http://****
2101	email	mailinglist.admins	t	2016-10-10 16:37:17.206-04	2016-10-10 16:37:17.206-04	1354	292	http://****
2107	email	mailinglist.admins	t	2016-10-10 16:37:17.208-04	2016-10-10 16:37:17.208-04	1360	295	http://****
2112	email	mailinglist.admins	t	2016-10-10 16:37:17.209-04	2016-10-10 16:37:17.209-04	1367	298	http://****
2117	email	mailinglist.admins	t	2016-10-10 16:37:17.21-04	2016-10-10 16:37:17.21-04	1371	300	http://****
2122	email	mailinglist.admins	t	2016-10-10 16:37:17.211-04	2016-10-10 16:37:17.211-04	1379	301	http://****
2050	email	mailinglist.admins	t	2016-10-10 16:37:17.195-04	2016-10-10 16:37:17.195-04	1305	260	http://****
2056	email	mailinglist.admins	t	2016-10-10 16:37:17.196-04	2016-10-10 16:37:17.196-04	1311	263	http://****
2061	email	mailinglist.admins	t	2016-10-10 16:37:17.197-04	2016-10-10 16:37:17.197-04	1316	266	http://****
2066	email	mailinglist.admins	t	2016-10-10 16:37:17.199-04	2016-10-10 16:37:17.199-04	1320	270	http://****
2071	email	mailinglist.admins	t	2016-10-10 16:37:17.2-04	2016-10-10 16:37:17.2-04	1325	273	http://****
2072	email	mailinglist.admins	t	2016-10-10 16:37:17.2-04	2016-10-10 16:37:17.2-04	1326	274	http://****
2077	email	mailinglist.admins	t	2016-10-10 16:37:17.201-04	2016-10-10 16:37:17.201-04	1331	277	http://****
2082	email	mailinglist.admins	t	2016-10-10 16:37:17.202-04	2016-10-10 16:37:17.202-04	1336	279	http://****
2087	email	mailinglist.admins	t	2016-10-10 16:37:17.203-04	2016-10-10 16:37:17.203-04	1341	284	http://****
2094	email	mailinglist.admins	t	2016-10-10 16:37:17.205-04	2016-10-10 16:37:17.205-04	1348	288	http://****
2099	email	mailinglist.admins	t	2016-10-10 16:37:17.206-04	2016-10-10 16:37:17.206-04	1353	291	http://****
2106	email	mailinglist.admins	t	2016-10-10 16:37:17.207-04	2016-10-10 16:37:17.207-04	1361	295	http://****
2111	email	mailinglist.admins	t	2016-10-10 16:37:17.208-04	2016-10-10 16:37:17.208-04	1365	298	http://****
2116	email	mailinglist.admins	t	2016-10-10 16:37:17.21-04	2016-10-10 16:37:17.21-04	1370	299	http://****
2121	email	mailinglist.admins	t	2016-10-10 16:37:17.211-04	2016-10-10 16:37:17.211-04	1375	301	http://****
2125	email	mailinglist.admins	t	2016-10-10 16:37:17.212-04	2016-10-10 16:37:17.212-04	1378	301	http://****
2053	email	mailinglist.admins	t	2016-10-10 16:37:17.196-04	2016-10-10 16:37:17.196-04	1308	261	http://****
2057	email	mailinglist.admins	t	2016-10-10 16:37:17.197-04	2016-10-10 16:37:17.197-04	1312	263	http://****
2062	email	mailinglist.admins	t	2016-10-10 16:37:17.198-04	2016-10-10 16:37:17.198-04	1314	267	http://****
2067	email	mailinglist.admins	t	2016-10-10 16:37:17.199-04	2016-10-10 16:37:17.199-04	1321	270	http://****
2074	email	mailinglist.admins	t	2016-10-10 16:37:17.2-04	2016-10-10 16:37:17.2-04	1328	275	http://****
2079	email	mailinglist.admins	t	2016-10-10 16:37:17.201-04	2016-10-10 16:37:17.201-04	1333	278	http://****
2083	email	mailinglist.admins	t	2016-10-10 16:37:17.202-04	2016-10-10 16:37:17.202-04	1337	280	http://****
2088	email	mailinglist.admins	t	2016-10-10 16:37:17.203-04	2016-10-10 16:37:17.203-04	1342	285	http://****
2095	email	mailinglist.admins	t	2016-10-10 16:37:17.205-04	2016-10-10 16:37:17.205-04	1349	289	http://****
2098	email	mailinglist.admins	t	2016-10-10 16:37:17.206-04	2016-10-10 16:37:17.206-04	1352	290	http://****
2105	email	mailinglist.admins	t	2016-10-10 16:37:17.207-04	2016-10-10 16:37:17.207-04	1359	295	http://****
2110	email	mailinglist.admins	t	2016-10-10 16:37:17.208-04	2016-10-10 16:37:17.208-04	1364	297	http://****
2115	email	mailinglist.admins	t	2016-10-10 16:37:17.21-04	2016-10-10 16:37:17.21-04	1369	299	http://****
2120	email	mailinglist.admins	t	2016-10-10 16:37:17.211-04	2016-10-10 16:37:17.211-04	1373	300	http://****
2048	email	mailinglist.admins	t	2016-10-10 16:37:17.195-04	2016-10-10 16:37:17.195-04	1303	259	http://****
2054	email	mailinglist.admins	t	2016-10-10 16:37:17.196-04	2016-10-10 16:37:17.196-04	1309	262	http://****
2058	email	mailinglist.admins	t	2016-10-10 16:37:17.197-04	2016-10-10 16:37:17.197-04	1313	264	http://****
2063	email	mailinglist.admins	t	2016-10-10 16:37:17.198-04	2016-10-10 16:37:17.198-04	1317	268	http://****
2068	email	mailinglist.admins	t	2016-10-10 16:37:17.199-04	2016-10-10 16:37:17.199-04	1322	271	http://****
2073	email	mailinglist.admins	t	2016-10-10 16:37:17.2-04	2016-10-10 16:37:17.2-04	1327	275	http://****
2078	email	mailinglist.admins	t	2016-10-10 16:37:17.201-04	2016-10-10 16:37:17.201-04	1332	277	http://****
2084	email	mailinglist.admins	t	2016-10-10 16:37:17.202-04	2016-10-10 16:37:17.202-04	1338	281	http://****
2089	email	mailinglist.admins	t	2016-10-10 16:37:17.204-04	2016-10-10 16:37:17.204-04	1343	286	http://****
2092	email	mailinglist.admins	t	2016-10-10 16:37:17.204-04	2016-10-10 16:37:17.204-04	1346	287	http://****
2097	email	mailinglist.admins	t	2016-10-10 16:37:17.205-04	2016-10-10 16:37:17.205-04	1351	290	http://****
2102	email	mailinglist.admins	t	2016-10-10 16:37:17.207-04	2016-10-10 16:37:17.207-04	1356	293	http://****
2103	email	mailinglist.admins	t	2016-10-10 16:37:17.207-04	2016-10-10 16:37:17.207-04	1357	294	http://****
2108	email	mailinglist.admins	t	2016-10-10 16:37:17.208-04	2016-10-10 16:37:17.208-04	1362	297	http://****
2113	email	mailinglist.admins	t	2016-10-10 16:37:17.209-04	2016-10-10 16:37:17.209-04	1366	298	http://****
2118	email	mailinglist.admins	t	2016-10-10 16:37:17.21-04	2016-10-10 16:37:17.21-04	1372	300	http://****
2123	email	mailinglist.admins	t	2016-10-10 16:37:17.211-04	2016-10-10 16:37:17.211-04	1376	301	http://****
8098	email	mailinglist.admins	t	2017-02-21 14:07:25.188-05	2017-02-21 14:07:25.188-05	3	517	http://****
8104	email	mailinglist.admins	t	2017-02-21 14:13:03.396-05	2017-02-21 14:13:03.396-05	3	518	http://****
8110	email	mailinglist.admins	t	2017-02-21 14:25:28.726-05	2017-02-21 14:25:28.726-05	3	519	http://****
8116	email	mailinglist.admins	t	2017-02-21 14:34:47.023-05	2017-02-21 14:34:47.023-05	3	520	http://****
8122	email	mailinglist.admins	t	2017-02-21 14:39:46.24-05	2017-02-21 14:39:46.24-05	3	521	http://****
8128	email	mailinglist.admins	t	2017-02-21 14:45:19.17-05	2017-02-21 14:45:19.17-05	3	522	http://****
8138	email	mailinglist.admins	t	2017-02-21 15:04:48.982-05	2017-02-21 15:04:48.982-05	3	523	http://****
99	email	collective.monthlyreport	t	2016-08-10 20:22:42.133-04	2016-08-10 20:22:42.133-04	7	10	http://****
100	email	collective.monthlyreport	t	2016-08-10 20:22:42.133-04	2016-08-10 20:22:42.133-04	36	10	http://****
101	email	collective.monthlyreport	t	2016-08-10 20:22:42.134-04	2016-08-10 20:22:42.134-04	37	10	http://****
102	email	collective.monthlyreport	t	2016-08-10 20:22:42.135-04	2016-08-10 20:22:42.135-04	35	12	http://****
103	email	collective.monthlyreport	t	2016-08-10 20:22:42.136-04	2016-08-10 20:22:42.136-04	33	13	http://****
104	email	collective.monthlyreport	t	2016-08-10 20:22:42.136-04	2016-08-10 20:22:42.136-04	31	14	http://****
105	email	collective.monthlyreport	t	2016-08-10 20:22:42.137-04	2016-08-10 20:22:42.137-04	32	14	http://****
106	email	collective.monthlyreport	t	2016-08-10 20:22:42.139-04	2016-08-10 20:22:42.139-04	34	15	http://****
115	email	collective.monthlyreport	t	2016-08-10 20:22:42.145-04	2016-08-10 20:22:42.145-04	141	47	http://****
116	email	collective.monthlyreport	t	2016-08-10 20:22:42.146-04	2016-08-10 20:22:42.146-04	142	48	http://****
124	email	collective.monthlyreport	t	2016-08-10 20:22:42.149-04	2016-08-10 20:22:42.149-04	28	2	http://****
148	email	collective.monthlyreport	t	2016-08-10 20:22:42.162-04	2016-08-10 20:22:42.162-04	67	13	http://****
149	email	collective.monthlyreport	t	2016-08-10 20:22:42.164-04	2016-08-10 20:22:42.164-04	68	15	http://****
150	email	collective.monthlyreport	t	2016-08-10 20:22:42.164-04	2016-08-10 20:22:42.164-04	69	12	http://****
151	email	collective.monthlyreport	t	2016-08-10 20:22:42.164-04	2016-08-10 20:22:42.164-04	70	12	http://****
152	email	collective.monthlyreport	t	2016-08-10 20:22:42.165-04	2016-08-10 20:22:42.165-04	71	3	http://****
153	email	collective.monthlyreport	t	2016-08-10 20:22:42.165-04	2016-08-10 20:22:42.165-04	72	3	http://****
154	email	collective.monthlyreport	t	2016-08-10 20:22:42.166-04	2016-08-10 20:22:42.166-04	73	3	http://****
155	email	collective.monthlyreport	t	2016-08-10 20:22:42.166-04	2016-08-10 20:22:42.166-04	74	4	http://****
156	email	collective.monthlyreport	t	2016-08-10 20:22:42.166-04	2016-08-10 20:22:42.166-04	75	4	http://****
157	email	collective.monthlyreport	t	2016-08-10 20:22:42.167-04	2016-08-10 20:22:42.167-04	76	4	http://****
158	email	collective.monthlyreport	t	2016-08-10 20:22:42.167-04	2016-08-10 20:22:42.167-04	77	4	http://****
159	email	collective.monthlyreport	t	2016-08-10 20:22:42.168-04	2016-08-10 20:22:42.168-04	78	4	http://****
194	email	collective.monthlyreport	t	2016-08-10 20:22:42.182-04	2016-08-10 20:22:42.182-04	170	59	http://****
335	email	collective.monthlyreport	t	2016-08-10 20:22:42.23-04	2016-08-10 20:22:42.23-04	577	4	http://****
472	email	collective.monthlyreport	t	2016-08-10 20:22:42.274-04	2016-08-10 20:22:42.274-04	898	195	http://****
471	email	collective.monthlyreport	t	2016-08-10 20:22:42.273-04	2016-08-10 20:22:42.273-04	897	195	http://****
195	email	collective.monthlyreport	t	2016-08-10 20:22:42.182-04	2016-08-10 20:22:42.182-04	171	59	http://****
2393	email	collective.monthlyreport	t	2016-11-06 19:37:19.104-05	2016-11-06 19:37:19.104-05	1304	260	http://****
2398	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1310	262	http://****
2403	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1315	265	http://****
2408	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1319	269	http://****
2413	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1324	272	http://****
2418	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1329	276	http://****
2423	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1334	278	http://****
2428	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1339	282	http://****
2433	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1344	286	http://****
2438	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1349	289	http://****
2442	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1353	291	http://****
2447	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1358	294	http://****
2452	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1363	297	http://****
2457	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1368	299	http://****
2462	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1374	300	http://****
2467	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1377	301	http://****
2394	email	collective.monthlyreport	t	2016-11-06 19:37:19.104-05	2016-11-06 19:37:19.104-05	1305	260	http://****
2399	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1311	263	http://****
2405	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1314	267	http://****
2409	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1320	270	http://****
2414	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1325	273	http://****
2419	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1330	276	http://****
2424	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1335	279	http://****
2429	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1340	283	http://****
2435	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1346	287	http://****
2440	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1351	290	http://****
2444	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1355	292	http://****
2449	email	collective.monthlyreport	t	2016-11-06 19:37:19.111-05	2016-11-06 19:37:19.111-05	1361	295	http://****
2455	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1367	298	http://****
2460	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1371	300	http://****
2465	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1379	301	http://****
2395	email	collective.monthlyreport	t	2016-11-06 19:37:19.104-05	2016-11-06 19:37:19.104-05	1307	261	http://****
2400	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1312	263	http://****
2404	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1316	266	http://****
2410	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1321	270	http://****
2415	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1326	274	http://****
2420	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1331	277	http://****
2425	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1336	279	http://****
2430	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1341	284	http://****
2434	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1345	287	http://****
2439	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1350	289	http://****
2445	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1356	293	http://****
2450	email	collective.monthlyreport	t	2016-11-06 19:37:19.111-05	2016-11-06 19:37:19.111-05	1360	295	http://****
2454	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1365	298	http://****
2459	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1370	299	http://****
2464	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1375	301	http://****
2348	email	collective.monthlyreport	t	2016-11-06 19:37:19.095-05	2016-11-06 19:37:19.095-05	1145	241	http://****
2396	email	collective.monthlyreport	t	2016-11-06 19:37:19.104-05	2016-11-06 19:37:19.104-05	1308	261	http://****
2402	email	collective.monthlyreport	t	2016-11-06 19:37:19.105-05	2016-11-06 19:37:19.105-05	1314	264	http://****
2407	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1318	268	http://****
2412	email	collective.monthlyreport	t	2016-11-06 19:37:19.106-05	2016-11-06 19:37:19.106-05	1323	272	http://****
2417	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1328	275	http://****
2422	email	collective.monthlyreport	t	2016-11-06 19:37:19.107-05	2016-11-06 19:37:19.107-05	1333	278	http://****
2427	email	collective.monthlyreport	t	2016-11-06 19:37:19.108-05	2016-11-06 19:37:19.108-05	1338	281	http://****
2432	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1343	286	http://****
2437	email	collective.monthlyreport	t	2016-11-06 19:37:19.109-05	2016-11-06 19:37:19.109-05	1348	288	http://****
2443	email	collective.monthlyreport	t	2016-11-06 19:37:19.11-05	2016-11-06 19:37:19.11-05	1354	292	http://****
2448	email	collective.monthlyreport	t	2016-11-06 19:37:19.111-05	2016-11-06 19:37:19.111-05	1359	295	http://****
2453	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1364	297	http://****
2458	email	collective.monthlyreport	t	2016-11-06 19:37:19.112-05	2016-11-06 19:37:19.112-05	1369	299	http://****
2463	email	collective.monthlyreport	t	2016-11-06 19:37:19.113-05	2016-11-06 19:37:19.113-05	1373	300	http://****
2468	email	collective.monthlyreport	t	2016-11-06 19:37:19.114-05	2016-11-06 19:37:19.114-05	1378	301	http://****
8120	email	collective.transaction.created	t	2017-02-21 14:34:47.428-05	2017-02-21 14:34:47.428-05	3	520	http://****
8127	email	collective.transaction.created	t	2017-02-21 14:39:46.291-05	2017-02-21 14:39:46.291-05	3	521	http://****
8132	email	collective.transaction.created	t	2017-02-21 14:45:19.315-05	2017-02-21 14:45:19.315-05	3	522	http://****
5769	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1335	279	http://****
5777	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1345	287	http://****
5556	email	collective.expense.created	f	2016-12-28 19:13:56.266-05	2017-01-17 19:00:00-05	35	12	http://****
5775	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1342	285	http://****
5596	email	collective.expense.created	f	2016-12-28 19:13:56.284-05	2017-01-17 19:00:00-05	170	59	http://****
5753	email	collective.expense.created	f	2016-12-28 19:13:56.339-05	2017-01-17 19:00:00-05	1307	261	http://****
5570	email	collective.expense.created	f	2016-12-28 19:13:56.274-05	2017-01-17 19:00:00-05	71	3	http://****
5790	email	collective.expense.created	f	2016-12-28 19:13:56.345-05	2017-01-17 19:00:00-05	1375	301	http://****
5571	email	collective.expense.created	f	2016-12-28 19:13:56.275-05	2017-01-17 19:00:00-05	74	4	http://****
5778	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1347	288	http://****
5773	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1340	283	http://****
5784	email	collective.expense.created	f	2016-12-28 19:13:56.344-05	2017-01-17 19:00:00-05	1359	295	http://****
5761	email	collective.expense.created	f	2016-12-28 19:13:56.34-05	2017-01-17 19:00:00-05	1320	270	http://****
5752	email	collective.expense.created	f	2016-12-28 19:13:56.339-05	2017-01-17 19:00:00-05	1304	260	http://****
5787	email	collective.expense.created	f	2016-12-28 19:13:56.345-05	2017-01-17 19:00:00-05	1368	299	http://****
8038	email	collective.expense.created	t	2017-02-21 11:25:28.459-05	2017-02-21 11:25:28.459-05	3	510	http://****
8046	email	collective.expense.created	t	2017-02-21 11:55:29.658-05	2017-02-21 11:55:29.658-05	3206	511	http://****
8050	email	collective.expense.created	t	2017-02-21 11:55:29.766-05	2017-02-21 11:55:29.766-05	3	511	http://****
8062	email	collective.expense.created	t	2017-02-21 13:11:30.775-05	2017-02-21 13:11:30.775-05	3	512	http://****
8072	email	collective.expense.created	t	2017-02-21 13:35:34.525-05	2017-02-21 13:35:34.525-05	3	513	http://****
2945	email	collective.expense.created	t	2016-11-28 17:28:52.449-05	2017-01-10 19:00:00-05	3	269	http://****
2950	email	collective.expense.created	t	2016-11-28 17:28:52.45-05	2017-01-10 19:00:00-05	3	264	http://****
2955	email	collective.expense.created	t	2016-11-28 17:28:52.451-05	2017-01-10 19:00:00-05	3	259	http://****
2916	email	collective.expense.created	t	2016-11-28 17:28:52.443-05	2017-01-10 19:00:00-05	3	299	http://****
2921	email	collective.expense.created	t	2016-11-28 17:28:52.445-05	2017-01-10 19:00:00-05	3	293	http://****
2924	email	collective.expense.created	t	2016-11-28 17:28:52.445-05	2017-01-10 19:00:00-05	3	290	http://****
2930	email	collective.expense.created	t	2016-11-28 17:28:52.446-05	2017-01-10 19:00:00-05	3	284	http://****
2934	email	collective.expense.created	t	2016-11-28 17:28:52.447-05	2017-01-10 19:00:00-05	3	280	http://****
2940	email	collective.expense.created	t	2016-11-28 17:28:52.448-05	2017-01-10 19:00:00-05	3	274	http://****
2944	email	collective.expense.created	t	2016-11-28 17:28:52.449-05	2017-01-10 19:00:00-05	3	270	http://****
2949	email	collective.expense.created	t	2016-11-28 17:28:52.45-05	2017-01-10 19:00:00-05	3	265	http://****
2914	email	collective.expense.created	t	2016-11-28 17:28:52.443-05	2017-01-10 19:00:00-05	3	301	http://****
2941	email	collective.expense.created	t	2016-11-28 17:28:52.448-05	2017-01-10 19:00:00-05	3	273	http://****
2946	email	collective.expense.created	t	2016-11-28 17:28:52.449-05	2017-01-10 19:00:00-05	3	268	http://****
2951	email	collective.expense.created	t	2016-11-28 17:28:52.45-05	2017-01-10 19:00:00-05	3	263	http://****
2701	email	collective.expense.created	t	2016-11-28 17:28:52.359-05	2017-01-10 19:00:00-05	3	10	http://****
2703	email	collective.expense.created	t	2016-11-28 17:28:52.36-05	2017-01-10 19:00:00-05	3	12	http://****
2704	email	collective.expense.created	t	2016-11-28 17:28:52.361-05	2017-01-10 19:00:00-05	3	13	http://****
2705	email	collective.expense.created	t	2016-11-28 17:28:52.362-05	2017-01-10 19:00:00-05	3	14	http://****
2706	email	collective.expense.created	t	2016-11-28 17:28:52.362-05	2017-01-10 19:00:00-05	3	15	http://****
2708	email	collective.expense.created	t	2016-11-28 17:28:52.365-05	2017-01-10 19:00:00-05	3	47	http://****
2709	email	collective.expense.created	t	2016-11-28 17:28:52.368-05	2017-01-10 19:00:00-05	3	48	http://****
2712	email	collective.expense.created	t	2016-11-28 17:28:52.373-05	2017-01-10 19:00:00-05	3	51	http://****
2723	email	collective.expense.created	t	2016-11-28 17:28:52.376-05	2017-01-10 19:00:00-05	3	2	http://****
2724	email	collective.expense.created	t	2016-11-28 17:28:52.377-05	2017-01-10 19:00:00-05	3	3	http://****
2725	email	collective.expense.created	t	2016-11-28 17:28:52.377-05	2017-01-10 19:00:00-05	3	4	http://****
2751	email	collective.expense.created	t	2016-11-28 17:28:52.388-05	2017-01-10 19:00:00-05	3	59	http://****
2954	email	collective.expense.created	t	2016-11-28 17:28:52.451-05	2017-01-10 19:00:00-05	3	260	http://****
2851	email	collective.expense.created	t	2016-11-28 17:28:52.427-05	2017-01-10 19:00:00-05	3	195	http://****
2918	email	collective.expense.created	t	2016-11-28 17:28:52.444-05	2017-01-10 19:00:00-05	3	297	http://****
2923	email	collective.expense.created	t	2016-11-28 17:28:52.445-05	2017-01-10 19:00:00-05	3	291	http://****
2928	email	collective.expense.created	t	2016-11-28 17:28:52.446-05	2017-01-10 19:00:00-05	3	286	http://****
2933	email	collective.expense.created	t	2016-11-28 17:28:52.447-05	2017-01-10 19:00:00-05	3	281	http://****
2938	email	collective.expense.created	t	2016-11-28 17:28:52.448-05	2017-01-10 19:00:00-05	3	276	http://****
2943	email	collective.expense.created	t	2016-11-28 17:28:52.449-05	2017-01-10 19:00:00-05	3	271	http://****
2948	email	collective.expense.created	t	2016-11-28 17:28:52.45-05	2017-01-10 19:00:00-05	3	266	http://****
2952	email	collective.expense.created	t	2016-11-28 17:28:52.451-05	2017-01-10 19:00:00-05	3	262	http://****
5766	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1329	276	http://****
5780	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1351	290	http://****
5557	email	collective.expense.created	f	2016-12-28 19:13:56.267-05	2017-01-17 19:00:00-05	33	13	http://****
5774	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1341	284	http://****
5751	email	collective.expense.created	f	2016-12-28 19:13:56.339-05	2017-01-17 19:00:00-05	1303	259	http://****
5589	email	collective.expense.created	f	2016-12-28 19:13:56.281-05	2017-01-17 19:00:00-05	142	48	http://****
5552	email	collective.expense.created	f	2016-12-28 19:13:56.264-05	2017-01-17 19:00:00-05	28	2	http://****
5563	email	collective.expense.created	f	2016-12-28 19:13:56.267-05	2017-01-17 19:00:00-05	31	14	http://****
5767	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1333	278	http://****
5786	email	collective.expense.created	f	2016-12-28 19:13:56.344-05	2017-01-17 19:00:00-05	1357	294	http://****
5776	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1343	286	http://****
5771	email	collective.expense.created	f	2016-12-28 19:13:56.342-05	2017-01-17 19:00:00-05	1338	281	http://****
5588	email	collective.expense.created	f	2016-12-28 19:13:56.281-05	2017-01-17 19:00:00-05	141	47	http://****
5555	email	collective.expense.created	f	2016-12-28 19:13:56.265-05	2017-01-17 19:00:00-05	7	10	http://****
5757	email	collective.expense.created	f	2016-12-28 19:13:56.34-05	2017-01-17 19:00:00-05	1316	266	http://****
5763	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1326	274	http://****
5764	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1327	275	http://****
5779	email	collective.expense.created	f	2016-12-28 19:13:56.343-05	2017-01-17 19:00:00-05	1349	289	http://****
5758	email	collective.expense.created	f	2016-12-28 19:13:56.34-05	2017-01-17 19:00:00-05	1314	267	http://****
5689	email	collective.expense.created	f	2016-12-28 19:13:56.324-05	2017-01-17 19:00:00-05	897	195	http://****
5733	email	collective.expense.created	f	2016-12-28 19:13:56.333-05	2017-01-17 19:00:00-05	1145	241	http://****
5762	email	collective.expense.created	f	2016-12-28 19:13:56.341-05	2017-01-17 19:00:00-05	1323	272	http://****
5783	email	collective.expense.created	f	2016-12-28 19:13:56.344-05	2017-01-17 19:00:00-05	1356	293	http://****
5785	email	collective.expense.created	f	2016-12-28 19:13:56.344-05	2017-01-17 19:00:00-05	1362	297	http://****
5756	email	collective.expense.created	f	2016-12-28 19:13:56.34-05	2017-01-17 19:00:00-05	1315	265	http://****
5754	email	collective.expense.created	f	2016-12-28 19:13:56.339-05	2017-01-17 19:00:00-05	1309	262	http://****
5755	email	collective.expense.created	f	2016-12-28 19:13:56.339-05	2017-01-17 19:00:00-05	1313	264	http://****
8086	email	collective.expense.created	t	2017-02-21 13:49:14.347-05	2017-02-21 13:49:14.347-05	3	515	http://****
8100	email	collective.expense.created	t	2017-02-21 14:07:25.189-05	2017-02-21 14:07:25.189-05	3	517	http://****
8105	email	collective.expense.created	t	2017-02-21 14:13:03.396-05	2017-02-21 14:13:03.396-05	3	518	http://****
8111	email	collective.expense.created	t	2017-02-21 14:25:28.726-05	2017-02-21 14:25:28.726-05	3	519	http://****
8117	email	collective.expense.created	t	2017-02-21 14:34:47.023-05	2017-02-21 14:34:47.023-05	3	520	http://****
8123	email	collective.expense.created	t	2017-02-21 14:39:46.24-05	2017-02-21 14:39:46.24-05	3	521	http://****
8129	email	collective.expense.created	t	2017-02-21 14:45:19.17-05	2017-02-21 14:45:19.17-05	3	522	http://****
8139	email	collective.expense.created	t	2017-02-21 15:04:48.983-05	2017-02-21 15:04:48.983-05	3	523	http://****
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4007.dat                                                                                            0000600 0004000 0002000 00000044623 13174666341 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        102	2	13	USD	100	Recurring subscription	2	2016-04-01 10:32:16.704-04	2016-04-01 10:32:16.704-04	2016-04-07 10:32:16.691-04	\N	\N	\N	\N	688	\N	1
13	30	12	USD	1000	Donation to WWCode Atlanta	\N	2016-04-01 10:32:16.445-04	2017-02-02 10:06:14.763-05	\N	39	\N	\N	\N	691	\N	1
67	30	14	USD	100	Monthly donation to wwcode seattle	6	2016-04-01 10:32:16.552-04	2017-02-02 10:06:15.538-05	\N	41	\N	\N	\N	691	\N	1
69	30	13	USD	100	Monthly donation to wwcode washington dc	7	2016-04-01 10:32:16.561-04	2017-02-02 10:06:15.552-05	\N	43	\N	\N	\N	691	\N	1
71	8	14	USD	100	Monthly donation to wwcode seattle	8	2016-04-01 10:32:16.574-04	2017-02-02 10:06:15.567-05	\N	45	\N	\N	\N	819	\N	1
97	30	14	USD	100	Recurring subscription	6	2016-04-01 10:32:16.68-04	2016-04-01 10:32:16.68-04	2016-04-07 10:32:16.68-04	\N	\N	\N	\N	691	\N	1
2393	3	516	USD	20000	Global Development	\N	2017-04-07 08:25:51.051-04	2017-04-07 08:25:51.101-04	\N	\N	2017-04-07 08:25:51.1-04		\N	51	\N	1
2472	3	517	USD	100000	Director Travel Stipend CONNECT	\N	2017-04-17 16:41:37.54-04	2017-04-17 16:41:37.67-04	\N	\N	2017-04-17 16:41:37.669-04		\N	51	\N	1
2487	3	511	MXN	25000	Leadership Development: Director Travel Stipend to attend CONNECT 2017	\N	2017-04-17 18:34:32.173-04	2017-04-17 18:34:32.292-04	\N	\N	2017-04-17 18:34:32.289-04		\N	51	\N	1
2473	3	517	USD	5000	PayPal Fees	\N	2017-04-17 16:41:53.536-04	2017-04-17 16:41:53.62-04	\N	\N	2017-04-17 16:41:53.619-04		\N	51	\N	1
2508	3	14	USD	1480	PayPal fees Google I/O Travel Stipend	\N	2017-04-18 20:39:23.089-04	2017-04-18 20:39:23.171-04	\N	\N	2017-04-18 20:39:23.17-04		\N	51	\N	1
2507	3	195	USD	1400	PayPal Fees for Google I/O	\N	2017-04-18 20:31:31.884-04	2017-04-18 20:31:31.962-04	\N	\N	2017-04-18 20:31:31.961-04		\N	51	\N	1
2506	3	12	USD	1480	PayPal Fees Google I/O Ticket	\N	2017-04-18 20:20:11.451-04	2017-04-18 20:20:11.557-04	\N	\N	2017-04-18 20:20:11.552-04		\N	51	\N	1
2505	3	12	USD	1198	PayPal Fees Google I/O Ticket	\N	2017-04-18 20:19:14.259-04	2017-04-18 20:19:14.339-04	\N	\N	2017-04-18 20:19:14.339-04		\N	51	\N	1
2489	3	511	MXN	2200	PayPal Fees	\N	2017-04-17 18:35:54.945-04	2017-04-17 18:35:55.035-04	\N	\N	2017-04-17 18:35:55.034-04		\N	51	\N	1
2488	3	511	MXN	18800	Leadership Development: Director travel stipend to attend CONNECT 2017	\N	2017-04-17 18:35:06.028-04	2017-04-17 18:35:06.109-04	\N	\N	2017-04-17 18:35:06.109-04		\N	51	\N	1
65	2	10	USD	500	Monthly donation to wwcode mexico city	1	2016-04-01 10:32:16.527-04	2017-02-02 10:06:21.656-05	\N	34	\N	\N	\N	688	\N	1
2152	3	59	USD	20000	Google I/O travel grant: Kezia W. 	\N	2017-03-27 13:45:17.489-04	2017-03-27 13:45:17.596-04	\N	\N	2017-03-27 13:45:17.489-04		96	266	\N	1
2217	3	291	CAD	50000	Google I/O Travel Grant: Evangelique L.	\N	2017-03-31 19:37:30.782-04	2017-03-31 19:37:30.831-04	\N	\N	2017-03-31 19:37:30.782-04		60	262	\N	1
2649	3	13	USD	154800	iOS Dev Camp 2016 (Capital One)	\N	2017-05-01 14:02:20.457-04	2017-05-01 14:02:20.53-04	\N	\N	2017-05-01 14:02:20.457-04		61	521	\N	1
1935	3301	522	CAD	30000	Donation to Women Who Code Vancouver	\N	2017-02-27 19:25:15.618-05	2017-02-27 19:25:20.42-05	\N	2030	2017-02-27 19:25:20.419-05	\N	\N	837	\N	1
488	883	2	USD	150000	Donation to WWCode Austin	\N	2016-08-01 11:54:13.775-04	2017-02-02 10:06:19.784-05	\N	561	2016-08-01 11:54:13.775-04	\N	54	839	\N	1
2662	3	3	USD	2930	PayPal fees for Google I/O	\N	2017-05-01 20:33:45.604-04	2017-05-01 20:33:45.819-04	\N	\N	2017-05-01 20:33:45.604-04		69	275	\N	1
2208	3	278	GBP	80500	Google I/O travel grant: Kanke I.	\N	2017-03-31 13:54:33.373-04	2017-03-31 13:54:33.566-04	\N	\N	2017-03-31 13:54:33.373-04		76	291	\N	1
2677	3	51	USD	60000	Fullstory + WWCode Atlanta	\N	2017-05-02 14:45:44.196-04	2017-05-02 14:45:44.266-04	\N	\N	2017-05-02 14:45:44.196-04		98	301	\N	1
2694	3	51	USD	30000	User Testing and WWCode ATL	\N	2017-05-03 13:33:13.357-04	2017-05-03 13:33:13.7-04	\N	\N	2017-05-03 13:33:13.357-04		98	275	\N	1
70	30	13	USD	100	Monthly donation to wwcode washington dc	3	2016-04-01 10:32:16.57-04	2017-02-02 10:06:21.68-05	\N	44	\N	\N	\N	691	\N	1
1531	2549	270	USD	1000	Monthly donation to WWCode Chicago	1238	2017-01-14 12:11:39.405-05	2017-01-14 12:11:43.298-05	\N	1616	2017-01-14 12:11:43.297-05	\N	\N	762	\N	1
2741	3	301	EUR	16563	Regional Leadership Event: Sofia	\N	2017-05-08 11:30:18.503-04	2017-05-08 11:30:18.616-04	\N	\N	2017-05-08 11:30:18.503-04		85	268	\N	1
320	8	3	USD	100	Monthly donation to wwcode new york	224	2016-06-09 13:28:13.93-04	2017-02-02 10:06:18.32-05	\N	385	\N	\N	\N	819	\N	1
686	1244	4	USD	0	Monthly donation to wwcode san francisco	530	2016-09-20 16:58:49.811-04	2016-10-14 16:08:32.409-04	\N	773	2016-09-20 16:58:51.909-04	\N	\N	717	\N	1
647	1158	241	USD	1000	Monthly donation to wwcode taipei	496	2016-09-09 23:42:49.15-04	2016-10-14 16:08:32.241-04	\N	731	2016-09-09 23:42:51.443-04	\N	\N	737	\N	1
386	686	2	USD	1000	Monthly donation to wwcode austin	286	2016-07-01 18:31:45.982-04	2017-02-02 10:06:19.11-05	\N	461	\N	\N	\N	803	\N	1
361	642	48	USD	100	Donation to WWCode Twin Cities	\N	2016-06-21 12:06:05.176-04	2017-02-02 10:06:18.855-05	\N	432	\N	\N	\N	775	\N	1
360	642	4	USD	100	Donation to WWCode San Francisco	\N	2016-06-21 12:05:00.946-04	2017-02-02 10:06:18.844-05	\N	431	\N	\N	\N	775	\N	1
359	642	12	USD	100	Donation to WWCode Atlanta	\N	2016-06-21 12:02:55.605-04	2017-02-02 10:06:18.833-05	\N	430	\N	\N	\N	775	\N	1
95	126	13	USD	100	Monthly donation to wwcode washington dc	33	2016-04-01 10:32:16.673-04	2017-02-02 10:06:15.838-05	\N	93	\N	\N	\N	704	\N	1
101	8	14	USD	100	Recurring subscription	8	2016-04-01 10:32:16.701-04	2016-04-01 10:32:16.701-04	2016-04-07 10:32:16.701-04	\N	\N	\N	\N	819	\N	1
246	392	2	USD	50000	Donation to WWCode Austin	\N	2016-05-19 15:24:42.786-04	2017-02-02 10:06:17.118-05	\N	288	2016-05-19 15:24:42.786-04	\N	54	718	\N	1
258	426	2	USD	50000	Donation to WWCode Austin	\N	2016-05-23 16:27:28.19-04	2017-02-02 10:06:17.13-05	\N	306	2016-05-23 16:27:28.19-04	\N	54	741	\N	1
364	646	2	USD	75000	Donation to WWCode Austin	\N	2016-06-22 16:09:45.975-04	2017-02-02 10:06:18.866-05	\N	435	2016-06-22 16:09:45.975-04	\N	54	771	\N	1
489	884	2	USD	20000	Donation to WWCode Austin	\N	2016-08-01 11:55:26.677-04	2017-02-02 10:06:19.797-05	\N	562	2016-08-01 11:55:26.677-04	\N	54	750	\N	1
768	1299	2	USD	19000	Donation to WWCode Austin	\N	2016-09-28 17:47:15.105-04	2016-09-28 17:47:19.41-04	\N	842	2016-09-28 17:47:15.105-04	\N	54	795	\N	1
191	308	2	USD	150000	Donation to WWCode Austin	\N	2016-05-03 09:07:27.747-04	2017-02-02 10:06:16.352-05	\N	230	2016-05-03 09:07:27.747-04	\N	54	798	\N	1
2151	3	12	USD	50000	Leadership Development: Google i/o grant for Alicia C.	\N	2017-03-27 13:10:04.532-04	2017-03-27 13:10:04.637-04	\N	\N	2017-03-27 13:10:04.532-04		75	291	\N	1
83	7	10	MXN	100	Monthly donation to wwcode mexico city	16	2016-04-01 10:32:16.636-04	2016-10-14 16:08:31.996-04	\N	\N	\N	\N	\N	821	\N	1
1712	2906	271	USD	2500	Monthly donation to WWCode Dallas	1366	2017-02-01 12:30:44.044-05	2017-02-01 12:30:50.454-05	\N	1804	2017-02-01 12:30:44.044-05	\N	57	692	\N	1
316	555	13	USD	100000	Donation to WWCode Washington DC	\N	2016-06-06 20:53:47.064-04	2017-02-02 10:06:18.126-05	\N	381	2016-06-06 20:53:47.064-04	\N	61	743	\N	1
183	303	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-29 09:51:18.715-04	2017-02-02 10:06:16.329-05	\N	216	2016-04-29 09:51:18.715-04	\N	61	808	\N	1
181	283	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-28 11:01:17.431-04	2017-02-02 10:06:16.319-05	\N	213	2016-04-28 11:01:17.431-04	\N	61	824	\N	1
808	1438	2	USD	12500	Donation to WWCode Austin	\N	2016-10-06 14:36:35.208-04	2016-10-06 14:36:39.093-04	\N	880	2016-10-06 14:36:35.208-04	\N	54	713	\N	1
1215	1957	2	USD	20000	Donation to WWCode Austin	\N	2016-11-30 11:11:39.696-05	2016-11-30 11:11:42.626-05	\N	1296	2016-11-30 11:11:39.696-05	\N	54	710	\N	1
1466	2416	2	USD	20000	Donation to WWCode Austin	\N	2017-01-03 15:59:34.554-05	2017-01-03 15:59:38.801-05	\N	1553	2017-01-03 15:59:34.554-05	\N	54	709	\N	1
25	129	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 10:32:16.462-04	2017-02-02 10:06:14.962-05	\N	94	2016-04-01 10:32:16.462-04	\N	54	689	\N	1
87	2	10	USD	500	Recurring subscription	1	2016-04-01 10:32:16.648-04	2016-04-01 10:32:16.648-04	2016-04-07 10:32:16.648-04	\N	\N	\N	\N	688	\N	1
100	30	13	USD	100	Recurring subscription	3	2016-04-01 10:32:16.697-04	2016-04-01 10:32:16.697-04	2016-04-07 10:32:16.691-04	\N	\N	\N	\N	691	\N	1
99	30	13	USD	100	Recurring subscription	7	2016-04-01 10:32:16.691-04	2016-04-01 10:32:16.691-04	2016-04-07 10:32:16.691-04	\N	\N	\N	\N	691	\N	1
122	7	10	MXN	100	Recurring subscription	16	2016-04-01 10:32:16.774-04	2016-04-01 10:32:16.774-04	2016-04-01 10:32:16.774-04	\N	\N	\N	\N	821	\N	1
72	2	13	USD	100	Monthly donation to wwcode washington dc	2	2016-04-01 10:32:16.577-04	2017-02-02 10:06:15.583-05	\N	46	\N	\N	\N	688	\N	1
98	80	10	MXN	500	Recurring subscription	4	2016-04-01 10:32:16.686-04	2016-04-01 10:32:16.686-04	2016-04-07 10:32:16.686-04	\N	\N	\N	\N	768	\N	1
68	80	10	MXN	500	Monthly donation to wwcode mexico city	4	2016-04-01 10:32:16.557-04	2017-02-02 10:06:15.653-05	\N	42	\N	\N	\N	768	\N	1
2421	4153	13	USD	25000	Donation to WWCode Washington DC	\N	2017-04-10 21:09:47.558-04	2017-04-10 21:09:50.716-04	\N	2535	2017-04-10 21:09:47.558-04	\N	61	842	\N	1
2154	3	277	USD	100000	Leadership Development: Google I/O Travel Grant: Lydia L.	\N	2017-03-27 13:53:48.436-04	2017-03-27 13:53:48.659-04	\N	\N	2017-03-27 13:53:48.436-04		86	3	\N	1
2204	3	2	USD	50000	Google I/O Travel Grant: Patricia C. 	\N	2017-03-31 13:17:51.642-04	2017-03-31 13:17:51.712-04	\N	\N	2017-03-31 13:17:51.642-04		54	522	\N	1
2697	3	51	USD	15000	Zapier + WWCode Atlanta	\N	2017-05-03 13:44:48.667-04	2017-05-03 13:44:48.731-04	\N	\N	2017-05-03 13:44:48.667-04		98	275	\N	1
2520	3	3	USD	40000	Google I/O Travel Expense	\N	2017-04-19 14:26:01.156-04	2017-04-19 14:26:01.247-04	\N	\N	2017-04-19 14:26:01.156-04		69	521	\N	1
2644	4550	516	USD	500	Monthly donation to Women Who Code Huntsville	2039	2017-05-01 13:13:32.223-04	2017-05-01 13:13:36.337-04	\N	2757	2017-05-01 13:13:32.223-04	\N	121	785	\N	1
2696	3	12	USD	75000	Zapier - Global Development	\N	2017-05-03 13:44:10.796-04	2017-05-03 13:44:10.856-04	\N	\N	2017-05-03 13:44:10.796-04		75	275	\N	1
2490	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta L.	\N	2017-04-17 18:40:40.287-04	2017-04-17 18:40:40.376-04	\N	\N	2017-04-17 18:40:40.287-04		101	301	\N	1
1167	1890	2	USD	4000	Donation to WWCode Austin	\N	2016-11-28 10:33:12.038-05	2016-11-28 10:33:15.883-05	\N	1249	2016-11-28 10:33:12.038-05	\N	54	810	\N	1
153	224	2	USD	20000	Donation to WWCode Austin	\N	2016-04-13 12:46:10.093-04	2017-02-02 10:06:16.24-05	\N	173	2016-04-13 12:46:10.093-04	\N	54	820	\N	1
15	108	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 10:32:16.447-04	2017-02-02 10:06:14.785-05	\N	71	2016-04-01 10:32:16.447-04	\N	54	813	\N	1
513	192	2	USD	150000	Donation to WWCode Austin	\N	2016-08-05 16:48:07.943-04	2017-02-02 10:06:20.648-05	\N	589	2016-08-05 16:48:07.943-04	\N	54	805	\N	1
64	192	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 10:32:16.52-04	2017-02-02 10:06:15.499-05	\N	152	2016-04-01 10:32:16.52-04	\N	54	805	\N	1
1388	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 20:41:26.702-05	2016-12-18 20:41:29.227-05	\N	1471	2016-12-18 20:41:26.702-05	\N	80	699	\N	1
1389	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 20:41:58.846-05	2016-12-18 20:42:01.434-05	2016-12-27 19:00:00-05	1472	2016-12-18 20:41:58.846-05	\N	80	699	\N	1
2003	3442	259	USD	6000	Donation to WWCode Birmingham	\N	2017-03-09 13:29:52.29-05	2017-03-09 13:29:55.868-05	\N	2104	2017-03-09 13:29:52.29-05	\N	80	754	\N	1
812	1446	241	USD	2500	Donation to WWCode Taipei	\N	2016-10-07 12:49:14.682-04	2016-10-07 12:49:20.396-04	\N	884	2016-10-07 12:49:14.682-04	\N	83	712	\N	1
1175	1908	301	EUR	25000	Donation to WWCode Berlin	\N	2016-11-29 05:03:21.531-05	2016-11-29 05:03:23.984-05	\N	1257	2016-11-29 05:03:21.531-05	\N	85	707	\N	1
700	1263	59	USD	25000	Donation to WWCode Portland	\N	2016-09-22 21:07:06.293-04	2016-09-22 21:07:10.714-04	\N	790	2016-09-22 21:07:06.293-04	\N	96	792	\N	1
1953	1263	59	USD	25000	Donation to WWCode Portland	\N	2017-03-01 17:51:17.006-05	2017-03-01 17:51:20.789-05	\N	2048	2017-03-01 17:51:17.006-05	\N	96	792	\N	1
1129	1846	59	USD	30000	Donation to WWCode Portland	\N	2016-11-22 10:22:36.145-05	2016-11-22 10:22:40.436-05	\N	1211	2016-11-22 10:22:36.145-05	\N	96	701	\N	1
1709	2898	48	USD	22500	Donation to WWCode Twin Cities	\N	2017-02-01 10:16:17.78-05	2017-02-01 10:16:22.469-05	\N	1801	2017-02-01 10:16:17.78-05	\N	100	801	\N	1
1557	2594	48	USD	10000	Donation to WWCode Twin Cities	\N	2017-01-18 08:54:47.782-05	2017-01-18 08:54:51.04-05	\N	1647	2017-01-18 08:54:47.782-05	\N	100	697	\N	1
1537	2561	48	USD	50000	Donation to WWCode Twin Cities	\N	2017-01-16 13:03:53.812-05	2017-01-16 13:03:57.019-05	\N	1622	2017-01-16 13:03:53.812-05	\N	100	700	\N	1
1098	1808	59	USD	50000	Donation to WWCode Portland	\N	2016-11-17 12:43:26.405-05	2016-11-17 12:43:31.282-05	\N	1179	2016-11-17 12:43:26.405-05	\N	96	708	\N	1
1801	3053	15	USD	84241	Donation to WWCode Boulder/Denver	\N	2017-02-10 11:47:30.962-05	2017-02-10 11:47:34.968-05	\N	1890	2017-02-10 11:47:30.962-05	\N	55	838	\N	1
622	1094	2	USD	200000	Donation to WWCode Austin	\N	2016-09-01 10:41:33.696-04	2016-09-01 10:41:37.79-04	\N	707	2016-09-01 10:41:33.696-04	\N	54	738	\N	1
312	551	2	USD	150000	Donation to WWCode Austin	\N	2016-06-06 15:04:36.791-04	2017-02-02 10:06:18.114-05	\N	377	2016-06-06 15:04:36.791-04	\N	54	781	\N	1
653	1178	2	USD	50000	Donation to WWCode Austin	\N	2016-09-13 00:15:02.18-04	2016-09-13 00:15:05.541-04	\N	737	2016-09-13 00:15:02.18-04	\N	54	788	\N	1
2430	4173	13	USD	2500	Donation to WWCode Washington DC	\N	2017-04-11 22:05:32.82-04	2017-04-11 22:05:36.109-04	\N	2546	2017-04-11 22:05:32.82-04	\N	61	693	\N	1
2755	4720	2	USD	84000	Donation to WWCode Austin	\N	2017-05-09 14:14:19.702-04	2017-05-09 14:14:23.386-04	\N	2860	2017-05-09 14:14:19.702-04	\N	54	846	\N	1
2332	3999	2	USD	20000	Donation to WWCode Austin	\N	2017-04-04 15:51:02.781-04	2017-04-04 15:51:04.976-04	\N	2438	2017-04-04 15:51:02.781-04	\N	54	836	\N	1
498	896	4	USD	10000	Monthly donation to wwcode san francisco	378	2016-08-03 13:47:17.188-04	2017-02-02 10:06:20.1-05	\N	571	2016-08-03 13:47:17.188-04	\N	64	759	\N	1
2206	3	267	GBP	79600	Google I/O Travel Grant: Rabeb O. 	\N	2017-03-31 13:20:23.87-04	2017-03-31 13:20:23.928-04	\N	\N	2017-03-31 13:20:23.87-04		77	291	\N	1
2503	3	278	GBP	3562	PayPal Fees for Google I/O travel stipend	\N	2017-04-18 15:41:30.217-04	2017-04-18 15:41:30.305-04	\N	\N	2017-04-18 15:41:30.217-04		76	275	\N	1
2817	4834	14	USD	20000	Donation to WWCode Seattle	\N	2017-05-15 08:07:56.843-04	2017-05-15 08:07:59.734-04	\N	2922	2017-05-15 08:07:56.843-04	\N	125	799	\N	1
2676	3	12	USD	300000	FullStory - Global Development	\N	2017-05-02 14:43:43.093-04	2017-05-02 14:43:43.175-04	\N	\N	2017-05-02 14:43:43.093-04		75	275	\N	1
2532	4348	59	USD	10000	Donation to WWCode Portland	\N	2017-04-20 06:17:20.169-04	2017-04-20 06:17:23.35-04	\N	2643	2017-04-20 06:17:20.169-04	\N	96	840	\N	1
2693	3	12	USD	150000	User Testing - Global Development	\N	2017-05-03 13:32:39.617-04	2017-05-03 13:32:39.663-04	\N	\N	2017-05-03 13:32:39.617-04		75	275	\N	1
2153	3	277	USD	100000	Leadership Development: Google I/O travel grant: Chee Yim G.	\N	2017-03-27 13:52:38.07-04	2017-03-27 13:52:38.138-04	\N	\N	2017-03-27 13:52:38.07-04		86	275	\N	1
2750	4711	517	USD	1000	Monthly donation to Women Who Code Manila	2103	2017-05-09 01:59:11.956-04	2017-05-09 01:59:17.596-04	\N	2855	2017-05-09 01:59:11.956-04	\N	105	711	\N	1
2214	3	286	USD	20000	Leadership Development: Conference support for Karina M. 	\N	2017-03-31 18:50:23.845-04	2017-03-31 18:50:23.931-04	2017-03-31 20:00:00-04	\N	2017-03-31 18:50:23.845-04		126	275	\N	1
2470	3	267	GBP	4000	PayPal Fees to transfer Google I/O stipend	\N	2017-04-17 15:31:52.832-04	2017-04-17 15:31:52.941-04	\N	\N	2017-04-17 15:31:52.832-04		77	275	\N	1
2475	3	278	GBP	4250	PayPal Fees	\N	2017-04-17 17:06:54.729-04	2017-04-17 17:06:54.818-04	\N	\N	2017-04-17 17:06:54.729-04		76	275	\N	1
2209	3	278	GBP	39800	Google I/O travel grant: Anastasia D. 	\N	2017-03-31 14:01:48.379-04	2017-03-31 14:01:48.43-04	\N	\N	2017-03-31 14:01:48.379-04		76	275	\N	1
2212	3	286	USD	100000	Leadership Development: Google I/O Travel grant for Karina M.	\N	2017-03-31 18:32:34.085-04	2017-03-31 18:32:34.135-04	\N	\N	2017-03-31 18:32:34.085-04		126	293	\N	1
2215	3	286	USD	7500	PayPal Fees for Google I/O transfer	\N	2017-03-31 18:52:45.044-04	2017-03-31 18:52:45.089-04	\N	\N	2017-03-31 18:52:45.044-04		126	275	\N	1
2474	3	278	GBP	85000	Travel Stipend for CONNECT	\N	2017-04-17 17:05:14.99-04	2017-04-17 17:05:15.087-04	\N	\N	2017-04-17 17:05:14.99-04		76	275	\N	1
2794	3	59	USD	90000	Adroit Resources - Global Development	\N	2017-05-11 12:41:16.673-04	2017-05-11 12:41:16.796-04	\N	\N	2017-05-11 12:41:16.673-04		96	275	\N	1
2477	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	2017-04-17 18:09:42.506-04	2017-04-17 18:09:42.582-04	\N	\N	2017-04-17 18:09:42.506-04		73	13	\N	1
2486	3	278	GBP	41000	Leadership Development: Director Stipend to attend NY Stock Exchange Bell Ringing	\N	2017-04-17 18:31:52.609-04	2017-04-17 18:31:52.754-04	\N	\N	2017-04-17 18:31:52.609-04		76	275	\N	1
2471	3	277	USD	9000	PayPal fees to transfer Google I/O stipend	\N	2017-04-17 15:41:07.575-04	2017-04-17 15:41:07.676-04	\N	\N	2017-04-17 15:41:07.575-04		86	275	\N	1
2713	3	430	USD	1200	Western Union Fees for Google I/O grant	\N	2017-05-04 14:58:24.782-04	2017-05-04 14:58:24.948-04	\N	\N	2017-05-04 14:58:24.947-04		\N	51	\N	1
2710	3	276	USD	2175	In honour of Maya Johnston	\N	2017-05-04 12:21:53.626-04	2017-05-04 12:21:53.703-04	\N	\N	2017-05-04 12:21:53.702-04		\N	51	\N	1
2522	3	59	USD	610	PayPal Fees for Google I/O	\N	2017-04-19 14:35:02.98-04	2017-04-19 14:35:03.062-04	\N	\N	2017-04-19 14:35:03.062-04		\N	51	\N	1
2702	3	259	USD	2175	Catherine L. - fees and Global development	\N	2017-05-03 20:12:19.758-04	2017-05-03 20:12:19.828-04	\N	\N	2017-05-03 20:12:19.827-04		\N	51	\N	1
2521	3	3	USD	1190	PayPal Fees for Google I/O	\N	2017-04-19 14:26:58.952-04	2017-04-19 14:26:59.01-04	\N	\N	2017-04-19 14:26:59.009-04		\N	51	\N	1
2519	3	2	USD	1480	PayPal Fee for Google I/O Ticket	\N	2017-04-19 14:18:17.942-04	2017-04-19 14:18:19.333-04	\N	\N	2017-04-19 14:18:19.333-04		\N	51	\N	1
2783	4749	522	CAD	1000	Donation to Women Who Code Vancouver	\N	2017-05-10 19:45:43.437-04	2017-05-10 19:45:46.821-04	\N	2888	2017-05-10 19:45:46.821-04	\N	\N	747	\N	1
2636	3419	516	USD	200	Monthly donation to Women Who Code Huntsville	2031	2017-04-30 21:40:26.938-04	2017-04-30 21:40:31.729-04	\N	2749	2017-04-30 21:40:31.727-04	\N	\N	841	\N	1
\.


                                                                                                             4003.dat                                                                                            0000600 0004000 0002000 00000071457 13174666341 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        43	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 12:04:53.229-05	2016-02-02 12:04:53.229-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
41	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 11:36:35.761-05	2016-02-02 11:36:35.761-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
44	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 12:09:19.757-05	2016-02-02 12:09:19.757-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
39	*****@paypal.com	*****	*****	stripe	\N	2016-01-29 17:23:51.784-05	2016-01-29 17:23:51.784-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
51	*****@paypal.com	*****	*****	stripe	\N	2016-02-09 23:12:33.556-05	2016-02-09 23:12:33.556-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
80	*****@paypal.com	*****	*****	stripe	\N	2016-02-25 18:45:02.363-05	2016-02-25 18:45:02.363-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
203	*****@paypal.com	*****	*****	stripe	\N	2016-04-25 10:42:01.738-04	2016-04-25 10:42:02.272-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
323	*****@paypal.com	*****	*****	stripe	\N	2016-05-26 20:52:12.759-04	2016-05-26 20:52:14.148-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
507	*****@paypal.com	*****	*****	stripe	\N	2016-07-12 17:19:35.579-04	2016-07-12 17:19:36.177-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
572	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 15:30:20.399-04	2016-08-03 15:30:20.964-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
703	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 14:22:18.085-04	2016-08-31 14:22:28.874-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
715	*****@paypal.com	*****	*****	stripe	\N	2016-09-05 12:25:43.529-04	2016-09-05 12:25:44.192-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
884	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 12:49:14.672-04	2016-10-07 12:49:15.283-04	\N	\N	1446	\N	\N	712	2017-10-27 13:28:55.902-04	\N	f	\N
880	*****@paypal.com	*****	*****	stripe	\N	2016-10-06 14:36:35.196-04	2016-10-06 14:36:35.794-04	\N	\N	1438	\N	\N	713	2017-10-27 13:28:55.907-04	\N	f	\N
773	*****@paypal.com	*****	*****	stripe	\N	2016-09-20 16:58:49.788-04	2016-09-20 16:58:50.526-04	\N	\N	1244	\N	\N	717	2017-10-27 13:28:55.926-04	\N	f	\N
707	*****@paypal.com	*****	*****	stripe	\N	2016-09-01 10:41:33.663-04	2016-09-01 10:41:34.394-04	\N	\N	1094	\N	\N	738	2017-10-27 13:28:55.978-04	\N	f	\N
731	*****@paypal.com	*****	*****	stripe	\N	2016-09-09 23:42:49.13-04	2016-09-09 23:42:49.63-04	\N	\N	1158	\N	\N	737	2017-10-27 13:28:55.978-04	\N	f	\N
306	*****@paypal.com	*****	*****	stripe	\N	2016-05-23 16:27:26.16-04	2016-05-23 16:27:26.962-04	\N	\N	426	\N	\N	741	2017-10-27 13:28:55.996-04	\N	f	\N
381	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 20:53:45.068-04	2016-06-06 20:53:45.674-04	\N	\N	555	\N	\N	743	2017-10-27 13:28:55.997-04	\N	f	\N
562	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 11:55:23.426-04	2016-08-01 11:55:24.6-04	\N	\N	884	\N	\N	750	2017-10-27 13:28:56.004-04	\N	f	\N
571	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 13:47:13.706-04	2016-08-03 13:47:14.326-04	\N	\N	896	\N	\N	759	2017-10-27 13:28:56.022-04	\N	f	\N
42	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 11:52:00.333-05	2016-02-02 11:52:00.333-05	\N	\N	80	\N	\N	768	2017-10-27 13:28:56.042-04	\N	f	\N
435	*****@paypal.com	*****	*****	stripe	\N	2016-06-22 16:09:44.066-04	2016-06-22 16:09:44.651-04	\N	\N	646	\N	\N	771	2017-10-27 13:28:56.058-04	\N	f	\N
430	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 12:02:53.255-04	2016-06-21 12:02:53.912-04	\N	\N	642	\N	\N	775	2017-10-27 13:28:56.06-04	\N	f	\N
431	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 12:04:57.958-04	2016-06-21 12:04:59.511-04	\N	\N	642	\N	\N	775	2017-10-27 13:28:56.06-04	\N	f	\N
432	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 12:06:02.746-04	2016-06-21 12:06:03.475-04	\N	\N	642	\N	\N	775	2017-10-27 13:28:56.06-04	\N	f	\N
377	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 15:04:34.62-04	2016-06-06 15:04:35.385-04	\N	\N	551	\N	\N	781	2017-10-27 13:28:56.083-04	\N	f	\N
737	*****@paypal.com	*****	*****	stripe	\N	2016-09-13 00:15:02.169-04	2016-09-13 00:15:02.814-04	\N	\N	1178	\N	\N	788	2017-10-27 13:28:56.088-04	\N	f	\N
790	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 21:07:06.282-04	2016-09-22 21:07:07.667-04	\N	\N	1263	\N	\N	792	2017-10-27 13:28:56.108-04	\N	f	\N
842	*****@paypal.com	*****	*****	stripe	\N	2016-09-28 17:47:15.094-04	2016-09-28 17:47:16.348-04	\N	\N	1299	\N	\N	795	2017-10-27 13:28:56.112-04	\N	f	\N
219	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 14:46:16.188-04	2016-04-29 14:46:16.688-04	\N	\N	308	\N	\N	798	2017-10-27 13:28:56.115-04	\N	f	\N
230	*****@paypal.com	*****	*****	stripe	\N	2016-05-03 09:07:25.728-04	2016-05-03 09:07:26.509-04	\N	\N	308	\N	\N	798	2017-10-27 13:28:56.115-04	\N	f	\N
461	*****@paypal.com	*****	*****	stripe	\N	2016-07-01 18:31:42.782-04	2016-07-01 18:31:43.38-04	\N	\N	686	\N	\N	803	2017-10-27 13:28:56.134-04	\N	f	\N
152	*****@paypal.com	*****	*****	stripe	\N	2016-03-25 11:11:03.086-04	2016-03-25 11:11:03.086-04	\N	\N	192	\N	\N	805	2017-10-27 13:28:56.135-04	\N	f	\N
589	*****@paypal.com	*****	*****	stripe	\N	2016-08-05 16:48:05.525-04	2016-08-05 16:48:06.15-04	\N	\N	192	\N	\N	805	2017-10-27 13:28:56.135-04	\N	f	\N
216	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 09:51:16.73-04	2016-04-29 09:51:17.252-04	\N	\N	303	\N	\N	808	2017-10-27 13:28:56.138-04	\N	f	\N
71	*****@paypal.com	*****	*****	stripe	\N	2016-02-18 14:54:06.513-05	2016-02-18 14:54:06.513-05	\N	\N	108	\N	\N	813	2017-10-27 13:28:56.156-04	\N	f	\N
45	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 16:46:42.678-05	2016-02-02 16:46:42.678-05	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
90	*****@paypal.com	*****	*****	stripe	\N	2016-02-29 20:35:13.096-05	2016-02-29 20:35:13.096-05	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
124	*****@paypal.com	*****	*****	stripe	\N	2016-03-17 11:29:28.675-04	2016-03-17 11:29:28.674-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
110	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 22:35:50.332-05	2016-03-07 22:35:50.332-05	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
189	*****@paypal.com	*****	*****	paypal	\N	2016-04-20 10:14:38.754-04	2016-04-20 10:15:18.774-04	2016-04-20 10:15:18.772-04	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
385	*****@paypal.com	*****	*****	stripe	\N	2016-06-09 13:28:10.609-04	2016-06-09 13:28:11.319-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
587	*****@paypal.com	*****	*****	stripe	\N	2016-08-04 17:49:06.957-04	2016-08-04 17:49:07.534-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
701	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 04:34:48.855-04	2016-08-31 04:34:49.606-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
789	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 14:56:45.915-04	2016-09-22 14:56:47.116-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
885	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 16:46:31.454-04	2016-10-07 16:46:32.168-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
911	*****@paypal.com	*****	*****	stripe	\N	2016-10-15 11:47:38.174-04	2016-10-15 11:47:38.802-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
173	*****@paypal.com	*****	*****	stripe	\N	2016-04-13 12:46:07.391-04	2016-04-13 12:46:08.785-04	\N	\N	224	\N	\N	820	2017-10-27 13:28:56.165-04	\N	f	\N
64	*****@paypal.com	*****	*****	stripe	\N	2016-02-15 13:46:04.238-05	2016-02-15 13:46:04.238-05	\N	\N	7	\N	\N	821	2017-10-27 13:28:56.175-04	\N	f	\N
213	*****@paypal.com	*****	*****	stripe	\N	2016-04-28 11:01:14.747-04	2016-04-28 11:01:15.975-04	\N	\N	283	\N	\N	824	2017-10-27 13:28:56.177-04	\N	f	\N
561	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 11:54:11.721-04	2016-08-01 11:54:12.394-04	\N	\N	883	\N	\N	839	2017-10-27 13:28:56.206-04	\N	f	\N
26	*****@paypal.com	*****	*****	paypal	\N	2015-12-18 15:07:43.76-05	2016-05-26 11:38:39.069-04	2015-12-18 16:52:39.247-05	2016-05-26 11:38:39.068-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
320	*****@paypal.com	*****	*****	paypal	\N	2016-05-26 11:37:59.825-04	2016-05-26 11:38:38.996-04	2016-05-26 11:38:38.994-04	2016-08-03 17:40:05.198-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
176	*****@paypal.com	*****	*****	stripe	\N	2016-04-14 14:12:55.955-04	2016-04-14 14:12:56.555-04	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
1811	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 16:53:00.461-05	2017-02-01 16:53:01.901-05	\N	\N	30	\N	\N	691	2017-10-27 13:28:55.833-04	\N	f	\N
1804	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 12:30:44.023-05	2017-02-01 12:30:45.232-05	\N	\N	2906	\N	\N	692	2017-10-27 13:28:55.834-04	\N	f	\N
2546	*****@paypal.com	*****	*****	stripe	\N	2017-04-11 22:05:32.807-04	2017-04-11 22:05:33.502-04	\N	\N	4173	\N	\N	693	2017-10-27 13:28:55.836-04	\N	f	\N
1645	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 08:51:43.462-05	2017-01-18 08:51:44.621-05	\N	\N	2594	\N	\N	697	2017-10-27 13:28:55.866-04	\N	f	\N
288	*****@paypal.com	*****	*****	stripe	\N	2016-05-19 15:24:40.781-04	2016-05-19 15:24:41.33-04	\N	\N	392	\N	\N	718	2017-10-27 13:28:55.927-04	\N	f	\N
2104	*****@paypal.com	*****	*****	stripe	\N	2017-03-09 13:29:52.21-05	2017-03-09 13:29:53.195-05	\N	\N	3442	\N	\N	754	2017-10-27 13:28:56.019-04	\N	f	\N
1616	*****@paypal.com	*****	*****	stripe	\N	2017-01-14 12:11:39.386-05	2017-01-14 12:11:39.965-05	\N	\N	2549	\N	\N	762	2017-10-27 13:28:56.038-04	\N	f	\N
2048	*****@paypal.com	*****	*****	stripe	\N	2017-03-01 17:51:16.983-05	2017-03-01 17:51:18.471-05	\N	\N	1263	\N	\N	792	2017-10-27 13:28:56.108-04	\N	f	\N
1801	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 10:16:17.747-05	2017-02-01 10:16:18.471-05	\N	\N	2898	\N	\N	801	2017-10-27 13:28:56.132-04	\N	f	\N
1249	*****@paypal.com	*****	*****	stripe	\N	2016-11-28 10:33:12.012-05	2016-11-28 10:33:12.766-05	\N	\N	1890	\N	\N	810	2017-10-27 13:28:56.147-04	\N	f	\N
1111	*****@paypal.com	*****	*****	stripe	\N	2016-11-03 11:52:11.942-04	2016-11-03 11:52:12.638-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
1348	*****@paypal.com	*****	*****	stripe	\N	2016-12-02 14:17:05.459-05	2016-12-02 14:17:06.168-05	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
1744	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 19:05:21.392-05	2017-01-28 19:05:21.978-05	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
2091	*****@paypal.com	*****	*****	stripe	\N	2017-03-07 16:36:22.758-05	2017-03-07 16:36:23.955-05	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
2438	*****@paypal.com	*****	*****	stripe	\N	2017-04-04 15:51:02.77-04	2017-04-04 15:51:03.349-04	\N	\N	3999	\N	\N	836	2017-10-27 13:28:56.204-04	\N	f	\N
2030	*****@paypal.com	*****	*****	stripe	\N	2017-02-27 19:25:15.595-05	2017-02-27 19:25:16.385-05	\N	\N	3301	\N	\N	837	2017-10-27 13:28:56.204-04	\N	f	\N
1890	*****@paypal.com	*****	*****	stripe	\N	2017-02-10 11:47:30.914-05	2017-02-10 11:47:31.716-05	\N	\N	3053	\N	\N	838	2017-10-27 13:28:56.205-04	\N	f	\N
2642	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 05:34:08.282-04	2017-04-20 05:34:09.518-04	\N	\N	4348	\N	\N	840	2017-10-27 13:28:56.207-04	\N	f	\N
2643	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 06:17:20.159-04	2017-04-20 06:17:21.398-04	\N	\N	4348	\N	\N	840	2017-10-27 13:28:56.207-04	\N	f	\N
2535	*****@paypal.com	*****	*****	stripe	\N	2017-04-10 21:09:47.541-04	2017-04-10 21:09:48.354-04	\N	\N	4153	\N	\N	842	2017-10-27 13:28:56.223-04	\N	f	\N
1793	*****@paypal.com	*****	*****	stripe	\N	2017-01-31 10:51:34.575-05	2017-01-31 10:51:36.336-05	\N	\N	1325	\N	\N	843	2017-10-27 13:28:56.223-04	\N	f	\N
971	*****@paypal.com	*****	*****	paypal	\N	2016-10-22 06:52:05.33-04	2016-10-22 06:52:05.881-04	\N	2016-10-27 17:01:07.137-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
573	*****@paypal.com	*****	*****	paypal	\N	2016-08-03 17:38:52.082-04	2016-08-03 17:40:05.094-04	2016-08-03 17:40:05.093-04	2016-10-27 17:02:50.674-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1043	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 17:12:07.923-04	2016-10-31 17:12:53.002-04	2016-10-31 17:12:53.002-04	2016-10-31 17:34:17.33-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1024	*****@paypal.com	*****	*****	paypal	\N	2016-10-27 17:01:07.153-04	2016-10-27 17:02:50.617-04	2016-10-27 17:02:50.616-04	2016-10-31 17:08:26.464-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1042	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 17:04:38.968-04	2016-10-31 17:08:26.416-04	2016-10-31 17:08:26.414-04	2016-10-31 17:12:53.305-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1114	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 15:32:01.482-04	2016-11-03 15:32:02.116-04	\N	2016-11-03 15:33:52.634-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1044	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 17:33:13-04	2016-10-31 17:34:17.306-04	2016-10-31 17:34:17.306-04	2016-11-03 15:34:26.577-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
19	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 04:42:57.058-05	2015-12-16 13:22:05.853-05	\N	2015-12-16 13:22:05.842-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
18	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 04:42:53.531-05	2015-12-16 04:42:57.019-05	\N	2015-12-16 04:42:57.018-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
17	*****@paypal.com	*****	*****	paypal	\N	2015-12-15 22:05:01.805-05	2015-12-16 13:22:39.715-05	2015-12-15 22:05:25.467-05	2015-12-16 13:22:39.714-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
24	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 13:28:34.146-05	2015-12-16 13:28:36.228-05	\N	2015-12-16 13:28:36.227-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
29	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 12:51:35.761-05	2016-01-12 12:54:45.421-05	2016-01-12 12:52:16.235-05	2016-01-12 12:54:45.421-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
27	*****@paypal.com	*****	*****	stripe	\N	2016-01-06 19:55:36.615-05	2016-01-06 19:55:36.615-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
25	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 13:28:36.264-05	2016-01-12 12:52:16.325-05	2015-12-16 13:29:24.829-05	2016-01-12 12:52:16.323-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
30	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 12:53:19.259-05	2016-01-12 12:53:20.842-05	\N	2016-01-12 12:53:20.841-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
31	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 12:53:20.88-05	2016-01-12 12:54:22.364-05	\N	2016-01-12 12:54:22.343-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
34	*****@paypal.com	*****	*****	stripe	\N	2016-01-18 18:54:03.69-05	2016-01-18 18:54:03.69-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
32	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 12:54:22.442-05	2016-01-22 01:25:25.222-05	2016-01-12 12:54:45.399-05	2016-01-22 01:25:25.222-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
36	*****@paypal.com	*****	*****	paypal	\N	2016-01-23 13:23:35.682-05	2016-03-10 11:54:14.551-05	2016-01-23 13:23:58.941-05	2016-03-10 11:54:14.542-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
119	*****@paypal.com	*****	*****	paypal	\N	2016-03-11 16:34:11.535-05	2016-03-26 00:12:54.174-04	\N	2016-03-26 00:12:54.171-04	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
46	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 18:09:03.515-05	2016-02-02 18:09:03.515-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
68	*****@paypal.com	*****	*****	stripe	\N	2016-02-16 19:12:43.167-05	2016-02-16 19:12:43.165-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
105	*****@paypal.com	*****	*****	paypal	\N	2016-03-05 13:48:06.494-05	2016-03-10 11:53:49.77-05	\N	2016-03-10 11:53:49.769-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
117	*****@paypal.com	*****	*****	paypal	\N	2016-03-10 11:53:49.777-05	2016-03-10 11:54:14.484-05	2016-03-10 11:54:14.479-05	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
35	*****@paypal.com	*****	*****	paypal	\N	2016-01-22 01:24:39.343-05	2016-01-23 13:23:58.964-05	2016-01-22 01:25:25.199-05	2016-01-23 13:23:58.964-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
109	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 21:43:27.661-05	2016-03-07 21:43:27.661-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
252	*****@paypal.com	*****	*****	stripe	\N	2016-05-10 13:19:56.78-04	2016-05-10 13:19:58.837-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
494	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 12:25:56.621-04	2016-07-08 12:25:58.207-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
495	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 13:24:14.577-04	2016-07-08 13:24:15.71-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
524	*****@paypal.com	*****	*****	stripe	\N	2016-07-18 17:00:51.641-04	2016-07-18 17:00:52.921-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
567	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 00:54:45.226-04	2016-08-03 00:54:46.256-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
1040	*****@paypal.com	*****	*****	stripe	\N	2016-10-31 09:27:24.403-04	2016-10-31 09:27:25.268-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
1106	*****@paypal.com	*****	*****	stripe	\N	2016-11-02 18:49:22.021-04	2016-11-02 18:49:23.61-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
1262	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 13:35:19.012-05	2016-11-29 13:35:20.055-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
1701	*****@paypal.com	*****	*****	stripe	\N	2017-01-24 08:28:17.965-05	2017-01-24 08:28:21.097-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
1742	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 18:51:03.682-05	2017-01-28 18:51:05.032-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
1986	*****@paypal.com	*****	*****	stripe	\N	2017-02-22 13:25:00.347-05	2017-02-22 13:25:00.347-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
2071	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 11:55:18.286-05	2017-03-04 11:55:19.53-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
2074	*****@paypal.com	*****	*****	stripe	\N	2017-03-05 00:40:45.496-05	2017-03-05 00:40:48.337-05	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
2246	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 10:33:48.263-04	2017-03-25 10:33:51.315-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
2208	*****@paypal.com	*****	*****	stripe	\N	2017-03-21 23:28:09.493-04	2017-03-21 23:28:11.234-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
2247	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 11:36:50.843-04	2017-03-25 11:36:53.712-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
9	*****@paypal.com	*****	*****	paypal	\N	2015-11-23 13:13:00.576-05	2015-12-15 22:05:25.484-05	2015-11-30 12:00:17.828-05	2015-12-15 22:05:25.484-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
160	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 11:09:24.215-04	2016-04-01 11:09:25.585-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
23	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 13:22:06.064-05	2015-12-16 13:29:24.85-05	2015-12-16 13:22:39.681-05	2015-12-16 13:29:24.848-05	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
153	*****@paypal.com	*****	*****	paypal	\N	2016-03-26 00:12:54.185-04	2016-03-26 00:12:54.98-04	\N	\N	2	\N	\N	688	2017-10-27 13:28:55.832-04	\N	f	\N
94	*****@paypal.com	*****	*****	stripe	\N	2016-03-02 16:31:48.638-05	2016-03-02 16:31:48.638-05	\N	\N	129	\N	\N	689	2017-10-27 13:28:55.832-04	\N	f	\N
2888	*****@paypal.com	*****	*****	stripe	\N	2017-05-10 19:45:43.414-04	2017-05-10 19:45:44.785-04	\N	\N	4749	\N	\N	747	2017-10-27 13:28:56-04	\N	f	\N
2757	*****@paypal.com	*****	*****	stripe	\N	2017-05-01 13:13:32.205-04	2017-05-01 13:13:32.817-04	\N	\N	4550	\N	\N	785	2017-10-27 13:28:56.086-04	\N	f	\N
2922	*****@paypal.com	*****	*****	stripe	\N	2017-05-15 08:07:56.825-04	2017-05-15 08:07:57.556-04	\N	\N	4834	\N	\N	799	2017-10-27 13:28:56.115-04	\N	f	\N
2659	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 17:31:48-04	2017-04-20 17:31:49.294-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
2847	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 16:06:11.209-04	2017-05-08 16:06:11.921-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
159	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 10:33:31.759-04	2016-04-01 10:33:32.893-04	\N	\N	8	\N	\N	819	2017-10-27 13:28:56.163-04	\N	f	\N
11	*****@paypal.com	*****	*****	paypal	\N	2015-11-30 13:25:48.501-05	2015-12-03 18:53:17.763-05	\N	2015-12-03 18:53:17.762-05	7	\N	\N	821	2017-10-27 13:28:56.175-04	\N	f	\N
12	*****@paypal.com	*****	*****	paypal	\N	2015-12-03 18:53:17.772-05	2015-12-03 18:54:56.087-05	2015-12-03 18:54:56.084-05	\N	7	\N	\N	821	2017-10-27 13:28:56.175-04	\N	f	\N
2749	*****@paypal.com	*****	*****	stripe	\N	2017-04-30 21:40:26.919-04	2017-04-30 21:40:28.231-04	\N	\N	3419	\N	\N	841	2017-10-27 13:28:56.222-04	\N	f	\N
2860	*****@paypal.com	*****	*****	stripe	\N	2017-05-09 14:14:19.686-04	2017-05-09 14:14:21.05-04	\N	\N	4720	\N	\N	846	2017-10-27 13:28:56.225-04	\N	f	\N
1115	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 15:33:52.773-04	2016-11-03 15:34:26.403-04	2016-11-03 15:34:26.402-04	2016-11-03 15:41:28.484-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1116	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 15:35:14.952-04	2016-11-03 15:35:15.487-04	\N	2016-11-03 15:39:59.781-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1117	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 15:39:59.972-04	2016-11-03 15:41:28.432-04	2016-11-03 15:41:28.432-04	2016-11-18 16:01:23.135-05	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1189	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 16:00:56.092-05	2016-11-18 16:01:23.091-05	2016-11-18 16:01:23.091-05	2016-11-18 16:02:50.88-05	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1190	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 16:02:28.687-05	2016-11-18 16:02:50.197-05	2016-11-18 16:02:50.193-05	2016-11-18 16:03:32.325-05	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1191	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 16:03:06.664-05	2016-11-18 16:03:32.285-05	2016-11-18 16:03:32.285-05	2016-12-20 11:50:13.592-05	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1476	*****@paypal.com	*****	*****	paypal	\N	2016-12-20 11:45:05.334-05	2016-12-20 13:53:04.678-05	2016-12-20 13:53:04.677-05	2017-01-25 13:43:43.363-05	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1622	*****@paypal.com	*****	*****	stripe	\N	2017-01-16 13:03:53.804-05	2017-01-16 13:03:54.509-05	\N	\N	2561	\N	\N	700	2017-10-27 13:28:55.868-04	\N	f	\N
1257	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 05:03:21.517-05	2016-11-29 05:03:22.16-05	\N	\N	1908	\N	\N	707	2017-10-27 13:28:55.898-04	\N	f	\N
1893	*****@paypal.com	*****	*****	paypal	\N	2017-02-10 15:18:58.618-05	2017-03-14 13:47:25.438-04	2017-03-14 13:47:25.433-04	2017-03-14 13:48:00.117-04	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2149	*****@paypal.com	*****	*****	paypal	\N	2017-03-14 13:47:32.51-04	2017-03-17 11:34:02.314-04	2017-03-17 11:34:02.314-04	2017-03-17 11:34:41.542-04	3	2018-03-14 13:47:32.043-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2218	*****@paypal.com	*****	*****	paypal	\N	2017-03-22 16:58:36.077-04	2017-03-27 12:00:11.768-04	2017-03-27 12:00:11.767-04	2017-03-27 12:01:06.921-04	3	2018-03-22 16:58:35.533-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2180	*****@paypal.com	*****	*****	paypal	\N	2017-03-17 11:34:13.62-04	2017-03-22 16:58:30.022-04	2017-03-22 16:58:30.021-04	2017-03-22 16:59:49.26-04	3	2018-03-17 11:34:13.106-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2264	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 11:58:40.001-04	2017-03-27 11:58:40.001-04	\N	2017-03-27 12:01:06.923-04	3	2018-03-27 11:58:39.313-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2265	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 12:00:15.115-04	2017-03-27 13:46:18.273-04	2017-03-27 13:46:18.272-04	2017-03-27 13:46:43.247-04	3	2018-03-27 12:00:14.596-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2266	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 13:46:21.637-04	2017-03-27 13:54:36.2-04	2017-03-27 13:54:36.199-04	2017-03-27 13:55:03.518-04	3	2018-03-27 13:46:21.041-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2267	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 13:54:38.499-04	2017-03-31 13:54:59.737-04	2017-03-31 13:54:59.736-04	2017-03-31 13:57:17.587-04	3	2018-03-27 13:54:37.975-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2318	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 13:55:08.767-04	2017-03-31 18:33:10.929-04	2017-03-31 18:33:10.928-04	2017-03-31 18:33:37.928-04	3	2018-03-31 13:55:08.252-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2601	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 17:15:58.306-04	2017-04-17 17:15:58.306-04	\N	2017-04-17 17:17:31.155-04	3	2018-04-17 17:15:57.816-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2560	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 16:50:41.094-04	2017-04-13 16:57:22.555-04	2017-04-13 16:57:22.534-04	2017-04-17 15:34:05.25-04	3	2018-04-13 16:50:40.609-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2561	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 16:52:22.989-04	2017-04-13 16:52:22.989-04	\N	2017-04-13 16:57:22.804-04	3	2018-04-13 16:52:22.424-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2321	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 18:33:13.922-04	2017-03-31 18:33:37.801-04	2017-03-31 18:33:37.801-04	2017-04-13 16:57:22.795-04	3	2018-03-31 18:33:13.429-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2589	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 10:29:51.502-04	2017-04-17 10:29:51.502-04	\N	2017-04-17 15:34:05.252-04	3	2018-04-17 10:29:50.969-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2592	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 15:32:22.818-04	2017-04-17 15:32:22.818-04	\N	2017-04-17 15:34:05.253-04	3	2018-04-17 15:32:22.311-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2593	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 15:32:25.362-04	2017-04-17 15:32:25.362-04	\N	2017-04-17 15:34:05.254-04	3	2018-04-17 15:32:24.902-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2595	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 15:33:26.483-04	2017-04-17 15:33:26.483-04	\N	2017-04-17 15:34:05.255-04	3	2018-04-17 15:33:26.015-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2602	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 17:16:50.566-04	2017-04-17 17:17:30.886-04	2017-04-17 17:17:30.886-04	\N	3	2018-04-17 17:16:49.999-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2596	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 17:03:48.29-04	2017-04-17 17:03:48.29-04	\N	2017-04-17 17:17:31.145-04	3	2018-04-17 17:03:47.645-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2597	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 17:08:47.699-04	2017-04-17 17:08:47.699-04	\N	2017-04-17 17:17:31.148-04	3	2018-04-17 17:08:47.299-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2599	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 17:14:29.551-04	2017-04-17 17:14:29.551-04	\N	2017-04-17 17:17:31.151-04	3	2018-04-17 17:14:29.12-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2600	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 17:15:56.101-04	2017-04-17 17:15:56.101-04	\N	2017-04-17 17:17:31.153-04	3	2018-04-17 17:15:55.67-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2594	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 15:33:22.594-04	2017-04-17 17:16:44.162-04	2017-04-17 17:16:44.162-04	2017-04-17 17:17:31.156-04	3	2018-04-17 15:33:22.134-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
2846	*****@paypal.com	*****	*****	paypal	\N	2017-05-08 11:30:40.035-04	2017-05-08 11:30:40.035-04	\N	\N	3	2018-05-08 11:30:39.371-04	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
1646	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 08:53:28.297-05	2017-01-18 08:53:29.29-05	\N	\N	2594	\N	\N	697	2017-10-27 13:28:55.866-04	\N	f	\N
1647	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 08:54:47.775-05	2017-01-18 08:54:48.732-05	\N	\N	2594	\N	\N	697	2017-10-27 13:28:55.866-04	\N	f	\N
1471	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 20:41:26.69-05	2016-12-18 20:41:27.187-05	\N	\N	2220	\N	\N	699	2017-10-27 13:28:55.868-04	\N	f	\N
1472	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 20:41:58.818-05	2016-12-18 20:41:59.328-05	\N	\N	2220	\N	\N	699	2017-10-27 13:28:55.868-04	\N	f	\N
1211	*****@paypal.com	*****	*****	stripe	\N	2016-11-22 10:22:36.125-05	2016-11-22 10:22:37.512-05	\N	\N	1846	\N	\N	701	2017-10-27 13:28:55.869-04	\N	f	\N
93	*****@paypal.com	*****	*****	stripe	\N	2016-03-01 23:41:57.377-05	2016-03-01 23:41:57.377-05	\N	\N	126	\N	\N	704	2017-10-27 13:28:55.872-04	\N	f	\N
1179	*****@paypal.com	*****	*****	stripe	\N	2016-11-17 12:43:26.371-05	2016-11-17 12:43:27.368-05	\N	\N	1808	\N	\N	708	2017-10-27 13:28:55.899-04	\N	f	\N
1553	*****@paypal.com	*****	*****	stripe	\N	2017-01-03 15:59:34.532-05	2017-01-03 15:59:35.653-05	\N	\N	2416	\N	\N	709	2017-10-27 13:28:55.899-04	\N	f	\N
2855	*****@paypal.com	*****	*****	stripe	\N	2017-05-09 01:59:11.913-04	2017-05-09 01:59:13.104-04	\N	\N	4711	\N	\N	711	2017-10-27 13:28:55.901-04	\N	f	\N
1296	*****@paypal.com	*****	*****	stripe	\N	2016-11-30 11:11:39.675-05	2016-11-30 11:11:40.34-05	\N	\N	1957	\N	\N	710	2017-10-27 13:28:55.901-04	\N	f	\N
1718	*****@paypal.com	*****	*****	paypal	\N	2017-01-25 13:42:33.289-05	2017-01-25 13:43:43.316-05	2017-01-25 13:43:43.315-05	2017-02-10 15:19:25.564-05	3	\N	\N	857	2017-10-27 13:28:55.857-04	\N	f	\N
\.


                                                                                                                                                                                                                 4018.dat                                                                                            0000600 0004000 0002000 00000010527 13174666341 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        00-stripemanaged-model.js
01-transaction-model.js
02-group-model.js
03-card-model.js
04-application-model.js
05-user-model.js
06-paykey-model.js
07-activity-model.js
08-usergroup-model.js
09-application-group-model.js
10-transaction-model-relations.js
11-activity-model-relation.js
12-card-model-relation.js
20151030150110-addpaypalfield.js
20151208112311-add_group_public_flag.js
20151209114845-add_email_to_stripe_managed_account.js
20151221110406-add_stripesubscriptionid_to_transaction.js
20151230143257-add-longdescription-logo-video-image-expensePolicy-to-Group-migration.js
20151230150937-rename-membership_type-to-membershipType-migration.js
20151230160803-add_group_slug.js
20160105163703-add_transaction_payment_method.js
20160108134935-merge-name-field-and-add-website-and-twitter-handle-migration.js
20160108145839-updating-longDescription-datatype-migration.js
20160109164217-addVAT-migration.js
20160111104412-switch-expensepolicy-to-be-larger-migration.js
20160112093010-reshape_stripe_managed_account.js
20160113172636-add_stripe_accountid_to_user.js
20160113172933-replace-usergroup-role.js
20160115105814-add-website-twitter-to-group.js
20160119121646-add-pending-subscription.js
20160121133658-subscriptions-migration.js
20160128142427-add_reset_token_to_user.js
20160211190935-add-group-tiers.js
20160216121153-add-interval-to-transaction.js
20160218164134-add-new-constraint-to-UserGroups.js
20160219151355-add-usergroup-id.js
201602242300-add-vendor.js
20160225133109-rename-subscriptions-to-notifications.js
20160226153046-subscription-remodel.js
20160226154559-transactions-subscription-reshape.js
20160309143800-notifications-webhook.js
20160311090652-connected-account-migration.js
20160311113816-transaction-paranoid-migration.js
20160321114955-transaction-data.js
20160322231916-rename-card-to-paymentmethod-migration.js
20160323121731-rename-CardId-to-PaymentsMethodId-in-Transactions-migration.js
20160323133617-add-donations-table-migration.js
20160323152724-add-fields-to-transactions-migration.js
20160402120725-add-fee-fields-to-transactions-migration.js
20160405133705-add-burnrate-and-mission-to-group.js
201604150000-add-backgroundImage.js
201604150000-add-referer-to-users.js
20160415194252-add-netAmountInGroupCurrency-to-Transactions-migration.js
20160416141204-add-hostCommissionPercent-migration.js
20160505173300-add-connected-account-group-id.js
20160511222234-group-settings-and-whyjoin.js
20160519162112-make-group.slug-unique-migration.js
20160520153932-remove-user.email-unique-constraint-migration.js
20160602124940-group-data.js
20160608001600-add-expenses-table.js
20160610103923-add-payoutmethod-to-expense-migration.js
20160616161932-group-tags-and-supercollective-field-migration.js
20160610161454-add-users-description-organization.js
20160613174610-temporal-migration.js
20160713221132-user-add-longDescription.js
20160716003148-users-add-mission.js
20160802180635-add-paymentmethod-to-donation.js
20160815115600-add-sessions-table.js
20160822191515-processedAt-in-Donation-migration.js
20160918000000-users-add-firstname.js
20161007172819-lastEditedBy-in-Groups-migration.js
20161007175650-add-grouphistories-migration.js
20161012000000-comments.js
20161117000000-users-add-billingAddress.js
20161204000000-add-index.js
20161205175944-increase-group-mission-length-migration.js
201701040000-group-isActive.js
20170116163901-create-Event-migration.js
20170116170650-create-Tier-migration.js
20170116190354-create-Response-migration.js
20170124210251-New-fields-Event-Tier-Response-migration.js
20170125005855-Add-Lat-Long-in-Event-migration.js
20170127211709-remove-unused-transaction-fields-migration.js
20170127223729-change-amounts-to-ints-migration.js
20170209212119-add-response-to-migration.js
20170220000000-transactions-add-uuid.js
20170228184811-add-fields-to-PaymentMethod-migration.js
201703150000-add-timezone-events.js
20170310165323-add-notes-to-donations-migration.js
201704100000-updateTiers.js
20170525000000-event-addIndex.js
201706030000-add-HostId.js
201706300000-addTransactionDonationIndex.js
201707080000-add-tiers-maxQuantityPerUser.js
201707100000-add-tiers-to-group.js
201707120000-updatePaymentMethod.js
201707140000-GroupToCollective.js
201709020000-AddPaymentMethodData.js
201709110000-DoubleEntry.js
20171007190000-PopulateOrderFromCollectiveId.js
201710090000-TierDescription.js
20171018154610-create-org-members.js
20171024163252-host-cleanup.js
\.


                                                                                                                                                                         4019.dat                                                                                            0000600 0004000 0002000 00000000005 13174666341 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4020.dat                                                                                            0000600 0004000 0002000 00000004437 13174666341 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	100	USD	month	f	\N	*****	2016-02-02 11:36:36-05	2016-06-01 20:00:00-04	2016-02-29 20:07:14.394-05	2016-02-29 20:07:14.394-05	\N
7	100	USD	month	f	\N	*****	2016-02-02 12:04:54-05	2016-06-01 20:00:00-04	2016-02-29 20:07:14.807-05	2016-02-29 20:07:14.807-05	\N
3	100	USD	month	f	\N	*****	2016-02-02 12:09:20-05	2016-06-01 20:00:00-04	2016-02-29 20:07:13.303-05	2016-02-29 20:07:13.303-05	\N
8	100	USD	month	f	\N	*****	2016-02-02 16:46:43-05	2016-06-01 20:00:00-04	2016-02-29 20:07:15.151-05	2016-02-29 20:07:15.151-05	\N
2	100	USD	month	f	\N	*****	2016-02-02 18:09:04-05	2016-06-01 20:00:00-04	2016-02-29 20:07:12.938-05	2016-02-29 20:07:12.938-05	\N
16	100	MXN	month	f	\N	*****	2016-02-15 13:46:05-05	\N	2016-02-29 20:07:18.292-05	2016-02-29 20:07:18.292-05	\N
1	500	USD	month	f	\N	*****	\N	\N	2016-02-29 20:07:12.45-05	2016-02-29 20:07:12.45-05	\N
496	1000	USD	month	t	\N	*****	2016-09-09 23:42:55.758-04	\N	2016-09-09 23:42:49.141-04	2016-09-09 23:42:55.759-04	\N
33	100	USD	month	f	\N	*****	2016-03-01 23:42:15.671-05	2016-06-01 20:00:00-04	2016-03-01 23:41:59.934-05	2016-03-01 23:42:15.673-05	\N
4	500	MXN	month	f	\N	*****	2016-02-02 11:52:01-05	\N	2016-02-29 20:07:13.684-05	2016-02-29 20:07:13.684-05	\N
378	10000	USD	month	f	\N	*****	2016-08-03 13:47:24.609-04	2016-08-03 13:48:03.066-04	2016-08-03 13:47:17.197-04	2016-08-03 13:48:03.067-04	\N
2031	200	USD	month	t	\N	*****	2017-04-30 21:40:31.674-04	\N	2017-04-30 21:40:26.929-04	2017-04-30 21:40:31.674-04	\N
224	100	USD	month	t	\N	*****	2016-06-09 13:28:30.06-04	\N	2016-06-09 13:28:13.943-04	2016-06-09 13:28:30.069-04	\N
1366	2500	USD	month	t	\N	*****	2017-02-01 12:30:50.219-05	\N	2017-02-01 12:30:44.034-05	2017-02-01 12:30:50.219-05	\N
2039	500	USD	month	t	\N	*****	2017-05-01 13:13:36.243-04	\N	2017-05-01 13:13:32.216-04	2017-05-01 13:13:36.243-04	\N
286	1000	USD	month	t	\N	*****	2016-07-01 18:38:36.9-04	\N	2016-07-01 18:31:45.99-04	2016-07-01 18:38:36.9-04	\N
530	0	USD	month	f	\N	*****	2016-09-20 16:59:00.661-04	2017-01-16 10:00:35.909-05	2016-09-20 16:58:49.798-04	2017-01-16 10:00:35.909-05	\N
2103	1000	USD	month	t	\N	*****	2017-05-09 01:59:17.481-04	\N	2017-05-09 01:59:11.936-04	2017-05-09 01:59:17.482-04	\N
1238	1000	USD	month	f	\N	*****	2017-01-14 12:12:00.516-05	2017-02-22 18:10:02.422-05	2017-01-14 12:11:39.397-05	2017-02-22 18:10:02.422-05	\N
\.


                                                                                                                                                                                                                                 4023.dat                                                                                            0000600 0004000 0002000 00000033707 13174666341 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        40	backer	\N	200	EUR	\N	\N	\N	\N	2017-10-27 13:28:56.241-04	\N	\N	backers	\N	\N	TIER	524	month	\N	[200,1000,2500]
43	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.242-04	\N	\N	backers	\N	\N	TIER	275	\N	Become a backer	[2500,5000,10000]
45	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.242-04	\N	\N	sponsors	\N	\N	TIER	521	month	\N	\N
49	sponsor	\N	10000	CAD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	sponsors	\N	\N	TIER	522	month	\N	\N
50	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	backers	\N	\N	TIER	262	\N	Become a backer	[2500,5000,10000]
57	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.28-04	\N	\N	backers	\N	\N	TIER	271	\N	Become a backer	[2500,5000,10000]
61	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.286-04	\N	\N	backers	\N	\N	TIER	13	\N	Become a backer	[2500,5000,10000]
63	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.289-04	\N	\N	backers	\N	\N	TIER	300	\N	Become a backer	[2500,5000,10000]
64	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.335-04	\N	\N	backers	\N	\N	TIER	4	\N	Become a backer	[2500,5000,10000]
65	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.339-04	\N	\N	backers	\N	\N	TIER	268	\N	Become a backer	[2500,5000,10000]
69	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.358-04	\N	\N	backers	\N	\N	TIER	3	\N	Become a backer	[2500,5000,10000]
70	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.366-04	\N	\N	backers	\N	\N	TIER	282	\N	Become a backer	[2500,5000,10000]
72	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-10-27 13:28:56.368-04	\N	\N	backers	\N	\N	TIER	281	\N	Become a backer	[2500,5000,10000]
73	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.396-04	\N	\N	backers	\N	\N	TIER	270	\N	Become a backer	[2500,5000,10000]
74	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.398-04	\N	\N	backers	\N	\N	TIER	269	\N	Become a backer	[2500,5000,10000]
78	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.406-04	\N	\N	backers	\N	\N	TIER	279	\N	Become a backer	[2500,5000,10000]
79	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-10-27 13:28:56.409-04	\N	\N	backers	\N	\N	TIER	266	\N	Become a backer	[2500,5000,10000]
83	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.479-04	\N	\N	backers	\N	\N	TIER	241	\N	Become a backer	[2500,5000,10000]
84	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.488-04	\N	\N	backers	\N	\N	TIER	195	\N	Become a backer	[2500,5000,10000]
85	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-10-27 13:28:56.495-04	\N	\N	backers	\N	\N	TIER	301	\N	Become a backer	[2500,5000,10000]
87	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.515-04	\N	\N	backers	\N	\N	TIER	276	\N	Become a backer	[2500,5000,10000]
90	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.564-04	\N	\N	backers	\N	\N	TIER	294	\N	Become a backer	[2500,5000,10000]
93	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.616-04	\N	\N	backers	\N	\N	TIER	272	\N	Become a backer	[2500,5000,10000]
98	donor	Become a donor and help us support all the local Women Who Code collectives	\N	USD	\N	\N	\N	\N	2017-10-27 13:28:56.655-04	\N	\N	donors	\N	\N	TIER	51	\N	\N	["other",100000,500000,1000000]
99	Sponsors	Become a Sponsor and help us fulfill our mission to inspire women to excel in tech careers. See the description above for more info.	150000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.661-04	\N	\N	sponsors	\N	\N	TIER	48	\N	Become a Sponsor	[150000,300000,500000]
100	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.661-04	\N	\N	backers	\N	\N	TIER	48	\N	Become a backer	[2500,5000,10000]
101	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.676-04	\N	\N	backers	\N	\N	TIER	430	\N	Become a backer	[2500,5000,10000]
107	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.764-04	\N	\N	backers	\N	\N	TIER	513	month	\N	\N
110	sponsor	\N	10000	MXN	\N	\N	\N	\N	2017-10-27 13:28:56.771-04	\N	\N	sponsors	\N	\N	TIER	511	month	\N	\N
114	sponsor	\N	10000	EUR	\N	\N	\N	\N	2017-10-27 13:28:56.792-04	\N	\N	sponsors	\N	\N	TIER	523	month	\N	\N
115	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.86-04	\N	\N	sponsors	\N	\N	TIER	520	month	\N	\N
118	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.868-04	\N	\N	sponsors	\N	\N	TIER	519	month	\N	\N
119	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.873-04	\N	\N	backers	\N	\N	TIER	518	month	\N	\N
120	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.873-04	\N	\N	sponsors	\N	\N	TIER	518	month	\N	\N
123	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.89-04	\N	\N	backers	\N	\N	TIER	515	month	\N	\N
125	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.892-04	\N	\N	backers	\N	\N	TIER	14	\N	Become a backer	[2500,5000,10000]
126	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.916-04	\N	\N	backers	\N	\N	TIER	286	\N	Become a backer	[2500,5000,10000]
42	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.242-04	\N	\N	backers	\N	\N	TIER	292	\N	Become a backer	[2500,5000,10000]
47	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	sponsors	\N	\N	TIER	525	month	\N	\N
51	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	backers	\N	\N	TIER	510	month	\N	\N
56	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.279-04	\N	\N	backers	\N	\N	TIER	290	\N	Become a backer	[2500,5000,10000]
60	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-10-27 13:28:56.285-04	\N	\N	backers	\N	\N	TIER	291	\N	Become a backer	[2500,5000,10000]
97	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.649-04	\N	\N	backers	\N	\N	TIER	260	\N	Become a backer	[2500,5000,10000]
102	Backers	Support us with a donation and help us continue our activities.	2500	MXN	\N	\N	\N	\N	2017-10-27 13:28:56.681-04	\N	\N	backers	\N	\N	TIER	299	\N	Become a backer	[2500,5000,10000]
103	backer	\N	500	GBP	\N	\N	\N	\N	2017-10-27 13:28:56.695-04	\N	\N	backers	\N	\N	TIER	584	month	\N	\N
111	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.772-04	\N	\N	backers	\N	\N	TIER	512	month	\N	\N
121	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.876-04	\N	\N	backers	\N	\N	TIER	516	month	\N	\N
44	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.242-04	\N	\N	backers	\N	\N	TIER	521	month	\N	\N
46	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	backers	\N	\N	TIER	525	month	\N	\N
52	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	sponsors	\N	\N	TIER	510	month	\N	\N
54	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.279-04	\N	\N	backers	\N	\N	TIER	2	\N	Become a backer	[2500,5000,10000]
59	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.285-04	\N	\N	backers	\N	\N	TIER	285	\N	Become a backer	[2500,5000,10000]
67	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-10-27 13:28:56.344-04	\N	\N	backers	\N	\N	TIER	264	\N	Become a backer	[2500,5000,10000]
68	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.355-04	\N	\N	backers	\N	\N	TIER	284	\N	Become a backer	[2500,5000,10000]
71	Backers	Support us with a donation and help us continue our activities.	5000	MXN	\N	\N	\N	\N	2017-10-27 13:28:56.367-04	\N	\N	backers	\N	\N	TIER	10	\N	Become a backer	[5000,10000,25000,50000,100000]
75	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.399-04	\N	\N	backers	\N	\N	TIER	12	\N	Become a backer	[2500,5000,10000]
77	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-10-27 13:28:56.405-04	\N	\N	backers	\N	\N	TIER	267	\N	Become a backer	[2500,5000,10000]
80	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.41-04	\N	\N	backers	\N	\N	TIER	259	\N	Become a backer	[2500,5000,10000]
81	Backers	Support us with a donation and help us continue our activities.	2500	AUD	\N	\N	\N	\N	2017-10-27 13:28:56.411-04	\N	\N	backers	\N	\N	TIER	297	\N	Become a backer	[2500,5000,10000]
82	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.458-04	\N	\N	backers	\N	\N	TIER	265	\N	Become a backer	[2500,5000,10000]
89	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.537-04	\N	\N	backers	\N	\N	TIER	263	\N	Become a backer	[2500,5000,10000]
92	Backers	Support us with a donation and help us continue our activities.	2500	CAD	\N	\N	\N	\N	2017-10-27 13:28:56.594-04	\N	\N	backers	\N	\N	TIER	293	\N	Become a backer	[2500,5000,10000]
95	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.629-04	\N	\N	backers	\N	\N	TIER	261	\N	Become a backer	[2500,5000,10000]
106	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.727-04	\N	\N	sponsors	\N	\N	TIER	517	month	\N	\N
108	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.764-04	\N	\N	sponsors	\N	\N	TIER	513	month	\N	\N
109	backer	\N	500	MXN	\N	\N	\N	\N	2017-10-27 13:28:56.771-04	\N	\N	backers	\N	\N	TIER	511	month	\N	\N
116	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.86-04	\N	\N	backers	\N	\N	TIER	520	month	\N	\N
124	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.89-04	\N	\N	sponsors	\N	\N	TIER	515	month	\N	\N
41	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.242-04	\N	\N	backers	\N	\N	TIER	47	\N	Become a backer	[2500,5000,10000]
48	backer	\N	500	CAD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	backers	\N	\N	TIER	522	month	\N	\N
53	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.243-04	\N	\N	backers	\N	\N	TIER	295	\N	Become a backer	[2500,5000,10000]
55	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.279-04	\N	\N	backers	\N	\N	TIER	15	\N	Become a backer	[2500,5000,10000]
58	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.285-04	\N	\N	backers	\N	\N	TIER	288	\N	Become a backer	[2500,5000,10000]
62	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.286-04	\N	\N	backers	\N	\N	TIER	289	\N	Become a backer	[2500,5000,10000]
66	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.343-04	\N	\N	backers	\N	\N	TIER	287	\N	Become a backer	[2500,5000,10000]
76	Backers	Support us with a donation and help us continue our activities.	2500	GBP	\N	\N	\N	\N	2017-10-27 13:28:56.403-04	\N	\N	backers	\N	\N	TIER	278	\N	Become a backer	[2500,5000,10000]
86	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.508-04	\N	\N	backers	\N	\N	TIER	277	\N	Become a backer	[2500,5000,10000]
88	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.537-04	\N	\N	backers	\N	\N	TIER	274	\N	Become a backer	[2500,5000,10000]
91	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.585-04	\N	\N	backers	\N	\N	TIER	273	\N	Become a backer	[2500,5000,10000]
94	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-10-27 13:28:56.616-04	\N	\N	backers	\N	\N	TIER	298	\N	Become a backer	[2500,5000,10000]
96	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.638-04	\N	\N	backers	\N	\N	TIER	59	\N	Become a backer	[2500,5000,10000]
104	sponsor	\N	10000	GBP	\N	\N	\N	\N	2017-10-27 13:28:56.695-04	\N	\N	sponsors	\N	\N	TIER	584	month	\N	\N
105	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.727-04	\N	\N	backers	\N	\N	TIER	517	month	\N	\N
112	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.772-04	\N	\N	sponsors	\N	\N	TIER	512	month	\N	\N
113	backer	\N	500	EUR	\N	\N	\N	\N	2017-10-27 13:28:56.792-04	\N	\N	backers	\N	\N	TIER	523	month	\N	\N
117	backer	\N	500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.868-04	\N	\N	backers	\N	\N	TIER	519	month	\N	\N
122	sponsor	\N	10000	USD	\N	\N	\N	\N	2017-10-27 13:28:56.876-04	\N	\N	sponsors	\N	\N	TIER	516	month	\N	\N
127	Backers	Support us with a donation and help us continue our activities.	2500	EUR	\N	\N	\N	\N	2017-10-27 13:28:56.927-04	\N	\N	backers	\N	\N	TIER	283	\N	Become a backer	[2500,5000,10000]
128	Backers	Support us with a donation and help us continue our activities.	2500	USD	\N	\N	\N	\N	2017-10-27 13:28:56.939-04	\N	\N	backers	\N	\N	TIER	280	\N	Become a backer	[2500,5000,10000]
\.


                                                         4025.dat                                                                                            0000600 0004000 0002000 00001442435 13174666341 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3535	CREDIT	Banner	2000	USD	2016-11-29 18:07:15.153-05	2016-11-29 18:07:15.39-05	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3dc39835-0671-450e-bd85-9d5622676954	857	857	6c708fae-e8f7-4e21-9926-462b9848d3fe
3972	DEBIT	3D Printer & Supplies	-30496	USD	2016-12-14 08:03:21.144-05	2016-12-14 08:03:21.949-05	48	142	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30496	591	9e429b4f-81f9-4ff9-bf62-9f292e3e9b1e	696	857	fc92e79f-1892-4b14-8545-58cdf4a45c8a
4141	DEBIT	Leadership - Planning for 2017 - Dinner	-9240	USD	2016-12-19 13:45:09.113-05	2016-12-19 13:45:09.64-05	48	142	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9240	602	03814f58-ecac-4145-b6bc-f448075970e0	696	857	2da22c14-d6f6-4d06-8f1e-8c2f8c95d67b
3842	DEBIT	Food for Anniversary Reception	-700	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-713	492	5ea9a1f3-af86-44ce-a16f-5c2b3fd2a5e3	843	857	83efef3f-fee7-4380-aed4-4185ea60c2e4
3841	DEBIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	-4400	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4444	486	534b6b59-e66e-4781-9a64-b546b15e08b6	843	857	3bf62d28-5b49-4df9-85b1-118aba1bb677
10131	DEBIT	Leadership meeting	-2989	USD	2017-05-16 17:59:48.206-04	2017-05-16 17:59:48.206-04	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	-2989	1086	f3f420fc-da24-41e2-ac54-8d18166e5162	696	857	a2a1d419-2a24-4def-b2dc-483e93cdfcb5
2946	DEBIT	Conference Travel	-53720	USD	2016-11-03 17:27:22.46-04	2016-11-03 17:27:22.847-04	48	142	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-53720	333	978ddad8-6f16-4c1c-9d03-58133cf4f3f3	696	857	ff49fbe4-13e7-4616-b316-34e19b7d98e2
637	DEBIT	April 7 South Hack Night	-5037	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.083-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5037	180	c136a783-1ea9-48e1-aa36-325bc67a6c44	847	857	e4ea7f17-9aa6-4942-bcd5-f0d3383ed0bc
639	DEBIT	April 4 Lightning Talks	-13315	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.091-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13315	183	8cd8612d-8c56-45a4-af58-054b1251d213	847	857	aa353515-b87f-4363-8cd8-c6b2966286b4
3833	DEBIT	Goodie Bags	-1058	USD	2016-12-07 15:49:55.814-05	2016-12-07 15:49:56.33-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1058	573	6493e4b7-0f63-4534-bf0b-f0ab17750c9e	826	857	762c7da2-4f3a-4e4e-9c36-63423dcfff86
640	DEBIT	May 2 Lightning Talks	-8979	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.092-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8979	184	761dc700-eac2-44ef-8aa7-a3dc7268e489	847	857	b831d10c-ef3b-45a0-a772-e43882f1889d
3795	DEBIT	Supplies	-3918	USD	2016-12-06 11:51:20.162-05	2016-12-06 11:51:20.661-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3918	508	e74be4f9-1c06-4a7a-ae85-656ef5ecf2e9	826	857	7a8204d0-d326-44f0-bd0b-d36dc50df8e9
3796	DEBIT	T-shirt order - Design Lead	-2698	USD	2016-12-06 11:51:54.984-05	2016-12-06 11:51:55.379-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	509	c884d630-10d6-4279-b84b-7383937f1478	826	857	52c27b31-315e-4817-8648-ff471513e653
3794	DEBIT	Marketing for IoT Hackathon	-1082	USD	2016-12-06 11:50:56.549-05	2016-12-06 11:50:57.046-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1082	502	e923e566-7e1f-4e3d-aa4d-3b2926add382	826	857	8024f2c2-fdab-4175-b691-79c5fdbeb038
3313	DEBIT	Thank you gift to an amazing sponsor!	-1700	USD	2016-11-22 07:31:00.49-05	2016-11-22 07:31:00.691-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1700	501	125a7d4b-8e1c-43c0-af9a-e948de08c5a3	826	857	8037fb93-1b42-4e1a-8b62-51b14a044d14
3599	DEBIT	Banner	-2000	USD	2016-11-30 13:40:24.258-05	2016-11-30 13:40:24.443-05	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	dddd092c-b5a8-475a-a35e-d4f12bc724d6	51	857	6e71dbdb-e577-4049-9384-ec4d02c04401
2799	DEBIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	-1305	USD	2016-10-31 13:52:11.82-04	2016-10-31 13:52:12.734-04	14	31	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1305	427	70dd8d78-1052-4a85-ac86-eeaed28d2c15	766	857	139c53ae-0208-458c-9dde-43f52d2aa333
3517	DEBIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	-227646	USD	2016-11-29 16:46:42.259-05	2016-11-29 16:46:42.259-05	14	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-227646	474	41da1426-3c94-4dfc-9beb-712e3ecf65d5	766	857	7e3123d0-8c9e-41cf-8ab1-a692daa242a9
2842	DEBIT	Transportation to get to GeekWire Summit social event 	-729	USD	2016-11-01 12:16:02.625-04	2016-11-01 12:16:02.953-04	14	31	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-729	402	f0415f03-23e6-4e11-8083-aac5401f4c17	766	857	10c979fd-c64e-4b51-af93-cc24fd7fa676
2808	DEBIT	Monthly team meeting w core six members. Food/pizza	-3323	USD	2016-10-31 17:02:15.762-04	2016-10-31 17:02:16.402-04	14	31	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3323	400	18e79267-4423-4db3-9fde-a81a0f812e43	766	857	95a17902-f84d-47ed-b725-220b42a0637d
250	DEBIT	WwConnect Planning Meeting	-2519	USD	2016-03-10 19:00:00-05	2016-06-14 14:14:21.794-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2519	60	007274b9-395d-410d-837a-e4c2863db761	766	857	c0a7bf5e-51b5-4a22-b5d3-dff55ed7b603
229	DEBIT	Mar 3 hack night	-4951	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.784-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4951	55	3e4baefa-db35-450e-9660-bc4dca4d53fc	847	857	33f0ccb1-fb6d-4696-84b6-b24b6834f072
638	DEBIT	May 5 South Hack Night	-5325	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.083-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5325	181	f3cdf43c-6016-4d3f-812c-eedaec5a2fb3	847	857	65e9cd2a-62f8-4a82-8a81-d7fda5662c13
231	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.794-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22568	56	dd78e12f-6874-43c4-aa5e-5b54aff99c4f	847	857	782bce74-c53f-4f49-ab81-ac6370f08280
232	DEBIT	Mar 7 Lightning Talks	-15316	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.794-04	2	28	\N	2016-06-14 14:14:22.455-04	\N	\N	\N	\N	\N	\N	\N	\N	-15316	57	814475bd-7972-4cc2-a22e-fe3da33bf0bf	847	857	40b4df1b-5288-4b55-8bf3-c5f550ea4a2e
7071	DEBIT	Mar 7 Lightning Talks	-15316	USD	2017-03-14 13:21:29.296-04	2017-03-14 13:21:29.332-04	2	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	-15790	57	f0262195-2244-40eb-b442-02995b885caa	847	857	ed4fa657-d5ba-4cfb-bf46-09bb677a6c5d
7070	DEBIT	February Lightning Talks food	-10680	USD	2017-03-14 13:17:53.891-04	2017-03-14 13:17:53.957-04	2	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	-11020	820	0b174ca7-35b7-4eb0-b540-345b64730630	847	857	b10a7260-c6ef-4e93-8ca5-a8d015161add
821	DEBIT	6/2/16 Fireside Chat at Orange Coworking	-20000	USD	2016-06-04 17:37:03.991-04	2016-06-14 14:14:22.145-04	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	211	ba544502-40c0-46d0-83d2-419108dfee18	847	857	5c7d4031-0b3b-43b4-bd69-824680cddc6e
3840	DEBIT	October Hack Night Drinks/Food.	-1100	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1106	485	88d96482-a87c-418a-b53b-a3c895b3d4ae	843	857	1d6c5db9-bbb9-4d1f-866c-388953e594b5
7520	DEBIT	Google I/O ticket	-37500	USD	2017-03-27 13:12:00.118-04	2017-03-27 13:12:00.138-04	12	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	-38618	949	98f9ec9a-496c-44d1-b27d-35dc1359a639	835	857	9a273c8e-9acc-4226-9f5e-5591a464eeab
7296	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-20 11:39:23.328-04	2017-03-20 11:39:23.364-04	277	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	924	1fdc2835-4858-4cd0-bada-76c19f0f9f0b	831	857	d92c5fcf-f167-4663-8df5-d39a3dc0b8b7
10119	DEBIT	Deposit- We Rise Conference Hosting Location	-500000	USD	2017-05-16 17:51:10.574-04	2017-05-16 17:51:10.574-04	12	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	-500000	1123	6f7e4a95-e8f5-408b-b4a6-c32168791436	690	857	6370bc9d-e41f-4d7c-b2f2-dd73c8ee7487
336	DEBIT	Meetup Transaction Fee	-163	USD	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.849-04	4	3	\N	2016-06-14 14:14:22.458-04	\N	\N	\N	\N	\N	\N	\N	\N	-163	82	d8012b7a-930b-4c21-a97d-60e676c4c08d	51	857	3112581d-3aa6-42f5-9358-0994999761ad
299	DEBIT	Reimburse Caterina for travel expenses to CONNECT 2016	-6500	USD	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.839-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6500	75	995b5cdf-7f5d-495b-8937-021414ea6d22	51	857	3f04b7f6-031e-4975-be44-86d2a6df090d
1583	DEBIT	Minimum Fee - May	-1000	USD	2016-08-16 10:54:57.595-04	2016-08-16 10:54:57.609-04	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	cbb3070b-f325-45ad-a323-1210bd2b0499	51	857	34d896ca-e194-46f5-b28f-e676aae981d1
613	DEBIT	Conference Grant	-120000	USD	2016-05-19 15:07:13.723-04	2016-06-14 14:14:22.074-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-120000	175	0ec09d11-719f-49c7-8785-cdf9a6660274	51	857	1c0e14d6-f0a5-45df-b913-cb66b3a199a6
6930	CREDIT	monthly recurring subscription	100	USD	2017-03-09 13:29:18.778-05	2017-03-09 13:29:18.778-05	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	97fbe8b4-4c66-46ec-bc2f-3432ad3db065	819	857	dfde5c0c-1b50-4538-959a-1a7cfe9cc337
2528	CREDIT	WWCode shirt Grisel	3649	USD	2016-10-17 16:48:59.282-04	2016-10-17 16:48:59.313-04	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	cdb75283-fd2d-49da-81ca-b7887f3bb44b	857	857	4bbbb64c-1520-49dd-ae63-dea31070d6a7
9042	CREDIT	\N	200	USD	2017-04-30 21:40:30.232-04	2017-04-30 21:40:30.232-04	516	3419	2749	\N	\N	2636	10	20	34	USD	1	200	136	\N	8c5b057c-7596-4791-a13a-fc2a64303098	841	857	30b2673f-24fa-4fa0-b262-c391f3f0c9ec
202	CREDIT	Recurring subscription	100	MXN	2016-03-15 16:05:22.15-04	2016-04-01 10:32:17.381-04	10	7	64	2016-04-07 10:32:17.381-04	\N	83	5	\N	\N	\N	\N	\N	\N	\N	d1d87139-4731-4474-a1a3-965cce286ed3	821	857	b383b223-4b0a-4d01-be67-7ba945dd430a
131	CREDIT	Recurring subscription	100	USD	2016-03-02 18:01:26.771-05	2016-04-16 16:40:58.719-04	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	8abd55fb-f09a-4c77-862a-144f73ebdd0d	819	857	fa3dd559-dd4e-47b7-89b2-9cafe18ac145
77	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 16:46:44.866-05	2016-04-16 16:40:58.7-04	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	ac7d9c6f-0090-4ff5-bd71-01aaef4f5b99	819	857	d7145c0b-68ab-46e4-a34e-d51484416e31
8210	CREDIT	\N	20000	USD	2017-04-04 15:51:04.916-04	2017-04-04 15:51:04.916-04	2	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	16300	\N	2d1d8ff1-e35e-417d-b676-75bc6130e73a	836	857	29a35294-dc8a-453d-a5a0-dd365f89fdf3
69	CREDIT	Donation to WWCode Mexico City	500	MXN	2016-02-02 11:52:02.237-05	2016-04-16 16:40:58.703-04	10	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	148	\N	26a163a5-8959-4ab4-bef5-3d07360183e6	768	857	190fa916-43fa-41aa-8b67-b66e907a5e6c
3627	CREDIT	Banner	2000	USD	2016-11-30 16:33:30.25-05	2016-11-30 16:33:30.386-05	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d7f0bea9-9ed6-4ec6-aada-f8d3fe14c421	857	857	8265195b-adaa-4c61-875d-387408976706
9879	CREDIT	\N	84000	USD	2017-05-09 14:14:23.283-04	2017-05-09 14:14:23.283-04	2	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	69522	\N	254136b6-233d-4361-9aa2-ceddc7305fe8	846	857	b0a771c2-2194-4efb-b7a8-c0d5bd4ce065
8398	CREDIT	\N	25000	USD	2017-04-10 21:09:50.621-04	2017-04-10 21:09:50.621-04	13	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	20670	\N	d4c8f44d-4c88-4533-87da-1bd5b6f1f16b	842	857	b2738221-6047-4b90-b44b-670604e54a2e
10051	CREDIT	\N	20000	USD	2017-05-15 08:07:59.63-04	2017-05-15 08:07:59.63-04	14	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	16530	\N	2f09aa94-9b15-47bc-8e9c-b8ab6d67d426	799	857	6de79560-48bf-4094-b92c-79c080ee96d2
9357	CREDIT	\N	500	USD	2017-05-01 13:13:34.851-04	2017-05-01 13:13:34.851-04	516	4550	2757	\N	\N	2644	25	50	41	USD	1	500	384	\N	9470e412-b1bd-46f6-a497-907e6d8c9a4d	785	857	403dbb08-8ccb-45c9-be4e-ad5c193ff638
2337	CREDIT	Quotient Hackathon support	90000	USD	2016-10-07 15:52:59.206-04	2016-10-07 15:52:59.391-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	9790ad68-05b0-4f76-a64a-0bfb9ffb7686	857	857	9fe73e46-d6e9-4b78-a516-d83f320b89d6
2539	DEBIT	Director t-shirt	-3325	USD	2016-10-17 17:01:02.872-04	2016-10-17 17:01:02.925-04	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3325	\N	73b25042-c1cc-45c6-9089-ec29736609fb	51	857	275a30a1-9c38-4b57-8c52-da31201a3e20
8728	CREDIT	\N	10000	USD	2017-04-20 06:17:23.286-04	2017-04-20 06:17:23.286-04	59	4348	2643	\N	\N	2532	500	1000	350	USD	1	10000	8150	\N	04384e27-0f6b-407a-a8d1-e8353f9a4c98	840	857	270be06e-f54a-4553-8935-7d5fae06111d
1391	CREDIT	Donation to WWCode Austin	150000	USD	2016-08-01 11:54:14.382-04	2016-08-01 11:54:14.468-04	2	883	561	\N	\N	488	7500	15000	3330	USD	1	150000	124170	\N	0577aa52-6ea8-4268-9559-de120c9fd743	839	857	bdf4346d-690f-4006-81d7-ca5f640406d5
6421	CREDIT	\N	30000	CAD	2017-02-27 19:25:20.325-05	2017-02-27 19:25:20.325-05	522	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396135	22416	26301	\N	e838bae8-af91-48a1-8619-e42c8aab84c7	837	857	8fd06a01-28ef-4514-867e-b776cb4edcd2
822	DEBIT	3/30/16 Python Gameathon prize - Udemy course	-2400	USD	2016-06-04 17:37:03.991-04	2016-06-14 14:14:22.155-04	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2400	213	0870d634-022a-48de-ac16-c6f668cbea2f	847	857	1a25f45f-ed35-4a86-8c6d-717dc10d9870
641	DEBIT	05-21-16 AI workshop	-30000	USD	2016-05-22 20:26:36.061-04	2016-06-14 14:14:22.092-04	2	28	\N	2016-06-14 14:14:22.535-04	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	b1caa950-29a7-4b01-b194-5ad97dade460	847	857	155254ed-fe8e-4f1d-be57-40075a8392cf
2285	DEBIT	Event Food	-2077	USD	2016-10-05 12:43:28.448-04	2016-10-05 12:43:28.644-04	59	171	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2077	374	cdf1fd80-a036-4c27-8a92-17a09ae5c91b	826	857	e6bc6073-09ae-4a33-9f98-deb59f5feafc
3837	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	-4000	GBP	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4000	507	57ffa5d8-ca36-46bc-8a78-8bf44617167e	830	857	0228da58-424a-4581-a6a3-b5f1697e8cac
7082	DEBIT	Supplies for Agile workshop (2/26)	-5798	USD	2017-03-14 14:16:43.183-04	2017-03-14 14:16:43.22-04	59	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	-5996	858	0f6dbfcd-8b66-44e1-8bfa-82b47855e172	826	857	29783586-78f4-463e-bd69-f7d6666ea8bd
1403	DEBIT	Transportation for Sandra and Cici to get to meeting location with core team members	-749	USD	2016-08-02 09:39:15.789-04	2016-08-02 09:39:15.797-04	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-749	256	c50bb623-b773-41c6-b71f-c815f6a3394c	766	857	1f28d946-794c-4c4c-9f8b-729a18cbb007
7080	DEBIT	Wearable Clothing Workshop	-33412	USD	2017-03-14 14:00:11.436-04	2017-03-14 14:00:11.448-04	48	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	-34411	815	cc901377-56a8-4787-a296-673763a20a9e	696	857	bf7562ea-4d7a-4294-a539-96aff3e8e42c
7079	DEBIT	Movie screening for "She Started It"	-25700	USD	2017-03-14 13:59:53.142-04	2017-03-14 13:59:53.153-04	48	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	-26475	814	af730af1-7a84-42eb-8443-96f03e6c8347	696	857	ba4e9485-1362-4312-8cf0-816d671cca2e
859	DEBIT	Global Development 	-150	USD	2016-06-09 14:38:16.857-04	2016-06-14 14:14:22.175-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	222	33ddf644-201a-470f-b745-de2dece2159b	51	857	16ba8e31-adbb-4029-a212-a24b5ad07149
5838	CREDIT	monthly recurring subscription	100	USD	2017-02-09 13:29:30.017-05	2017-02-09 13:29:30.017-05	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	5c8b0763-ddec-4adc-a069-ad809703c9dd	819	857	18564848-ce38-4b53-a4ce-9fae7f415bf6
4779	CREDIT	Recurring subscription	100	USD	2017-01-09 13:28:29.701-05	2017-01-09 13:28:29.701-05	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	410d7ba2-bc7c-4acf-9ad8-182b43caacd4	819	857	24f08b9a-535c-42ae-85a6-bb9623d1435f
5578	CREDIT	monthly recurring subscription	1000	USD	2017-02-01 18:34:44.326-05	2017-02-01 18:34:44.326-05	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	5a54016f-f69c-49ef-8d2f-f03740ca539c	803	857	e748be91-4a9f-421f-b363-6c004f5e5c28
6649	CREDIT	monthly recurring subscription	2500	USD	2017-03-01 13:37:53.591-05	2017-03-01 13:37:53.591-05	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	ec153d42-d2ae-4d56-a4aa-f223962a4ca2	692	857	1fcfdf19-cada-406e-a6e2-a7b8004a70b9
43	CREDIT	Donation to WWCode Mexico City	500	USD	2016-01-18 18:54:06.439-05	2016-04-16 16:40:58.672-04	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c9a65b3a-a9bd-40b3-a806-ec5d4a273187	688	857	c5de17c9-4baa-4b63-a3a3-53335a5881b7
289	CREDIT	Recurring subscription	100	USD	2016-04-02 21:49:19.352-04	2016-04-16 16:40:58.819-04	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	8ba471ba-ec4f-4181-a1d0-f1c2b029194d	688	857	83f43ec0-628e-4918-9543-c963678b86c0
104	CREDIT	Recurring subscription	500	USD	2016-02-18 20:11:10.784-05	2016-04-16 16:40:58.716-04	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c7a4ed19-aed5-411a-a5a9-72a1296ba3d3	688	857	95518964-9ad3-4896-bfd6-57a8d81faf48
78	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 18:09:05.702-05	2016-04-16 16:40:58.699-04	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	24dc1b5d-5ff4-456c-9765-3306cc4ce7bc	688	857	4f5773cd-701a-4c71-abdb-872b41fd17f3
132	CREDIT	Recurring subscription	100	USD	2016-03-02 19:24:57.083-05	2016-04-16 16:40:58.834-04	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	3a77dd06-45f7-43cd-94e3-dffec6785c2b	688	857	df3a9ab6-11bc-41f7-b037-77a14c52a405
2824	DEBIT	05-21-16 AI workshop	-30000	USD	2016-10-31 17:16:09.23-04	2016-10-31 17:16:09.38-04	2	28	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	1bcc20eb-8879-4cb4-834e-a2a7841a6419	847	857	11bc2b32-9a5d-4423-940f-8ecc533b3998
3234	DEBIT	Food (ATXDivHack)	-119954	USD	2016-11-18 16:01:43.887-05	2016-11-18 16:01:44.336-05	2	28	1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	-119954	466	6a6bfacf-cc60-4e92-a2dc-a0d97d985107	847	857	a1f1f964-6dc9-4b24-abad-3c2deabc8c3e
3284	DEBIT	Food (ATXDivHack)	-339421	USD	2016-11-21 10:23:08.279-05	2016-11-21 10:23:08.279-05	2	28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-339421	467	4a086d99-828a-4a85-8a6f-608d3bd7d765	847	857	83c11e42-2ce1-4cdb-b13a-b388750be32e
2820	DEBIT	Painters tape for signs  	-1136	USD	2016-10-31 17:14:51.746-04	2016-10-31 17:14:51.945-04	2	28	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1136	445	e40c1dfc-1af6-4b4d-9f6a-ec62ee2b7f8d	847	857	448d2bd8-c39d-4ae0-9bfb-f85c7fcf3cdb
2814	DEBIT	Drinks and snacks (ATXDivHack)	-75932	USD	2016-10-31 17:13:05.943-04	2016-10-31 17:13:06.106-04	2	28	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75932	449	2e748309-ca69-4812-83e1-506c5649d783	847	857	f0561edc-f86d-4800-8e4c-b2945ccbb63b
2817	DEBIT	Almond milk for coffee (ATXDivHack)	-1192	USD	2016-10-31 17:13:53.591-04	2016-10-31 17:13:53.747-04	2	28	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1192	446	4d9e5244-f21b-43cd-a486-409f2b41487c	847	857	d1a05845-b898-474a-bc0b-49881639d365
7527	DEBIT	To redeem travel stipend to Google I/O	-100000	USD	2017-03-27 13:54:16.729-04	2017-03-27 13:54:16.758-04	277	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	935	8fcc5228-26e5-41ca-8db6-80fd5ffe1d51	695	857	4e03aad4-e588-46bd-a069-24ecc0e16908
10594	CREDIT	Macy's donation - fees and global development	435000	USD	2017-02-13 19:21:10.361-05	2017-02-13 19:21:10.558-05	51	3	\N	2017-10-27 13:28:58.271-04	\N	\N	\N	\N	\N	\N	1	\N	435000	\N	9a504adb-d27d-4cf7-8087-cc423c86a52a	\N	857	03f2ce19-18c7-4d5d-9390-3b4bd48cd001
10631	DEBIT	Recurring subscription	-52	USD	2016-06-09 13:28:30.802-04	2016-06-09 13:28:30.841-04	819	8	385	\N	\N	320	5	\N	33	USD	1	-52	-100	\N	f7e5cca1-d4a2-4030-bdad-3eb9d050bd1c	3	857	b1354921-4cd1-4360-be0e-6dd5cf273ff6
10603	DEBIT	Donations via meetup - fees/global development	-20	USD	2017-02-06 17:56:24.306-05	2017-02-06 17:56:24.52-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20	-2000	\N	ff41dfc0-7cf4-4ec1-99d6-fc3ee8c56f47	272	857	1173aeb5-5f4c-40bb-96a2-7bc5f37cc316
10619	CREDIT	WWCode t-shirt sales	1964	USD	2017-01-17 22:29:40.155-05	2017-01-17 22:29:40.284-05	51	3	\N	2017-10-27 13:28:58.451-04	\N	\N	\N	\N	\N	\N	1	\N	1964	\N	dc17b740-732d-4d30-b2f7-57d290927082	\N	857	1fe75861-e92e-48bc-9506-32f2e181a1ab
10627	DEBIT	WWCode t-shirt sales	-1964	USD	2017-01-17 22:29:40.155-05	2017-01-17 22:29:40.284-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1964	-1964	\N	6b329979-6970-4761-bd1a-518ac5b95534	273	857	1fe75861-e92e-48bc-9506-32f2e181a1ab
10611	CREDIT	Donation via meetup	775	USD	2017-01-17 22:48:10.558-05	2017-01-17 22:48:10.699-05	51	3	\N	2017-10-27 13:28:58.627-04	\N	\N	\N	\N	\N	\N	1	\N	775	\N	d651070b-6013-4611-ad36-fbab581b46ad	\N	857	3b71a9e4-6819-439c-a2de-4037208530f4
10607	DEBIT	Donations - Fees 	-173	USD	2017-02-06 15:06:15.502-05	2017-02-06 15:06:15.622-05	857	3	\N	2017-02-05 19:00:00-05	\N	\N	\N	\N	\N	\N	1	-173	-17328	\N	de02797b-c3bf-42e0-bb68-c679b3356a17	2	857	4d8f998f-9a40-43ae-bbdd-ab756c9f0352
10589	DEBIT	Event sponsorship - transaction fees and global development 	-856500	USD	2017-03-02 01:00:43.46-05	2017-03-02 01:00:44.182-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-856500	-856500	\N	903692bc-a549-427b-bb3e-3ae0ae440f65	12	857	92b4a9ce-6205-4173-9229-806bb98ffdbc
10614	CREDIT	WWCode t-shirt sales	2371	USD	2017-01-17 22:33:30.061-05	2017-01-17 22:33:30.587-05	51	3	\N	2017-10-27 13:28:59.463-04	\N	\N	\N	\N	\N	\N	1	\N	2371	\N	955198d8-e5cf-44d7-9892-911bb5ca1023	\N	857	a4a96bc7-e851-4c91-a74b-d7e6694d1d92
10600	CREDIT	Taipei Donation - fees and global development	800	USD	2017-02-06 15:11:26.406-05	2017-02-06 15:11:26.522-05	51	3	\N	2017-10-27 13:29:00.137-04	\N	\N	\N	\N	\N	\N	1	\N	800	\N	2972f80e-218f-4066-9a2e-6e77263356fa	\N	857	de1c4ac6-b3ff-40ad-a654-d7f428c7abc7
10584	DEBIT	Women Techmaker WWCode Partnership Grant	-70000	USD	2016-05-19 15:17:47.24-04	2016-05-19 15:17:48.401-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-70000	-70000	\N	6106420c-2652-41ef-b61a-c551efe8b719	3	857	f8ffad3b-a7dd-4487-8cbb-dff04f985457
10342	CREDIT	Leadership meeting	2989	USD	2017-05-16 17:59:48.206-04	2017-05-16 17:59:48.206-04	696	142	\N	\N	\N	\N	\N	\N	0	USD	1	2989	2989	1086	82c03d89-f960-4292-9adb-bc5a1a039c8c	48	857	a2a1d419-2a24-4def-b2dc-483e93cdfcb5
10347	CREDIT	Conference Travel	53720	USD	2016-11-03 17:27:22.46-04	2016-11-03 17:27:22.847-04	696	142	1117	\N	\N	\N	\N	\N	\N	\N	1	53720	53720	333	828f4ba7-b131-4da5-b95b-cff93141cf9c	48	857	ff49fbe4-13e7-4616-b316-34e19b7d98e2
10343	CREDIT	Banner	2000	USD	2016-11-29 18:07:15.153-05	2016-11-29 18:07:15.39-05	51	3	\N	2017-10-27 13:28:58.859-04	\N	\N	\N	\N	\N	\N	1	\N	2000	\N	50f61bda-e557-42ad-a2ee-4d249779f8b2	\N	857	6c708fae-e8f7-4e21-9926-462b9848d3fe
10344	DEBIT	\N	-41370	USD	2017-01-16 13:03:56.108-05	2017-01-16 13:03:56.108-05	700	2561	1622	\N	\N	1537	2500	\N	1130	USD	1	-41370	-50000	\N	594bd743-47d9-40dd-96cb-7392f8f6e83c	48	857	1fd0e847-48d7-4b51-aaac-be2c17ace32c
10349	CREDIT	Dinner for last night's HackNight	13526	USD	2016-08-19 16:58:34.342-04	2016-08-19 16:58:34.554-04	696	142	573	\N	\N	\N	\N	\N	\N	\N	1	13526	13526	319	261a1f13-a9a9-46bf-a98c-fc9fac64f5ee	48	857	e5c5eefa-1c7a-4ef6-b703-e03be7ed3b8c
10346	DEBIT	\N	-16530	USD	2017-01-03 15:59:37.749-05	2017-01-03 15:59:37.749-05	709	2416	1553	\N	\N	1466	1000	\N	470	USD	1	-16530	-20000	\N	508b8f11-ebce-471e-9078-2ce96b3c933f	2	857	01692586-7d13-4465-a22c-c6900fb069a5
10351	CREDIT	Leadership - Planning for 2017 - Dinner	9240	USD	2016-12-19 13:45:09.113-05	2016-12-19 13:45:09.64-05	696	142	1191	\N	\N	\N	\N	\N	\N	\N	1	9240	9240	602	f9f93952-75e0-4283-90a4-2aea22603b54	48	857	2da22c14-d6f6-4d06-8f1e-8c2f8c95d67b
10532	DEBIT	\N	-786	CAD	2017-05-10 19:45:46.737-04	2017-05-10 19:45:46.737-04	747	4749	2888	\N	\N	2783	36	\N	46	USD	1.39860139860140009	-562	-1000	\N	5bf1d6ff-341d-47f1-b935-67fd11c2ee8d	522	857	94d99f44-fc14-4c09-a5b7-5f70a82c98c4
10536	CREDIT	\N	1198	USD	2017-04-18 20:19:14.321-04	2017-04-18 20:19:14.321-04	51	3	\N	2017-10-27 13:28:58.637-04	\N	2505	\N	\N	\N	USD	1	1198	1198	\N	eac617cd-b2d8-4316-9798-e92c70191fca	\N	857	3e1786f1-aa76-4276-a347-8c6eadc686a5
10547	DEBIT	\N	-1198	USD	2017-04-18 20:19:14.321-04	2017-04-18 20:19:14.321-04	857	3	\N	\N	\N	2505	0	\N	0	USD	1	-1198	-1198	\N	87154324-6595-4413-8cdc-e86ed126cfd9	12	857	3e1786f1-aa76-4276-a347-8c6eadc686a5
10542	DEBIT	\N	-50000	USD	2017-03-31 13:17:51.695-04	2017-03-31 13:17:51.695-04	857	3	\N	\N	\N	2204	0	\N	0	USD	1	-50000	-50000	\N	314c7c5d-d050-4a15-8e2f-024820ff75ca	2	857	a198562b-52cc-4fe7-a263-d580b59447c4
10561	CREDIT	International Women's Day Celebrations - Global	51750	USD	2017-03-28 14:27:16.525-04	2017-03-28 14:27:16.748-04	51	3	\N	2017-10-27 13:28:59.603-04	\N	\N	\N	\N	\N	\N	1	\N	51750	\N	21b87f33-9dbe-4de3-981b-4ee6e4c96e7c	\N	857	ba543d0f-f7fa-40c5-b6dd-44939aa66e0f
10571	DEBIT	International Women's Day Celebrations - Global	-51750	USD	2017-03-28 14:27:16.525-04	2017-03-28 14:27:16.748-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-51750	-51750	\N	435d6236-d77f-478e-864d-0364b0cf3b43	12	857	ba543d0f-f7fa-40c5-b6dd-44939aa66e0f
10557	CREDIT	\N	5000	USD	2017-04-17 16:41:53.602-04	2017-04-17 16:41:53.602-04	51	3	\N	2017-10-27 13:28:59.744-04	\N	2473	\N	\N	\N	USD	1	5000	5000	\N	be2f4a4c-caf1-4785-9dbd-ef09008bbee6	\N	857	c3377529-43b8-4f9f-b66c-dcb8dc2259da
10566	DEBIT	\N	-5000	USD	2017-04-17 16:41:53.602-04	2017-04-17 16:41:53.602-04	857	3	\N	\N	\N	2473	0	\N	0	USD	1	-5000	-5000	\N	df702362-ad57-4453-9f39-a7b1ea7b9d9c	517	857	c3377529-43b8-4f9f-b66c-dcb8dc2259da
96	CREDIT	Donation to WWCode Mexico City	100	MXN	2016-02-15 13:46:05.92-05	2016-04-01 10:32:17.223-04	10	7	64	2016-04-07 10:32:17.381-04	\N	83	\N	\N	\N	\N	\N	\N	\N	\N	eb1ff5a0-1e75-4d49-8c64-69e64f1b9d6f	821	857	46d93b35-fa63-4871-abe1-2acf134ece38
8350	CREDIT	monthly recurring subscription	100	USD	2017-04-09 14:28:49.104-04	2017-04-09 14:28:49.104-04	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	1ecffc14-65af-42e5-933f-1520f76d4685	819	857	b295ecdc-d3fc-4ba1-8397-939cce403eb1
3047	CREDIT	Recurring subscription	100	USD	2016-11-09 13:29:23.967-05	2016-11-09 13:29:23.967-05	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	c416f18a-645f-4ba1-bc60-7f6ef6291cf5	819	857	4c3e93f4-c2e7-4783-949c-50dbdcd50d0f
474	CREDIT	Recurring subscription	100	USD	2016-05-02 18:49:03.545-04	2016-05-02 18:49:03.612-04	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	625d1196-61d0-48d5-8a84-0cfd6a50c750	819	857	08e3c32b-080e-4a6d-ac00-7f8a88e49461
5969	CREDIT	monthly recurring subscription	1000	USD	2017-02-14 13:13:04.109-05	2017-02-14 13:13:04.109-05	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	41a806dd-fae3-47ec-8291-293cc822ae9b	762	857	ce843860-3c75-4dba-99fa-cdd471f2295b
842	CREDIT	Donation to WWCode Washington DC	100000	USD	2016-06-06 20:53:47.603-04	2016-06-06 20:53:47.649-04	13	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	82070	\N	9921b890-042c-4506-b8c0-2a77793a0783	743	857	a16488ed-69e4-431c-81f6-af686c654b25
2934	DEBIT	Cash for Prizes/Bartender	-50000	USD	2016-11-03 15:12:34.941-04	2016-11-03 15:12:35.306-04	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	fb9d785b-41ef-4c26-965c-98709813dd5f	51	857	dcef2565-7403-4ff8-87b4-0140eff9dfdb
4266	DEBIT	Meetup Fees	-6000	USD	2016-12-23 12:32:55.31-05	2016-12-23 12:32:55.31-05	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	622	f3c80fd2-e51b-4124-a687-69f0abae37d6	51	857	d7d39486-684f-46a4-a5fe-9c5a0a8dbdde
7083	DEBIT	Leadership Development	-50616	MXN	2017-03-14 14:17:51.969-04	2017-03-14 14:17:51.969-04	282	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-50616	-50616	887	f70817df-a428-4020-8076-87771fd39b1d	51	857	d79deb76-7b52-4c78-adf3-1037d938f6d7
538	DEBIT	Conference Grant - Sarah Olson	-110000	USD	2016-05-10 15:19:21.785-04	2016-06-14 14:14:22.032-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-110000	156	5b6a81e3-f2e8-4385-b39e-135cb7b5bb85	51	857	b3eea43c-5eb4-49a8-bb56-d71211e68d93
3949	DEBIT	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	-3776	USD	2016-12-13 13:41:20.962-05	2016-12-13 13:41:21.652-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3776	\N	962a1612-7780-4b02-809c-bba5e34b9bf9	51	857	e7dcddd1-f191-4425-97f1-89ff9d03e512
1627	DEBIT	Event supplies	-1797	USD	2016-08-19 13:24:23.638-04	2016-08-19 13:24:24.362-04	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1797	\N	aaa90df5-783d-4af5-aadb-848d7da27db0	51	857	e4917511-a33e-4d19-ba0c-d61dbdca8464
4408	DEBIT	Meetup Fees	-6000	USD	2016-12-27 14:50:16.992-05	2016-12-27 14:50:16.992-05	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	656	70608aa8-79be-468e-a263-d28237b8531a	51	857	3bf2fdfd-2a13-4b28-9bef-431ef1fdcc38
4406	DEBIT	Meetup Fees	-6000	USD	2016-12-27 14:46:50.958-05	2016-12-27 14:46:50.958-05	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	655	b66b4d98-0d80-41e7-8f34-1092f16b136c	51	857	d9c9126c-0c36-431c-b400-c8bf812c34a5
3292	DEBIT	Leadership Development Lodging	-64600	USD	2016-11-21 16:26:46.916-05	2016-11-21 16:26:46.916-05	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64600	\N	96bf91be-3e65-4ccc-932d-61631b570de0	51	857	554227b8-d3fa-4af7-b84d-5596ef817e2a
3291	DEBIT	TShirts	-145786	USD	2016-11-21 16:26:37.469-05	2016-11-21 16:26:37.469-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-145786	\N	c9204456-a67b-4951-a271-157ab6819d8b	51	857	3c9c22e0-ce42-4389-a4f5-eb818ff3c77b
2940	DEBIT	Stacey Schipper	-2322	USD	2016-11-03 15:45:04.691-04	2016-11-03 15:45:04.691-04	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2322	\N	29073502-ed37-49ed-a06e-428e9b043bf8	51	857	e8a5f2bd-3378-4e8c-bae2-bc398137e2ef
2935	DEBIT	More stickers to give away at events	-18800	USD	2016-11-03 15:14:58.094-04	2016-11-03 15:14:58.245-04	13	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-18800	\N	31e6e55f-79bc-4a6a-800e-81bc4f5aa825	51	857	473848c9-eac7-4ff7-942a-5410a901bdcb
7087	DEBIT	Leadership Development	-14915	MXN	2017-03-14 14:18:46.358-04	2017-03-14 14:18:46.358-04	511	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-14915	-14915	886	1f55f0d6-8cb7-4e26-bbce-64660bfdf8ad	51	857	31e9f524-e6f1-48db-a3e6-8eab9019f8d8
1580	DEBIT	Drinks for July monthly event	-3316	USD	2016-08-16 10:53:42.013-04	2016-08-16 10:53:42.04-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3316	\N	bc1e4ea6-63a9-41a3-bd5a-a25ff1b41c37	51	857	077aaf56-9fc4-49d5-942a-7e0358820cbc
10679	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 14:40:51.309-05	2016-12-23 14:40:51.479-05	51	3	\N	2017-10-27 13:28:58.468-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	36ced16e-ddff-4af2-bbbd-a14c50b4f5fc	\N	857	2381bb08-ee7c-4a0f-aba9-33335ecf09c0
10687	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 14:40:51.309-05	2016-12-23 14:40:51.479-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	fead26fe-7e94-4a9e-871f-5e21ee70b652	269	857	2381bb08-ee7c-4a0f-aba9-33335ecf09c0
10683	DEBIT	Global Development for Meetup Fee	-6000	JPY	2016-12-28 11:00:53.27-05	2016-12-28 11:00:49.939-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	02b8e1e3-b1cf-483b-950f-49abadee31e9	295	857	65cab975-fdba-49fd-880e-498adb65dc50
10680	CREDIT	Paypal Fees for Travel Stipend	3000	USD	2017-03-20 11:38:54.453-04	2017-03-20 11:38:53.749-04	51	3	\N	2017-10-27 13:28:58.455-04	\N	\N	\N	\N	\N	\N	1	\N	3000	\N	96042c2e-2ec5-4f95-b03d-41ec8dbefd9c	\N	857	200b3adf-a300-4777-8f07-8a07533073fa
10690	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:45:15.022-05	2016-12-23 11:45:15.147-05	51	3	\N	2017-10-27 13:28:58.664-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	0c75866f-a29c-4fd2-8b05-74a741746461	\N	857	451dc3be-ec3d-4788-a883-aa45be30f5cb
10688	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 11:50:35.869-05	2016-12-23 11:50:36.131-05	51	3	\N	2017-10-27 13:28:58.747-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	f3931e1e-f122-46b2-a6d0-7e337aef25d1	\N	857	55d4421e-43b3-4607-b487-9ff452df69b2
10686	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 14:37:32.49-05	2016-12-23 14:37:32.668-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	6936bbd3-8abe-4c74-9ab0-b4a1bfb3b2aa	268	857	7572a9eb-fca5-47f5-a11f-4d095a64b5a6
10681	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 11:24:49.292-05	2016-12-28 11:24:45.838-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	52d9d640-127f-4ccb-afc4-660458c49c1f	48	857	82396f62-2dcb-43f3-a1ce-fba7bc97cf0f
10695	CREDIT	Travel Stipend for Google I/O	100000	USD	2017-03-20 11:17:43.622-04	2017-03-20 11:17:42.994-04	51	3	\N	2017-10-27 13:28:59.177-04	\N	\N	\N	\N	\N	\N	1	\N	100000	\N	2c797b5e-4ad5-476a-82c0-0ba235fd60db	\N	857	935ff7a1-0a2a-4fe9-9670-05d520f51f19
10682	DEBIT	Global Development for Meetup Fee	-6000	CAD	2016-12-28 11:21:14.024-05	2016-12-28 11:21:10.449-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	da086b26-e232-46a6-9f69-c1ff19ec27fa	291	857	b105fe8d-0213-486a-8299-bd400d3da822
10689	DEBIT	Paypal Fees for Travel Stipend	-3000	USD	2017-03-20 11:38:54.453-04	2017-03-20 11:38:53.749-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3000	-3000	\N	3a7c858c-35db-41d4-94ec-93a969285957	277	857	200b3adf-a300-4777-8f07-8a07533073fa
10684	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 14:48:39.526-05	2016-12-23 14:48:39.685-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	c78c33ed-8264-40de-9070-3b7c41ecbfd0	270	857	93bd1c45-bcff-4b38-9586-c05972dd2951
10715	CREDIT	Network Development	15755	GBP	2016-10-07 10:03:54.031-04	2016-10-07 10:03:54.119-04	51	3	\N	2017-10-27 13:29:00.237-04	\N	\N	\N	\N	\N	\N	1	\N	15755	\N	07165657-a4c6-469b-9e4a-7a704f536bcc	\N	857	f48b2782-b4ca-4438-b2d8-1805cd8e4ef3
10905	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 11:31:33.43-05	2016-12-28 11:31:29.837-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	a3b4b08d-36a6-4120-aac2-181c8c40b74e	294	857	e36e005e-4d76-4c2d-80ca-658821ed1a07
10913	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-27 12:32:02.798-05	2016-12-27 12:32:02.918-05	51	3	\N	2017-10-27 13:28:58.36-04	\N	\N	\N	\N	\N	\N	1	\N	4900	\N	145204cb-7e2c-4f35-af6f-425b8079f23e	\N	857	11f5d65b-4e63-4aff-9c2a-ad7317682426
10920	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-27 12:32:02.798-05	2016-12-27 12:32:02.918-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4900	-4900	\N	efe3ab94-6621-440f-8b0b-cf0d03037c60	278	857	11f5d65b-4e63-4aff-9c2a-ad7317682426
10924	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:38:50.944-05	2016-12-27 11:38:51.039-05	51	3	\N	2017-10-27 13:28:58.256-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	1f7bf0dc-a89e-4c58-b085-26e9a48c39f7	\N	857	0261cca1-9caa-4099-abe4-0dd8210b2881
10934	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 12:02:53.836-05	2016-12-23 12:02:53.991-05	51	3	\N	2017-10-27 13:29:00.122-04	\N	\N	\N	\N	\N	\N	1	\N	4900	\N	18383e2c-7092-4216-a2ed-26ab23bf037a	\N	857	de03d6ba-2e86-497b-b23c-a3dcbe9c03f4
10921	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 12:24:55.371-05	2016-12-27 12:24:55.632-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	c1cdc2c3-c6f4-4c1c-932a-fbb26f23ec0f	279	857	f58c2b80-cb9c-4954-9a09-9f1fe5003f80
10931	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 12:20:13.429-05	2016-12-23 12:20:13.545-05	51	3	\N	2017-10-27 13:29:00.278-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	28c9898c-756c-403f-8bab-4010ce7cf147	\N	857	f763b116-f78f-4a0e-9bfa-7b95b227e4b9
10930	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:38:50.944-05	2016-12-27 11:38:51.039-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	39c2d4cc-35ff-4bff-9923-9bd8cd854ee4	272	857	0261cca1-9caa-4099-abe4-0dd8210b2881
10933	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-23 12:13:39.369-05	2016-12-23 12:13:39.507-05	51	3	\N	2017-10-27 13:28:59.592-04	\N	\N	\N	\N	\N	\N	1	\N	5700	\N	7f8b6efb-4144-4582-a1e2-6251087d34af	\N	857	b91d2dfc-37f9-46ff-89e7-5720d627f0e7
10927	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-23 12:41:14.029-05	2016-12-23 12:41:14.193-05	51	3	\N	2017-10-27 13:28:59.598-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	73261b82-3d4a-4827-90cc-0cc48279fe81	\N	857	ba148ad8-a26b-4522-b44a-2b70f50b900e
11128	CREDIT	Meetup Fees	6000	MXN	2016-12-27 13:01:07.417-05	2016-12-27 13:01:07.417-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	651	f5226ff5-35ef-4865-b07b-fb0926df4388	10	857	dde19676-312a-4192-9f69-25bc0496df11
11130	CREDIT	Meetup Fees	6000	USD	2016-12-27 12:49:39.83-05	2016-12-27 12:49:39.83-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	648	ec87e5fa-46ed-4947-8d26-a518f47bb37a	280	857	92508ea7-0eae-4a0b-9adc-43eb0eb98493
11140	CREDIT	Meetup Fees	6000	USD	2016-12-23 14:50:08.539-05	2016-12-23 14:50:08.539-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	628	c94fae5f-b1c2-4f90-942d-38d672f7fb06	270	857	9b97244f-1fe0-4825-b5b0-ee24a605d777
11143	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:56:04.579-05	2016-12-23 11:56:04.579-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	616	1b5544f3-e847-4fe3-9dd5-c98848d315e9	262	857	fc5c902e-b61b-49c6-ab66-5d24e99309ae
11152	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:52:20.827-05	2016-12-23 11:52:20.827-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	615	56b2ee09-6177-4c9d-8e7d-be5cfd591fe3	12	857	3f23c3f2-d3e8-4701-bee8-ca749db5f4fd
11153	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:49:17.444-05	2016-12-23 11:49:17.444-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	614	049b778d-d286-4252-adca-9fd83ae6edcf	261	857	5d64ba93-2f74-4120-b4d8-01f80d9d1e6a
11149	CREDIT	Stickers	15084	USD	2017-04-07 08:58:45.517-04	2017-04-07 08:58:45.531-04	841	3419	2321	\N	\N	\N	\N	\N	454	USD	1	15084	14630	889	f458367b-b7fa-40e8-a2c1-14755087156e	516	857	300eb94b-16cc-4cd2-913a-b9b63715b641
11158	CREDIT	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	2870	USD	2016-12-13 13:44:23.973-05	2016-12-13 13:44:24.945-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	2870	2870	\N	15334580-e5ae-43e6-af25-598d4570f2cb	59	857	e15c62f6-3259-4d72-8625-da07685874cf
2297	DEBIT	Stickers	-62984	USD	2016-10-06 11:49:20.942-04	2016-10-06 11:49:20.967-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-62984	\N	fbae4c36-1eef-4816-94f6-f9589f62ef9e	51	857	61746eee-f6f2-4bed-9076-531c3fc3d52c
11332	DEBIT	monthly recurring subscription	-798	USD	2017-05-10 00:43:13.462-04	2017-05-10 00:43:13.462-04	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	10c4c702-8ec2-48a7-a66c-a790e00edf7b	241	857	3b782053-8a58-4128-b592-959211e3658f
11340	CREDIT	Food for Anniversary Reception	713	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	843	1325	\N	\N	\N	\N	\N	\N	\N	\N	1	713	700	492	ee9fc99e-f19f-45ad-aaca-bb693c3e9638	273	857	83efef3f-fee7-4380-aed4-4185ea60c2e4
11342	DEBIT	Donation to WWCode Austin	-16390	USD	2016-04-13 12:46:10.463-04	2016-04-16 16:40:58.845-04	820	224	173	\N	\N	153	1000	\N	610	USD	1	-16390	-20000	\N	5b0c5276-e1bb-4a26-abdc-9a8ea978a72d	2	857	3ddc5505-7df8-4d8f-aa6c-02f95421022c
11349	CREDIT	Order for stickers of our official WWC Boulder/Denver chapter logo	7800	USD	2016-03-17 23:23:34.628-04	2016-06-14 14:14:21.77-04	755	68	\N	2016-06-14 14:14:22.448-04	\N	\N	\N	\N	\N	\N	1	7800	7800	48	65185e00-37f2-484e-80bc-ccf77c441d0c	15	857	2e26b793-2ad5-4133-a6dd-ff70a939d26b
11351	DEBIT	\N	-798	USD	2017-05-09 01:59:15.573-04	2017-05-09 01:59:15.573-04	711	4711	2855	\N	\N	2750	50	\N	52	USD	1	-798	-1000	\N	8c6c8ec6-2f8b-492c-b288-b2f3b64406bb	517	857	021fc8b5-92cb-4c07-a06d-93b01a542840
11346	CREDIT	Order for stickers of our official WWC Boulder/Denver chapter logo	7800	USD	2016-11-03 15:45:23.582-04	2016-11-03 15:45:24.25-04	755	68	1117	\N	\N	\N	\N	\N	\N	\N	1	7800	7800	48	027b8e2e-a4ea-4c8f-a1a5-9f2eac257ca1	15	857	2d2fcab4-35ad-4544-8ef7-43b53ac395bc
11348	CREDIT	Food for March Boulder, CO event	14000	USD	2016-03-17 14:48:54.413-04	2016-06-14 14:14:21.77-04	755	68	26	\N	\N	\N	\N	\N	\N	\N	1	14000	14000	46	b1e3bc25-f944-4210-bdfc-1585a53f3f6b	15	857	f809dfca-8d36-4ca1-b54a-13e0444175e6
11352	CREDIT	Leadership - Planning for 2017 - Evening Coffee	875	USD	2016-12-19 13:43:53.809-05	2016-12-19 13:43:54.334-05	696	142	1191	\N	\N	\N	\N	\N	\N	\N	1	875	875	603	a67e7042-6170-4f95-b30f-0d0224b0b90e	48	857	d8738a34-4867-46d7-b66f-131c9662f93f
11354	CREDIT	Robotics: Coding with Your Kids HackNight Supplies	20397	USD	2016-12-19 11:20:39.625-05	2016-12-19 11:20:40.499-05	696	142	1191	\N	\N	\N	\N	\N	\N	\N	1	20397	20397	604	88d6ece4-b4c3-46bf-a0b7-7d22d62dfe33	48	857	cdc44b41-809a-4a96-b89b-345067eeaf9b
3518	CREDIT	Global Development	20000	USD	2016-11-29 16:56:45.442-05	2016-11-29 16:56:45.713-05	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	6323fec2-eb32-4b9b-9134-9d658f2efe40	857	857	b14fff69-e67f-499d-ae33-f94fedcd88d0
3531	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 17:38:57.006-05	2016-11-29 17:38:57.13-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	\N	aeca0ae5-c39b-46b5-a46a-5a964ab43335	857	857	96ed78ef-1792-4e75-830c-10d4814b3a6c
9696	CREDIT	\N	30000	USD	2017-05-03 13:33:13.688-04	2017-05-03 13:33:13.688-04	51	3	\N	\N	\N	2694	0	0	0	USD	1	30000	30000	\N	bb0ff0a8-b5fd-44c9-ab0b-bf65a00eabbe	857	857	cb400d66-baf0-4462-9d1d-ac0003e755f1
2111	DEBIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	-2500	USD	2016-09-27 15:33:54.08-04	2016-09-27 15:33:54.272-04	48	142	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	367	4593d1b5-cc34-42f2-9f9a-00a5e0bb8366	696	857	5e2a673e-ae5e-43d6-b917-6f13861f4094
4230	DEBIT	Website - Domain Name	-2200	USD	2016-12-22 17:19:51.088-05	2016-12-22 17:19:52.143-05	48	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2200	372	09bf7a91-7939-4a04-80b5-721c536454af	696	857	a027cebd-c290-43e3-bde1-4f3bc9325ac1
1630	DEBIT	Dinner for last night's HackNight	-13526	USD	2016-08-19 16:58:34.342-04	2016-08-19 16:58:34.554-04	48	142	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13526	319	e4f6cb02-9565-4e90-8156-b4b6f7190889	696	857	e5c5eefa-1c7a-4ef6-b703-e03be7ed3b8c
2941	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-11-03 15:45:23.582-04	2016-11-03 15:45:24.25-04	15	68	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	920fcb4b-a53d-48d7-8294-2914e6c5df81	755	857	2d2fcab4-35ad-4544-8ef7-43b53ac395bc
460	DEBIT	Mile High Agile outreach- supplies	-1115	USD	2016-04-02 20:00:00-04	2016-06-14 14:14:21.989-04	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1115	136	4423d89d-fb84-4db4-acee-0adf95f0492e	755	857	9ab829a9-243e-43e6-beae-7cc8a0222405
461	DEBIT	WWC Stickers	-7000	USD	2016-03-17 20:00:00-04	2016-06-14 14:14:21.998-04	15	68	\N	2016-06-14 14:14:22.481-04	\N	\N	\N	\N	\N	\N	\N	\N	-7000	138	61723292-7257-4ab6-94d3-d267da41382b	755	857	ccb1ca1d-045f-427f-bc78-4e750039ca21
337	CREDIT	Donation to WWCode Austin	20000	USD	2016-04-13 12:46:10.463-04	2016-04-16 16:40:58.845-04	2	224	173	\N	\N	153	1000	2000	610	USD	1	20000	16390	\N	07e21011-0879-4523-b624-073fdfd704c3	820	857	3ddc5505-7df8-4d8f-aa6c-02f95421022c
2887	CREDIT	Recurring subscription	1000	USD	2016-11-01 19:32:30.439-04	2016-11-01 19:32:30.439-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	103586f6-637d-4a72-87bc-a5f247e540e6	803	857	88b1b138-0a60-492e-97c7-128fa8650f00
3669	CREDIT	Recurring subscription	1000	USD	2016-12-01 18:32:26.764-05	2016-12-01 18:32:26.764-05	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d7a57bda-4dda-46e1-badb-2dc573225d85	803	857	79bce5f4-b823-4f0a-b465-999849669afc
4957	CREDIT	\N	50000	USD	2017-01-16 13:03:56.108-05	2017-01-16 13:03:56.108-05	48	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	41370	\N	b7c440d2-8682-4b57-93b6-3d3dd3cfed88	700	857	1fd0e847-48d7-4b51-aaac-be2c17ace32c
211	DEBIT	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-03-17 23:23:34.628-04	2016-06-14 14:14:21.77-04	15	68	\N	2016-06-14 14:14:22.448-04	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	33473cbd-5d6e-4231-a8f5-eb5453ae7eb1	755	857	2e26b793-2ad5-4133-a6dd-ff70a939d26b
208	DEBIT	Food for March Boulder, CO event	-14000	USD	2016-03-17 14:48:54.413-04	2016-06-14 14:14:21.77-04	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	46	614a8194-5d1d-483a-b0ac-231a1f17a036	755	857	f809dfca-8d36-4ca1-b54a-13e0444175e6
4140	DEBIT	Leadership - Planning for 2017 - Evening Coffee	-875	USD	2016-12-19 13:43:53.809-05	2016-12-19 13:43:54.334-05	48	142	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-875	603	f95b80fd-f1aa-4343-894f-09450d3990a7	696	857	d8738a34-4867-46d7-b66f-131c9662f93f
4139	DEBIT	Leadership - Planning for 2017 - Afternoon Coffee	-1175	USD	2016-12-19 13:42:59.021-05	2016-12-19 13:42:59.545-05	48	142	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1175	601	8d0fb08a-cd76-4efd-acb9-1f5b191f029c	696	857	087c1528-738a-443d-9a09-7b866e23aad1
4137	DEBIT	Robotics: Coding with Your Kids HackNight Supplies	-20397	USD	2016-12-19 11:20:39.625-05	2016-12-19 11:20:40.499-05	48	142	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20397	604	b7646d69-4189-45a4-8672-7c783ff2f2b7	696	857	cdc44b41-809a-4a96-b89b-345067eeaf9b
3331	DEBIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	-8181	USD	2016-11-22 16:54:33.366-05	2016-11-22 16:54:33.644-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8181	499	bf974271-bd1f-43fd-b113-f1c26a528e73	826	857	3a526a80-7cd5-4fae-b4c8-8c5987945dca
2805	DEBIT	Food for JavaScript Study Night - Oct. 11th	-1446	USD	2016-10-31 14:19:11.822-04	2016-10-31 14:19:12.067-04	59	171	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1446	419	e2c41034-2610-460e-814d-b143dc9280fe	826	857	6dccfdc4-b0dd-46ba-bb03-b418cc09aefb
3332	DEBIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	-4874	USD	2016-11-22 16:55:10.575-05	2016-11-22 16:55:10.713-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4874	498	f33703a8-5093-41fa-8cc7-0f246e735325	826	857	bb6dc4dc-363f-43b9-9595-2b7cba6cb151
2939	DEBIT	Event Food	-6471	USD	2016-11-03 15:43:50.827-04	2016-11-03 15:43:51.096-04	59	171	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6471	377	cf42497b-d717-4d8e-99cc-d12ab8b99170	826	857	b3418f57-d8f7-4fe2-81be-1750637c8a9e
6199	DEBIT	Domain name for hackathon and study night projects	-1798	USD	2017-02-20 15:53:02.864-05	2017-02-20 15:53:02.879-05	59	171	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1798	497	3aae7b32-dbf9-4383-94eb-9c339211043a	826	857	f8cfabe6-38bf-4de6-9ab8-48bf1c6db577
5787	DEBIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	-9050	USD	2017-02-07 13:40:49.494-05	2017-02-07 13:40:49.852-05	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9050	790	e25d3885-580e-477b-ac27-6dfaa2ab8466	826	857	73e8f027-dcb6-4b58-b23d-7e6b78a413fb
4161	DEBIT	Mugs for WWCode-SV	-46419	USD	2016-12-20 13:57:28.399-05	2016-12-20 13:57:28.525-05	300	1374	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-46419	605	cecf6f0f-5fc0-40c8-8907-674372e1c419	706	857	85456b0f-e3a3-4a7f-b8fb-6a465979b713
5852	CREDIT	monthly recurring subscription	1000	USD	2017-02-09 23:43:49.515-05	2017-02-09 23:43:49.515-05	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	86ad6819-a20f-4543-a31c-0e1a121bb79f	737	857	96a4b886-6627-4269-8673-760bbd361d31
3056	CREDIT	Recurring subscription	1000	USD	2016-11-09 23:43:57.271-05	2016-11-09 23:43:57.271-05	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	00ceec95-2161-4179-acba-658bcc889e16	737	857	92348241-c8cb-4507-949e-bc1e8eb092a5
3886	CREDIT	Recurring subscription	1000	USD	2016-12-09 23:43:00.244-05	2016-12-09 23:43:00.244-05	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	3a1a2d26-2613-4c61-bb5f-a9fc2f3beffb	737	857	c4423122-2e7b-4cc2-a50b-bd812885ba7d
2370	CREDIT	Recurring subscription	1000	USD	2016-10-10 00:49:33.558-04	2016-10-10 00:49:33.558-04	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	270aedde-c9b9-4d4d-b0b2-c79795f17316	737	857	9c41cbbc-79c0-482d-8977-06f2b4996c29
7684	DEBIT	Travel stipend to attend the Google I/O 2017 Conference.	-100000	USD	2017-03-31 18:33:59.707-04	2017-03-31 18:33:59.731-04	286	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	-107430	962	a275cb86-6060-4e20-987b-c9d777f576df	698	857	338a3774-1b6a-4939-8bd1-fdfd32e2da1c
6271	DEBIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	-5458	USD	2017-02-22 10:27:45.429-05	2017-02-22 10:27:45.466-05	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5458	775	3cbee278-6d55-4ec8-b437-04378120a652	766	857	1a760957-cd4c-4a32-9d55-34b96de94a98
6270	DEBIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	-6100	USD	2017-02-22 10:27:02.607-05	2017-02-22 10:27:02.62-05	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6100	774	534ed69b-fc23-4c7d-8acc-b1efd554f7b9	766	857	01bd297f-63e3-4470-9509-67c8d46505af
571	DEBIT	Connect Conference video footage review	-2948	USD	2016-05-16 20:31:54.682-04	2016-06-14 14:14:22.053-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2948	167	79e8eb4f-159b-4d98-8bae-afc1989a3e44	766	857	227f2edd-8af1-450a-913d-a16f7d4e6546
252	DEBIT	Nike Dinner	-1000	USD	2016-03-17 20:00:00-04	2016-06-14 14:14:21.805-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	62	6ee48c71-0f0b-4cd8-b3c1-ad7860c9cdf5	766	857	b29cf052-aa10-4396-a9fa-8f215ba011fc
251	DEBIT	WwConnect Conference Set Up Day 1	-709	USD	2016-03-18 20:00:00-04	2016-06-14 14:14:21.805-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-709	61	ebea2a47-93be-4832-8bc9-85f559270863	766	857	e1a3b3f5-2eec-4746-94f7-2362b3b4a90c
1402	DEBIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	-10294	USD	2016-08-02 09:38:05.215-04	2016-08-02 09:38:05.831-04	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10294	255	3a3bfae0-f068-407d-a9ab-031441913c3a	766	857	f1f0d240-a25e-4965-a623-22e90f0d80cd
7510	DEBIT	payment to artists (spoken word) for performance at IWD event	-20000	USD	2017-03-27 08:47:25.654-04	2017-03-27 08:47:25.894-04	12	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	-20610	907	ac007c6a-85a6-404e-9ed8-8c1cb9e9e7e5	763	857	4289706d-9bd0-4988-ba71-449e21b134f5
7072	DEBIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	-20950	USD	2017-03-14 13:22:10.666-04	2017-03-14 13:22:10.681-04	12	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	-21588	899	bef0ae4e-365f-4158-a0e0-ee82ba3b21e6	763	857	966eb129-ea73-4d72-a90e-497187cef5f6
616	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-19 15:24:43.134-04	2016-05-19 15:24:43.182-04	2	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	41020	\N	4590ecf9-25b0-4935-9570-12af202cc187	718	857	7249597a-205c-487a-8e97-5f21b9ad99ae
2310	CREDIT	\N	12500	USD	2016-10-06 14:36:38.382-04	2016-10-06 14:36:38.382-04	2	1438	880	\N	\N	808	625	1250	305	USD	1	12500	10320	\N	21b39b65-f892-4961-bed4-4648745d3d23	713	857	6cf96c64-eaea-4a98-b90b-daa2dc7e0df9
3320	CREDIT	\N	30000	USD	2016-11-22 10:22:39.097-05	2016-11-22 10:22:39.097-05	59	1846	1211	\N	\N	1129	1500	3000	1050	USD	1	30000	24450	\N	3413acd7-804a-4bc1-9689-e91da23b2bdc	701	857	afe2005f-e779-4e4a-ba1a-175d8d454cca
4124	CREDIT	\N	2500	USD	2016-12-18 20:42:01.104-05	2016-12-18 20:42:01.104-05	259	2220	1472	2016-12-27 19:00:00-05	\N	1389	125	250	85	USD	1	2500	2040	\N	3290a890-4996-4581-a0b7-6db14e41f5a8	699	857	af39c90a-2377-492f-912f-c9374f51397b
2336	CREDIT	\N	2500	USD	2016-10-07 12:49:19.978-04	2016-10-07 12:49:19.978-04	241	1446	884	\N	\N	812	125	250	85	USD	1	2500	2040	\N	2ac309ea-89ad-4880-b72a-67054d83865d	712	857	e047b6ba-4b5e-47e3-9647-81065360400e
124	CREDIT	Donation to WWCode Washington DC	100	USD	2016-03-01 23:41:59.916-05	2016-04-16 16:40:58.728-04	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	2cd7b544-2cdd-4060-9426-eeb4bed04fb5	704	857	9f39cb25-a7eb-45c9-81f1-2468ed35b346
277	CREDIT	Recurring subscription	100	USD	2016-04-02 11:43:33.706-04	2016-04-16 16:40:58.808-04	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	6572dba9-3912-444c-96f4-5ddbec5c098c	704	857	2365e886-215b-47ac-850a-0cf7cc8c2b33
466	CREDIT	Recurring subscription	100	USD	2016-05-02 01:44:10.046-04	2016-05-02 01:44:10.072-04	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	21f38ce7-f977-4526-92c4-f488bc43b39d	704	857	a918a1db-381b-4a65-96ac-f63c6193ea01
282	CREDIT	Recurring subscription	500	MXN	2016-04-02 16:10:38.206-04	2016-04-02 16:10:38.242-04	10	80	42	2016-04-07 16:10:38.206-04	\N	68	\N	\N	\N	\N	\N	\N	\N	\N	8cc3139c-729d-497c-9aa9-1c6aba7f53bb	768	857	10c255d9-7412-4834-a08c-d1e6731019bc
8427	CREDIT	\N	2500	USD	2017-04-11 22:05:36.032-04	2017-04-11 22:05:36.032-04	13	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	2040	\N	b9bf7bb6-c80e-4b7f-8729-f2e26f39f5e9	693	857	56baf101-4766-4682-b78c-ec30641fea59
9408	CREDIT	monthly recurring subscription	2500	USD	2017-05-01 14:32:00.085-04	2017-05-01 14:32:00.085-04	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	2fcb187e-35f4-4735-9101-698ea41ab1aa	692	857	0bbfe2c0-518a-4ecf-a446-f43d22aba9de
472	CREDIT	Recurring subscription	100	USD	2016-05-02 14:15:35.25-04	2016-05-02 14:15:35.307-04	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	89fe586a-cc2d-4bbe-9781-196390e19e37	691	857	c039d2b2-9c7f-4d05-86b6-d69c85826f04
470	CREDIT	Recurring subscription	100	USD	2016-05-02 14:10:42.774-04	2016-05-02 14:10:42.847-04	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f99307f9-7e49-4414-a2cf-c69326ceb1c4	691	857	7e11f5f3-4a6e-48e8-8e9a-0655c159911a
126	CREDIT	Recurring subscription	100	USD	2016-03-02 12:53:54.346-05	2016-04-16 16:40:58.736-04	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	f7a13ef8-2a57-4e4b-99f1-3a016d405ebf	691	857	47dd166e-ec5f-4855-8122-28ebb32bf98c
68	CREDIT	Donation to WWCode Seattle	100	USD	2016-02-02 11:36:38.327-05	2016-04-16 16:40:58.702-04	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	74fb2375-fab0-436c-8f56-5051ee3c26ad	691	857	929ab8e9-e6c9-45de-a9dc-ca73a9390186
70	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 12:04:56.247-05	2016-04-16 16:40:58.698-04	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	bedf3c7c-2d98-43a2-b73b-761b68cd2b0c	691	857	02aae08e-e149-4e5a-a9e5-a06f412d6c9a
280	CREDIT	Recurring subscription	100	USD	2016-04-02 15:09:44.502-04	2016-04-16 16:40:58.811-04	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	de316074-f0f1-41f4-bd2d-502dbfeceeae	691	857	f9b7851f-3cd3-40d3-b273-5c4975312bbb
278	CREDIT	Recurring subscription	100	USD	2016-04-02 14:13:51.122-04	2016-04-16 16:40:58.81-04	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f2a2c11a-e7c9-4578-8401-fb4e1d15e22a	691	857	006ac0d6-db6e-4d95-a409-6810b449358d
475	CREDIT	Recurring subscription	100	USD	2016-05-02 20:15:49.65-04	2016-05-02 20:15:49.711-04	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	5ed9ac7d-2cbb-49b4-8eb0-35a8a50396b5	688	857	d42d68f8-0467-4cd7-9903-7e8cc707dd8a
10348	CREDIT	Website - Domain Name	2200	USD	2016-12-22 17:19:51.088-05	2016-12-22 17:19:52.143-05	696	142	1476	\N	\N	\N	\N	\N	\N	\N	1	2200	2200	372	0092e992-e860-45bf-a36d-1221bf809956	48	857	a027cebd-c290-43e3-bde1-4f3bc9325ac1
10354	DEBIT	monthly recurring subscription	-53	USD	2017-04-09 14:28:49.104-04	2017-04-09 14:28:49.104-04	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	ee04b160-f4f8-4fac-bcb3-3d496193b310	3	857	b295ecdc-d3fc-4ba1-8397-939cce403eb1
10359	CREDIT	Meetup Fees	6000	USD	2016-12-27 14:50:16.992-05	2016-12-27 14:50:16.992-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	656	9e67093c-39c6-43ee-8376-6d4b66cb14c5	288	857	3bf2fdfd-2a13-4b28-9bef-431ef1fdcc38
10362	CREDIT	TShirts	145786	USD	2016-11-21 16:26:37.469-05	2016-11-21 16:26:37.469-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	145786	145786	\N	a785ec6e-21cd-4695-b8a0-5e9c26483bc4	59	857	3c9c22e0-ce42-4389-a4f5-eb818ff3c77b
10366	CREDIT	Cash for Prizes/Bartender	50000	USD	2016-11-03 15:12:34.941-04	2016-11-03 15:12:35.306-04	51	3	1044	\N	\N	\N	\N	\N	\N	\N	1	50000	50000	\N	3e2c0d4e-9927-4494-a106-efcb6b3b7d87	2	857	dcef2565-7403-4ff8-87b4-0140eff9dfdb
10371	CREDIT	Event supplies	1797	USD	2016-08-19 13:24:23.638-04	2016-08-19 13:24:24.362-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1797	1797	\N	b4a23445-4ad1-4b91-8250-ebc1eaa7bb4d	59	857	e4917511-a33e-4d19-ba0c-d61dbdca8464
10651	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 13:37:31.611-05	2016-12-27 13:37:31.721-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	546641ea-1047-429c-a345-faa76d0f53ee	59	857	14273180-6985-4957-8193-0e8aad6753c1
10671	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-27 13:40:49.86-05	2016-12-27 13:40:49.921-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	afe0b5b2-a8fe-4684-b7e3-217ef6a627ba	286	857	210d6874-4b38-4092-93b5-3e7dd7ab10e1
10650	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 13:10:14.864-05	2016-12-27 13:10:14.928-05	51	3	\N	2017-10-27 13:28:58.555-04	\N	\N	\N	\N	\N	\N	1	\N	5700	\N	e4b4c5ad-3356-4786-b0ff-a18278677e22	\N	857	32b081bb-0a21-4501-8aef-e86bb83e3b15
10656	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-27 13:10:14.864-05	2016-12-27 13:10:14.928-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-5700	-5700	\N	6eb0acee-329b-4307-b1c9-a19297f8b5dd	283	857	32b081bb-0a21-4501-8aef-e86bb83e3b15
10675	CREDIT	Global Development for Meetup Fee	6000	JPY	2016-12-28 11:00:53.27-05	2016-12-28 11:00:49.939-05	51	3	\N	2017-10-27 13:28:58.817-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	c8ee903c-4c00-45ac-a825-0494ba6e1ea7	\N	857	65cab975-fdba-49fd-880e-498adb65dc50
10668	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:14:47.836-05	2016-12-27 11:14:47.951-05	51	3	\N	2017-10-27 13:28:59.477-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	42099949-eb7e-46f2-8e9e-1b28a51cac2e	\N	857	a8f7270c-7d07-4fde-87ec-e3b16c907cc5
10674	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 11:21:14.024-05	2016-12-28 11:21:10.449-05	51	3	\N	2017-10-27 13:28:59.512-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	20745200-7f4f-445d-b60b-d99caf4e58ed	\N	857	b105fe8d-0213-486a-8299-bd400d3da822
10635	CREDIT	\N	16563	EUR	2017-05-08 11:30:18.585-04	2017-05-08 11:30:18.585-04	51	3	\N	2017-10-27 13:28:59.655-04	\N	2741	\N	\N	\N	EUR	1	16563	16563	\N	e915f722-ac33-4472-95a3-70ef0abbc47e	\N	857	bd8a5e91-6874-4e32-b113-b3d7344639dd
10643	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 10:57:55.359-05	2016-12-28 10:57:51.831-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	596ee7ca-a9b9-4dc2-8e45-c9df76b267e6	241	857	d323e9f5-6b2f-4db2-8340-417addb4ddf6
10376	DEBIT	monthly recurring subscription	-2040	USD	2017-05-01 14:32:00.085-04	2017-05-01 14:32:00.085-04	692	2906	1804	\N	\N	1712	125	\N	85	USD	1	-2040	-2500	\N	01cb2009-1eab-4e3e-b667-9a19e0ab0bbd	271	857	0bbfe2c0-518a-4ecf-a446-f43d22aba9de
10381	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 12:04:56.247-05	2016-04-16 16:40:58.698-04	691	30	43	\N	\N	69	5	\N	33	USD	1	-52	-100	\N	8cc33871-dda0-4217-886d-9aae8dbcb186	13	857	02aae08e-e149-4e5a-a9e5-a06f412d6c9a
10385	CREDIT	05-21-16 AI workshop	30000	USD	2016-10-31 17:16:09.23-04	2016-10-31 17:16:09.38-04	847	28	1043	\N	\N	\N	\N	\N	\N	\N	1	30000	30000	186	f2fb4e75-9066-4e37-937a-b979a78803f6	2	857	11bc2b32-9a5d-4423-940f-8ecc533b3998
10390	CREDIT	Markers, pens, sticky notes (ATXDivHack)	2108	USD	2016-10-31 17:13:19.592-04	2016-10-31 17:13:19.745-04	847	28	1043	\N	\N	\N	\N	\N	\N	\N	1	2108	2108	448	6ef89de8-3342-44c5-9772-feb94d5cbfc1	2	857	7ed92f4e-a355-4cfd-961e-99947eada542
10393	CREDIT	Drinks for Happy Hour (ATXDivHack)	5518	USD	2016-10-31 17:13:39.794-04	2016-10-31 17:13:40.146-04	847	28	1043	\N	\N	\N	\N	\N	\N	\N	1	5518	5518	447	6acb5dbe-d270-4463-b02f-2f4431355146	2	857	ee41df98-d698-4d32-ab0c-dfaa54904e63
10397	CREDIT	Marketing Materials	2475	USD	2016-10-05 12:45:14.357-04	2016-10-05 12:45:14.485-04	826	171	573	\N	\N	\N	\N	\N	\N	\N	1	2475	2475	376	a0bea82f-0c36-40a1-bfd2-bdcccabff4d6	59	857	27686abf-a29b-4ba4-bf5a-a839be3e71bf
10403	CREDIT	Leadership Event in Sofia	6444	EUR	2016-12-07 16:38:07.287-05	2016-12-07 16:38:07.429-05	800	1379	1191	\N	\N	\N	\N	\N	\N	\N	1	6444	6444	471	1ddb4f5e-8e02-4db1-9764-84a6691f1ede	301	857	3bc329c2-908c-4598-a769-c9cda961cd15
10407	CREDIT	500 gift cards, 19.62 printed awards	51962	USD	2016-10-31 17:09:11.281-04	2016-10-31 17:09:11.484-04	796	1371	1042	\N	\N	\N	\N	\N	\N	\N	1	51962	51962	416	89629f87-0b79-45e4-a20d-e37902988e33	300	857	1cbbde01-016d-484e-8297-c0afde4a2a38
10408	CREDIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	48435	USD	2016-10-31 17:08:49.332-04	2016-10-31 17:08:49.517-04	796	1371	1042	\N	\N	\N	\N	\N	\N	\N	1	48435	48435	417	5e11d3ea-4d00-4d83-9c16-8dd560e898db	300	857	ee7eea71-9373-403f-8d42-746697d9e535
10413	DEBIT	Recurring subscription	-380	USD	2016-02-18 20:11:10.784-05	2016-04-16 16:40:58.716-04	688	2	34	\N	\N	65	25	\N	45	USD	1	-380	-500	\N	89aa0998-62a9-4219-9a6e-b9808a47a7fc	10	857	95518964-9ad3-4896-bfd6-57a8d81faf48
10415	DEBIT	Recurring subscription	-52	USD	2016-03-02 19:24:57.083-05	2016-04-16 16:40:58.834-04	688	2	46	\N	\N	72	5	\N	33	USD	1	-52	-100	\N	51805c73-824c-46a5-9f9d-d3f6f51cf6ee	13	857	df3a9ab6-11bc-41f7-b037-77a14c52a405
10418	CREDIT	STEM Toys for Coding with Kids Event	8496	USD	2016-08-16 10:58:01.764-04	2016-08-16 10:58:01.789-04	696	142	573	\N	\N	\N	\N	\N	\N	\N	1	8496	8496	294	61662bac-1400-48f8-b7a5-928711f0beb6	48	857	057f9b29-1f10-484f-b12f-b2a8d9ff5daf
10424	CREDIT	Supplies for Agile workshop (2/26)	5996	USD	2017-03-14 14:16:43.183-04	2017-03-14 14:16:43.22-04	826	171	2149	\N	\N	\N	\N	\N	198	USD	1	5996	5798	858	8df18286-ab3d-4c41-9f69-5f25a457093a	59	857	29783586-78f4-463e-bd69-f7d6666ea8bd
10427	DEBIT	monthly recurring subscription	-798	USD	2017-03-01 18:40:00.024-05	2017-03-01 18:40:00.024-05	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	823e9272-40b6-4fd5-bdd1-49a66b60d036	2	857	c2404866-3381-407c-a4ad-06a19e56e0ac
10434	CREDIT	Wearable Clothing Workshop	34411	USD	2017-03-14 14:00:11.436-04	2017-03-14 14:00:11.448-04	696	142	2149	\N	\N	\N	\N	\N	999	USD	1	34411	33412	815	0ce795f6-6eb0-4786-8f17-d60c87439ead	48	857	bf7562ea-4d7a-4294-a539-96aff3e8e42c
10437	CREDIT	Reimburse Caterina Paun for Program Expenses	9995	USD	2016-02-24 19:00:00-05	2016-06-14 14:14:22.175-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	9995	9995	224	78dc1d35-4e64-44fb-81a5-cb073da8deb0	59	857	60ae9626-9528-4b0e-90e0-943e3844571f
10444	CREDIT	Meetup Fees	5700	EUR	2016-12-27 11:36:05.296-05	2016-12-27 11:36:05.296-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	5700	5700	637	e3b04a35-fef5-4fc5-b7d1-f50e45ce50fc	298	857	b342c83c-5f45-4a18-87b2-aea1c93361bb
10446	CREDIT	Meetup Fees	6000	USD	2016-12-23 12:21:53.018-05	2016-12-23 12:21:53.018-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	621	b13c93d5-6a86-43fd-8499-23cfb0cba622	259	857	b758b5ac-c230-4df9-9f52-f24a455e61c6
10455	CREDIT	Photos for sponsor gifts	2104	USD	2016-11-30 11:11:36.238-05	2016-11-30 11:11:36.377-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	2104	2104	\N	7dcb01d0-0491-4f26-9d54-15d21153253c	2	857	1e101689-2f64-412a-a857-abb7418a7bed
10458	CREDIT	A Small Orange	12700	USD	2016-02-01 19:00:00-05	2016-06-14 14:14:22.114-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	12700	12700	194	859e4eb5-ab9d-4811-b0fd-55ef4eb0392b	48	857	01b1fc33-724e-4aef-b6a5-53bbfdc78c2f
10466	DEBIT	\N	-2040	USD	2017-02-01 12:30:48.467-05	2017-02-01 12:30:48.467-05	692	2906	1804	\N	\N	1712	125	\N	85	USD	1	-2040	-2500	\N	09b987b7-3963-4a11-ab7d-677460d0be28	271	857	be9ef1cf-097b-4f1b-a6e2-1612cd79f29b
10474	DEBIT	Recurring subscription	-53	USD	2016-12-09 13:29:17.341-05	2016-12-09 13:29:17.341-05	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	d4a4e6af-3077-49d6-8428-15ac7936462c	3	857	237ef3dc-b1d5-4763-ad78-61c70137096c
10478	DEBIT	Recurring subscription	-53	USD	2016-07-09 14:31:14.547-04	2016-07-09 14:31:14.585-04	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	2d3d8da7-9570-4a69-a05f-52339e1c2ab1	3	857	f963ceb7-af15-4090-a84b-b2bf92e2e40e
10481	DEBIT	Donation to WWCode Austin	-122250	USD	2016-08-05 16:48:08.414-04	2016-08-05 16:48:08.458-04	805	192	589	\N	\N	513	7500	\N	5250	USD	1	-122250	-150000	\N	eba26a30-e1ee-4480-afc6-db7df9f7ae15	2	857	3f2fe82c-bf15-4f99-9a57-435dd74fa5ea
10484	DEBIT	monthly recurring subscription	-798	USD	2017-05-01 19:34:11.708-04	2017-05-01 19:34:11.708-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	59ecc055-0124-4432-a808-d66e03123eb6	2	857	a6e00b78-bf0e-4f84-a1be-a0512d225ac8
10487	DEBIT	\N	-20670	USD	2016-09-22 21:07:09.492-04	2016-09-22 21:07:09.492-04	792	1263	790	\N	\N	700	1250	\N	580	USD	1	-20670	-25000	\N	2d9904ae-4462-4028-abff-07c2b7ed0cb4	59	857	81c0f9cd-fa02-4b53-9b10-5a5a689b04cd
10490	DEBIT	Donation to WWCode Austin	-16530	USD	2016-08-01 11:55:27.083-04	2016-08-01 11:55:27.184-04	750	884	562	\N	\N	489	1000	\N	470	USD	1	-16530	-20000	\N	0f893cc6-dce0-487a-a3b6-dc780ca13507	2	857	f8dc278d-b349-43b4-be90-5dac5901dd1a
10493	DEBIT	\N	-165570	USD	2016-09-01 10:41:36.24-04	2016-09-01 10:41:36.24-04	738	1094	707	\N	\N	622	10000	\N	4430	USD	1	-165570	-200000	\N	9dc9ce9f-3e78-462c-bee0-a72602e1a7e2	2	857	670802d2-f06c-4125-b999-65dd2e48d068
10356	DEBIT	Recurring subscription	-52	USD	2016-05-02 18:49:03.545-04	2016-05-02 18:49:03.612-04	819	8	45	\N	\N	71	5	\N	33	USD	1	-52	-100	\N	3cd13fbd-2f5e-43e2-a0da-5da2188552f2	14	857	08e3c32b-080e-4a6d-ac00-7f8a88e49461
10361	CREDIT	Leadership Development Lodging	64600	USD	2016-11-21 16:26:46.916-05	2016-11-21 16:26:46.916-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	64600	64600	\N	f9a019ef-f534-48b9-9f2c-ebd3698d7200	12	857	554227b8-d3fa-4af7-b84d-5596ef817e2a
10365	CREDIT	Leadership Development	14915	MXN	2017-03-14 14:18:46.358-04	2017-03-14 14:18:46.358-04	51	3	\N	\N	\N	\N	\N	\N	0	MXN	1	14915	14915	886	3dbf62da-1d74-4bce-8ed2-921eb352613b	511	857	31e9f524-e6f1-48db-a3e6-8eab9019f8d8
10370	CREDIT	Conference Grant - Sarah Olson	110000	USD	2016-05-10 15:19:21.785-04	2016-06-14 14:14:22.032-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	110000	110000	156	aefd2c90-02bd-46c7-af53-a9e5ec3294d3	48	857	b3eea43c-5eb4-49a8-bb56-d71211e68d93
10372	CREDIT	Drinks for July monthly event	3316	USD	2016-08-16 10:53:42.013-04	2016-08-16 10:53:42.04-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	3316	3316	\N	a030d0ab-3446-4275-ba62-b3af1496ce59	15	857	077aaf56-9fc4-49d5-942a-7e0358820cbc
10379	DEBIT	Donation to WWCode Seattle	-52	USD	2016-02-02 11:36:38.327-05	2016-04-16 16:40:58.702-04	691	30	41	\N	\N	67	5	\N	33	USD	1	-52	-100	\N	978b3f7b-efc7-4e2d-9838-94747327e295	14	857	929ab8e9-e6c9-45de-a9dc-ca73a9390186
10382	DEBIT	Recurring subscription	-52	USD	2016-04-02 15:09:44.502-04	2016-04-16 16:40:58.811-04	691	30	41	\N	\N	67	5	\N	33	USD	1	-52	-100	\N	da3cd61d-6bd0-4116-923b-7da92d315ace	14	857	f9b7851f-3cd3-40d3-b273-5c4975312bbb
10352	DEBIT	Banner	-2000	USD	2016-11-29 18:07:15.153-05	2016-11-29 18:07:15.39-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2000	-2000	\N	2225aa0f-cf80-4609-9501-47db29f74ef8	289	857	6c708fae-e8f7-4e21-9926-462b9848d3fe
10511	CREDIT	\N	50000	CAD	2017-03-31 19:37:30.819-04	2017-03-31 19:37:30.819-04	51	3	\N	2017-10-27 13:28:58.927-04	\N	2217	\N	\N	\N	CAD	1	50000	50000	\N	55e11f3d-b553-4645-b6b5-17148521d68d	\N	857	6d9830de-586c-4e52-b8c5-59c234d0e7e3
10464	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 22:24:31.362-05	2017-01-17 22:24:31.504-05	51	3	\N	2017-10-27 13:28:58.957-04	\N	\N	\N	\N	\N	\N	1	\N	982	\N	5a0ade06-8c3f-49c3-b93d-c542650524b8	\N	857	726293af-cf87-4dbf-9125-f89bb6e6fae7
10530	DEBIT	\N	-79600	GBP	2017-03-31 13:20:23.917-04	2017-03-31 13:20:23.917-04	857	3	\N	\N	\N	2206	0	\N	0	GBP	1	-79600	-79600	\N	c816eca3-bf4b-4055-9767-6c495105bdd9	267	857	856846fc-d2ef-4340-bac9-624be62beca6
10495	CREDIT	Intel Donation	100000	USD	2016-04-12 16:32:35.997-04	2016-04-16 16:40:58.826-04	51	3	\N	2017-10-27 13:28:59.138-04	\N	\N	\N	\N	\N	\N	1	\N	100000	\N	43afae38-fa29-4ced-bff2-879760b16d02	\N	857	8c8a4ce4-020e-4a83-b317-602bbcc7705a
10503	DEBIT	Intel Donation	-100000	USD	2016-04-12 16:32:35.997-04	2016-04-16 16:40:58.826-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-100000	-100000	\N	faf0423e-e111-4e72-83e7-c3583b90d957	59	857	8c8a4ce4-020e-4a83-b317-602bbcc7705a
10526	DEBIT	\N	-80500	GBP	2017-03-31 13:54:33.461-04	2017-03-31 13:54:33.461-04	857	3	\N	\N	\N	2208	0	\N	0	GBP	1	-80500	-80500	\N	bd0b1e9c-2b4c-4d48-8f33-b501d56277e1	278	857	b49eb2d3-c4e4-415f-8fd0-d6d11c78872b
10507	DEBIT	Network development (stickers)	-58590	USD	2016-10-06 12:08:20.916-04	2016-10-06 12:08:21.09-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-58590	-58590	\N	47161be6-173c-47e7-b76f-cd8289b764d9	3	857	be4802de-f720-40f5-a10a-ebb86aa78d54
10515	CREDIT	\N	20000	USD	2017-03-31 18:50:23.915-04	2017-03-31 18:50:23.915-04	51	3	\N	2017-10-27 13:28:59.855-04	\N	2214	\N	\N	\N	USD	1	20000	20000	\N	485f80b5-c649-457b-a5f1-c999ac4fffe7	\N	857	ce70a388-ce9d-4f35-8d39-cc5818a899f6
10386	CREDIT	Food (ATXDivHack)	119954	USD	2016-11-18 16:01:43.887-05	2016-11-18 16:01:44.336-05	847	28	1189	\N	\N	\N	\N	\N	\N	\N	1	119954	119954	466	1dc82246-dec7-467b-b4e2-d6ee7474a39d	2	857	a1f1f964-6dc9-4b24-abad-3c2deabc8c3e
10391	CREDIT	Drinks and snacks (ATXDivHack)	75932	USD	2016-10-31 17:13:05.943-04	2016-10-31 17:13:06.106-04	847	28	1043	\N	\N	\N	\N	\N	\N	\N	1	75932	75932	449	8db757a4-10e9-4642-8c7a-aa3a15ff85d6	2	857	f0561edc-f86d-4800-8e4c-b2945ccbb63b
10396	CREDIT	September Ruby Tuesday	6497	USD	2016-10-31 17:11:36.488-04	2016-10-31 17:11:36.731-04	847	28	1042	\N	\N	\N	\N	\N	\N	\N	1	6497	6497	450	3e3a21d6-6484-447e-9a4e-25854b00ff00	2	857	39b2c1a9-fd94-465c-9f74-a4b567ec61a4
10401	CREDIT	Event supplies	2715	USD	2016-10-05 12:44:00.394-04	2016-10-05 12:44:00.521-04	826	171	573	\N	\N	\N	\N	\N	\N	\N	1	2715	2715	375	5d3a6313-f899-498e-9b76-2eda8a887942	59	857	6b851a75-c957-49d1-9859-bc1e60b26bed
10404	CREDIT	Leadership Event in Sofia	1019	EUR	2016-12-07 16:30:48.339-05	2016-12-07 16:30:48.523-05	800	1379	1191	\N	\N	\N	\N	\N	\N	\N	1	1019	1019	470	347890bf-d9c0-42f5-b878-5d18c886b69e	301	857	d7e462fc-5e5b-4b3b-9af4-68d74ba4383b
10409	CREDIT	Monthly core team meeting. Beverages with dinner for six members 	3080	USD	2016-10-31 13:59:53.602-04	2016-10-31 13:59:53.96-04	766	31	1024	\N	\N	\N	\N	\N	\N	\N	1	3080	3080	401	2df37aaa-fa24-4e21-bf55-4b6ca4fc31d1	14	857	a83c2fc2-30ac-4c58-be79-3868a4a2539c
10417	CREDIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	1500	USD	2016-08-19 16:58:54.527-04	2016-08-19 16:58:54.67-04	696	142	573	\N	\N	\N	\N	\N	\N	\N	1	1500	1500	318	2a075793-2641-4627-9154-43fda96be296	48	857	df2dafbf-88a0-4849-ad15-4cff959d77e4
10420	CREDIT	05-21-16 AI workshop	30000	USD	2016-05-22 20:26:36.061-04	2016-06-14 14:14:22.092-04	847	28	\N	2016-06-14 14:14:22.535-04	\N	\N	\N	\N	\N	\N	1	30000	30000	186	9261bad0-e881-4d1b-8475-e5cf7a68a82a	2	857	155254ed-fe8e-4f1d-be57-40075a8392cf
10429	DEBIT	\N	-20670	USD	2017-03-01 17:51:20.759-05	2017-03-01 17:51:20.759-05	792	1263	2048	\N	\N	1953	1250	\N	580	USD	1	-20670	-25000	\N	9cc504c2-6f67-4d6c-a07d-52a2f80db926	59	857	8e40f784-4f9c-4723-8291-87e37f008f1a
10432	DEBIT	Recurring subscription	-798	USD	2017-01-14 12:12:01.244-05	2017-01-14 12:12:01.244-05	762	2549	1616	\N	\N	1531	50	\N	52	USD	1	-798	-1000	\N	44ea4323-b3a9-4b19-a679-5b8231182134	270	857	a83d27cd-998c-4920-a7af-fdae10cf3a38
10441	CREDIT	Conference Expense	8320	USD	2016-05-10 15:19:21.785-04	2016-06-14 14:14:22.042-04	51	3	\N	2016-06-14 14:14:22.515-04	\N	\N	\N	\N	\N	\N	1	8320	8320	158	cbf9f4ab-d441-4ec2-a4f4-3098b07f9150	48	857	7f95f913-4d28-4b5f-aacf-0f4cf47d9ee1
10442	CREDIT	Meetup Fees	6000	USD	2017-04-05 10:19:21.293-04	2017-04-05 10:19:21.293-04	51	3	\N	\N	\N	\N	\N	\N	0	USD	1	6000	6000	988	f7bf7e83-7c51-424f-b858-7c68e85da7ac	295	857	5bcf6d27-bd13-44bc-9268-0e086747fb22
10450	CREDIT	Meetup Fees	6000	USD	2016-12-23 12:00:25.987-05	2016-12-23 12:00:25.987-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	617	d53349b3-5c71-47c6-bebd-cbb302e8deeb	263	857	5d23496f-cdcc-4fca-9250-85c57c268e1d
10460	CREDIT	Network Stickers	58590	USD	2016-10-06 12:08:07.615-04	2016-10-06 12:08:07.66-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	58590	58590	\N	f23a0b6a-3831-4fd3-8cb5-d0fc8ba4eb2d	3	857	3697f83d-fdcf-40e9-a452-a6fb39f2b38f
10472	DEBIT	\N	-26301	CAD	2017-02-27 19:25:20.325-05	2017-02-27 19:25:20.325-05	837	3301	2030	\N	\N	1935	1121	\N	523	USD	1.33832976445396001	-19652	-30000	\N	0b8b281b-4d09-424a-b644-9d9f22fa8df5	522	857	8fd06a01-28ef-4514-867e-b776cb4edcd2
10479	DEBIT	Recurring subscription	-52	USD	2016-04-02 22:02:46.616-04	2016-04-16 16:40:58.82-04	819	8	45	\N	\N	71	5	\N	33	USD	1	-52	-100	\N	6dc43114-7d58-4b03-8f38-ec2ac1b645ac	14	857	89946395-8ddf-423d-8a1c-8d5a17facf7d
10482	DEBIT	Recurring subscription	-798	USD	2016-08-01 19:35:39.219-04	2016-08-01 19:35:39.244-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	f5c2c1ae-b098-48b4-8ccc-91933b3ab7a1	2	857	3aff9fac-16d8-4337-be20-fee5d95a4070
10492	DEBIT	Recurring subscription	-798	USD	2016-09-09 23:42:56.392-04	2016-09-09 23:42:56.392-04	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	871b644b-21ce-466f-957b-ddce4ef3b8be	241	857	41b568a9-1078-4f48-9c39-e267aecc11b7
10528	DEBIT	\N	-16530	USD	2017-05-15 08:07:59.63-04	2017-05-15 08:07:59.63-04	799	4834	2922	\N	\N	2817	1000	\N	470	USD	1	-16530	-20000	\N	cdaa1d02-f51f-4db8-acfb-51c4a6dac848	14	857	6de79560-48bf-4094-b92c-79c080ee96d2
10531	DEBIT	\N	-384	USD	2017-05-01 13:13:34.851-04	2017-05-01 13:13:34.851-04	785	4550	2757	\N	\N	2644	25	\N	41	USD	1	-384	-500	\N	8eda5c56-8fd8-4d6d-980e-c875f11211c5	516	857	403dbb08-8ccb-45c9-be4e-ad5c193ff638
254	DEBIT	WwConnect2016	-1025	USD	2016-03-19 20:00:00-04	2016-06-14 14:14:21.806-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1025	64	f42fde8c-31a0-49b2-ae8e-8a12eca9f4f5	766	857	dde38b87-f0fe-4213-9bb1-620ceadaf7f1
10353	DEBIT	Donation to WWCode Mexico City	0	MXN	2016-02-15 13:46:05.92-05	2016-04-01 10:32:17.223-04	821	7	64	2016-04-07 10:32:17.381-04	\N	83	\N	\N	\N	\N	1	0	-100	\N	648bd274-7da0-4a06-a809-7ce8cb0098dc	10	857	46d93b35-fa63-4871-abe1-2acf134ece38
10358	DEBIT	Donation to WWCode Washington DC	-82070	USD	2016-06-06 20:53:47.603-04	2016-06-06 20:53:47.649-04	743	555	381	\N	\N	316	5000	\N	2930	USD	1	-82070	-100000	\N	278652cb-b620-41d4-a4b8-34f902490b31	13	857	a16488ed-69e4-431c-81f6-af686c654b25
10364	CREDIT	More stickers to give away at events	18800	USD	2016-11-03 15:14:58.094-04	2016-11-03 15:14:58.245-04	51	3	1044	\N	\N	\N	\N	\N	\N	\N	1	18800	18800	\N	e6792af7-e02c-4261-a25a-98c5a2a80ba1	13	857	473848c9-eac7-4ff7-942a-5410a901bdcb
10369	CREDIT	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	3776	USD	2016-12-13 13:41:20.962-05	2016-12-13 13:41:21.652-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	3776	3776	\N	5606903d-42e7-458b-abfd-880497d9c7fe	59	857	e7dcddd1-f191-4425-97f1-89ff9d03e512
10375	CREDIT	To redeem travel stipend to Google I/O	104430	USD	2017-03-27 13:54:16.729-04	2017-03-27 13:54:16.758-04	695	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	104430	100000	935	a5ac8fd1-f74d-49d4-99b9-d7ad97d883c4	277	857	4e03aad4-e588-46bd-a069-24ecc0e16908
10380	DEBIT	Recurring subscription	-52	USD	2016-03-02 12:53:54.346-05	2016-04-16 16:40:58.736-04	691	30	41	\N	\N	67	5	\N	33	USD	1	-52	-100	\N	e7b944bf-1118-4db5-a2bb-1fce41681a40	14	857	47dd166e-ec5f-4855-8122-28ebb32bf98c
10389	CREDIT	Almond milk for coffee (ATXDivHack)	1192	USD	2016-10-31 17:13:53.591-04	2016-10-31 17:13:53.747-04	847	28	1043	\N	\N	\N	\N	\N	\N	\N	1	1192	1192	446	7ec19f93-009a-4d5b-b4b5-1475e149c87c	2	857	d1a05845-b898-474a-bc0b-49881639d365
10392	CREDIT	June South Hack Night	20568	USD	2016-10-31 17:11:20.573-04	2016-10-31 17:11:20.753-04	847	28	1042	\N	\N	\N	\N	\N	\N	\N	1	20568	20568	451	92469486-d225-49d4-8256-ae37590c61ac	2	857	f095ee03-3b3c-49a4-93cd-21e84841fae0
10398	CREDIT	Event Food	7167	USD	2016-10-05 12:44:47.862-04	2016-10-05 12:44:48.013-04	826	171	573	\N	\N	\N	\N	\N	\N	\N	1	7167	7167	378	c01d18f8-35f0-4d15-95d9-1024b87cd9e9	59	857	319030d4-727b-4b9b-9702-c33b68553f50
10405	CREDIT	WWCode Seattle planning lunch with Sara	2700	USD	2016-10-31 13:52:44.962-04	2016-10-31 13:52:45.274-04	797	32	1024	\N	\N	\N	\N	\N	\N	\N	1	2700	2700	420	efab6a1e-1779-4fc6-8ac9-07761a76395a	14	857	61408274-9f0f-447d-9cc6-94f94877ebae
10436	DEBIT	monthly recurring subscription	-2040	USD	2017-03-01 13:37:53.591-05	2017-03-01 13:37:53.591-05	692	2906	1804	\N	\N	1712	125	\N	85	USD	1	-2040	-2500	\N	72b61a2c-0abc-4582-9408-2e6906b25c3b	271	857	1fcfdf19-cada-406e-a6e2-a7b8004a70b9
10499	DEBIT	From Deepa	0	USD	2016-04-12 17:19:00.212-04	2016-04-12 17:19:00.529-04	857	3	\N	2016-04-14 17:19:00.529-04	\N	\N	\N	\N	\N	\N	1	0	-1500	\N	baeee0a0-eb93-46c8-beef-d531298e7c4d	4	857	01c55034-9dc6-4362-8ba1-8f4413b512f8
10568	DEBIT	\N	-9000	USD	2017-04-17 15:41:07.659-04	2017-04-17 15:41:07.659-04	857	3	\N	\N	\N	2471	0	\N	0	USD	1	-9000	-9000	\N	3b509e78-7eef-4432-ab31-1b6a7251e0d9	277	857	1541b52e-a4f6-432a-b6ce-823d18b7c6be
10537	CREDIT	\N	3562	GBP	2017-04-18 15:41:30.286-04	2017-04-18 15:41:30.286-04	51	3	\N	2017-10-27 13:28:58.476-04	\N	2503	\N	\N	\N	GBP	1	3562	3562	\N	47971af7-3f87-49a2-aa80-ce4e8c302a1b	\N	857	26ffe66a-5692-42e3-8b7d-54cc8af438c4
10544	DEBIT	\N	-3562	GBP	2017-04-18 15:41:30.286-04	2017-04-18 15:41:30.286-04	857	3	\N	\N	\N	2503	0	\N	0	GBP	1	-3562	-3562	\N	e4c42d30-d1c2-4a7c-8063-10a4159a1756	278	857	26ffe66a-5692-42e3-8b7d-54cc8af438c4
10548	DEBIT	\N	-100000	USD	2017-04-17 18:40:40.357-04	2017-04-17 18:40:40.357-04	857	3	\N	\N	\N	2490	0	\N	0	USD	1	-100000	-100000	\N	f2fc53ba-c491-4fa7-80a1-889544a17026	430	857	3f31bbab-1925-4397-8600-e5c7f46fc7a0
10555	CREDIT	\N	4250	GBP	2017-04-17 17:06:54.803-04	2017-04-17 17:06:54.803-04	51	3	\N	2017-10-27 13:28:58.683-04	\N	2475	\N	\N	\N	GBP	1	4250	4250	\N	b8383c50-750d-4871-891c-d66da008342c	\N	857	4b407c04-7664-4284-819b-09efc78ac86e
10563	DEBIT	\N	-4250	GBP	2017-04-17 17:06:54.803-04	2017-04-17 17:06:54.803-04	857	3	\N	\N	\N	2475	0	\N	0	GBP	1	-4250	-4250	\N	a3656d67-9249-41ad-aba4-7244405e5296	278	857	4b407c04-7664-4284-819b-09efc78ac86e
10512	DEBIT	\N	-40000	USD	2017-04-19 14:26:01.228-04	2017-04-19 14:26:01.228-04	857	3	\N	\N	\N	2520	0	\N	0	USD	1	-40000	-40000	\N	84963d05-76d2-4ede-a798-26aa74df6099	3	857	7866a845-12b5-4c53-838a-c6133b0e56c8
10579	CREDIT	Event sponsorship - transaction fees and global development 	856500	USD	2017-03-02 01:00:43.46-05	2017-03-02 01:00:44.182-05	51	3	\N	2017-10-27 13:28:59.171-04	\N	\N	\N	\N	\N	\N	1	\N	856500	\N	1f3c7cc1-47b4-4ecb-9a9f-dfbda564e2af	\N	857	92b4a9ce-6205-4173-9229-806bb98ffdbc
10505	CREDIT	\N	1480	USD	2017-04-19 14:18:19.043-04	2017-04-19 14:18:19.043-04	51	3	\N	2017-10-27 13:29:00.209-04	\N	2519	\N	\N	\N	USD	1	1480	1480	\N	45ca7528-dd60-4e05-80a4-56ca00b885bc	\N	857	ead92266-7e60-45e7-92ab-ade9261f6b1b
10574	CREDIT	Women Techmaker WWCode Partnership Grant	70000	USD	2016-05-19 15:17:47.24-04	2016-05-19 15:17:48.401-04	51	3	\N	2017-10-27 13:29:00.354-04	\N	\N	\N	\N	\N	\N	1	\N	70000	\N	9db0fad5-4a54-4ab1-838d-e5f3ede5eb3b	\N	857	f8ffad3b-a7dd-4487-8cbb-dff04f985457
10514	CREDIT	\N	7500	USD	2017-03-31 18:52:45.079-04	2017-03-31 18:52:45.079-04	51	3	\N	2017-10-27 13:29:00.533-04	\N	2215	\N	\N	\N	USD	1	7500	7500	\N	f75e3fd5-dfd5-4949-bde4-82059bbc4f19	\N	857	fc5e979e-8837-4afc-be84-f2fe7e452811
10522	DEBIT	\N	-7500	USD	2017-03-31 18:52:45.079-04	2017-03-31 18:52:45.079-04	857	3	\N	\N	\N	2215	0	\N	0	USD	1	-7500	-7500	\N	c413dd5e-7518-4d25-aef9-1edb708242ec	286	857	fc5e979e-8837-4afc-be84-f2fe7e452811
10410	CREDIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	2838	USD	2016-11-03 17:13:31.956-04	2016-11-03 17:13:32.241-04	763	70	1117	\N	\N	\N	\N	\N	\N	\N	1	2838	2838	409	47f53b2b-76b1-4e8b-b78a-6f5fd4148323	12	857	cdce8653-8f0d-49cb-990e-a4c473259342
10416	CREDIT	Two VR headsets for our AR/VR event at Best Buy.	4898	USD	2016-09-27 15:31:43.164-04	2016-09-27 15:31:43.42-04	696	142	573	\N	\N	\N	\N	\N	\N	\N	1	4898	4898	366	eecb1f70-6d44-4f62-a214-527ab9aa5b79	48	857	8b55d3d1-c441-42e0-9ab4-0ca836c346ef
10419	CREDIT	3/30/16 Python Gameathon prize - Udemy course	2400	USD	2016-06-04 17:37:03.991-04	2016-06-14 14:14:22.155-04	847	28	320	\N	\N	\N	\N	\N	\N	\N	1	2400	2400	213	df290bcf-16d7-4d11-ad31-dca990917a25	2	857	1a25f45f-ed35-4a86-8c6d-717dc10d9870
10426	DEBIT	Recurring subscription	-53	USD	2017-01-09 13:28:29.701-05	2017-01-09 13:28:29.701-05	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	a03f28fe-d48a-4b65-8637-aa284a668b70	3	857	24f08b9a-535c-42ae-85a6-bb9623d1435f
10431	CREDIT	WwConnect2016	1025	USD	2016-03-19 20:00:00-04	2016-06-14 14:14:21.806-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	1025	1025	64	78f64447-c3d5-46a1-ac24-8fa02d1cddd6	14	857	dde38b87-f0fe-4213-9bb1-620ceadaf7f1
10433	CREDIT	STEM Toys for Coding with Kids Event	10212	USD	2016-08-16 10:58:32.03-04	2016-08-16 10:58:32.041-04	696	142	573	\N	\N	\N	\N	\N	\N	\N	1	10212	10212	293	bfc1d570-1486-4ff0-9f27-ce859e5396d2	48	857	f79ba530-5433-4fd1-b15f-91704c4a1ee3
10440	CREDIT	WePay fee	125	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	125	125	95	7caa8baa-ec65-40fd-b639-c3b622267d12	13	857	abec4c3b-b29d-410c-a80d-dcae9b2c06e1
10445	CREDIT	Meetup Fees	6000	AUD	2016-12-23 12:42:18.688-05	2016-12-23 12:42:18.688-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	623	cbee3795-1bdf-44ac-90cf-bdfb12d85912	266	857	0729fdb7-feac-4008-b26f-63be229d8cdd
10449	CREDIT	Meetup Fees	4900	GBP	2016-12-23 12:05:41.927-05	2016-12-23 12:05:41.927-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	4900	4900	618	c9862929-78b8-4bb5-80cf-9a2fe1f9e499	264	857	d92cd5d5-0528-4c35-9ba0-217a917d144f
10454	CREDIT	Envelopes for hackathon sponsor prizes	907	USD	2016-11-30 11:12:35.291-05	2016-11-30 11:12:35.54-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	907	907	\N	4bedcf77-7958-4548-a19e-15620766df98	2	857	189685c4-71ae-4359-8fff-2d1211e94700
10456	CREDIT	Conference Grant	100000	USD	2016-05-24 15:42:50.307-04	2016-06-14 14:14:22.103-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	100000	100000	189	3d6ea4c8-2674-4518-a01f-eaf2b0feabbb	3	857	c3b29e74-d963-4903-ac8e-6178e076e1dd
10468	DEBIT	\N	-8150	USD	2017-04-20 06:17:23.286-04	2017-04-20 06:17:23.286-04	840	4348	2643	\N	\N	2532	500	\N	350	USD	1	-8150	-10000	\N	3d2b276e-b443-4432-b544-b02fade6c3a9	59	857	270be06e-f54a-4553-8935-7d5fae06111d
10473	DEBIT	Donation to WWCode Washington DC	-41020	USD	2016-04-28 11:01:17.801-04	2016-04-28 11:01:17.846-04	824	283	213	\N	\N	181	2500	\N	1480	USD	1	-41020	-50000	\N	6dfd224b-d7b5-4f78-8a0e-74b6753c2c46	13	857	316b4cb3-3577-43f5-a43a-8d38a6598afd
10480	DEBIT	\N	-3282	USD	2016-11-28 10:33:14.428-05	2016-11-28 10:33:14.428-05	810	1890	1249	\N	\N	1167	200	\N	118	USD	1	-3282	-4000	\N	71aa400e-3fb3-46c0-9364-24f4ac098173	2	857	c4776ec9-eafb-43af-bd21-97ab7c4a9dc6
10483	DEBIT	Recurring subscription	-798	USD	2016-07-01 18:38:37.594-04	2016-07-01 18:38:37.617-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	9f8c082a-1c1f-4a43-9c4e-450e67049531	2	857	2062dff6-837d-42e0-8c7a-de8149f8f1f2
10485	DEBIT	Donation to WWCode Austin	-123120	USD	2016-05-03 09:07:28.39-04	2016-05-03 09:07:28.452-04	798	308	230	\N	\N	191	7500	\N	4380	USD	1	-123120	-150000	\N	0a21417d-6068-4c93-a579-890f7d4b13b8	2	857	82853be8-9389-4e75-af20-a1fdeadb25de
10488	DEBIT	Donation to WWCode Atlanta	-53	USD	2016-06-21 12:02:56.072-04	2016-06-21 12:02:56.13-04	775	642	430	\N	\N	359	5	\N	32	USD	1	-53	-100	\N	123bf925-2fd4-491d-b10d-ab4ee7cd64e6	12	857	d001bbe7-a784-411f-8c3f-881f783d5c7e
10525	DEBIT	\N	-18600	USD	2017-02-01 10:16:20.999-05	2017-02-01 10:16:20.999-05	801	2898	1801	\N	\N	1709	1125	\N	525	USD	1	-18600	-22500	\N	034f48a8-492f-401d-8356-bc45b4188be4	48	857	082294e4-0496-47a3-ad4b-6190b7a8e735
1588	DEBIT	STEM Toys for Coding with Kids Event	-10212	USD	2016-08-16 10:58:32.03-04	2016-08-16 10:58:32.041-04	48	142	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10212	293	40c6d6e9-1a20-4f97-b460-2a318d202796	696	857	f79ba530-5433-4fd1-b15f-91704c4a1ee3
10345	CREDIT	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	2500	USD	2016-09-27 15:33:54.08-04	2016-09-27 15:33:54.272-04	696	142	573	\N	\N	\N	\N	\N	\N	\N	1	2500	2500	367	72ca417e-f314-4cc2-8650-2d0f850af2b5	48	857	5e2a673e-ae5e-43d6-b917-6f13861f4094
10350	CREDIT	3D Printer & Supplies	30496	USD	2016-12-14 08:03:21.144-05	2016-12-14 08:03:21.949-05	696	142	1191	\N	\N	\N	\N	\N	\N	\N	1	30496	30496	591	be56348c-9e62-4a5b-a836-2f87de5fef0a	48	857	fc92e79f-1892-4b14-8545-58cdf4a45c8a
10355	DEBIT	Recurring subscription	-53	USD	2016-11-09 13:29:23.967-05	2016-11-09 13:29:23.967-05	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	56414e52-fdc6-4d76-ba20-1dbdc9d6b801	3	857	4c3e93f4-c2e7-4783-949c-50dbdcd50d0f
10360	CREDIT	Meetup Fees	6000	USD	2016-12-27 14:46:50.958-05	2016-12-27 14:46:50.958-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	655	b3f1fcd5-8cc4-4258-9491-7401f389bdf0	287	857	d9c9126c-0c36-431c-b400-c8bf812c34a5
10368	CREDIT	Meetup Fees	6000	USD	2016-12-23 12:32:55.31-05	2016-12-23 12:32:55.31-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	622	9b3caee2-e234-4d92-ae1c-e313a1a4b867	195	857	d7d39486-684f-46a4-a5fe-9c5a0a8dbdde
10374	DEBIT	\N	-2040	USD	2017-04-11 22:05:36.032-04	2017-04-11 22:05:36.032-04	693	4173	2546	\N	\N	2430	125	\N	85	USD	1	-2040	-2500	\N	31b58047-a7e7-4dc5-a8fe-2ef55a87c762	13	857	56baf101-4766-4682-b78c-ec30641fea59
10378	DEBIT	Recurring subscription	-52	USD	2016-05-02 14:10:42.774-04	2016-05-02 14:10:42.847-04	691	30	43	\N	\N	69	5	\N	33	USD	1	-52	-100	\N	0c72daf6-a30f-4eba-9e25-a95f416ba445	13	857	7e11f5f3-4a6e-48e8-8e9a-0655c159911a
10384	DEBIT	Recurring subscription	-52	USD	2016-05-02 20:15:49.65-04	2016-05-02 20:15:49.711-04	688	2	46	\N	\N	72	5	\N	33	USD	1	-52	-100	\N	2ca6e22f-199d-4561-836e-c7f7f458280c	13	857	d42d68f8-0467-4cd7-9903-7e8cc707dd8a
10388	CREDIT	Painters tape for signs  	1136	USD	2016-10-31 17:14:51.746-04	2016-10-31 17:14:51.945-04	847	28	1043	\N	\N	\N	\N	\N	\N	\N	1	1136	1136	445	bd6e7913-12d4-4539-bb0b-492428f00859	2	857	448d2bd8-c39d-4ae0-9bfb-f85c7fcf3cdb
10394	CREDIT	May AI Workshop	26800	USD	2016-10-31 17:10:54.112-04	2016-10-31 17:10:54.327-04	847	28	1042	\N	\N	\N	\N	\N	\N	\N	1	26800	26800	452	d7f3a3b3-4b5f-4eb4-b08c-ae39d0d05f34	2	857	13cf848b-1cd9-417a-93b9-1404ce05751d
10399	CREDIT	We Code Hackathon 2016	2374	USD	2016-12-06 11:50:34.842-05	2016-12-06 11:50:35.964-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	2374	2374	500	abf6c51b-fbe0-4932-9597-2f50bd3218d5	59	857	30a64cbe-7444-4fff-b129-16ea12c2b316
10402	CREDIT	Event food	3224	USD	2016-09-13 10:57:04.698-04	2016-09-13 10:57:05.111-04	826	171	573	\N	\N	\N	\N	\N	\N	\N	1	3224	3224	346	12aa3057-f5c6-47de-a085-d8f92c0825a5	59	857	77a88ec1-9044-4e7c-a789-3cfb2f784748
10411	DEBIT	Donation to WWCode Mexico City	-380	USD	2016-01-18 18:54:06.439-05	2016-04-16 16:40:58.672-04	688	2	34	\N	\N	65	25	\N	45	USD	1	-380	-500	\N	7f1988f5-535b-49ee-b3f5-cf70d9927e95	10	857	c5de17c9-4baa-4b63-a3a3-53335a5881b7
10414	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 18:09:05.702-05	2016-04-16 16:40:58.699-04	688	2	46	\N	\N	72	5	\N	33	USD	1	-52	-100	\N	6c4178cb-37b2-40f3-b193-f4d1aae66553	13	857	4f5773cd-701a-4c71-abdb-872b41fd17f3
10465	CREDIT	WWCode t-shirt sales	1229	USD	2017-01-17 22:23:59.112-05	2017-01-17 22:23:59.247-05	51	3	\N	2017-10-27 13:28:58.393-04	\N	\N	\N	\N	\N	\N	1	\N	1229	\N	9795a1e6-bcbc-4d7a-9db1-2ea431b1e8aa	\N	857	16cace5a-a396-420d-9a17-2196710480fd
10471	DEBIT	WWCode t-shirt sales	-1229	USD	2017-01-17 22:23:59.112-05	2017-01-17 22:23:59.247-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1229	-1229	\N	20dbd796-4ba2-423e-910c-73e81de3325d	48	857	16cace5a-a396-420d-9a17-2196710480fd
10538	CREDIT	VMWare Network Support	195000	USD	2016-10-07 15:55:50.273-04	2016-10-07 15:55:50.509-04	51	3	\N	2017-10-27 13:28:58.792-04	\N	\N	\N	\N	\N	\N	1	\N	195000	\N	55f9e40f-5e29-4995-ae8b-c9f836669af2	\N	857	615d2298-b32c-4f50-b70c-0257db7253b7
10546	DEBIT	VMWare Network Support	-195000	USD	2016-10-07 15:55:50.273-04	2016-10-07 15:55:50.509-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-195000	-195000	\N	6909ad3c-58c5-4b55-93af-4c16886f0077	300	857	615d2298-b32c-4f50-b70c-0257db7253b7
10504	CREDIT	\N	40000	USD	2017-04-19 14:26:01.228-04	2017-04-19 14:26:01.228-04	51	3	\N	2017-10-27 13:28:59.027-04	\N	2520	\N	\N	\N	USD	1	40000	40000	\N	338f88f4-21b8-40c3-b4e7-5a1eeb847fd9	\N	857	7866a845-12b5-4c53-838a-c6133b0e56c8
10521	CREDIT	\N	79600	GBP	2017-03-31 13:20:23.917-04	2017-03-31 13:20:23.917-04	51	3	\N	2017-10-27 13:28:59.11-04	\N	2206	\N	\N	\N	GBP	1	79600	79600	\N	e4ed80f8-2f57-406e-96b6-51430b690faa	\N	857	856846fc-d2ef-4340-bac9-624be62beca6
10541	CREDIT	\N	18800	MXN	2017-04-17 18:35:06.093-04	2017-04-17 18:35:06.093-04	51	3	\N	2017-10-27 13:28:59.192-04	\N	2488	\N	\N	\N	MXN	1	18800	18800	\N	d623e46f-860a-4b0a-9f53-83aa4d511690	\N	857	9416e1d9-07c1-44c4-a1ae-3103e3c0e583
10551	DEBIT	\N	-18800	MXN	2017-04-17 18:35:06.093-04	2017-04-17 18:35:06.093-04	857	3	\N	\N	\N	2488	0	\N	0	MXN	1	-18800	-18800	\N	69344f77-25da-46ea-ab98-8cbff9f79e3f	511	857	9416e1d9-07c1-44c4-a1ae-3103e3c0e583
10533	CREDIT	\N	50000	USD	2017-03-31 13:17:51.695-04	2017-03-31 13:17:51.695-04	51	3	\N	2017-10-27 13:28:59.425-04	\N	2204	\N	\N	\N	USD	1	50000	50000	\N	ec348224-678e-4297-b99c-4f85f4d45234	\N	857	a198562b-52cc-4fe7-a263-d580b59447c4
10502	CREDIT	\N	1190	USD	2017-04-19 14:26:58.997-04	2017-04-19 14:26:58.997-04	51	3	\N	2017-10-27 13:28:59.492-04	\N	2521	\N	\N	\N	USD	1	1190	1190	\N	1757b12d-5273-4b6d-b5b4-4662f0497dee	\N	857	af0e2e6f-cc41-4c4f-a5be-9b34707e19b4
10510	DEBIT	\N	-1190	USD	2017-04-19 14:26:58.997-04	2017-04-19 14:26:58.997-04	857	3	\N	\N	\N	2521	0	\N	0	USD	1	-1190	-1190	\N	70b0ec50-5b05-40fa-8a36-81cbfd94098d	3	857	af0e2e6f-cc41-4c4f-a5be-9b34707e19b4
10513	DEBIT	\N	-1480	USD	2017-04-19 14:18:19.043-04	2017-04-19 14:18:19.043-04	857	3	\N	\N	\N	2519	0	\N	0	USD	1	-1480	-1480	\N	6447b58f-72d3-44eb-9419-ce0dc29e84c6	2	857	ead92266-7e60-45e7-92ab-ade9261f6b1b
10422	CREDIT	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	4000	GBP	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	830	1333	\N	\N	\N	\N	\N	\N	\N	\N	1	4000	4000	507	368b8304-55ff-4bff-a034-f48b3c09b386	278	857	0228da58-424a-4581-a6a3-b5f1697e8cac
10425	DEBIT	monthly recurring subscription	-53	USD	2017-02-09 13:29:30.017-05	2017-02-09 13:29:30.017-05	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	1e412176-bb3c-4b0f-bebb-b8dded775f8e	3	857	18564848-ce38-4b53-a4ce-9fae7f415bf6
10428	DEBIT	monthly recurring subscription	-798	USD	2017-02-01 18:34:44.326-05	2017-02-01 18:34:44.326-05	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	6444d613-b419-454c-9213-267f2fbc9a57	2	857	e748be91-4a9f-421f-b363-6c004f5e5c28
10435	CREDIT	Movie screening for "She Started It"	26475	USD	2017-03-14 13:59:53.142-04	2017-03-14 13:59:53.153-04	696	142	2149	\N	\N	\N	\N	\N	775	USD	1	26475	25700	814	4cb74926-7377-4884-b191-49cce3457f6c	48	857	ba4e9485-1362-4312-8cf0-816d671cca2e
10439	CREDIT	Global Development 	150	USD	2016-06-09 14:38:16.857-04	2016-06-14 14:14:22.175-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	150	150	222	25d5f8ee-d470-4530-9305-17bda70650a3	4	857	16ba8e31-adbb-4029-a212-a24b5ad07149
10443	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:41:27.235-05	2016-12-27 11:41:27.235-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	638	051d78f7-940e-40a2-abf6-f8d7c6554464	272	857	29f9bc2a-f0b1-416d-9907-93c07a247296
10447	CREDIT	Meetup Fees	5700	EUR	2016-12-23 12:15:16.054-05	2016-12-23 12:15:16.054-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	5700	5700	620	13101e9a-9f6e-43d9-aa8f-a547a0963073	301	857	49629977-8b0e-4eac-85e4-6e1565857b0d
10453	CREDIT	Leadership Development - Conference Travel Stipend Google I/O	130000	USD	2016-11-30 16:06:48.939-05	2016-11-30 16:06:49.116-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	130000	130000	\N	c5a4cb77-0159-4c86-a629-e23f28fbffc6	241	857	6a5bfd14-50aa-4b7f-917f-4253011f8ef2
10457	CREDIT	Engineering (Web) - A Small Orange	12700	USD	2016-10-11 20:44:30.933-04	2016-10-11 20:44:31.081-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	12700	12700	\N	c9388798-c42c-4a0f-9524-9622b36455bb	48	857	ab9be932-27a6-4d94-b580-dedb69f78bc7
10463	DEBIT	\N	-8250	USD	2017-01-18 08:54:50.597-05	2017-01-18 08:54:50.597-05	697	2594	1647	\N	\N	1557	500	\N	250	USD	1	-8250	-10000	\N	84b6a2db-96af-44db-a059-13f4ce941872	48	857	38612131-79ce-400c-b325-3ae4978fed31
10467	DEBIT	\N	-2040	USD	2016-12-18 20:41:29.006-05	2016-12-18 20:41:29.006-05	699	2220	1471	\N	\N	1388	125	\N	85	USD	1	-2040	-2500	\N	fbd27a8d-7f2e-44e0-b913-17b4e6ef1950	259	857	4751be73-1cc8-48cc-be27-47535d936770
10476	DEBIT	Recurring subscription	-53	USD	2016-09-09 14:29:12.276-04	2016-09-09 14:29:12.276-04	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	02d3f1a1-b11b-4a9d-8af1-e2c5ad6f87ce	3	857	5d5bcb44-1b42-49f1-9cf5-4719eb49f5c9
10486	DEBIT	\N	-15485	USD	2016-09-28 17:47:18.302-04	2016-09-28 17:47:18.302-04	795	1299	842	\N	\N	768	950	\N	665	USD	1	-15485	-19000	\N	aac84042-3716-4bed-a3e0-cecdf15289d2	2	857	6a06d034-559d-4f35-a30d-6abb3f4dd10c
10491	DEBIT	Donation to WWCode Austin	-41020	USD	2016-05-23 16:27:28.524-04	2016-05-23 16:27:28.599-04	741	426	306	\N	\N	258	2500	\N	1480	USD	1	-41020	-50000	\N	86da478e-572c-4a92-af14-3be147502b55	2	857	bcc6f772-cba2-4b19-abdd-7b459c2be5fe
10497	CREDIT	Director t-shirt	3325	USD	2016-10-17 17:01:02.872-04	2016-10-17 17:01:02.925-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3325	3325	\N	534e80f0-b0c7-4d20-bc1c-395b69aa7313	298	857	275a30a1-9c38-4b57-8c52-da31201a3e20
10357	DEBIT	monthly recurring subscription	-798	USD	2017-02-14 13:13:04.109-05	2017-02-14 13:13:04.109-05	762	2549	1616	\N	\N	1531	50	\N	52	USD	1	-798	-1000	\N	64e707dc-d8ce-439d-8e6f-699e4cd230bb	270	857	ce843860-3c75-4dba-99fa-cdd471f2295b
10363	CREDIT	Stacey Schipper	2322	USD	2016-11-03 15:45:04.691-04	2016-11-03 15:45:04.691-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2322	2322	\N	56cf6465-d87b-4803-a9bd-7dd1ace6447c	15	857	e8a5f2bd-3378-4e8c-bae2-bc398137e2ef
10367	CREDIT	Leadership Development	50616	MXN	2017-03-14 14:17:51.969-04	2017-03-14 14:17:51.969-04	51	3	\N	\N	\N	\N	\N	\N	0	MXN	1	50616	50616	887	ead02146-00dc-4ca7-81b1-bfda9dd4aa63	282	857	d79deb76-7b52-4c78-adf3-1037d938f6d7
10373	DEBIT	Recurring subscription	0	MXN	2016-04-02 16:10:38.206-04	2016-04-02 16:10:38.242-04	768	80	42	2016-04-07 16:10:38.206-04	\N	68	\N	\N	\N	\N	1	0	-500	\N	bdc2b1a8-a8b6-4cce-96b5-ce044fbfc1d9	10	857	10c255d9-7412-4834-a08c-d1e6731019bc
10377	DEBIT	Recurring subscription	-52	USD	2016-05-02 14:15:35.25-04	2016-05-02 14:15:35.307-04	691	30	44	\N	\N	70	5	\N	33	USD	1	-52	-100	\N	74eec689-ac30-4e76-87db-f145fb64dcfc	13	857	c039d2b2-9c7f-4d05-86b6-d69c85826f04
10383	DEBIT	Recurring subscription	-52	USD	2016-04-02 14:13:51.122-04	2016-04-16 16:40:58.81-04	691	30	43	\N	\N	69	5	\N	33	USD	1	-52	-100	\N	d6e7d1b3-249c-4670-ab67-70196507112b	13	857	006ac0d6-db6e-4d95-a409-6810b449358d
10387	CREDIT	Food (ATXDivHack)	339421	USD	2016-11-21 10:23:08.279-05	2016-11-21 10:23:08.279-05	847	28	\N	\N	\N	\N	\N	\N	\N	\N	1	339421	339421	467	4625233a-0142-4787-b5c5-27bfff238e6d	2	857	83c11e42-2ce1-4cdb-b13a-b388750be32e
10395	CREDIT	DJ (ATXDivHack)	35000	USD	2016-10-27 17:08:48.506-04	2016-10-27 17:08:48.71-04	847	28	1024	\N	\N	\N	\N	\N	\N	\N	1	35000	35000	453	9de8ce34-df9c-499b-bee6-c45d56cbb49d	2	857	35282d51-ec6b-4f30-971e-80ef5b2dd935
10400	CREDIT	Event food	2911	USD	2016-09-15 20:09:43.149-04	2016-09-15 20:09:43.531-04	826	171	573	\N	\N	\N	\N	\N	\N	\N	1	2911	2911	345	9f7e7854-92dc-43a0-a662-52956d9c10d1	59	857	706f4b15-5cca-4764-a308-649407dccd6f
10406	CREDIT	lunch ordered at Costco	64978	USD	2016-10-28 17:30:59.537-04	2016-10-28 17:30:59.772-04	796	1371	1024	\N	\N	\N	\N	\N	\N	\N	1	64978	64978	418	3dd9c746-fb3a-42ea-9756-dc9dd1e01aee	300	857	3fcfad6a-3804-455d-831e-acf364db969f
10412	DEBIT	Recurring subscription	-52	USD	2016-04-02 21:49:19.352-04	2016-04-16 16:40:58.819-04	688	2	46	\N	\N	72	5	\N	33	USD	1	-52	-100	\N	f129244c-1ee3-4161-8744-8f00e04520fd	13	857	83f43ec0-628e-4918-9543-c963678b86c0
10421	DEBIT	\N	-69722	USD	2017-02-10 11:47:34.349-05	2017-02-10 11:47:34.349-05	838	3053	1890	\N	\N	1801	4212	\N	1883	USD	1	-69722	-84241	\N	64f82dde-daca-498c-9d85-70e2a9b0e5cb	15	857	7fec13ad-bca7-481c-8457-4b66d5d7a0c4
10423	CREDIT	Event Food	2077	USD	2016-10-05 12:43:28.448-04	2016-10-05 12:43:28.644-04	826	171	573	\N	\N	\N	\N	\N	\N	\N	1	2077	2077	374	2bf58764-9703-424e-9c40-dff9f8a8d957	59	857	e6bc6073-09ae-4a33-9f98-deb59f5feafc
10430	CREDIT	Transportation for Sandra and Cici to get to meeting location with core team members	749	USD	2016-08-02 09:39:15.789-04	2016-08-02 09:39:15.797-04	766	31	320	\N	\N	\N	\N	\N	\N	\N	1	749	749	256	a4e027ba-d8f6-403e-ac16-86db7838af1a	14	857	1f28d946-794c-4c4c-9f8b-729a18cbb007
10438	CREDIT	CONFERENCE GRANT	50000	USD	2016-05-10 20:00:00-04	2016-06-14 14:14:22.114-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	50000	50000	196	36aca2ee-be13-4f30-8085-029c54fc97cb	59	857	2b6839bf-f392-482e-a79e-157503d211c0
10527	DEBIT	\N	-39800	GBP	2017-03-31 14:01:48.418-04	2017-03-31 14:01:48.418-04	857	3	\N	\N	\N	2209	0	\N	0	GBP	1	-39800	-39800	\N	43d437a1-acb7-4e64-bfb9-d55261f2253f	278	857	1aa568d9-e686-492a-bcdd-18259e0680d5
10535	CREDIT	\N	1480	USD	2017-04-18 20:20:11.527-04	2017-04-18 20:20:11.527-04	51	3	\N	2017-10-27 13:28:58.464-04	\N	2506	\N	\N	\N	USD	1	1480	1480	\N	bb761635-4f1e-47d7-93fb-00300ee9b643	\N	857	2179d4d2-1ea8-490a-8201-d535c9325b51
10545	DEBIT	\N	-1480	USD	2017-04-18 20:20:11.527-04	2017-04-18 20:20:11.527-04	857	3	\N	\N	\N	2506	0	\N	0	USD	1	-1480	-1480	\N	e71fbb3e-cc08-4991-96ac-662d663bac5a	12	857	2179d4d2-1ea8-490a-8201-d535c9325b51
10556	CREDIT	\N	85000	GBP	2017-04-17 17:05:15.067-04	2017-04-17 17:05:15.067-04	51	3	\N	2017-10-27 13:28:58.472-04	\N	2474	\N	\N	\N	GBP	1	85000	85000	\N	81ff2587-df53-44e1-bb7a-a50ff2dc4228	\N	857	2602104c-059a-4699-a2ec-c864ad850aaa
10565	DEBIT	\N	-85000	GBP	2017-04-17 17:05:15.067-04	2017-04-17 17:05:15.067-04	857	3	\N	\N	\N	2474	0	\N	0	GBP	1	-85000	-85000	\N	7ed27e43-33a5-44a4-bd4c-cc32c4dbb19b	278	857	2602104c-059a-4699-a2ec-c864ad850aaa
10501	CREDIT	\N	610	USD	2017-04-19 14:35:03.04-04	2017-04-19 14:35:03.04-04	51	3	\N	2017-10-27 13:28:58.679-04	\N	2522	\N	\N	\N	USD	1	610	610	\N	2d9c610d-c5aa-4751-bc67-11faef364664	\N	857	4a781259-5ecd-4872-8bd8-564456b9eabc
10508	DEBIT	\N	-610	USD	2017-04-19 14:35:03.04-04	2017-04-19 14:35:03.04-04	857	3	\N	\N	\N	2522	0	\N	0	USD	1	-610	-610	\N	8d0a797a-2afc-4309-94b8-139346d0ccd3	59	857	4a781259-5ecd-4872-8bd8-564456b9eabc
10516	DEBIT	\N	-50000	CAD	2017-03-31 19:37:30.819-04	2017-03-31 19:37:30.819-04	857	3	\N	\N	\N	2217	0	\N	0	CAD	1	-50000	-50000	\N	59e7022b-1850-4ec8-a27d-74d23c93a994	291	857	6d9830de-586c-4e52-b8c5-59c234d0e7e3
10470	DEBIT	WWCode t-shirt sales	-982	USD	2017-01-17 22:24:31.362-05	2017-01-17 22:24:31.504-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-982	-982	\N	8c908812-f046-49d2-9073-5d1e16f53aac	13	857	726293af-cf87-4dbf-9125-f89bb6e6fae7
10519	CREDIT	\N	80500	GBP	2017-03-31 13:54:33.461-04	2017-03-31 13:54:33.461-04	51	3	\N	2017-10-27 13:28:59.526-04	\N	2208	\N	\N	\N	GBP	1	80500	80500	\N	1d2ac510-14b6-4ba7-a9fc-a96adaed5664	\N	857	b49eb2d3-c4e4-415f-8fd0-d6d11c78872b
10577	CREDIT	\N	100000	USD	2017-03-27 13:52:38.123-04	2017-03-27 13:52:38.123-04	51	3	\N	2017-10-27 13:28:59.789-04	\N	2153	\N	\N	\N	USD	1	100000	100000	\N	b1a35205-d578-4422-b208-925210dc4337	\N	857	c92ce00f-4360-4d64-a2f0-de92f8b65130
10586	DEBIT	\N	-100000	USD	2017-03-27 13:52:38.123-04	2017-03-27 13:52:38.123-04	857	3	\N	\N	\N	2153	0	\N	0	USD	1	-100000	-100000	\N	97c2ea1b-66c4-4e66-9b91-2c5e26999459	277	857	c92ce00f-4360-4d64-a2f0-de92f8b65130
10570	CREDIT	Women Techmaker WWcode Partnership Grant	100000	USD	2016-05-24 16:23:16.28-04	2016-05-24 16:23:16.552-04	51	3	\N	2017-10-27 13:28:59.844-04	\N	\N	\N	\N	\N	\N	1	\N	100000	\N	78a7c082-94e0-49d7-a6b6-158d2db2053d	\N	857	cd4e57f4-47dd-4e61-b775-3cb95c96fd04
10572	DEBIT	Women Techmaker WWcode Partnership Grant	-100000	USD	2016-05-24 16:23:16.28-04	2016-05-24 16:23:16.552-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-100000	-100000	\N	e016c7b2-491f-4745-90fa-0a3cd96a3fcc	3	857	cd4e57f4-47dd-4e61-b775-3cb95c96fd04
10523	DEBIT	\N	-20000	USD	2017-03-31 18:50:23.915-04	2017-03-31 18:50:23.915-04	857	3	\N	\N	\N	2214	0	\N	0	USD	1	-20000	-20000	\N	40f0a25e-e07e-4795-b87f-5b87f7cc960b	286	857	ce70a388-ce9d-4f35-8d39-cc5818a899f6
10540	CREDIT	\N	2200	MXN	2017-04-17 18:35:55.014-04	2017-04-17 18:35:55.014-04	51	3	\N	2017-10-27 13:29:00.522-04	\N	2489	\N	\N	\N	MXN	1	2200	2200	\N	89cdee7c-339d-4eb5-a217-36c418a76559	\N	857	fa521a41-29a2-46bb-a86f-01f6d1de24f0
10448	CREDIT	Meetup Fees	6000	USD	2016-12-23 12:10:34.733-05	2016-12-23 12:10:34.733-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	619	c1201a29-fa3d-4944-9511-277b3c2b4a61	265	857	da3a483e-b2c8-4343-bcca-50145a870209
10451	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 16:20:31.263-05	2016-11-30 16:20:31.464-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	7500	7500	\N	fbb14231-30fc-4841-a9ab-b21433bb92e9	269	857	c7e68cca-1c26-429a-a6ad-795194a8c70e
10452	CREDIT	Banner	2000	USD	2016-11-30 16:19:46.014-05	2016-11-30 16:19:46.128-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2000	2000	\N	79bfcbd2-739b-46c6-9265-220f6372a3f6	269	857	3b2bba2e-017c-4f73-81df-6caf61dc8145
10459	CREDIT	Food at our Sept. monthly event	11478	USD	2016-10-04 18:07:11.046-04	2016-10-04 18:07:11.615-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	11478	11478	\N	9a903be2-1bac-4c6b-8af4-2e75b740701e	15	857	b206e633-d452-403b-a4fa-836fce5ebe67
10461	CREDIT	90/10 split: Syema Ailia	250	USD	2016-10-04 12:06:23.454-04	2016-10-04 12:06:23.454-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	250	250	390	96ff66b1-f649-4200-80f7-139d8f09b72a	12	857	354c843f-3781-429d-966d-2e4bc912e42c
10462	CREDIT	90/10 split: Beth Laing	500	USD	2016-10-04 12:06:16.796-04	2016-10-04 12:06:16.796-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	500	500	392	b736bd58-f4e2-46db-9390-e5791db36b92	12	857	93578a41-d7a7-4913-8e20-2bd080d94d34
10469	DEBIT	Donation to WWCode Austin	-124170	USD	2016-08-01 11:54:14.382-04	2016-08-01 11:54:14.468-04	839	883	561	\N	\N	488	7500	\N	3330	USD	1	-124170	-150000	\N	bf55d417-fa30-415a-8433-49a21feba8b2	2	857	bdf4346d-690f-4006-81d7-ca5f640406d5
10475	DEBIT	Recurring subscription	-53	USD	2016-10-09 14:36:17.958-04	2016-10-09 14:36:17.958-04	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	923baf21-0ed1-4f47-86f4-f841ce0e8fae	3	857	7fc57297-759d-4b7f-912e-d6386989d237
10477	DEBIT	Recurring subscription	-53	USD	2016-08-09 14:30:50.866-04	2016-08-09 14:30:50.915-04	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	b434222e-684a-46a9-bd3c-ae53dba840a6	3	857	7a4f9fc3-4cc5-4b41-adb9-4de78d9ac4c8
10489	DEBIT	Donation to WWCode Twin Cities	-53	USD	2016-06-21 12:06:05.517-04	2016-06-21 12:06:05.626-04	775	642	432	\N	\N	361	5	\N	32	USD	1	-53	-100	\N	22306be4-42e4-4c8e-8e05-8fd129ed443c	48	857	27de8579-59fc-4e3d-bf57-e9add6445f3e
10621	DEBIT	\N	-69522	USD	2017-05-09 14:14:23.283-04	2017-05-09 14:14:23.283-04	846	4720	2860	\N	\N	2755	4200	\N	1878	USD	1	-69522	-84000	\N	3a0c2d62-e2ca-4fc5-9485-f8c2c0b85a63	2	857	b0a771c2-2194-4efb-b7a8-c0d5bd4ce065
10583	DEBIT	\N	-100000	USD	2017-03-27 13:53:48.539-04	2017-03-27 13:53:48.539-04	857	3	\N	\N	\N	2154	0	\N	0	USD	1	-100000	-100000	\N	e7a9c8b7-35ed-40e8-9d2f-8139de36cbed	277	857	030885b1-73c8-4a93-bd39-5fc64eb414a6
10558	CREDIT	\N	100000	USD	2017-04-17 16:41:37.627-04	2017-04-17 16:41:37.627-04	51	3	\N	2017-10-27 13:28:58.293-04	\N	2472	\N	\N	\N	USD	1	100000	100000	\N	da1d1e6d-8cf4-4354-a0a2-bcda6cc136a1	\N	857	07d97f6f-d2ae-4d7f-a749-c7408b1b2050
10567	DEBIT	\N	-100000	USD	2017-04-17 16:41:37.627-04	2017-04-17 16:41:37.627-04	857	3	\N	\N	\N	2472	0	\N	0	USD	1	-100000	-100000	\N	36ff55d9-c96f-4854-b682-841ec4f790a6	517	857	07d97f6f-d2ae-4d7f-a749-c7408b1b2050
10506	DEBIT	AJUG - Global and fees	0	USD	2017-04-20 17:39:17.741-04	2017-04-20 17:39:18.323-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	0	-26250	\N	643d85d4-a12c-4d51-acb0-347b9165ff8f	12	857	0d075412-8701-493e-89cf-550cc0bcd68b
10596	CREDIT	Donations via meetup - fees/global development	2000	USD	2017-02-06 17:56:24.306-05	2017-02-06 17:56:24.52-05	51	3	\N	2017-10-27 13:28:58.348-04	\N	\N	\N	\N	\N	\N	1	\N	2000	\N	3e1c33ec-8a9b-4851-8a26-80eb19424d15	\N	857	1173aeb5-5f4c-40bb-96a2-7bc5f37cc316
10534	CREDIT	\N	1400	USD	2017-04-18 20:31:31.942-04	2017-04-18 20:31:31.942-04	51	3	\N	2017-10-27 13:28:58.44-04	\N	2507	\N	\N	\N	USD	1	1400	1400	\N	8191196c-5587-4cef-8b56-b60a7d24518f	\N	857	1d750667-9b2d-4dbe-befc-f55ddea0d44b
10543	DEBIT	\N	-1400	USD	2017-04-18 20:31:31.942-04	2017-04-18 20:31:31.942-04	857	3	\N	\N	\N	2507	0	\N	0	USD	1	-1400	-1400	\N	f4926c18-985b-4190-ab6d-fc5eb4517a1f	195	857	1d750667-9b2d-4dbe-befc-f55ddea0d44b
10612	DEBIT	Donation via meetup	-775	USD	2017-01-17 22:48:10.558-05	2017-01-17 22:48:10.699-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-775	-775	\N	c7aa4be1-221a-43b9-9378-fa0596026e30	272	857	3b71a9e4-6819-439c-a2de-4037208530f4
10539	CREDIT	\N	100000	USD	2017-04-17 18:40:40.357-04	2017-04-17 18:40:40.357-04	51	3	\N	2017-10-27 13:28:58.647-04	\N	2490	\N	\N	\N	USD	1	100000	100000	\N	f139b9fb-c1b4-4326-a71f-4c782f428628	\N	857	3f31bbab-1925-4397-8600-e5c7f46fc7a0
10517	CREDIT	\N	100000	USD	2017-03-31 18:32:34.123-04	2017-03-31 18:32:34.123-04	51	3	\N	2017-10-27 13:28:58.732-04	\N	2212	\N	\N	\N	USD	1	100000	100000	\N	bdceca79-f429-4994-9d37-c491ac1be6b2	\N	857	53460141-b1cc-4449-af00-504e48077496
10618	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 22:30:10.748-05	2017-01-17 22:30:10.906-05	51	3	\N	2017-10-27 13:28:58.832-04	\N	\N	\N	\N	\N	\N	1	\N	982	\N	a1b55994-7f7b-4a91-8582-c9c36d35f848	\N	857	68726c91-0477-4c2b-b220-65dfd5d449aa
10578	CREDIT	\N	20000	USD	2017-03-27 13:45:17.58-04	2017-03-27 13:45:17.58-04	51	3	\N	2017-10-27 13:28:58.953-04	\N	2152	\N	\N	\N	USD	1	20000	20000	\N	7fe1f6a4-3651-4945-82b9-b4e3daa0983c	\N	857	70fb7209-44c7-4352-a624-9ccb2aac7f72
10587	DEBIT	\N	-20000	USD	2017-03-27 13:45:17.58-04	2017-03-27 13:45:17.58-04	857	3	\N	\N	\N	2152	0	\N	0	USD	1	-20000	-20000	\N	d5475dcb-6ca9-44fe-8490-bd14d6336070	59	857	70fb7209-44c7-4352-a624-9ccb2aac7f72
10500	CREDIT	\N	2930	USD	2017-05-01 20:33:45.73-04	2017-05-01 20:33:45.73-04	51	3	\N	2017-10-27 13:28:59.087-04	\N	2662	\N	\N	\N	USD	1	2930	2930	\N	7646f02c-d3fc-499f-989d-ea4568acbc0c	\N	857	826beb60-8fce-415f-902a-7f170e644a29
10509	DEBIT	\N	-2930	USD	2017-05-01 20:33:45.73-04	2017-05-01 20:33:45.73-04	857	3	\N	\N	\N	2662	0	\N	0	USD	1	-2930	-2930	\N	84b4f1b6-7173-4f0b-b53a-b29c6b158321	3	857	826beb60-8fce-415f-902a-7f170e644a29
10554	CREDIT	\N	100000	USD	2017-04-17 18:09:42.57-04	2017-04-17 18:09:42.57-04	51	3	\N	2017-10-27 13:28:59.094-04	\N	2477	\N	\N	\N	USD	1	100000	100000	\N	894d0ed4-2d4b-43c7-b517-3291987b0a75	\N	857	8481cf7b-4a56-433b-ae1c-d366926f8ab7
10564	DEBIT	\N	-100000	USD	2017-04-17 18:09:42.57-04	2017-04-17 18:09:42.57-04	857	3	\N	\N	\N	2477	0	\N	0	USD	1	-100000	-100000	\N	a1eb9a0d-29c2-466a-9871-68be81ef2a92	270	857	8481cf7b-4a56-433b-ae1c-d366926f8ab7
10573	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	34750	USD	2016-05-26 16:50:28.413-04	2016-05-26 16:50:28.721-04	51	3	\N	2017-10-27 13:28:59.129-04	\N	\N	\N	\N	\N	\N	1	\N	34750	\N	ff01de4d-1cee-4428-b9a1-ba89dc48e161	\N	857	8970a092-2d0a-4aef-8d69-e28af07aedb7
10582	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-34750	USD	2016-05-26 16:50:28.413-04	2016-05-26 16:50:28.721-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-34750	-34750	\N	5d2b8594-0dd6-45db-87ee-ff9c86ec523c	59	857	8970a092-2d0a-4aef-8d69-e28af07aedb7
10592	DEBIT	Leadership Development: Google I/O travel grant for Gen A. 	-85000	USD	2017-03-27 09:25:14.008-04	2017-03-27 09:25:14.169-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-85000	-85000	\N	7577b305-95b0-4026-aa8d-2d93407b35a4	278	857	9a9b6f95-afa5-44ea-8274-455dc7921d3e
10616	CREDIT	WWCode t-shirt sales	4742	USD	2017-01-17 22:31:50.631-05	2017-01-17 22:31:50.774-05	51	3	\N	2017-10-27 13:28:59.393-04	\N	\N	\N	\N	\N	\N	1	\N	4742	\N	e47aa3f0-fe87-49ee-8418-d3d32e89649d	\N	857	9c04ead9-f53a-4eee-b6ab-dbb3f9c1cfcd
10625	DEBIT	WWCode t-shirt sales	-4742	USD	2017-01-17 22:31:50.631-05	2017-01-17 22:31:50.774-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4742	-4742	\N	2a0902c3-3ae3-45cf-b7b2-d460fd562b80	2	857	9c04ead9-f53a-4eee-b6ab-dbb3f9c1cfcd
10623	DEBIT	WWCode t-shirt sales	-2371	USD	2017-01-17 22:33:30.061-05	2017-01-17 22:33:30.587-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2371	-2371	\N	77e3dbe3-0cac-4e23-b2d2-98d03effc608	271	857	a4a96bc7-e851-4c91-a74b-d7e6694d1d92
10580	CREDIT	\N	50000	USD	2017-03-27 13:10:04.622-04	2017-03-27 13:10:04.622-04	51	3	\N	2017-10-27 13:28:59.726-04	\N	2151	\N	\N	\N	USD	1	50000	50000	\N	f6dbd622-b191-43d7-b9aa-a6dc90ede041	\N	857	c0e32927-acf1-4d51-ad1d-00780a474ca0
10588	DEBIT	\N	-50000	USD	2017-03-27 13:10:04.622-04	2017-03-27 13:10:04.622-04	857	3	\N	\N	\N	2151	0	\N	0	USD	1	-50000	-50000	\N	0d861c7c-c661-42af-b961-fe05cfc06bb6	12	857	c0e32927-acf1-4d51-ad1d-00780a474ca0
10597	CREDIT	Gitlab - transaction and global development	41400	USD	2017-02-06 17:12:42.534-05	2017-02-06 17:12:42.684-05	51	3	\N	2017-10-27 13:28:59.763-04	\N	\N	\N	\N	\N	\N	1	\N	41400	\N	f9b8082a-6abc-451e-b329-f3aa0a5d44a9	\N	857	c6dc9ff9-2ff2-49ad-99f2-c91fc26f00d9
10520	CREDIT	\N	1480	USD	2017-04-18 20:39:23.15-04	2017-04-18 20:39:23.15-04	51	3	\N	2017-10-27 13:28:59.824-04	\N	2508	\N	\N	\N	USD	1	1480	1480	\N	5c7b75fe-5d48-463f-99d8-4c04a77d73d2	\N	857	cc63a3a0-eed9-4502-8ccd-78f1cca0ba7f
10529	DEBIT	\N	-1480	USD	2017-04-18 20:39:23.15-04	2017-04-18 20:39:23.15-04	857	3	\N	\N	\N	2508	0	\N	0	USD	1	-1480	-1480	\N	c3bd5f23-1541-4be0-8667-f4595e1cc67c	14	857	cc63a3a0-eed9-4502-8ccd-78f1cca0ba7f
10599	CREDIT	Global Network Development	500000	USD	2017-01-25 13:27:46.907-05	2017-01-25 13:27:47.421-05	51	3	\N	2017-10-27 13:29:00.11-04	\N	\N	\N	\N	\N	\N	1	\N	500000	\N	13eaaca4-7cf4-4497-8078-6bd085ab2812	\N	857	d9b6f587-3d7e-4a35-821b-2fbd5d0c8c6c
10610	DEBIT	Global Network Development	-500000	USD	2017-01-25 13:27:46.907-05	2017-01-25 13:27:47.421-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-500000	-500000	\N	c963416f-f479-42df-8c4a-fd06ada5fa20	51	857	d9b6f587-3d7e-4a35-821b-2fbd5d0c8c6c
10605	DEBIT	Donations via meetup - fees	-12	USD	2017-02-06 17:58:38.922-05	2017-02-06 17:58:39.29-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-12	-1200	\N	244abf4d-e767-4174-a7a4-309877ad1727	13	857	e6c58998-ba04-458f-b589-c1fe19ba4331
10553	CREDIT	\N	41000	GBP	2017-04-17 18:31:52.729-04	2017-04-17 18:31:52.729-04	51	3	\N	2017-10-27 13:29:00.257-04	\N	2486	\N	\N	\N	GBP	1	41000	41000	\N	12f959ef-1ab0-44cd-ab94-ee120aa354ac	\N	857	f5a5b41d-2dbc-48f6-bb31-5889f0a2a89c
10562	DEBIT	\N	-41000	GBP	2017-04-17 18:31:52.729-04	2017-04-17 18:31:52.729-04	857	3	\N	\N	\N	2486	0	\N	0	GBP	1	-41000	-41000	\N	95d2e5f1-72ae-4570-8d66-aa3db8a1cd11	278	857	f5a5b41d-2dbc-48f6-bb31-5889f0a2a89c
10560	CREDIT	\N	4000	GBP	2017-04-17 15:31:52.919-04	2017-04-17 15:31:52.919-04	51	3	\N	2017-10-27 13:29:00.269-04	\N	2470	\N	\N	\N	GBP	1	4000	4000	\N	bda9ca41-4ed3-4814-a852-32001db672c5	\N	857	f71d0b44-3468-4234-8908-e715c6f3281b
10569	DEBIT	\N	-4000	GBP	2017-04-17 15:31:52.919-04	2017-04-17 15:31:52.919-04	857	3	\N	\N	\N	2470	0	\N	0	GBP	1	-4000	-4000	\N	d27ee84e-8bf1-4a21-a3c4-fd414f427599	267	857	f71d0b44-3468-4234-8908-e715c6f3281b
10549	DEBIT	\N	-2200	MXN	2017-04-17 18:35:55.014-04	2017-04-17 18:35:55.014-04	857	3	\N	\N	\N	2489	0	\N	0	MXN	1	-2200	-2200	\N	cbf42f43-1ddd-4d31-9ed6-675f422c8b4e	511	857	fa521a41-29a2-46bb-a86f-01f6d1de24f0
10630	DEBIT	\N	-20670	USD	2017-04-10 21:09:50.621-04	2017-04-10 21:09:50.621-04	842	4153	2535	\N	\N	2421	1250	\N	580	USD	1	-20670	-25000	\N	332f9af1-1b41-4a0b-8513-e45aed86881d	13	857	b2738221-6047-4b90-b44b-670604e54a2e
10632	DEBIT	Recurring subscription	-798	USD	2017-01-01 18:32:21.416-05	2017-01-01 18:32:21.416-05	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	d0eb479e-ae80-4f0d-8fc8-a5a9b56fb7d6	2	857	a6d88fa8-4a25-4ac6-82e5-0e5916ca2665
10633	DEBIT	monthly recurring subscription	-798	USD	2017-04-10 00:43:06.965-04	2017-04-10 00:43:06.965-04	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	949e73ad-a83f-4c42-89d4-fd022b78fb2e	241	857	ed9642b4-b795-42e0-90e4-1d0f1f8af2d2
10655	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-27 12:52:16.09-05	2016-12-27 12:52:16.167-05	51	3	\N	2017-10-27 13:28:58.436-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	9cd92388-297f-46af-8d40-722ae8c84bd3	\N	857	1c7e1c6f-2519-4fa0-bce6-2eeb22cc23a5
10639	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 10:51:42.465-05	2016-12-28 10:51:38.84-05	51	3	\N	2017-10-27 13:28:58.591-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	bf0877ac-afdb-4df7-92c3-a4a64f97273f	\N	857	351a07a3-fc4c-4edc-9117-7cd093d2cfbe
10646	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 10:51:42.465-05	2016-12-28 10:51:38.84-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	3a46c47d-0f2c-45bf-b498-cf0192daa133	289	857	351a07a3-fc4c-4edc-9117-7cd093d2cfbe
10649	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 13:33:56.275-05	2016-12-27 13:33:56.372-05	51	3	\N	2017-10-27 13:28:58.611-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	b4a79dac-54e3-4462-9da8-538bbdcd5284	\N	857	3a1c520f-0bbb-42ef-97ad-7b4cbf181c13
10652	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 13:33:56.275-05	2016-12-27 13:33:56.372-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	9fb7ece4-bb37-4125-ac45-546753737000	284	857	3a1c520f-0bbb-42ef-97ad-7b4cbf181c13
10638	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-28 10:55:25.022-05	2016-12-28 10:55:21.475-05	51	3	\N	2017-10-27 13:28:58.631-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	780f905b-4367-4a6e-8109-740f784a275d	\N	857	3c280868-8002-42bd-a688-26672bb6eda1
10645	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-28 10:55:25.022-05	2016-12-28 10:55:21.475-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	eea958cf-238c-47c4-81d3-77c6020c9ec5	297	857	3c280868-8002-42bd-a688-26672bb6eda1
10601	CREDIT	Donations - Fees 	17328	USD	2017-02-06 15:06:15.502-05	2017-02-06 15:06:15.622-05	51	3	\N	2017-10-27 13:28:58.698-04	\N	\N	\N	\N	\N	\N	1	\N	17328	\N	e11c87ca-b562-4ea4-8734-5d85cf6e0786	\N	857	4d8f998f-9a40-43ae-bbdd-ab756c9f0352
10617	CREDIT	WWCode t-shirt sales	2778	USD	2017-01-17 22:30:54.132-05	2017-01-17 22:30:54.465-05	51	3	\N	2017-10-27 13:28:58.709-04	\N	\N	\N	\N	\N	\N	1	\N	2778	\N	2188609a-e218-49eb-b798-9b91321aa9a0	\N	857	4ed6c278-ef3c-4a62-b8a2-313de1fcbec4
10626	DEBIT	WWCode t-shirt sales	-2778	USD	2017-01-17 22:30:54.132-05	2017-01-17 22:30:54.465-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2778	-2778	\N	1cd78f49-cfa4-4651-bd23-c7a158ae92d4	3	857	4ed6c278-ef3c-4a62-b8a2-313de1fcbec4
10620	CREDIT	WWCode t-shirt sales	1106	USD	2017-01-17 22:29:09.407-05	2017-01-17 22:29:09.561-05	51	3	\N	2017-10-27 13:28:58.752-04	\N	\N	\N	\N	\N	\N	1	\N	1106	\N	64eff83d-bb41-4d93-98bb-0cd16a066983	\N	857	58c425fd-5349-4cfe-9804-45ff0842c48d
10593	CREDIT	\N	154800	USD	2017-05-01 14:02:20.511-04	2017-05-01 14:02:20.511-04	51	3	\N	2017-10-27 13:28:58.802-04	\N	2649	\N	\N	\N	USD	1	154800	154800	\N	954d12ff-8a01-4ad2-93da-13a7ca022055	\N	857	626eb770-4a37-48b0-864a-9c4f53dc8b89
10602	DEBIT	\N	-154800	USD	2017-05-01 14:02:20.511-04	2017-05-01 14:02:20.511-04	857	3	\N	\N	\N	2649	0	\N	0	USD	1	-154800	-154800	\N	9ac6be66-1043-422b-8c7d-f50a4a985b60	13	857	626eb770-4a37-48b0-864a-9c4f53dc8b89
10658	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:30:02.12-05	2016-12-27 11:30:02.272-05	51	3	\N	2017-10-27 13:28:58.828-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	12e4eed9-740e-47b4-99bd-3a5cd22bfedd	\N	857	67d03a02-261d-4e37-be8b-3c90971a6f18
10666	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:30:02.12-05	2016-12-27 11:30:02.272-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	1bb03cff-30f3-4541-99d2-749cffff7acc	15	857	67d03a02-261d-4e37-be8b-3c90971a6f18
10628	DEBIT	WWCode t-shirt sales	-982	USD	2017-01-17 22:30:10.748-05	2017-01-17 22:30:10.906-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-982	-982	\N	4a15274f-cef3-42f8-9805-84e5faf0af14	259	857	68726c91-0477-4c2b-b220-65dfd5d449aa
10654	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 12:59:52.939-05	2016-12-27 12:59:53.047-05	51	3	\N	2017-10-27 13:28:59.014-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	2d3312ec-186a-4cf5-8b75-f173d21b52b7	\N	857	75e86b03-d614-4b46-a0f0-5da2492d96a6
10661	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 12:59:52.939-05	2016-12-27 12:59:53.047-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	8edd1982-49e6-48fb-b9c8-39ce34eaada1	10	857	75e86b03-d614-4b46-a0f0-5da2492d96a6
10640	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 10:46:26.348-05	2016-12-28 10:46:22.824-05	51	3	\N	2017-10-27 13:28:59.073-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	1e8287c1-7e0a-44c3-af56-d6042aa18d87	\N	857	820454f4-4aca-4324-9792-0b427cb327cf
10647	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 10:46:26.348-05	2016-12-28 10:46:22.824-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	fb889544-abbe-437d-b386-a12092ecd3f7	300	857	820454f4-4aca-4324-9792-0b427cb327cf
10591	CREDIT	Leadership Development: Google I/O travel grant for Gen A. 	85000	USD	2017-03-27 09:25:14.008-04	2017-03-27 09:25:14.169-04	51	3	\N	2017-10-27 13:28:59.206-04	\N	\N	\N	\N	\N	\N	1	\N	85000	\N	9557844d-88ff-4128-b436-20672d108e51	\N	857	9a9b6f95-afa5-44ea-8274-455dc7921d3e
10576	CREDIT	Quotient Hackathon support	90000	USD	2016-10-07 15:52:59.206-04	2016-10-07 15:52:59.391-04	51	3	\N	2017-10-27 13:28:59.402-04	\N	\N	\N	\N	\N	\N	1	\N	90000	\N	05820f8f-68aa-4fb1-88fb-f0dee36b4125	\N	857	9fe73e46-d6e9-4b78-a516-d83f320b89d6
10585	DEBIT	Quotient Hackathon support	-90000	USD	2016-10-07 15:52:59.206-04	2016-10-07 15:52:59.391-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-90000	-90000	\N	438fce33-5d02-4d10-b766-802b5ce5be04	300	857	9fe73e46-d6e9-4b78-a516-d83f320b89d6
10636	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	50000	USD	2016-05-26 16:48:43.015-04	2016-05-26 16:48:43.336-04	51	3	\N	2017-10-27 13:28:59.454-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	9bbfbec6-2fa9-459c-b34c-5d19ccf79535	\N	857	a4051d55-3e02-4fd7-b335-6273205b101d
10642	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-50000	USD	2016-05-26 16:48:43.015-04	2016-05-26 16:48:43.336-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	4f27bf7e-b1da-4427-a06b-b49c95de0ae6	59	857	a4051d55-3e02-4fd7-b335-6273205b101d
10672	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:14:47.836-05	2016-12-27 11:14:47.951-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	eb8a2fd9-5eae-49fc-9e44-b3440e5d94aa	271	857	a8f7270c-7d07-4fde-87ec-e3b16c907cc5
10644	DEBIT	\N	-16563	EUR	2017-05-08 11:30:18.585-04	2017-05-08 11:30:18.585-04	857	3	\N	\N	\N	2741	0	\N	0	EUR	1	-16563	-16563	\N	7324306e-de17-454b-8ab9-7670bb2e1ada	301	857	bd8a5e91-6874-4e32-b113-b3d7344639dd
10641	DEBIT	Leadership Development: Google I/O grant for Luisa M.	-100000	USD	2017-03-22 13:56:10.528-04	2017-03-22 13:56:10.804-04	857	3	\N	\N	\N	\N	\N	\N	\N	USD	1	-100000	-100000	\N	1e9c9c05-67f5-42ca-833e-3f84369b1879	3	857	beee6e11-f546-4822-93c3-5686940cd89f
10581	CREDIT	\N	90000	USD	2017-05-11 12:41:16.759-04	2017-05-11 12:41:16.759-04	51	3	\N	2017-10-27 13:28:59.883-04	\N	2794	\N	\N	\N	USD	1	90000	90000	\N	a51308e8-0542-40ec-bdb4-76fc432082eb	\N	857	d2ad1efa-2f9a-4ce0-8f80-3dba7f1ba6eb
10590	DEBIT	\N	-90000	USD	2017-05-11 12:41:16.759-04	2017-05-11 12:41:16.759-04	857	3	\N	\N	\N	2794	0	\N	0	USD	1	-90000	-90000	\N	7b1fde60-c5f2-45c6-a2fd-1709944e5880	59	857	d2ad1efa-2f9a-4ce0-8f80-3dba7f1ba6eb
10637	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 10:57:55.359-05	2016-12-28 10:57:51.831-05	51	3	\N	2017-10-27 13:28:59.889-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	92d297c5-83da-4fe9-ad22-95afb85e63a1	\N	857	d323e9f5-6b2f-4db2-8340-417addb4ddf6
10613	CREDIT	WWCode t-shirt sales	7570	USD	2017-01-17 22:34:31.424-05	2017-01-17 22:34:31.75-05	51	3	\N	2017-10-27 13:29:00.07-04	\N	\N	\N	\N	\N	\N	1	\N	7570	\N	1e90f8d4-8be7-4d37-aec4-43a865fd405e	\N	857	d504d71b-2ab4-43fd-a645-6eb2f63a9d58
10622	DEBIT	WWCode t-shirt sales	-7570	USD	2017-01-17 22:34:31.424-05	2017-01-17 22:34:31.75-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-7570	-7570	\N	7e8257ea-6542-4e54-8073-50a587551fc8	300	857	d504d71b-2ab4-43fd-a645-6eb2f63a9d58
10653	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 12:56:03.911-05	2016-12-27 12:56:03.985-05	51	3	\N	2017-10-27 13:29:00.116-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	8d3280af-f4b1-4415-ab47-7cd372821159	\N	857	dbb011dc-857a-401a-a84c-cab3e80f3a9f
10662	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 12:56:03.911-05	2016-12-27 12:56:03.985-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	98a95e41-1a2c-48d8-b80e-563e33a4565e	282	857	dbb011dc-857a-401a-a84c-cab3e80f3a9f
10608	DEBIT	Taipei Donation - fees and global development	-8	USD	2017-02-06 15:11:26.406-05	2017-02-06 15:11:26.522-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-8	-800	\N	5949c2d8-13d1-4526-89bf-c121b7fb28c1	241	857	de1c4ac6-b3ff-40ad-a654-d7f428c7abc7
10595	CREDIT	Donations via meetup - fees	1200	USD	2017-02-06 17:58:38.922-05	2017-02-06 17:58:39.29-05	51	3	\N	2017-10-27 13:29:00.188-04	\N	\N	\N	\N	\N	\N	1	\N	1200	\N	2300efeb-b7fe-46e8-bbbb-67741a0e8b99	\N	857	e6c58998-ba04-458f-b589-c1fe19ba4331
10615	CREDIT	WWCode t-shirt sales	1389	USD	2017-01-17 22:32:30.654-05	2017-01-17 22:32:30.825-05	51	3	\N	2017-10-27 13:29:00.194-04	\N	\N	\N	\N	\N	\N	1	\N	1389	\N	20c9e01a-ed9f-4935-aed6-d64bbccdfa87	\N	857	e7169c88-74f1-438d-983e-dfc9b6db087e
10624	DEBIT	WWCode t-shirt sales	-1389	USD	2017-01-17 22:32:30.654-05	2017-01-17 22:32:30.825-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1389	-1389	\N	b8bbd345-823a-41cb-a9e0-3e9a2b194bbc	15	857	e7169c88-74f1-438d-983e-dfc9b6db087e
10657	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 12:48:49.207-05	2016-12-27 12:48:49.297-05	51	3	\N	2017-10-27 13:29:00.2-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	87ca594d-c33c-412e-b9eb-1b21c6db8362	\N	857	e8577a0c-bf25-4dcf-8a3a-064cfb317d7e
10665	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 12:48:49.207-05	2016-12-27 12:48:49.297-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	5dccbd54-e7a8-4300-b33c-630eb6033726	280	857	e8577a0c-bf25-4dcf-8a3a-064cfb317d7e
10598	CREDIT	Donation - fees	800	USD	2017-02-06 17:10:44.604-05	2017-02-06 17:10:44.763-05	51	3	\N	2017-10-27 13:29:00.547-04	\N	\N	\N	\N	\N	\N	1	\N	800	\N	b54a6d02-e94a-47f3-86e9-6b51ffe154ae	\N	857	fe236503-94c6-412b-b85c-164dc10a0b92
10609	DEBIT	Donation - fees	-8	USD	2017-02-06 17:10:44.604-05	2017-02-06 17:10:44.763-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-8	-800	\N	47ad30c3-4739-4d33-a9f9-e555a174b97a	270	857	fe236503-94c6-412b-b85c-164dc10a0b92
10711	DEBIT	monthly recurring subscription	-2040	USD	2017-04-01 14:31:19.231-04	2017-04-01 14:31:19.231-04	692	2906	1804	\N	\N	1712	125	\N	85	USD	1	-2040	-2500	\N	11c18312-8d3c-4a93-949d-9d86682bbe2e	271	857	4e3c5e17-66a7-41ee-ad57-5ad0f753524d
10720	DEBIT	Recurring subscription	-798	USD	2016-10-01 19:35:17.911-04	2016-10-01 19:35:17.911-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	5d3bc46c-2431-4f8e-88bb-86e15a8086df	2	857	eb5944ba-4556-410f-abf4-423dd690e9c8
10823	DEBIT	Donation to WWCode Seattle	-52	USD	2016-02-02 16:46:44.866-05	2016-04-16 16:40:58.7-04	819	8	45	\N	\N	71	5	\N	33	USD	1	-52	-100	\N	e8ca5889-7f98-466a-8da6-ac6875f25a73	14	857	d7145c0b-68ab-46e4-a34e-d51484416e31
10827	DEBIT	Donation to WWCode Austin	-26100	USD	2016-03-25 11:11:04.684-04	2016-04-16 16:40:58.812-04	805	192	152	\N	\N	64	0	\N	900	USD	1	-26100	-30000	\N	cf722527-cc29-4cf6-9806-1a9ae1bd5ba3	2	857	5eb5d13c-ae86-411e-a5d9-be176f1afa91
10828	DEBIT	Donation to WWCode Austin	-123120	USD	2016-06-06 15:04:37.186-04	2016-06-06 15:04:37.308-04	781	551	377	\N	\N	312	7500	\N	4380	USD	1	-123120	-150000	\N	9c5de640-7434-411a-b095-bd9f31fd6007	2	857	00e24e56-1073-412d-9afd-8562e7eb7f34
10659	CREDIT	Global Development for Meetup Fee	6000	INR	2016-12-27 11:24:37.915-05	2016-12-27 11:24:38.038-05	51	3	\N	2017-10-27 13:28:58.261-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	c44ebfdc-70ec-41bb-8bdb-ae4a2fdf7030	\N	857	029027d6-1e6a-47b6-a897-e83ea704b8d1
10664	DEBIT	Global Development for Meetup Fee	-6000	INR	2016-12-27 11:24:37.915-05	2016-12-27 11:24:38.038-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	47a764b9-8925-49c6-b670-c65315baff4c	47	857	029027d6-1e6a-47b6-a897-e83ea704b8d1
10733	CREDIT	Donation from Margaret - fees	2012	USD	2016-11-29 18:37:14.82-05	2016-11-29 18:37:15.082-05	51	3	\N	2017-10-27 13:28:58.284-04	\N	\N	\N	\N	\N	\N	1	\N	2012	\N	655bc337-068a-4449-8b5c-796cae203087	\N	857	06e64f9d-a4db-49a7-8f39-7eb3c3da1704
10741	DEBIT	Donation from Margaret - fees	-2012	USD	2016-11-29 18:37:14.82-05	2016-11-29 18:37:15.082-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2012	-2012	\N	15040f8c-9825-431e-a8a6-e3fbfa9102a5	272	857	06e64f9d-a4db-49a7-8f39-7eb3c3da1704
10874	CREDIT	Network Development	17750	USD	2016-10-11 15:17:21.991-04	2016-10-11 15:17:22.199-04	51	3	\N	2017-10-27 13:28:58.298-04	\N	\N	\N	\N	\N	\N	1	\N	17750	\N	1be9fcd8-8a32-4688-a83e-b28948305f01	\N	857	095272ad-67ff-425d-86bc-50f14ec0836a
10889	CREDIT	Google I/O stipend	75000	USD	2016-10-11 12:01:42.326-04	2016-10-11 12:01:43.286-04	51	3	\N	2017-10-27 13:28:58.31-04	\N	\N	\N	\N	\N	\N	1	\N	75000	\N	2b15ae66-5a48-4e8c-8b2f-10fd381399e2	\N	857	0c2b58db-6d38-4cb5-a8a4-d06599f357b0
10757	CREDIT	$5000 Intel Hackathon support - global development	450000	USD	2016-11-17 13:23:08.268-05	2016-11-17 13:23:08.461-05	51	3	\N	2017-10-27 13:28:58.315-04	\N	\N	\N	\N	\N	\N	1	\N	450000	\N	676ce0d4-e48e-4be0-a857-b4cb051da3f7	\N	857	0c6381c5-5004-4187-95ca-8421b0984012
10663	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-27 12:52:16.09-05	2016-12-27 12:52:16.167-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	34fa934b-ea2d-4b2b-b341-427790760465	281	857	1c7e1c6f-2519-4fa0-bce6-2eeb22cc23a5
10669	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-27 13:40:49.86-05	2016-12-27 13:40:49.921-05	51	3	\N	2017-10-27 13:28:58.459-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	cffd1745-5a2e-41e2-ae46-4949db8ee958	\N	857	210d6874-4b38-4092-93b5-3e7dd7ab10e1
10838	CREDIT	\N	60000	USD	2017-05-02 14:45:44.253-04	2017-05-02 14:45:44.253-04	51	3	\N	2017-10-27 13:28:58.812-04	\N	2677	\N	\N	\N	USD	1	60000	60000	\N	6e246d4d-8ca8-4e50-8483-5f6abcedbee4	\N	857	644e54bc-af4b-463f-9c67-ef5913edc3e8
10774	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	80000	USD	2016-05-31 14:01:08.532-04	2016-05-31 14:01:07.064-04	51	3	\N	2017-10-27 13:28:58.937-04	\N	\N	\N	\N	\N	\N	1	\N	80000	\N	05eee302-82b3-4a23-bdfe-0d219e70274b	\N	857	70c25002-010f-4719-86a1-b53b766f231d
10783	DEBIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	-80000	USD	2016-05-31 14:01:08.532-04	2016-05-31 14:01:07.064-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-80000	-80000	\N	3a0fefb9-9ff9-4121-bca6-22ee7d2c3673	13	857	70c25002-010f-4719-86a1-b53b766f231d
10854	CREDIT	Network Development	20000	USD	2016-10-11 16:03:19.884-04	2016-10-11 16:03:20.084-04	51	3	\N	2017-10-27 13:28:58.966-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	46e5b865-5b82-40ce-a9b6-8a9577d9aa1f	\N	857	72bcaf22-1e3a-4883-8a9c-2c7d25bf7f2b
10863	DEBIT	Network Development	-20000	USD	2016-10-11 16:03:19.884-04	2016-10-11 16:03:20.084-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	95d2d3c4-3b97-4133-9aaa-c494b0c26114	271	857	72bcaf22-1e3a-4883-8a9c-2c7d25bf7f2b
10678	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 14:37:32.49-05	2016-12-23 14:37:32.668-05	51	3	\N	2017-10-27 13:28:58.998-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	8b3d1a2c-3718-4517-9244-629531cfb23a	\N	857	7572a9eb-fca5-47f5-a11f-4d095a64b5a6
10708	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 14:54:51.439-05	2016-12-27 14:54:51.679-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	dfaca9b6-1b07-448f-8815-e3b75738be3f	4	857	77d95b00-160f-4992-a5e1-32d6a44ada62
10753	CREDIT	Network Development - 10k member bonus	100000	USD	2016-11-29 16:58:23.625-05	2016-11-29 16:58:23.799-05	51	3	\N	2017-10-27 13:28:59.068-04	\N	\N	\N	\N	\N	\N	1	\N	100000	\N	8158b80d-5e99-4f6d-bf0a-a3ea64c3bfb5	\N	857	81cad528-ce65-413b-aeb9-75bebff4e954
10761	DEBIT	Network Development - 10k member bonus	-100000	USD	2016-11-29 16:58:23.625-05	2016-11-29 16:58:23.799-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-100000	-100000	\N	30fdf32d-a287-4332-804d-df6d3fdd0b22	4	857	81cad528-ce65-413b-aeb9-75bebff4e954
10673	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 11:24:49.292-05	2016-12-28 11:24:45.838-05	51	3	\N	2017-10-27 13:28:59.078-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	63d3985a-865e-4d4b-a9cd-70e1597fbe54	\N	857	82396f62-2dcb-43f3-a1ce-fba7bc97cf0f
10726	CREDIT	Banner	2000	USD	2016-11-30 16:33:30.25-05	2016-11-30 16:33:30.386-05	51	3	\N	2017-10-27 13:28:59.083-04	\N	\N	\N	\N	\N	\N	1	\N	2000	\N	092e39b0-a7bb-4dac-a8eb-39d12826ce18	\N	857	8265195b-adaa-4c61-875d-387408976706
10728	DEBIT	Banner	-2000	USD	2016-11-30 16:33:30.25-05	2016-11-30 16:33:30.386-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2000	-2000	\N	bd74a661-7179-4870-82ce-8bd7cb6c1a4e	263	857	8265195b-adaa-4c61-875d-387408976706
10807	CREDIT	WWCode t-shirt sales	3563	USD	2017-01-17 22:28:29.874-05	2017-01-17 22:28:30.096-05	51	3	\N	2017-10-27 13:28:59.184-04	\N	\N	\N	\N	\N	\N	1	\N	3563	\N	94559c97-e2cf-43bd-8354-177d46a08b30	\N	857	93b2bb9b-023d-494d-940d-54577b2f5967
10676	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 14:48:39.526-05	2016-12-23 14:48:39.685-05	51	3	\N	2017-10-27 13:28:59.188-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	76c6b3d6-5c48-45ab-b494-b7933e6867fe	\N	857	93bd1c45-bcff-4b38-9586-c05972dd2951
10808	DEBIT	Network budget pre Open Collective	-6264	USD	2016-10-04 18:51:25.324-04	2016-10-04 18:51:26.129-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6264	-6264	\N	5100c3c7-da1c-4c4a-a275-c00dc797890e	260	857	a06d642d-560f-4866-a6b8-34293b0cd740
10697	CREDIT	Global Development for Meetup fee	6000	USD	2016-12-21 13:49:53.054-05	2016-12-21 13:49:53.302-05	51	3	\N	2017-10-27 13:28:59.429-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	1f656a66-4fbf-4c28-ab30-6025393bb97f	\N	857	a1b031bb-1d5b-4917-a0ca-dd787ee7e2aa
10670	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 11:27:36.9-05	2016-12-28 11:27:33.309-05	51	3	\N	2017-10-27 13:28:59.535-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	8dc9ae5f-32b6-41df-982b-459477202ddb	\N	857	b7ac20db-aa13-451a-a52b-4a243297476c
10677	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-28 11:27:36.9-05	2016-12-28 11:27:33.309-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	6f3172be-e3cb-4101-bce0-c53090455ab0	292	857	b7ac20db-aa13-451a-a52b-4a243297476c
10660	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:22:09.234-05	2016-12-27 11:22:09.351-05	51	3	\N	2017-10-27 13:28:59.686-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	76c49350-e5ec-4e19-9299-ee9d62410fd8	\N	857	be19864f-9599-4c02-80d3-b8ac4baf039f
10667	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:22:09.234-05	2016-12-27 11:22:09.351-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	7fcf3ba4-8e89-4c54-8f7d-a2c2efa37da0	13	857	be19864f-9599-4c02-80d3-b8ac4baf039f
10834	CREDIT	Donation: Syema Ailia	2500	USD	2016-10-04 11:47:46.468-04	2016-10-04 11:47:46.624-04	51	3	\N	2017-10-27 13:28:59.769-04	\N	\N	\N	\N	\N	\N	1	\N	2500	\N	2c659188-66e8-4d05-aede-68e4363dffe7	\N	857	c77f49a7-d5f2-4e25-aed8-d30b546ea8db
10842	DEBIT	Donation: Syema Ailia	-2500	USD	2016-10-04 11:47:46.468-04	2016-10-04 11:47:46.624-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2500	-2500	\N	8117caed-5b2a-4fb3-a41e-f7e97d5a69bd	12	857	c77f49a7-d5f2-4e25-aed8-d30b546ea8db
10700	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:51:47.92-05	2016-12-27 14:51:48.117-05	51	3	\N	2017-10-27 13:29:00.076-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	6e0056b7-439f-493c-91c7-875d02c80bcc	\N	857	d547134d-ef04-44bc-a8bc-3c3d6884beac
10802	DEBIT	Conference stipend Heidi H.	-50000	USD	2016-10-11 11:59:30.363-04	2016-10-11 11:59:31.524-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	5b762efe-8d3c-4cc3-ab9c-fda01074de17	195	857	d596365a-de4d-45e7-94f2-d616039b6423
10705	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:48:41.246-05	2016-12-27 14:48:41.318-05	51	3	\N	2017-10-27 13:29:00.105-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	ba461046-b9b3-48ce-b882-079babb4bdc0	\N	857	d991f442-b419-4cbf-9006-16a9bd34586a
10871	CREDIT	Andrea S	1500	USD	2016-04-27 16:05:44.711-04	2016-04-27 16:05:44.974-04	51	3	\N	2017-10-27 13:29:00.148-04	\N	\N	\N	\N	\N	\N	1	\N	1500	\N	7cb4a069-2064-4a57-a8c1-41d9533431b4	\N	857	e27c1431-69ae-485f-96c2-d20d984f1fb8
10879	DEBIT	Andrea S	-1500	USD	2016-04-27 16:05:44.711-04	2016-04-27 16:05:44.974-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1500	-1500	\N	0a04a76c-d7f5-496d-8521-630dc60fbb89	48	857	e27c1431-69ae-485f-96c2-d20d984f1fb8
10851	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-21 13:49:47.667-05	2016-12-21 13:49:47.892-05	51	3	\N	2017-10-27 13:29:00.154-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	af84d62f-5700-4b57-adf9-2342e761a85a	\N	857	e2ee710e-c8fd-404e-ad2a-4caec9c5c0a7
10858	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-21 13:49:47.667-05	2016-12-21 13:49:47.892-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	44fe3483-1072-40b3-9934-627692be6fa5	2	857	e2ee710e-c8fd-404e-ad2a-4caec9c5c0a7
10786	CREDIT	Portland t-shirt proceeds	6915	USD	2016-11-17 13:01:32.1-05	2016-11-17 13:01:32.49-05	51	3	\N	2017-10-27 13:29:00.218-04	\N	\N	\N	\N	\N	\N	1	\N	6915	\N	d7742d66-8607-481e-b8d8-1d1a53cf4eb5	\N	857	eccb2174-0c76-4ba8-9c5f-cdf2b5acd47d
10791	DEBIT	Portland t-shirt proceeds	-6915	USD	2016-11-17 13:01:32.1-05	2016-11-17 13:01:32.49-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6915	-6915	\N	32eaf034-eae1-47f9-9b11-3c81ad8ca4ed	59	857	eccb2174-0c76-4ba8-9c5f-cdf2b5acd47d
10799	CREDIT	Donation from Adane	450	USD	2016-10-04 18:56:11.881-04	2016-10-04 18:56:13.02-04	51	3	\N	2017-10-27 13:29:00.283-04	\N	\N	\N	\N	\N	\N	1	\N	450	\N	e9214eae-25c7-4c0f-a22f-610ff9fed65c	\N	857	f7fed7d7-2c06-40f4-885c-e02fc3520158
10912	DEBIT	Recurring subscription	0	MXN	2016-03-15 16:05:22.15-04	2016-04-01 10:32:17.381-04	821	7	64	2016-04-07 10:32:17.381-04	\N	83	5	\N	\N	\N	1	0	-100	\N	1990ed4c-c37e-4c1d-988e-3120766621cf	10	857	b383b223-4b0a-4d01-be67-7ba945dd430a
10812	DEBIT	Recurring subscription	-52	USD	2016-04-02 15:27:54.641-04	2016-04-16 16:40:58.809-04	691	30	44	\N	\N	70	5	\N	33	USD	1	-52	-100	\N	193a8139-09e2-481f-84ba-5b9a720e68ef	13	857	23b8ff4b-c219-4ad0-a66e-530a683ce5e5
10829	DEBIT	Recurring subscription	-125	MXN	2016-03-02 13:06:23.743-05	2016-04-16 16:40:58.731-04	768	80	42	\N	\N	68	2	\N	16	USD	17.8570999999999991	-7	-500	\N	b6544ff7-b88e-4e0a-b872-b4a5b024bed2	10	857	c8af36fc-f899-4e50-b9bf-ce4e6cb0b8f5
10883	DEBIT	Network Development	-17750	USD	2016-10-11 15:17:21.991-04	2016-10-11 15:17:22.199-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-17750	-17750	\N	8b192203-75d7-4793-a12d-ffc029b2b3dc	279	857	095272ad-67ff-425d-86bc-50f14ec0836a
10895	DEBIT	Google I/O stipend	-75000	USD	2016-10-11 12:01:42.326-04	2016-10-11 12:01:43.286-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-75000	-75000	\N	d710fc73-6947-4c77-a3a6-57e9d9e93138	195	857	0c2b58db-6d38-4cb5-a8a4-d06599f357b0
10852	CREDIT	Donation Elizabeth B.	9000	USD	2016-10-11 20:22:08.455-04	2016-10-11 20:22:08.557-04	51	3	\N	2017-10-27 13:28:58.329-04	\N	\N	\N	\N	\N	\N	1	\N	9000	\N	002f8c76-a9a1-4a31-8788-1fc6e81384a7	\N	857	0cd1b7e3-2d44-4ee1-90eb-e051bdf1c108
10820	DEBIT	Leadership Development 	-14915	MXN	2017-03-07 07:55:53.128-05	2017-03-07 07:55:53.3-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-14915	-14915	\N	953ee012-3b59-417d-8d1e-ffde22ebad39	511	857	11ac33a6-84f1-42c6-a843-e2359ac1883a
10833	CREDIT	Reverse duplicate transaction	500	USD	2016-10-04 12:12:26.671-04	2016-10-04 12:12:26.903-04	51	3	\N	2017-10-27 13:28:58.365-04	\N	\N	\N	\N	\N	\N	1	\N	500	\N	b7f68030-f084-435d-b016-6c6a2ffed8a3	\N	857	121f58c1-61e9-4343-bf2d-29b54475a604
10840	DEBIT	Reverse duplicate transaction	-500	USD	2016-10-04 12:12:26.671-04	2016-10-04 12:12:26.903-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-500	-500	\N	a7f3f1a5-4deb-4fca-ad5f-9a02278e0b5c	12	857	121f58c1-61e9-4343-bf2d-29b54475a604
10899	DEBIT	WWCode t-shirt sales	-4397	USD	2017-01-17 22:20:52.226-05	2017-01-17 22:20:52.436-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4397	-4397	\N	38a73679-e856-4129-9157-22463773cfd3	273	857	1f71ecee-d020-425b-9776-65a2bd98e372
10771	CREDIT	Donation from Cameron - fees and global development	4350	USD	2017-01-04 15:33:36.359-05	2017-01-04 15:33:37.475-05	51	3	\N	2017-10-27 13:28:58.485-04	\N	\N	\N	\N	\N	\N	1	\N	4350	\N	2c77d8e7-702a-4122-9c4f-08af16851805	\N	857	2720aa2d-b5a3-4d00-a8dd-0c5509695f02
10816	CREDIT	Google I/O scholarship	75000	USD	2016-10-06 13:21:27.384-04	2016-10-06 13:21:27.396-04	51	3	\N	2017-10-27 13:28:58.49-04	\N	\N	\N	\N	\N	\N	1	\N	75000	\N	12923839-8a17-480d-938e-03a13e8da2d9	\N	857	28af6a5b-7d95-42d1-9aa6-14187e5b5a4b
10707	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:44:22.123-05	2016-12-27 14:44:22.207-05	51	3	\N	2017-10-27 13:28:58.494-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	fa65e763-446e-487e-bb87-6535800ff515	\N	857	2a4c3f6b-2157-49fd-a6d5-1d84a48fb5a9
10712	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 14:44:22.123-05	2016-12-27 14:44:22.207-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	e540a87a-2aa2-4322-943f-e1f6c234bee9	287	857	2a4c3f6b-2157-49fd-a6d5-1d84a48fb5a9
10856	DEBIT	Generous donation from Target to support WWCode Twin Cities	-500000	USD	2016-05-26 14:37:24.922-04	2016-05-26 14:37:23.286-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-500000	-500000	\N	dc78b426-7c7a-4204-875a-53abaeee8454	48	857	3ac82e78-cb84-4406-a84a-d9f44cad52e0
10767	CREDIT	$1000 CDK Global event support - transaction and global development	87000	USD	2016-11-17 13:18:40.107-05	2016-11-17 13:18:40.436-05	51	3	\N	2017-10-27 13:28:58.642-04	\N	\N	\N	\N	\N	\N	1	\N	87000	\N	cbd77eb1-8554-45a7-8d50-4600c74eed3f	\N	857	3e8c842c-24c5-40b4-b3e2-db4a8a5a23a0
10696	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:45:15.022-05	2016-12-23 11:45:15.147-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	d82f96c7-aad3-42d9-8eb1-830f4eb581b7	261	857	451dc3be-ec3d-4788-a883-aa45be30f5cb
10878	DEBIT	Donation from Biotti	-403	USD	2016-10-11 15:32:58.956-04	2016-10-11 15:32:59.265-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-403	-403	\N	b5f520cc-e9d4-4269-a912-ca3f3ee81ecf	301	857	45494226-1649-4545-a1be-7bde656578b0
10775	CREDIT	Women Techmaker WWCode Partnership Grant	15000	USD	2016-05-24 16:12:34.913-04	2016-05-24 16:12:35.226-04	51	3	\N	2017-10-27 13:28:58.719-04	\N	\N	\N	\N	\N	\N	1	\N	15000	\N	40a8dba9-8094-49a6-8d19-9b7dc600c9aa	\N	857	520eed32-5b1d-43d3-9d3d-f6c5cc6d4549
10784	DEBIT	Women Techmaker WWCode Partnership Grant	-15000	USD	2016-05-24 16:12:34.913-04	2016-05-24 16:12:35.226-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-15000	-15000	\N	b418b380-ae84-4539-ace9-b8453b802d89	13	857	520eed32-5b1d-43d3-9d3d-f6c5cc6d4549
10692	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-23 11:50:35.869-05	2016-12-23 11:50:36.131-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	7d4c02ee-53dd-4922-abbf-fcf7eb288ff4	12	857	55d4421e-43b3-4607-b487-9ff452df69b2
10849	DEBIT	Proceeds from teespring	-10022	USD	2016-05-26 14:38:50.077-04	2016-05-26 14:38:48.41-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10022	-10022	\N	8e6b8374-f8f6-4b76-bb25-bbdef893b05c	48	857	62c79544-bd61-4358-a843-ebecfecf19c1
10892	CREDIT	WWCode t-shirt sales	1599	USD	2017-01-17 22:21:50.791-05	2017-01-17 22:21:50.964-05	51	3	\N	2017-10-27 13:28:58.961-04	\N	\N	\N	\N	\N	\N	1	\N	1599	\N	ecb4266b-7f11-431b-871e-490899172f2a	\N	857	72878535-0361-4ee6-a729-c335c77036ce
10751	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 17:11:37.922-05	2016-11-29 17:11:38.131-05	51	3	\N	2017-10-27 13:28:59.032-04	\N	\N	\N	\N	\N	\N	1	\N	450	\N	8ea83d0e-d832-4c84-9d91-fbd02fe6bcd6	\N	857	78fa1bf5-7a0f-459b-a369-f51fe376e88d
10759	DEBIT	Erica S. donation - fees	-450	USD	2016-11-29 17:11:37.922-05	2016-11-29 17:11:38.131-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-450	-450	\N	3e148017-e7de-437d-8385-25dee3b8d802	287	857	78fa1bf5-7a0f-459b-a369-f51fe376e88d
10917	DEBIT	Priyanka - IOT Hackathon donation - fees and global development 	-2175	USD	2016-12-13 15:08:29.218-05	2016-12-13 15:08:29.464-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2175	-2175	\N	4ddf0068-8f3d-4d2a-97b1-38df34ba848f	59	857	7e743389-1069-45cf-a07b-b73a5fcfbb57
10764	DEBIT	$3500 Course Hero Hackathon support - transaction & global development	-304500	USD	2016-11-17 13:27:12.528-05	2016-11-17 13:27:12.742-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-304500	-304500	\N	2a5510ac-186a-4ce3-bde0-470c77b6bbc9	59	857	871f41d2-abc6-4179-9fd8-be6c030eab56
10698	CREDIT	\N	20000	USD	2017-04-07 08:25:51.09-04	2017-04-07 08:25:51.09-04	51	3	\N	2017-10-27 13:28:59.124-04	\N	2393	\N	\N	\N	USD	1	20000	20000	\N	b5b335ec-a2e0-4dea-819f-d188db4a1d10	\N	857	88c4f410-8bfe-4e58-8026-2ca1fb354835
10836	CREDIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	320247	USD	2016-06-29 14:42:31.848-04	2016-06-29 14:42:32.517-04	51	3	\N	2017-10-27 13:28:59.434-04	\N	\N	\N	\N	\N	\N	1	\N	320247	\N	3d2c908a-3da7-441c-959b-8dfaba8c5bca	\N	857	a27bbf56-ae64-405f-b928-f3af18211692
10845	DEBIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	-320247	USD	2016-06-29 14:42:31.848-04	2016-06-29 14:42:32.517-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-320247	-320247	\N	4910ae8e-9c47-4ce6-8858-a2734962156b	15	857	a27bbf56-ae64-405f-b928-f3af18211692
10824	DEBIT	Network Development	-20000	USD	2016-10-11 12:02:18.108-04	2016-10-11 12:02:19.138-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	a5803de0-e69a-4ea9-8a41-6ee7ea2a2d4c	195	857	a8018c09-95aa-4442-9002-b21fc4be572c
10867	DEBIT	Network Development	-15400	USD	2016-10-04 18:39:26.796-04	2016-10-04 18:39:26.9-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-15400	-15400	\N	25428a83-3189-4bc7-81e9-b011aa28dde2	273	857	a8ef5a8c-6c19-456e-afb5-6dcb5304d4a5
10731	CREDIT	Donation via meetup	775	USD	2016-11-29 18:39:42.382-05	2016-11-29 18:39:42.512-05	51	3	\N	2017-10-27 13:28:59.482-04	\N	\N	\N	\N	\N	\N	1	\N	775	\N	e4e0c412-a009-439e-8e66-8a6f047177d4	\N	857	a9e7ca7a-e51c-4f87-97b4-b9579a431412
10869	CREDIT	Network Development	17500	USD	2016-10-11 15:35:59.115-04	2016-10-11 15:35:59.305-04	51	3	\N	2017-10-27 13:28:59.62-04	\N	\N	\N	\N	\N	\N	1	\N	17500	\N	a0778cf4-49b0-4454-83ff-55e371b9ee35	\N	857	bb0b3578-a969-48a8-bde5-7443369002d8
10875	DEBIT	Network Development	-17500	USD	2016-10-11 15:35:59.115-04	2016-10-11 15:35:59.305-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-17500	-17500	\N	e95a0981-01c7-49fa-b1dc-87b34d51cfcb	301	857	bb0b3578-a969-48a8-bde5-7443369002d8
10739	DEBIT	Network Development	-20000	USD	2016-11-29 19:23:24.87-05	2016-11-29 19:23:24.511-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	7185bfe9-90f4-4176-970e-e8952629430f	285	857	c9d4f0b4-e520-4150-bf7b-4e8431596f17
10796	CREDIT	Network Development	13286	USD	2016-10-04 18:57:17.136-04	2016-10-04 18:57:17.293-04	51	3	\N	2017-10-27 13:28:59.801-04	\N	\N	\N	\N	\N	\N	1	\N	13286	\N	05e3bf33-6784-41fa-9ee0-1951af32f80f	\N	857	cb33d7f6-8dad-497e-a95d-a75af939d81c
10805	DEBIT	Network Development	-13286	USD	2016-10-04 18:57:17.136-04	2016-10-04 18:57:17.293-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-13286	-13286	\N	8b8050e9-66c9-462e-9b38-5405146db5aa	260	857	cb33d7f6-8dad-497e-a95d-a75af939d81c
10737	CREDIT	Network Development	2500	USD	2016-11-29 17:29:22.958-05	2016-11-29 17:29:23.167-05	51	3	\N	2017-10-27 13:28:59.86-04	\N	\N	\N	\N	\N	\N	1	\N	2500	\N	0198a196-af4e-4ccb-941f-214b1e8e4c94	\N	857	d037ada2-5bbf-4688-a266-f9f0c787e001
10744	DEBIT	Network Development	-2500	USD	2016-11-29 17:29:22.958-05	2016-11-29 17:29:23.167-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2500	-2500	\N	a980b306-5b0d-4be0-8001-c82aaaa0bf0c	282	857	d037ada2-5bbf-4688-a266-f9f0c787e001
10861	DEBIT	Network Development (Thanks Zendesk)	-16129	USD	2016-10-11 16:26:22.964-04	2016-10-11 16:26:23.172-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-16129	-16129	\N	0b6dec1f-a9b2-492e-8baf-2802ac87aca7	298	857	eea8e7d2-ec82-4b76-88a3-2f1810236d0c
10792	CREDIT	Network Development	18200	USD	2016-10-11 13:02:51.621-04	2016-10-11 13:02:51.839-04	51	3	\N	2017-10-27 13:29:00.248-04	\N	\N	\N	\N	\N	\N	1	\N	18200	\N	e7bacdc4-0d88-48c6-93d4-096bf40c98fa	\N	857	f532f112-4dc3-4293-b8eb-1e914c13f7d0
10800	DEBIT	Network Development	-18200	USD	2016-10-11 13:02:51.621-04	2016-10-11 13:02:51.839-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-18200	-18200	\N	2c99a49b-0f52-4718-a0c3-9d0b4eb03ec3	291	857	f532f112-4dc3-4293-b8eb-1e914c13f7d0
10716	CREDIT	WTM Google I/O Travel Stipend	50000	USD	2017-03-17 10:09:18.868-04	2017-03-17 10:09:18.344-04	51	3	\N	2017-10-27 13:29:00.265-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	8281a967-8f6c-4cb7-ad7a-ebf596be8d25	\N	857	f6248499-4b09-4006-9daa-fbf2a872451d
10722	DEBIT	WTM Google I/O Travel Stipend	-50000	USD	2017-03-17 10:09:18.868-04	2017-03-17 10:09:18.344-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	e209ed58-321b-44b6-8c08-59bc3186882f	195	857	f6248499-4b09-4006-9daa-fbf2a872451d
10814	DEBIT	Donation to WWCode Austin	-26100	USD	2016-03-02 16:31:50.516-05	2016-04-16 16:40:58.67-04	689	129	94	\N	\N	25	0	\N	900	USD	1	-26100	-30000	\N	9dc4c652-a54f-4894-a566-a7dbc50a4e8c	2	857	f10c89c6-78c1-48c0-b553-f9e2996684a1
10896	DEBIT	Donation to WWCode Atlanta	-891	USD	2016-01-29 17:23:53.315-05	2016-04-16 16:40:58.701-04	691	30	39	\N	\N	13	0	\N	59	USD	1	-891	-1000	\N	c2745002-3be9-4ca8-ae28-272d6bce8de9	12	857	a241159e-94b3-4338-a3cc-fe61d56e23bc
10910	DEBIT	\N	-136	USD	2017-04-30 21:40:30.232-04	2017-04-30 21:40:30.232-04	841	3419	2749	\N	\N	2636	10	\N	34	USD	1	-136	-200	\N	dfb22fed-1c7b-4cf3-870b-49717003bd41	516	857	30b2673f-24fa-4fa0-b262-c391f3f0c9ec
10713	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:52:05.93-05	2016-12-27 11:52:06.061-05	51	3	\N	2017-10-27 13:28:58.343-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	40479636-6ba8-48cb-9428-52e872d1b2a2	\N	857	0d8e9c8f-020e-4f5b-a9e1-353782611c4f
10778	DEBIT	Donation from Cameron - fees and global development	-4350	USD	2017-01-04 15:33:36.359-05	2017-01-04 15:33:37.475-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4350	-4350	\N	ef263538-8041-4f8d-b36f-48216f082f1d	259	857	2720aa2d-b5a3-4d00-a8dd-0c5509695f02
10822	DEBIT	Google I/O scholarship	-75000	USD	2016-10-06 13:21:27.384-04	2016-10-06 13:21:27.396-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-75000	-75000	\N	ba2aff08-c9dc-4bba-b93b-dd3e07d6f26c	13	857	28af6a5b-7d95-42d1-9aa6-14187e5b5a4b
10789	CREDIT	Director t-shirt	2898	USD	2016-10-17 16:57:08.514-04	2016-10-17 16:57:08.533-04	51	3	\N	2017-10-27 13:28:58.519-04	\N	\N	\N	\N	\N	\N	1	\N	2898	\N	03df85ea-8c00-4bf7-9f3e-48a48e828a76	\N	857	2ec26257-80f2-48bd-bc48-23996e0abd99
10797	DEBIT	Director t-shirt	-2898	USD	2016-10-17 16:57:08.514-04	2016-10-17 16:57:08.533-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2898	-2898	\N	0bb73d41-ca96-4ffc-b0ce-ece3c2e7069d	3	857	2ec26257-80f2-48bd-bc48-23996e0abd99
10868	DEBIT	Donation Hannah B.	-9000	USD	2016-10-04 18:35:46.967-04	2016-10-04 18:35:47.153-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-9000	-9000	\N	29724dff-d0e7-419b-af9d-b15ee9324cf6	273	857	559baeb7-84b8-4669-ab17-77bb082ae6ee
10717	CREDIT	Global Development - Thanks VMWare	50000	USD	2016-11-30 16:34:00.324-05	2016-11-30 16:34:01.658-05	51	3	\N	2017-10-27 13:28:58.756-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	9efe541e-5ef7-4805-a335-c0fa97550eb9	\N	857	59147961-7892-4f21-9a4a-38a711f0eb8b
10725	DEBIT	Global Development - Thanks VMWare	-50000	USD	2016-11-30 16:34:00.324-05	2016-11-30 16:34:01.658-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	950e6a1b-951b-453c-b65b-b5da796af74c	263	857	59147961-7892-4f21-9a4a-38a711f0eb8b
10738	DEBIT	Donation via Meetup	-775	USD	2016-11-29 18:39:08.069-05	2016-11-29 18:39:08.263-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-775	-775	\N	2ce6bb68-aa8a-463e-84e9-4c53b89a9383	300	857	607ba94b-1f62-4b27-916f-e4432a9b59cc
10846	CREDIT	Proceeds from teespring	10022	USD	2016-05-26 14:38:50.077-04	2016-05-26 14:38:48.41-04	51	3	\N	2017-10-27 13:28:58.806-04	\N	\N	\N	\N	\N	\N	1	\N	10022	\N	60e1c94e-07a9-4f6c-bb7b-047d8986cfb7	\N	857	62c79544-bd61-4358-a843-ebecfecf19c1
10906	DEBIT	Global Development for Meetup Fee	-6000	CAD	2016-12-28 11:29:31.983-05	2016-12-28 11:29:28.409-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	e387cb09-8190-48e1-8a67-a454cac7148f	293	857	6a766ac0-27e4-431e-b03e-8cd5c6bf3c08
10736	CREDIT	Banner	2000	USD	2016-11-29 17:34:22.96-05	2016-11-29 17:34:23.085-05	51	3	\N	2017-10-27 13:28:58.864-04	\N	\N	\N	\N	\N	\N	1	\N	2000	\N	f68f9fb6-e663-4c41-97cd-1a4b45f20c8b	\N	857	6d5e14b4-683d-41e7-8b51-8039dfab5311
10743	DEBIT	Banner	-2000	USD	2016-11-29 17:34:22.96-05	2016-11-29 17:34:23.085-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2000	-2000	\N	be28cf7c-a5da-4d3d-b3da-751df4ba8345	47	857	6d5e14b4-683d-41e7-8b51-8039dfab5311
10885	CREDIT	From:\tThao Le	1500	USD	2016-04-12 14:49:06.645-04	2016-04-16 16:40:58.815-04	51	3	\N	2017-10-27 13:28:58.932-04	\N	\N	\N	\N	\N	\N	1	\N	1500	\N	65ebac26-5587-4a0e-84fd-04f62b7c4bde	\N	857	6de2a79b-faa8-43a5-95d6-87797acffd04
10776	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 11:34:45.59-05	2016-12-27 11:34:45.771-05	51	3	\N	2017-10-27 13:28:58.97-04	\N	\N	\N	\N	\N	\N	1	\N	5700	\N	a5d9471f-c50d-425c-9cf4-9264a0692fd5	\N	857	73dd0d17-d17d-4787-81f5-649e715262f9
10782	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-27 11:34:45.59-05	2016-12-27 11:34:45.771-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-5700	-5700	\N	e2baf4d0-7c5d-4937-8f80-37efb6abe7ef	298	857	73dd0d17-d17d-4787-81f5-649e715262f9
10714	CREDIT	Global Development	80000	GBP	2016-11-29 16:14:00.118-05	2016-11-29 16:14:01.107-05	51	3	\N	2017-10-27 13:28:58.989-04	\N	\N	\N	\N	\N	\N	1	\N	80000	\N	5dbf3bec-a6b5-4c41-a5d5-91b3aaaf21e6	\N	857	74c0aa04-aa06-4efa-bfc3-83d44a7e132b
10721	DEBIT	Global Development	-80000	GBP	2016-11-29 16:14:00.118-05	2016-11-29 16:14:01.107-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-80000	-80000	\N	70abac3c-0044-4b83-bd3c-19ec95fbc99c	278	857	74c0aa04-aa06-4efa-bfc3-83d44a7e132b
10866	CREDIT	Donation Ailia S.	9000	USD	2016-10-11 15:44:42.807-04	2016-10-11 15:44:43.161-04	51	3	\N	2017-10-27 13:28:59.003-04	\N	\N	\N	\N	\N	\N	1	\N	9000	\N	4f5251fb-eee4-45e5-9df5-ebc439675158	\N	857	75a7b386-f301-4046-9824-1efa61edc805
10870	DEBIT	Donation Ailia S.	-9000	USD	2016-10-11 15:44:42.807-04	2016-10-11 15:44:43.161-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-9000	-9000	\N	913a0a1a-5e36-4d2f-ac22-49369bca8f43	270	857	75a7b386-f301-4046-9824-1efa61edc805
10750	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 17:12:36.336-05	2016-11-29 17:12:36.503-05	51	3	\N	2017-10-27 13:28:59.116-04	\N	\N	\N	\N	\N	\N	1	\N	450	\N	6a35a6b6-6d34-4357-aab8-4573b797cc00	\N	857	85d375fb-3ba1-4b4f-a808-2b2d59899a7e
10758	DEBIT	Erica S. donation - fees	-450	USD	2016-11-29 17:12:36.336-05	2016-11-29 17:12:36.503-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-450	-450	\N	afd27b2c-9a3d-4c83-9f7b-93eb91df85a8	287	857	85d375fb-3ba1-4b4f-a808-2b2d59899a7e
10706	DEBIT	\N	-20000	USD	2017-04-07 08:25:51.09-04	2017-04-07 08:25:51.09-04	857	3	\N	\N	\N	2393	0	\N	0	USD	1	-20000	-20000	\N	d6d9a2e3-56ba-4278-a199-129d0184c5a1	516	857	88c4f410-8bfe-4e58-8026-2ca1fb354835
10685	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 11:54:04.928-05	2016-12-23 11:54:05.055-05	51	3	\N	2017-10-27 13:28:59.148-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	e9a02049-cef0-4401-8e38-7f4019fe32f9	\N	857	8eafd7ac-0326-4375-b9bb-7b4d72fee84e
10691	DEBIT	Global Development for Meetup Fees	-6000	USD	2016-12-23 11:54:04.928-05	2016-12-23 11:54:05.055-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	4d6a90bd-3769-4cdd-b4f0-11929b26ba29	262	857	8eafd7ac-0326-4375-b9bb-7b4d72fee84e
10702	DEBIT	Travel Stipend for Google I/O	-100000	USD	2017-03-20 11:17:43.622-04	2017-03-20 11:17:42.994-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-100000	-100000	\N	1562f563-8854-440d-ad8f-98d95653f401	277	857	935ff7a1-0a2a-4fe9-9670-05d520f51f19
10810	DEBIT	WWCode t-shirt sales	-3563	USD	2017-01-17 22:28:29.874-05	2017-01-17 22:28:30.096-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3563	-3563	\N	15d81003-651f-4022-96c5-e912dfddb1df	290	857	93b2bb9b-023d-494d-940d-54577b2f5967
10704	DEBIT	Global Development for Meetup fee	-6000	USD	2016-12-21 13:49:53.054-05	2016-12-21 13:49:53.302-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	0f3a0635-70d6-439b-8ab3-e9e5ccf1ea75	3	857	a1b031bb-1d5b-4917-a0ca-dd787ee7e2aa
10755	CREDIT	International Women's Day Atlanta	10350	USD	2017-03-28 14:28:28.77-04	2017-03-28 14:28:28.938-04	51	3	\N	2017-10-27 13:28:59.496-04	\N	\N	\N	\N	\N	\N	1	\N	10350	\N	0a4cc943-d382-4c78-aaf4-c4bad0281658	\N	857	b084d0b4-2fed-45c7-bde5-7502b3646e2d
10763	DEBIT	International Women's Day Atlanta	0	USD	2017-03-28 14:28:28.77-04	2017-03-28 14:28:28.938-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	0	-10350	\N	b4774655-99d4-4607-a36f-430310fd8919	51	857	b084d0b4-2fed-45c7-bde5-7502b3646e2d
10793	CREDIT	Donation Scott Z. in honor of his sister	1800	USD	2016-10-11 13:01:23.313-04	2016-10-11 13:01:23.731-04	51	3	\N	2017-10-27 13:28:59.626-04	\N	\N	\N	\N	\N	\N	1	\N	1800	\N	500f2681-3698-4663-94be-490599e7cae9	\N	857	bb6b0447-91d5-4532-81ce-05f6c74f6d56
10693	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:32:00.456-05	2016-12-23 11:32:00.622-05	51	3	\N	2017-10-27 13:28:59.756-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	8d545540-2342-4641-aa39-9e32962b1e5d	\N	857	c5f0174f-3e89-4902-ac37-0cd75245245d
10701	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:32:00.456-05	2016-12-23 11:32:00.622-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	42004f69-e8c3-4c53-954a-667464ae412b	260	857	c5f0174f-3e89-4902-ac37-0cd75245245d
10730	CREDIT	Network Development	20000	USD	2016-11-29 19:23:24.87-05	2016-11-29 19:23:24.511-05	51	3	\N	2017-10-27 13:28:59.795-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	114acaa9-d734-45b3-8350-728e04e61ba5	\N	857	c9d4f0b4-e520-4150-bf7b-4e8431596f17
10887	DEBIT	From Deepa	-1500	USD	2016-04-12 17:18:56.547-04	2016-04-16 16:40:58.847-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1500	-1500	\N	ed4c5c8e-d02b-4f0f-b020-80099cd37843	4	857	d8c00eb0-c2f9-42c2-9bc7-4cb50efcfef3
10710	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 14:48:41.246-05	2016-12-27 14:48:41.318-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	c717a8c3-68e5-408b-89ec-b90c57ab45de	288	857	d991f442-b419-4cbf-9006-16a9bd34586a
10901	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 11:31:33.43-05	2016-12-28 11:31:29.837-05	51	3	\N	2017-10-27 13:29:00.163-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	a7db3925-b72e-47c2-bd99-4d3b30c4c395	\N	857	e36e005e-4d76-4c2d-80ca-658821ed1a07
10904	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 12:55:42.091-05	2016-12-23 12:55:42.249-05	51	3	\N	2017-10-27 13:29:00.204-04	\N	\N	\N	\N	\N	\N	1	\N	4900	\N	c15f98d2-b9be-40f4-b006-2cc2cc93333a	\N	857	eaaf02c5-02c3-4c01-ac05-1f799ffadd67
10873	CREDIT	Network development - thanks Atlassian	50000	USD	2016-10-11 15:30:14.934-04	2016-10-11 15:30:15.155-04	51	3	\N	2017-10-27 13:29:00.214-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	0243b000-8bba-400d-b240-00604552481f	\N	857	ec5117fb-9e9d-453e-b049-f3afb90e6584
10882	DEBIT	Network development - thanks Atlassian	-50000	USD	2016-10-11 15:30:14.934-04	2016-10-11 15:30:15.155-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	90841009-e285-49b1-80bb-ea0e1755512f	297	857	ec5117fb-9e9d-453e-b049-f3afb90e6584
10818	DEBIT	Leadership Development	-50616	MXN	2017-03-07 08:01:15.044-05	2017-03-07 08:01:15.192-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50616	-50616	\N	ba5b0ef6-8f4d-4282-91e2-9b0c0e9335ab	282	857	f745a867-5d9b-4f93-8846-9e1969d89fe4
10832	CREDIT	Donations made via Meetup as of Jan 2016, less transaction fees	9212	USD	2016-10-04 11:46:17.845-04	2016-10-04 11:46:18.02-04	51	3	\N	2017-10-27 13:29:00.543-04	\N	\N	\N	\N	\N	\N	1	\N	9212	\N	5c2d4b34-89a1-460b-bc52-222071306e39	\N	857	fdb813c1-987a-49e0-85c9-1a6d0dd52368
10841	DEBIT	Donations made via Meetup as of Jan 2016, less transaction fees	-9212	USD	2016-10-04 11:46:17.845-04	2016-10-04 11:46:18.02-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-9212	-9212	\N	f8cb950e-3902-4faf-85c2-ebf4789dce9e	12	857	fdb813c1-987a-49e0-85c9-1a6d0dd52368
10718	DEBIT	\N	-16300	USD	2017-04-04 15:51:04.916-04	2017-04-04 15:51:04.916-04	836	3999	2438	\N	\N	2332	1000	\N	700	USD	1	-16300	-20000	\N	81f1640f-e5a4-4a3a-a5c4-1d71c1e61bc1	2	857	29a35294-dc8a-453d-a5a0-dd365f89fdf3
10813	DEBIT	Recurring subscription	-52	USD	2016-03-02 13:19:33.362-05	2016-04-16 16:40:58.737-04	691	30	43	\N	\N	69	5	\N	33	USD	1	-52	-100	\N	3fca9188-2520-4606-a465-c2785f93e31d	13	857	e9c1f464-5e05-49f3-96de-18f46a489ee8
10826	DEBIT	Donation to WWCode Washington DC	-41020	USD	2016-04-29 09:51:19.1-04	2016-04-29 09:51:19.15-04	808	303	216	\N	\N	183	2500	\N	1480	USD	1	-41020	-50000	\N	cf0035a5-c952-4fd6-8dd1-20a1af36a9c1	13	857	2055fc58-9a98-45c2-841c-4dab7d4b18ba
10897	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-02-02 12:09:22.069-05	2016-04-16 16:40:58.697-04	691	30	44	\N	\N	70	5	\N	33	USD	1	-52	-100	\N	53c7017e-d7b6-4c9f-ae56-5346503bcdf7	13	857	a3438076-9ed5-4045-b8cb-42c40e37de0e
10724	DEBIT	Donation to WWCode Mexico City	-148	MXN	2016-02-02 11:52:02.237-05	2016-04-16 16:40:58.703-04	768	80	42	\N	\N	68	1	\N	16	USD	18.5100000000000016	-8	-500	\N	97bcf53d-6707-48ee-9698-e2e12cea44e6	10	857	190fa916-43fa-41aa-8b67-b66e907a5e6c
10787	DEBIT	Women Techmaker WWCode Partnership Grant	-20000	USD	2016-05-25 12:45:53.797-04	2016-05-25 12:45:54.045-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	2060b375-2b54-41d1-91d2-41e85de90658	48	857	0519e087-2ca2-4e5a-a02e-e4e565ec392e
10719	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:52:05.93-05	2016-12-27 11:52:06.061-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	7ad3986a-7342-491d-8bcf-af09b0e1d5e8	274	857	0d8e9c8f-020e-4f5b-a9e1-353782611c4f
10803	DEBIT	Network Development (100%)	-10000	USD	2016-10-06 14:42:47.682-04	2016-10-06 14:42:47.71-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10000	-10000	\N	9177a163-039f-4cdc-8a86-c3d8266372e7	13	857	2ab7a7ac-6deb-47b9-97cd-0b84940bdcdf
10773	CREDIT	Donation - fees + global development	1187	USD	2017-01-05 09:58:39.771-05	2017-01-05 09:58:42.205-05	51	3	\N	2017-10-27 13:28:58.606-04	\N	\N	\N	\N	\N	\N	1	\N	1187	\N	6600cbd5-30ac-4d40-8c15-431c832fd26d	\N	857	39918b2b-100e-4a44-b2ee-78104ee215c0
10780	DEBIT	Donation - fees + global development	-1187	USD	2017-01-05 09:58:39.771-05	2017-01-05 09:58:42.205-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1187	-1187	\N	46eb043d-6d7a-4ac0-895e-9e7ebbc988fd	13	857	39918b2b-100e-4a44-b2ee-78104ee215c0
10850	CREDIT	Generous donation from Target to support WWCode Twin Cities	500000	USD	2016-05-26 14:37:24.922-04	2016-05-26 14:37:23.286-04	51	3	\N	2017-10-27 13:28:58.616-04	\N	\N	\N	\N	\N	\N	1	\N	500000	\N	1717a2c9-92ed-4f7b-a3ea-157770c3c22d	\N	857	3ac82e78-cb84-4406-a84a-d9f44cad52e0
10809	CREDIT	\N	150000	USD	2017-05-03 13:32:39.653-04	2017-05-03 13:32:39.653-04	51	3	\N	2017-10-27 13:28:58.651-04	\N	2693	\N	\N	\N	USD	1	150000	150000	\N	aad25bab-b917-4936-a720-b5a768c84181	\N	857	40590215-80dd-4031-af1b-7f52ea8d4e36
10817	DEBIT	\N	-150000	USD	2017-05-03 13:32:39.653-04	2017-05-03 13:32:39.653-04	857	3	\N	\N	\N	2693	0	\N	0	USD	1	-150000	-150000	\N	774aa5c7-1038-4231-ad78-bde9e119215f	12	857	40590215-80dd-4031-af1b-7f52ea8d4e36
10872	CREDIT	Donation from Biotti	403	USD	2016-10-11 15:32:58.956-04	2016-10-11 15:32:59.265-04	51	3	\N	2017-10-27 13:28:58.669-04	\N	\N	\N	\N	\N	\N	1	\N	403	\N	2a8eab40-044d-44ef-9e92-976092ad0812	\N	857	45494226-1649-4545-a1be-7bde656578b0
10862	CREDIT	Donation Hannah B.	9000	USD	2016-10-04 18:35:46.967-04	2016-10-04 18:35:47.153-04	51	3	\N	2017-10-27 13:28:58.742-04	\N	\N	\N	\N	\N	\N	1	\N	9000	\N	dd9f80a5-6f1c-4433-9a00-8646e6704b70	\N	857	559baeb7-84b8-4669-ab17-77bb082ae6ee
10785	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:53:55.856-05	2016-12-27 11:53:55.969-05	51	3	\N	2017-10-27 13:28:58.777-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	ac651686-b426-42f2-9526-0e8a0c8c25ad	\N	857	5b53f78e-44c9-42c2-b5f0-a80de96e94a4
10788	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:53:55.856-05	2016-12-27 11:53:55.969-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	6ae4676d-0378-48a2-a4cf-ab7336a798d5	275	857	5b53f78e-44c9-42c2-b5f0-a80de96e94a4
10732	CREDIT	Donation via Meetup	775	USD	2016-11-29 18:39:08.069-05	2016-11-29 18:39:08.263-05	51	3	\N	2017-10-27 13:28:58.786-04	\N	\N	\N	\N	\N	\N	1	\N	775	\N	f0cf80a4-3f4f-44f7-ad82-998d51148798	\N	857	607ba94b-1f62-4b27-916f-e4432a9b59cc
10888	DEBIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	-2250	USD	2016-04-06 14:17:07.204-04	2016-04-16 16:40:58.818-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2250	-2250	\N	f4c24f01-66ce-4c6a-bb49-3d30f4186bc4	48	857	6a13fe4a-3baf-4a57-bdd7-ea3fca6b0852
10902	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 11:29:31.983-05	2016-12-28 11:29:28.409-05	51	3	\N	2017-10-27 13:28:58.85-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	2cd23877-c04e-4be4-94eb-e503e95fb05c	\N	857	6a766ac0-27e4-431e-b03e-8cd5c6bf3c08
10843	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 11:10:30.416-05	2016-12-27 11:10:30.529-05	51	3	\N	2017-10-27 13:28:58.855-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	9235926d-bf6d-47a4-aed2-86edc7a13f61	\N	857	6bf4cef5-a11b-4a38-8059-07b90affbbe2
10848	DEBIT	Global Development for Meetup Fee	-6000	MXN	2016-12-27 11:10:30.416-05	2016-12-27 11:10:30.529-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	525e8a07-1635-4e69-879b-9d0bff1f9ea3	299	857	6bf4cef5-a11b-4a38-8059-07b90affbbe2
10747	CREDIT	Global Development	19100	USD	2016-11-29 17:17:18.389-05	2016-11-29 17:17:18.558-05	51	3	\N	2017-10-27 13:28:58.921-04	\N	\N	\N	\N	\N	\N	1	\N	19100	\N	b310be79-bb5b-41a1-bcce-408ec2740684	\N	857	6d80e417-4f90-4164-8f2d-8b8affbe3bd8
10749	DEBIT	Global Development	-19100	USD	2016-11-29 17:17:18.389-05	2016-11-29 17:17:18.558-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-19100	-19100	\N	4be8da74-7888-400c-a649-592d02bd9f88	287	857	6d80e417-4f90-4164-8f2d-8b8affbe3bd8
10699	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:54:51.439-05	2016-12-27 14:54:51.679-05	51	3	\N	2017-10-27 13:28:59.018-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	ee0be19a-36c9-49c7-963f-929c884ac11c	\N	857	77d95b00-160f-4992-a5e1-32d6a44ada62
10734	CREDIT	Global Development	20000	USD	2016-11-29 18:34:32.59-05	2016-11-29 18:34:32.817-05	51	3	\N	2017-10-27 13:28:59.059-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	673e9ece-7bd3-4f1e-9bf7-25ff6a599ed4	\N	857	8070413a-e7f7-4ee1-8592-ca952f9bf64a
10742	DEBIT	Global Development	-20000	USD	2016-11-29 18:34:32.59-05	2016-11-29 18:34:32.817-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	3f3e0885-effe-4778-b6a9-5144e45f54e4	259	857	8070413a-e7f7-4ee1-8592-ca952f9bf64a
10830	CREDIT	Network development	6000	USD	2016-10-06 12:01:48.321-04	2016-10-06 12:01:48.667-04	51	3	\N	2017-10-27 13:28:59.134-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	3d65c015-8697-45ae-9cd2-b2d7cf6586df	\N	857	8a3fb14c-9c99-4636-83ea-5500f9937b62
10837	DEBIT	Network development	-6000	USD	2016-10-06 12:01:48.321-04	2016-10-06 12:01:48.667-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	0f2d4853-b1b0-446f-b7d2-727397f19252	4	857	8a3fb14c-9c99-4636-83ea-5500f9937b62
10735	CREDIT	Regional Leadership Director Training 	13031	USD	2016-11-29 17:35:05.252-05	2016-11-29 17:35:05.379-05	51	3	\N	2017-10-27 13:28:59.458-04	\N	\N	\N	\N	\N	\N	1	\N	13031	\N	0d9764ed-8709-49c7-aefb-75cb7bc049ad	\N	857	a42243f3-6e31-48df-b5e2-f34ec28ce576
10740	DEBIT	Donation via meetup	-775	USD	2016-11-29 18:39:42.382-05	2016-11-29 18:39:42.512-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-775	-775	\N	48331023-0d30-49b3-b4bb-d7d43cee1a07	13	857	a9e7ca7a-e51c-4f87-97b4-b9579a431412
10857	CREDIT	Network support - thanks VMWare	200000	USD	2016-10-11 15:50:00.045-04	2016-10-11 15:50:00.312-04	51	3	\N	2017-10-27 13:28:59.506-04	\N	\N	\N	\N	\N	\N	1	\N	200000	\N	8010cdff-a0e5-4ff9-b815-164bb05e2d43	\N	857	b0f27dc8-0323-4fa8-8186-bea54af15350
10865	DEBIT	Network support - thanks VMWare	-200000	USD	2016-10-11 15:50:00.045-04	2016-10-11 15:50:00.312-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-200000	-200000	\N	ed9346af-a95f-4a35-93e6-3f72411ba33d	262	857	b0f27dc8-0323-4fa8-8186-bea54af15350
10754	CREDIT	Global Development	20000	USD	2016-11-29 16:56:45.442-05	2016-11-29 16:56:45.713-05	51	3	\N	2017-10-27 13:28:59.517-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	db19668b-5e42-429b-81bc-2d7c8db9dc07	\N	857	b14fff69-e67f-499d-ae33-f94fedcd88d0
10762	DEBIT	Global Development	-20000	USD	2016-11-29 16:56:45.442-05	2016-11-29 16:56:45.713-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	d5fe5e65-b27b-4e05-9de3-921ede6ec8a0	290	857	b14fff69-e67f-499d-ae33-f94fedcd88d0
10884	DEBIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	-2250	USD	2016-10-11 15:13:57.013-04	2016-10-11 15:13:57.265-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2250	-2250	\N	3db4969e-05b9-4fbb-a358-f692f96b99fd	279	857	c8aa448b-6048-4e22-9ec6-394fe0ca61dd
10745	CREDIT	Network Budget Balance Pre Open Collective	17475	USD	2016-11-29 17:28:03.065-05	2016-11-29 17:28:03.231-05	51	3	\N	2017-10-27 13:28:59.831-04	\N	\N	\N	\N	\N	\N	1	\N	17475	\N	458a793c-8c7c-4b2a-a10a-04e73b1fc3e0	\N	857	cc6a02a6-6f9d-414a-b7ae-022a5e66326a
10709	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 14:51:47.92-05	2016-12-27 14:51:48.117-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	f7a2d1c2-d07a-4401-9b0a-9f28bc6b3e02	14	857	d547134d-ef04-44bc-a8bc-3c3d6884beac
10880	CREDIT	From Deepa	1500	USD	2016-04-12 17:18:56.547-04	2016-04-16 16:40:58.847-04	51	3	\N	2017-10-27 13:29:00.088-04	\N	\N	\N	\N	\N	\N	1	\N	1500	\N	b8e411c9-776f-4993-ba5b-1c8be7842224	\N	857	d8c00eb0-c2f9-42c2-9bc7-4cb50efcfef3
10727	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 16:25:31.161-05	2016-11-30 16:25:41.165-05	51	3	\N	2017-10-27 13:29:00.182-04	\N	\N	\N	\N	\N	\N	1	\N	75000	\N	fc2eed14-450e-43b9-afc0-455eb4c23a5b	\N	857	e5cb98a1-8dfc-410e-bb8f-2d47bab0470a
10729	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 16:25:31.161-05	2016-11-30 16:25:41.165-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-75000	-75000	\N	600f06ae-059d-470d-8fca-e07b8e84d59e	276	857	e5cb98a1-8dfc-410e-bb8f-2d47bab0470a
10908	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-23 12:55:42.091-05	2016-12-23 12:55:42.249-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4900	-4900	\N	198f7573-4187-493e-b0ee-94aefc9d5342	267	857	eaaf02c5-02c3-4c01-ac05-1f799ffadd67
10853	CREDIT	Network Development (Thanks Zendesk)	16129	USD	2016-10-11 16:26:22.964-04	2016-10-11 16:26:23.172-04	51	3	\N	2017-10-27 13:29:00.227-04	\N	\N	\N	\N	\N	\N	1	\N	16129	\N	981b192e-d7bf-4834-9067-5191f95a2a0f	\N	857	eea8e7d2-ec82-4b76-88a3-2f1810236d0c
10723	DEBIT	Network Development	-15755	GBP	2016-10-07 10:03:54.031-04	2016-10-07 10:03:54.119-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-15755	-15755	\N	fca00e8d-773b-4d5c-91c0-f523324ba54e	278	857	f48b2782-b4ca-4438-b2d8-1805cd8e4ef3
10914	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 12:24:55.371-05	2016-12-27 12:24:55.632-05	51	3	\N	2017-10-27 13:29:00.253-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	b9348078-fce1-425f-98f9-2227d000224e	\N	857	f58c2b80-cb9c-4954-9a09-9f1fe5003f80
10821	DEBIT	Recurring subscription	-52	USD	2016-03-02 18:01:26.771-05	2016-04-16 16:40:58.719-04	819	8	45	\N	\N	71	5	\N	33	USD	1	-52	-100	\N	fdc89fd1-499d-4c36-882f-42b2b0c6ae08	14	857	fa3dd559-dd4e-47b7-89b2-9cafe18ac145
10825	DEBIT	Donation to WWCode Austin	-26100	USD	2016-02-18 14:54:08.531-05	2016-04-16 16:40:58.717-04	813	108	71	\N	\N	15	0	\N	900	USD	1	-26100	-30000	\N	b809b2a2-05b8-4e54-9f06-3702bb2a81af	2	857	26a5cb03-8213-4cd8-aa79-2bf7b3469eda
10777	DEBIT	T-shirt payout	-1092	USD	2016-11-17 13:03:13.726-05	2016-11-17 13:03:13.862-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1092	-1092	\N	e1c7af7d-5518-4ad2-9068-ef8dfe059b2b	59	857	04f1fb7d-b4a1-4cf3-b39d-d47cf93a4cb7
10948	CREDIT	Network Development	20000	USD	2016-11-30 15:59:29.087-05	2016-11-30 15:59:29.921-05	51	3	\N	2017-10-27 13:28:58.304-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	239c6036-119c-47d7-9e2a-fea0b313a29c	\N	857	0a1d3464-686b-4ab0-9a07-197e212b50ee
10956	DEBIT	Network Development	-20000	USD	2016-11-30 15:59:29.087-05	2016-11-30 15:59:29.921-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	bf9b1339-0fd7-4f0b-9478-f47541aae844	280	857	0a1d3464-686b-4ab0-9a07-197e212b50ee
10766	DEBIT	$5000 Intel Hackathon support - global development	-450000	USD	2016-11-17 13:23:08.268-05	2016-11-17 13:23:08.461-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-450000	-450000	\N	513f2d5e-1f40-4507-a3ce-d2a3b2db385d	59	857	0c6381c5-5004-4187-95ca-8421b0984012
10815	CREDIT	Leadership Development 	14915	MXN	2017-03-07 07:55:53.128-05	2017-03-07 07:55:53.3-05	51	3	\N	2017-10-27 13:28:58.353-04	\N	\N	\N	\N	\N	\N	1	\N	14915	\N	b2e79655-68fa-40e3-988e-7c290ea55bf7	\N	857	11ac33a6-84f1-42c6-a843-e2359ac1883a
10893	CREDIT	WWCode t-shirt sales	4397	USD	2017-01-17 22:20:52.226-05	2017-01-17 22:20:52.436-05	51	3	\N	2017-10-27 13:28:58.446-04	\N	\N	\N	\N	\N	\N	1	\N	4397	\N	d41fcc08-6c8e-41bf-9582-6838bf5f05e2	\N	857	1f71ecee-d020-425b-9776-65a2bd98e372
10925	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 12:02:32.71-05	2016-12-27 12:02:32.843-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	18a5becc-388f-4662-b3d1-feb15c2f404c	277	857	34f02b63-de13-4314-a21f-5262d6ebbc76
10945	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 16:20:12.669-05	2016-11-30 16:20:16.148-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-7500	-7500	\N	fda64857-6e94-44aa-bf15-586e89d2eca8	269	857	3622870d-d8cd-403d-a195-bac0c7ac0e57
10772	CREDIT	donation - fees and global development	798	USD	2017-01-05 09:48:24.355-05	2017-01-05 09:48:26.734-05	51	3	\N	2017-10-27 13:28:58.601-04	\N	\N	\N	\N	\N	\N	1	\N	798	\N	ccd56782-736d-4f5f-8819-c4dd1d792f30	\N	857	378095d5-8633-4171-861e-be9957ab5196
10781	DEBIT	donation - fees and global development	-798	USD	2017-01-05 09:48:24.355-05	2017-01-05 09:48:26.734-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-798	-798	\N	49829b23-8bab-4f0c-8276-342197e804f8	241	857	378095d5-8633-4171-861e-be9957ab5196
10835	CREDIT	Donation: Beth Laing	5000	USD	2016-10-04 11:47:24.058-04	2016-10-04 11:47:24.175-04	51	3	\N	2017-10-27 13:28:58.737-04	\N	\N	\N	\N	\N	\N	1	\N	5000	\N	f48d3ce5-17bd-4586-88ec-1a931366f139	\N	857	5383d79e-5b48-4518-9a8a-7bf945be7fe4
10844	DEBIT	Donation: Beth Laing	-5000	USD	2016-10-04 11:47:24.058-04	2016-10-04 11:47:24.175-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-5000	-5000	\N	60831dcb-db28-4d13-8296-4a80b9374cfc	12	857	5383d79e-5b48-4518-9a8a-7bf945be7fe4
10847	DEBIT	\N	-60000	USD	2017-05-02 14:45:44.253-04	2017-05-02 14:45:44.253-04	857	3	\N	\N	\N	2677	0	\N	0	USD	1	-60000	-60000	\N	255cf139-a636-45f0-bcf0-6977504f71b9	51	857	644e54bc-af4b-463f-9c67-ef5913edc3e8
10881	CREDIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	2250	USD	2016-04-06 14:17:07.204-04	2016-04-16 16:40:58.818-04	51	3	\N	2017-10-27 13:28:58.844-04	\N	\N	\N	\N	\N	\N	1	\N	2250	\N	3f958d3d-1dca-4c95-8fc9-e9cfb621e8d3	\N	857	6a13fe4a-3baf-4a57-bdd7-ea3fca6b0852
10890	DEBIT	From:\tThao Le	-1500	USD	2016-04-12 14:49:06.645-04	2016-04-16 16:40:58.815-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1500	-1500	\N	5f87be6c-62c4-43b2-8d65-2707ed430778	4	857	6de2a79b-faa8-43a5-95d6-87797acffd04
10900	DEBIT	WWCode t-shirt sales	-1599	USD	2017-01-17 22:21:50.791-05	2017-01-17 22:21:50.964-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1599	-1599	\N	21ac5439-b964-401b-8ca2-25fbf44b527b	271	857	72878535-0361-4ee6-a729-c335c77036ce
10911	CREDIT	Priyanka - IOT Hackathon donation - fees and global development 	2175	USD	2016-12-13 15:08:29.218-05	2016-12-13 15:08:29.464-05	51	3	\N	2017-10-27 13:28:59.049-04	\N	\N	\N	\N	\N	\N	1	\N	2175	\N	e4a5f3ef-8b24-4249-b24f-4263241cb0fc	\N	857	7e743389-1069-45cf-a07b-b73a5fcfbb57
10756	CREDIT	$3500 Course Hero Hackathon support - transaction & global development	304500	USD	2016-11-17 13:27:12.528-05	2016-11-17 13:27:12.742-05	51	3	\N	2017-10-27 13:28:59.12-04	\N	\N	\N	\N	\N	\N	1	\N	304500	\N	504a8586-f01e-4234-aa13-767b2b8bfdac	\N	857	871f41d2-abc6-4179-9fd8-be6c030eab56
10877	CREDIT	Dalia donated to WWCode SF	1500	USD	2016-06-09 14:40:21.124-04	2016-06-09 14:40:21.833-04	51	3	\N	2017-10-27 13:28:59.201-04	\N	\N	\N	\N	\N	\N	1	\N	1500	\N	2c7f210b-32b4-496a-8718-e08f57b26da2	\N	857	98b9cc97-7e6b-43d6-a596-d4f9d491c623
10886	DEBIT	Dalia donated to WWCode SF	-1500	USD	2016-06-09 14:40:21.124-04	2016-06-09 14:40:21.833-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1500	-1500	\N	3aa0e646-47ec-4e0d-a0b3-ba76ef5221b3	4	857	98b9cc97-7e6b-43d6-a596-d4f9d491c623
10804	CREDIT	Network budget pre Open Collective	6264	USD	2016-10-04 18:51:25.324-04	2016-10-04 18:51:26.129-04	51	3	\N	2017-10-27 13:28:59.42-04	\N	\N	\N	\N	\N	\N	1	\N	6264	\N	72040466-a9a5-4b9a-80e6-b6c65a982268	\N	857	a06d642d-560f-4866-a6b8-34293b0cd740
10928	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 12:31:16.26-05	2016-12-23 12:31:16.392-05	51	3	\N	2017-10-27 13:28:59.441-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	314226f5-cfe0-49f4-a4f9-280a62b75ce8	\N	857	a2940d63-fba5-4983-b7b9-4224ea3d3ed3
10936	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 12:31:16.26-05	2016-12-23 12:31:16.392-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	58d42fc2-5aac-42fa-b71e-2a5ade56587b	195	857	a2940d63-fba5-4983-b7b9-4224ea3d3ed3
10819	CREDIT	Network Development	20000	USD	2016-10-11 12:02:18.108-04	2016-10-11 12:02:19.138-04	51	3	\N	2017-10-27 13:28:59.467-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	f32edd52-b123-4ea0-b5cb-ab47304346a8	\N	857	a8018c09-95aa-4442-9002-b21fc4be572c
10859	CREDIT	Network Development	15400	USD	2016-10-04 18:39:26.796-04	2016-10-04 18:39:26.9-04	51	3	\N	2017-10-27 13:28:59.472-04	\N	\N	\N	\N	\N	\N	1	\N	15400	\N	c8ea69df-37ba-4e9c-890a-ec3d4f6ccda2	\N	857	a8ef5a8c-6c19-456e-afb5-6dcb5304d4a5
10916	DEBIT	Donation via meetup - fees and global development	-775	USD	2016-12-13 15:20:15.375-05	2016-12-13 15:20:15.714-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-775	-775	\N	b57fcfe7-352b-4d00-a2d2-ff78f941cc1a	13	857	ae547542-6b14-450e-9d87-36742267a641
10790	CREDIT	Stephen	450	USD	2016-11-29 17:55:31.534-05	2016-11-29 17:55:31.727-05	51	3	\N	2017-10-27 13:28:59.72-04	\N	\N	\N	\N	\N	\N	1	\N	450	\N	20b570fa-ef17-45e1-a8fb-376d7ff31ac2	\N	857	bef512af-4207-4b43-a5e9-a426a6e74bbf
10798	DEBIT	Stephen	-450	USD	2016-11-29 17:55:31.534-05	2016-11-29 17:55:31.727-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-450	-450	\N	671f89ae-3b42-478e-a0a7-fa62bed4a12f	273	857	bef512af-4207-4b43-a5e9-a426a6e74bbf
10831	CREDIT	Donations via Meetup	2823	USD	2016-10-06 11:53:38.156-04	2016-10-06 11:53:38.231-04	51	3	\N	2017-10-27 13:28:59.732-04	\N	\N	\N	\N	\N	\N	1	\N	2823	\N	64d3ea9f-2dc2-4763-8378-157931e2cbb6	\N	857	c2638527-c758-412c-9a53-a6d816bb756a
10839	DEBIT	Donations via Meetup	-2823	USD	2016-10-06 11:53:38.156-04	2016-10-06 11:53:38.231-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2823	-2823	\N	16d5a496-e3c2-4df2-b46b-92c0fc7e18ee	4	857	c2638527-c758-412c-9a53-a6d816bb756a
10748	DEBIT	Network Budget Balance Pre Open Collective	-17475	USD	2016-11-29 17:28:03.065-05	2016-11-29 17:28:03.231-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-17475	-17475	\N	e47bcb2f-fb0e-43c4-9dc0-3d48f5f7375c	282	857	cc6a02a6-6f9d-414a-b7ae-022a5e66326a
10951	CREDIT	Banner	2000	USD	2016-11-30 13:40:32.021-05	2016-11-30 13:40:32.139-05	51	3	\N	2017-10-27 13:28:59.85-04	\N	\N	\N	\N	\N	\N	1	\N	2000	\N	a87ee584-63fc-4521-b0d3-0325cf2a1a1f	\N	857	ce384aeb-f7b2-4d37-b182-41f1791ee781
10855	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 15:51:45.723-04	2016-10-11 15:51:45.897-04	51	3	\N	2017-10-27 13:28:59.871-04	\N	\N	\N	\N	\N	\N	1	\N	370000	\N	8ced69ba-f497-48b8-92d2-d16d001140d2	\N	857	d1f3b64c-3364-40a2-b584-5a2c775b140f
10864	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 15:51:45.723-04	2016-10-11 15:51:45.897-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-370000	-370000	\N	26aab500-50cc-45e6-927c-e96d932f477b	262	857	d1f3b64c-3364-40a2-b584-5a2c775b140f
10794	CREDIT	Conference stipend Heidi H.	50000	USD	2016-10-11 11:59:30.363-04	2016-10-11 11:59:31.524-04	51	3	\N	2017-10-27 13:29:00.082-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	c9892251-af3b-45ae-b30e-d32c373766c3	\N	857	d596365a-de4d-45e7-94f2-d616039b6423
10811	CREDIT	Leadership Development	50616	MXN	2017-03-07 08:01:15.044-05	2017-03-07 08:01:15.192-05	51	3	\N	2017-10-27 13:29:00.274-04	\N	\N	\N	\N	\N	\N	1	\N	50616	\N	312bf36f-4162-4bf7-997a-a0bde271e657	\N	857	f745a867-5d9b-4f93-8846-9e1969d89fe4
10806	DEBIT	Donation from Adane	-450	USD	2016-10-04 18:56:11.881-04	2016-10-04 18:56:13.02-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-450	-450	\N	10ece453-973a-49aa-a725-d7292654a440	260	857	f7fed7d7-2c06-40f4-885c-e02fc3520158
10919	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:58:32.613-05	2016-12-27 11:58:32.719-05	51	3	\N	2017-10-27 13:29:00.289-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	b54c6d15-0240-4dfa-a9f2-0e993a56a61c	\N	857	f8d1f5ee-d65a-4258-b00c-452906f84784
10752	CREDIT	Global Development	15600	USD	2016-11-29 17:08:18.065-05	2016-11-29 17:08:18.213-05	51	3	\N	2017-10-27 13:29:00.455-04	\N	\N	\N	\N	\N	\N	1	\N	15600	\N	40599cc2-260b-4014-95de-744584babdd7	\N	857	f91f9075-8d62-4d3f-830e-e6d2c6ca5df1
10760	DEBIT	Global Development	-15600	USD	2016-11-29 17:08:18.065-05	2016-11-29 17:08:18.213-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-15600	-15600	\N	eb58ae5a-e11a-463d-9aeb-f73736dc0573	241	857	f91f9075-8d62-4d3f-830e-e6d2c6ca5df1
3520	CREDIT	Global Development	15600	USD	2016-11-29 17:08:18.065-05	2016-11-29 17:08:18.213-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15600	\N	adf0f06c-e558-411f-8551-6c08eaf62de1	857	857	f91f9075-8d62-4d3f-830e-e6d2c6ca5df1
10894	CREDIT	WWCode Boston t-shirt sales	1964	USD	2017-01-17 22:19:47.816-05	2017-01-17 22:19:48.024-05	51	3	\N	2017-10-27 13:29:00.538-04	\N	\N	\N	\N	\N	\N	1	\N	1964	\N	996b3019-4396-4f6d-b153-e5d33992ee44	\N	857	fd6acaac-0c7a-4ada-82f3-832ce113a122
10903	DEBIT	WWCode Boston t-shirt sales	-1964	USD	2017-01-17 22:19:47.816-05	2017-01-17 22:19:48.024-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1964	-1964	\N	ee8b0748-f524-4e0d-ae7b-8cae852a669e	195	857	fd6acaac-0c7a-4ada-82f3-832ce113a122
10898	DEBIT	Women Techmaker/WWCode partnership grant	-50000	USD	2016-05-04 17:17:27.653-04	2016-05-04 17:17:27.886-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	44dadc83-097d-4e80-983b-4b5728d50907	13	857	ff617604-b49b-4b4e-ae64-e82f6fe98456
11008	DEBIT	monthly recurring subscription	-53	USD	2017-03-09 13:29:18.778-05	2017-03-09 13:29:18.778-05	819	8	385	\N	\N	320	5	\N	32	USD	1	-53	-100	\N	3b201952-fd72-4f83-98cd-a30fe9d843de	3	857	dfde5c0c-1b50-4538-959a-1a7cfe9cc337
11016	DEBIT	Donation to WWCode San Francisco	-53	USD	2016-06-21 12:05:01.251-04	2016-06-21 12:05:01.296-04	775	642	431	\N	\N	360	5	\N	32	USD	1	-53	-100	\N	32394643-936e-4605-8ee7-698e02cb3a45	4	857	53a29930-50e5-41c0-8d68-afafb81ddaca
11017	DEBIT	Donation to WWCode Austin	-61125	USD	2016-06-22 16:09:46.403-04	2016-06-22 16:09:46.432-04	771	646	435	\N	\N	364	3750	\N	2625	USD	1	-61125	-75000	\N	6c2ce312-95b7-451d-8ce9-fe50d0811f23	2	857	2bfdbc4f-dfd4-4425-a06d-a38ec505f785
11019	DEBIT	Recurring subscription	-8250	USD	2016-08-03 13:47:25.319-04	2016-08-03 13:47:25.429-04	759	896	571	\N	\N	498	500	\N	250	USD	1	-8250	-10000	\N	17166e2e-1954-42c4-a933-22078fc7728c	4	857	000d6274-195d-4179-8877-21c9ed16766f
11086	DEBIT	Recurring subscription	-52	USD	2016-05-02 13:46:41.832-04	2016-05-02 13:46:41.894-04	691	30	41	\N	\N	67	5	\N	33	USD	1	-52	-100	\N	f2a0b72a-4a59-446d-8bc8-d76b2e5031c2	14	857	270cd840-e164-4b84-b0a6-54b30aceab38
11094	CREDIT	Minimum Fee - May	1000	USD	2016-08-16 10:54:57.595-04	2016-08-16 10:54:57.609-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	9482d6d3-464a-43e6-ae70-a28ec0910a01	48	857	34d896ca-e194-46f5-b28f-e676aae981d1
11097	CREDIT	Conference Grant	120000	USD	2016-05-19 15:07:13.723-04	2016-06-14 14:14:22.074-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	120000	120000	175	66557395-99dc-4a2c-a726-46eb0e449a32	12	857	1c0e14d6-f0a5-45df-b913-cb66b3a199a6
11099	CREDIT	To redeem travel stipend to Google I/O	104430	USD	2017-03-20 11:39:23.328-04	2017-03-20 11:39:23.364-04	831	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	104430	100000	924	04f12147-90f0-4818-951a-00e23e919f89	277	857	d92c5fcf-f167-4663-8df5-d39a3dc0b8b7
11106	CREDIT	Event supplies	1601	USD	2017-04-11 15:13:28.544-04	2017-04-11 15:13:28.599-04	826	171	2321	\N	\N	\N	\N	\N	74	USD	1	1601	1527	1002	a9b02bd1-f7b0-49d1-be9a-21626dd2a08c	59	857	ae1ff7b3-f12e-4f29-9c1a-73009ecb8ee0
11109	CREDIT	Regional Leadership Director Training	13031	USD	2016-11-29 17:35:21.354-05	2016-11-29 17:35:21.522-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	13031	13031	\N	2783cd04-8ce8-4cbf-b907-9b2e024f64ed	47	857	7d55cf41-87e3-468f-94f1-6b0b2de120b5
11120	CREDIT	Meetup Fees	6000	AUD	2016-12-28 10:56:28.934-05	2016-12-28 10:56:28.934-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	661	d7bb4cc2-af5b-468e-8e99-b5fbe2c85df3	297	857	b12f3fb2-919e-4c2d-8c86-921d18eb2a85
11122	CREDIT	Meetup Fees	6000	USD	2016-12-28 10:53:05.613-05	2016-12-28 10:53:05.613-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	660	e2930ae6-8f08-4026-bd9f-0f898ab7a67b	289	857	71f74e15-f974-4768-be56-62b75e5a1dcd
10949	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 16:20:06.733-05	2016-11-30 16:20:15.577-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-7500	-7500	\N	6f661fd1-1fed-41b1-ab1d-9dc23e8847ab	269	857	16ab8d31-a2af-4c85-b45e-fd69401e5507
11054	CREDIT	Donations via Meetup	3937	USD	2016-10-06 14:41:35.464-04	2016-10-06 14:41:35.487-04	51	3	\N	2017-10-27 13:28:58.407-04	\N	\N	\N	\N	\N	\N	1	\N	3937	\N	f46b7e04-2038-4824-92a2-94efe530b894	\N	857	174bcd78-2fa1-4dce-a1ef-5a6a4c7bc29f
11059	DEBIT	Donations via Meetup	-3937	USD	2016-10-06 14:41:35.464-04	2016-10-06 14:41:35.487-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3937	-3937	\N	59e7293b-9268-48c0-894f-6623582fa035	13	857	174bcd78-2fa1-4dce-a1ef-5a6a4c7bc29f
10968	CREDIT	Donation from Shugo	450	USD	2016-10-12 00:30:15.825-04	2016-10-12 00:30:15.896-04	51	3	\N	2017-10-27 13:28:58.416-04	\N	\N	\N	\N	\N	\N	1	\N	450	\N	55102e25-7883-4c31-929c-8dee266c069d	\N	857	17eb5dc3-202a-4026-a0c8-6c0bd1941ad7
11067	DEBIT	\N	-15000	USD	2017-05-03 13:44:48.715-04	2017-05-03 13:44:48.715-04	857	3	\N	\N	\N	2697	0	\N	0	USD	1	-15000	-15000	\N	ecc83993-7d4f-4cfa-bbd6-ec42ba0b188b	51	857	19b82371-b367-4bfa-bcf1-ff5f0e649b0e
10909	CREDIT	Donation via Meetup - fees + Global Development	1187	USD	2016-12-13 15:17:57.936-05	2016-12-13 15:17:58.19-05	51	3	\N	2017-10-27 13:28:58.481-04	\N	\N	\N	\N	\N	\N	1	\N	1187	\N	890963c3-e20f-42cd-9371-d3a85658fd14	\N	857	27142ec4-9f9b-42a0-b21c-f8a94b5abebf
10915	DEBIT	Donation via Meetup - fees + Global Development	-1187	USD	2016-12-13 15:17:57.936-05	2016-12-13 15:17:58.19-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1187	-1187	\N	e4e2faa6-4533-432c-80a0-c79ae78cd31f	272	857	27142ec4-9f9b-42a0-b21c-f8a94b5abebf
10918	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 12:02:32.71-05	2016-12-27 12:02:32.843-05	51	3	\N	2017-10-27 13:28:58.585-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	34f8d370-f094-4076-a8a0-ff98bb804ef3	\N	857	34f02b63-de13-4314-a21f-5262d6ebbc76
11028	CREDIT	WWCode shirt Grisel	3649	USD	2016-10-17 16:48:59.282-04	2016-10-17 16:48:59.313-04	51	3	\N	2017-10-27 13:28:58.693-04	\N	\N	\N	\N	\N	\N	1	\N	3649	\N	4d64b299-03e6-4a95-93f8-15aa3ca8e677	\N	857	4bbbb64c-1520-49dd-ae63-dea31070d6a7
10926	CREDIT	Google I/O stipend	39585	GBP	2016-10-07 09:35:45.945-04	2016-10-07 09:35:46.151-04	51	3	\N	2017-10-27 13:28:58.722-04	\N	\N	\N	\N	\N	\N	1	\N	39585	\N	ff972d39-b48b-4aa9-8e9c-8fcfdb4206da	\N	857	5276d130-e3c6-416e-a525-502879c74fd4
10932	DEBIT	Google I/O stipend	-39585	GBP	2016-10-07 09:35:45.945-04	2016-10-07 09:35:46.151-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-39585	-39585	\N	ec5890f5-f920-4045-aa6d-3ce164f61b1f	278	857	5276d130-e3c6-416e-a525-502879c74fd4
11012	DEBIT	Women Techmaker/WWCode Partnership Grant	-50000	USD	2016-05-16 16:01:14.238-04	2016-05-16 16:01:14.49-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	375cb79d-35e2-4ec7-923a-0e54c6b7a934	10	857	5334f5de-2c22-44fa-a390-e23918ec661f
10962	DEBIT	CONNECT 2016	-4536939	USD	2016-11-29 16:44:20.041-05	2016-11-29 16:44:20.185-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4536939	-4536939	\N	df6ce502-3daa-4670-9596-1760f91736c8	14	857	592aca97-6912-42fd-8902-ab2eadcef214
10972	DEBIT	Network Development	-19550	USD	2016-10-12 00:30:34.678-04	2016-10-12 00:30:34.772-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-19550	-19550	\N	5b38a69a-5643-4612-8246-1832090e945b	295	857	5adef262-f8a8-46ac-91d9-63c3ebd3c898
11057	DEBIT	Network Development +	-50000	USD	2016-10-07 16:24:13.595-04	2016-10-07 16:24:13.706-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	c7e01f09-1c62-44ef-a142-ff9cb00ad89b	300	857	5c492fe3-dd05-4d31-9fde-ddcb039abf05
11082	CREDIT	Donation Pamela V.	4500	USD	2016-10-06 14:09:54.319-04	2016-10-06 14:09:54.357-04	51	3	\N	2017-10-27 13:28:58.797-04	\N	\N	\N	\N	\N	\N	1	\N	4500	\N	4acdfd68-ad43-438e-a374-c777567e4dc5	\N	857	61d4535c-acc1-4367-acc8-f102f6e0657a
11088	DEBIT	Donation Pamela V.	-4500	USD	2016-10-06 14:09:54.319-04	2016-10-06 14:09:54.357-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4500	-4500	\N	e2170b33-2310-407f-957f-78882ab43d53	13	857	61d4535c-acc1-4367-acc8-f102f6e0657a
10977	CREDIT	Network Development	19100	USD	2016-10-11 20:28:02.718-04	2016-10-11 20:28:03.121-04	51	3	\N	2017-10-27 13:28:59.037-04	\N	\N	\N	\N	\N	\N	1	\N	19100	\N	205b0778-1d5b-4842-9a9b-7b00b5cecfd5	\N	857	7ba2b72c-89d5-4fcd-8cfa-b79cc1685193
10959	CREDIT	Global Development - thanks VMWare	50000	USD	2016-11-29 18:07:50.964-05	2016-11-29 18:07:51.154-05	51	3	\N	2017-10-27 13:28:59.044-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	8a2aaea8-23c2-4a40-8946-12261df333de	\N	857	7dda5758-95d3-48c5-844c-f5d13f8d2de9
11032	CREDIT	from Code2040	90000	USD	2016-10-17 11:43:12.71-04	2016-10-17 11:43:13.113-04	51	3	\N	2017-10-27 13:28:59.054-04	\N	\N	\N	\N	\N	\N	1	\N	90000	\N	0ca43951-bdfd-4758-8b37-e674e6514b46	\N	857	800117e3-ce11-430b-9160-ce9f8d36d119
11038	DEBIT	from Code2040	-90000	USD	2016-10-17 11:43:12.71-04	2016-10-17 11:43:13.113-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-90000	-90000	\N	1829f8a5-db43-41dd-aaa6-887be17491e2	2	857	800117e3-ce11-430b-9160-ce9f8d36d119
11049	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 16:50:42.245-04	2016-10-17 16:50:42.273-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3649	-3649	\N	ea97dfeb-172d-4883-905b-a4e87d2dbe23	47	857	8ecad7e6-c62d-4289-b93c-f88178132020
10976	CREDIT	Google I/O conference stipend	102409	GBP	2016-10-07 09:10:42.97-04	2016-10-07 09:10:43.753-04	51	3	\N	2017-10-27 13:28:59.16-04	\N	\N	\N	\N	\N	\N	1	\N	102409	\N	0087f1f3-df3a-4a94-b54d-df6a66815f39	\N	857	901dab42-c197-4f87-bac6-ebf59c1d6d45
10995	CREDIT	Sponsorship: AT&T Hackathon Prize	1000000	USD	2016-10-04 11:40:37.72-04	2016-10-04 11:40:37.853-04	51	3	\N	2017-10-27 13:28:59.165-04	\N	\N	\N	\N	\N	\N	1	\N	1000000	\N	a5af9dae-ed5a-42f6-9fd6-f4547bb94a6f	\N	857	9140a174-9e7e-4864-8157-b58b882a7c2c
10978	CREDIT	Hackathon Support Open Gov	45000	USD	2016-10-07 10:41:08.315-04	2016-10-07 10:41:08.391-04	51	3	\N	2017-10-27 13:28:59.586-04	\N	\N	\N	\N	\N	\N	1	\N	45000	\N	4e623471-4ce8-423b-88d8-dfd425708f2c	\N	857	b8cd459e-3b4a-4d4f-8bdd-74e0c52eb4b4
10985	DEBIT	Hackathon Support Open Gov	-45000	USD	2016-10-07 10:41:08.315-04	2016-10-07 10:41:08.391-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-45000	-45000	\N	258b51c2-4e9b-4062-99a5-34b120213d59	300	857	b8cd459e-3b4a-4d4f-8bdd-74e0c52eb4b4
10998	CREDIT	Jasna Rodulfa	1000	USD	2016-04-15 10:17:21.126-04	2016-04-16 16:40:58.829-04	51	3	\N	2017-10-27 13:28:59.75-04	\N	\N	\N	\N	\N	\N	1	\N	1000	\N	8ca363fd-bc99-4b5c-a7c0-60aa79aa22fc	\N	857	c554600a-521b-4cda-b48c-a27e264d60ed
11004	DEBIT	Jasna Rodulfa	-1000	USD	2016-04-15 10:17:21.126-04	2016-04-16 16:40:58.829-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1000	-1000	\N	33d6fc01-6843-4d6e-96f2-bd50981a4a1a	13	857	c554600a-521b-4cda-b48c-a27e264d60ed
11023	CREDIT	\N	2175	USD	2017-05-04 12:21:53.684-04	2017-05-04 12:21:53.684-04	51	3	\N	2017-10-27 13:28:59.878-04	\N	2710	\N	\N	\N	USD	1	2175	2175	\N	c3d4f1af-a9df-4304-b61e-52fa12771ae2	\N	857	d21dc47b-2de8-4363-949f-a9f8b452a8ba
10946	CREDIT	Global Development	20000	USD	2016-11-30 16:11:00.067-05	2016-11-30 16:11:00.307-05	51	3	\N	2017-10-27 13:29:00.171-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	d1306f88-a7f0-4900-acc2-61c280498bc9	\N	857	e38ec0b9-9f7a-4343-b5cd-576784411dd3
10952	DEBIT	Global Development	-20000	USD	2016-11-30 16:11:00.067-05	2016-11-30 16:11:00.307-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	b32dd0d5-0801-4794-a80b-c7b127b6a878	294	857	e38ec0b9-9f7a-4343-b5cd-576784411dd3
10922	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:48:52.922-05	2016-12-27 11:48:53-05	51	3	\N	2017-10-27 13:29:00.223-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	3a6fbf9b-4113-4da1-b2a4-d461ff25383b	\N	857	edd0e210-9488-4003-91ca-6d032dd22423
10929	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:48:52.922-05	2016-12-27 11:48:53-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	2ae25280-fbaa-4528-a874-5213eb172d31	273	857	edd0e210-9488-4003-91ca-6d032dd22423
11078	DEBIT	Network budget balance pre Open Collective	-34240	USD	2016-10-04 17:49:31.268-04	2016-10-04 17:49:31.543-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-34240	-34240	\N	5d336ca8-137e-4b1c-9acf-bb3ea9345c00	15	857	f60aa822-25f8-4374-99fd-10ce1cd8dfd8
11018	CREDIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	5161	USD	2016-06-06 20:21:31.531-04	2016-06-14 14:14:22.165-04	766	31	320	\N	\N	\N	\N	\N	\N	\N	1	5161	5161	218	92a41206-b209-467c-9b3b-96c8775d67aa	14	857	a58117d4-113d-418e-84cc-1f050b17ba90
11098	CREDIT	Google I/O ticket	38618	USD	2017-03-27 13:12:00.118-04	2017-03-27 13:12:00.138-04	835	69	2265	\N	\N	\N	\N	\N	1118	USD	1	38618	37500	949	e7e81a37-2818-4faf-9600-f89a076992c8	12	857	9a273c8e-9acc-4226-9f5e-5591a464eeab
11104	CREDIT	Event supplies for Leads	2439	USD	2017-02-07 13:38:14.3-05	2017-02-07 13:38:15.58-05	826	171	1718	\N	\N	\N	\N	\N	\N	\N	1	2439	2439	737	69b9a0b2-9690-4dc8-915e-7db09609161a	59	857	ea15b18a-5566-4c39-95b6-42fb0321b188
11107	CREDIT	Regional Leadership Event: Barcelona	19398	EUR	2017-05-16 17:49:07.885-04	2017-05-16 17:49:07.885-04	793	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	19398	19398	1122	5b315b4c-eadf-4ba6-94d2-84c72a1915d5	301	857	729ba336-adad-4be4-b4b2-8d44bea9af5d
11111	CREDIT	Monthly Minimum Fee - May	1000	USD	2016-08-16 10:51:38.913-04	2016-08-16 10:51:38.924-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	808fe81f-7c88-4e32-aab5-aa70ef219a8a	12	857	6f46d6d3-bb9c-4706-aa52-a03fb61fa1e4
11114	CREDIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	100000	USD	2017-04-17 18:12:22.995-04	2017-04-17 18:12:22.995-04	51	3	\N	\N	\N	\N	\N	\N	0	USD	1	100000	100000	1027	a8ed41b6-facc-4c1b-a8c4-8f197e4b1f12	270	857	fab4e915-6462-4f24-a0d2-df754bcdd580
11117	CREDIT	CONFERENCE GRANT	34750	USD	2016-05-26 15:05:53.771-04	2016-06-14 14:14:22.123-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	34750	34750	197	75e3d48a-d890-41d9-85fe-a30651eb5c58	59	857	f74bbc2b-83ee-49b2-af6d-aeb439cbc6ac
11126	CREDIT	Meetup Fee	6000	USD	2016-12-27 13:35:08.624-05	2016-12-27 13:35:08.624-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	653	8fa1cecb-0973-4cff-944c-8d11ce0a54b6	284	857	029834db-f884-4452-ad1f-603b08335984
11134	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:16:27.082-05	2016-12-27 11:16:27.082-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	633	ca9e6ab8-b157-4457-8e31-a6eba0d95ffa	271	857	1119894e-6fdd-4b3f-80e4-ef53b4fc3d12
11136	CREDIT	Meetup Fees	6000	USD	2016-12-28 11:25:48.743-05	2016-12-28 11:25:48.743-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	664	d1979b3b-10cb-424f-8bb2-410692745d0e	48	857	cfb369fc-876f-4ea2-a36c-2866a47729ee
10992	DEBIT	Recurring subscription	-52	USD	2016-03-02 13:26:05.731-05	2016-04-16 16:40:58.833-04	691	30	44	\N	\N	70	5	\N	33	USD	1	-52	-100	\N	b2335abf-eec8-48dd-8588-eaad7d52cd07	13	857	6415a67c-6553-4f43-a9f7-ed6a5b3f1fca
11075	CREDIT	Donation via Meetup	1203	USD	2016-10-04 12:46:07.882-04	2016-10-04 12:46:07.993-04	51	3	\N	2017-10-27 13:28:58.339-04	\N	\N	\N	\N	\N	\N	1	\N	1203	\N	c4ed932b-48c8-4559-a33e-29db4035b351	\N	857	0d8179b9-e627-44fd-9857-7bf9ddfba46c
10986	CREDIT	Diana A. Scholarship Google I/O	25000	USD	2016-10-04 18:19:06.989-04	2016-10-04 18:19:07.108-04	51	3	\N	2017-10-27 13:28:58.411-04	\N	\N	\N	\N	\N	\N	1	\N	25000	\N	2f16a735-48de-4d0b-938d-262c885a813a	\N	857	17701b96-4830-453a-b4dc-f0c4b9327018
10994	DEBIT	Diana A. Scholarship Google I/O	-25000	USD	2016-10-04 18:19:06.989-04	2016-10-04 18:19:07.108-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-25000	-25000	\N	dad1dc99-702f-4113-8c43-d274d59efca1	272	857	17701b96-4830-453a-b4dc-f0c4b9327018
10975	DEBIT	Donation from Shugo	-450	USD	2016-10-12 00:30:15.825-04	2016-10-12 00:30:15.896-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-450	-450	\N	e7d56cb6-8b10-4a9f-b1e7-78b3b6f33d86	295	857	17eb5dc3-202a-4026-a0c8-6c0bd1941ad7
10938	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:59:24.039-05	2016-12-23 11:59:24.291-05	51	3	\N	2017-10-27 13:28:58.42-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	67e6995a-e5da-45f7-931a-b977a84bd554	\N	857	1814f900-448d-4ff9-b68e-729da0e7152e
11084	CREDIT	\N	300000	USD	2017-05-02 14:43:43.157-04	2017-05-02 14:43:43.157-04	51	3	\N	2017-10-27 13:28:58.655-04	\N	2676	\N	\N	\N	USD	1	300000	300000	\N	df71748f-0fb2-47d1-8c1e-64cb46259b69	\N	857	4342a989-fa65-4691-ae4f-88b955dbdf0b
11087	DEBIT	\N	-300000	USD	2017-05-02 14:43:43.157-04	2017-05-02 14:43:43.157-04	857	3	\N	\N	\N	2676	0	\N	0	USD	1	-300000	-300000	\N	77cbde93-539b-490d-82fc-df0410aadeba	12	857	4342a989-fa65-4691-ae4f-88b955dbdf0b
11043	CREDIT	Director t-shirt	2860	USD	2016-10-17 16:55:47.647-04	2016-10-17 16:55:47.671-04	51	3	\N	2017-10-27 13:28:58.66-04	\N	\N	\N	\N	\N	\N	1	\N	2860	\N	fc4686e7-7c55-43bd-90de-e62507ebe0f8	\N	857	436f78f3-f83b-4ec4-9ad9-1935b514a186
11039	DEBIT	WWCode DC t-shirts sales	-9524	USD	2016-11-17 13:37:58.038-05	2016-11-17 13:37:58.232-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-9524	-9524	\N	c089df35-5119-47f3-8827-d7e8b54bcbee	13	857	4b9b9aa5-12ec-40cc-9c0e-431edc53a64b
11005	CREDIT	Women Techmaker/WWCode Partnership Grant	50000	USD	2016-05-16 16:01:14.238-04	2016-05-16 16:01:14.49-04	51	3	\N	2017-10-27 13:28:58.728-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	68145ffd-ee67-4546-9cd0-4ccd736d9839	\N	857	5334f5de-2c22-44fa-a390-e23918ec661f
11061	DEBIT	Network Development (Stickers)	-62984	USD	2016-10-06 11:49:44.329-04	2016-10-06 11:49:44.472-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-62984	-62984	\N	01e7650b-9062-4e10-9736-c3be9d05b207	4	857	594bf8fc-c605-4f80-ac4b-031bc44d5349
10965	DEBIT	Global Development - thanks VMWare	-50000	USD	2016-11-29 18:07:50.964-05	2016-11-29 18:07:51.154-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	8874b95d-9add-43af-8330-0b877ca4c5ab	289	857	7dda5758-95d3-48c5-844c-f5d13f8d2de9
11079	DEBIT	Donation received via Meetup, less fees	-788	USD	2016-10-04 12:46:13.302-04	2016-10-04 12:46:13.487-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-788	-788	\N	78e03595-c331-448d-9b5e-d1c72a001985	12	857	819b5869-271d-4469-bc40-1856ec37ff49
10981	DEBIT	Google I/O conference stipend	-102409	GBP	2016-10-07 09:10:42.97-04	2016-10-07 09:10:43.753-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-102409	-102409	\N	258cf3eb-92cb-4a24-9c4a-3b95c0216caa	278	857	901dab42-c197-4f87-bac6-ebf59c1d6d45
10990	DEBIT	Course Hero Hackathon Support	-315000	USD	2016-10-07 10:39:15.069-04	2016-10-07 10:39:15.23-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-315000	-315000	\N	ea272be1-6384-48d9-bb50-13a802d3ba68	300	857	9b25deaf-b9d5-4253-9925-bb788d5524e7
11091	CREDIT	Women Techmaker WWCode Partnership Grant	120000	USD	2016-05-19 15:10:52.797-04	2016-05-19 15:10:54.053-04	51	3	\N	2017-10-27 13:28:59.397-04	\N	\N	\N	\N	\N	\N	1	\N	120000	\N	a2e01d7e-39a6-4e15-a83e-393956976bb5	\N	857	9c68533f-e1fe-4007-8a30-7394380c5d80
11052	CREDIT	\N	2175	USD	2017-05-03 20:12:19.814-04	2017-05-03 20:12:19.814-04	51	3	\N	2017-10-27 13:28:59.501-04	\N	2702	\N	\N	\N	USD	1	2175	2175	\N	23ee9ca7-3680-49c4-bdfc-90a852a28db9	\N	857	b0d99568-d711-4dd5-bcb7-fc20ba675973
10971	CREDIT	Hackbright support for hackathon	45000	USD	2016-10-07 16:04:15.299-04	2016-10-07 16:04:15.435-04	51	3	\N	2017-10-27 13:28:59.521-04	\N	\N	\N	\N	\N	\N	1	\N	45000	\N	b0fe1f90-e99d-4273-8120-307f403d8bcc	\N	857	b2e7cdbc-c7eb-4b78-ae9c-d88f853b69db
10979	DEBIT	Hackbright support for hackathon	-45000	USD	2016-10-07 16:04:15.299-04	2016-10-07 16:04:15.435-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-45000	-45000	\N	7c3a165b-d633-4717-b539-4d3da6b01964	300	857	b2e7cdbc-c7eb-4b78-ae9c-d88f853b69db
11007	CREDIT	Travel Stipend for CONNECT	50000	USD	2017-04-03 16:24:58.616-04	2017-04-03 16:24:58.879-04	51	3	\N	2017-10-27 13:28:59.53-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	cda10265-da34-4da3-9ce8-1b1d1f966198	\N	857	b53c151f-d47a-4f00-847d-f5de02a38e5e
11014	DEBIT	Travel Stipend for CONNECT	0	USD	2017-04-03 16:24:58.616-04	2017-04-03 16:24:58.879-04	857	3	\N	2017-04-02 20:00:00-04	\N	\N	\N	\N	\N	\N	1	0	-50000	\N	2a499a32-db0a-4156-ab4a-27e2e805849f	511	857	b53c151f-d47a-4f00-847d-f5de02a38e5e
10941	DEBIT	Global Development for Meetup Fee	-5700	EUR	2016-12-23 12:13:39.369-05	2016-12-23 12:13:39.507-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-5700	-5700	\N	f14f2fd1-0bc4-4fbd-b5ef-d4c6ae141a84	301	857	b91d2dfc-37f9-46ff-89e7-5720d627f0e7
10935	DEBIT	Global Development for Meetup Fee	-6000	AUD	2016-12-23 12:41:14.029-05	2016-12-23 12:41:14.193-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	079d9617-10a6-4e5e-9be6-7f32b460c688	266	857	ba148ad8-a26b-4522-b44a-2b70f50b900e
11003	CREDIT	Network Development	10000	USD	2016-10-04 17:44:54.4-04	2016-10-04 17:44:54.58-04	51	3	\N	2017-10-27 13:28:59.737-04	\N	\N	\N	\N	\N	\N	1	\N	10000	\N	e5baacba-7de3-4c78-b575-ea37c7da8c65	\N	857	c3257758-308a-41ec-9342-a10344f2cdae
11010	DEBIT	Network Development	-10000	USD	2016-10-04 17:44:54.4-04	2016-10-04 17:44:54.58-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10000	-10000	\N	c63906ca-b02a-4f21-a2f3-df471f8b0c31	2	857	c3257758-308a-41ec-9342-a10344f2cdae
10958	DEBIT	Banner	-2000	USD	2016-11-30 13:40:32.021-05	2016-11-30 13:40:32.139-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2000	-2000	\N	a48c9602-8f2b-489d-bd02-3810ba70665a	292	857	ce384aeb-f7b2-4d37-b182-41f1791ee781
11029	DEBIT	\N	-2175	USD	2017-05-04 12:21:53.684-04	2017-05-04 12:21:53.684-04	857	3	\N	\N	\N	2710	0	\N	0	USD	1	-2175	-2175	\N	c60890c1-e7f2-498a-8c02-3e077311e7a9	276	857	d21dc47b-2de8-4363-949f-a9f8b452a8ba
11065	CREDIT	Network Development: Three Year Bonus:)	50000	USD	2016-10-04 17:52:32.839-04	2016-10-04 17:52:32.962-04	51	3	\N	2017-10-27 13:29:00.176-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	6f6c2010-7b63-4773-b48e-c27178b28ca6	\N	857	e4ed9833-caa6-415b-8fca-31de4ad32823
11071	DEBIT	Network Development: Three Year Bonus:)	-50000	USD	2016-10-04 17:52:32.839-04	2016-10-04 17:52:32.962-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	579b0215-6dd9-45de-a1f6-8c579707d6ce	2	857	e4ed9833-caa6-415b-8fca-31de4ad32823
10988	CREDIT	Network Development	17375	USD	2016-10-04 18:15:45.133-04	2016-10-04 18:15:45.269-04	51	3	\N	2017-10-27 13:29:00.232-04	\N	\N	\N	\N	\N	\N	1	\N	17375	\N	e93cf04e-ae05-43ef-8056-e802cae19009	\N	857	ef4b6484-f984-419f-8c86-7fee2f796fde
10955	CREDIT	Donation from PB - fees 	1187	USD	2016-11-29 18:33:50.04-05	2016-11-29 18:33:50.206-05	51	3	\N	2017-10-27 13:29:00.242-04	\N	\N	\N	\N	\N	\N	1	\N	1187	\N	e0e34464-4e10-43e3-b750-4b52251a8530	\N	857	f4e68981-d777-42ac-a6ab-ae6f42d781b9
10923	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-27 11:58:32.613-05	2016-12-27 11:58:32.719-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	2f4fdcae-1238-454e-9bc0-33deeb8206d3	276	857	f8d1f5ee-d65a-4258-b00c-452906f84784
10997	CREDIT	Turner Matching Donation	5000	USD	2016-10-04 11:46:59.013-04	2016-10-04 11:46:59.134-04	51	3	\N	2017-10-27 13:29:00.528-04	\N	\N	\N	\N	\N	\N	1	\N	5000	\N	136a830e-5cf9-44b0-82fc-d480bd7ae048	\N	857	fada5aa0-efa3-4a6c-8209-babe8b26b8a1
11001	DEBIT	Turner Matching Donation	-5000	USD	2016-10-04 11:46:59.013-04	2016-10-04 11:46:59.134-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-5000	-5000	\N	2e851d10-d175-47e9-8910-1fe96d37db92	12	857	fada5aa0-efa3-4a6c-8209-babe8b26b8a1
11021	DEBIT	\N	-4938	USD	2017-03-09 13:29:55.496-05	2017-03-09 13:29:55.496-05	754	3442	2104	\N	\N	2003	300	\N	162	USD	1	-4938	-6000	\N	82574af4-38dc-420a-8415-f0c4729c5e38	259	857	86aa011d-7558-41f1-9368-85dc44cd7f3e
11093	CREDIT	Reimburse Caterina for travel expenses to CONNECT 2016	6500	USD	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.839-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6500	6500	75	1b2e4950-8520-4110-b106-fa21012cfe5f	59	857	3f04b7f6-031e-4975-be44-86d2a6df090d
11105	CREDIT	Hackathon 2017 planning meeting	3005	USD	2017-04-11 15:15:09.813-04	2017-04-11 15:15:09.826-04	826	171	2321	\N	\N	\N	\N	\N	114	USD	1	3005	2891	1001	9e919eca-30a4-4636-9ec1-a052cc0757bf	59	857	29eaffa9-1dc8-4ceb-836a-9f3c3f3e5022
11108	CREDIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	59040	USD	2017-02-07 13:32:48.784-05	2017-02-07 13:32:49.072-05	766	31	1718	\N	\N	\N	\N	\N	\N	\N	1	59040	59040	776	31e8ff0a-e801-4378-a683-2ee966b16503	14	857	6d2a3ef1-eb82-4d68-a71c-de5d31420203
11110	CREDIT	Fedex 	3418	USD	2016-10-11 20:43:40.215-04	2016-10-11 20:43:40.344-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3418	3418	\N	4f524bd3-cfdb-47ff-9f84-22d78113ae8f	48	857	90e83473-9ab4-4b8d-91ea-e96a8864fdcc
11112	CREDIT	Minimum fee - May	1000	USD	2016-08-16 10:54:12.931-04	2016-08-16 10:54:12.95-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	697727be-11f7-4cd3-a2e6-8a74357564e1	15	857	cd49ddf4-676b-4277-b8d3-eccc8d92e791
11121	CREDIT	Reimburse Caterina for program materials	3798	USD	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.838-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3798	3798	76	9c3c732d-4dd4-4209-8b0f-d17099f2cbf9	59	857	73805bf1-e659-4dd4-bd6a-473c2b51c241
11123	CREDIT	Meetup Fees	6000	USD	2016-12-28 10:49:16.255-05	2016-12-28 10:49:16.255-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	659	79853139-07dc-4c20-b90d-8679cd880fd6	300	857	cb4922b8-fa61-43bf-bc75-b4c90af4fdda
11125	CREDIT	Meetup Fees	6000	USD	2016-12-27 13:38:46.887-05	2016-12-27 13:38:46.887-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	654	4ea95028-b60d-44e8-921b-f9e41574cec3	59	857	4ecc211c-4476-4b03-8d17-e58edda8860c
11133	CREDIT	Meetup Fees	6000	MXN	2016-12-27 11:12:26.224-05	2016-12-27 11:12:26.224-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	632	ca28a073-7468-4731-929d-8b50e5a71acd	299	857	f90bb2e5-46b8-4176-8920-b3aff3950875
11135	CREDIT	Meetup Fees	6000	USD	2016-12-28 11:28:15.901-05	2016-12-28 11:28:15.901-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	665	0755fab1-c8b6-47a4-8797-a36e01376bab	292	857	5d0b1f4f-935e-47ec-b42d-b7f38e6035b4
11139	CREDIT	Meetup Fees	5700	EUR	2016-12-27 13:11:51.873-05	2016-12-27 13:11:51.873-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	5700	5700	652	3a47272e-4ecd-42f5-bb62-5bf84230d66e	283	857	e92802d1-a9ac-4e94-a466-4b06f7b31cd1
11144	CREDIT	Mar 7 Lightning Talks	15790	USD	2017-03-14 13:21:29.296-04	2017-03-14 13:21:29.332-04	847	28	1893	\N	\N	\N	\N	\N	474	USD	1	15790	15316	57	180150d3-5fae-4783-b17f-25d5ac4ff9ff	2	857	ed4fa657-d5ba-4cfb-bf46-09bb677a6c5d
11011	DEBIT	monthly recurring subscription	-798	USD	2017-04-01 19:32:24.254-04	2017-04-01 19:32:24.254-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	6ab4da46-716f-411a-ae8c-697e63567e21	2	857	4f2392df-1165-40b0-879a-186c61b75973
11025	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	1450	USD	2017-03-13 13:06:48.459-04	2017-03-13 13:06:51.099-04	51	3	\N	2017-10-27 13:28:58.402-04	\N	\N	\N	\N	\N	\N	1	\N	1450	\N	d348c3cc-8fec-4a59-9acd-d14d66289a7a	\N	857	172a2c98-beb4-48b7-9b11-3c209e66f4b4
11031	DEBIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	-1450	USD	2017-03-13 13:06:48.459-04	2017-03-13 13:06:51.099-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1450	-1450	\N	7939a385-f2f5-4639-b602-099901763265	51	857	172a2c98-beb4-48b7-9b11-3c209e66f4b4
11062	CREDIT	\N	15000	USD	2017-05-03 13:44:48.715-04	2017-05-03 13:44:48.715-04	51	3	\N	2017-10-27 13:28:58.426-04	\N	2697	\N	\N	\N	USD	1	15000	15000	\N	b58cb328-e49b-430b-b210-86a1e25b2b19	\N	857	19b82371-b367-4bfa-bcf1-ff5f0e649b0e
11002	CREDIT	Mary Griffus	1000	USD	2016-04-27 00:41:38.126-04	2016-04-27 00:41:38.474-04	51	3	\N	2017-10-27 13:28:58.504-04	\N	\N	\N	\N	\N	\N	1	\N	1000	\N	2ab31b72-65e3-4059-bed1-57a6efdc25c0	\N	857	2ced2108-2003-4b93-843e-a1e34430a5b7
11068	CREDIT	Blurb donation	54000	USD	2016-10-06 12:06:35.799-04	2016-10-06 12:06:36.235-04	51	3	\N	2017-10-27 13:28:58.523-04	\N	\N	\N	\N	\N	\N	1	\N	54000	\N	6ba2b6b2-6cad-4be5-a417-b713a67b7cbd	\N	857	322c533f-abbd-402b-a28f-895ab6031cc2
11015	DEBIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	-110000	USD	2016-05-10 17:15:06.327-04	2016-05-10 17:15:06.677-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-110000	-110000	\N	bcc326aa-b610-426c-9221-f73431a1bb03	48	857	47f5e209-5e63-4ebb-97c7-1a8b1f52d95a
10943	CREDIT	Banner	2000	USD	2016-11-30 16:19:37.017-05	2016-11-30 16:19:37.251-05	51	3	\N	2017-10-27 13:28:58.703-04	\N	\N	\N	\N	\N	\N	1	\N	2000	\N	f7615e7e-a7c8-458b-8278-0c44228f9d38	\N	857	4e0fe764-59f7-446e-b18e-947c088aa130
10950	DEBIT	Banner	-2000	USD	2016-11-30 16:19:37.017-05	2016-11-30 16:19:37.251-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2000	-2000	\N	3a51c551-07d6-45e1-a653-b22996e29528	269	857	4e0fe764-59f7-446e-b18e-947c088aa130
11026	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	10875	USD	2017-03-13 13:05:28.744-04	2017-03-13 13:05:31.582-04	51	3	\N	2017-10-27 13:28:58.714-04	\N	\N	\N	\N	\N	\N	1	\N	10875	\N	122ee2fa-c69d-4b0e-83b5-9e8869aa3b9f	\N	857	4eefd965-ce2a-40dc-af0b-e4571462a501
11056	CREDIT	Network Development (Stickers)	62984	USD	2016-10-06 11:49:44.329-04	2016-10-06 11:49:44.472-04	51	3	\N	2017-10-27 13:28:58.766-04	\N	\N	\N	\N	\N	\N	1	\N	62984	\N	8fcd64ed-6d4c-4fb5-b5bb-c7ae3b61374c	\N	857	594bf8fc-c605-4f80-ac4b-031bc44d5349
11083	CREDIT	Conference Grant: Google/IO Alicia Carr	10000	USD	2016-10-04 11:25:59.981-04	2016-10-04 11:26:00.186-04	51	3	\N	2017-10-27 13:28:58.838-04	\N	\N	\N	\N	\N	\N	1	\N	10000	\N	e3919106-4a77-4933-8188-b8f52c112b31	\N	857	69298c4b-756b-4dcb-8142-b4938b5f4b3c
11074	CREDIT	Donation received via Meetup, less fees	788	USD	2016-10-04 12:46:13.302-04	2016-10-04 12:46:13.487-04	51	3	\N	2017-10-27 13:28:59.064-04	\N	\N	\N	\N	\N	\N	1	\N	788	\N	178efc38-794a-4911-b0ad-2bfd0c418936	\N	857	819b5869-271d-4469-bc40-1856ec37ff49
10960	DEBIT	Network Development	-20000	USD	2016-11-30 13:40:15.233-05	2016-11-30 13:40:15.446-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	fd9559d7-87ed-4578-bd92-33470a30cdad	292	857	8493f234-16b7-46bd-b7bf-283f2cf45af7
11090	CREDIT	Nike Donation	50000	USD	2016-06-10 00:08:56.525-04	2016-06-10 00:08:56.991-04	51	3	\N	2017-10-27 13:28:59.103-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	c25a6782-3d06-4297-935b-6a7bc1b2261b	\N	857	84d1e06f-c8a1-43aa-bb8a-834dbe45913c
11095	DEBIT	Nike Donation	-50000	USD	2016-06-10 00:08:56.525-04	2016-06-10 00:08:56.991-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-50000	-50000	\N	d58a5132-a3b7-4d45-8e74-1eeff23f5556	59	857	84d1e06f-c8a1-43aa-bb8a-834dbe45913c
10989	DEBIT	Donation from Marie W.	-900	USD	2016-10-11 20:26:47.2-04	2016-10-11 20:26:47.59-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-900	-900	\N	82707edf-683d-4b2e-a619-3d7d02cbfad7	284	857	8cc971b0-c066-465f-9dcb-08e8c65e5201
10964	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 17:38:57.006-05	2016-11-29 17:38:57.13-05	51	3	\N	2017-10-27 13:28:59.197-04	\N	\N	\N	\N	\N	\N	1	\N	631	\N	9cca4e1b-b7f8-46e7-92ec-15cb4d8128a9	\N	857	96ed78ef-1792-4e75-830c-10d4814b3a6c
10993	DEBIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	-2250	USD	2016-10-06 13:23:39.409-04	2016-10-06 13:23:39.459-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2250	-2250	\N	7ec0d013-2f4b-4138-bef4-ee4e8acd2588	13	857	9aa1e11a-9ace-4c1d-ab46-abb94116acd2
10983	CREDIT	Course Hero Hackathon Support	315000	USD	2016-10-07 10:39:15.069-04	2016-10-07 10:39:15.23-04	51	3	\N	2017-10-27 13:28:59.387-04	\N	\N	\N	\N	\N	\N	1	\N	315000	\N	e0f545e5-97c5-4c04-ae82-e01175d0eed6	\N	857	9b25deaf-b9d5-4253-9925-bb788d5524e7
11058	DEBIT	\N	-2175	USD	2017-05-03 20:12:19.814-04	2017-05-03 20:12:19.814-04	857	3	\N	\N	\N	2702	0	\N	0	USD	1	-2175	-2175	\N	dd11a2dd-c61f-42cd-856a-2d61dbc6ca12	259	857	b0d99568-d711-4dd5-bcb7-fc20ba675973
11022	CREDIT	\N	1200	USD	2017-05-04 14:58:24.9-04	2017-05-04 14:58:24.9-04	51	3	\N	2017-10-27 13:28:59.699-04	\N	2713	\N	\N	\N	USD	1	1200	1200	\N	e6ed0f98-bb10-4c13-a650-6e7cb2ce0f7e	\N	857	be93edd1-0f04-46ec-9871-f7621fb16663
11035	CREDIT	$500 OpenGov hackathon support - transaction and global development	43500	USD	2016-11-17 13:36:48.896-05	2016-11-17 13:36:49.046-05	51	3	\N	2017-10-27 13:28:59.812-04	\N	\N	\N	\N	\N	\N	1	\N	43500	\N	23e7d447-3ae3-4b74-90c3-465f18d7b17e	\N	857	cb55d829-3a21-4bf3-90c2-805f45c69aca
11041	DEBIT	$500 OpenGov hackathon support - transaction and global development	-43500	USD	2016-11-17 13:36:48.896-05	2016-11-17 13:36:49.046-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-43500	-43500	\N	2a4403cf-3a89-47d2-9b09-0526853fdf4d	59	857	cb55d829-3a21-4bf3-90c2-805f45c69aca
10966	CREDIT	Network Development (Thanks Atlassian) 	20000	USD	2016-10-12 01:06:05.058-04	2016-10-12 01:06:05.202-04	51	3	\N	2017-10-27 13:28:59.818-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	785d40b6-cdd3-46e1-932e-bf491fa7136a	\N	857	cb9fd4d3-b5f4-4ec4-9414-c775998a22d9
11045	CREDIT	Network Development	10000	USD	2016-10-11 12:52:38.277-04	2016-10-11 12:52:38.455-04	51	3	\N	2017-10-27 13:28:59.837-04	\N	\N	\N	\N	\N	\N	1	\N	10000	\N	ae44ff82-f688-49ce-b1df-fa97639c37cc	\N	857	ccadabfe-df2e-48d8-b387-f9b49496aaf3
11051	DEBIT	Network Development	-10000	USD	2016-10-11 12:52:38.277-04	2016-10-11 12:52:38.455-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10000	-10000	\N	f0418b87-01f6-4d4b-a92b-ac5a1406c671	59	857	ccadabfe-df2e-48d8-b387-f9b49496aaf3
10973	CREDIT	Network Development (100%)	10000	USD	2016-10-07 16:05:13.011-04	2016-10-07 16:05:13.112-04	51	3	\N	2017-10-27 13:28:59.865-04	\N	\N	\N	\N	\N	\N	1	\N	10000	\N	7868c696-6419-4c83-ab76-454e33c51127	\N	857	d0a4df18-061d-4fa0-a003-135a3981f5de
10940	DEBIT	Global Development for Meetup Fee	-4900	GBP	2016-12-23 12:02:53.836-05	2016-12-23 12:02:53.991-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-4900	-4900	\N	1e1b9e50-2fc4-4654-b938-49596e81b08c	264	857	de03d6ba-2e86-497b-b23c-a3dcbe9c03f4
10969	DEBIT	Network Development	-20000	USD	2016-11-29 17:43:53.719-05	2016-11-29 17:43:53.971-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	f09403fe-da79-475c-b4f5-24ea7358f395	286	857	f9f86389-baae-43b7-8f64-026ca4a0004f
11085	CREDIT	Deposit- We Rise Conference Hosting Location	500000	USD	2017-05-16 17:51:10.574-04	2017-05-16 17:51:10.574-04	690	3206	\N	\N	\N	\N	\N	\N	0	USD	1	500000	500000	1123	49b4cf06-7999-4aca-9a89-b233c17dbd59	12	857	6370bc9d-e41f-4d7c-b2f2-dd73c8ee7487
11100	CREDIT	Google I/O	51480	USD	2017-03-27 13:11:39.25-04	2017-03-27 13:11:39.275-04	835	69	2265	\N	\N	\N	\N	\N	1480	USD	1	51480	50000	952	afeecc7c-60d7-48b4-b71c-ac5c8020ffec	12	857	a91ab41c-0e06-4373-826c-df6b200883a0
11102	CREDIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	4431	USD	2017-02-07 13:40:27.475-05	2017-02-07 13:40:27.96-05	826	171	1718	\N	\N	\N	\N	\N	\N	\N	1	4431	4431	736	7f96e461-31ee-4986-997e-f6ba3f437b17	59	857	5a3fe757-d473-451e-99f8-ff9fcf3201f8
11113	CREDIT	Travel Scholarship for WWCode Director	40970	GBP	2017-04-17 18:32:02.724-04	2017-04-17 18:32:02.724-04	51	3	\N	\N	\N	\N	\N	\N	0	GBP	1	40970	40970	768	6293c580-2570-493e-be55-c0fe3641799a	278	857	507bc5eb-5394-405d-8a0f-7cd8812b5426
11116	CREDIT	Conference Grant	70000	USD	2016-05-19 15:07:13.723-04	2016-06-14 14:14:22.082-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	70000	70000	178	3c51a63e-55e5-4d5b-b5e4-60933d5f8a3d	3	857	4991fa9a-ed30-45cc-8327-0d92de372a04
11124	CREDIT	Meetup Fees	6000	USD	2016-12-28 10:44:44.222-05	2016-12-28 10:44:44.222-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	658	a30125a7-f006-4b99-9b20-df24bd2c2280	4	857	4defe036-0ef0-43c5-94b1-ad466662a505
11013	DEBIT	\N	-41370	USD	2016-09-13 00:15:04.709-04	2016-09-13 00:15:04.709-04	788	1178	737	\N	\N	653	2500	\N	1130	USD	1	-41370	-50000	\N	8bbb12e5-74f1-44ff-af0a-e87d2417db87	2	857	240c5d59-452e-4b7e-b10a-34fa1f12b237
11020	CREDIT	WWC Boulder- April event's food	14100	USD	2016-04-06 20:00:00-04	2016-06-14 14:14:21.989-04	755	68	320	\N	\N	\N	\N	\N	\N	\N	1	14100	14100	137	d1231030-950c-4d8d-af03-ace011fda4b1	15	857	c295be8f-b7a0-401b-a1ed-0754d682b341
10947	CREDIT	Leadership development - conference stipend Google I/O	130000	USD	2016-11-30 16:07:12.142-05	2016-11-30 16:07:12.419-05	51	3	\N	2017-10-27 13:28:58.324-04	\N	\N	\N	\N	\N	\N	1	\N	130000	\N	2117aeef-1b8d-4fc3-b5db-cf4eb492243d	\N	857	0cb06fc3-afb6-4412-bdcb-1f3a289a7468
10944	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 11:59:24.039-05	2016-12-23 11:59:24.291-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	646349fb-502e-485e-8deb-d606e19d4aef	263	857	1814f900-448d-4ff9-b68e-729da0e7152e
11009	DEBIT	Mary Griffus	-1000	USD	2016-04-27 00:41:38.126-04	2016-04-27 00:41:38.474-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1000	-1000	\N	215e5f19-c8a1-48e9-9216-c6a8648e337a	13	857	2ced2108-2003-4b93-843e-a1e34430a5b7
11077	DEBIT	Blurb donation	-54000	USD	2016-10-06 12:06:35.799-04	2016-10-06 12:06:36.235-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-54000	-54000	\N	f8e0dbe6-be13-4bc9-bb1b-76f31ef93d5d	3	857	322c533f-abbd-402b-a28f-895ab6031cc2
11036	CREDIT	Director t-shirt	3325	USD	2016-10-17 17:00:51.295-04	2016-10-17 17:00:51.425-04	51	3	\N	2017-10-27 13:28:58.62-04	\N	\N	\N	\N	\N	\N	1	\N	3325	\N	d0340a3c-39b3-415b-b112-47ffd747be45	\N	857	3ad71671-4b83-4909-b0bb-13e3fbe2a636
11040	DEBIT	Director t-shirt	-3325	USD	2016-10-17 17:00:51.295-04	2016-10-17 17:00:51.425-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3325	-3325	\N	fbce2321-f626-4d5d-aed8-4e3c77b02154	298	857	3ad71671-4b83-4909-b0bb-13e3fbe2a636
11048	DEBIT	Director t-shirt	-2860	USD	2016-10-17 16:55:47.647-04	2016-10-17 16:55:47.671-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2860	-2860	\N	01e94eb8-0aba-4072-81f3-783347bf6197	12	857	436f78f3-f83b-4ec4-9ad9-1935b514a186
11037	DEBIT	WWCode shirt Grisel	-3649	USD	2016-10-17 16:48:59.282-04	2016-10-17 16:48:59.313-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3649	-3649	\N	ccdf82f7-8e53-43c8-83ff-846597a90d58	282	857	4bbbb64c-1520-49dd-ae63-dea31070d6a7
11033	DEBIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	-10875	USD	2017-03-13 13:05:28.744-04	2017-03-13 13:05:31.582-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10875	-10875	\N	b6acc6c3-be11-436d-80d0-4a3d55435741	12	857	4eefd965-ce2a-40dc-af0b-e4571462a501
10957	CREDIT	CONNECT 2016	4536939	USD	2016-11-29 16:44:20.041-05	2016-11-29 16:44:20.185-05	51	3	\N	2017-10-27 13:28:58.761-04	\N	\N	\N	\N	\N	\N	1	\N	4536939	\N	94dfe287-2c46-4d10-9023-02890e5d379c	\N	857	592aca97-6912-42fd-8902-ab2eadcef214
10967	CREDIT	Network Development	19550	USD	2016-10-12 00:30:34.678-04	2016-10-12 00:30:34.772-04	51	3	\N	2017-10-27 13:28:58.771-04	\N	\N	\N	\N	\N	\N	1	\N	19550	\N	315cf8ab-6807-4f51-b246-abb9ef0e8421	\N	857	5adef262-f8a8-46ac-91d9-63c3ebd3c898
11050	CREDIT	Network Development +	50000	USD	2016-10-07 16:24:13.595-04	2016-10-07 16:24:13.706-04	51	3	\N	2017-10-27 13:28:58.783-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	efa0ec12-e3c7-4ca4-ae0b-eb412a34a825	\N	857	5c492fe3-dd05-4d31-9fde-ddcb039abf05
11024	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 12:08:24.515-05	2016-12-23 12:08:24.709-05	51	3	\N	2017-10-27 13:28:58.822-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	91f3f072-9f25-4b1a-9c07-90bd7ea32801	\N	857	66c02d90-4a96-498b-9039-1e96a68a4fa8
11030	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 12:08:24.515-05	2016-12-23 12:08:24.709-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	1155723d-c4e7-480d-b473-5bbde5d7bd57	265	857	66c02d90-4a96-498b-9039-1e96a68a4fa8
11076	CREDIT	Donation via Meetup	2036	USD	2016-10-04 12:42:35.996-04	2016-10-04 12:42:36.119-04	51	3	\N	2017-10-27 13:28:58.985-04	\N	\N	\N	\N	\N	\N	1	\N	2036	\N	dcb2a98d-f12b-4802-8a0a-6b340ba077d0	\N	857	745e6b81-6671-4aa0-b901-7c2665784af4
11081	DEBIT	Donation via Meetup	-2036	USD	2016-10-04 12:42:35.996-04	2016-10-04 12:42:36.119-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2036	-2036	\N	37e3ad13-5d06-499f-9e3c-f4e6e22a41d0	300	857	745e6b81-6671-4aa0-b901-7c2665784af4
11053	DEBIT	Network budget pre Open Collective 	-162598	USD	2016-10-12 01:01:43.648-04	2016-10-12 01:01:43.828-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-162598	-162598	\N	941a0dd3-ebdb-471c-8faf-b16f39d9c378	264	857	74edd83a-2f89-4f72-ab08-e66027a2163d
11066	CREDIT	Network Development	10000	USD	2016-10-04 17:50:13.582-04	2016-10-04 17:50:13.787-04	51	3	\N	2017-10-27 13:28:59.009-04	\N	\N	\N	\N	\N	\N	1	\N	10000	\N	8e713cfd-6d74-429f-a680-214b13ed8c8a	\N	857	75a874f1-b227-4123-9db6-4e1ae17401bd
11073	DEBIT	Network Development	-10000	USD	2016-10-04 17:50:13.582-04	2016-10-04 17:50:13.787-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10000	-10000	\N	38121907-dff7-473c-81a8-95a4e6eca76a	15	857	75a874f1-b227-4123-9db6-4e1ae17401bd
11063	CREDIT	\N	75000	USD	2017-05-03 13:44:10.84-04	2017-05-03 13:44:10.84-04	51	3	\N	2017-10-27 13:28:59.023-04	\N	2696	\N	\N	\N	USD	1	75000	75000	\N	0bddbf56-4e9d-4f71-bf50-d408856c8640	\N	857	783084af-de7c-4961-b369-aacf66470f01
11069	DEBIT	\N	-75000	USD	2017-05-03 13:44:10.84-04	2017-05-03 13:44:10.84-04	857	3	\N	\N	\N	2696	0	\N	0	USD	1	-75000	-75000	\N	f948916d-3dc1-4b25-8555-92dc69ba31d3	12	857	783084af-de7c-4961-b369-aacf66470f01
10954	CREDIT	Network Development	20000	USD	2016-11-30 13:40:15.233-05	2016-11-30 13:40:15.446-05	51	3	\N	2017-10-27 13:28:59.099-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	61b5e99e-4e76-4c95-82e5-1d03f313eac1	\N	857	8493f234-16b7-46bd-b7bf-283f2cf45af7
10984	CREDIT	Donation from Marie W.	900	USD	2016-10-11 20:26:47.2-04	2016-10-11 20:26:47.59-04	51	3	\N	2017-10-27 13:28:59.143-04	\N	\N	\N	\N	\N	\N	1	\N	900	\N	fce50676-580b-44bf-b1b3-858d1b70bb8e	\N	857	8cc971b0-c066-465f-9dcb-08e8c65e5201
11044	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 16:50:42.245-04	2016-10-17 16:50:42.273-04	51	3	\N	2017-10-27 13:28:59.153-04	\N	\N	\N	\N	\N	\N	1	\N	3649	\N	4368291a-d6ad-4565-887f-e3855fb29edd	\N	857	8ecad7e6-c62d-4289-b93c-f88178132020
11000	DEBIT	Sponsorship: AT&T Hackathon Prize	-1000000	USD	2016-10-04 11:40:37.72-04	2016-10-04 11:40:37.853-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1000000	-1000000	\N	c0fced52-4034-4fc0-b5c8-84cda56c3f3c	12	857	9140a174-9e7e-4864-8157-b58b882a7c2c
10970	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 17:38:57.006-05	2016-11-29 17:38:57.13-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-631	-631	\N	d03e7045-a9b2-4c5e-961f-9136048d07ae	47	857	96ed78ef-1792-4e75-830c-10d4814b3a6c
11096	DEBIT	Women Techmaker WWCode Partnership Grant	-120000	USD	2016-05-19 15:10:52.797-04	2016-05-19 15:10:54.053-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-120000	-120000	\N	d21063cd-26a1-41f9-8406-71d5956a077f	12	857	9c68533f-e1fe-4007-8a30-7394380c5d80
11027	DEBIT	\N	-1200	USD	2017-05-04 14:58:24.9-04	2017-05-04 14:58:24.9-04	857	3	\N	\N	\N	2713	0	\N	0	USD	1	-1200	-1200	\N	33c94a75-0816-45bc-8b16-33cc9c718ebc	430	857	be93edd1-0f04-46ec-9871-f7621fb16663
11055	CREDIT	Network budget pre Open Collective 	406519	USD	2016-10-06 14:36:30.275-04	2016-10-06 14:36:30.298-04	51	3	\N	2017-10-27 13:28:59.782-04	\N	\N	\N	\N	\N	\N	1	\N	406519	\N	532e9995-4d4e-4652-a84a-a9b374fdc780	\N	857	c91bbcc6-c555-4640-94f8-a7604335f5c8
11060	DEBIT	Network budget pre Open Collective 	-406519	USD	2016-10-06 14:36:30.275-04	2016-10-06 14:36:30.298-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-406519	-406519	\N	bfe0b8fe-de0d-4cff-be4f-ba8c807e8bbf	13	857	c91bbcc6-c555-4640-94f8-a7604335f5c8
11064	CREDIT	\N	30000	USD	2017-05-03 13:33:13.688-04	2017-05-03 13:33:13.688-04	51	3	\N	2017-10-27 13:28:59.806-04	\N	2694	\N	\N	\N	USD	1	30000	30000	\N	1fb4ee6c-6154-45df-bd73-d9d3a4c72711	\N	857	cb400d66-baf0-4462-9d1d-ac0003e755f1
11070	DEBIT	\N	-30000	USD	2017-05-03 13:33:13.688-04	2017-05-03 13:33:13.688-04	857	3	\N	\N	\N	2694	0	\N	0	USD	1	-30000	-30000	\N	5834584a-7070-4ada-8be9-5b8ccd2bb2ed	51	857	cb400d66-baf0-4462-9d1d-ac0003e755f1
10974	DEBIT	Network Development (Thanks Atlassian) 	-20000	USD	2016-10-12 01:06:05.058-04	2016-10-12 01:06:05.202-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-20000	-20000	\N	b6174e4d-5372-49e2-9422-cf873122e213	266	857	cb9fd4d3-b5f4-4ec4-9414-c775998a22d9
10980	DEBIT	Network Development (100%)	-10000	USD	2016-10-07 16:05:13.011-04	2016-10-07 16:05:13.112-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10000	-10000	\N	236780e6-56ff-45a3-9379-5962d4f4ac94	300	857	d0a4df18-061d-4fa0-a003-135a3981f5de
10991	CREDIT	Donation via meetup	2363	USD	2016-10-04 18:14:59.695-04	2016-10-04 18:14:59.884-04	51	3	\N	2017-10-27 13:29:00.143-04	\N	\N	\N	\N	\N	\N	1	\N	2363	\N	c73f3256-0b49-47f3-99f7-7fa1deb2a892	\N	857	df892894-8ed7-4fde-a276-604f3e6762f5
10999	DEBIT	Donation via meetup	-2363	USD	2016-10-04 18:14:59.695-04	2016-10-04 18:14:59.884-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-2363	-2363	\N	209ebdd2-9523-4000-8ac4-282887bb4a0e	272	857	df892894-8ed7-4fde-a276-604f3e6762f5
10996	DEBIT	Network Development	-17375	USD	2016-10-04 18:15:45.133-04	2016-10-04 18:15:45.269-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-17375	-17375	\N	e8c276db-db5e-4168-a5fa-044a58dd86c8	272	857	ef4b6484-f984-419f-8c86-7fee2f796fde
10963	CREDIT	Network Development	20000	USD	2016-11-29 17:43:53.719-05	2016-11-29 17:43:53.971-05	51	3	\N	2017-10-27 13:29:00.487-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	004c130a-3d5b-4cd4-a13e-a5fc31e6d4ea	\N	857	f9f86389-baae-43b7-8f64-026ca4a0004f
11092	CREDIT	Meetup Transaction Fee	163	USD	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.849-04	51	3	\N	2016-06-14 14:14:22.458-04	\N	\N	\N	\N	\N	\N	1	163	163	82	3686ae94-a583-4032-8b91-c77ec9bafe38	4	857	3112581d-3aa6-42f5-9358-0994999761ad
11101	CREDIT	WWCode CONNECT Conference Travel Stipend	88760	GBP	2017-04-17 17:18:35.523-04	2017-04-17 17:18:35.581-04	830	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	88760	85000	1016	bd15e8ea-4f11-4460-a11b-696595e623a6	278	857	d10bb6d5-365a-43e4-9d44-fd54e6bcdc61
11103	CREDIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	88760	GBP	2017-03-27 12:01:27.19-04	2017-03-27 12:01:27.295-04	830	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	88760	85000	926	93f8aaea-7927-4dc8-a2d7-4db45a5048a1	278	857	c9208187-1309-4b49-832f-804065f9f6ec
11115	CREDIT	Atlanta IWD Event	235699	USD	2017-04-17 15:17:23.032-04	2017-04-17 15:17:23.032-04	51	3	\N	\N	\N	\N	\N	\N	0	USD	1	235699	235699	998	f0a6c248-00dc-45d9-afe9-4da783bce5ef	12	857	a5e7d6c4-9afa-4c81-ac28-4882f0b806f4
11118	CREDIT	WePay Fee	400	USD	2016-04-10 20:00:00-04	2016-06-14 14:14:21.907-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	400	400	104	7f087c00-aae2-44f6-bcfb-a24f8d0de17d	48	857	87840f56-6f7f-4e76-814f-3dcbeeb224bf
11119	CREDIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	11815	USD	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.839-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	11815	11815	74	c0a2763e-efdb-45c0-8267-1c6712db532b	14	857	b50764c5-6e92-4f69-8996-f87006aeaa24
11127	CREDIT	Meetup Fees	6000	MXN	2016-12-27 12:57:54.314-05	2016-12-27 12:57:54.314-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	650	eda8d4e8-1a9a-48b8-802d-1918f66dec70	282	857	c3e68a48-e00c-4f74-8974-5b9603a76a10
11129	CREDIT	Meetup Fees	6000	AUD	2016-12-27 12:54:00.843-05	2016-12-27 12:54:00.843-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	649	cc18ee18-9399-4dd3-b0d7-8751a400111d	281	857	cf06b300-88e9-4077-9eb9-1ea6d5c1f7fe
11137	CREDIT	Meetup Fees	6000	CAD	2016-12-28 11:21:52.469-05	2016-12-28 11:21:52.469-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	663	1cb74e37-b8ba-470a-a53e-e7f27d97ec24	291	857	3189a271-a89b-4e67-bf67-a1cc37bc5c99
11145	CREDIT	February Lightning Talks food	11020	USD	2017-03-14 13:17:53.891-04	2017-03-14 13:17:53.957-04	847	28	1893	\N	\N	\N	\N	\N	340	USD	1	11020	10680	820	3adc5ad4-c6bd-4aac-9ff6-08efdb98423b	2	857	b10a7260-c6ef-4e93-8ca5-a8d015161add
459	DEBIT	WWC Boulder- April event's food	-14100	USD	2016-04-06 20:00:00-04	2016-06-14 14:14:21.989-04	15	68	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14100	137	d79ac9f7-4158-4fea-be4d-6c95b1858509	755	857	c295be8f-b7a0-401b-a1ed-0754d682b341
11131	CREDIT	Meetup Fees	4900	GBP	2016-12-27 12:34:46.469-05	2016-12-27 12:34:46.469-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	4900	4900	647	d38956f4-dd5b-4a5a-a294-9c069e68f6aa	278	857	5ddd1fa6-8ded-49d1-9668-a21f69cb19cc
11132	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:23:35.936-05	2016-12-27 11:23:35.936-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	634	aa3b9e1e-c56b-4454-9f75-db85afc432ab	13	857	f3ebed3b-5fcb-4103-b58d-9f12e7afcce3
11138	CREDIT	Meetup Fees	6000	USD	2016-12-28 10:58:50.078-05	2016-12-28 10:58:50.078-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	662	b2fa3b7a-24fe-4ef3-8584-a49b3f9ac78f	241	857	4252ec62-e70b-4b16-ba38-ac9ec4533458
11141	CREDIT	Meetup Fees	6000	USD	2016-12-23 14:41:48.315-05	2016-12-23 14:41:48.315-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	627	c75e71f0-ea81-4909-8d0b-005b338555c0	269	857	a985d390-eb74-4dc0-a8f9-16e7fdccb15e
11148	CREDIT	Food for October Hack Night.	7773	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	843	1325	\N	\N	\N	\N	\N	\N	\N	\N	1	7773	7700	484	a7e3e903-1526-47d8-859b-9955965909bd	273	857	1eb8f1e2-2a21-4a3e-994d-ac842ccc605b
11151	CREDIT	IWD event -- wine for event	10044	USD	2017-03-14 13:22:31.446-04	2017-03-14 13:22:31.46-04	763	70	1893	\N	\N	\N	\N	\N	312	USD	1	10044	9732	900	af530f4f-d6a8-4586-9a82-dd2cf5ab9fbb	12	857	cd5da3ee-4796-477e-8bac-7d07878c6422
11154	CREDIT	Meetup Fees	6000	USD	2016-12-23 11:37:59.322-05	2016-12-23 11:37:59.322-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	613	4ae10144-6172-4779-b78b-70257ab88a0d	260	857	9603f1dd-41b6-4fc7-8be5-032b4957e625
11159	CREDIT	Event suplies	2198	USD	2016-12-13 13:43:16.329-05	2016-12-13 13:43:17.27-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	2198	2198	\N	b77ac988-7d0f-43df-9383-8e34d4ad3cc9	59	857	5f208dfc-2381-430b-a50b-f671ab0c6a6c
11168	CREDIT	Network budget pre open collective	55923	USD	2016-11-29 19:18:08.154-05	2016-11-29 19:18:07.832-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	55923	55923	\N	d69f012a-0420-44c0-be6d-a560abe40dbf	285	857	bc1aa1c4-ca83-4598-9bcf-2854e8d32644
11171	CREDIT	Conference Grant	50000	USD	2016-05-04 17:14:39.136-04	2016-06-14 14:14:22.01-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	50000	50000	145	75b430fa-4cca-44b6-8feb-f618961729bb	13	857	55244ccb-b373-42e4-8602-2308add309e7
11178	CREDIT	Network budget pre Open Collective	230712	USD	2016-10-07 16:01:03.429-04	2016-10-07 16:01:03.535-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	230712	230712	\N	37181899-3c55-4ffd-85e5-b242df1ed642	300	857	df70886f-18c0-474a-9e15-0949902f967f
11187	CREDIT	Business cards and stickers	11948	USD	2017-05-16 18:00:30.412-04	2017-05-16 18:00:30.412-04	696	142	\N	\N	\N	\N	\N	\N	0	USD	1	11948	11948	1007	ecd0b76e-217a-48dd-92a1-f58db9702fcc	48	857	b3bdd42c-f7d9-4e3d-9b7e-292c34b99103
11190	CREDIT	Drinks at Sept monthly event	2192	USD	2016-10-04 18:06:33.802-04	2016-10-04 18:06:34.357-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	2192	2192	\N	f1b43562-7f61-45ad-b681-d683e35c3fa3	15	857	cd5bcb7f-5ca9-4715-abd4-740e65ab31fa
11197	CREDIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	6000	GBP	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	830	1333	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	506	47674e7c-c35a-4630-b3a2-fe0ea8a8cd3f	278	857	dff4e422-9a6f-4ad6-97c1-7ea0c90b3f3f
11201	CREDIT	European Leadership Development Workshop -- Transportation, Flight	4728	EUR	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	793	1378	\N	\N	\N	\N	\N	\N	\N	\N	1	4728	4700	494	f459ba7a-fb20-4362-91c3-c2f0f7704bde	301	857	febdded6-3269-4753-bde6-b30805b315e4
11203	CREDIT	WwConnect Conference	658	USD	2016-03-19 20:00:00-04	2016-06-14 14:14:21.806-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	658	658	63	56ccad97-4aa0-4ea9-851e-017c380b0692	14	857	6f723e93-7123-410d-a48a-6c6f1961b104
11205	CREDIT	travel to NY for bell ringing at NYSE	30000	USD	2017-01-25 13:20:51.642-05	2017-01-25 13:20:54.592-05	763	70	1476	\N	\N	\N	\N	\N	\N	\N	1	30000	30000	743	8ef945c0-ba81-4c87-8b23-a8b81c8e195d	12	857	bd75ae01-53d9-4697-91f9-db3070343709
11214	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 15:51:28.361-04	2016-10-11 15:51:28.677-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	370000	370000	\N	9970a2ef-0070-449e-9fad-1ca23cbdab20	262	857	64ca78a1-0775-48fe-9f65-d38693330ec9
11215	CREDIT	Global Development	150	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	51	3	\N	2016-06-14 14:14:22.479-04	\N	\N	\N	\N	\N	\N	1	150	150	93	9a32a509-20af-4af5-9aab-e20d694140f9	4	857	6b5d799a-eabc-41f6-8ab2-4c9de7391096
11222	CREDIT	CONNECT 2016	2452	USD	2016-04-25 20:00:00-04	2016-06-14 14:14:21.896-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2452	2452	99	228f5d04-943e-4225-9b15-ff942ca93f58	14	857	a489e50d-2ce2-4ea4-8a83-5c8dc5fd7c08
11231	CREDIT	Meetup Fees	6000	USD	2016-12-27 12:27:09.602-05	2016-12-27 12:27:09.602-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	644	e907b195-2e48-48b9-8285-d1a6cb4d47ba	279	857	272fcc84-a0c8-4167-89d7-1462ca0c908b
11234	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:55:07.385-05	2016-12-27 11:55:07.385-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	641	1168d8ab-f301-4544-914a-ab99d750282a	275	857	e4242037-8c8e-4a62-866c-9c472b81371b
11239	CREDIT	dinner - downpament	70000	USD	2016-11-03 15:36:06.461-04	2016-11-03 15:36:06.793-04	51	3	1115	\N	\N	\N	\N	\N	\N	\N	1	70000	70000	\N	64a3a954-2a2b-4398-bcec-c292f7592ed3	300	857	fdd3cf03-f4f6-483c-a5f6-b2c1e7ececf2
11243	CREDIT	Plaques for IWD awards ceremony​ 	56402	USD	2017-03-15 09:57:14.454-04	2017-03-15 09:57:14.471-04	835	69	2149	\N	\N	\N	\N	\N	1619	USD	1	56402	54783	888	4b8f06f5-1866-487b-bd7d-d68c72ced0e3	12	857	6cd3b0b0-bb36-469e-aa7f-2c09518367d3
11251	CREDIT	Conference stipend - Gen A.	102409	GBP	2016-10-07 09:10:14.088-04	2016-10-07 09:10:14.841-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	102409	102409	\N	7cf56089-dc65-4960-bd63-3561c51a6696	278	857	82f5f6a3-2c5c-473c-bb35-ddb3343be902
11254	CREDIT	90/10 split: AT&T Sponsorship (April 2015)	100000	USD	2016-10-04 11:44:28.558-04	2016-10-04 11:44:28.558-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	100000	100000	389	9979a5c7-b183-427a-be82-addab9258d56	12	857	b8478c19-3b81-4e5f-b308-75a08be8df82
11256	CREDIT	Global Development	10000	USD	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.849-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	10000	10000	80	9de7890e-84d7-4121-8eb2-f1ac7a4df208	59	857	cc6c2efe-9f1b-480d-9dab-5dba47f1e539
11258	CREDIT	Pizza for July monthly event.	12555	USD	2016-08-16 10:52:47.781-04	2016-08-16 10:52:47.799-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	12555	12555	\N	b9f0afa4-647a-414c-ab5b-8e97f8745417	15	857	c0cb2ef4-6880-422e-b5ea-d9bcd3144b6e
11266	CREDIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	101200	USD	2017-05-04 15:06:09.002-04	2017-05-04 15:06:09.002-04	51	3	\N	\N	\N	\N	\N	\N	0	USD	1	101200	101200	1099	78c4632b-9cab-42a5-a085-307db65b1150	430	857	2bb6c712-4be3-4889-b164-aebcfc04f70b
11269	CREDIT	Leadership Tshirt Order	2698	USD	2016-12-07 11:51:43.784-05	2016-12-07 11:51:44.214-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	2698	2698	\N	fc328a1b-8980-4fe1-b30b-f613ba871572	59	857	456a3123-ed0c-4099-92f1-a34da97a9136
11276	CREDIT	Career development event w/ Mike Ross	65000	USD	2016-10-11 20:42:04.584-04	2016-10-11 20:42:04.834-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	65000	65000	\N	43257701-cd82-4da2-9e27-1937780b3c8f	48	857	fc02a5bc-12ac-4e8c-857f-28b57a9eaad7
11278	CREDIT	90/10 split: Turner matching donation	500	USD	2016-10-04 12:06:02.036-04	2016-10-04 12:06:02.036-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	500	500	393	81a3d2f4-2c59-4515-989a-5b7c8732ccda	12	857	0ad414b0-48e5-4b04-8bf0-e5459f5b78f0
11287	CREDIT	FedEx Office	3418	USD	2016-01-24 19:00:00-05	2016-06-14 14:14:22.114-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3418	3418	195	44c8469d-256f-4d6b-9235-14ad680dfc26	48	857	1938625a-2e3f-46d3-a165-7a04a0492706
11289	CREDIT	Conference stipend Elizabeth M.	75000	USD	2016-10-11 12:01:27.317-04	2016-10-11 12:01:28.351-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	75000	75000	\N	373a7228-3d14-41e9-9522-bd1d48a2409d	195	857	6cf824bf-5df7-4fa5-83bd-fce763971a65
11290	CREDIT	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	70000	USD	2016-11-01 11:16:29.544-04	2016-11-01 11:16:30.012-04	51	3	1044	\N	\N	\N	\N	\N	\N	\N	1	70000	70000	\N	4d0c2d00-c75b-4c82-aee3-5253ce6efc35	2	857	ddf2e445-d145-47f6-a9d9-4285fd402eef
11298	CREDIT	Nike Dinner	1000	USD	2016-03-17 20:00:00-04	2016-06-14 14:14:21.805-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	62	1988b63c-7cea-4bad-a71b-fc52379de36d	14	857	b29cf052-aa10-4396-a9fa-8f215ba011fc
11301	CREDIT	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	10294	USD	2016-08-02 09:38:05.215-04	2016-08-02 09:38:05.831-04	766	31	320	\N	\N	\N	\N	\N	\N	\N	1	10294	10294	255	1ee43308-9b3d-4493-ad07-ac2ebae17872	14	857	f1f0d240-a25e-4965-a623-22e90f0d80cd
11309	DEBIT	Recurring subscription	-52	USD	2016-04-02 11:43:33.706-04	2016-04-16 16:40:58.808-04	704	126	93	\N	\N	95	5	\N	33	USD	1	-52	-100	\N	87a41d47-209c-4920-9260-126aa4155201	13	857	2365e886-215b-47ac-850a-0cf7cc8c2b33
11311	DEBIT	Recurring subscription	-52	USD	2016-06-02 01:48:36.714-04	2016-06-02 01:48:36.745-04	704	126	93	\N	\N	95	5	\N	33	USD	1	-52	-100	\N	8e909399-99d1-4aa3-80b1-5e19f33d5c49	13	857	cb2a8753-729b-4448-b1ca-2c67bf43bb2c
11315	CREDIT	April 4 Lightning Talks	13315	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.091-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	13315	13315	183	e398a87b-5eb6-41d5-ba7c-a083d5a20e12	2	857	aa353515-b87f-4363-8cd8-c6b2966286b4
11322	CREDIT	Thank you gift to an amazing sponsor!	1700	USD	2016-11-22 07:31:00.49-05	2016-11-22 07:31:00.691-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	1700	1700	501	45c3f4d6-f7c4-47bf-a09a-b3c5d52fa9c3	59	857	8037fb93-1b42-4e1a-8b62-51b14a044d14
11330	DEBIT	Recurring subscription	-798	USD	2016-12-09 23:43:00.244-05	2016-12-09 23:43:00.244-05	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	649c0879-3e95-4699-940f-2b289f8015d4	241	857	c4423122-2e7b-4cc2-a50b-bd812885ba7d
11142	CREDIT	Meetup Fees	6000	USD	2016-12-23 14:38:46.818-05	2016-12-23 14:38:46.818-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	626	577af784-8d76-493f-b9f3-df6418c41589	268	857	72bc38f9-469a-4123-8824-e7c06ea1afdb
11150	CREDIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	11500	USD	2017-05-16 17:55:26.725-04	2017-05-16 17:55:26.725-04	797	32	\N	\N	\N	\N	\N	\N	0	USD	1	11500	11500	1119	9f448ba4-f63f-4177-82b5-f1c025c49ae4	14	857	c46e5a86-e1fe-4bf2-a8d8-74beed69e911
11156	CREDIT	Meetup Fees	6000	USD	2016-12-21 13:53:46.984-05	2016-12-21 13:53:46.984-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	607	e47c42b4-ad16-4ead-a7ec-d4d20c5fb5b7	2	857	11a7ae27-e2e0-4401-9115-59e0e16fec2d
11163	CREDIT	WWCode Seattle network retreat	6207	USD	2016-12-06 11:57:26.568-05	2016-12-06 11:57:26.935-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	6207	6207	\N	a8d86a0e-977b-431b-94e2-38386e166e0c	14	857	2f38f633-77eb-41f6-805e-b71027eff4a4
11165	CREDIT	Banner	2000	USD	2016-11-30 16:33:38.691-05	2016-11-30 16:33:38.827-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2000	2000	\N	0de43d5b-1059-4076-a96a-ab71f7e95e92	263	857	18d9d4f9-be19-48f1-a8eb-f0627e094485
11173	CREDIT	Pizza for our monthly October event	9276	USD	2016-10-31 14:07:11.805-04	2016-10-31 14:07:12.736-04	51	3	1024	\N	\N	\N	\N	\N	\N	\N	1	9276	9276	\N	d48ef9d2-1a73-4834-b232-63e3e80fd6ca	15	857	2f6825e0-65d6-47c0-8c36-5d92238f5a76
11177	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:50:06.414-05	2016-12-27 11:50:06.414-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	639	e5c23140-1232-494b-9932-467f0e61887b	273	857	b1f03f83-654b-49f2-a616-c2b3fc95b383
11180	CREDIT	Director t-shirt	2898	USD	2016-10-17 16:57:20.051-04	2016-10-17 16:57:20.056-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2898	2898	\N	a164d320-8208-4f53-b0f4-07be20227eb3	3	857	710950d8-b7d0-4f85-ac4f-f8a75b0004a5
11184	CREDIT	Google I/O stipend	50000	USD	2016-10-11 12:00:21.246-04	2016-10-11 12:00:22.203-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	50000	50000	\N	f3bb786a-d55c-49c5-bc96-cd17ccda09fc	195	857	60541c36-abfd-4cb3-b850-b59e58de8adf
11188	CREDIT	Snacks and batteries for our robots	1554	USD	2017-05-16 18:00:04.449-04	2017-05-16 18:00:04.449-04	696	142	\N	\N	\N	\N	\N	\N	0	USD	1	1554	1554	1084	468a4e86-65a2-40db-bcf7-bba6ff894724	48	857	54debbf6-1c43-4cd2-9873-748646436be7
11196	CREDIT	Feb 4 hack night	10284	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.784-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	10284	10284	53	d002b92e-8ccc-4461-97c5-979e1fd772b6	2	857	523315a4-2381-44a1-b0e0-8add9711d0b9
11204	CREDIT	WwConnect planning meeting	4656	USD	2016-03-10 19:00:00-05	2016-06-14 14:14:21.794-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	4656	4656	59	03e54832-965d-4819-a5d4-44763018e08a	14	857	029190b6-6c02-4437-87d4-fcbc5345d830
11206	CREDIT	Photographer: Mike Ross	65000	USD	2016-01-05 19:00:00-05	2016-06-14 14:14:22.114-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	65000	65000	193	62535664-eba2-4cbe-981c-39d2fb163cf1	48	857	daedaac3-b820-4fe9-b5fb-f5b4d7af7e74
11209	CREDIT	Minimum Fee - May	1000	MXN	2016-08-15 15:22:45.367-04	2016-08-15 15:22:45.38-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	0151cb10-b938-4631-9110-ad99c9e5cd5d	10	857	9523eaf7-37af-4326-b48f-56c43b2a4226
11217	CREDIT	 Network budget balance pre Open Collective	4356	USD	2016-10-04 18:37:57.159-04	2016-10-04 18:37:57.359-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	4356	4356	\N	1b49351e-29fc-4a91-8658-c52d688005f8	273	857	114628d5-6791-4fb3-9c7f-b98ea9023cba
11219	CREDIT	Global Development	100	USD	2016-04-15 13:29:50.291-04	2016-06-14 14:14:21.861-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	100	100	86	68927fcd-c7ca-4470-a89c-eb81f3cc4a76	13	857	302729e5-7beb-412d-bb50-3e1b9eb648cc
11226	CREDIT	Drinks (La Croix water) for Jan HackNight	2093	USD	2017-01-25 13:41:33.613-05	2017-01-25 13:41:34.163-05	696	142	1476	\N	\N	\N	\N	\N	\N	\N	1	2093	2093	724	f2882ec3-ec42-40f7-9e8d-6add15befd62	48	857	54f9727d-1b3b-4a8f-884c-2b7f8e828e79
11227	CREDIT	Meetup Fees	6000	USD	2016-12-28 11:32:19.412-05	2016-12-28 11:32:19.412-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	667	fd2f5b5b-c22d-4b27-ac41-46afc4093079	294	857	d92da950-7d82-4535-9a11-93100be233d7
11236	CREDIT	Postage to send hackathon gifts to sponsors	1628	USD	2016-11-30 11:09:00.364-05	2016-11-30 11:09:00.529-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	1628	1628	\N	e467f3d5-12ff-463e-bc33-8bf9cba6147b	2	857	6f0b029b-a1d6-42a6-bfdd-7e6e03a72af8
11240	CREDIT	May 5 South Hack Night	5325	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.083-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	5325	5325	181	e7146777-76b1-474e-9291-1bebfb39098b	2	857	65e9cd2a-62f8-4a82-8a81-d7fda5662c13
11244	CREDIT	Libretas Hackathon	1038000	MXN	2016-02-16 13:56:17.216-05	2016-06-14 14:14:21.738-04	821	7	\N	2016-06-14 14:14:22.435-04	\N	\N	\N	\N	\N	\N	1	1038000	1038000	33	6ba0dd64-6f6e-4086-ae3e-c35133dbb7cb	10	857	a10aade4-801c-4408-976c-24f523b01ecc
11245	CREDIT	Leadership team dinner - Sondry interview	11757	USD	2016-08-02 09:44:04.201-04	2016-08-02 09:44:04.214-04	766	31	320	\N	\N	\N	\N	\N	\N	\N	1	11757	11757	307	0d1716a1-fd71-4503-a508-bfbee20a5823	14	857	9f5407a0-3261-4382-8c59-41aafcb3c7c4
11247	CREDIT	Gift Card for Volunteer	10000	USD	2016-10-27 17:03:46.196-04	2016-10-27 17:03:46.328-04	51	3	1024	\N	\N	\N	\N	\N	\N	\N	1	10000	10000	\N	8fd5cb03-1358-404d-9c26-54fd7c2fbbb0	300	857	8f55fe6b-202e-45ae-98f1-aeff71422cc0
11260	CREDIT	Food for Denver Meetup	9939	USD	2016-08-16 10:52:04.669-04	2016-08-16 10:52:04.682-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	9939	9939	\N	d8c4b851-4211-40e1-88d9-c99d87704deb	15	857	7fcee816-7b2d-4f17-8346-01e5f850468b
11264	CREDIT	Stacey Schipper Reimbursement	2322	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.873-04	51	3	\N	2016-06-14 14:14:22.471-04	\N	\N	\N	\N	\N	\N	1	2322	2322	92	bf67e056-ea88-4c1d-9687-a51dd7827ab9	15	857	92687396-25bf-462b-9489-8972408c0652
11265	CREDIT	Meetup Donation Transaction Fee	163	USD	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.849-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	163	163	81	9c4a4e34-43d7-4db6-abf7-1d7f4e25738b	4	857	90864887-43f0-48fa-881c-f805dc22edaf
11271	CREDIT	Director t-shirt	3186	USD	2016-10-17 16:58:31.776-04	2016-10-17 16:58:31.789-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3186	3186	\N	12a3b1f6-ac00-4fa0-bb90-c0f5e17303da	271	857	4b54c3fa-880d-417a-abd4-d0587d21ca59
11274	CREDIT	Network Budget pre Open Collective	11797	USD	2016-10-11 12:52:07.045-04	2016-10-11 12:52:07.303-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	11797	11797	\N	99f96f04-8b83-46e0-aed2-121127ab398f	59	857	7bb81769-7a2e-4462-95c0-91a5ddc8051a
11280	CREDIT	Marketing and communications materials for leadership team. 	4264	USD	2016-08-19 13:25:04.062-04	2016-08-19 13:25:04.374-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	4264	4264	\N	7ca0a9d6-a9a3-49b3-9f4e-276451601e8d	59	857	90c93320-481d-4678-8134-70ec3fcb01d0
11284	CREDIT	Minimum fee - June	1000	USD	2016-08-16 10:53:58.922-04	2016-08-16 10:53:58.936-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	4b77e806-8691-4c67-a8db-1cdcf5832f90	15	857	8862f841-c524-45f4-8ef6-518bb833c1d5
11288	CREDIT	Global Development	150	USD	2016-07-08 23:52:40.722-04	2016-07-08 23:52:40.722-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	150	150	93	88813e4a-9c4d-419d-9eff-49fd4b7c7bee	4	857	5d210958-05f6-45a6-9972-2af7b8bd8aa6
11291	CREDIT	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	227646	USD	2016-11-29 16:46:42.259-05	2016-11-29 16:46:42.259-05	766	31	\N	\N	\N	\N	\N	\N	\N	\N	1	227646	227646	474	1c97316e-4333-4121-b7ce-507c60a4735f	14	857	7e3123d0-8c9e-41cf-8ab1-a692daa242a9
11296	CREDIT	WwConnect Planning Meeting	2519	USD	2016-03-10 19:00:00-05	2016-06-14 14:14:21.794-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	2519	2519	60	8555235f-617b-4c80-98b8-c9dd36d590cc	14	857	c0a7bf5e-51b5-4a22-b5d3-dff55ed7b603
11302	CREDIT	payment to artists (spoken word) for performance at IWD event	20610	USD	2017-03-27 08:47:25.654-04	2017-03-27 08:47:25.894-04	763	70	2218	\N	\N	\N	\N	\N	610	USD	1	20610	20000	907	505a1066-7b7f-4175-ab99-b470d7425644	12	857	4289706d-9bd0-4988-ba71-449e21b134f5
11310	DEBIT	Donation to WWCode Washington DC	-52	USD	2016-03-01 23:41:59.916-05	2016-04-16 16:40:58.728-04	704	126	93	\N	\N	95	5	\N	33	USD	1	-52	-100	\N	1742182a-0e2c-425d-ac03-211a77d7e939	13	857	9f39cb25-a7eb-45c9-81f1-2468ed35b346
11313	CREDIT	Banner	2000	USD	2016-11-30 13:40:24.258-05	2016-11-30 13:40:24.443-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2000	2000	\N	e77a3435-8718-425f-9d12-27464571483a	292	857	6e71dbdb-e577-4049-9384-ec4d02c04401
11319	CREDIT	Supplies	3918	USD	2016-12-06 11:51:20.162-05	2016-12-06 11:51:20.661-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	3918	3918	508	cd6f6bfe-f6f6-42f7-a782-dabcc63a7839	59	857	7a8204d0-d326-44f0-bd0b-d36dc50df8e9
11321	CREDIT	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	8181	USD	2016-11-22 16:54:33.366-05	2016-11-22 16:54:33.644-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	8181	8181	499	e11d9fb0-2cc7-410b-bebf-0e3f6e2d3c7c	59	857	3a526a80-7cd5-4fae-b4c8-8c5987945dca
11328	DEBIT	monthly recurring subscription	-798	USD	2017-02-09 23:43:49.515-05	2017-02-09 23:43:49.515-05	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	e8e2d535-0c13-42d2-834f-af1d851804e9	241	857	96a4b886-6627-4269-8673-760bbd361d31
11331	DEBIT	Recurring subscription	-798	USD	2016-10-10 00:49:33.558-04	2016-10-10 00:49:33.558-04	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	3d3fe85e-3e38-4398-8173-f01ce2582774	241	857	9c41cbbc-79c0-482d-8977-06f2b4996c29
11147	CREDIT	October Hack Night Drinks/Food.	1106	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	843	1325	\N	\N	\N	\N	\N	\N	\N	\N	1	1106	1100	485	d88609c9-38dc-4e4a-8194-0215e495048a	273	857	1d6c5db9-bbb9-4d1f-866c-388953e594b5
11155	CREDIT	Meetup Fees	6000	USD	2016-12-21 13:54:30.839-05	2016-12-21 13:54:30.839-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	608	0af6fe2f-ba64-4567-891b-af75c57b9335	3	857	e73b995b-b43c-42b7-886f-3dd6e2fae5db
11160	CREDIT	Decorations / Supplies	1379	USD	2016-12-13 13:42:06.408-05	2016-12-13 13:42:07.17-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	1379	1379	\N	e50fdcef-9e45-4afe-8efc-9e52c9d9570a	59	857	649acad7-15ec-4c12-a80b-50ff597702b4
11164	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:31:58.557-05	2016-12-27 11:31:58.557-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	636	da5bfa71-19f8-4e19-b55c-798658b7cd77	15	857	195a4459-fa26-43a9-8159-06dc54d9762b
11169	CREDIT	Banner	2000	USD	2016-11-29 17:34:04.252-05	2016-11-29 17:34:04.435-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2000	2000	\N	17bf81fb-1401-4228-96e7-f17d8386212e	47	857	8653a1d4-989f-4729-b864-666b9c80e8d8
11174	CREDIT	Installfest	558	USD	2016-12-13 12:30:28.678-05	2016-12-13 12:30:30.347-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	558	558	\N	da361015-629d-48a7-8a75-8c11171872fe	59	857	d8cd2df0-48d4-438c-b9cc-663e7b13279d
11179	CREDIT	WWCode Director shirt	3649	USD	2016-10-17 16:49:16.114-04	2016-10-17 16:49:16.113-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3649	3649	\N	215ca906-8024-4cb6-b982-135c826c392b	282	857	a9049926-0665-47df-8268-676d6779df94
11181	CREDIT	Stickers for ATXDivHack 	15300	USD	2016-10-31 17:15:38.727-04	2016-10-31 17:15:38.89-04	51	3	1043	\N	\N	\N	\N	\N	\N	\N	1	15300	15300	\N	22d6e777-4adb-44a1-887f-135c6d134658	2	857	0a15d488-a034-455a-b026-ce7c5a32bdb0
11183	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 16:50:53.853-04	2016-10-17 16:50:53.855-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	3649	3649	\N	45684e6f-e202-4641-b86c-268f223cbdfd	47	857	652702bc-ff4b-459c-a49a-4ee23d39469e
11186	CREDIT	Supplies for decorating our robots	9777	USD	2017-05-16 18:00:15.557-04	2017-05-16 18:00:15.557-04	696	142	\N	\N	\N	\N	\N	\N	0	USD	1	9777	9777	1085	b7cab425-4d10-40de-aa83-cee22518aee4	48	857	1373f7b4-a926-4982-80e8-2969e53b42bd
11194	CREDIT	Mar 7 Lightning Talks	15316	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.794-04	847	28	\N	2016-06-14 14:14:22.455-04	\N	\N	\N	\N	\N	\N	1	15316	15316	57	ccf9a3a4-9700-4db8-880e-7fdbd0a0992b	2	857	40b4df1b-5288-4b55-8bf3-c5f550ea4a2e
11198	CREDIT	IVA Libretas Hackathon	166080	MXN	2016-02-16 13:58:04.663-05	2016-06-14 14:14:21.738-04	821	7	\N	2016-06-14 14:14:22.436-04	\N	\N	\N	\N	\N	\N	1	166080	166080	34	d5e86646-8658-4e10-b9fa-fe7c11b8a0fe	10	857	6544a256-dafe-4430-b03f-b61e77b53dd9
11200	CREDIT	Connect 2016 event setup day dinner	6800	USD	2016-03-17 20:00:00-04	2016-06-14 14:14:21.838-04	797	32	26	\N	\N	\N	\N	\N	\N	\N	1	6800	6800	72	57c156b3-f331-4926-aecd-201816d230b8	14	857	3f686988-8dd2-4b26-b0e7-b963aac68dc7
11207	CREDIT	Conference Grant - Sarah Olson	20000	USD	2016-05-25 12:39:09.882-04	2016-06-14 14:14:22.103-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	20000	20000	190	4148d6a1-cc7f-4ab3-abae-7b6fa8c39b28	48	857	ea15f896-418c-4a5a-8c79-90d4b5c3b851
11210	CREDIT	Gift for organizer	3499	USD	2016-10-31 17:14:38.997-04	2016-10-31 17:14:39.22-04	51	3	1043	\N	\N	\N	\N	\N	\N	\N	1	3499	3499	\N	b4e0764a-6a77-4103-b6c7-9211b7414f39	2	857	19657404-bc9f-44dd-9741-d4c53e044917
11212	CREDIT	Global Development	0	USD	2016-04-12 14:52:16.188-04	2016-04-12 17:19:43.124-04	51	3	\N	2016-04-12 17:19:43.124-04	\N	\N	\N	\N	\N	\N	1	0	150	\N	0f864d78-ad2b-4d0c-b4c1-001b16c5c297	4	857	07042c31-989b-4e43-ab1a-e608d61b44cd
11220	CREDIT	Test	1000	USD	2016-10-11 12:18:39.252-04	2016-10-11 12:18:39.252-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	413	ccdf2620-9d80-4d3c-a662-859c685a24e4	195	857	585cb93d-2740-43ee-b532-a2fdbba94924
11223	CREDIT	CONFERENCE GRANT	80000	USD	2016-05-31 13:47:01.276-04	2016-06-14 14:14:22.123-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	80000	80000	198	dedbdb7e-a0b9-4587-9dd9-6c64906b07f7	13	857	d3a3a3f4-9383-49ce-bd8b-056704740f49
11225	CREDIT	Amazon Echo Dot devices for HackNight and first book for our book club.	22137	USD	2017-01-25 13:44:31.311-05	2017-01-25 13:44:33.251-05	696	142	1718	\N	\N	\N	\N	\N	\N	\N	1	22137	22137	725	0bb27aa8-7236-459d-afcb-03588362ad96	48	857	c6899e01-10c8-48de-8c72-f37f41d7b019
11228	CREDIT	Meetup Fees	6000	CAD	2016-12-28 11:30:16.279-05	2016-12-28 11:30:16.279-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	666	febf69a1-71ed-45f7-9d50-7450bdec9ca2	293	857	ecaa0f2b-3610-44b3-852b-d1adf2b8bed1
11241	CREDIT	Mar 3 hack night	4951	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.784-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	4951	4951	55	89ff6a38-4031-435c-96ed-a866086f7a58	2	857	33f0ccb1-fb6d-4696-84b6-b24b6834f072
11242	CREDIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	4351	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	843	1325	\N	\N	\N	\N	\N	\N	\N	\N	1	4351	4300	483	f71e74ee-cd7d-4022-a770-a4c475c1900b	273	857	a7e81029-6524-4f50-886c-110fd48b7b33
11248	CREDIT	Banner	2000	USD	2016-11-29 18:07:29.03-05	2016-11-29 18:07:29.148-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2000	2000	\N	caf9955a-9f69-4b1f-82a5-056774551c84	289	857	a28b9700-194c-4639-bb72-4a88f5ffa119
11255	CREDIT	Beverage for Denver June meetup	2279	USD	2016-10-04 18:09:25.159-04	2016-10-04 18:09:26.045-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	2279	2279	\N	8da86385-2714-41a5-bfb6-9cb25b05086d	15	857	acae0d67-c045-4fdd-9b53-c96b6b580909
11257	CREDIT	Minimum fee - May	990	USD	2016-08-16 10:53:06.001-04	2016-08-16 10:53:06.015-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	990	990	\N	8613eb3c-a280-42d9-9f7a-502594bf15b2	13	857	681b71fd-629a-4d33-8c34-576c59b05e52
11261	CREDIT	Reimburse Caterina Paun for supplies and mailing expenses	5504	USD	2015-12-14 19:00:00-05	2016-06-14 14:14:22.175-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	5504	5504	225	21e01833-46a1-44b9-b599-203d29d3c9fc	59	857	98323ab9-a5f8-47d3-8ac6-9e3462a07d91
11267	CREDIT	Meetup Fee	6000	USD	2016-12-27 11:52:46.242-05	2016-12-27 11:52:46.242-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	640	9faa4d3a-79eb-4585-8ba7-bdc029130712	274	857	635a2d3a-fb15-4e21-9307-ddd7555de60a
11277	CREDIT	90/10 split: Beth Laing	500	USD	2016-10-04 12:06:09.85-04	2016-10-04 12:06:09.85-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	500	500	391	b87e04f8-5927-47d8-8106-31706c31e77e	12	857	98e917d7-f93d-4397-8246-e97a8d7e1133
11279	CREDIT	Global Development	250	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	250	250	96	6818ccde-3e4e-42af-b36d-0159f28640be	48	857	3854e905-3aac-44a8-bfe7-22e54dfd1887
11281	CREDIT	Minimum Fee - May	1000	USD	2016-08-16 10:55:31.274-04	2016-08-16 10:55:31.288-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	e17cda3e-3c91-44b4-8b3f-aaf039f99821	59	857	f09c5932-8026-4493-97d3-0d40030a8799
11294	CREDIT	Monthly team meeting w core six members. Food/pizza	3323	USD	2016-10-31 17:02:15.762-04	2016-10-31 17:02:16.402-04	766	31	1024	\N	\N	\N	\N	\N	\N	\N	1	3323	3323	400	76eeffd5-8ea7-4ff6-bb99-871b5d028738	14	857	95a17902-f84d-47ed-b725-220b42a0637d
11297	CREDIT	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	6100	USD	2017-02-22 10:27:02.607-05	2017-02-22 10:27:02.62-05	766	31	1893	\N	\N	\N	\N	\N	\N	\N	1	6100	6100	774	c74b0af7-fd14-4017-8adf-77dd8f065750	14	857	01bd297f-63e3-4470-9509-67c8d46505af
11303	CREDIT	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	21588	USD	2017-03-14 13:22:10.666-04	2017-03-14 13:22:10.681-04	763	70	1893	\N	\N	\N	\N	\N	638	USD	1	21588	20950	899	e9413a89-f48b-4a3c-8f58-8d0f4399ee70	12	857	966eb129-ea73-4d72-a90e-497187cef5f6
11305	DEBIT	\N	-10320	USD	2016-10-06 14:36:38.382-04	2016-10-06 14:36:38.382-04	713	1438	880	\N	\N	808	625	\N	305	USD	1	-10320	-12500	\N	b46b242d-7ee2-4c0b-aba2-c909c0fadca6	2	857	6cf96c64-eaea-4a98-b90b-daa2dc7e0df9
11312	DEBIT	Recurring subscription	-52	USD	2016-05-02 01:44:10.046-04	2016-05-02 01:44:10.072-04	704	126	93	\N	\N	95	5	\N	33	USD	1	-52	-100	\N	0238fe2c-b936-4f89-a22b-caedd7c2483c	13	857	a918a1db-381b-4a65-96ac-f63c6193ea01
11320	CREDIT	Marketing for IoT Hackathon	1082	USD	2016-12-06 11:50:56.549-05	2016-12-06 11:50:57.046-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	1082	1082	502	83db6de7-8c1c-4675-acb8-49df36686fa2	59	857	8024f2c2-fdab-4175-b691-79c5fdbeb038
11323	CREDIT	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	4874	USD	2016-11-22 16:55:10.575-05	2016-11-22 16:55:10.713-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	4874	4874	498	f9dc4e1f-bb1a-4d7e-b0a8-ec57b7ecf1fb	59	857	bb6dc4dc-363f-43b9-9595-2b7cba6cb151
11326	CREDIT	Domain name for hackathon and study night projects	1798	USD	2017-02-20 15:53:02.864-05	2017-02-20 15:53:02.879-05	826	171	1893	\N	\N	\N	\N	\N	\N	\N	1	1798	1798	497	8d687f4e-759d-40d2-ac5c-cd35436bb024	59	857	f8cfabe6-38bf-4de6-9ab8-48bf1c6db577
11334	DEBIT	monthly recurring subscription	-798	USD	2017-03-09 23:43:47.943-05	2017-03-09 23:43:47.943-05	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	e8887472-e1d3-47dc-9126-4258d25ff775	241	857	35c8ef37-6291-4a0b-a5f8-4a17cafeee51
11336	DEBIT	\N	-16530	USD	2016-11-30 11:11:42.049-05	2016-11-30 11:11:42.049-05	710	1957	1296	\N	\N	1215	1000	\N	470	USD	1	-16530	-20000	\N	9cf57b30-6d0d-4fdf-ac52-9a7a1291cce2	2	857	edfa4d6d-5d2a-40c7-a980-481a4e4a5b46
11344	DEBIT	Recurring subscription	-798	USD	2016-11-01 19:32:30.439-04	2016-11-01 19:32:30.439-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	1611428a-41e5-4181-90d8-828326265f91	2	857	88b1b138-0a60-492e-97c7-128fa8650f00
11146	CREDIT	6/2/16 Fireside Chat at Orange Coworking	20000	USD	2016-06-04 17:37:03.991-04	2016-06-14 14:14:22.145-04	847	28	320	\N	\N	\N	\N	\N	\N	\N	1	20000	20000	211	c05b3ca4-8c98-456a-a21b-5f9c887876df	2	857	5c7d4031-0b3b-43b4-bd69-824680cddc6e
11157	CREDIT	Meetup Fees	6000	USD	2016-12-27 14:53:07.2-05	2016-12-27 14:53:07.2-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	657	1fe3bb6c-2973-4c1c-9ade-87580f859277	14	857	d63acf53-a03b-46ad-8f98-4d245070d4a7
11162	CREDIT	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	7750	USD	2016-12-06 11:57:59.164-05	2016-12-06 11:57:59.708-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	7750	7750	\N	66e3f129-34be-4449-89af-91e8434ab50a	59	857	10bc42d7-ba63-479e-b9f2-81e639ab74dc
11166	CREDIT	Network Budget pre Open Collective	77659	GBP	2016-10-07 10:03:00.623-04	2016-10-07 10:03:00.89-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	77659	77659	\N	b0b06e30-0864-44f8-9001-5303e24275d2	278	857	75ca06f6-c9bb-4e6a-aba8-0618a873f8d5
11172	CREDIT	Fedex - certificate print expense	1962	USD	2016-10-31 17:32:07.365-04	2016-10-31 17:32:07.497-04	51	3	1043	\N	\N	\N	\N	\N	\N	\N	1	1962	1962	\N	9aeb103d-771b-4a39-9228-37aaae1396c7	300	857	c8c9134a-a0ee-42ec-ba2a-96a25da0d684
11175	CREDIT	Office Supplies for Hackathon.	10585	USD	2016-12-06 12:00:58.382-05	2016-12-06 12:00:58.806-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	10585	10585	\N	2c174679-9ba0-4f89-bfbd-c99ddef418a5	59	857	99197cfd-b236-42d0-9386-1a59be053dfc
11191	CREDIT	90/10 split: Hackathon donation	32000	USD	2016-10-04 18:05:22.85-04	2016-10-04 18:05:22.85-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	32000	32000	395	341d8d90-e74e-4a5d-b5dc-151802a48d90	15	857	2644adf0-9c04-41f5-967d-bf82f5cde7aa
11192	CREDIT	Net budget balance pre-Open Collective	56266	USD	2016-10-04 17:57:44.218-04	2016-10-04 17:57:44.218-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	56266	56266	394	6fe60099-d38a-4081-88c9-bca2b27bd74c	2	857	5057b84a-c99a-4931-84c0-b22c7f53dbc5
11199	CREDIT	Quarterly planning meeting	14000	USD	2016-05-05 20:18:43.265-04	2016-06-14 14:14:22.011-04	797	32	26	\N	\N	\N	\N	\N	\N	\N	1	14000	14000	147	7765c66b-aa0c-40b0-86ec-a64a802b45de	14	857	6c8794ae-16dd-469a-a30a-ba398a0e37c7
11202	CREDIT	European Leadership Development Workshop -- Transportation, Taxi	4400	EUR	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	793	1378	\N	\N	\N	\N	\N	\N	\N	\N	1	4400	4400	493	41299ee6-9d97-45ce-a34c-c6143fda2dfc	301	857	e7d95942-3842-4948-990c-eacfe94ba464
11208	CREDIT	Conference Grant	15000	USD	2016-05-24 15:42:50.307-04	2016-06-14 14:14:22.103-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	15000	15000	188	1232d8bf-322f-40e6-b895-56216c2c4a43	13	857	5092c179-7df9-4b60-a252-04f22a1c636e
11216	CREDIT	Global Development	150	USD	2016-04-27 12:21:00.228-04	2016-06-14 14:14:21.907-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	150	150	103	bee7f93b-44fe-41de-99be-92986541b45b	48	857	6867bb4e-d8f8-4972-b694-d21e28c46fba
11218	CREDIT	Global Development	100	USD	2016-04-26 23:56:08.086-04	2016-06-14 14:14:21.897-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	100	100	101	e7463606-079a-45fb-8bfd-c0925215ef3d	13	857	8264e9d0-16b1-466e-8be8-812a0ed50735
11230	CREDIT	45 webcam covers + shipping	9685	USD	2016-12-21 10:39:46.852-05	2016-12-21 10:39:47.49-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	9685	9685	\N	a4200a90-f52f-4aeb-9b1f-0a87371ffcf0	59	857	da018744-d743-4574-b6dc-3435969a7521
11233	CREDIT	Meetup Fees	6000	USD	2016-12-27 11:59:33.873-05	2016-12-27 11:59:33.873-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	642	0398ba8e-7a78-44bf-8f45-b02af72d0352	276	857	5b6ec3dc-cdfd-463d-9f35-cec2860bdc40
11235	CREDIT	Frames for sponsor gifts	4054	USD	2016-11-30 11:11:18.637-05	2016-11-30 11:11:18.805-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	4054	4054	\N	3e5d1b4e-11d3-4224-9fdb-68b83c69c0af	2	857	5dc12491-aed7-45cb-a4f3-aec689a3b955
11237	CREDIT	DIANA A. SCHOLARSHIP GOOGLE I/O	25000	USD	2016-11-21 17:59:43.764-05	2016-11-21 17:59:43.764-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	25000	25000	396	e2f2c516-f85a-475e-8f48-1b2a6b92cd48	272	857	63cd10b1-39a2-4b74-b534-4d8d3315ea47
11250	CREDIT	Leadership Development - speaking event	25000	USD	2016-11-29 17:39:25.11-05	2016-11-29 17:39:25.31-05	51	3	\N	2016-11-28 19:00:00-05	\N	\N	\N	\N	\N	\N	1	25000	25000	\N	2dad9820-00b3-4efc-913b-5fab8c105619	47	857	b71cc2db-9ff5-4e3d-a071-0bbe4a985801
11253	CREDIT	Google I/O: Alicia Carr	10000	USD	2016-10-04 11:44:35.988-04	2016-10-04 11:44:35.988-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	10000	10000	387	c3bb2861-36d7-4a7e-9085-75236f805daf	12	857	a2b6ef23-980e-47da-b0cb-b366afd322b1
11259	CREDIT	Minimum Fee - June	995	USD	2016-08-16 10:51:24.796-04	2016-08-16 10:51:24.811-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	995	995	\N	13fb8638-fa18-4df2-a126-98c048c02e3b	12	857	eab62b64-912e-42c5-b276-690d8a5d786b
11263	CREDIT	Conference Grant	50000	MXN	2016-05-16 10:49:37.27-04	2016-06-14 14:14:22.052-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	50000	50000	164	eb1f0728-ee3c-432d-b3ae-b7ef8fb519c9	10	857	0a4e0cd5-1438-4901-bd48-24c9c23e8113
11270	CREDIT	Regional Leadership Director Training	631	USD	2016-11-29 17:38:46.551-05	2016-11-29 17:38:46.748-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	631	631	\N	ba3d4796-dc7d-4679-977d-a455b90085e4	47	857	90b9a67f-206f-4649-ae2e-db38f817a25f
11273	CREDIT	Wine	1647	USD	2016-10-31 17:15:06.269-04	2016-10-31 17:15:06.517-04	51	3	1043	\N	\N	\N	\N	\N	\N	\N	1	1647	1647	\N	cbdbec55-5892-4af2-a058-c3ad70614e61	2	857	ed264099-4013-49e9-b85b-4a4e1500e3cc
11283	CREDIT	Minimum Fee - June	1000	USD	2016-08-16 10:55:45.164-04	2016-08-16 10:55:45.179-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	1000	1000	\N	ce3366c7-69de-4cff-bc21-f1f14155591c	59	857	f4f2bd20-cd10-428a-aa2b-b60a1c5133c9
11286	CREDIT	Global Development	5000	USD	2016-02-21 19:00:00-05	2016-06-14 14:14:22.186-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	5000	5000	227	f4603fbe-9a6e-4edd-8660-1fd77b4a6437	59	857	f44b95e0-50ad-432c-8044-3122b47d39f8
11293	CREDIT	Transportation to get to GeekWire Summit social event 	729	USD	2016-11-01 12:16:02.625-04	2016-11-01 12:16:02.953-04	766	31	1044	\N	\N	\N	\N	\N	\N	\N	1	729	729	402	e28a1512-8087-45a8-84e2-a4693f8c09f1	14	857	10c979fd-c64e-4b51-af93-cc24fd7fa676
11295	CREDIT	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	5458	USD	2017-02-22 10:27:45.429-05	2017-02-22 10:27:45.466-05	766	31	1893	\N	\N	\N	\N	\N	\N	\N	1	5458	5458	775	50e56922-b000-42f1-863c-d236976b55c0	14	857	1a760957-cd4c-4a32-9d55-34b96de94a98
11307	DEBIT	\N	-24450	USD	2016-11-22 10:22:39.097-05	2016-11-22 10:22:39.097-05	701	1846	1211	\N	\N	1129	1500	\N	1050	USD	1	-24450	-30000	\N	478229e4-4474-48b5-a248-d0797d9cd4cb	59	857	afe2005f-e779-4e4a-ba1a-175d8d454cca
11314	CREDIT	April 7 South Hack Night	5037	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.083-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	5037	5037	180	8d936337-9945-4ee9-b969-96eaa1fa913d	2	857	e4ea7f17-9aa6-4942-bcd5-f0d3383ed0bc
11317	CREDIT	Goodie Bags	1058	USD	2016-12-07 15:49:55.814-05	2016-12-07 15:49:56.33-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	1058	1058	573	39d2c4e4-dc4f-4918-b776-8818f2bc3999	59	857	762c7da2-4f3a-4e4e-9c36-63423dcfff86
11324	CREDIT	Food for JavaScript Study Night - Oct. 11th	1446	USD	2016-10-31 14:19:11.822-04	2016-10-31 14:19:12.067-04	826	171	1024	\N	\N	\N	\N	\N	\N	\N	1	1446	1446	419	ed6db6e5-e0dd-4fec-b74c-37581d40bcc2	59	857	6dccfdc4-b0dd-46ba-bb03-b418cc09aefb
11325	CREDIT	Event Food	6471	USD	2016-11-03 15:43:50.827-04	2016-11-03 15:43:51.096-04	826	171	1117	\N	\N	\N	\N	\N	\N	\N	1	6471	6471	377	949d6887-3e65-4676-ac27-e9252309d267	59	857	b3418f57-d8f7-4fe2-81be-1750637c8a9e
11333	DEBIT	Recurring subscription	-798	USD	2017-01-09 23:43:19.956-05	2017-01-09 23:43:19.956-05	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	cd73ca8b-e8a8-4c7f-9b59-c404cb4497f8	241	857	fe7378b0-23a9-4be3-ab0b-21f5525f100c
11335	CREDIT	Mugs for WWCode-SV	46419	USD	2016-12-20 13:57:28.399-05	2016-12-20 13:57:28.525-05	706	1374	1476	\N	\N	\N	\N	\N	\N	\N	1	46419	46419	605	4fdf3f93-0f26-4454-bc32-1e2f7ced47c4	300	857	85456b0f-e3a3-4a7f-b8fb-6a465979b713
11343	DEBIT	Recurring subscription	-798	USD	2016-12-01 18:32:26.764-05	2016-12-01 18:32:26.764-05	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	ee8b661d-f6a4-4729-857f-523ae7f77513	2	857	79bce5f4-b823-4f0a-b465-999849669afc
11345	DEBIT	Recurring subscription	-798	USD	2016-09-01 19:32:42.475-04	2016-09-01 19:32:42.475-04	803	686	461	\N	\N	386	50	\N	52	USD	1	-798	-1000	\N	e6849e20-8c84-4768-8125-fd33975c2e8f	2	857	fc845714-afa4-427f-8a0e-d013bbbda45d
3838	DEBIT	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	-4300	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4351	483	01ad80e1-007c-45b3-8b32-1583b3417b16	843	857	a7e81029-6524-4f50-886c-110fd48b7b33
7114	DEBIT	Plaques for IWD awards ceremony​ 	-54783	USD	2017-03-15 09:57:14.454-04	2017-03-15 09:57:14.471-04	12	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	-56402	888	a2ba1105-8ddd-44fc-ba97-591d7dfc1356	835	857	6cd3b0b0-bb36-469e-aa7f-2c09518367d3
1407	DEBIT	Leadership team dinner - Sondry interview	-11757	USD	2016-08-02 09:44:04.201-04	2016-08-02 09:44:04.214-04	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11757	307	ba0bff8a-9a64-499e-8d6d-99cb47c0787b	766	857	9f5407a0-3261-4382-8c59-41aafcb3c7c4
2839	DEBIT	Cash for Prizes/Bartender	-50000	USD	2016-11-01 11:15:55.737-04	2016-11-01 11:15:55.892-04	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	5f64b05e-f6fb-4b01-adfd-950c22e3a12e	51	857	192d073a-39ef-431b-8a43-5fac0e5494e4
2738	DEBIT	Gift Card for Volunteer	-10000	USD	2016-10-27 17:03:46.196-04	2016-10-27 17:03:46.328-04	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	9783d14c-2659-46ed-948a-7e672ce73c08	51	857	8f55fe6b-202e-45ae-98f1-aeff71422cc0
3536	DEBIT	Banner	-2000	USD	2016-11-29 18:07:29.03-05	2016-11-29 18:07:29.148-05	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	c09714f1-2fc3-4fb8-a367-95d18db0ab21	51	857	a28b9700-194c-4639-bb72-4a88f5ffa119
3802	DEBIT	Snacks and dessert	-38874	USD	2016-12-06 12:02:53.61-05	2016-12-06 12:02:54.44-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-38874	\N	938601d7-a5d1-47a7-94b8-11b626ea9014	51	857	0959455f-5483-4a29-a807-0e9ca204791e
3532	DEBIT	Leadership Development - speaking event	-25000	USD	2016-11-29 17:39:25.11-05	2016-11-29 17:39:25.31-05	47	3	\N	2016-11-28 19:00:00-05	\N	\N	\N	\N	\N	\N	\N	\N	-25000	\N	988e7f82-d35f-4c4e-a037-f45bf5115c05	51	857	b71cc2db-9ff5-4e3d-a071-0bbe4a985801
11161	CREDIT	WWC T-shirt	2798	USD	2016-12-06 11:59:36.33-05	2016-12-06 11:59:36.741-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	2798	2798	\N	168ff856-df27-43ae-b354-3771522bb339	59	857	355d9dba-cb8f-4195-bf95-df1a443ac8e7
11167	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 16:25:56.197-05	2016-11-30 16:25:56.423-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	75000	75000	\N	62249957-117e-4448-b8c9-77a8fc907f84	276	857	80d21d1e-a865-4d66-b802-e27742aabf46
11170	CREDIT	Matthews Group - Leadership Development for Seattle team	60000	USD	2016-11-29 16:46:31.384-05	2016-11-29 16:46:31.384-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	60000	60000	464	5d78e0b9-87b3-4bc6-8cbd-8327db097c00	14	857	9f858b17-d5cb-46ed-aee2-f22a96507fce
11176	CREDIT	Supplies / Gift Bags	4147	USD	2016-12-07 11:50:40.889-05	2016-12-07 11:50:41.383-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	4147	4147	\N	cb8b4234-3ff2-4446-bc0c-afe5fec6162c	59	857	e4020343-6d55-4239-83e5-5d94353bf720
11182	CREDIT	Director t-shirt	2860	USD	2016-10-17 16:56:00.744-04	2016-10-17 16:56:00.777-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2860	2860	\N	41598b32-15b8-4399-bc09-313b41516322	12	857	f89e142d-f5bd-4604-b634-2a9f2542efef
11185	CREDIT	WWCode Portland Stickers	31950	USD	2016-10-10 16:12:33.813-04	2016-10-10 16:12:33.813-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	31950	31950	411	b87513e4-43da-492a-a5a7-fce6e2f38962	59	857	87a9a795-3210-48ac-ba2a-5ec93dd5ed38
11189	CREDIT	Conference stipend Udisha S.	75000	USD	2016-10-06 13:21:09.865-04	2016-10-06 13:21:09.933-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	75000	75000	\N	e1a22505-f50e-4c55-a719-f9075976e333	13	857	9e85e3e7-15d9-4fb0-8a1a-0aa507c08850
11193	CREDIT	Feb 1, Lightning Talks	22568	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.794-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	22568	22568	56	d21b5b79-d091-4a77-b7b5-ad9a69611abd	2	857	782bce74-c53f-4f49-ab81-ac6370f08280
11195	CREDIT	Feb 1, Lightning Talks	0	USD	2016-03-20 14:06:09.887-04	2016-03-29 16:37:47.75-04	847	28	\N	2016-03-28 20:00:00-04	\N	\N	\N	\N	\N	\N	1	0	22568	\N	2e32364f-52d9-448b-ae81-5a5576802606	2	857	f3de19e0-fa15-4b8d-814e-b617261c2879
11211	CREDIT	Gifts for Organizers	2399	USD	2016-10-31 17:14:19.644-04	2016-10-31 17:14:19.81-04	51	3	1043	\N	\N	\N	\N	\N	\N	\N	1	2399	2399	\N	592957d3-29b5-4149-a4ff-d1c3126445cc	2	857	1b754d68-6e2d-4de1-ad0b-c63e9d0d4589
11213	CREDIT	Global Developement	150	USD	2016-04-12 14:46:49.263-04	2016-06-14 14:14:21.849-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	150	150	79	9d74ca79-6f13-4f20-92f7-e34d4bc6362e	4	857	7ed446f6-6b28-4c41-9587-220502d98067
11221	CREDIT	test 	0	USD	2016-04-06 13:39:39.954-04	2016-04-06 13:46:25.532-04	51	3	\N	2016-04-06 13:46:25.531-04	\N	\N	\N	\N	\N	\N	1	0	100	\N	4e3a6b53-8be8-40f9-9194-523655d514c3	14	857	e99bc7b6-143f-4f90-9d49-ef38ee02d68b
11224	CREDIT	Global Developement	100	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	51	3	\N	2016-06-14 14:14:22.48-04	\N	\N	\N	\N	\N	\N	1	100	100	97	0fbc1084-cc34-4a73-8c10-daf3d14a9587	13	857	7d74b07a-4fb4-4d63-a536-e1cc227370c1
11229	CREDIT	Meetup Fees	4900	GBP	2016-12-23 13:04:05.755-05	2016-12-23 13:04:05.755-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	4900	4900	624	51233cda-d4fb-46a4-9cb7-feeae67263a0	267	857	818d7594-d574-477c-b55f-feef2e56609d
11232	CREDIT	Meetup Fees	6000	USD	2016-12-27 12:03:23.101-05	2016-12-27 12:03:23.101-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	6000	6000	643	23ff379f-9bff-4419-9b6b-b9bfda92fa76	277	857	85d88d59-0e85-4c36-b69d-b4e86226907b
11238	CREDIT	Mathews Group 	60000	USD	2016-11-29 16:45:09.136-05	2016-11-29 16:45:09.136-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	60000	60000	\N	60a0dd28-5c71-4388-8713-689abb915bed	14	857	292d97d1-2353-4cd2-af1b-d322657d48f7
11246	CREDIT	Cash for Prizes/Bartender	50000	USD	2016-11-01 11:15:55.737-04	2016-11-01 11:15:55.892-04	51	3	1044	\N	\N	\N	\N	\N	\N	\N	1	50000	50000	\N	d49574a3-05e3-4313-b059-d3833d9b0688	2	857	192d073a-39ef-431b-8a43-5fac0e5494e4
11249	CREDIT	Snacks and dessert	38874	USD	2016-12-06 12:02:53.61-05	2016-12-06 12:02:54.44-05	51	3	1191	\N	\N	\N	\N	\N	\N	\N	1	38874	38874	\N	8477bb85-75ce-4fa1-9ef9-7934ab525a73	59	857	0959455f-5483-4a29-a807-0e9ca204791e
11252	CREDIT	Stickers	62984	USD	2016-10-06 11:49:20.942-04	2016-10-06 11:49:20.967-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	62984	62984	\N	73a55039-ebe7-43ac-857b-8fa00bcb728b	4	857	61746eee-f6f2-4bed-9076-531c3fc3d52c
11262	CREDIT	Leadership Tools (director tees)	2698	USD	2015-12-14 19:00:00-05	2016-06-14 14:14:22.114-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	2698	2698	192	37c647a1-56dd-4376-a74a-2fcf747b3ad3	48	857	da9ec9c8-0692-4c23-b095-78cab23da4fc
11268	CREDIT	Conference stipend Olivia F.	39585	GBP	2016-10-07 09:35:08.613-04	2016-10-07 09:35:08.724-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	1	39585	39585	\N	15c799ab-9899-4228-95cc-d1e70c5f5207	278	857	d25dcef7-e325-41b8-a09b-a309dc15621b
11272	CREDIT	Sodas for ATXDivHack 	3871	USD	2016-10-31 17:15:22.809-04	2016-10-31 17:15:22.98-04	51	3	1043	\N	\N	\N	\N	\N	\N	\N	1	3871	3871	\N	dc038403-6f93-40c6-a403-9c0745beb84c	2	857	1b4e4169-6b9e-46d0-bd37-1560fc276c99
11275	CREDIT	Google I/O Travel Stipend	100000	USD	2017-05-16 18:00:40.275-04	2017-05-16 18:00:40.275-04	696	142	\N	\N	\N	\N	\N	\N	0	USD	1	100000	100000	1088	f58199c6-e1f9-43a0-90c7-9f9ee743fc84	48	857	444dd3fc-27eb-4932-841f-2dfca7cc2adc
11282	CREDIT	Minimum Fee - June	995	USD	2016-08-16 10:55:14.822-04	2016-08-16 10:55:14.844-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	995	995	\N	9af01c8d-b9b6-4bd7-8a35-8695c9b1ea53	48	857	e96db26e-69d0-4545-ad45-dfaad9c0c6b0
11285	CREDIT	Thank you materials for several events.	6198	USD	2016-08-19 13:31:26.428-04	2016-08-19 13:31:26.891-04	51	3	573	\N	\N	\N	\N	\N	\N	\N	1	6198	6198	\N	065d48aa-c73a-4427-ab52-21ba00dc62a6	59	857	ac781387-8a68-49b9-a640-0a61dcf91d4c
11292	CREDIT	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	1305	USD	2016-10-31 13:52:11.82-04	2016-10-31 13:52:12.734-04	766	31	1024	\N	\N	\N	\N	\N	\N	\N	1	1305	1305	427	a5fcc25a-3d8d-41dd-b559-7a2f0cf86f9c	14	857	139c53ae-0208-458c-9dde-43f52d2aa333
11299	CREDIT	Connect Conference video footage review	2948	USD	2016-05-16 20:31:54.682-04	2016-06-14 14:14:22.053-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	2948	2948	167	7ecbe529-88a7-4df5-92f9-10d359a4b730	14	857	227f2edd-8af1-450a-913d-a16f7d4e6546
11300	CREDIT	WwConnect Conference Set Up Day 1	709	USD	2016-03-18 20:00:00-04	2016-06-14 14:14:21.805-04	766	31	26	\N	\N	\N	\N	\N	\N	\N	1	709	709	61	577cb010-48a1-4e57-98aa-3918b7820ded	14	857	e1a3b3f5-2eec-4746-94f7-2362b3b4a90c
11304	DEBIT	Donation to WWCode Austin	-41020	USD	2016-05-19 15:24:43.134-04	2016-05-19 15:24:43.182-04	718	392	288	\N	\N	246	2500	\N	1480	USD	1	-41020	-50000	\N	d4ac6ae1-680c-46c3-8315-3c459bb9009d	2	857	7249597a-205c-487a-8e97-5f21b9ad99ae
11306	DEBIT	\N	-2040	USD	2016-12-18 20:42:01.104-05	2016-12-18 20:42:01.104-05	699	2220	1472	2016-12-27 19:00:00-05	\N	1389	125	\N	85	USD	1	-2040	-2500	\N	97199727-1643-455b-bdb6-8ece231ab289	259	857	af39c90a-2377-492f-912f-c9374f51397b
11308	DEBIT	\N	-2040	USD	2016-10-07 12:49:19.978-04	2016-10-07 12:49:19.978-04	712	1446	884	\N	\N	812	125	\N	85	USD	1	-2040	-2500	\N	0d382a35-f280-41f8-a887-0e456475163e	241	857	e047b6ba-4b5e-47e3-9647-81065360400e
11316	CREDIT	May 2 Lightning Talks	8979	USD	2016-05-22 19:46:04.647-04	2016-06-14 14:14:22.092-04	847	28	26	\N	\N	\N	\N	\N	\N	\N	1	8979	8979	184	e9eb438d-ac97-4a51-a14a-31a4c3787ff6	2	857	b831d10c-ef3b-45a0-a772-e43882f1889d
11318	CREDIT	T-shirt order - Design Lead	2698	USD	2016-12-06 11:51:54.984-05	2016-12-06 11:51:55.379-05	826	171	1191	\N	\N	\N	\N	\N	\N	\N	1	2698	2698	509	49a660a1-2b18-4fbe-9f35-1a3aeffdd363	59	857	52c27b31-315e-4817-8648-ff471513e653
11327	CREDIT	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	9050	USD	2017-02-07 13:40:49.494-05	2017-02-07 13:40:49.852-05	826	171	1718	\N	\N	\N	\N	\N	\N	\N	1	9050	9050	790	c87ca43e-5283-43ab-b5c7-4a3ce3b89f00	59	857	73e8f027-dcb6-4b58-b23d-7e6b78a413fb
11329	DEBIT	Recurring subscription	-798	USD	2016-11-09 23:43:57.271-05	2016-11-09 23:43:57.271-05	737	1158	731	\N	\N	647	50	\N	52	USD	1	-798	-1000	\N	996c9f36-5234-495c-89f6-0b17a79ea6a1	241	857	92348241-c8cb-4507-949e-bc1e8eb092a5
11337	DEBIT	\N	-20375	EUR	2016-11-29 05:03:23.71-05	2016-11-29 05:03:23.71-05	707	1908	1257	\N	\N	1175	1301	\N	910	USD	0.961057932572174978	-21201	-25000	\N	7943ad1c-aee8-43a6-886d-1ce1771c7e47	301	857	83f433b6-cbca-4853-b4bd-39fe7aeb44b8
11338	DEBIT	\N	-41370	USD	2016-11-17 12:43:29.797-05	2016-11-17 12:43:29.797-05	708	1808	1179	\N	\N	1098	2500	\N	1130	USD	1	-41370	-50000	\N	c923de00-4d53-4060-8166-6d4501df4b4f	59	857	6cc37b35-b27c-4678-8079-b7ce4b21954b
11353	CREDIT	Leadership - Planning for 2017 - Afternoon Coffee	1175	USD	2016-12-19 13:42:59.021-05	2016-12-19 13:42:59.545-05	696	142	1191	\N	\N	\N	\N	\N	\N	\N	1	1175	1175	601	1c32eb6b-93b4-4357-9fc4-f1704410c4af	48	857	087c1528-738a-443d-9a09-7b866e23aad1
3952	DEBIT	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	-2870	USD	2016-12-13 13:44:23.973-05	2016-12-13 13:44:24.945-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2870	\N	2a19b928-ba82-4a49-a329-5c79e51b48e3	51	857	e15c62f6-3259-4d72-8625-da07685874cf
10134	DEBIT	Business cards and stickers	-11948	USD	2017-05-16 18:00:30.412-04	2017-05-16 18:00:30.412-04	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	-11948	1007	3747993e-5291-4be4-be3f-043e95561284	696	857	b3bdd42c-f7d9-4e3d-9b7e-292c34b99103
11339	CREDIT	Travel stipend to attend the Google I/O 2017 Conference.	107430	USD	2017-03-31 18:33:59.707-04	2017-03-31 18:33:59.731-04	698	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	107430	100000	962	828cd601-728f-4755-a492-658ab679d7f6	286	857	338a3774-1b6a-4939-8bd1-fdfd32e2da1c
11341	CREDIT	Food/Drinks for Anniversary Reception with guest WWCode Directors!	4444	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	843	1325	\N	\N	\N	\N	\N	\N	\N	\N	1	4444	4400	486	ce573236-b5cf-424b-95c5-0296e258ac15	273	857	3bf62d28-5b49-4df9-85b1-118aba1bb677
11347	CREDIT	Mile High Agile outreach- supplies	1115	USD	2016-04-02 20:00:00-04	2016-06-14 14:14:21.989-04	755	68	26	\N	\N	\N	\N	\N	\N	\N	1	1115	1115	136	e7b8e7c4-c496-45f5-9192-1aacf39d8a4a	15	857	9ab829a9-243e-43e6-beae-7cc8a0222405
11350	CREDIT	WWC Stickers	7000	USD	2016-03-17 20:00:00-04	2016-06-14 14:14:21.998-04	755	68	\N	2016-06-14 14:14:22.481-04	\N	\N	\N	\N	\N	\N	1	7000	7000	138	81f3a681-143e-469c-b87e-eabaedc6c045	15	857	ccb1ca1d-045f-427f-bc78-4e750039ca21
4655	CREDIT	\N	20000	USD	2017-01-03 15:59:37.749-05	2017-01-03 15:59:37.749-05	2	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	16530	\N	9d9ae433-8160-4ad4-abba-284759515132	709	857	01692586-7d13-4465-a22c-c6900fb069a5
1792	CREDIT	Recurring subscription	1000	USD	2016-09-01 19:32:42.475-04	2016-09-01 19:32:42.475-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	f8a6849c-0a33-4c9a-b04f-a5f96d063bfc	803	857	fc845714-afa4-427f-8a0e-d013bbbda45d
9863	CREDIT	\N	1000	USD	2017-05-09 01:59:15.573-04	2017-05-09 01:59:15.573-04	517	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	798	\N	e3494f7e-351e-478a-937b-32ca9c60513f	711	857	021fc8b5-92cb-4c07-a06d-93b01a542840
9898	CREDIT	monthly recurring subscription	1000	USD	2017-05-10 00:43:13.462-04	2017-05-10 00:43:13.462-04	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	96fff2b3-0c71-4009-8d16-285415e17f66	737	857	3b782053-8a58-4128-b592-959211e3658f
4793	CREDIT	Recurring subscription	1000	USD	2017-01-09 23:43:19.956-05	2017-01-09 23:43:19.956-05	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	2c128b7c-932b-47b7-af1a-311fa87351de	737	857	fe7378b0-23a9-4be3-ab0b-21f5525f100c
6944	CREDIT	monthly recurring subscription	1000	USD	2017-03-09 23:43:47.943-05	2017-03-09 23:43:47.943-05	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	9b332c05-04c1-4be6-8df7-bd7246af38c4	737	857	35c8ef37-6291-4a0b-a5f8-4a17cafeee51
3590	CREDIT	\N	20000	USD	2016-11-30 11:11:42.049-05	2016-11-30 11:11:42.049-05	2	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	16530	\N	a7479297-dc89-46e1-bbdb-c34a5e6bd385	710	857	edfa4d6d-5d2a-40c7-a980-481a4e4a5b46
3490	CREDIT	\N	25000	EUR	2016-11-29 05:03:23.71-05	2016-11-29 05:03:23.71-05	301	1908	1257	\N	\N	1175	1301	2601	910	USD	0.961057932572175422	26013	20375	\N	49c565db-0a28-4269-8164-4c0ac9a96fe3	707	857	83f433b6-cbca-4853-b4bd-39fe7aeb44b8
3199	CREDIT	\N	50000	USD	2016-11-17 12:43:29.797-05	2016-11-17 12:43:29.797-05	59	1808	1179	\N	\N	1098	2500	5000	1130	USD	1	50000	41370	\N	2d80d646-083c-4910-a320-cda0edc1cb3b	708	857	6cc37b35-b27c-4678-8079-b7ce4b21954b
726	CREDIT	Recurring subscription	100	USD	2016-06-02 01:48:36.714-04	2016-06-02 01:48:36.745-04	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	23ced910-fe09-4e51-b681-2c4a67ec8eac	704	857	cb2a8753-729b-4448-b1ca-2c67bf43bb2c
8038	CREDIT	monthly recurring subscription	1000	USD	2017-04-01 19:32:24.254-04	2017-04-01 19:32:24.254-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	b1060810-1e00-4118-b7b9-6cc529fca54a	803	857	4f2392df-1165-40b0-879a-186c61b75973
1918	CREDIT	\N	50000	USD	2016-09-13 00:15:04.709-04	2016-09-13 00:15:04.709-04	2	1178	737	\N	\N	653	2500	5000	1130	USD	1	50000	41370	\N	578ab4ce-f187-4636-ad60-c3b5760ac10c	788	857	240c5d59-452e-4b7e-b10a-34fa1f12b237
985	CREDIT	Donation to WWCode San Francisco	100	USD	2016-06-21 12:05:01.251-04	2016-06-21 12:05:01.296-04	4	642	431	\N	\N	360	5	10	32	USD	1	100	53	\N	2db86e58-3d86-4dc5-80ff-58f5fc7984a7	775	857	53a29930-50e5-41c0-8d68-afafb81ddaca
995	CREDIT	Donation to WWCode Austin	75000	USD	2016-06-22 16:09:46.403-04	2016-06-22 16:09:46.432-04	2	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	61125	\N	1dd2bb42-e7c2-4e79-8fc7-8949fa3a1e33	771	857	2bfdbc4f-dfd4-4425-a06d-a38ec505f785
1423	CREDIT	Recurring subscription	10000	USD	2016-08-03 13:47:25.319-04	2016-08-03 13:47:25.429-04	4	896	571	\N	\N	498	500	1000	250	USD	1	10000	8250	\N	8ce2b0bd-aefa-4369-9ce9-0e1e469b5d64	759	857	000d6274-195d-4179-8877-21c9ed16766f
469	CREDIT	Recurring subscription	100	USD	2016-05-02 13:46:41.832-04	2016-05-02 13:46:41.894-04	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	eb45eaa9-743d-437f-a0df-986c0842d91d	691	857	270cd840-e164-4b84-b0a6-54b30aceab38
2311	CREDIT	Donations via Meetup	3937	USD	2016-10-06 14:41:35.464-04	2016-10-06 14:41:35.487-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3937	\N	5b67f243-796f-46e5-b77c-c13405674c39	857	857	174bcd78-2fa1-4dce-a1ef-5a6a4c7bc29f
9699	CREDIT	\N	15000	USD	2017-05-03 13:44:48.715-04	2017-05-03 13:44:48.715-04	51	3	\N	\N	\N	2697	0	0	0	USD	1	15000	15000	\N	0bbb8fb9-a8dc-4ee6-8a86-2bee0302b879	857	857	19b82371-b367-4bfa-bcf1-ff5f0e649b0e
2301	CREDIT	Blurb donation	54000	USD	2016-10-06 12:06:35.799-04	2016-10-06 12:06:36.235-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	54000	\N	634f797f-873a-43f3-9ce9-3df9e5244c4d	857	857	322c533f-abbd-402b-a28f-895ab6031cc2
2538	CREDIT	Director t-shirt	3325	USD	2016-10-17 17:00:51.295-04	2016-10-17 17:00:51.425-04	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325	\N	7b58a48c-ec76-4fd4-b285-daf541fdd4c4	857	857	3ad71671-4b83-4909-b0bb-13e3fbe2a636
2532	CREDIT	Director t-shirt	2860	USD	2016-10-17 16:55:47.647-04	2016-10-17 16:55:47.671-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2860	\N	e973ee0b-ec29-44b5-b658-5e1585b44f89	857	857	436f78f3-f83b-4ec4-9ad9-1935b514a186
3208	CREDIT	WWCode DC t-shirts sales	9524	USD	2016-11-17 13:37:58.038-05	2016-11-17 13:37:58.232-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9524	\N	36e90498-a765-4be3-b2d7-490d8776e07c	857	857	4b9b9aa5-12ec-40cc-9c0e-431edc53a64b
7042	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	10875	USD	2017-03-13 13:05:28.744-04	2017-03-13 13:05:31.582-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10875	\N	c188572e-6d9c-4795-8540-7fd3bcea20bf	857	857	4eefd965-ce2a-40dc-af0b-e4571462a501
2298	CREDIT	Network Development (Stickers)	62984	USD	2016-10-06 11:49:44.329-04	2016-10-06 11:49:44.472-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62984	\N	6f7df12e-1d15-40b9-8987-ae637eede1ee	857	857	594bf8fc-c605-4f80-ac4b-031bc44d5349
2342	CREDIT	Network Development +	50000	USD	2016-10-07 16:24:13.595-04	2016-10-07 16:24:13.706-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b12c8806-5c99-46cf-8ae9-9f338888f266	857	857	5c492fe3-dd05-4d31-9fde-ddcb039abf05
4259	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 12:08:24.515-05	2016-12-23 12:08:24.709-05	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	8106fc14-9b21-49e9-bd3c-a25e7e6d64ea	857	857	66c02d90-4a96-498b-9039-1e96a68a4fa8
2243	CREDIT	Donation via Meetup	2036	USD	2016-10-04 12:42:35.996-04	2016-10-04 12:42:36.119-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2036	\N	ed01102f-16a4-4587-97a7-eb6ba81c5728	857	857	745e6b81-6671-4aa0-b901-7c2665784af4
2430	CREDIT	Network budget pre Open Collective 	162598	USD	2016-10-12 01:01:43.648-04	2016-10-12 01:01:43.828-04	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	162598	\N	4ec8f1b9-f12f-4ec8-962e-29aa026ead03	857	857	74edd83a-2f89-4f72-ab08-e66027a2163d
2255	CREDIT	Network Development	10000	USD	2016-10-04 17:50:13.582-04	2016-10-04 17:50:13.787-04	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	42761f67-0665-4e8b-bf08-83f8d2d853dc	857	857	75a874f1-b227-4123-9db6-4e1ae17401bd
9698	CREDIT	\N	75000	USD	2017-05-03 13:44:10.84-04	2017-05-03 13:44:10.84-04	12	3	\N	\N	\N	2696	0	0	0	USD	1	75000	75000	\N	0d740b6b-249c-4c33-97ec-a5767b5a5799	857	857	783084af-de7c-4961-b369-aacf66470f01
3955	CREDIT	Priyanka - IOT Hackathon donation - fees and global development 	2175	USD	2016-12-13 15:08:29.218-05	2016-12-13 15:08:29.464-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2175	\N	3b4c5740-bddf-407f-a147-56b43886907c	857	857	7e743389-1069-45cf-a07b-b73a5fcfbb57
2522	CREDIT	from Code2040	90000	USD	2016-10-17 11:43:12.71-04	2016-10-17 11:43:13.113-04	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	d37c6e91-1aa2-45bd-b13d-a4d3a6e32102	857	857	800117e3-ce11-430b-9160-ce9f8d36d119
2245	CREDIT	Donation received via Meetup, less fees	788	USD	2016-10-04 12:46:13.302-04	2016-10-04 12:46:13.487-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	788	\N	c144fa0c-6234-4fa9-ad5e-e1e1137cdb08	857	857	819b5869-271d-4469-bc40-1856ec37ff49
866	CREDIT	Nike Donation	50000	USD	2016-06-10 00:08:56.525-04	2016-06-10 00:08:56.991-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	6187d107-e599-47d8-8ca5-8ad365ac9df8	857	857	84d1e06f-c8a1-43aa-bb8a-834dbe45913c
2530	CREDIT	WWCode Director t-shirt	3649	USD	2016-10-17 16:50:42.245-04	2016-10-17 16:50:42.273-04	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	b8eabdbe-fc85-4747-a409-0b5a0c49f817	857	857	8ecad7e6-c62d-4289-b93c-f88178132020
612	CREDIT	Women Techmaker WWCode Partnership Grant	120000	USD	2016-05-19 15:10:52.797-04	2016-05-19 15:10:54.053-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120000	\N	9615350f-4370-4c3b-bfab-2f2c48fe511c	857	857	9c68533f-e1fe-4007-8a30-7394380c5d80
9714	CREDIT	\N	2175	USD	2017-05-03 20:12:19.814-04	2017-05-03 20:12:19.814-04	259	3	\N	\N	\N	2702	0	0	0	USD	1	2175	2175	\N	e7f2e24e-6899-46c4-919d-dd1cb2d3838c	857	857	b0d99568-d711-4dd5-bcb7-fc20ba675973
9746	CREDIT	\N	1200	USD	2017-05-04 14:58:24.9-04	2017-05-04 14:58:24.9-04	430	3	\N	\N	\N	2713	0	0	0	USD	1	1200	1200	\N	48c218d5-3e53-4a1f-88b4-485b930a9a99	857	857	be93edd1-0f04-46ec-9871-f7621fb16663
2309	CREDIT	Network budget pre Open Collective 	406519	USD	2016-10-06 14:36:30.275-04	2016-10-06 14:36:30.298-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406519	\N	6404bfb0-eb77-4649-a55a-6fbb57c82691	857	857	c91bbcc6-c555-4640-94f8-a7604335f5c8
3207	CREDIT	$500 OpenGov hackathon support - transaction and global development	43500	USD	2016-11-17 13:36:48.896-05	2016-11-17 13:36:49.046-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43500	\N	3726c26f-142a-4030-9306-3dbaad9081f0	857	857	cb55d829-3a21-4bf3-90c2-805f45c69aca
2404	CREDIT	Network Development	10000	USD	2016-10-11 12:52:38.277-04	2016-10-11 12:52:38.455-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	9c530187-e104-440b-ab25-54418876db12	857	857	ccadabfe-df2e-48d8-b387-f9b49496aaf3
9738	CREDIT	\N	2175	USD	2017-05-04 12:21:53.684-04	2017-05-04 12:21:53.684-04	276	3	\N	\N	\N	2710	0	0	0	USD	1	2175	2175	\N	5b429ca7-afd8-4d37-a3ad-51ca7ae6bd82	857	857	d21dc47b-2de8-4363-949f-a9f8b452a8ba
2256	CREDIT	Network Development: Three Year Bonus:)	50000	USD	2016-10-04 17:52:32.839-04	2016-10-04 17:52:32.962-04	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	e2c9207b-a9aa-48e5-9d97-78fd589d86c9	857	857	e4ed9833-caa6-415b-8fca-31de4ad32823
2254	CREDIT	Network budget balance pre Open Collective	34240	USD	2016-10-04 17:49:31.268-04	2016-10-04 17:49:31.543-04	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34240	\N	ea63f818-0bf1-4576-acd3-559644fa6d35	857	857	f60aa822-25f8-4374-99fd-10ce1cd8dfd8
129	CREDIT	Recurring subscription	100	USD	2016-03-02 13:26:05.731-05	2016-04-16 16:40:58.833-04	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	73f453a9-ae3a-4ca9-82e9-cc61d3644969	691	857	6415a67c-6553-4f43-a9f7-ed6a5b3f1fca
103	CREDIT	Donation to WWCode Austin	30000	USD	2016-02-18 14:54:08.531-05	2016-04-16 16:40:58.717-04	2	108	71	\N	\N	15	0	3000	900	USD	1	30000	26100	\N	a2af1057-4522-4c6a-b5ec-9f3e41da88e7	813	857	26a5cb03-8213-4cd8-aa79-2bf7b3469eda
451	CREDIT	Donation to WWCode Washington DC	50000	USD	2016-04-29 09:51:19.1-04	2016-04-29 09:51:19.15-04	13	303	216	\N	\N	183	2500	5000	1480	USD	1	50000	41020	\N	12d109fa-91c8-4a65-8547-f954d2767714	808	857	2055fc58-9a98-45c2-841c-4dab7d4b18ba
261	CREDIT	Donation to WWCode Austin	30000	USD	2016-03-25 11:11:04.684-04	2016-04-16 16:40:58.812-04	2	192	152	\N	\N	64	0	3000	900	USD	1	30000	26100	\N	112c59b0-b10d-43fc-9d6f-a33b38dfde31	805	857	5eb5d13c-ae86-411e-a5d9-be176f1afa91
837	CREDIT	Donation to WWCode Austin	150000	USD	2016-06-06 15:04:37.186-04	2016-06-06 15:04:37.308-04	2	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	123120	\N	7b775e3a-0634-4723-9638-3b8d28089e89	781	857	00e24e56-1073-412d-9afd-8562e7eb7f34
127	CREDIT	Recurring subscription	500	MXN	2016-03-02 13:06:23.743-05	2016-04-16 16:40:58.731-04	10	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	125	\N	2b05e30a-ef47-4a1e-b090-382b227c3b5b	768	857	c8af36fc-f899-4e50-b9bf-ce4e6cb0b8f5
3612	CREDIT	Network Development	20000	USD	2016-11-30 15:59:29.087-05	2016-11-30 15:59:29.921-05	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c26e172a-b880-40ae-96e1-245f9122cd42	857	857	0a1d3464-686b-4ab0-9a07-197e212b50ee
3620	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 16:20:06.733-05	2016-11-30 16:20:15.577-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	5cd12a4a-4670-41f8-a215-222175234e3e	857	857	16ab8d31-a2af-4c85-b45e-fd69401e5507
2264	CREDIT	Diana A. Scholarship Google I/O	25000	USD	2016-10-04 18:19:06.989-04	2016-10-04 18:19:07.108-04	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000	\N	8932d7a2-35b5-4d30-b78b-729a53066393	857	857	17701b96-4830-453a-b4dc-f0c4b9327018
2428	CREDIT	Donation from Shugo	450	USD	2016-10-12 00:30:15.825-04	2016-10-12 00:30:15.896-04	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	0f702272-a446-4280-a96b-9bc994874280	857	857	17eb5dc3-202a-4026-a0c8-6c0bd1941ad7
4255	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:59:24.039-05	2016-12-23 11:59:24.291-05	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6157d8ed-903e-40f6-b5d8-087f4793a4c2	857	857	1814f900-448d-4ff9-b68e-729da0e7152e
407	CREDIT	Mary Griffus	1000	USD	2016-04-27 00:41:38.126-04	2016-04-27 00:41:38.474-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	980ba0b0-ae38-48a2-9488-013c6634622b	857	857	2ced2108-2003-4b93-843e-a1e34430a5b7
4382	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 12:02:32.71-05	2016-12-27 12:02:32.843-05	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cb83b4cd-aedb-4485-a545-c318b78ca0fe	857	857	34f02b63-de13-4314-a21f-5262d6ebbc76
3621	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 16:20:12.669-05	2016-11-30 16:20:16.148-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	33dd6edd-aafe-4257-a57c-a3dd886e6c9a	857	857	3622870d-d8cd-403d-a195-bac0c7ac0e57
537	CREDIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	110000	USD	2016-05-10 17:15:06.327-04	2016-05-10 17:15:06.677-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110000	\N	84415409-2268-45c1-a28e-42bbe8a9dedf	857	857	47f5e209-5e63-4ebb-97c7-1a8b1f52d95a
2329	CREDIT	Google I/O stipend	39585	GBP	2016-10-07 09:35:45.945-04	2016-10-07 09:35:46.151-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39585	\N	31edf1ab-fe0e-470a-b022-11a2727cd41f	857	857	5276d130-e3c6-416e-a525-502879c74fd4
568	CREDIT	Women Techmaker/WWCode Partnership Grant	50000	USD	2016-05-16 16:01:14.238-04	2016-05-16 16:01:14.49-04	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	fcdb2afd-4ee1-44a6-95fb-9e1619286c8d	857	857	5334f5de-2c22-44fa-a390-e23918ec661f
3514	CREDIT	CONNECT 2016	4536939	USD	2016-11-29 16:44:20.041-05	2016-11-29 16:44:20.185-05	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4536939	\N	184f4788-f08f-4b14-9226-aaca61c2ebb3	857	857	592aca97-6912-42fd-8902-ab2eadcef214
2429	CREDIT	Network Development	19550	USD	2016-10-12 00:30:34.678-04	2016-10-12 00:30:34.772-04	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19550	\N	9ddbfb06-db7c-4fa2-a325-6e69943c17fe	857	857	5adef262-f8a8-46ac-91d9-63c3ebd3c898
2423	CREDIT	Network Development	19100	USD	2016-10-11 20:28:02.718-04	2016-10-11 20:28:03.121-04	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	74d06361-67e4-4923-840d-82fb946093ec	857	857	7ba2b72c-89d5-4fcd-8cfa-b79cc1685193
3537	CREDIT	Global Development - thanks VMWare	50000	USD	2016-11-29 18:07:50.964-05	2016-11-29 18:07:51.154-05	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	17513123-d08c-4153-96a9-85c8bf346bb8	857	857	7dda5758-95d3-48c5-844c-f5d13f8d2de9
3598	CREDIT	Network Development	20000	USD	2016-11-30 13:40:15.233-05	2016-11-30 13:40:15.446-05	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	1d3a6593-877b-4da0-a966-c2a286127140	857	857	8493f234-16b7-46bd-b7bf-283f2cf45af7
2300	CREDIT	Network development	6000	USD	2016-10-06 12:01:48.321-04	2016-10-06 12:01:48.667-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34694258-edf0-4473-b471-555bdcfddea7	857	857	8a3fb14c-9c99-4636-83ea-5500f9937b62
2422	CREDIT	Donation from Marie W.	900	USD	2016-10-11 20:26:47.2-04	2016-10-11 20:26:47.59-04	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900	\N	39996606-f7e9-40ee-a5e1-aa68deae24b2	857	857	8cc971b0-c066-465f-9dcb-08e8c65e5201
2327	CREDIT	Google I/O conference stipend	102409	GBP	2016-10-07 09:10:42.97-04	2016-10-07 09:10:43.753-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102409	\N	7daeaf49-013c-42de-83da-86526afaea32	857	857	901dab42-c197-4f87-bac6-ebf59c1d6d45
2231	CREDIT	Sponsorship: AT&T Hackathon Prize	1000000	USD	2016-10-04 11:40:37.72-04	2016-10-04 11:40:37.853-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000000	\N	4b8d36db-e5cf-4fd1-8128-a699de20993f	857	857	9140a174-9e7e-4864-8157-b58b882a7c2c
2332	CREDIT	Course Hero Hackathon Support	315000	USD	2016-10-07 10:39:15.069-04	2016-10-07 10:39:15.23-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	315000	\N	5c187624-870d-4c32-b10c-d952bc638fa5	857	857	9b25deaf-b9d5-4253-9925-bb788d5524e7
4265	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 12:31:16.26-05	2016-12-23 12:31:16.392-05	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	be353290-3a79-4837-b322-8bcf820cf681	857	857	a2940d63-fba5-4983-b7b9-4224ea3d3ed3
2340	CREDIT	Hackbright support for hackathon	45000	USD	2016-10-07 16:04:15.299-04	2016-10-07 16:04:15.435-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	f861afb4-acee-4677-8343-79a42a833d0f	857	857	b2e7cdbc-c7eb-4b78-ae9c-d88f853b69db
8175	CREDIT	Travel Stipend for CONNECT	50000	USD	2017-04-03 16:24:58.616-04	2017-04-03 16:24:58.879-04	511	3	\N	2017-04-02 20:00:00-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	d8baca94-1547-4dd9-ae1b-b3bdddeac823	857	857	b53c151f-d47a-4f00-847d-f5de02a38e5e
2333	CREDIT	Hackathon Support Open Gov	45000	USD	2016-10-07 10:41:08.315-04	2016-10-07 10:41:08.391-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	08afa6d7-318d-47a2-8443-f19c6d9fe1a5	857	857	b8cd459e-3b4a-4d4f-8bdd-74e0c52eb4b4
4261	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-23 12:13:39.369-05	2016-12-23 12:13:39.507-05	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	6f1c4879-9600-446e-b8b1-7c4ca6b64662	857	857	b91d2dfc-37f9-46ff-89e7-5720d627f0e7
4267	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-23 12:41:14.029-05	2016-12-23 12:41:14.193-05	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	034ce920-1702-43ca-b969-c609763c116b	857	857	ba148ad8-a26b-4522-b44a-2b70f50b900e
2299	CREDIT	Donations via Meetup	2823	USD	2016-10-06 11:53:38.156-04	2016-10-06 11:53:38.231-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2823	\N	35ce43d6-2009-48a3-bc10-e7c08155cd01	857	857	c2638527-c758-412c-9a53-a6d816bb756a
2253	CREDIT	Network Development	10000	USD	2016-10-04 17:44:54.4-04	2016-10-04 17:44:54.58-04	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	c7d7a0f0-4ac1-4169-9368-4b6d19c4680b	857	857	c3257758-308a-41ec-9342-a10344f2cdae
349	CREDIT	Jasna Rodulfa	1000	USD	2016-04-15 10:17:21.126-04	2016-04-16 16:40:58.829-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	4cb4c4ab-f5d6-4d63-a937-8af026b8759d	857	857	c554600a-521b-4cda-b48c-a27e264d60ed
3600	CREDIT	Banner	2000	USD	2016-11-30 13:40:32.021-05	2016-11-30 13:40:32.139-05	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	a1457d27-e61b-45de-aadd-378b29544550	857	857	ce384aeb-f7b2-4d37-b182-41f1791ee781
2341	CREDIT	Network Development (100%)	10000	USD	2016-10-07 16:05:13.011-04	2016-10-07 16:05:13.112-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	65d47c4a-b755-49c7-b2d6-dbddfdfd421e	857	857	d0a4df18-061d-4fa0-a003-135a3981f5de
4257	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 12:02:53.836-05	2016-12-23 12:02:53.991-05	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	3f46c5c9-4147-486e-b8ab-7a7a89a88f9f	857	857	de03d6ba-2e86-497b-b23c-a3dcbe9c03f4
2262	CREDIT	Donation via meetup	2363	USD	2016-10-04 18:14:59.695-04	2016-10-04 18:14:59.884-04	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2363	\N	dfb49d74-e609-4cc8-8c3e-46ff770309f3	857	857	df892894-8ed7-4fde-a276-604f3e6762f5
3617	CREDIT	Global Development	20000	USD	2016-11-30 16:11:00.067-05	2016-11-30 16:11:00.307-05	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	eb089b39-6f9d-41c8-9c70-ca094bacbc0a	857	857	e38ec0b9-9f7a-4343-b5cd-576784411dd3
4374	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:48:52.922-05	2016-12-27 11:48:53-05	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	f81b72fd-ff9d-453c-85aa-83f26b75e23f	857	857	edd0e210-9488-4003-91ca-6d032dd22423
2263	CREDIT	Network Development	17375	USD	2016-10-04 18:15:45.133-04	2016-10-04 18:15:45.269-04	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17375	\N	43365b78-5277-49da-b188-6a517a926473	857	857	ef4b6484-f984-419f-8c86-7fee2f796fde
3540	CREDIT	Donation from PB - fees 	1187	USD	2016-11-29 18:33:50.04-05	2016-11-29 18:33:50.206-05	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	b1569a2e-654e-4108-9c97-de12187ef171	857	857	f4e68981-d777-42ac-a6ab-ae6f42d781b9
4263	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 12:20:13.429-05	2016-12-23 12:20:13.545-05	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6d9dd70c-2b98-4094-8a7f-d8d14ebdfe64	857	857	f763b116-f78f-4a0e-9bfa-7b95b227e4b9
4380	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:58:32.613-05	2016-12-27 11:58:32.719-05	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52c10ec3-fc17-4bb0-80dd-b97ef1359708	857	857	f8d1f5ee-d65a-4258-b00c-452906f84784
3533	CREDIT	Network Development	20000	USD	2016-11-29 17:43:53.719-05	2016-11-29 17:43:53.971-05	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	7a9cb9ef-afdd-4d85-b4b5-fa52e346eb92	857	857	f9f86389-baae-43b7-8f64-026ca4a0004f
2235	CREDIT	Turner Matching Donation	5000	USD	2016-10-04 11:46:59.013-04	2016-10-04 11:46:59.134-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	f900d59d-399a-4087-8a99-d5dc330e4483	857	857	fada5aa0-efa3-4a6c-8209-babe8b26b8a1
66	CREDIT	Donation to WWCode Atlanta	1000	USD	2016-01-29 17:23:53.315-05	2016-04-16 16:40:58.701-04	12	30	39	\N	\N	13	0	50	59	USD	1	1000	891	\N	03ad4ae8-f8d6-4d38-88d8-d6ebf43650b9	691	857	a241159e-94b3-4338-a3cc-fe61d56e23bc
74	CREDIT	Donation to WWCode Washington DC	100	USD	2016-02-02 12:09:22.069-05	2016-04-16 16:40:58.697-04	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	86ca72b0-3163-400d-83e1-e17d7f182d7e	691	857	a3438076-9ed5-4045-b8cb-42c40e37de0e
3542	CREDIT	Donation from Margaret - fees	2012	USD	2016-11-29 18:37:14.82-05	2016-11-29 18:37:15.082-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2012	\N	3e72e75f-912e-4507-8a12-e73a2a2baecb	857	857	06e64f9d-a4db-49a7-8f39-7eb3c3da1704
2411	CREDIT	Network Development	17750	USD	2016-10-11 15:17:21.991-04	2016-10-11 15:17:22.199-04	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17750	\N	f87d62ba-99de-42b8-9039-9165dfc2022b	857	857	095272ad-67ff-425d-86bc-50f14ec0836a
2397	CREDIT	Google I/O stipend	75000	USD	2016-10-11 12:01:42.326-04	2016-10-11 12:01:43.286-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	85005ce6-d4f3-4b07-98d0-ef524443de8a	857	857	0c2b58db-6d38-4cb5-a8a4-d06599f357b0
2421	CREDIT	Donation Elizabeth B.	9000	USD	2016-10-11 20:22:08.455-04	2016-10-11 20:22:08.557-04	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	d6590406-0ffc-489f-ab6a-3436c8be0d3a	857	857	0cd1b7e3-2d44-4ee1-90eb-e051bdf1c108
5017	CREDIT	WWCode t-shirt sales	4397	USD	2017-01-17 22:20:52.226-05	2017-01-17 22:20:52.436-05	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4397	\N	232dcd17-1057-4c79-ade5-b368a259f68f	857	857	1f71ecee-d020-425b-9776-65a2bd98e372
3956	CREDIT	Donation via Meetup - fees + Global Development	1187	USD	2016-12-13 15:17:57.936-05	2016-12-13 15:17:58.19-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	940cd510-b8a8-460d-b494-d2e4a216ad9e	857	857	27142ec4-9f9b-42a0-b21c-f8a94b5abebf
666	CREDIT	Generous donation from Target to support WWCode Twin Cities	500000	USD	2016-05-26 14:37:24.922-04	2016-05-26 14:37:23.286-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	345acef4-87b2-455f-beef-b23517d7a460	857	857	3ac82e78-cb84-4406-a84a-d9f44cad52e0
2413	CREDIT	Donation from Biotti	403	USD	2016-10-11 15:32:58.956-04	2016-10-11 15:32:59.265-04	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	403	\N	b07d171f-6a06-4bf1-b5ab-44b28a4d2fe6	857	857	45494226-1649-4545-a1be-7bde656578b0
2236	CREDIT	Donation: Beth Laing	5000	USD	2016-10-04 11:47:24.058-04	2016-10-04 11:47:24.175-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	a4d7f6ff-8014-48b0-aef8-c0d0d62ef7af	857	857	5383d79e-5b48-4518-9a8a-7bf945be7fe4
2265	CREDIT	Donation Hannah B.	9000	USD	2016-10-04 18:35:46.967-04	2016-10-04 18:35:47.153-04	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	41b245bb-086f-4199-81b9-d6900db24611	857	857	559baeb7-84b8-4669-ab17-77bb082ae6ee
3543	CREDIT	Donation via Meetup	775	USD	2016-11-29 18:39:08.069-05	2016-11-29 18:39:08.263-05	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	d13f4546-ddb3-4403-8ffa-3e94709cd39e	857	857	607ba94b-1f62-4b27-916f-e4432a9b59cc
667	CREDIT	Proceeds from teespring	10022	USD	2016-05-26 14:38:50.077-04	2016-05-26 14:38:48.41-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10022	\N	dce42eaa-b86f-4baa-ac29-a12e270cd434	857	857	62c79544-bd61-4358-a843-ebecfecf19c1
9659	CREDIT	\N	60000	USD	2017-05-02 14:45:44.253-04	2017-05-02 14:45:44.253-04	51	3	\N	\N	\N	2677	0	0	0	USD	1	60000	60000	\N	3c6bb7c3-caff-4599-b462-6a53ea05cb0b	857	857	644e54bc-af4b-463f-9c67-ef5913edc3e8
306	CREDIT	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	2250	USD	2016-04-06 14:17:07.204-04	2016-04-16 16:40:58.818-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	d96508af-a33c-42bc-9446-bc438652e8a8	857	857	6a13fe4a-3baf-4a57-bdd7-ea3fca6b0852
4441	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 11:29:31.983-05	2016-12-28 11:29:28.409-05	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3c2a09b0-ab81-4e66-8ec6-a6946e367763	857	857	6a766ac0-27e4-431e-b03e-8cd5c6bf3c08
4360	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 11:10:30.416-05	2016-12-27 11:10:30.529-05	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	271d48b8-2cba-40e7-bafa-e632e30dbbce	857	857	6bf4cef5-a11b-4a38-8059-07b90affbbe2
3527	CREDIT	Banner	2000	USD	2016-11-29 17:34:22.96-05	2016-11-29 17:34:23.085-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3097b9bd-e10a-4598-bd6d-b035d0f33f73	857	857	6d5e14b4-683d-41e7-8b51-8039dfab5311
3523	CREDIT	Global Development	19100	USD	2016-11-29 17:17:18.389-05	2016-11-29 17:17:18.558-05	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	93342e23-5a6d-4557-8988-d48bda18046b	857	857	6d80e417-4f90-4164-8f2d-8b8affbe3bd8
325	CREDIT	From:\tThao Le	1500	USD	2016-04-12 14:49:06.645-04	2016-04-16 16:40:58.815-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1a6b4663-7869-49ba-9691-9b3bec6843c4	857	857	6de2a79b-faa8-43a5-95d6-87797acffd04
5018	CREDIT	WWCode t-shirt sales	1599	USD	2017-01-17 22:21:50.791-05	2017-01-17 22:21:50.964-05	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1599	\N	d2873b77-1ea2-48e6-894b-a460b9462b1f	857	857	72878535-0361-4ee6-a729-c335c77036ce
2419	CREDIT	Network Development	20000	USD	2016-10-11 16:03:19.884-04	2016-10-11 16:03:20.084-04	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b5dcca3b-559b-4c43-83ff-a31cd387d1f2	857	857	72bcaf22-1e3a-4883-8a9c-2c7d25bf7f2b
4280	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 14:37:32.49-05	2016-12-23 14:37:32.668-05	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4e27357d-7c4c-43e4-b29e-773872e443e8	857	857	7572a9eb-fca5-47f5-a11f-4d095a64b5a6
2415	CREDIT	Donation Ailia S.	9000	USD	2016-10-11 15:44:42.807-04	2016-10-11 15:44:43.161-04	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	37933bd0-775c-4ff6-914b-9be5c19aec41	857	857	75a7b386-f301-4046-9824-1efa61edc805
3541	CREDIT	Global Development	20000	USD	2016-11-29 18:34:32.59-05	2016-11-29 18:34:32.817-05	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	3930af5b-22e9-43a5-b3b5-4c28e21c4a3b	857	857	8070413a-e7f7-4ee1-8592-ca952f9bf64a
3522	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 17:12:36.336-05	2016-11-29 17:12:36.503-05	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	e671d019-152e-4857-b2d0-2d1a5545e33d	857	857	85d375fb-3ba1-4b4f-a808-2b2d59899a7e
3206	CREDIT	$3500 Course Hero Hackathon support - transaction & global development	304500	USD	2016-11-17 13:27:12.528-05	2016-11-17 13:27:12.742-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	304500	\N	05d80488-2759-4454-abe3-0a379836df31	857	857	871f41d2-abc6-4179-9fd8-be6c030eab56
1042	CREDIT	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	320247	USD	2016-06-29 14:42:31.848-04	2016-06-29 14:42:32.517-04	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	320247	\N	3f5141a2-01ec-4026-8ebd-f1d232237947	857	857	a27bbf56-ae64-405f-b928-f3af18211692
3528	CREDIT	Regional Leadership Director Training 	13031	USD	2016-11-29 17:35:05.252-05	2016-11-29 17:35:05.379-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13031	\N	ce5bf007-5b83-46b2-b82b-17ef62e16627	857	857	a42243f3-6e31-48df-b5e2-f34ec28ce576
2267	CREDIT	Network Development	15400	USD	2016-10-04 18:39:26.796-04	2016-10-04 18:39:26.9-04	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15400	\N	d40d88e7-8e48-43d2-b629-62c123b275bf	857	857	a8ef5a8c-6c19-456e-afb5-6dcb5304d4a5
3544	CREDIT	Donation via meetup	775	USD	2016-11-29 18:39:42.382-05	2016-11-29 18:39:42.512-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	00e31b6f-e424-4f4b-b51e-73cc1c290081	857	857	a9e7ca7a-e51c-4f87-97b4-b9579a431412
3957	CREDIT	Donation via meetup - fees and global development	775	USD	2016-12-13 15:20:15.375-05	2016-12-13 15:20:15.714-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	2c90bf2f-4941-48ed-828c-db67f8249cc1	857	857	ae547542-6b14-450e-9d87-36742267a641
2416	CREDIT	Network support - thanks VMWare	200000	USD	2016-10-11 15:50:00.045-04	2016-10-11 15:50:00.312-04	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	200000	\N	a4e80a28-1270-4c9e-870c-de3011dd78c7	857	857	b0f27dc8-0323-4fa8-8186-bea54af15350
2414	CREDIT	Network Development	17500	USD	2016-10-11 15:35:59.115-04	2016-10-11 15:35:59.305-04	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500	\N	bd1df48d-4123-4817-b44a-698351ad76c5	857	857	bb0b3578-a969-48a8-bde5-7443369002d8
2237	CREDIT	Donation: Syema Ailia	2500	USD	2016-10-04 11:47:46.468-04	2016-10-04 11:47:46.624-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	445859c1-2d38-4be2-8d47-7b91e62aad55	857	857	c77f49a7-d5f2-4e25-aed8-d30b546ea8db
3524	CREDIT	Network Budget Balance Pre Open Collective	17475	USD	2016-11-29 17:28:03.065-05	2016-11-29 17:28:03.231-05	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17475	\N	3ca715da-37c9-48d6-8b41-15a1dd421d81	857	857	cc6a02a6-6f9d-414a-b7ae-022a5e66326a
3525	CREDIT	Network Development	2500	USD	2016-11-29 17:29:22.958-05	2016-11-29 17:29:23.167-05	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	a973cade-bced-498a-aaf3-f6a4f60ca02e	857	857	d037ada2-5bbf-4688-a266-f9f0c787e001
333	CREDIT	From Deepa	1500	USD	2016-04-12 17:18:56.547-04	2016-04-16 16:40:58.847-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	886f2733-7967-4b61-93c1-f8242037a5a4	857	857	d8c00eb0-c2f9-42c2-9bc7-4cb50efcfef3
412	CREDIT	Andrea S	1500	USD	2016-04-27 16:05:44.711-04	2016-04-27 16:05:44.974-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1f5994ab-e490-47ec-af2a-97af7960004f	857	857	e27c1431-69ae-485f-96c2-d20d984f1fb8
4188	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-21 13:49:47.667-05	2016-12-21 13:49:47.892-05	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	74434b16-1798-42d0-92da-547acdf24d48	857	857	e2ee710e-c8fd-404e-ad2a-4caec9c5c0a7
4443	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 11:31:33.43-05	2016-12-28 11:31:29.837-05	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c257c047-567a-47fb-b8b7-02b7f7a90b12	857	857	e36e005e-4d76-4c2d-80ca-658821ed1a07
3624	CREDIT	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 16:25:31.161-05	2016-11-30 16:25:41.165-05	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	09bd1cc4-9ecf-4dd9-a3a6-2bfe654015da	857	857	e5cb98a1-8dfc-410e-bb8f-2d47bab0470a
4270	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-23 12:55:42.091-05	2016-12-23 12:55:42.249-05	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	2acba33f-e56b-49f2-886b-86388493777d	857	857	eaaf02c5-02c3-4c01-ac05-1f799ffadd67
2412	CREDIT	Network development - thanks Atlassian	50000	USD	2016-10-11 15:30:14.934-04	2016-10-11 15:30:15.155-04	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b3fcd677-f2e2-4f24-b35b-b81ab513f215	857	857	ec5117fb-9e9d-453e-b049-f3afb90e6584
2420	CREDIT	Network Development (Thanks Zendesk)	16129	USD	2016-10-11 16:26:22.964-04	2016-10-11 16:26:23.172-04	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16129	\N	2b973f59-80ae-4046-996e-35e967509adc	857	857	eea8e7d2-ec82-4b76-88a3-2f1810236d0c
5016	CREDIT	WWCode Boston t-shirt sales	1964	USD	2017-01-17 22:19:47.816-05	2017-01-17 22:19:48.024-05	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	06f8f818-4527-4882-a50c-40de00ed8711	857	857	fd6acaac-0c7a-4ada-82f3-832ce113a122
281	CREDIT	Recurring subscription	100	USD	2016-04-02 15:27:54.641-04	2016-04-16 16:40:58.809-04	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	09102f53-5640-469e-8568-f546e4636908	691	857	23b8ff4b-c219-4ad0-a66e-530a683ce5e5
128	CREDIT	Recurring subscription	100	USD	2016-03-02 13:19:33.362-05	2016-04-16 16:40:58.737-04	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	9b592cfc-6e21-487e-9471-b7491af84c89	691	857	e9c1f464-5e05-49f3-96de-18f46a489ee8
857	CREDIT	Recurring subscription	100	USD	2016-06-09 13:28:30.802-04	2016-06-09 13:28:30.841-04	3	8	385	\N	\N	320	5	10	33	USD	1	100	52	\N	78157dc7-3c5e-4ff2-a9ce-819906bd27fc	819	857	b1354921-4cd1-4360-be0e-6dd5cf273ff6
4586	CREDIT	Recurring subscription	1000	USD	2017-01-01 18:32:21.416-05	2017-01-01 18:32:21.416-05	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	630da817-bfc6-4c3e-8ef4-45d11c81e37e	803	857	a6d88fa8-4a25-4ac6-82e5-0e5916ca2665
8365	CREDIT	monthly recurring subscription	1000	USD	2017-04-10 00:43:06.965-04	2017-04-10 00:43:06.965-04	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a25de37e-df40-4317-90a5-36e217a8ba46	737	857	ed9642b4-b795-42e0-90e4-1d0f1f8af2d2
3201	CREDIT	T-shirt payout	1092	USD	2016-11-17 13:03:13.726-05	2016-11-17 13:03:13.862-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092	\N	c83bd839-4222-4e75-b71b-afe58b183300	857	857	04f1fb7d-b4a1-4cf3-b39d-d47cf93a4cb7
659	CREDIT	Women Techmaker WWCode Partnership Grant	20000	USD	2016-05-25 12:45:53.797-04	2016-05-25 12:45:54.045-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b0965077-da41-4ea3-9ff4-a25d7be1a3b6	857	857	0519e087-2ca2-4e5a-a02e-e4e565ec392e
6882	CREDIT	Leadership Development 	14915	MXN	2017-03-07 07:55:53.128-05	2017-03-07 07:55:53.3-05	511	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14915	\N	58f1389a-1aa3-43b7-8283-5a0d75c4e827	857	857	11ac33a6-84f1-42c6-a843-e2359ac1883a
4402	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 13:37:31.611-05	2016-12-27 13:37:31.721-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4d7adb92-d878-4a73-9f39-2c1f66559ba7	857	857	14273180-6985-4957-8193-0e8aad6753c1
4391	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-27 12:52:16.09-05	2016-12-27 12:52:16.167-05	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6f001acd-c75e-4d02-a339-faede0477c42	857	857	1c7e1c6f-2519-4fa0-bce6-2eeb22cc23a5
4404	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-27 13:40:49.86-05	2016-12-27 13:40:49.921-05	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	84192755-dac6-4b18-996a-89fe17acc8d1	857	857	210d6874-4b38-4092-93b5-3e7dd7ab10e1
4677	CREDIT	Donation from Cameron - fees and global development	4350	USD	2017-01-04 15:33:36.359-05	2017-01-04 15:33:37.475-05	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4350	\N	79fb7110-6a80-49d9-9d52-eca9ba262867	857	857	2720aa2d-b5a3-4d00-a8dd-0c5509695f02
2305	CREDIT	Google I/O scholarship	75000	USD	2016-10-06 13:21:27.384-04	2016-10-06 13:21:27.396-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	eb17e756-ee3f-434d-9493-8f6fbc94ea78	857	857	28af6a5b-7d95-42d1-9aa6-14187e5b5a4b
2312	CREDIT	Network Development (100%)	10000	USD	2016-10-06 14:42:47.682-04	2016-10-06 14:42:47.71-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	655af063-49c8-4b0b-9288-086d5e290e34	857	857	2ab7a7ac-6deb-47b9-97cd-0b84940bdcdf
2534	CREDIT	Director t-shirt	2898	USD	2016-10-17 16:57:08.514-04	2016-10-17 16:57:08.533-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2898	\N	bbf57164-512a-42db-baa3-b91df0b4080c	857	857	2ec26257-80f2-48bd-bc48-23996e0abd99
4397	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 13:10:14.864-05	2016-12-27 13:10:14.928-05	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	f09463dc-da20-4c6a-95fc-b96c106b3d00	857	857	32b081bb-0a21-4501-8aef-e86bb83e3b15
4701	CREDIT	donation - fees and global development	798	USD	2017-01-05 09:48:24.355-05	2017-01-05 09:48:26.734-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	798	\N	42c8ea1c-5292-4ee1-8768-97d910be5fe2	857	857	378095d5-8633-4171-861e-be9957ab5196
4702	CREDIT	Donation - fees + global development	1187	USD	2017-01-05 09:58:39.771-05	2017-01-05 09:58:42.205-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	9eb3b1c1-578e-4b80-be38-c28a2c634474	857	857	39918b2b-100e-4a44-b2ee-78104ee215c0
4400	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 13:33:56.275-05	2016-12-27 13:33:56.372-05	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	2f11fdfd-c8b2-4a58-8669-76610d85ac20	857	857	3a1c520f-0bbb-42ef-97ad-7b4cbf181c13
3203	CREDIT	$1000 CDK Global event support - transaction and global development	87000	USD	2016-11-17 13:18:40.107-05	2016-11-17 13:18:40.436-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	87000	\N	cda2e9ae-7568-4ca0-a5a6-b6e8b99fdfb4	857	857	3e8c842c-24c5-40b4-b3e2-db4a8a5a23a0
9695	CREDIT	\N	150000	USD	2017-05-03 13:32:39.653-04	2017-05-03 13:32:39.653-04	12	3	\N	\N	\N	2693	0	0	0	USD	1	150000	150000	\N	839c847a-30e8-463a-912f-a6845435eca0	857	857	40590215-80dd-4031-af1b-7f52ea8d4e36
653	CREDIT	Women Techmaker WWCode Partnership Grant	15000	USD	2016-05-24 16:12:34.913-04	2016-05-24 16:12:35.226-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000	\N	4ec3f9b1-a7c7-4887-b029-6a3f17ada0c4	857	857	520eed32-5b1d-43d3-9d3d-f6c5cc6d4549
4378	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:53:55.856-05	2016-12-27 11:53:55.969-05	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	aa3d7224-7382-4f6f-a0f5-2949228f2339	857	857	5b53f78e-44c9-42c2-b5f0-a80de96e94a4
4434	CREDIT	Global Development for Meetup Fee	6000	JPY	2016-12-28 11:00:53.27-05	2016-12-28 11:00:49.939-05	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0dfc10e6-6037-41d3-a5cd-6ba9f5471978	857	857	65cab975-fdba-49fd-880e-498adb65dc50
702	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	80000	USD	2016-05-31 14:01:08.532-04	2016-05-31 14:01:07.064-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	8c1d5f60-5e9f-4262-966c-0b0006e7d309	857	857	70c25002-010f-4719-86a1-b53b766f231d
4370	CREDIT	Global Development for Meetup Fee	5700	EUR	2016-12-27 11:34:45.59-05	2016-12-27 11:34:45.771-05	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	7c5dc3dd-2211-4c62-bdf3-1d1bff4db06a	857	857	73dd0d17-d17d-4787-81f5-649e715262f9
4395	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 12:59:52.939-05	2016-12-27 12:59:53.047-05	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52f1331f-b669-4782-b63a-984ccb097928	857	857	75e86b03-d614-4b46-a0f0-5da2492d96a6
4426	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 10:46:26.348-05	2016-12-28 10:46:22.824-05	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	549184b8-9951-44b3-804f-5306177e8ec1	857	857	820454f4-4aca-4324-9792-0b427cb327cf
4437	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 11:24:49.292-05	2016-12-28 11:24:45.838-05	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1f4c7218-151d-4502-a979-3271e65d57da	857	857	82396f62-2dcb-43f3-a1ce-fba7bc97cf0f
5021	CREDIT	WWCode t-shirt sales	3563	USD	2017-01-17 22:28:29.874-05	2017-01-17 22:28:30.096-05	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3563	\N	2dde7e29-f8fa-4b52-86c1-3cfeb0c374e3	857	857	93b2bb9b-023d-494d-940d-54577b2f5967
4284	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 14:48:39.526-05	2016-12-23 14:48:39.685-05	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cc5c76d9-46e6-4435-8ec6-f0328e93c66c	857	857	93bd1c45-bcff-4b38-9586-c05972dd2951
2268	CREDIT	Network budget pre Open Collective	6264	USD	2016-10-04 18:51:25.324-04	2016-10-04 18:51:26.129-04	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6264	\N	2bd3e74c-84e0-43e2-a21d-b9443200eedc	857	857	a06d642d-560f-4866-a6b8-34293b0cd740
673	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	50000	USD	2016-05-26 16:48:43.015-04	2016-05-26 16:48:43.336-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	93c08587-c4fb-4077-9f65-00b8920ce72e	857	857	a4051d55-3e02-4fd7-b335-6273205b101d
2398	CREDIT	Network Development	20000	USD	2016-10-11 12:02:18.108-04	2016-10-11 12:02:19.138-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9ed15360-3e2f-4801-ac5a-2b41471bc68a	857	857	a8018c09-95aa-4442-9002-b21fc4be572c
4363	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:14:47.836-05	2016-12-27 11:14:47.951-05	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	e496c717-ce4a-41a6-b861-8eae2c81db9c	857	857	a8f7270c-7d07-4fde-87ec-e3b16c907cc5
4435	CREDIT	Global Development for Meetup Fee	6000	CAD	2016-12-28 11:21:14.024-05	2016-12-28 11:21:10.449-05	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	06fa2587-6ff6-4229-ab30-031b2088aa97	857	857	b105fe8d-0213-486a-8299-bd400d3da822
4439	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 11:27:36.9-05	2016-12-28 11:27:33.309-05	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	23d6372f-2d2d-4cbb-afee-5a05e2ef89ce	857	857	b7ac20db-aa13-451a-a52b-4a243297476c
2405	CREDIT	Donation Scott Z. in honor of his sister	1800	USD	2016-10-11 13:01:23.313-04	2016-10-11 13:01:23.731-04	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800	\N	99b8d53c-6e5b-40ee-a937-5d414c12adc6	857	857	bb6b0447-91d5-4532-81ce-05f6c74f6d56
4365	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:22:09.234-05	2016-12-27 11:22:09.351-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	88c4ac88-4f6e-40d9-8cdb-5eee6e9a9dee	857	857	be19864f-9599-4c02-80d3-b8ac4baf039f
7374	CREDIT	Leadership Development: Google I/O grant for Luisa M.	100000	USD	2017-03-22 13:56:10.528-04	2017-03-22 13:56:10.804-04	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	100000	\N	3144121e-26df-4745-84f9-51b0af25530c	857	857	beee6e11-f546-4822-93c3-5686940cd89f
3534	CREDIT	Stephen	450	USD	2016-11-29 17:55:31.534-05	2016-11-29 17:55:31.727-05	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	bc8ea724-7089-4d7e-80dc-6ed375a7bc76	857	857	bef512af-4207-4b43-a5e9-a426a6e74bbf
2270	CREDIT	Network Development	13286	USD	2016-10-04 18:57:17.136-04	2016-10-04 18:57:17.293-04	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13286	\N	7382b702-3956-405b-b6af-b9d1b04e89ba	857	857	cb33d7f6-8dad-497e-a95d-a75af939d81c
4393	CREDIT	Global Development for Meetup Fee	6000	MXN	2016-12-27 12:56:03.911-05	2016-12-27 12:56:03.985-05	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	910351cc-fb5f-43ea-bccb-fa3a211093a7	857	857	dbb011dc-857a-401a-a84c-cab3e80f3a9f
3200	CREDIT	Portland t-shirt proceeds	6915	USD	2016-11-17 13:01:32.1-05	2016-11-17 13:01:32.49-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6915	\N	c96721bd-c150-4300-b6b9-144a4019cefb	857	857	eccb2174-0c76-4ba8-9c5f-cdf2b5acd47d
2406	CREDIT	Network Development	18200	USD	2016-10-11 13:02:51.621-04	2016-10-11 13:02:51.839-04	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18200	\N	8bc77fb9-7ed7-4099-91aa-18899658861b	857	857	f532f112-4dc3-4293-b8eb-1e914c13f7d0
6883	CREDIT	Leadership Development	50616	MXN	2017-03-07 08:01:15.044-05	2017-03-07 08:01:15.192-05	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50616	\N	aaecc386-1923-482a-835a-4662c8858bc3	857	857	f745a867-5d9b-4f93-8846-9e1969d89fe4
2269	CREDIT	Donation from Adane	450	USD	2016-10-04 18:56:11.881-04	2016-10-04 18:56:13.02-04	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	ea31005b-cb3b-42d7-9b8c-1c812558ee14	857	857	f7fed7d7-2c06-40f4-885c-e02fc3520158
7913	CREDIT	monthly recurring subscription	2500	USD	2017-04-01 14:31:19.231-04	2017-04-01 14:31:19.231-04	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	50d19e33-e65e-4c4f-b3bc-851253fdfda5	692	857	4e3c5e17-66a7-41ee-ad57-5ad0f753524d
9926	CREDIT	\N	1000	CAD	2017-05-10 19:45:46.737-04	2017-05-10 19:45:46.737-04	522	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860139854	715	786	\N	52d35c0c-9b28-47ca-973a-07470814a70b	747	857	94d99f44-fc14-4c09-a5b7-5f70a82c98c4
5948	CREDIT	Macy's donation - fees and global development	435000	USD	2017-02-13 19:21:10.361-05	2017-02-13 19:21:10.558-05	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	435000	\N	31a781ff-5d17-4026-96c3-a5134a2aff92	857	857	03f2ce19-18c7-4d5d-9390-3b4bd48cd001
8608	CREDIT	\N	100000	USD	2017-04-17 16:41:37.627-04	2017-04-17 16:41:37.627-04	517	3	\N	\N	\N	2472	0	0	0	USD	1	100000	100000	\N	58ac0411-2d75-4b99-b49f-853c0659a78e	857	857	07d97f6f-d2ae-4d7f-a749-c7408b1b2050
4376	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:52:05.93-05	2016-12-27 11:52:06.061-05	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	59f7ddd7-ade8-4ebf-977e-cb823b5ab4cd	857	857	0d8e9c8f-020e-4f5b-a9e1-353782611c4f
5763	CREDIT	Donations via meetup - fees/global development	2000	USD	2017-02-06 17:56:24.306-05	2017-02-06 17:56:24.52-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	96e04578-a558-4d24-a5d5-14d1b469f341	857	857	1173aeb5-5f4c-40bb-96a2-7bc5f37cc316
8619	CREDIT	\N	25000	MXN	2017-04-17 18:34:32.259-04	2017-04-17 18:34:32.259-04	511	3	\N	\N	\N	2487	0	0	0	MXN	1	25000	25000	\N	3b170ab8-edef-4461-983d-efd3689fda2c	857	857	14221234-6a75-4baf-b380-68c78f80ea2d
8606	CREDIT	\N	9000	USD	2017-04-17 15:41:07.659-04	2017-04-17 15:41:07.659-04	277	3	\N	\N	\N	2471	0	0	0	USD	1	9000	9000	\N	58e25bdf-36bf-4707-bb32-eabd40e0558f	857	857	1541b52e-a4f6-432a-b6ce-823d18b7c6be
8308	CREDIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	24750	USD	2017-04-07 12:43:42.261-04	2017-04-07 12:43:42.673-04	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27a1347b-f50e-4eb5-af41-d06f4b4bc654	857	857	16fe8457-a183-47f6-be81-2e6e4d456a37
7295	CREDIT	Paypal Fees for Travel Stipend	3000	USD	2017-03-20 11:38:54.453-04	2017-03-20 11:38:53.749-04	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000	\N	fea87b26-175e-46ed-b94c-5d7bcec1778f	857	857	200b3adf-a300-4777-8f07-8a07533073fa
8672	CREDIT	\N	1480	USD	2017-04-18 20:20:11.527-04	2017-04-18 20:20:11.527-04	12	3	\N	\N	\N	2506	0	0	0	USD	1	1480	1480	\N	41154072-0424-4ec6-9f81-9ca8cce5420a	857	857	2179d4d2-1ea8-490a-8201-d535c9325b51
4282	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 14:40:51.309-05	2016-12-23 14:40:51.479-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	bf5087f3-ca93-402e-8c80-5383c23112a4	857	857	2381bb08-ee7c-4a0f-aba9-33335ecf09c0
8611	CREDIT	\N	85000	GBP	2017-04-17 17:05:15.067-04	2017-04-17 17:05:15.067-04	278	3	\N	\N	\N	2474	0	0	0	GBP	1	85000	85000	\N	afc6310f-79f8-4fa7-9010-33c13c3dfeec	857	857	2602104c-059a-4699-a2ec-c864ad850aaa
4405	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:44:22.123-05	2016-12-27 14:44:22.207-05	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3407cb90-d12e-4698-ae45-68a7626be287	857	857	2a4c3f6b-2157-49fd-a6d5-1d84a48fb5a9
8624	CREDIT	\N	100000	USD	2017-04-17 18:40:40.357-04	2017-04-17 18:40:40.357-04	430	3	\N	\N	\N	2490	0	0	0	USD	1	100000	100000	\N	37a49008-00ca-489c-876a-6d26c25a46bb	857	857	3f31bbab-1925-4397-8600-e5c7f46fc7a0
4248	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:45:15.022-05	2016-12-23 11:45:15.147-05	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34260b9e-5cfa-458e-9861-4b037755571a	857	857	451dc3be-ec3d-4788-a883-aa45be30f5cb
8612	CREDIT	\N	4250	GBP	2017-04-17 17:06:54.803-04	2017-04-17 17:06:54.803-04	278	3	\N	\N	\N	2475	0	0	0	GBP	1	4250	4250	\N	cda5fd1c-4285-4631-aff6-7a4a1fb62bcb	857	857	4b407c04-7664-4284-819b-09efc78ac86e
4250	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 11:50:35.869-05	2016-12-23 11:50:36.131-05	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	7adbc52c-6996-4d28-899c-835e1561a1b0	857	857	55d4421e-43b3-4607-b487-9ff452df69b2
3629	CREDIT	Global Development - Thanks VMWare	50000	USD	2016-11-30 16:34:00.324-05	2016-11-30 16:34:01.658-05	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	a8125046-2c82-43f8-bf5a-3930226ad6d9	857	857	59147961-7892-4f21-9a4a-38a711f0eb8b
9385	CREDIT	\N	154800	USD	2017-05-01 14:02:20.511-04	2017-05-01 14:02:20.511-04	13	3	\N	\N	\N	2649	0	0	0	USD	1	154800	154800	\N	557379b2-4691-47ed-b4bc-30b67a70bcf1	857	857	626eb770-4a37-48b0-864a-9c4f53dc8b89
3510	CREDIT	Global Development	80000	GBP	2016-11-29 16:14:00.118-05	2016-11-29 16:14:01.107-05	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	1a0ffc67-8650-41fd-b3ff-7af4d6f81cbc	857	857	74c0aa04-aa06-4efa-bfc3-83d44a7e132b
4411	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:54:51.439-05	2016-12-27 14:54:51.679-05	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0c8ffef8-b8d3-43b7-ad21-4d41571029cd	857	857	77d95b00-160f-4992-a5e1-32d6a44ada62
8615	CREDIT	\N	100000	USD	2017-04-17 18:09:42.57-04	2017-04-17 18:09:42.57-04	270	3	\N	\N	\N	2477	0	0	0	USD	1	100000	100000	\N	d6795ff7-d1a1-4a77-a77b-a0731062a244	857	857	8481cf7b-4a56-433b-ae1c-d366926f8ab7
8305	CREDIT	\N	20000	USD	2017-04-07 08:25:51.09-04	2017-04-07 08:25:51.09-04	516	3	\N	\N	\N	2393	0	0	0	USD	1	20000	20000	\N	01371a79-bfe1-455d-9fae-8901be6f2dbe	857	857	88c4f410-8bfe-4e58-8026-2ca1fb354835
675	CREDIT	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	34750	USD	2016-05-26 16:50:28.413-04	2016-05-26 16:50:28.721-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34750	\N	5dc5651e-3b65-4b03-aa66-30990d7efb15	857	857	8970a092-2d0a-4aef-8d69-e28af07aedb7
4252	CREDIT	Global Development for Meetup Fees	6000	USD	2016-12-23 11:54:04.928-05	2016-12-23 11:54:05.055-05	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	084b10da-1bc1-4f57-84d2-3f7089d7c993	857	857	8eafd7ac-0326-4375-b9bb-7b4d72fee84e
6733	CREDIT	Event sponsorship - transaction fees and global development 	856500	USD	2017-03-02 01:00:43.46-05	2017-03-02 01:00:44.182-05	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856500	\N	7fef39d1-1059-4a44-94f9-5da063341c94	857	857	92b4a9ce-6205-4173-9229-806bb98ffdbc
7294	CREDIT	Travel Stipend for Google I/O	100000	USD	2017-03-20 11:17:43.622-04	2017-03-20 11:17:42.994-04	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	e9057982-2758-4b71-96a7-7e852f7d4a0e	857	857	935ff7a1-0a2a-4fe9-9670-05d520f51f19
8620	CREDIT	\N	18800	MXN	2017-04-17 18:35:06.093-04	2017-04-17 18:35:06.093-04	511	3	\N	\N	\N	2488	0	0	0	MXN	1	18800	18800	\N	72c1775e-82bb-418c-8112-0953e2c003a2	857	857	9416e1d9-07c1-44c4-a1ae-3103e3c0e583
7511	CREDIT	Leadership Development: Google I/O travel grant for Gen A. 	85000	USD	2017-03-27 09:25:14.008-04	2017-03-27 09:25:14.169-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	85000	\N	7092cdf1-407a-4c49-bddd-4729693bb136	857	857	9a9b6f95-afa5-44ea-8274-455dc7921d3e
7661	CREDIT	\N	50000	USD	2017-03-31 13:17:51.695-04	2017-03-31 13:17:51.695-04	2	3	\N	\N	\N	2204	0	0	0	USD	1	50000	50000	\N	fbf7dada-78ae-4886-9094-aed19838ed67	857	857	a198562b-52cc-4fe7-a263-d580b59447c4
4189	CREDIT	Global Development for Meetup fee	6000	USD	2016-12-21 13:49:53.054-05	2016-12-21 13:49:53.302-05	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	54daaaa7-92d1-4072-9e26-e3664a7eddda	857	857	a1b031bb-1d5b-4917-a0ca-dd787ee7e2aa
7518	CREDIT	\N	50000	USD	2017-03-27 13:10:04.622-04	2017-03-27 13:10:04.622-04	12	3	\N	\N	\N	2151	0	0	0	USD	1	50000	50000	\N	9c3381f8-416c-44f2-8e0a-a9d37855a5fe	857	857	c0e32927-acf1-4d51-ad1d-00780a474ca0
8609	CREDIT	\N	5000	USD	2017-04-17 16:41:53.602-04	2017-04-17 16:41:53.602-04	517	3	\N	\N	\N	2473	0	0	0	USD	1	5000	5000	\N	434d7fb0-0b13-4100-bcc9-38a711f799ad	857	857	c3377529-43b8-4f9f-b66c-dcb8dc2259da
4246	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-23 11:32:00.456-05	2016-12-23 11:32:00.622-05	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	713fdfe3-6cf7-4520-aee5-e18c6cf12071	857	857	c5f0174f-3e89-4902-ac37-0cd75245245d
7525	CREDIT	\N	100000	USD	2017-03-27 13:52:38.123-04	2017-03-27 13:52:38.123-04	277	3	\N	\N	\N	2153	0	0	0	USD	1	100000	100000	\N	5fd1044d-b479-447e-bfb5-e6f578c69921	857	857	c92ce00f-4360-4d64-a2f0-de92f8b65130
655	CREDIT	Women Techmaker WWcode Partnership Grant	100000	USD	2016-05-24 16:23:16.28-04	2016-05-24 16:23:16.552-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	1afc5e7f-3794-4830-8b96-08ce05be814a	857	857	cd4e57f4-47dd-4e61-b775-3cb95c96fd04
9943	CREDIT	\N	90000	USD	2017-05-11 12:41:16.759-04	2017-05-11 12:41:16.759-04	59	3	\N	\N	\N	2794	0	0	0	USD	1	90000	90000	\N	97b3a399-75b9-4ed4-b244-db56f1e2cac0	857	857	d2ad1efa-2f9a-4ce0-8f80-3dba7f1ba6eb
4409	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:51:47.92-05	2016-12-27 14:51:48.117-05	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	9f8c45b8-537c-4f0f-bb8a-928b528feab2	857	857	d547134d-ef04-44bc-a8bc-3c3d6884beac
4407	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 14:48:41.246-05	2016-12-27 14:48:41.318-05	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0764379a-89bf-4a0b-b3cf-02ced834e7c3	857	857	d991f442-b419-4cbf-9006-16a9bd34586a
2331	CREDIT	Network Development	15755	GBP	2016-10-07 10:03:54.031-04	2016-10-07 10:03:54.119-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15755	\N	61afdaf6-bfb9-4948-bca0-bd656fbc2d6f	857	857	f48b2782-b4ca-4438-b2d8-1805cd8e4ef3
8617	CREDIT	\N	41000	GBP	2017-04-17 18:31:52.729-04	2017-04-17 18:31:52.729-04	278	3	\N	\N	\N	2486	0	0	0	GBP	1	41000	41000	\N	463ec0d3-ae29-42e5-97ee-277cca8ceca9	857	857	f5a5b41d-2dbc-48f6-bb31-5889f0a2a89c
7198	CREDIT	WTM Google I/O Travel Stipend	50000	USD	2017-03-17 10:09:18.868-04	2017-03-17 10:09:18.344-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	9972b655-8830-4ac6-b9c7-2e373feebc03	857	857	f6248499-4b09-4006-9daa-fbf2a872451d
8605	CREDIT	\N	4000	GBP	2017-04-17 15:31:52.919-04	2017-04-17 15:31:52.919-04	267	3	\N	\N	\N	2470	0	0	0	GBP	1	4000	4000	\N	c32af448-af25-450f-9fe0-4b3c5f8345a5	857	857	f71d0b44-3468-4234-8908-e715c6f3281b
614	CREDIT	Women Techmaker WWCode Partnership Grant	70000	USD	2016-05-19 15:17:47.24-04	2016-05-19 15:17:48.401-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	ddd97a2d-71eb-4643-aae4-af9a7e7fad4e	857	857	f8ffad3b-a7dd-4487-8cbb-dff04f985457
8621	CREDIT	\N	2200	MXN	2017-04-17 18:35:55.014-04	2017-04-17 18:35:55.014-04	511	3	\N	\N	\N	2489	0	0	0	MXN	1	2200	2200	\N	a30d7b67-9e28-40c1-a02c-9fd585600114	857	857	fa521a41-29a2-46bb-a86f-01f6d1de24f0
449	CREDIT	Donation to WWCode Washington DC	50000	USD	2016-04-28 11:01:17.801-04	2016-04-28 11:01:17.846-04	13	283	213	\N	\N	181	2500	5000	1480	USD	1	50000	41020	\N	d7208bd6-4f00-4c5d-b85e-3792419450d5	824	857	316b4cb3-3577-43f5-a43a-8d38a6598afd
3876	CREDIT	Recurring subscription	100	USD	2016-12-09 13:29:17.341-05	2016-12-09 13:29:17.341-05	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	77717eed-fb45-4bf8-a43d-45391bee0f68	819	857	237ef3dc-b1d5-4763-ad78-61c70137096c
2360	CREDIT	Recurring subscription	100	USD	2016-10-09 14:36:17.958-04	2016-10-09 14:36:17.958-04	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	53835d40-3ec2-48e7-8d85-8f9381ef368c	819	857	7fc57297-759d-4b7f-912e-d6386989d237
1498	CREDIT	Recurring subscription	100	USD	2016-08-09 14:30:50.866-04	2016-08-09 14:30:50.915-04	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	8a688e20-988b-4f55-b69d-bb6632da3ece	819	857	7a4f9fc3-4cc5-4b41-adb9-4de78d9ac4c8
1876	CREDIT	Recurring subscription	100	USD	2016-09-09 14:29:12.276-04	2016-09-09 14:29:12.276-04	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	0883360f-716b-4be8-a920-9ab0f71e399b	819	857	5d5bcb44-1b42-49f1-9cf5-4719eb49f5c9
1174	CREDIT	Recurring subscription	100	USD	2016-07-09 14:31:14.547-04	2016-07-09 14:31:14.585-04	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	321662c1-bd0e-45c1-a83b-15734580a904	819	857	f963ceb7-af15-4090-a84b-b2bf92e2e40e
290	CREDIT	Recurring subscription	100	USD	2016-04-02 22:02:46.616-04	2016-04-16 16:40:58.82-04	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	3464d1b8-8be5-451a-bee5-fd4129ac6455	819	857	89946395-8ddf-423d-8a1c-8d5a17facf7d
1461	CREDIT	Donation to WWCode Austin	150000	USD	2016-08-05 16:48:08.414-04	2016-08-05 16:48:08.458-04	2	192	589	\N	\N	513	7500	15000	5250	USD	1	150000	122250	\N	3cd012ba-7cbf-4008-b0db-7a4b51a0d7df	805	857	3f2fe82c-bf15-4f99-9a57-435dd74fa5ea
3471	CREDIT	\N	4000	USD	2016-11-28 10:33:14.428-05	2016-11-28 10:33:14.428-05	2	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	3282	\N	52c746a4-eba7-4a0f-963c-e6e2e3f22f53	810	857	c4776ec9-eafb-43af-bd21-97ab7c4a9dc6
1395	CREDIT	Recurring subscription	1000	USD	2016-08-01 19:35:39.219-04	2016-08-01 19:35:39.244-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	9056ebd9-568b-47c4-ba61-a4830e554a1c	803	857	3aff9fac-16d8-4337-be20-fee5d95a4070
1080	CREDIT	Recurring subscription	1000	USD	2016-07-01 18:38:37.594-04	2016-07-01 18:38:37.617-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d414ca78-a0ca-4706-8533-c9f54acba200	803	857	2062dff6-837d-42e0-8c7a-de8149f8f1f2
9595	CREDIT	monthly recurring subscription	1000	USD	2017-05-01 19:34:11.708-04	2017-05-01 19:34:11.708-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	c70f2fd8-da04-4f99-97a1-72c05a99dfa1	803	857	a6e00b78-bf0e-4f84-a1be-a0512d225ac8
478	CREDIT	Donation to WWCode Austin	150000	USD	2016-05-03 09:07:28.39-04	2016-05-03 09:07:28.452-04	2	308	230	\N	\N	191	7500	15000	4380	USD	1	150000	123120	\N	31bd69fa-cc92-405a-a116-d31a2a40d4d1	798	857	82853be8-9389-4e75-af20-a1fdeadb25de
2143	CREDIT	\N	19000	USD	2016-09-28 17:47:18.302-04	2016-09-28 17:47:18.302-04	2	1299	842	\N	\N	768	950	1900	665	USD	1	19000	15485	\N	c4585b37-a213-4c1c-ba1f-8b9a0a9e3793	795	857	6a06d034-559d-4f35-a30d-6abb3f4dd10c
2055	CREDIT	\N	25000	USD	2016-09-22 21:07:09.492-04	2016-09-22 21:07:09.492-04	59	1263	790	\N	\N	700	1250	2500	580	USD	1	25000	20670	\N	c037d2a1-7fa4-4875-b084-2c8d7605d567	792	857	81c0f9cd-fa02-4b53-9b10-5a5a689b04cd
984	CREDIT	Donation to WWCode Atlanta	100	USD	2016-06-21 12:02:56.072-04	2016-06-21 12:02:56.13-04	12	642	430	\N	\N	359	5	10	32	USD	1	100	53	\N	fdf511fc-d0e4-4322-aa0a-49ebacbb1e08	775	857	d001bbe7-a784-411f-8c3f-881f783d5c7e
986	CREDIT	Donation to WWCode Twin Cities	100	USD	2016-06-21 12:06:05.517-04	2016-06-21 12:06:05.626-04	48	642	432	\N	\N	361	5	10	32	USD	1	100	53	\N	44e3ee1d-5777-4ea7-9dfb-e651db755946	775	857	27de8579-59fc-4e3d-bf57-e9add6445f3e
645	CREDIT	Donation to WWCode Austin	50000	USD	2016-05-23 16:27:28.524-04	2016-05-23 16:27:28.599-04	2	426	306	\N	\N	258	2500	5000	1480	USD	1	50000	41020	\N	f63c7344-8631-43e0-8d56-70bf3f01998c	741	857	bcc6f772-cba2-4b19-abdd-7b459c2be5fe
1392	CREDIT	Donation to WWCode Austin	20000	USD	2016-08-01 11:55:27.083-04	2016-08-01 11:55:27.184-04	2	884	562	\N	\N	489	1000	2000	470	USD	1	20000	16530	\N	c0b172e7-1ce8-45a7-a51d-5c1098baeeb8	750	857	f8dc278d-b349-43b4-be90-5dac5901dd1a
1884	CREDIT	Recurring subscription	1000	USD	2016-09-09 23:42:56.392-04	2016-09-09 23:42:56.392-04	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a73ee6ae-c18d-406f-a24b-4c04f218c3e3	737	857	41b568a9-1078-4f48-9c39-e267aecc11b7
1787	CREDIT	\N	200000	USD	2016-09-01 10:41:36.24-04	2016-09-01 10:41:36.24-04	2	1094	707	\N	\N	622	10000	20000	4430	USD	1	200000	165570	\N	b7a1007d-6e00-4764-b983-c9d27abc2296	738	857	670802d2-f06c-4125-b999-65dd2e48d068
8756	CREDIT	AJUG - Global and fees	26250	USD	2017-04-20 17:39:17.741-04	2017-04-20 17:39:18.323-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a365b026-a438-43c2-9628-8abfa5258787	857	857	0d075412-8701-493e-89cf-550cc0bcd68b
5023	CREDIT	WWCode t-shirt sales	1964	USD	2017-01-17 22:29:40.155-05	2017-01-17 22:29:40.284-05	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	6dc8501e-0ceb-40ab-b920-9dc4d4de6ce3	857	857	1fe75861-e92e-48bc-9506-32f2e181a1ab
5031	CREDIT	Donation via meetup	775	USD	2017-01-17 22:48:10.558-05	2017-01-17 22:48:10.699-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	060c2bcb-850a-442e-96a3-907124fbb5e6	857	857	3b71a9e4-6819-439c-a2de-4037208530f4
8708	CREDIT	\N	610	USD	2017-04-19 14:35:03.04-04	2017-04-19 14:35:03.04-04	59	3	\N	\N	\N	2522	0	0	0	USD	1	610	610	\N	477a5aef-b895-4774-8b86-b1f5156fd8b6	857	857	4a781259-5ecd-4872-8bd8-564456b9eabc
5750	CREDIT	Donations - Fees 	17328	USD	2017-02-06 15:06:15.502-05	2017-02-06 15:06:15.622-05	2	3	\N	2017-02-05 19:00:00-05	\N	\N	\N	\N	\N	\N	\N	\N	173	\N	3bda2f71-4a09-4f4d-9ba9-4d52bdcd10a5	857	857	4d8f998f-9a40-43ae-bbdd-ab756c9f0352
7683	CREDIT	\N	100000	USD	2017-03-31 18:32:34.123-04	2017-03-31 18:32:34.123-04	286	3	\N	\N	\N	2212	0	0	0	USD	1	100000	100000	\N	ed1324c1-c55c-47b7-ac88-afc3f3ba3a7d	857	857	53460141-b1cc-4449-af00-504e48077496
5022	CREDIT	WWCode t-shirt sales	1106	USD	2017-01-17 22:29:09.407-05	2017-01-17 22:29:09.561-05	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106	\N	ee1df537-bb8d-44e0-ada4-42c56888c466	857	857	58c425fd-5349-4cfe-9804-45ff0842c48d
5024	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 22:30:10.748-05	2017-01-17 22:30:10.906-05	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	35f3b1a6-7368-418d-9a03-f1da4b5de91f	857	857	68726c91-0477-4c2b-b220-65dfd5d449aa
8706	CREDIT	\N	40000	USD	2017-04-19 14:26:01.228-04	2017-04-19 14:26:01.228-04	3	3	\N	\N	\N	2520	0	0	0	USD	1	40000	40000	\N	5272792e-d8c4-4354-8dff-c2e24a66999a	857	857	7866a845-12b5-4c53-838a-c6133b0e56c8
9621	CREDIT	\N	2930	USD	2017-05-01 20:33:45.73-04	2017-05-01 20:33:45.73-04	3	3	\N	\N	\N	2662	0	0	0	USD	1	2930	2930	\N	08015eaa-ad1d-4dd5-9704-3de345b88094	857	857	826beb60-8fce-415f-902a-7f170e644a29
330	CREDIT	Intel Donation	100000	USD	2016-04-12 16:32:35.997-04	2016-04-16 16:40:58.826-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	925c1460-bda7-448f-8dd9-83291db33330	857	857	8c8a4ce4-020e-4a83-b317-602bbcc7705a
5026	CREDIT	WWCode t-shirt sales	4742	USD	2017-01-17 22:31:50.631-05	2017-01-17 22:31:50.774-05	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4742	\N	971f4ef3-3672-4497-8b8e-863c2c187206	857	857	9c04ead9-f53a-4eee-b6ab-dbb3f9c1cfcd
5028	CREDIT	WWCode t-shirt sales	2371	USD	2017-01-17 22:33:30.061-05	2017-01-17 22:33:30.587-05	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2371	\N	480c104e-d92f-4c75-8e48-a396ffb0172a	857	857	a4a96bc7-e851-4c91-a74b-d7e6694d1d92
8707	CREDIT	\N	1190	USD	2017-04-19 14:26:58.997-04	2017-04-19 14:26:58.997-04	3	3	\N	\N	\N	2521	0	0	0	USD	1	1190	1190	\N	6189157f-8088-48c0-9964-a66fe4fcfee1	857	857	af0e2e6f-cc41-4c4f-a5be-9b34707e19b4
2303	CREDIT	Network development (stickers)	58590	USD	2016-10-06 12:08:20.916-04	2016-10-06 12:08:21.09-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58590	\N	3169934f-3f78-4faa-959d-7141ff24163b	857	857	be4802de-f720-40f5-a10a-ebb86aa78d54
5755	CREDIT	Gitlab - transaction and global development	41400	USD	2017-02-06 17:12:42.534-05	2017-02-06 17:12:42.684-05	48	3	\N	2017-02-05 19:00:00-05	\N	\N	\N	\N	\N	\N	\N	\N	414	\N	ef68d68b-3fdf-4a96-951d-ac953118ce75	857	857	c6dc9ff9-2ff2-49ad-99f2-c91fc26f00d9
7686	CREDIT	\N	20000	USD	2017-03-31 18:50:23.915-04	2017-03-31 18:50:23.915-04	286	3	\N	\N	\N	2214	0	0	0	USD	1	20000	20000	\N	93ca4243-7895-4061-b20e-8d0aaaa2a3f9	857	857	ce70a388-ce9d-4f35-8d39-cc5818a899f6
5029	CREDIT	WWCode t-shirt sales	7570	USD	2017-01-17 22:34:31.424-05	2017-01-17 22:34:31.75-05	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7570	\N	98fcd6a4-bf53-4bc0-8277-7935794a138b	857	857	d504d71b-2ab4-43fd-a645-6eb2f63a9d58
5277	CREDIT	Global Network Development	500000	USD	2017-01-25 13:27:46.907-05	2017-01-25 13:27:47.421-05	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	54b79a9d-1205-4d4c-aa91-534fa732fefb	857	857	d9b6f587-3d7e-4a35-821b-2fbd5d0c8c6c
5751	CREDIT	Taipei Donation - fees and global development	800	USD	2017-02-06 15:11:26.406-05	2017-02-06 15:11:26.522-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	7de04ec6-4f91-4e9f-a7e1-f3ccc020cacc	857	857	de1c4ac6-b3ff-40ad-a654-d7f428c7abc7
5764	CREDIT	Donations via meetup - fees	1200	USD	2017-02-06 17:58:38.922-05	2017-02-06 17:58:39.29-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	2b8aeffe-03c4-493a-a5aa-a8733db5860d	857	857	e6c58998-ba04-458f-b589-c1fe19ba4331
5027	CREDIT	WWCode t-shirt sales	1389	USD	2017-01-17 22:32:30.654-05	2017-01-17 22:32:30.825-05	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1389	\N	166cbb4b-156f-4b77-84d3-a7b2bba53d7f	857	857	e7169c88-74f1-438d-983e-dfc9b6db087e
8705	CREDIT	\N	1480	USD	2017-04-19 14:18:19.043-04	2017-04-19 14:18:19.043-04	2	3	\N	\N	\N	2519	0	0	0	USD	1	1480	1480	\N	48409b35-4280-4659-971c-3ec3178252f0	857	857	ead92266-7e60-45e7-92ab-ade9261f6b1b
7687	CREDIT	\N	7500	USD	2017-03-31 18:52:45.079-04	2017-03-31 18:52:45.079-04	286	3	\N	\N	\N	2215	0	0	0	USD	1	7500	7500	\N	a8c774d9-c22c-4df9-a8a2-7b7fb56da05c	857	857	fc5e979e-8837-4afc-be84-f2fe7e452811
5754	CREDIT	Donation - fees	800	USD	2017-02-06 17:10:44.604-05	2017-02-06 17:10:44.763-05	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	2628a845-d10d-4426-8c12-14dba874aae2	857	857	fe236503-94c6-412b-b85c-164dc10a0b92
5044	CREDIT	\N	10000	USD	2017-01-18 08:54:50.597-05	2017-01-18 08:54:50.597-05	48	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	8250	\N	629c628a-29cb-4690-b71e-ad06f390ea21	697	857	38612131-79ce-400c-b325-3ae4978fed31
4123	CREDIT	\N	2500	USD	2016-12-18 20:41:29.006-05	2016-12-18 20:41:29.006-05	259	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	2040	\N	c13eb052-de5b-4e23-b45b-e405f937cfd7	699	857	4751be73-1cc8-48cc-be27-47535d936770
5540	CREDIT	\N	2500	USD	2017-02-01 12:30:48.467-05	2017-02-01 12:30:48.467-05	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	a88cbaf9-3c16-494f-9fb9-1ff207e24d4a	692	857	be9ef1cf-097b-4f1b-a6e2-1612cd79f29b
6709	CREDIT	monthly recurring subscription	1000	USD	2017-03-01 18:40:00.024-05	2017-03-01 18:40:00.024-05	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	71e7d3cd-cd4b-465b-a6d1-a0242bb22558	803	857	c2404866-3381-407c-a4ad-06a19e56e0ac
4899	CREDIT	Recurring subscription	1000	USD	2017-01-14 12:12:01.244-05	2017-01-14 12:12:01.244-05	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	63e320d2-5114-4fc3-8daa-8c636b663d98	762	857	a83d27cd-998c-4920-a7af-fdae10cf3a38
6700	CREDIT	\N	25000	USD	2017-03-01 17:51:20.759-05	2017-03-01 17:51:20.759-05	59	1263	2048	\N	\N	1953	1250	2500	580	USD	1	25000	20670	\N	bd4cecda-d52c-4c14-9ffa-5831f212eb3f	792	857	8e40f784-4f9c-4723-8291-87e37f008f1a
5533	CREDIT	\N	22500	USD	2017-02-01 10:16:20.999-05	2017-02-01 10:16:20.999-05	48	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	18600	\N	6d643f90-fadf-4d61-bdcf-784eba7d76d1	801	857	082294e4-0496-47a3-ad4b-6190b7a8e735
5861	CREDIT	\N	84241	USD	2017-02-10 11:47:34.349-05	2017-02-10 11:47:34.349-05	15	3053	1890	\N	\N	1801	4212	8424	1883	USD	1	84241	69722	\N	fc5a47be-5fc1-4a9a-bc52-978334aa0481	838	857	7fec13ad-bca7-481c-8457-4b66d5d7a0c4
130	CREDIT	Donation to WWCode Austin	30000	USD	2016-03-02 16:31:50.516-05	2016-04-16 16:40:58.67-04	2	129	94	\N	\N	25	0	3000	900	USD	1	30000	26100	\N	00dfdd70-caa9-4d07-9a89-7157a9464d5c	689	857	f10c89c6-78c1-48c0-b553-f9e2996684a1
2189	CREDIT	Recurring subscription	1000	USD	2016-10-01 19:35:17.911-04	2016-10-01 19:35:17.911-04	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	07c91ea8-acd4-4942-9cfd-c48cebb9daef	803	857	eb5944ba-4556-410f-abf4-423dd690e9c8
6931	CREDIT	\N	6000	USD	2017-03-09 13:29:55.496-05	2017-03-09 13:29:55.496-05	259	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	4938	\N	16affe26-a286-4782-8426-d75e1806aef8	754	857	86aa011d-7558-41f1-9368-85dc44cd7f3e
2261	DEBIT	Beverage for Denver June meetup	-2279	USD	2016-10-04 18:09:25.159-04	2016-10-04 18:09:26.045-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2279	\N	392b3edc-b418-4e67-81a4-4a3310f969c7	51	857	acae0d67-c045-4fdd-9b53-c96b6b580909
331	DEBIT	Global Development	-10000	USD	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.849-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	80	4bb6798b-e4d6-46aa-a5c3-2d0644c040c9	51	857	cc6c2efe-9f1b-480d-9dab-5dba47f1e539
1579	DEBIT	Minimum fee - May	-990	USD	2016-08-16 10:53:06.001-04	2016-08-16 10:53:06.015-04	13	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-990	\N	934eda05-b122-4c9e-8b1a-097bfb4018d7	51	857	681b71fd-629a-4d33-8c34-576c59b05e52
1578	DEBIT	Pizza for July monthly event.	-12555	USD	2016-08-16 10:52:47.781-04	2016-08-16 10:52:47.799-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12555	\N	826070d5-3387-42cf-a309-b25b59fd86b1	51	857	c0cb2ef4-6880-422e-b5ea-d9bcd3144b6e
865	DEBIT	Reimburse Caterina Paun for supplies and mailing expenses	-5504	USD	2015-12-14 19:00:00-05	2016-06-14 14:14:22.175-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5504	225	391f2946-af6d-4dad-9a31-43496d058bb4	51	857	98323ab9-a5f8-47d3-8ac6-9e3462a07d91
2244	CREDIT	Donation via Meetup	1203	USD	2016-10-04 12:46:07.882-04	2016-10-04 12:46:07.993-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1203	\N	bbbc1082-58db-4cc2-b14d-7cadc2caabe8	857	857	0d8179b9-e627-44fd-9857-7bf9ddfba46c
4386	CREDIT	Global Development for Meetup Fee	4900	GBP	2016-12-27 12:32:02.798-05	2016-12-27 12:32:02.918-05	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	f57723cd-0a3e-4bf8-b686-8a60ae3e7e78	857	857	11f5d65b-4e63-4aff-9c2a-ad7317682426
2242	CREDIT	Reverse duplicate transaction	500	USD	2016-10-04 12:12:26.671-04	2016-10-04 12:12:26.903-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	\N	bfa51ebc-0ab7-4ed8-9f4e-e4862bf271ba	857	857	121f58c1-61e9-4343-bf2d-29b54475a604
5019	CREDIT	WWCode t-shirt sales	1229	USD	2017-01-17 22:23:59.112-05	2017-01-17 22:23:59.247-05	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1229	\N	a43c6a3d-406e-43de-98bb-0e151a1b8fea	857	857	16cace5a-a396-420d-9a17-2196710480fd
7667	CREDIT	\N	39800	GBP	2017-03-31 14:01:48.418-04	2017-03-31 14:01:48.418-04	278	3	\N	\N	\N	2209	0	0	0	GBP	1	39800	39800	\N	f38d81a7-0640-43e1-adaa-eae03b43254a	857	857	1aa568d9-e686-492a-bcdd-18259e0680d5
8673	CREDIT	\N	1400	USD	2017-04-18 20:31:31.942-04	2017-04-18 20:31:31.942-04	195	3	\N	\N	\N	2507	0	0	0	USD	1	1400	1400	\N	36ea5d6f-9e03-4116-8db7-201d91018475	857	857	1d750667-9b2d-4dbe-befc-f55ddea0d44b
8664	CREDIT	\N	3562	GBP	2017-04-18 15:41:30.286-04	2017-04-18 15:41:30.286-04	278	3	\N	\N	\N	2503	0	0	0	GBP	1	3562	3562	\N	0557cec2-bc9a-43c5-a702-38116a1ab389	857	857	26ffe66a-5692-42e3-8b7d-54cc8af438c4
4430	CREDIT	Global Development for Meetup Fee	6000	AUD	2016-12-28 10:55:25.022-05	2016-12-28 10:55:21.475-05	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1fa71cb1-e48d-4b0c-b102-30d66d120a1e	857	857	3c280868-8002-42bd-a688-26672bb6eda1
8671	CREDIT	\N	1198	USD	2017-04-18 20:19:14.321-04	2017-04-18 20:19:14.321-04	12	3	\N	\N	\N	2505	0	0	0	USD	1	1198	1198	\N	ff39b4d0-ec21-448e-a987-b2cf172c5bdc	857	857	3e1786f1-aa76-4276-a347-8c6eadc686a5
3618	CREDIT	Banner	2000	USD	2016-11-30 16:19:37.017-05	2016-11-30 16:19:37.251-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d33503e6-bb6e-4b24-b7ed-01842d266e8e	857	857	4e0fe764-59f7-446e-b18e-947c088aa130
5025	CREDIT	WWCode t-shirt sales	2778	USD	2017-01-17 22:30:54.132-05	2017-01-17 22:30:54.465-05	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2778	\N	bf1209ff-a6ec-4161-8120-65342983d214	857	857	4ed6c278-ef3c-4a62-b8a2-313de1fcbec4
2338	CREDIT	VMWare Network Support	195000	USD	2016-10-07 15:55:50.273-04	2016-10-07 15:55:50.509-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	195000	\N	e0aedba4-c471-4406-bc4c-480b6388a75d	857	857	615d2298-b32c-4f50-b70c-0257db7253b7
4368	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:30:02.12-05	2016-12-27 11:30:02.272-05	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	69ec7f71-fdf4-4fc1-a013-bcdf6353b94c	857	857	67d03a02-261d-4e37-be8b-3c90971a6f18
7523	CREDIT	\N	20000	USD	2017-03-27 13:45:17.58-04	2017-03-27 13:45:17.58-04	59	3	\N	\N	\N	2152	0	0	0	USD	1	20000	20000	\N	21139f0a-dcfa-4a47-90cd-bdf239e2cbcb	857	857	70fb7209-44c7-4352-a624-9ccb2aac7f72
5020	CREDIT	WWCode t-shirt sales	982	USD	2017-01-17 22:24:31.362-05	2017-01-17 22:24:31.504-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	e22d04c4-f74f-4484-a0b3-9007b55c94a8	857	857	726293af-cf87-4dbf-9125-f89bb6e6fae7
3521	CREDIT	Erica S. donation - fees	450	USD	2016-11-29 17:11:37.922-05	2016-11-29 17:11:38.131-05	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	21b0481e-bb75-445b-b121-6964171ec740	857	857	78fa1bf5-7a0f-459b-a369-f51fe376e88d
3519	CREDIT	Network Development - 10k member bonus	100000	USD	2016-11-29 16:58:23.625-05	2016-11-29 16:58:23.799-05	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	2266fe36-fda5-4fbb-bca6-7cda7e67318b	857	857	81cad528-ce65-413b-aeb9-75bebff4e954
7662	CREDIT	\N	79600	GBP	2017-03-31 13:20:23.917-04	2017-03-31 13:20:23.917-04	267	3	\N	\N	\N	2206	0	0	0	GBP	1	79600	79600	\N	bd840d8c-6019-4588-bc03-94a0ae07b331	857	857	856846fc-d2ef-4340-bac9-624be62beca6
858	CREDIT	Dalia donated to WWCode SF	1500	USD	2016-06-09 14:40:21.124-04	2016-06-09 14:40:21.833-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	ebf2964d-38ed-47f4-93dc-59fbb394dc73	857	857	98b9cc97-7e6b-43d6-a596-d4f9d491c623
7556	CREDIT	International Women's Day Atlanta	10350	USD	2017-03-28 14:28:28.77-04	2017-03-28 14:28:28.938-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6c8e7d6b-bcd8-44bc-a3c8-ab4f3fb6b3b5	857	857	b084d0b4-2fed-45c7-bde5-7502b3646e2d
7665	CREDIT	\N	80500	GBP	2017-03-31 13:54:33.461-04	2017-03-31 13:54:33.461-04	278	3	\N	\N	\N	2208	0	0	0	GBP	1	80500	80500	\N	d7f6d62d-4f73-400b-ac9e-57bcfac50780	857	857	b49eb2d3-c4e4-415f-8fd0-d6d11c78872b
9848	CREDIT	\N	16563	EUR	2017-05-08 11:30:18.585-04	2017-05-08 11:30:18.585-04	301	3	\N	\N	\N	2741	0	0	0	EUR	1	16563	16563	\N	04ec7dd9-0032-4318-99fa-52e21ff493ee	857	857	bd8a5e91-6874-4e32-b113-b3d7344639dd
2410	CREDIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	2250	USD	2016-10-11 15:13:57.013-04	2016-10-11 15:13:57.265-04	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	9a09da05-1e08-4b56-b452-1236e02b2a92	857	857	c8aa448b-6048-4e22-9ec6-394fe0ca61dd
3547	CREDIT	Network Development	20000	USD	2016-11-29 19:23:24.87-05	2016-11-29 19:23:24.511-05	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c97c359c-7c4d-491a-9489-1423fc900fd1	857	857	c9d4f0b4-e520-4150-bf7b-4e8431596f17
8675	CREDIT	\N	1480	USD	2017-04-18 20:39:23.15-04	2017-04-18 20:39:23.15-04	14	3	\N	\N	\N	2508	0	0	0	USD	1	1480	1480	\N	85822cfc-ab85-4318-b357-4cbff6b96682	857	857	cc63a3a0-eed9-4502-8ccd-78f1cca0ba7f
2418	CREDIT	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 15:51:45.723-04	2016-10-11 15:51:45.897-04	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370000	\N	90107c21-9ee4-41e1-b930-b991cd649629	857	857	d1f3b64c-3364-40a2-b584-5a2c775b140f
4432	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 10:57:55.359-05	2016-12-28 10:57:51.831-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0deb855b-d632-43c8-a2e3-f90f0db86bb4	857	857	d323e9f5-6b2f-4db2-8340-417addb4ddf6
2394	CREDIT	Conference stipend Heidi H.	50000	USD	2016-10-11 11:59:30.363-04	2016-10-11 11:59:31.524-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	0db54f37-f224-4eaa-ae93-e4a02bc97eef	857	857	d596365a-de4d-45e7-94f2-d616039b6423
4389	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 12:48:49.207-05	2016-12-27 12:48:49.297-05	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	076d787a-dbfb-4781-b854-e3cd9da444ec	857	857	e8577a0c-bf25-4dcf-8a3a-064cfb317d7e
499	CREDIT	Women Techmaker/WWCode partnership grant	50000	USD	2016-05-04 17:17:27.653-04	2016-05-04 17:17:27.886-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	c81e5698-25db-421e-80ce-4c04a817e59c	857	857	ff617604-b49b-4b4e-ae64-e82f6fe98456
1575	DEBIT	Minimum Fee - June	-995	USD	2016-08-16 10:51:24.796-04	2016-08-16 10:51:24.811-04	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	fc97ec24-7b82-4bd3-9b1a-fa6467d7a0b3	51	857	eab62b64-912e-42c5-b276-690d8a5d786b
1577	DEBIT	Food for Denver Meetup	-9939	USD	2016-08-16 10:52:04.669-04	2016-08-16 10:52:04.682-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9939	\N	eacc72ec-714e-4065-adde-f3d1cf5e4c95	51	857	7fcee816-7b2d-4f17-8346-01e5f850468b
668	DEBIT	Leadership Tools (director tees)	-2698	USD	2015-12-14 19:00:00-05	2016-06-14 14:14:22.114-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	192	f90b7ceb-7395-4eb6-b70e-aa3b53a18421	51	857	da9ec9c8-0692-4c23-b095-78cab23da4fc
569	DEBIT	Conference Grant	-50000	MXN	2016-05-16 10:49:37.27-04	2016-06-14 14:14:22.052-04	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	164	0076bcbc-8e3e-4830-87c4-d396f2cdf087	51	857	0a4e0cd5-1438-4901-bd48-24c9c23e8113
369	DEBIT	Stacey Schipper Reimbursement	-2322	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.873-04	15	3	\N	2016-06-14 14:14:22.471-04	\N	\N	\N	\N	\N	\N	\N	\N	-2322	92	570c1e94-beca-4a11-b728-e574dfead3e1	51	857	92687396-25bf-462b-9489-8972408c0652
329	DEBIT	Meetup Donation Transaction Fee	-163	USD	2016-04-12 14:52:16.188-04	2016-06-14 14:14:21.849-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-163	81	6fb44ff1-4646-411e-ac08-543d20851f57	51	857	90864887-43f0-48fa-881c-f805dc22edaf
9747	DEBIT	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	-101200	USD	2017-05-04 15:06:09.002-04	2017-05-04 15:06:09.002-04	430	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	-101200	1099	796b8ada-4bee-4687-a76e-d3f79e5030cb	51	857	2bb6c712-4be3-4889-b164-aebcfc04f70b
4377	DEBIT	Meetup Fee	-6000	USD	2016-12-27 11:52:46.242-05	2016-12-27 11:52:46.242-05	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	640	edf1e7f7-4ad5-40bc-a2f2-e83febc89c03	51	857	635a2d3a-fb15-4e21-9307-ddd7555de60a
2328	DEBIT	Conference stipend Olivia F.	-39585	GBP	2016-10-07 09:35:08.613-04	2016-10-07 09:35:08.724-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-39585	\N	46f8b259-603b-459f-a2b6-c72ed0c247b7	51	857	d25dcef7-e325-41b8-a09b-a309dc15621b
3829	DEBIT	Leadership Tshirt Order	-2698	USD	2016-12-07 11:51:43.784-05	2016-12-07 11:51:44.214-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	\N	1e99a559-2e7a-4e3d-be43-7fa857afba90	51	857	456a3123-ed0c-4099-92f1-a34da97a9136
3530	DEBIT	Regional Leadership Director Training	-631	USD	2016-11-29 17:38:46.551-05	2016-11-29 17:38:46.748-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-631	\N	fb0cd838-a20f-4a38-ad81-e738867085b8	51	857	90b9a67f-206f-4649-ae2e-db38f817a25f
2537	DEBIT	Director t-shirt	-3186	USD	2016-10-17 16:58:31.776-04	2016-10-17 16:58:31.789-04	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3186	\N	07e896c6-1747-42c3-ac92-ea9abc902e44	51	857	4b54c3fa-880d-417a-abd4-d0587d21ca59
2822	DEBIT	Sodas for ATXDivHack 	-3871	USD	2016-10-31 17:15:22.809-04	2016-10-31 17:15:22.98-04	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3871	\N	b31858ae-48a6-4dc9-a6e5-5c86bb6e6988	51	857	1b4e4169-6b9e-46d0-bd37-1560fc276c99
2403	DEBIT	Network Budget pre Open Collective	-11797	USD	2016-10-11 12:52:07.045-04	2016-10-11 12:52:07.303-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11797	\N	60fedebe-23fa-46fa-bf34-3b63869f1e51	51	857	7bb81769-7a2e-4462-95c0-91a5ddc8051a
2821	DEBIT	Wine	-1647	USD	2016-10-31 17:15:06.269-04	2016-10-31 17:15:06.517-04	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1647	\N	a1c67931-46a2-4a0a-9012-60f032d6d69e	51	857	ed264099-4013-49e9-b85b-4a4e1500e3cc
10135	DEBIT	Google I/O Travel Stipend	-100000	USD	2017-05-16 18:00:40.275-04	2017-05-16 18:00:40.275-04	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1088	d1a78d7e-acb9-4d9b-b6fd-2928ebfe9236	696	857	444dd3fc-27eb-4932-841f-2dfca7cc2adc
2424	DEBIT	Career development event w/ Mike Ross	-65000	USD	2016-10-11 20:42:04.584-04	2016-10-11 20:42:04.834-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	\N	e4ad5f18-a923-47eb-a3e1-601e2ba3238f	51	857	fc02a5bc-12ac-4e8c-857f-28b57a9eaad7
2239	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 12:06:09.85-04	2016-10-04 12:06:09.85-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	391	63e96179-a81b-4fba-880f-bc5d5a9f9e51	51	857	98e917d7-f93d-4397-8246-e97a8d7e1133
2238	DEBIT	90/10 split: Turner matching donation	-500	USD	2016-10-04 12:06:02.036-04	2016-10-04 12:06:02.036-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	393	9fcd3132-9867-42dc-85ce-b7435cb35563	51	857	0ad414b0-48e5-4b04-8bf0-e5459f5b78f0
376	DEBIT	Global Development	-250	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	96	ee258704-7659-4305-bd34-807117acf1d4	51	857	3854e905-3aac-44a8-bfe7-22e54dfd1887
1628	DEBIT	Marketing and communications materials for leadership team. 	-4264	USD	2016-08-19 13:25:04.062-04	2016-08-19 13:25:04.374-04	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4264	\N	fa3527b7-d566-447a-a671-3b80486e9c18	51	857	90c93320-481d-4678-8134-70ec3fcb01d0
1585	DEBIT	Minimum Fee - May	-1000	USD	2016-08-16 10:55:31.274-04	2016-08-16 10:55:31.288-04	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	17d4be5b-521f-499f-8753-2dbc163f2ec4	51	857	f09c5932-8026-4493-97d3-0d40030a8799
1584	DEBIT	Minimum Fee - June	-995	USD	2016-08-16 10:55:14.822-04	2016-08-16 10:55:14.844-04	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	e344373f-1e6d-416d-be2b-9ac1ce4866f4	51	857	e96db26e-69d0-4545-ad45-dfaad9c0c6b0
1586	DEBIT	Minimum Fee - June	-1000	USD	2016-08-16 10:55:45.164-04	2016-08-16 10:55:45.179-04	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	2ed495af-5080-42ac-b381-905d29be571e	51	857	f4f2bd20-cd10-428a-aa2b-b60a1c5133c9
1581	DEBIT	Minimum fee - June	-1000	USD	2016-08-16 10:53:58.922-04	2016-08-16 10:53:58.936-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	92e56306-3684-425f-b356-b67d306a0ae2	51	857	8862f841-c524-45f4-8ef6-518bb833c1d5
1629	DEBIT	Thank you materials for several events.	-6198	USD	2016-08-19 13:31:26.428-04	2016-08-19 13:31:26.891-04	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6198	\N	0b7f4317-3b95-47d5-89f9-245314e16769	51	857	ac781387-8a68-49b9-a640-0a61dcf91d4c
867	DEBIT	Global Development	-5000	USD	2016-02-21 19:00:00-05	2016-06-14 14:14:22.186-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	227	6b865d7e-c324-4c7a-85cd-1ba0aefb8303	51	857	f44b95e0-50ad-432c-8044-3122b47d39f8
670	DEBIT	FedEx Office	-3418	USD	2016-01-24 19:00:00-05	2016-06-14 14:14:22.114-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	195	2b7ba22c-916e-45dc-842c-8f7137976c4f	51	857	1938625a-2e3f-46d3-a165-7a04a0492706
1170	DEBIT	Global Development	-150	USD	2016-07-08 23:52:40.722-04	2016-07-08 23:52:40.722-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	88b9402f-6888-45e1-b572-0f7b29199c39	51	857	5d210958-05f6-45a6-9972-2af7b8bd8aa6
2396	DEBIT	Conference stipend Elizabeth M.	-75000	USD	2016-10-11 12:01:27.317-04	2016-10-11 12:01:28.351-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	6b335f4d-a920-4cfc-90a9-6dfe40dfef58	51	857	6cf824bf-5df7-4fa5-83bd-fce763971a65
2840	DEBIT	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	-70000	USD	2016-11-01 11:16:29.544-04	2016-11-01 11:16:30.012-04	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	be4916cc-ebfc-4a00-8c1f-6fdec9dad74c	51	857	ddf2e445-d145-47f6-a9d9-4285fd402eef
230	DEBIT	Feb 1, Lightning Talks	-22568	USD	2016-03-20 14:06:09.887-04	2016-03-29 16:37:47.75-04	2	28	\N	2016-03-28 20:00:00-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408a5bd-a893-4d39-8deb-eb1214cee9f5	847	857	f3de19e0-fa15-4b8d-814e-b617261c2879
228	DEBIT	Feb 4 hack night	-10284	USD	2016-03-20 14:06:09.887-04	2016-06-14 14:14:21.784-04	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10284	53	2e9e7313-b914-49f1-b17c-14d67569cbf0	847	857	523315a4-2381-44a1-b0e0-8add9711d0b9
99	DEBIT	IVA Libretas Hackathon	-166080	MXN	2016-02-16 13:58:04.663-05	2016-06-14 14:14:21.738-04	10	7	\N	2016-06-14 14:14:22.436-04	\N	\N	\N	\N	\N	\N	\N	\N	-166080	34	3c8bacb7-d7c6-4ce3-a801-55ecdd103839	821	857	6544a256-dafe-4430-b03f-b61e77b53dd9
3836	DEBIT	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	-6000	GBP	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	506	9b7434d9-7779-47eb-b087-5ffd3e765704	830	857	dff4e422-9a6f-4ad6-97c1-7ea0c90b3f3f
507	DEBIT	Quarterly planning meeting	-14000	USD	2016-05-05 20:18:43.265-04	2016-06-14 14:14:22.011-04	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	147	fbf72440-5d58-4805-afb9-5d67606dfa8c	797	857	6c8794ae-16dd-469a-a30a-ba398a0e37c7
273	DEBIT	Connect 2016 event setup day dinner	-6800	USD	2016-03-17 20:00:00-04	2016-06-14 14:14:21.838-04	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6800	72	97597693-ae20-489a-bc22-54b2b468147f	797	857	3f686988-8dd2-4b26-b0e7-b963aac68dc7
3864	DEBIT	European Leadership Development Workshop -- Transportation, Flight	-4700	EUR	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4728	494	e546ea27-19b6-4d72-8b95-6669cc95a981	793	857	febdded6-3269-4753-bde6-b30805b315e4
3863	DEBIT	European Leadership Development Workshop -- Transportation, Taxi	-4400	EUR	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4400	493	cc2b4a36-bd6e-45d8-a05b-36a6c5db6cde	793	857	e7d95942-3842-4948-990c-eacfe94ba464
253	DEBIT	WwConnect Conference	-658	USD	2016-03-19 20:00:00-04	2016-06-14 14:14:21.806-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-658	63	c4d44147-f630-42db-b84f-a28881d5dd21	766	857	6f723e93-7123-410d-a48a-6c6f1961b104
249	DEBIT	WwConnect planning meeting	-4656	USD	2016-03-10 19:00:00-05	2016-06-14 14:14:21.794-04	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4656	59	a8e050d7-a0ba-4b7c-8dac-f15e091454e1	766	857	029190b6-6c02-4437-87d4-fcbc5345d830
5275	DEBIT	travel to NY for bell ringing at NYSE	-30000	USD	2017-01-25 13:20:51.642-05	2017-01-25 13:20:54.592-05	12	70	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	743	db2e9b39-0096-457f-9db4-a5bb6814f55c	763	857	bd75ae01-53d9-4697-91f9-db3070343709
660	DEBIT	Conference Grant - Sarah Olson	-20000	USD	2016-05-25 12:39:09.882-04	2016-06-14 14:14:22.103-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	190	668072a8-b0b2-4538-8842-6ffb18f74196	51	857	ea15f896-418c-4a5a-8c79-90d4b5c3b851
669	DEBIT	Photographer: Mike Ross	-65000	USD	2016-01-05 19:00:00-05	2016-06-14 14:14:22.114-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	193	7bd8653b-9f4c-4f09-8ec0-99a8a1cdd2c4	51	857	daedaac3-b820-4fe9-b5fb-f5b4d7af7e74
1564	DEBIT	Minimum Fee - May	-1000	MXN	2016-08-15 15:22:45.367-04	2016-08-15 15:22:45.38-04	10	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	31262fe9-ba55-442a-b76b-b2e456cad550	51	857	9523eaf7-37af-4326-b48f-56c43b2a4226
654	DEBIT	Conference Grant	-15000	USD	2016-05-24 15:42:50.307-04	2016-06-14 14:14:22.103-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15000	188	712f3b65-3cfa-48ae-a939-483739ed9bd7	51	857	5092c179-7df9-4b60-a252-04f22a1c636e
2819	DEBIT	Gift for organizer	-3499	USD	2016-10-31 17:14:38.997-04	2016-10-31 17:14:39.22-04	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3499	\N	865b1387-7552-4c8d-9d1c-34ebf653db44	51	857	19657404-bc9f-44dd-9741-d4c53e044917
2818	DEBIT	Gifts for Organizers	-2399	USD	2016-10-31 17:14:19.644-04	2016-10-31 17:14:19.81-04	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2399	\N	f495583c-df24-4617-8cc5-d12616a0c36e	51	857	1b754d68-6e2d-4de1-ad0b-c63e9d0d4589
335	DEBIT	Global Development	-150	USD	2016-04-12 14:52:16.188-04	2016-04-12 17:19:43.124-04	4	3	\N	2016-04-12 17:19:43.124-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f5dffc9c-009d-4d80-9983-23b2bc1c0815	51	857	07042c31-989b-4e43-ab1a-e608d61b44cd
326	DEBIT	Global Developement	-150	USD	2016-04-12 14:46:49.263-04	2016-06-14 14:14:21.849-04	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	79	c284e464-38a5-4f87-9f50-a1c589f7dc1b	51	857	7ed446f6-6b28-4c41-9587-220502d98067
2417	DEBIT	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 15:51:28.361-04	2016-10-11 15:51:28.677-04	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-370000	\N	a8202103-9dc5-4f86-a2f1-1dbf770906a7	51	857	64ca78a1-0775-48fe-9f65-d38693330ec9
370	DEBIT	Global Development	-150	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	4	3	\N	2016-06-14 14:14:22.479-04	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	df345561-08a9-4963-8863-c675b0fb1006	51	857	6b5d799a-eabc-41f6-8ab2-4c9de7391096
413	DEBIT	Global Development	-150	USD	2016-04-27 12:21:00.228-04	2016-06-14 14:14:21.907-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	103	1a7a975b-c002-4d56-abfb-627346e0f303	51	857	6867bb4e-d8f8-4972-b694-d21e28c46fba
2266	DEBIT	 Network budget balance pre Open Collective	-4356	USD	2016-10-04 18:37:57.159-04	2016-10-04 18:37:57.359-04	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4356	\N	657fb992-7d1d-43b7-be03-5f9d23ccb189	51	857	114628d5-6791-4fb3-9c7f-b98ea9023cba
408	DEBIT	Global Development	-100	USD	2016-04-26 23:56:08.086-04	2016-06-14 14:14:21.897-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	101	bad5555b-64cf-4f72-85c7-124b7809ade5	51	857	8264e9d0-16b1-466e-8be8-812a0ed50735
2400	DEBIT	Test	-1000	USD	2016-10-11 12:18:39.252-04	2016-10-11 12:18:39.252-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	413	8d592b72-b737-4fca-995c-a0cee11c26fe	51	857	585cb93d-2740-43ee-b532-a2fdbba94924
350	DEBIT	Global Development	-100	USD	2016-04-15 13:29:50.291-04	2016-06-14 14:14:21.861-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	86	5d9c2c63-1706-434b-976f-38c44f019e58	51	857	302729e5-7beb-412d-bb50-3e1b9eb648cc
305	DEBIT	test 	-100	USD	2016-04-06 13:39:39.954-04	2016-04-06 13:46:25.532-04	14	3	\N	2016-04-06 13:46:25.531-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5161e6cf-8e5c-43e1-b626-da7e129d3fe6	51	857	e99bc7b6-143f-4f90-9d49-ef38ee02d68b
387	DEBIT	Global Developement	-100	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	13	3	\N	2016-06-14 14:14:22.48-04	\N	\N	\N	\N	\N	\N	\N	\N	-100	97	a30c4579-0d08-49fa-b863-e379e17e4cc4	51	857	7d74b07a-4fb4-4d63-a536-e1cc227370c1
401	DEBIT	CONNECT 2016	-2452	USD	2016-04-25 20:00:00-04	2016-06-14 14:14:21.896-04	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2452	99	9a5b52f2-5dcb-4760-8d33-ce2e4a2c24ef	51	857	a489e50d-2ce2-4ea4-8a83-5c8dc5fd7c08
703	DEBIT	CONFERENCE GRANT	-80000	USD	2016-05-31 13:47:01.276-04	2016-06-14 14:14:22.123-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	198	b08560a4-b373-40d8-91ef-20b273f83d98	51	857	d3a3a3f4-9383-49ce-bd8b-056704740f49
5284	DEBIT	Drinks (La Croix water) for Jan HackNight	-2093	USD	2017-01-25 13:41:33.613-05	2017-01-25 13:41:34.163-05	48	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2093	724	d365e630-ae76-45cb-b68c-cf1cf918566c	696	857	54f9727d-1b3b-4a8f-884c-2b7f8e828e79
5285	DEBIT	Amazon Echo Dot devices for HackNight and first book for our book club.	-22137	USD	2017-01-25 13:44:31.311-05	2017-01-25 13:44:33.251-05	48	142	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22137	725	37f44afb-0604-4a3b-b8a4-62a32c582d49	696	857	c6899e01-10c8-48de-8c72-f37f41d7b019
4442	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 11:30:16.279-05	2016-12-28 11:30:16.279-05	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	666	00be055b-1e12-4bd4-8e40-99bfd7602141	51	857	ecaa0f2b-3610-44b3-852b-d1adf2b8bed1
4444	DEBIT	Meetup Fees	-6000	USD	2016-12-28 11:32:19.412-05	2016-12-28 11:32:19.412-05	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	667	f5ff4621-9e2e-40c3-9b96-849ab7c5f17b	51	857	d92da950-7d82-4535-9a11-93100be233d7
4271	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 13:04:05.755-05	2016-12-23 13:04:05.755-05	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	624	429a48b8-77bb-4b7b-9e74-d18e7878caf0	51	857	818d7594-d574-477c-b55f-feef2e56609d
4385	DEBIT	Meetup Fees	-6000	USD	2016-12-27 12:27:09.602-05	2016-12-27 12:27:09.602-05	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	644	1113ed6f-035d-4558-a161-f41dbe01295f	51	857	272fcc84-a0c8-4167-89d7-1462ca0c908b
4183	DEBIT	45 webcam covers + shipping	-9685	USD	2016-12-21 10:39:46.852-05	2016-12-21 10:39:47.49-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9685	\N	d9cdec64-d87d-406a-bd84-c8a0b5a9bcb4	51	857	da018744-d743-4574-b6dc-3435969a7521
4383	DEBIT	Meetup Fees	-6000	USD	2016-12-27 12:03:23.101-05	2016-12-27 12:03:23.101-05	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	643	bf299265-3ef1-4480-b14a-3d20c988ef72	51	857	85d88d59-0e85-4c36-b69d-b4e86226907b
4379	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:55:07.385-05	2016-12-27 11:55:07.385-05	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	641	ec06bfa7-3251-4878-aa74-24f43641fa64	51	857	e4242037-8c8e-4a62-866c-9c472b81371b
4381	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:59:33.873-05	2016-12-27 11:59:33.873-05	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	642	b5e62766-527a-4a1a-92e7-0600510d8e57	51	857	5b6ec3dc-cdfd-463d-9f35-cec2860bdc40
3588	DEBIT	Frames for sponsor gifts	-4054	USD	2016-11-30 11:11:18.637-05	2016-11-30 11:11:18.805-05	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4054	\N	892315b3-81bc-4bd8-891b-3b167173d2bc	51	857	5dc12491-aed7-45cb-a4f3-aec689a3b955
3587	DEBIT	Postage to send hackathon gifts to sponsors	-1628	USD	2016-11-30 11:09:00.364-05	2016-11-30 11:09:00.529-05	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1628	\N	f36b82ec-cc72-4b8e-939b-73ea09a61f92	51	857	6f0b029b-a1d6-42a6-bfdd-7e6e03a72af8
3294	DEBIT	DIANA A. SCHOLARSHIP GOOGLE I/O	-25000	USD	2016-11-21 17:59:43.764-05	2016-11-21 17:59:43.764-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-25000	396	0753f9e4-051f-4578-a13f-72dce3b8075d	51	857	63cd10b1-39a2-4b74-b534-4d8d3315ea47
3515	DEBIT	Mathews Group 	-60000	USD	2016-11-29 16:45:09.136-05	2016-11-29 16:45:09.136-05	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	\N	c5efa3b7-8be0-4c0b-bbf0-d03f78aefba8	51	857	292d97d1-2353-4cd2-af1b-d322657d48f7
2938	DEBIT	dinner - downpament	-70000	USD	2016-11-03 15:36:06.461-04	2016-11-03 15:36:06.793-04	300	3	1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	12330ad4-6281-4e16-afad-353af55d6e65	51	857	fdd3cf03-f4f6-483c-a5f6-b2c1e7ececf2
3839	DEBIT	Food for October Hack Night.	-7700	USD	2016-12-07 00:00:00.86-05	2016-12-07 00:00:00.86-05	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7773	484	a55eb032-a0ab-4534-bd7b-86126196aa48	843	857	1eb8f1e2-2a21-4a3e-994d-ac842ccc605b
8306	DEBIT	Stickers	-14630	USD	2017-04-07 08:58:45.517-04	2017-04-07 08:58:45.531-04	516	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	-15084	889	fcf1e41b-dd9f-4534-ade5-5f6fa906d10e	841	857	300eb94b-16cc-4cd2-913a-b9b63715b641
10125	DEBIT	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	-11500	USD	2017-05-16 17:55:26.725-04	2017-05-16 17:55:26.725-04	14	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	-11500	1119	200f5721-452d-4ec0-bb90-0970b254c841	797	857	c46e5a86-e1fe-4bf2-a8d8-74beed69e911
7073	DEBIT	IWD event -- wine for event	-9732	USD	2017-03-14 13:22:31.446-04	2017-03-14 13:22:31.46-04	12	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	-10044	900	22a98043-eb9c-4d56-b246-f3529b741284	763	857	cd5da3ee-4796-477e-8bac-7d07878c6422
4251	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:52:20.827-05	2016-12-23 11:52:20.827-05	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	615	85f323a7-d2f8-447c-8420-1ad74cdd8d67	51	857	3f23c3f2-d3e8-4701-bee8-ca749db5f4fd
4249	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:49:17.444-05	2016-12-23 11:49:17.444-05	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	614	6efb3ac7-7d2a-4724-8a1a-ef64d45fe970	51	857	5d64ba93-2f74-4120-b4d8-01f80d9d1e6a
4247	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:37:59.322-05	2016-12-23 11:37:59.322-05	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	613	1f6591ab-8565-4278-a8ee-906fd65c5e69	51	857	9603f1dd-41b6-4fc7-8be5-032b4957e625
4410	DEBIT	Meetup Fees	-6000	USD	2016-12-27 14:53:07.2-05	2016-12-27 14:53:07.2-05	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	657	74cde2f7-e7c6-4e97-8c13-0bbaefa37e71	51	857	d63acf53-a03b-46ad-8f98-4d245070d4a7
4190	DEBIT	Meetup Fees	-6000	USD	2016-12-21 13:53:46.984-05	2016-12-21 13:53:46.984-05	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	607	d6799057-59a0-4562-8b3e-c2e3e9adf29b	51	857	11a7ae27-e2e0-4401-9115-59e0e16fec2d
3950	DEBIT	Decorations / Supplies	-1379	USD	2016-12-13 13:42:06.408-05	2016-12-13 13:42:07.17-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1379	\N	4a743da3-3e6f-482f-8ac3-dd26c8ed51ae	51	857	649acad7-15ec-4c12-a80b-50ff597702b4
3800	DEBIT	WWC T-shirt	-2798	USD	2016-12-06 11:59:36.33-05	2016-12-06 11:59:36.741-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2798	\N	4a126373-6cb3-4e7a-9a94-178466bcefb3	51	857	355d9dba-cb8f-4195-bf95-df1a443ac8e7
3799	DEBIT	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	-7750	USD	2016-12-06 11:57:59.164-05	2016-12-06 11:57:59.708-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7750	\N	b09fb537-00cb-4928-9a19-5551090d370a	51	857	10bc42d7-ba63-479e-b9f2-81e639ab74dc
3798	DEBIT	WWCode Seattle network retreat	-6207	USD	2016-12-06 11:57:26.568-05	2016-12-06 11:57:26.935-05	14	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6207	\N	116ff80c-993e-4c5a-83d3-d24df17d5253	51	857	2f38f633-77eb-41f6-805e-b71027eff4a4
4369	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:31:58.557-05	2016-12-27 11:31:58.557-05	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	636	7baa1f62-c9bc-4df0-9a12-18a4dda6c0ce	51	857	195a4459-fa26-43a9-8159-06dc54d9762b
3628	DEBIT	Banner	-2000	USD	2016-11-30 16:33:38.691-05	2016-11-30 16:33:38.827-05	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	026b493f-edc5-4529-b348-1cdb4dfddc9a	51	857	18d9d4f9-be19-48f1-a8eb-f0627e094485
2330	DEBIT	Network Budget pre Open Collective	-77659	GBP	2016-10-07 10:03:00.623-04	2016-10-07 10:03:00.89-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-77659	\N	5f8dd4cc-75b1-4aa2-89a6-cb125c6597ef	51	857	75ca06f6-c9bb-4e6a-aba8-0618a873f8d5
3526	DEBIT	Banner	-2000	USD	2016-11-29 17:34:04.252-05	2016-11-29 17:34:04.435-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	f2092196-e65f-4d9c-9981-37518272c36e	51	857	8653a1d4-989f-4729-b864-666b9c80e8d8
3545	DEBIT	Network budget pre open collective	-55923	USD	2016-11-29 19:18:08.154-05	2016-11-29 19:18:07.832-05	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-55923	\N	69d0ee19-1d91-42fe-8afa-7f974771bd04	51	857	bc1aa1c4-ca83-4598-9bcf-2854e8d32644
3625	DEBIT	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 16:25:56.197-05	2016-11-30 16:25:56.423-05	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	8654d25a-1d31-4bb8-8a42-09794cf62430	51	857	80d21d1e-a865-4d66-b802-e27742aabf46
3516	DEBIT	Matthews Group - Leadership Development for Seattle team	-60000	USD	2016-11-29 16:46:31.384-05	2016-11-29 16:46:31.384-05	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	464	fd0c2bc8-e692-4989-a626-db0df4d74291	51	857	9f858b17-d5cb-46ed-aee2-f22a96507fce
498	DEBIT	Conference Grant	-50000	USD	2016-05-04 17:14:39.136-04	2016-06-14 14:14:22.01-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	145	61219d5b-692d-4cba-9583-f8a7b033b990	51	857	55244ccb-b373-42e4-8602-2308add309e7
2826	DEBIT	Fedex - certificate print expense	-1962	USD	2016-10-31 17:32:07.365-04	2016-10-31 17:32:07.497-04	300	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1962	\N	3d40ddc4-003a-4559-bb76-0dd988cbb2ac	51	857	c8c9134a-a0ee-42ec-ba2a-96a25da0d684
2802	DEBIT	Pizza for our monthly October event	-9276	USD	2016-10-31 14:07:11.805-04	2016-10-31 14:07:12.736-04	15	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9276	\N	91ddc1e2-b108-4f6a-b156-e7b4f593af89	51	857	2f6825e0-65d6-47c0-8c36-5d92238f5a76
3946	DEBIT	Installfest	-558	USD	2016-12-13 12:30:28.678-05	2016-12-13 12:30:30.347-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-558	\N	b2fc8ba1-8436-493a-a163-96064999c897	51	857	d8cd2df0-48d4-438c-b9cc-663e7b13279d
3801	DEBIT	Office Supplies for Hackathon.	-10585	USD	2016-12-06 12:00:58.382-05	2016-12-06 12:00:58.806-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10585	\N	f298dc78-f218-4213-b29c-2c9a130cb0c8	51	857	99197cfd-b236-42d0-9386-1a59be053dfc
3828	DEBIT	Supplies / Gift Bags	-4147	USD	2016-12-07 11:50:40.889-05	2016-12-07 11:50:41.383-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4147	\N	67b87648-5991-4d8b-9734-cd9b6a439a04	51	857	e4020343-6d55-4239-83e5-5d94353bf720
4375	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:50:06.414-05	2016-12-27 11:50:06.414-05	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	639	e25e6f3b-8f97-491c-80a9-88bab6d96c78	51	857	b1f03f83-654b-49f2-a616-c2b3fc95b383
2529	DEBIT	WWCode Director shirt	-3649	USD	2016-10-17 16:49:16.114-04	2016-10-17 16:49:16.113-04	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	cf15a5bb-2cb3-41bd-8ece-7dbf2dbdda36	51	857	a9049926-0665-47df-8268-676d6779df94
2339	DEBIT	Network budget pre Open Collective	-230712	USD	2016-10-07 16:01:03.429-04	2016-10-07 16:01:03.535-04	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-230712	\N	fc099f38-490d-45b7-b117-fadb4863aa22	51	857	df70886f-18c0-474a-9e15-0949902f967f
2535	DEBIT	Director t-shirt	-2898	USD	2016-10-17 16:57:20.051-04	2016-10-17 16:57:20.056-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2898	\N	451a4c15-b647-4eab-82e9-640a825c808b	51	857	710950d8-b7d0-4f85-ac4f-f8a75b0004a5
2823	DEBIT	Stickers for ATXDivHack 	-15300	USD	2016-10-31 17:15:38.727-04	2016-10-31 17:15:38.89-04	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15300	\N	547db055-4599-4a8d-8828-96bb66aec39e	51	857	0a15d488-a034-455a-b026-ce7c5a32bdb0
2533	DEBIT	Director t-shirt	-2860	USD	2016-10-17 16:56:00.744-04	2016-10-17 16:56:00.777-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2860	\N	5356537c-b269-45d7-ac4c-e54da8c0c6c3	51	857	f89e142d-f5bd-4604-b634-2a9f2542efef
2531	DEBIT	WWCode Director t-shirt	-3649	USD	2016-10-17 16:50:53.853-04	2016-10-17 16:50:53.855-04	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	a66cf7d0-ac6e-42ce-ab24-b0f9f6f0c28e	51	857	652702bc-ff4b-459c-a49a-4ee23d39469e
2395	DEBIT	Google I/O stipend	-50000	USD	2016-10-11 12:00:21.246-04	2016-10-11 12:00:22.203-04	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	8916c363-dc64-40c0-9b37-596a418b9c45	51	857	60541c36-abfd-4cb3-b850-b59e58de8adf
10133	DEBIT	Supplies for decorating our robots	-9777	USD	2017-05-16 18:00:15.557-04	2017-05-16 18:00:15.557-04	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	-9777	1085	00f439f0-30e3-49f5-bc30-40d828f34f7e	696	857	1373f7b4-a926-4982-80e8-2969e53b42bd
10132	DEBIT	Snacks and batteries for our robots	-1554	USD	2017-05-16 18:00:04.449-04	2017-05-16 18:00:04.449-04	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	-1554	1084	51159051-f7cc-4e7d-b285-4d94027c3ab4	696	857	54debbf6-1c43-4cd2-9873-748646436be7
2304	DEBIT	Conference stipend Udisha S.	-75000	USD	2016-10-06 13:21:09.865-04	2016-10-06 13:21:09.933-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	a07591fb-4e19-4cf3-8f08-da3c9ccff93b	51	857	9e85e3e7-15d9-4fb0-8a1a-0aa507c08850
2259	DEBIT	Drinks at Sept monthly event	-2192	USD	2016-10-04 18:06:33.802-04	2016-10-04 18:06:34.357-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2192	\N	7bc0fd8c-3371-4ffc-ab48-dc1d1478f023	51	857	cd5bcb7f-5ca9-4715-abd4-740e65ab31fa
2258	DEBIT	90/10 split: Hackathon donation	-32000	USD	2016-10-04 18:05:22.85-04	2016-10-04 18:05:22.85-04	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-32000	395	0425a551-a9c9-4428-813a-aa4b4a139a49	51	857	2644adf0-9c04-41f5-967d-bf82f5cde7aa
2257	DEBIT	Net budget balance pre-Open Collective	-56266	USD	2016-10-04 17:57:44.218-04	2016-10-04 17:57:44.218-04	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-56266	394	0d80aa7c-4679-499a-abbb-bf69232f55f0	51	857	5057b84a-c99a-4931-84c0-b22c7f53dbc5
7519	DEBIT	Google I/O	-50000	USD	2017-03-27 13:11:39.25-04	2017-03-27 13:11:39.275-04	12	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	-51480	952	d319eebc-1e7a-4500-a519-705bdc9facf2	835	857	a91ab41c-0e06-4373-826c-df6b200883a0
8614	DEBIT	WWCode CONNECT Conference Travel Stipend	-85000	GBP	2017-04-17 17:18:35.523-04	2017-04-17 17:18:35.581-04	278	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	1016	90b0bf3c-bd5e-4224-902c-8989cebcdf81	830	857	d10bb6d5-365a-43e4-9d44-fd54e6bcdc61
5786	DEBIT	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	-4431	USD	2017-02-07 13:40:27.475-05	2017-02-07 13:40:27.96-05	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4431	736	2bbc0783-4b84-4636-a6aa-9b9336c1550e	826	857	5a3fe757-d473-451e-99f8-ff9fcf3201f8
7517	DEBIT	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	-85000	GBP	2017-03-27 12:01:27.19-04	2017-03-27 12:01:27.295-04	278	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	926	a26b7d78-3ba3-487c-99ab-fea20d22a67e	830	857	c9208187-1309-4b49-832f-804065f9f6ec
5785	DEBIT	Event supplies for Leads	-2439	USD	2017-02-07 13:38:14.3-05	2017-02-07 13:38:15.58-05	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2439	737	f07b1e2f-1ddb-43ba-8873-49e911fa25d3	826	857	ea15b18a-5566-4c39-95b6-42fb0321b188
8422	DEBIT	Hackathon 2017 planning meeting	-2891	USD	2017-04-11 15:15:09.813-04	2017-04-11 15:15:09.826-04	59	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	-3005	1001	3ba366f9-e99f-4629-95c3-35280b503ba9	826	857	29eaffa9-1dc8-4ceb-836a-9f3c3f3e5022
8421	DEBIT	Event supplies	-1527	USD	2017-04-11 15:13:28.544-04	2017-04-11 15:13:28.599-04	59	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	-1601	1002	94f2347a-1fdc-472e-b084-606647265be1	826	857	ae1ff7b3-f12e-4f29-9c1a-73009ecb8ee0
10118	DEBIT	Regional Leadership Event: Barcelona	-19398	EUR	2017-05-16 17:49:07.885-04	2017-05-16 17:49:07.885-04	301	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	-19398	-19398	1122	3fca3a38-ed21-4b50-903c-7ad1304b11af	793	857	729ba336-adad-4be4-b4b2-8d44bea9af5d
5781	DEBIT	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	-59040	USD	2017-02-07 13:32:48.784-05	2017-02-07 13:32:49.072-05	14	31	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-59040	776	52ec1ede-9280-4e75-b076-1d75225a9773	766	857	6d2a3ef1-eb82-4d68-a71c-de5d31420203
3529	DEBIT	Regional Leadership Director Training	-13031	USD	2016-11-29 17:35:21.354-05	2016-11-29 17:35:21.522-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13031	\N	bc8e0feb-b038-484d-b77e-9671a32f65be	51	857	7d55cf41-87e3-468f-94f1-6b0b2de120b5
2425	DEBIT	Fedex 	-3418	USD	2016-10-11 20:43:40.215-04	2016-10-11 20:43:40.344-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	\N	720b2952-d5b6-4f7f-81ba-a36f52576f1f	51	857	90e83473-9ab4-4b8d-91ea-e96a8864fdcc
1576	DEBIT	Monthly Minimum Fee - May	-1000	USD	2016-08-16 10:51:38.913-04	2016-08-16 10:51:38.924-04	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	1e21e117-2659-49f0-b3c4-0f71be1dafea	51	857	6f46d6d3-bb9c-4706-aa52-a03fb61fa1e4
1582	DEBIT	Minimum fee - May	-1000	USD	2016-08-16 10:54:12.931-04	2016-08-16 10:54:12.95-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	6dd5e28c-157e-4552-ba9e-f37e75ec0ec4	51	857	cd49ddf4-676b-4277-b8d3-eccc8d92e791
8618	DEBIT	Travel Scholarship for WWCode Director	-40970	GBP	2017-04-17 18:32:02.724-04	2017-04-17 18:32:02.724-04	278	3	\N	\N	\N	\N	\N	\N	0	GBP	1	-40970	-40970	768	ac366b27-1c91-4846-b9cb-9fb911edd792	51	857	507bc5eb-5394-405d-8a0f-7cd8812b5426
8616	DEBIT	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	-100000	USD	2017-04-17 18:12:22.995-04	2017-04-17 18:12:22.995-04	270	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1027	4ec74672-5586-4acc-b9be-bddf2e0a464c	51	857	fab4e915-6462-4f24-a0d2-df754bcdd580
8601	DEBIT	Atlanta IWD Event	-235699	USD	2017-04-17 15:17:23.032-04	2017-04-17 15:17:23.032-04	12	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	-235699	998	ed3b2ff8-e7bc-4ffd-a178-056c3ca7ec4c	51	857	a5e7d6c4-9afa-4c81-ac28-4882f0b806f4
615	DEBIT	Conference Grant	-70000	USD	2016-05-19 15:07:13.723-04	2016-06-14 14:14:22.082-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	178	074c5df4-902c-4af8-b06e-9a222d4899dc	51	857	4991fa9a-ed30-45cc-8327-0d92de372a04
414	DEBIT	WePay Fee	-400	USD	2016-04-10 20:00:00-04	2016-06-14 14:14:21.907-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-400	104	87c00eef-d1a6-4f09-8e9c-b288d4bb1d87	51	857	87840f56-6f7f-4e76-814f-3dcbeeb224bf
676	DEBIT	CONFERENCE GRANT	-34750	USD	2016-05-26 15:05:53.771-04	2016-06-14 14:14:22.123-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34750	197	d88487be-3043-4198-810a-d989c2c30afb	51	857	f74bbc2b-83ee-49b2-af6d-aeb439cbc6ac
298	DEBIT	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	-11815	USD	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.839-04	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11815	74	8b3bc1cf-1598-4af5-9511-2dea9fcb267a	51	857	b50764c5-6e92-4f69-8996-f87006aeaa24
4431	DEBIT	Meetup Fees	-6000	AUD	2016-12-28 10:56:28.934-05	2016-12-28 10:56:28.934-05	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	661	6b303a9b-a30c-4cd3-99ca-80c33b0b9197	51	857	b12f3fb2-919e-4c2d-8c86-921d18eb2a85
300	DEBIT	Reimburse Caterina for program materials	-3798	USD	2016-04-05 15:44:01.338-04	2016-06-14 14:14:21.838-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3798	76	42cf26b1-f1f3-4a07-8725-0090dd713617	51	857	73805bf1-e659-4dd4-bd6a-473c2b51c241
4429	DEBIT	Meetup Fees	-6000	USD	2016-12-28 10:53:05.613-05	2016-12-28 10:53:05.613-05	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	660	90fccb78-97b2-4e6b-951d-b476f4a7148f	51	857	71f74e15-f974-4768-be56-62b75e5a1dcd
4427	DEBIT	Meetup Fees	-6000	USD	2016-12-28 10:49:16.255-05	2016-12-28 10:49:16.255-05	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	659	52806f02-8b52-4053-97ad-eb7b0f5c2c2a	51	857	cb4922b8-fa61-43bf-bc75-b4c90af4fdda
4425	DEBIT	Meetup Fees	-6000	USD	2016-12-28 10:44:44.222-05	2016-12-28 10:44:44.222-05	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	658	70f09e97-2754-4f16-9e9f-007e253cc35b	51	857	4defe036-0ef0-43c5-94b1-ad466662a505
4403	DEBIT	Meetup Fees	-6000	USD	2016-12-27 13:38:46.887-05	2016-12-27 13:38:46.887-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	654	46876e47-95e8-4b16-ad0e-63703c1710c6	51	857	4ecc211c-4476-4b03-8d17-e58edda8860c
4401	DEBIT	Meetup Fee	-6000	USD	2016-12-27 13:35:08.624-05	2016-12-27 13:35:08.624-05	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	653	21af77e9-057a-48e4-bc42-cf6de40a4d0b	51	857	029834db-f884-4452-ad1f-603b08335984
4394	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 12:57:54.314-05	2016-12-27 12:57:54.314-05	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	650	3d47c24e-fc5a-4254-80eb-cc221aae8a7e	51	857	c3e68a48-e00c-4f74-8974-5b9603a76a10
4396	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 13:01:07.417-05	2016-12-27 13:01:07.417-05	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	651	c45178a3-9a29-4d14-b424-414faa770220	51	857	dde19676-312a-4192-9f69-25bc0496df11
4392	DEBIT	Meetup Fees	-6000	AUD	2016-12-27 12:54:00.843-05	2016-12-27 12:54:00.843-05	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	649	4041ac58-5270-4993-8579-372862540f19	51	857	cf06b300-88e9-4077-9eb9-1ea6d5c1f7fe
4390	DEBIT	Meetup Fees	-6000	USD	2016-12-27 12:49:39.83-05	2016-12-27 12:49:39.83-05	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	648	d59f9559-52ea-4838-86ac-9a89171e4edb	51	857	92508ea7-0eae-4a0b-9adc-43eb0eb98493
4388	DEBIT	Meetup Fees	-4900	GBP	2016-12-27 12:34:46.469-05	2016-12-27 12:34:46.469-05	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	647	63c1fa30-5905-47e2-9922-3e50406c41e5	51	857	5ddd1fa6-8ded-49d1-9668-a21f69cb19cc
4366	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:23:35.936-05	2016-12-27 11:23:35.936-05	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	634	19aac764-7f1c-4545-964c-aa419cddcadf	51	857	f3ebed3b-5fcb-4103-b58d-9f12e7afcce3
4364	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:16:27.082-05	2016-12-27 11:16:27.082-05	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	633	f733707f-81b8-4b1a-8fb4-5d36f7398e4d	51	857	1119894e-6fdd-4b3f-80e4-ef53b4fc3d12
4361	DEBIT	Meetup Fees	-6000	MXN	2016-12-27 11:12:26.224-05	2016-12-27 11:12:26.224-05	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	632	1475d9f0-a70a-479b-a7a5-0f944217dd0c	51	857	f90bb2e5-46b8-4176-8920-b3aff3950875
4438	DEBIT	Meetup Fees	-6000	USD	2016-12-28 11:25:48.743-05	2016-12-28 11:25:48.743-05	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	664	571bafd6-9a7d-417d-be32-be27d3f4bee4	51	857	cfb369fc-876f-4ea2-a36c-2866a47729ee
4440	DEBIT	Meetup Fees	-6000	USD	2016-12-28 11:28:15.901-05	2016-12-28 11:28:15.901-05	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	665	6ad3295b-2aa8-4bfd-a39e-659ab99c98a1	51	857	5d0b1f4f-935e-47ec-b42d-b7f38e6035b4
4436	DEBIT	Meetup Fees	-6000	CAD	2016-12-28 11:21:52.469-05	2016-12-28 11:21:52.469-05	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	663	84be2b67-931d-405c-99a7-1724a5788a24	51	857	3189a271-a89b-4e67-bf67-a1cc37bc5c99
4433	DEBIT	Meetup Fees	-6000	USD	2016-12-28 10:58:50.078-05	2016-12-28 10:58:50.078-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	662	74036058-01c1-4f98-a83f-fc82f6510521	51	857	4252ec62-e70b-4b16-ba38-ac9ec4533458
4398	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 13:11:51.873-05	2016-12-27 13:11:51.873-05	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	652	28af55a2-3111-4783-ba8d-35cf4d105776	51	857	e92802d1-a9ac-4e94-a466-4b06f7b31cd1
4285	DEBIT	Meetup Fees	-6000	USD	2016-12-23 14:50:08.539-05	2016-12-23 14:50:08.539-05	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	628	51faf49d-6a19-43ae-857d-bd10ba1f66e4	51	857	9b97244f-1fe0-4825-b5b0-ee24a605d777
4283	DEBIT	Meetup Fees	-6000	USD	2016-12-23 14:41:48.315-05	2016-12-23 14:41:48.315-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	627	1008cc1e-b9d2-43f0-95c2-8ee9e464a929	51	857	a985d390-eb74-4dc0-a8f9-16e7fdccb15e
4281	DEBIT	Meetup Fees	-6000	USD	2016-12-23 14:38:46.818-05	2016-12-23 14:38:46.818-05	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	626	d4bdb19b-d165-4c0a-b84d-6bc03f6ed962	51	857	72bc38f9-469a-4123-8824-e7c06ea1afdb
4254	DEBIT	Meetup Fees	-6000	USD	2016-12-23 11:56:04.579-05	2016-12-23 11:56:04.579-05	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	616	f6ab951c-bed5-4749-b0e5-db1a3a7a8ad6	51	857	fc5c902e-b61b-49c6-ab66-5d24e99309ae
864	DEBIT	Reimburse Caterina Paun for Program Expenses	-9995	USD	2016-02-24 19:00:00-05	2016-06-14 14:14:22.175-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9995	224	9f16d9b5-e350-4ca4-8b8f-59334d6ef9f3	51	857	60ae9626-9528-4b0e-90e0-943e3844571f
674	DEBIT	CONFERENCE GRANT	-50000	USD	2016-05-10 20:00:00-04	2016-06-14 14:14:22.114-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	196	7916b5ad-1d71-481f-b774-1a9d79d2c8e0	51	857	2b6839bf-f392-482e-a79e-157503d211c0
377	DEBIT	WePay fee	-125	USD	2016-04-17 18:19:12.094-04	2016-06-14 14:14:21.883-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-125	95	535a716d-edbd-4914-9b57-78bd671fd49a	51	857	abec4c3b-b29d-410c-a80d-dcae9b2c06e1
539	DEBIT	Conference Expense	-8320	USD	2016-05-10 15:19:21.785-04	2016-06-14 14:14:22.042-04	48	3	\N	2016-06-14 14:14:22.515-04	\N	\N	\N	\N	\N	\N	\N	\N	-8320	158	158dcb8d-7226-4bd0-a0c6-601340d5ab84	51	857	7f95f913-4d28-4b5f-aacf-0f4cf47d9ee1
8237	DEBIT	Meetup Fees	-6000	USD	2017-04-05 10:19:21.293-04	2017-04-05 10:19:21.293-04	295	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	-6000	988	87b9bea2-2195-4ea2-b065-d18bc0c3368c	51	857	5bcf6d27-bd13-44bc-9268-0e086747fb22
4371	DEBIT	Meetup Fees	-5700	EUR	2016-12-27 11:36:05.296-05	2016-12-27 11:36:05.296-05	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	637	33760db0-25e7-4b85-89df-040f38e22adb	51	857	b342c83c-5f45-4a18-87b2-aea1c93361bb
4373	DEBIT	Meetup Fees	-6000	USD	2016-12-27 11:41:27.235-05	2016-12-27 11:41:27.235-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	638	c036838f-9cbc-45c5-935f-9d9b57ea2836	51	857	29f9bc2a-f0b1-416d-9907-93c07a247296
4268	DEBIT	Meetup Fees	-6000	AUD	2016-12-23 12:42:18.688-05	2016-12-23 12:42:18.688-05	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	623	f36420c0-4283-44cb-a9c5-d91eb735988f	51	857	0729fdb7-feac-4008-b26f-63be229d8cdd
4264	DEBIT	Meetup Fees	-6000	USD	2016-12-23 12:21:53.018-05	2016-12-23 12:21:53.018-05	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	621	0446afb9-0ce6-4148-a588-e6ac299a3997	51	857	b758b5ac-c230-4df9-9f52-f24a455e61c6
4262	DEBIT	Meetup Fees	-5700	EUR	2016-12-23 12:15:16.054-05	2016-12-23 12:15:16.054-05	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	620	274351b9-2cc0-438e-8c7d-4a8e7771bb0c	51	857	49629977-8b0e-4eac-85e4-6e1565857b0d
4260	DEBIT	Meetup Fees	-6000	USD	2016-12-23 12:10:34.733-05	2016-12-23 12:10:34.733-05	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	619	eb811f1b-7c0b-4d61-9105-9366e6aa84d8	51	857	da3a483e-b2c8-4343-bcca-50145a870209
4258	DEBIT	Meetup Fees	-4900	GBP	2016-12-23 12:05:41.927-05	2016-12-23 12:05:41.927-05	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	618	9a33a7df-c65b-40f9-9207-191220694bc5	51	857	d92cd5d5-0528-4c35-9ba0-217a917d144f
3622	DEBIT	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 16:20:31.263-05	2016-11-30 16:20:31.464-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	7e10ae09-c940-4b3e-a151-459585138199	51	857	c7e68cca-1c26-429a-a6ad-795194a8c70e
4256	DEBIT	Meetup Fees	-6000	USD	2016-12-23 12:00:25.987-05	2016-12-23 12:00:25.987-05	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	617	57853d10-9d39-4960-9921-b48c4b182e12	51	857	5d23496f-cdcc-4fca-9250-85c57c268e1d
3619	DEBIT	Banner	-2000	USD	2016-11-30 16:19:46.014-05	2016-11-30 16:19:46.128-05	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	549a4d38-14e9-451f-af59-00b70014bc58	51	857	3b2bba2e-017c-4f73-81df-6caf61dc8145
3591	DEBIT	Envelopes for hackathon sponsor prizes	-907	USD	2016-11-30 11:12:35.291-05	2016-11-30 11:12:35.54-05	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-907	\N	eeee1a04-ad18-42e4-8252-db32a174e369	51	857	189685c4-71ae-4359-8fff-2d1211e94700
3613	DEBIT	Leadership Development - Conference Travel Stipend Google I/O	-130000	USD	2016-11-30 16:06:48.939-05	2016-11-30 16:06:49.116-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-130000	\N	6a1fa977-065a-47a6-bf3e-ae8934921597	51	857	6a5bfd14-50aa-4b7f-917f-4253011f8ef2
3589	DEBIT	Photos for sponsor gifts	-2104	USD	2016-11-30 11:11:36.238-05	2016-11-30 11:11:36.377-05	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2104	\N	5c8b4fc6-fa71-4ca6-ac8b-984c0d5fa454	51	857	1e101689-2f64-412a-a857-abb7418a7bed
656	DEBIT	Conference Grant	-100000	USD	2016-05-24 15:42:50.307-04	2016-06-14 14:14:22.103-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	189	e8d5c717-1fca-4334-96d2-b8fa8d899ca1	51	857	c3b29e74-d963-4903-ac8e-6178e076e1dd
2426	DEBIT	Engineering (Web) - A Small Orange	-12700	USD	2016-10-11 20:44:30.933-04	2016-10-11 20:44:31.081-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	\N	0f9b2d4b-60a1-4cd9-b233-5569b822348d	51	857	ab9be932-27a6-4d94-b580-dedb69f78bc7
671	DEBIT	A Small Orange	-12700	USD	2016-02-01 19:00:00-05	2016-06-14 14:14:22.114-04	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	194	d40ca73f-6c26-4d43-9c22-6e36ab38f02c	51	857	01b1fc33-724e-4aef-b6a5-53bbfdc78c2f
2260	DEBIT	Food at our Sept. monthly event	-11478	USD	2016-10-04 18:07:11.046-04	2016-10-04 18:07:11.615-04	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11478	\N	bbb5901e-3328-4653-a858-b80c40422cd0	51	857	b206e633-d452-403b-a4fa-836fce5ebe67
2302	DEBIT	Network Stickers	-58590	USD	2016-10-06 12:08:07.615-04	2016-10-06 12:08:07.66-04	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-58590	\N	b48ad8e6-3729-4d25-be11-03328df1f7b8	51	857	3697f83d-fdcf-40e9-a452-a6fb39f2b38f
2241	DEBIT	90/10 split: Syema Ailia	-250	USD	2016-10-04 12:06:23.454-04	2016-10-04 12:06:23.454-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	390	3e7d1081-0039-41e3-b36f-4b37b44b3e0c	51	857	354c843f-3781-429d-966d-2e4bc912e42c
2240	DEBIT	90/10 split: Beth Laing	-500	USD	2016-10-04 12:06:16.796-04	2016-10-04 12:06:16.796-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	392	0c5e3510-cf16-42de-bde2-147e6ab9a46d	51	857	93578a41-d7a7-4913-8e20-2bd080d94d34
2815	DEBIT	Markers, pens, sticky notes (ATXDivHack)	-2108	USD	2016-10-31 17:13:19.592-04	2016-10-31 17:13:19.745-04	2	28	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2108	448	812a47a9-0b51-4948-9963-c610c2bbea43	847	857	7ed92f4e-a355-4cfd-961e-99947eada542
2812	DEBIT	June South Hack Night	-20568	USD	2016-10-31 17:11:20.573-04	2016-10-31 17:11:20.753-04	2	28	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20568	451	540d3476-03f3-4c01-9191-0b4593c34fd4	847	857	f095ee03-3b3c-49a4-93cd-21e84841fae0
2816	DEBIT	Drinks for Happy Hour (ATXDivHack)	-5518	USD	2016-10-31 17:13:39.794-04	2016-10-31 17:13:40.146-04	2	28	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5518	447	635f6580-ccbc-4232-bf25-eded2b10fdd7	847	857	ee41df98-d698-4d32-ab0c-dfaa54904e63
2811	DEBIT	May AI Workshop	-26800	USD	2016-10-31 17:10:54.112-04	2016-10-31 17:10:54.327-04	2	28	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-26800	452	db3e939f-96e8-4790-bba4-e8a8a33ac1b2	847	857	13cf848b-1cd9-417a-93b9-1404ce05751d
2813	DEBIT	September Ruby Tuesday	-6497	USD	2016-10-31 17:11:36.488-04	2016-10-31 17:11:36.731-04	2	28	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6497	450	82a4bfeb-95ef-4a2a-9d9d-5ca157938b53	847	857	39b2c1a9-fd94-465c-9f74-a4b567ec61a4
2739	DEBIT	DJ (ATXDivHack)	-35000	USD	2016-10-27 17:08:48.506-04	2016-10-27 17:08:48.71-04	2	28	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-35000	453	4bfee0a6-77d3-4608-92bb-fb59f6d1f3f2	847	857	35282d51-ec6b-4f30-971e-80ef5b2dd935
2288	DEBIT	Marketing Materials	-2475	USD	2016-10-05 12:45:14.357-04	2016-10-05 12:45:14.485-04	59	171	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2475	376	a346ac76-b04b-4514-be71-84d9bf2c88ce	826	857	27686abf-a29b-4ba4-bf5a-a839be3e71bf
2287	DEBIT	Event Food	-7167	USD	2016-10-05 12:44:47.862-04	2016-10-05 12:44:48.013-04	59	171	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7167	378	0591fc4f-0d49-4e83-ac11-6f4b4e5475ea	826	857	319030d4-727b-4b9b-9702-c33b68553f50
2286	DEBIT	Event supplies	-2715	USD	2016-10-05 12:44:00.394-04	2016-10-05 12:44:00.521-04	59	171	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2715	375	42291373-8c70-4ccc-b6c1-ec4c36403599	826	857	6b851a75-c957-49d1-9859-bc1e60b26bed
3793	DEBIT	We Code Hackathon 2016	-2374	USD	2016-12-06 11:50:34.842-05	2016-12-06 11:50:35.964-05	59	171	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2374	500	38b70e02-a7b4-40c6-952d-6af6478b8b15	826	857	30a64cbe-7444-4fff-b129-16ea12c2b316
1954	DEBIT	Event food	-2911	USD	2016-09-15 20:09:43.149-04	2016-09-15 20:09:43.531-04	59	171	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2911	345	86b66e81-a6ce-436d-9ea0-161fa976ce9d	826	857	706f4b15-5cca-4764-a308-649407dccd6f
1921	DEBIT	Event food	-3224	USD	2016-09-13 10:57:04.698-04	2016-09-13 10:57:05.111-04	59	171	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3224	346	5c624478-95c6-4d37-94e1-3d7ffe3895bd	826	857	77a88ec1-9044-4e7c-a789-3cfb2f784748
3843	DEBIT	Leadership Event in Sofia	-6444	EUR	2016-12-07 16:38:07.287-05	2016-12-07 16:38:07.429-05	301	1379	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6444	471	4ca35a75-88d7-4546-b608-ce07199942fb	800	857	3bc329c2-908c-4598-a769-c9cda961cd15
2763	DEBIT	lunch ordered at Costco	-64978	USD	2016-10-28 17:30:59.537-04	2016-10-28 17:30:59.772-04	300	1371	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64978	418	19a3cace-58b7-4661-b4a1-076155bb69aa	796	857	3fcfad6a-3804-455d-831e-acf364db969f
2810	DEBIT	500 gift cards, 19.62 printed awards	-51962	USD	2016-10-31 17:09:11.281-04	2016-10-31 17:09:11.484-04	300	1371	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-51962	416	34e49664-e27e-4576-9895-33d5e0ddf2f8	796	857	1cbbde01-016d-484e-8297-c0afde4a2a38
3835	DEBIT	Leadership Event in Sofia	-1019	EUR	2016-12-07 16:30:48.339-05	2016-12-07 16:30:48.523-05	301	1379	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1019	470	84e835ea-fd72-47a5-8dd8-92a3cee7fe26	800	857	d7e462fc-5e5b-4b3b-9af4-68d74ba4383b
2800	DEBIT	WWCode Seattle planning lunch with Sara	-2700	USD	2016-10-31 13:52:44.962-04	2016-10-31 13:52:45.274-04	14	32	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2700	420	de0990ce-e767-47a3-8594-d6d7dc3f62c7	797	857	61408274-9f0f-447d-9cc6-94f94877ebae
2809	DEBIT	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	-48435	USD	2016-10-31 17:08:49.332-04	2016-10-31 17:08:49.517-04	300	1371	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-48435	417	7bfc67b7-3dd7-4f2c-a42e-1fd52bf01230	796	857	ee7eea71-9373-403f-8d42-746697d9e535
2801	DEBIT	Monthly core team meeting. Beverages with dinner for six members 	-3080	USD	2016-10-31 13:59:53.602-04	2016-10-31 13:59:53.96-04	14	31	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3080	401	6071a2e5-9c4e-4724-98ef-faa4c9b34169	766	857	a83c2fc2-30ac-4c58-be79-3868a4a2539c
2942	DEBIT	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	-2838	USD	2016-11-03 17:13:31.956-04	2016-11-03 17:13:32.241-04	12	70	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2838	409	edf0f89b-9f88-4050-a39b-a1c03329fd49	763	857	cdce8653-8f0d-49cb-990e-a4c473259342
2110	DEBIT	Two VR headsets for our AR/VR event at Best Buy.	-4898	USD	2016-09-27 15:31:43.164-04	2016-09-27 15:31:43.42-04	48	142	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4898	366	20ddc19e-87b3-4e08-9648-4ae868f40fe9	696	857	8b55d3d1-c441-42e0-9ab4-0ca836c346ef
1631	DEBIT	Coding books for our study groups (Humble Bundle -- Joy of Coding)	-1500	USD	2016-08-19 16:58:54.527-04	2016-08-19 16:58:54.67-04	48	142	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	318	0b0b7cb8-20eb-4ed8-b5eb-d5db91b35e38	696	857	df2dafbf-88a0-4849-ad15-4cff959d77e4
1587	DEBIT	STEM Toys for Coding with Kids Event	-8496	USD	2016-08-16 10:58:01.764-04	2016-08-16 10:58:01.789-04	48	142	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8496	294	bd8d9663-a174-448f-94f5-5e6707eb538d	696	857	057f9b29-1f10-484f-b12f-b2a8d9ff5daf
841	DEBIT	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	-5161	USD	2016-06-06 20:21:31.531-04	2016-06-14 14:14:22.165-04	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5161	218	003cb730-5a3d-4db1-a7b2-32bd980c6452	766	857	a58117d4-113d-418e-84cc-1f050b17ba90
3951	DEBIT	Event suplies	-2198	USD	2016-12-13 13:43:16.329-05	2016-12-13 13:43:17.27-05	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2198	\N	5228b4f5-f0ed-4a43-b5f8-4f2e8cfd7185	51	857	5f208dfc-2381-430b-a50b-f671ab0c6a6c
98	DEBIT	Libretas Hackathon	-1038000	MXN	2016-02-16 13:56:17.216-05	2016-06-14 14:14:21.738-04	10	7	\N	2016-06-14 14:14:22.435-04	\N	\N	\N	\N	\N	\N	\N	\N	-1038000	33	18ee4a98-66b6-47d6-85a0-0d4ead04f2d7	821	857	a10aade4-801c-4408-976c-24f523b01ecc
2326	DEBIT	Conference stipend - Gen A.	-102409	GBP	2016-10-07 09:10:14.088-04	2016-10-07 09:10:14.841-04	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-102409	\N	55b95c98-c784-41c3-be4b-e0f81a9a75dc	51	857	82f5f6a3-2c5c-473c-bb35-ddb3343be902
2232	DEBIT	90/10 split: AT&T Sponsorship (April 2015)	-100000	USD	2016-10-04 11:44:28.558-04	2016-10-04 11:44:28.558-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	389	254566c7-f97b-43d5-9910-c414520ad3bf	51	857	b8478c19-3b81-4e5f-b308-75a08be8df82
4191	DEBIT	Meetup Fees	-6000	USD	2016-12-21 13:54:30.839-05	2016-12-21 13:54:30.839-05	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	608	53d83a5f-166b-455f-b73f-827fcdcc3a5d	51	857	e73b995b-b43c-42b7-886f-3dd6e2fae5db
2380	DEBIT	WWCode Portland Stickers	-31950	USD	2016-10-10 16:12:33.813-04	2016-10-10 16:12:33.813-04	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-31950	411	dab27bf8-4cd0-46ef-93fe-c99e9c4b74fe	51	857	87a9a795-3210-48ac-ba2a-5ec93dd5ed38
2233	DEBIT	Google I/O: Alicia Carr	-10000	USD	2016-10-04 11:44:35.988-04	2016-10-04 11:44:35.988-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	387	7ae2b68c-c128-4dbd-a90e-a82fa24579bb	51	857	a2b6ef23-980e-47da-b0cb-b366afd322b1
10494	CREDIT	From Deepa	1500	USD	2016-04-12 17:19:00.212-04	2016-04-12 17:19:00.529-04	51	3	\N	2017-10-27 13:28:58.246-04	\N	\N	\N	\N	\N	\N	1	\N	1500	\N	8936a2c1-806e-454e-b91e-9cc665bcee06	\N	857	01c55034-9dc6-4362-8ba1-8f4413b512f8
334	CREDIT	From Deepa	1500	USD	2016-04-12 17:19:00.212-04	2016-04-12 17:19:00.529-04	4	3	\N	2016-04-14 17:19:00.529-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3be9f7b2-c97b-41ac-b2bf-2e8dbd11ca27	857	857	01c55034-9dc6-4362-8ba1-8f4413b512f8
10765	CREDIT	$1000 Mozilla hackathon support - Global Development	90000	USD	2016-11-17 13:21:06.154-05	2016-11-17 13:21:07.268-05	51	3	\N	2017-10-27 13:28:58.251-04	\N	\N	\N	\N	\N	\N	1	\N	90000	\N	963fef2e-b82f-4d6f-9359-8b53927af3ad	\N	857	01eb572c-3b61-4173-bb68-4a263c2e974f
10768	DEBIT	$1000 Mozilla hackathon support - Global Development	-90000	USD	2016-11-17 13:21:06.154-05	2016-11-17 13:21:07.268-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-90000	-90000	\N	a4bab652-32b2-4100-a9ce-b108ed8c6f2b	59	857	01eb572c-3b61-4173-bb68-4a263c2e974f
3204	CREDIT	$1000 Mozilla hackathon support - Global Development	90000	USD	2016-11-17 13:21:06.154-05	2016-11-17 13:21:07.268-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	646702d0-fba2-4ee2-8e90-8c8871732cac	857	857	01eb572c-3b61-4173-bb68-4a263c2e974f
4372	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 11:38:50.944-05	2016-12-27 11:38:51.039-05	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	61be0f13-1f0e-4430-a69b-de48f097255d	857	857	0261cca1-9caa-4099-abe4-0dd8210b2881
4367	CREDIT	Global Development for Meetup Fee	6000	INR	2016-12-27 11:24:37.915-05	2016-12-27 11:24:38.038-05	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c54c243c-29a5-4006-b821-adc4d3a389ee	857	857	029027d6-1e6a-47b6-a897-e83ea704b8d1
10575	CREDIT	\N	100000	USD	2017-03-27 13:53:48.539-04	2017-03-27 13:53:48.539-04	51	3	\N	2017-10-27 13:28:58.266-04	\N	2154	\N	\N	\N	USD	1	100000	100000	\N	1d955fdf-b803-488d-aca0-4e5024262eee	\N	857	030885b1-73c8-4a93-bd39-5fc64eb414a6
7526	CREDIT	\N	100000	USD	2017-03-27 13:53:48.539-04	2017-03-27 13:53:48.539-04	277	3	\N	\N	\N	2154	0	0	0	USD	1	100000	100000	\N	79f34f13-1a21-48bc-8119-ab5cf030a034	857	857	030885b1-73c8-4a93-bd39-5fc64eb414a6
10604	DEBIT	Macy's donation - fees and global development	-435000	USD	2017-02-13 19:21:10.361-05	2017-02-13 19:21:10.558-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-435000	-435000	\N	5a2b0339-277c-4160-b415-16270674fa57	12	857	03f2ce19-18c7-4d5d-9390-3b4bd48cd001
10769	CREDIT	T-shirt payout	1092	USD	2016-11-17 13:03:13.726-05	2016-11-17 13:03:13.862-05	51	3	\N	2017-10-27 13:28:58.275-04	\N	\N	\N	\N	\N	\N	1	\N	1092	\N	28e93d77-f6db-4d43-8673-29dbc25b6900	\N	857	04f1fb7d-b4a1-4cf3-b39d-d47cf93a4cb7
10779	CREDIT	Women Techmaker WWCode Partnership Grant	20000	USD	2016-05-25 12:45:53.797-04	2016-05-25 12:45:54.045-04	51	3	\N	2017-10-27 13:28:58.28-04	\N	\N	\N	\N	\N	\N	1	\N	20000	\N	9df5dcf5-d5dc-436d-b2a9-a30ef764419b	\N	857	0519e087-2ca2-4e5a-a02e-e4e565ec392e
3205	CREDIT	$5000 Intel Hackathon support - global development	450000	USD	2016-11-17 13:23:08.268-05	2016-11-17 13:23:08.461-05	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450000	\N	6b086a9f-6727-4f05-85cd-8f84aa7c79dd	857	857	0c6381c5-5004-4187-95ca-8421b0984012
11042	CREDIT	Director t-shirt	3186	USD	2016-10-17 16:58:21.952-04	2016-10-17 16:58:22.083-04	51	3	\N	2017-10-27 13:28:58.319-04	\N	\N	\N	\N	\N	\N	1	\N	3186	\N	fe9f77d7-ef55-47f2-a27c-1f231b310d0f	\N	857	0c83629f-f078-4c24-ba4a-f723cfc7a8ee
11047	DEBIT	Director t-shirt	-3186	USD	2016-10-17 16:58:21.952-04	2016-10-17 16:58:22.083-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-3186	-3186	\N	cca6a779-1472-403a-b467-2ccf0fef4d8d	271	857	0c83629f-f078-4c24-ba4a-f723cfc7a8ee
2536	CREDIT	Director t-shirt	3186	USD	2016-10-17 16:58:21.952-04	2016-10-17 16:58:22.083-04	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3186	\N	ab3a189e-8523-443a-bd54-f8824c3498dc	857	857	0c83629f-f078-4c24-ba4a-f723cfc7a8ee
10953	DEBIT	Leadership development - conference stipend Google I/O	-130000	USD	2016-11-30 16:07:12.142-05	2016-11-30 16:07:12.419-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-130000	-130000	\N	fd2703f3-5425-4624-9052-e4055c346c4d	241	857	0cb06fc3-afb6-4412-bdcb-1f3a289a7468
3614	CREDIT	Leadership development - conference stipend Google I/O	130000	USD	2016-11-30 16:07:12.142-05	2016-11-30 16:07:12.419-05	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130000	\N	e8834ded-c290-4ab8-b367-c3356b2c9eb3	857	857	0cb06fc3-afb6-4412-bdcb-1f3a289a7468
10860	DEBIT	Donation Elizabeth B.	-9000	USD	2016-10-11 20:22:08.455-04	2016-10-11 20:22:08.557-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-9000	-9000	\N	e5d50d4e-269f-4d54-ac0c-aee0ea1d4a20	288	857	0cd1b7e3-2d44-4ee1-90eb-e051bdf1c108
10496	CREDIT	AJUG - Global and fees	26250	USD	2017-04-20 17:39:17.741-04	2017-04-20 17:39:18.323-04	51	3	\N	2017-10-27 13:28:58.334-04	\N	\N	\N	\N	\N	\N	1	\N	26250	\N	80be783a-5ff8-429f-b378-6a22272dbd6f	\N	857	0d075412-8701-493e-89cf-550cc0bcd68b
11080	DEBIT	Donation via Meetup	-1203	USD	2016-10-04 12:46:07.882-04	2016-10-04 12:46:07.993-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1203	-1203	\N	2a67f2da-0745-4799-a6a7-890bddfef145	13	857	0d8179b9-e627-44fd-9857-7bf9ddfba46c
10550	CREDIT	\N	25000	MXN	2017-04-17 18:34:32.259-04	2017-04-17 18:34:32.259-04	51	3	\N	2017-10-27 13:28:58.37-04	\N	2487	\N	\N	\N	MXN	1	25000	25000	\N	c26f5f2c-0cbc-43cc-89d0-59d8ca8233d7	\N	857	14221234-6a75-4baf-b380-68c78f80ea2d
10552	DEBIT	\N	-25000	MXN	2017-04-17 18:34:32.259-04	2017-04-17 18:34:32.259-04	857	3	\N	\N	\N	2487	0	\N	0	MXN	1	-25000	-25000	\N	ac5d3e68-db3e-4032-9980-735753504b41	511	857	14221234-6a75-4baf-b380-68c78f80ea2d
10648	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 13:37:31.611-05	2016-12-27 13:37:31.721-05	51	3	\N	2017-10-27 13:28:58.377-04	\N	\N	\N	\N	\N	\N	1	\N	6000	\N	368e6d0a-6958-47a2-91e1-0414e06aef31	\N	857	14273180-6985-4957-8193-0e8aad6753c1
10559	CREDIT	\N	9000	USD	2017-04-17 15:41:07.659-04	2017-04-17 15:41:07.659-04	51	3	\N	2017-10-27 13:28:58.383-04	\N	2471	\N	\N	\N	USD	1	9000	9000	\N	f29504fa-eb78-4da1-8fca-7cd1a0155569	\N	857	1541b52e-a4f6-432a-b6ce-823d18b7c6be
10942	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 16:20:06.733-05	2016-11-30 16:20:15.577-05	51	3	\N	2017-10-27 13:28:58.387-04	\N	\N	\N	\N	\N	\N	1	\N	7500	\N	2a74ef65-999c-4b5e-be0f-c8b8cc838e22	\N	857	16ab8d31-a2af-4c85-b45e-fd69401e5507
10694	CREDIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	24750	USD	2017-04-07 12:43:42.261-04	2017-04-07 12:43:42.673-04	51	3	\N	2017-10-27 13:28:58.397-04	\N	\N	\N	\N	\N	\N	1	\N	24750	\N	9834f3c5-026a-43f3-8c8a-41c0ae556c6d	\N	857	16fe8457-a183-47f6-be81-2e6e4d456a37
10703	DEBIT	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	0	USD	2017-04-07 12:43:42.261-04	2017-04-07 12:43:42.673-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	0	-24750	\N	50839352-724d-4bf7-81de-49d0faa265bc	262	857	16fe8457-a183-47f6-be81-2e6e4d456a37
7043	CREDIT	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	1450	USD	2017-03-13 13:06:48.459-04	2017-03-13 13:06:51.099-04	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450	\N	e2b2b401-0472-40e8-8d1c-84e5ad37b555	857	857	172a2c98-beb4-48b7-9b11-3c209e66f4b4
10518	CREDIT	\N	39800	GBP	2017-03-31 14:01:48.418-04	2017-03-31 14:01:48.418-04	51	3	\N	2017-10-27 13:28:58.431-04	\N	2209	\N	\N	\N	GBP	1	39800	39800	\N	a20e5b96-6481-4c87-b479-2b8d00e0b938	\N	857	1aa568d9-e686-492a-bcdd-18259e0680d5
10795	CREDIT	Network Development (100%)	10000	USD	2016-10-06 14:42:47.682-04	2016-10-06 14:42:47.71-04	51	3	\N	2017-10-27 13:28:58.499-04	\N	\N	\N	\N	\N	\N	1	\N	10000	\N	7a3a6607-00d1-4c14-ab89-855c694221c6	\N	857	2ab7a7ac-6deb-47b9-97cd-0b84940bdcdf
4428	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-28 10:51:42.465-05	2016-12-28 10:51:38.84-05	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6ed65fc3-0248-4071-bdbd-1a43018a5a2e	857	857	351a07a3-fc4c-4edc-9117-7cd093d2cfbe
10939	CREDIT	Regional Leadership Director Meeting 	7500	USD	2016-11-30 16:20:12.669-05	2016-11-30 16:20:16.148-05	51	3	\N	2017-10-27 13:28:58.596-04	\N	\N	\N	\N	\N	\N	1	\N	7500	\N	7dde32e2-2bb3-4358-b710-3a37f8a97f47	\N	857	3622870d-d8cd-403d-a195-bac0c7ac0e57
9658	CREDIT	\N	300000	USD	2017-05-02 14:43:43.157-04	2017-05-02 14:43:43.157-04	12	3	\N	\N	\N	2676	0	0	0	USD	1	300000	300000	\N	5e069863-b163-4534-a856-d24c10ad1c67	857	857	4342a989-fa65-4691-ae4f-88b955dbdf0b
10770	DEBIT	$1000 CDK Global event support - transaction and global development	-87000	USD	2016-11-17 13:18:40.107-05	2016-11-17 13:18:40.436-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-87000	-87000	\N	ecb04b93-548f-4523-8802-550cdbf58f26	59	857	3e8c842c-24c5-40b4-b3e2-db4a8a5a23a0
11089	DEBIT	Conference Grant: Google/IO Alicia Carr	-10000	USD	2016-10-04 11:25:59.981-04	2016-10-04 11:26:00.186-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-10000	-10000	\N	982b0060-91ec-492b-9b6a-8623756cbb2a	12	857	69298c4b-756b-4dcb-8142-b4938b5f4b3c
7554	CREDIT	International Women's Day Celebrations - Global	51750	USD	2017-03-28 14:27:16.525-04	2017-03-28 14:27:16.748-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51750	\N	f2ef8d98-6ac6-4954-bbbe-3cedd9ac7522	857	857	ba543d0f-f7fa-40c5-b6dd-44939aa66e0f
10961	DEBIT	Donation from PB - fees 	-1187	USD	2016-11-29 18:33:50.04-05	2016-11-29 18:33:50.206-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1187	-1187	\N	c5587641-a549-4a2d-b171-426a394d0151	4	857	f4e68981-d777-42ac-a6ab-ae6f42d781b9
11072	CREDIT	Network budget balance pre Open Collective	34240	USD	2016-10-04 17:49:31.268-04	2016-10-04 17:49:31.543-04	51	3	\N	2017-10-27 13:29:00.261-04	\N	\N	\N	\N	\N	\N	1	\N	34240	\N	c7149f75-589d-4603-a333-e14efdfd2c55	\N	857	f60aa822-25f8-4374-99fd-10ce1cd8dfd8
11006	CREDIT	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	110000	USD	2016-05-10 17:15:06.327-04	2016-05-10 17:15:06.677-04	51	3	\N	2017-10-27 13:28:58.674-04	\N	\N	\N	\N	\N	\N	1	\N	110000	\N	5d369b5b-c20e-4233-b02e-05f7bfbadb43	\N	857	47f5e209-5e63-4ebb-97c7-1a8b1f52d95a
10629	DEBIT	WWCode t-shirt sales	-1106	USD	2017-01-17 22:29:09.407-05	2017-01-17 22:29:09.561-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1106	-1106	\N	e489b12c-ebfb-4f29-a6a7-45aea7d2e4b8	14	857	58c425fd-5349-4cfe-9804-45ff0842c48d
11046	CREDIT	Network budget pre Open Collective 	162598	USD	2016-10-12 01:01:43.648-04	2016-10-12 01:01:43.828-04	51	3	\N	2017-10-27 13:28:58.993-04	\N	\N	\N	\N	\N	\N	1	\N	162598	\N	dc0fec50-18f4-4be8-9d59-d770a7de5517	\N	857	74edd83a-2f89-4f72-ab08-e66027a2163d
10907	CREDIT	Donation via meetup - fees and global development	775	USD	2016-12-13 15:20:15.375-05	2016-12-13 15:20:15.714-05	51	3	\N	2017-10-27 13:28:59.487-04	\N	\N	\N	\N	\N	\N	1	\N	775	\N	f005ef2f-7885-47b3-923e-0c6ec78e509c	\N	857	ae547542-6b14-450e-9d87-36742267a641
10801	DEBIT	Donation Scott Z. in honor of his sister	-1800	USD	2016-10-11 13:01:23.313-04	2016-10-11 13:01:23.731-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-1800	-1800	\N	8596a8ba-630d-4313-8a0b-c73d9149a9fb	291	857	bb6b0447-91d5-4532-81ce-05f6c74f6d56
10937	DEBIT	Global Development for Meetup Fee	-6000	USD	2016-12-23 12:20:13.429-05	2016-12-23 12:20:13.545-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-6000	-6000	\N	219ca50a-68f8-4b19-b645-74fd2a8081aa	259	857	f763b116-f78f-4a0e-9bfa-7b95b227e4b9
11034	CREDIT	WWCode DC t-shirts sales	9524	USD	2016-11-17 13:37:58.038-05	2016-11-17 13:37:58.232-05	51	3	\N	2017-10-27 13:28:58.688-04	\N	\N	\N	\N	\N	\N	1	\N	9524	\N	0ef6fd94-b238-47df-adff-936d4339ac92	\N	857	4b9b9aa5-12ec-40cc-9c0e-431edc53a64b
2307	CREDIT	Donation Pamela V.	4500	USD	2016-10-06 14:09:54.319-04	2016-10-06 14:09:54.357-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500	\N	20459f3e-47a2-42c8-8f77-9bdc17072479	857	857	61d4535c-acc1-4367-acc8-f102f6e0657a
7688	CREDIT	\N	50000	CAD	2017-03-31 19:37:30.819-04	2017-03-31 19:37:30.819-04	291	3	\N	\N	\N	2217	0	0	0	CAD	1	50000	50000	\N	5c191b8e-cc26-4f14-9ad4-bc6c7f3e1f05	857	857	6d9830de-586c-4e52-b8c5-59c234d0e7e3
10982	DEBIT	Network Development	-19100	USD	2016-10-11 20:28:02.718-04	2016-10-11 20:28:03.121-04	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-19100	-19100	\N	28e49d36-e6c4-4f3b-8501-9d5c8311b867	284	857	7ba2b72c-89d5-4fcd-8cfa-b79cc1685193
10987	CREDIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	2250	USD	2016-10-06 13:23:39.409-04	2016-10-06 13:23:39.459-04	51	3	\N	2017-10-27 13:28:59.367-04	\N	\N	\N	\N	\N	\N	1	\N	2250	\N	8fad666f-513a-4935-a1de-979f724aa41d	\N	857	9aa1e11a-9ace-4c1d-ab46-abb94116acd2
10746	DEBIT	Regional Leadership Director Training 	-13031	USD	2016-11-29 17:35:05.252-05	2016-11-29 17:35:05.379-05	857	3	\N	\N	\N	\N	\N	\N	\N	\N	1	-13031	-13031	\N	2a400ad4-c09a-473b-9cb1-b55bae314cad	47	857	a42243f3-6e31-48df-b5e2-f34ec28ce576
10606	DEBIT	Gitlab - transaction and global development	-414	USD	2017-02-06 17:12:42.534-05	2017-02-06 17:12:42.684-05	857	3	\N	2017-02-05 19:00:00-05	\N	\N	\N	\N	\N	\N	1	-414	-41400	\N	c394ee75-b147-4437-87b0-dbc0ddf84bf2	48	857	c6dc9ff9-2ff2-49ad-99f2-c91fc26f00d9
4384	CREDIT	Global Development for Meetup Fee	6000	USD	2016-12-27 12:24:55.371-05	2016-12-27 12:24:55.632-05	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	ad4cf65e-ffab-438f-9b08-a536185a5af3	857	857	f58c2b80-cb9c-4954-9a09-9f1fe5003f80
10891	CREDIT	Women Techmaker/WWCode partnership grant	50000	USD	2016-05-04 17:17:27.653-04	2016-05-04 17:17:27.886-04	51	3	\N	2017-10-27 13:29:00.551-04	\N	\N	\N	\N	\N	\N	1	\N	50000	\N	ad803456-6854-44f4-9516-1a282c3608dd	\N	857	ff617604-b49b-4b4e-ae64-e82f6fe98456
10524	DEBIT	\N	-100000	USD	2017-03-31 18:32:34.123-04	2017-03-31 18:32:34.123-04	857	3	\N	\N	\N	2212	0	\N	0	USD	1	-100000	-100000	\N	30916d04-42bc-476e-8423-887d788e1d5f	286	857	53460141-b1cc-4449-af00-504e48077496
2230	CREDIT	Conference Grant: Google/IO Alicia Carr	10000	USD	2016-10-04 11:25:59.981-04	2016-10-04 11:26:00.186-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	382ee140-1ddc-4000-b079-00cd1f595da2	857	857	69298c4b-756b-4dcb-8142-b4938b5f4b3c
2306	CREDIT	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	2250	USD	2016-10-06 13:23:39.409-04	2016-10-06 13:23:39.459-04	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	efb89f26-5e2c-42bf-b173-27d7bf0406f9	857	857	9aa1e11a-9ace-4c1d-ab46-abb94116acd2
10634	CREDIT	Leadership Development: Google I/O grant for Luisa M.	100000	USD	2017-03-22 13:56:10.528-04	2017-03-22 13:56:10.804-04	51	3	\N	2017-10-27 13:28:59.705-04	\N	\N	\N	\N	\N	USD	1	\N	100000	\N	ca06bc0e-e16f-433b-81d5-233bda16c976	\N	857	beee6e11-f546-4822-93c3-5686940cd89f
10876	CREDIT	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	2250	USD	2016-10-11 15:13:57.013-04	2016-10-11 15:13:57.265-04	51	3	\N	2017-10-27 13:28:59.776-04	\N	\N	\N	\N	\N	\N	1	\N	2250	\N	a8468c60-5f1c-476e-ae38-715485225c64	\N	857	c8aa448b-6048-4e22-9ec6-394fe0ca61dd
2431	CREDIT	Network Development (Thanks Atlassian) 	20000	USD	2016-10-12 01:06:05.058-04	2016-10-12 01:06:05.202-04	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9549e2a9-b907-4801-8b47-6407c300e439	857	857	cb9fd4d3-b5f4-4ec4-9414-c775998a22d9
10498	CREDIT	Network development (stickers)	58590	USD	2016-10-06 12:08:20.916-04	2016-10-06 12:08:21.09-04	51	3	\N	2017-10-27 13:28:59.692-04	\N	\N	\N	\N	\N	\N	1	\N	58590	\N	f7b953b0-f548-42f7-b79c-66cdd24598b2	\N	857	be4802de-f720-40f5-a10a-ebb86aa78d54
2234	CREDIT	Donations made via Meetup as of Jan 2016, less transaction fees	9212	USD	2016-10-04 11:46:17.845-04	2016-10-04 11:46:18.02-04	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9212	\N	5af62e78-2976-4c04-aaab-f3c34f1297e7	857	857	fdb813c1-987a-49e0-85c9-1a6d0dd52368
\.


                                                                                                                                                                                                                                   4029.dat                                                                                            0000600 0004000 0002000 00000063720 13174666341 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1329	fedfabd0763d3993683de654cc8e68b7@gmail.com	*****	*****	*****	2016-09-29 14:09:42.785-04	2016-09-29 14:09:42.785-04	\N	\N	*****	*****	\N	Dana	Dalling	\N	f	687
30	df61fcd898d629d05fe8ae08fd66ec4d@gmail.com	*****	*****	*****	2016-01-09 16:31:01.954-05	2017-04-03 08:58:04.717-04	\N	\N	*****	*****	\N	Pia	Mancini	\N	f	691
3206	9c1a8a4fc15ce332c7c5624952bceeff@gmail.com	*****	*****	*****	2017-02-21 11:55:29.631-05	2017-05-16 12:49:19.822-04	\N	\N	*****	*****	\N	WWCode		\N	f	690
2906	3b3d000425befc5172a5208310218fc2@gmail.com	*****	*****	*****	2017-02-01 12:30:43.176-05	2017-02-01 13:35:36.827-05	\N	\N	*****	*****	\N	\N	\N	\N	f	692
1331	60767513ea7e3d82d4a50d8241faea30@gmail.com	*****	*****	*****	2016-09-29 14:10:43.391-04	2017-03-28 01:13:36.913-04	\N	\N	*****	*****	\N	Chee	Yim Goh	\N	f	695
4173	3be24eacaf70dddd5f990afac0574189@gmail.com	*****	*****	*****	2017-04-11 22:05:32.736-04	2017-04-11 22:06:03.772-04	\N	\N	*****	*****	\N	Anne	Brown	\N	f	693
577	8c4471bffc28c261aa4ef2a5d7004de4@gmail.com	*****	*****	*****	\N	2016-12-28 17:36:35.346-05	\N	\N	*****	*****	\N	Georgia	Andrews	\N	f	694
171	475c85fcbd1984c9e5e19cea267c4f33@gmail.com	*****	*****	*****	2016-03-19 18:11:53.101-04	2017-05-18 13:47:24.123-04	\N	\N	*****	*****	\N	Caterina	Paun	\N	f	826
1359	d6b1ce23201e994cee24a7971a79d810@gmail.com	*****	*****	*****	2016-09-29 14:33:37.087-04	2016-09-29 14:33:37.087-04	\N	\N	*****	*****	\N	Himi	Sato	\N	f	828
1375	2e951f7b3ce79f4faad5da347e302b27@gmail.com	*****	*****	*****	2016-09-29 14:43:49.04-04	2016-09-29 14:43:49.04-04	\N	\N	*****	*****	\N	Anouk	Ruhaak	\N	f	829
1333	c39681f94c378e9adbbbca79b24dd9ff@gmail.com	*****	*****	*****	2016-09-29 14:11:53.842-04	2017-04-12 10:42:51.09-04	\N	\N	*****	*****	\N	Gen	Ashley	\N	f	830
1332	4d4dfee45f10b2b8affd87ee5a82b7a1@gmail.com	*****	*****	*****	2016-09-29 14:10:43.392-04	2017-03-20 12:33:13.852-04	\N	\N	*****	*****	\N	Jecelyn		\N	f	831
1361	9220296eae97265c78dd6ae0722eb573@gmail.com	*****	*****	*****	2016-09-29 14:33:37.095-04	2016-09-29 14:33:37.095-04	\N	\N	*****	*****	\N	Mami	Enomoto	\N	f	832
1327	ebd16aa661c34f4cfdca849165c47ecb@gmail.com	*****	*****	*****	2016-09-29 14:08:19.487-04	2016-09-29 14:08:19.487-04	\N	\N	*****	*****	\N	Karen	Farzam	\N	f	834
1358	b78218b19cc91ab0dfb943c6c253ca85@gmail.com	*****	*****	*****	2016-09-29 14:32:00.983-04	2016-09-29 14:32:00.983-04	\N	\N	*****	*****	\N	Laura	Scholl	\N	f	833
69	75e923f20ab3d84a3ac4b36a4109d13c@gmail.com	*****	*****	*****	2016-01-29 18:18:47.287-05	2017-05-21 09:24:37.706-04	\N	\N	*****	*****	\N	Alicia		\N	f	835
3999	15daf29f3c0fcdf9a94e700ce94f90f6@gmail.com	*****	*****	*****	2017-04-04 15:51:02.718-04	2017-04-04 15:51:03.29-04	\N	\N	*****	*****	\N	Allie	Winkelman	\N	f	836
3301	e6aa8986385415192e05127010441ae4@gmail.com	*****	*****	*****	2017-02-27 19:25:15.503-05	2017-02-27 19:25:19.402-05	\N	\N	*****	*****	\N	Sue	Sinclair	\N	f	837
3053	2bbfedaf9e616d5c252c38e6019481ec@gmail.com	*****	*****	*****	2017-02-09 15:42:02.01-05	2017-02-10 11:48:15.699-05	\N	\N	*****	*****	\N	Flock:	Accelerating Women In Tech	\N	f	838
4348	4e25fd969973d6fd55614b86c0c74dc5@gmail.com	*****	*****	*****	2017-04-20 05:34:08.219-04	2017-05-04 18:58:47.619-04	\N	\N	*****	*****	\N	Craft	CMS	\N	f	840
3419	c4d4a0ed522a5106c5aa8b3e4c077071@gmail.com	*****	*****	*****	2017-03-07 14:01:52.704-05	2017-03-07 14:02:04.53-05	\N	\N	*****	*****	\N	Erin	Spiceland	\N	f	841
4153	adb8ed8f9a018d919a1dca1d502d6b3b@gmail.com	*****	*****	*****	2017-04-10 21:09:47.41-04	2017-04-10 21:09:51.31-04	\N	\N	*****	*****	\N	Nikko	Patten	\N	f	842
1325	5c0594710825406596a99025a319d635@gmail.com	*****	*****	*****	2016-09-29 14:06:00.962-04	2017-02-03 18:06:45.932-05	\N	\N	*****	*****	\N	Pamela	Wood Browne	\N	f	843
141	688f744a10db3334b59d756689fa8250@gmail.com	*****	*****	*****	2016-03-07 04:50:58.721-05	2017-05-20 07:50:46.742-04	\N	\N	*****	*****	\N	Jigyasa	Grover	\N	f	844
74	26888a78bd38eaf94af924a9675ae705@gmail.com	*****	*****	*****	2016-01-29 18:19:36.407-05	2016-09-28 06:15:16.735-04	\N	\N	*****	*****	\N	Chantal		\N	f	845
4720	2248e9f4451791491178e6ad6e8b395f@gmail.com	*****	*****	*****	2017-05-09 14:14:19.572-04	2017-05-09 14:14:20.294-04	\N	\N	*****	*****	\N	Nicole	Giannone	\N	f	846
28	332cb39ce5e614d5fcad01ae28c6e9d5@gmail.com	*****	*****	*****	2015-12-21 11:34:26.053-05	2017-02-01 14:55:11.641-05	\N	\N	*****	*****	\N	Holly		\N	f	847
883	8cdf243bb6d94e727c22e74f7f73780b@gmail.com	*****	*****	*****	2016-08-01 11:54:10.844-04	2016-08-01 11:57:32.536-04	\N	\N	*****	*****	\N	Rackspace		\N	f	856
1378	303f22fe5fcfb3542479af3c0d7ffb51@gmail.com	*****	*****	*****	2016-09-29 14:43:49.205-04	2017-05-10 17:26:04.82-04	\N	\N	*****	*****	\N	Glenna	Buford	\N	f	793
1372	6a3a6e3cc3f4bb5cb7ef241e3ed3167a@gmail.com	*****	*****	*****	2016-09-29 14:41:11.058-04	2016-09-29 14:41:11.058-04	\N	\N	*****	*****	\N	Radhika	Rayadu	\N	f	794
1299	ca840ad4fb9f966b78a7608f23916ce3@gmail.com	*****	*****	*****	2016-09-28 17:47:14.881-04	2016-09-28 17:49:30.346-04	\N	\N	*****	*****	\N	data.world	Swider	\N	f	795
1371	20ef75e5bb432fb540423c3b6fd60a1a@gmail.com	*****	*****	*****	2016-09-29 14:41:11.052-04	2016-09-29 14:41:11.052-04	\N	\N	*****	*****	\N	Guiti	Nabavi	\N	f	796
32	e0d3d2a0a00a30ae6368aa47ab545566@gmail.com	*****	*****	*****	2016-01-11 13:54:33.296-05	2017-05-10 13:19:29.673-04	\N	\N	*****	*****	\N	Saranya	Karuppusamy	\N	f	797
4834	0174cfb68bc98317384ae65d2bb4b6a5@gmail.com	*****	*****	*****	2017-05-15 08:07:56.682-04	2017-05-15 08:09:17.931-04	\N	\N	*****	*****	\N	Brian	Vinci	\N	f	799
1379	26ac149a5ae8d0a09a8eadac9b2153d8@gmail.com	*****	*****	*****	2016-09-29 14:43:49.211-04	2016-09-29 14:43:49.211-04	\N	\N	*****	*****	\N	Aleksandra	Gavriloska	\N	f	800
2898	e3073fd059876de0de39852d83a06783@gmail.com	*****	*****	*****	2017-02-01 10:16:17.461-05	2017-02-01 10:16:17.461-05	\N	\N	*****	*****	\N	\N	\N	\N	f	801
1369	a67e0bdc09dd2ba28385c89f334828f5@gmail.com	*****	*****	*****	2016-09-29 14:38:54.935-04	2016-09-29 14:38:54.935-04	\N	\N	*****	*****	\N	Erika	Aguayo	\N	f	802
686	411be685dd05fee05f62ca6e48aef8a3@gmail.com	*****	*****	*****	2016-07-01 18:31:42.541-04	2016-09-28 06:15:17.556-04	\N	\N	*****	*****	\N	\N	\N	\N	f	803
1368	bc2d687d77a9548c85d4d5cd2f9be8a4@gmail.com	*****	*****	*****	2016-09-29 14:38:54.934-04	2016-09-29 14:38:54.934-04	\N	\N	*****	*****	\N	Ana	Castro	\N	f	804
35	26547a83f9ce5ae0839349325b1e7343@gmail.com	*****	*****	*****	2016-01-11 13:59:41.948-05	2017-05-12 00:19:54.192-04	\N	\N	*****	*****	\N	Erica		\N	f	806
1366	548f55e7c60e649394294a500b7435f5@gmail.com	*****	*****	*****	2016-09-29 14:37:07.344-04	2016-09-29 14:37:07.344-04	\N	\N	*****	*****	\N	Vicky	Twomey-Lee	\N	f	807
170	bd2fd32d181880d2fc0c95d7ba8ce17d@gmail.com	*****	*****	*****	2016-03-19 18:11:44.881-04	2016-03-19 18:11:44.881-04	\N	\N	*****	*****	\N	Paige	Hubbell	\N	f	809
1890	29831b25c00785980ab934f70d4813b1@gmail.com	*****	*****	*****	2016-11-28 10:33:11.726-05	2016-11-28 10:33:31.466-05	\N	\N	*****	*****	\N	Jamie	Lu	\N	f	810
1365	8e6ff81f47ed88c6f6588511e5a3202e@gmail.com	*****	*****	*****	2016-09-29 14:37:07.337-04	2016-09-29 14:37:07.337-04	\N	\N	*****	*****	\N	Laura	Uzcátegui	\N	f	811
108	13ce3747cb13689865309d537ea4842f@gmail.com	*****	*****	*****	2016-02-18 14:54:08.5-05	2016-09-28 06:15:16.811-04	\N	\N	*****	*****	\N	Emily	Heist Moss	\N	f	813
1364	20e1ef7ed0e42f913b1b0fb8bc15b50d@gmail.com	*****	*****	*****	2016-09-29 14:34:59.505-04	2016-09-29 14:34:59.505-04	\N	\N	*****	*****	\N	Peggy	Kuo	\N	f	812
1363	97e510a21c89bac3e0111d73f5737b05@gmail.com	*****	*****	*****	2016-09-29 14:34:59.504-04	2016-09-29 14:34:59.504-04	\N	\N	*****	*****	\N	Lucy	Bain	\N	f	814
1362	12a217393125c49fba8faf93dadafcd8@gmail.com	*****	*****	*****	2016-09-29 14:34:59.499-04	2016-09-29 14:34:59.499-04	\N	\N	*****	*****	\N	Daphne	Chong	\N	f	815
71	f74d1d9b9d4e727c9f1634da2669cd85@gmail.com	*****	*****	*****	2016-01-29 18:19:12.899-05	2016-09-28 06:15:16.707-04	\N	\N	*****	*****	\N	Brenda		\N	f	816
33	c31f8fee92777f265a2c4215007f35a2@gmail.com	*****	*****	*****	2016-01-11 13:57:18.467-05	2016-01-11 13:57:18.467-05	\N	\N	*****	*****	\N	Kaylyn		\N	f	817
1360	58564fc814b9e582dc1dcfb9242ca2ac@gmail.com	*****	*****	*****	2016-09-29 14:33:37.088-04	2016-09-29 14:33:37.088-04	\N	\N	*****	*****	\N	Aya	Nakagawa	\N	f	818
8	9f23b14304ccc62b927759bbf7ca73c8@gmail.com	*****	*****	*****	2015-11-30 15:20:11.257-05	2017-05-09 16:20:42.144-04	\N	\N	*****	*****	\N	Aseem	Sood	\N	f	819
7	163233711ccd4a6968191c8fbd549d8a@gmail.com	*****	*****	*****	2015-11-19 05:09:51.192-05	2017-04-12 16:22:46.946-04	\N	\N	*****	*****	\N	Marcela	Lango	\N	f	821
37	4c06d3aa9533a2d242b1fa57930c6603@gmail.com	*****	*****	*****	2016-01-11 14:02:41.058-05	2016-02-15 17:33:29.118-05	\N	\N	*****	*****	\N	Fernanda		\N	f	822
34	6f62bd61a70f4848e632242e885cc9ed@gmail.com	*****	*****	*****	2016-01-11 13:58:47.796-05	2016-01-11 13:58:47.796-05	\N	\N	*****	*****	\N	Kelly		\N	f	823
1370	7efecdcdea73d6875db52b91f68c0603@gmail.com	*****	*****	*****	2016-09-29 14:38:54.951-04	2016-09-29 14:38:54.951-04	\N	\N	*****	*****	\N	Viv	Del Rio	\N	f	825
36	a3f15edbecbe7da5265fba790e9feeb9@gmail.com	*****	*****	*****	2016-01-11 14:01:43.411-05	2016-02-15 17:33:12.306-05	\N	\N	*****	*****	\N	Dayra		\N	f	827
192	5effb40d83347a559b155bf5762a3985@gmail.com	*****	*****	*****	2016-03-25 11:11:02.011-04	2016-03-25 11:11:20.398-04	\N	\N	*****	*****	\N	RigUp		\N	f	852
303	357489ee6e6984e56d512c2bbf4f5b18@gmail.com	*****	*****	*****	2016-04-29 09:51:16.619-04	2016-04-29 09:51:42.705-04	\N	\N	*****	*****	\N	The	Human Geo Group	\N	f	853
224	a32663428ce0d29c94f0f78666e7c06e@gmail.com	*****	*****	*****	2016-04-13 12:46:07.217-04	2016-04-13 14:44:12.626-04	\N	\N	*****	*****	\N	Bonsai.io		\N	f	854
283	c07b3781151a9c9fb2991128a4675d06@gmail.com	*****	*****	*****	2016-04-28 11:01:14.69-04	2016-04-28 11:02:00.631-04	\N	\N	*****	*****	\N	Dev	Bootcamp 	\N	f	855
1320	843f89b3975c3b7fc84068f95fc796cc@gmail.com	*****	*****	*****	2016-09-29 14:02:54.546-04	2016-09-29 14:02:54.546-04	\N	\N	*****	*****	\N	Amber	Houle	\N	f	751
1321	309a70eda3c7ffe404a6ca6569c939bf@gmail.com	*****	*****	*****	2016-09-29 14:02:54.555-04	2016-09-29 14:02:54.555-04	\N	\N	*****	*****	\N	Candice	Haddad	\N	f	752
1319	6bfab1190102baca886112ebc885f691@gmail.com	*****	*****	*****	2016-09-29 14:01:49.703-04	2016-09-29 14:01:49.703-04	\N	\N	*****	*****	\N	Neha	Kaura	\N	f	753
1347	8f78c6c692cd973103ba9c647a361577@gmail.com	*****	*****	*****	2016-09-29 14:25:21.95-04	2016-09-29 14:25:21.95-04	\N	\N	*****	*****	\N	Marisol	Acuna	\N	f	756
68	7ddc7e8e6d4fdfa9d934e55a2b005d87@gmail.com	*****	*****	*****	2016-01-29 18:18:13.688-05	2016-09-28 06:15:17.148-04	\N	\N	*****	*****	\N	Rylee		\N	f	755
1317	7c54f08b683464eac663bd982037283a@gmail.com	*****	*****	*****	2016-09-29 14:01:04.636-04	2016-09-29 14:01:04.636-04	\N	\N	*****	*****	\N	Amber	Joyner	\N	f	758
1318	96950200d2eca5a63244a97b75f536b7@gmail.com	*****	*****	*****	2016-09-29 14:01:04.636-04	2016-09-29 14:01:04.636-04	\N	\N	*****	*****	\N	Sally	Kingston	\N	f	757
896	898029d0f8816a246e0c7a7c65341485@gmail.com	*****	*****	*****	2016-08-03 13:47:13.173-04	2016-09-28 06:15:17.897-04	\N	\N	*****	*****	\N	Geoff	Domoracki	\N	f	759
1316	2d3396ed13ba45c0c471b3af1aabdf2a@gmail.com	*****	*****	*****	2016-09-29 13:59:15.428-04	2016-09-29 13:59:15.428-04	\N	\N	*****	*****	\N	Mia	Zhu	\N	f	760
1315	f23b8ce26e6121a5e9dc38462e2776fa@gmail.com	*****	*****	*****	2016-09-29 13:58:16.63-04	2016-09-29 13:58:16.63-04	\N	\N	*****	*****	\N	Isabella	Oliveira	\N	f	761
2549	80afcb383424a739a793e105bdb617f9@gmail.com	*****	*****	*****	2017-01-14 12:11:39.224-05	2017-02-22 19:10:36.94-05	\N	\N	*****	*****	\N	Eileen	C	\N	f	762
70	5c7fa359b4ee800bae4b5e919a433171@gmail.com	*****	*****	*****	2016-01-29 18:18:53.83-05	2017-03-12 14:10:38.549-04	\N	\N	*****	*****	\N	beth	laing	\N	f	763
1313	cf9301117f3684b125ddc70a811c9ff9@gmail.com	*****	*****	*****	2016-09-29 13:54:53.45-04	2016-09-29 13:54:53.45-04	\N	\N	*****	*****	\N	Gillian	Colan-O'Leary	\N	f	764
1314	d8775d54111aaf3d47957c5c4f539049@gmail.com	*****	*****	*****	2016-09-29 13:54:53.462-04	2016-09-29 13:54:53.462-04	\N	\N	*****	*****	\N	Sheree	Atcheson	\N	f	765
31	27e19add9323d39d0b3f60dde40fee33@gmail.com	*****	*****	*****	2016-01-11 13:53:43.73-05	2016-07-04 16:12:12.413-04	\N	\N	*****	*****	\N	Sandra		\N	f	766
1312	71eb923685350087d1aa38bed7843ac3@gmail.com	*****	*****	*****	2016-09-29 13:53:00.503-04	2016-09-29 13:53:00.503-04	\N	\N	*****	*****	\N	Xinhui	Li	\N	f	767
80	447bd08d1ff86983e66a70858775669d@gmail.com	*****	*****	*****	2016-02-02 11:52:02.222-05	2016-09-28 06:15:16.766-04	\N	\N	*****	*****	\N	Maru	Lango	\N	f	768
1355	4365a1d13eca1c78bd460ec7d17b2544@gmail.com	*****	*****	*****	2016-09-29 14:30:08.978-04	2016-09-29 14:30:08.978-04	\N	\N	*****	*****	\N	Oksana	Denesiuk	\N	f	769
1310	31d3a19861b19e3c5d1eb2b483370ee1@gmail.com	*****	*****	*****	2016-09-29 13:51:29.334-04	2016-09-29 13:51:29.334-04	\N	\N	*****	*****	\N	Smitha	Radhakrishnan	\N	f	770
646	e717495c9186295c79d02397add07124@gmail.com	*****	*****	*****	2016-06-22 16:09:43.896-04	2016-09-28 06:15:17.513-04	\N	\N	*****	*****	\N	Lindsey	Barrett	\N	f	771
1309	24b7f50b91ac3f9b0fbf879e9039aa0a@gmail.com	*****	*****	*****	2016-09-29 13:51:29.333-04	2016-09-29 13:51:29.333-04	\N	\N	*****	*****	\N	Shwetha	Lakshman Rao	\N	f	772
77	7ac57722768c7d3749d19e06e8ba389d@gmail.com	*****	*****	*****	2016-01-29 18:19:53.922-05	2016-09-28 06:15:16.734-04	\N	\N	*****	*****	\N	Zoe	Madden-Wood	\N	f	773
72	9d5e8daeff013b0f404f87206eed86f9@gmail.com	*****	*****	*****	2016-01-29 18:19:22.243-05	2016-09-28 06:15:16.708-04	\N	\N	*****	*****	\N	Elizabeth	Ferrao	\N	f	774
642	c798ff50a86d1b17424f940a93fe10d8@gmail.com	*****	*****	*****	2016-06-21 12:02:52.874-04	2016-09-28 06:15:17.476-04	\N	\N	*****	*****	\N	Joey	Rosenberg	\N	f	775
1367	a95d13b713d4ac6181570e7e9b909b05@gmail.com	*****	*****	*****	2016-09-29 14:37:07.344-04	2016-09-29 14:37:07.344-04	\N	\N	*****	*****	\N	Christina	Lynch	\N	f	776
1308	ae5eeb5acc070587de95739c5f58d0a1@gmail.com	*****	*****	*****	2016-09-29 13:49:43.061-04	2016-09-29 13:49:43.061-04	\N	\N	*****	*****	\N	Racha	Bella	\N	f	777
78	4983e60f20be60f3cd44948b1c1c0087@gmail.com	*****	*****	*****	2016-01-29 18:20:00.061-05	2016-09-28 06:15:16.735-04	\N	\N	*****	*****	\N	Fanya		\N	f	778
75	ef131790a7c920cf2e1603358efc1449@gmail.com	*****	*****	*****	2016-01-29 18:19:43.713-05	2016-09-28 06:15:16.708-04	\N	\N	*****	*****	\N	Gabriela	Adamova	\N	f	779
1307	35523780be14ccacd1194641ba0bde57@gmail.com	*****	*****	*****	2016-09-29 13:49:43.051-04	2016-09-29 13:49:43.051-04	\N	\N	*****	*****	\N	Fatma	Djoudjou	\N	f	780
551	a4f59257d033d8eb46bbb19bcf290430@gmail.com	*****	*****	*****	2016-06-06 15:04:33.418-04	2016-09-28 06:15:17.39-04	\N	\N	*****	*****	\N	Allison	Canestaro	\N	f	781
1377	e59b939ecc4c77c350f966165188ad7e@gmail.com	*****	*****	*****	2016-09-29 14:43:49.189-04	2016-09-29 14:43:49.189-04	\N	\N	*****	*****	\N	Silvia	Pina	\N	f	782
1305	aba7551e89f249da0fae69d2be8f5128@gmail.com	*****	*****	*****	2016-09-29 13:44:40.429-04	2016-09-29 13:44:40.429-04	\N	\N	*****	*****	\N	Judith	Agbotse	\N	f	783
76	d13f331afaae109d7c30e231be465401@gmail.com	*****	*****	*****	2016-01-29 18:19:47.116-05	2016-09-28 06:15:16.734-04	\N	\N	*****	*****	\N	Rose	THERESA	\N	f	784
4550	35cf86710c6d930ee7610bf1bb5dbe11@gmail.com	*****	*****	*****	2017-05-01 13:13:32.139-04	2017-05-01 13:13:35.793-04	\N	\N	*****	*****	\N	Lacey	Reinoehl	\N	f	785
1376	c11e740d05e136e14f4588e08a01f460@gmail.com	*****	*****	*****	2016-09-29 14:43:49.157-04	2016-09-29 14:43:49.157-04	\N	\N	*****	*****	\N	Carola	Nitz	\N	f	786
67	61b08842f8750a6bc18d274dc954fa02@gmail.com	*****	*****	*****	2016-01-29 18:16:09.038-05	2016-09-28 06:15:16.707-04	\N	\N	*****	*****	\N	Nupur	Kapoor	\N	f	787
1178	d49f580dd3b9b503a43175705afc72ff@gmail.com	*****	*****	*****	2016-09-13 00:15:01.959-04	2016-09-28 06:15:18.213-04	\N	\N	*****	*****	\N	Google	Fiber	\N	f	788
1311	4bdb3020da3f8070227aa9cd1662f481@gmail.com	*****	*****	*****	2016-09-29 13:53:00.502-04	2016-09-29 13:53:00.502-04	\N	\N	*****	*****	\N	Lucy	Shang	\N	f	789
1335	11dfac5cbe9c44dd072f6d704c64f19b@gmail.com	*****	*****	*****	2016-09-29 14:12:58.838-04	2016-09-29 14:12:58.838-04	\N	\N	*****	*****	\N	Irina	Muchnik	\N	f	790
392	914df0c8ab1f8b15a8ab1a7e77a3bcc0@gmail.com	*****	*****	*****	2016-05-19 15:24:40.738-04	2016-09-28 06:15:18.36-04	\N	\N	*****	*****	\N	Travis	Swicegood	\N	f	718
1356	d182a2ddbeeb69d5629028cfaeda4356@gmail.com	*****	*****	*****	2016-09-29 14:30:54.244-04	2016-09-29 14:30:54.244-04	\N	\N	*****	*****	\N	Dinah	Shi	\N	f	719
1353	672ed3d7420c37155d2978ef9bb4bddd@gmail.com	*****	*****	*****	2016-09-29 14:28:54.276-04	2016-09-29 14:28:54.276-04	\N	\N	*****	*****	\N	Ria	Riaz	\N	f	720
1351	2112fabeedef785fff13999b12f6e057@gmail.com	*****	*****	*****	2016-09-29 14:28:08.47-04	2016-09-29 14:28:08.47-04	\N	\N	*****	*****	\N	Kathy	Trammell	\N	f	721
1350	275a7843d04d598eb4949a8f3b98f170@gmail.com	*****	*****	*****	2016-09-29 14:26:35.139-04	2016-09-29 14:26:35.139-04	\N	\N	*****	*****	\N	Yoka	Liu	\N	f	722
1349	784d1666f6262338f095884b8b2ab1d8@gmail.com	*****	*****	*****	2016-09-29 14:26:35.133-04	2016-09-29 14:26:35.133-04	\N	\N	*****	*****	\N	Qianyi	Zheng	\N	f	723
1348	feb1e25523fe209c41071badd848f502@gmail.com	*****	*****	*****	2016-09-29 14:25:21.969-04	2016-09-29 14:25:21.969-04	\N	\N	*****	*****	\N	Roxane	Castelein	\N	f	724
73	9cc8932f53ca5322fab8553db692e6a7@gmail.com	*****	*****	*****	2016-01-29 18:19:28.648-05	2016-09-28 06:15:18.347-04	\N	\N	*****	*****	\N	Barbara		\N	f	725
1345	32d477008ca7ce468c8b6894d3527377@gmail.com	*****	*****	*****	2016-09-29 14:24:17.802-04	2016-09-29 14:24:17.802-04	\N	\N	*****	*****	\N	Ashma	Sethi	\N	f	727
1346	c9606a2459e0fef1e21cdc86c3eb2683@gmail.com	*****	*****	*****	2016-09-29 14:24:17.81-04	2016-09-29 14:24:17.81-04	\N	\N	*****	*****	\N	Shruti	Sethi	\N	f	726
1343	8832824eb21ff845244a89b2aeb53972@gmail.com	*****	*****	*****	2016-09-29 14:19:11.446-04	2016-09-29 14:19:11.446-04	\N	\N	*****	*****	\N	Andreza	Leite	\N	f	728
1341	0cd39d443715253ede1c195f212fa858@gmail.com	*****	*****	*****	2016-09-29 14:16:52.099-04	2016-09-29 14:16:52.099-04	\N	\N	*****	*****	\N	Jennifer	Hoover	\N	f	729
1342	530e82f7e0744b9b860f9811257e0b13@gmail.com	*****	*****	*****	2016-09-29 14:17:47.289-04	2016-09-29 14:17:47.289-04	\N	\N	*****	*****	\N	Veronica	Cannon	\N	f	730
1338	27196e10ddabe6055a003b98d791a15b@gmail.com	*****	*****	*****	2016-09-29 14:14:46.606-04	2016-09-29 14:14:46.606-04	\N	\N	*****	*****	\N	Princy	James	\N	f	732
1340	8abf71093dbd2bfc653a5bc12a5a7b89@gmail.com	*****	*****	*****	2016-09-29 14:16:17.115-04	2016-09-29 14:16:17.115-04	\N	\N	*****	*****	\N	Emily	Reese	\N	f	731
1339	99b642de95827a0d4bba0315ddd40723@gmail.com	*****	*****	*****	2016-09-29 14:15:23.931-04	2016-09-29 14:15:23.931-04	\N	\N	*****	*****	\N	Grisel	Ancona	\N	f	733
1337	d32d64b3fc1390780651de634d212e50@gmail.com	*****	*****	*****	2016-09-29 14:13:48.772-04	2016-09-29 14:13:48.772-04	\N	\N	*****	*****	\N	Isabel	Yepes	\N	f	734
1334	416e8cd289733c0bb5ed83f3ede37276@gmail.com	*****	*****	*****	2016-09-29 14:11:53.843-04	2016-09-29 14:11:53.843-04	\N	\N	*****	*****	\N	Vinita	Khandelwal Rathi	\N	f	735
1336	0830431cc80ea3b8d7b9dc5eed3fde68@gmail.com	*****	*****	*****	2016-09-29 14:12:58.852-04	2016-09-29 14:12:58.852-04	\N	\N	*****	*****	\N	Tiffany	Andrews	\N	f	736
1158	3a0a65e6b6e105f4835f188459a7b979@gmail.com	*****	*****	*****	2016-09-09 23:42:48.933-04	2016-09-28 06:15:18.225-04	\N	\N	*****	*****	\N	Pieceofr		\N	f	737
1145	0d11c83dcf3d75bc133ab5010187b7b6@gmail.com	*****	*****	*****	2016-09-07 18:13:23.624-04	2016-09-28 06:15:18.184-04	\N	\N	*****	*****	\N	Jane	Shih	\N	f	739
1330	51d33c46424eb3f4647ded569bda1da3@gmail.com	*****	*****	*****	2016-09-29 14:09:42.794-04	2016-09-29 14:09:42.794-04	\N	\N	*****	*****	\N	FJ	Genus	\N	f	740
426	c989f4c11bd20a6754a75c38303a4767@gmail.com	*****	*****	*****	2016-05-23 16:27:26.092-04	2016-09-28 06:15:17.365-04	\N	\N	*****	*****	\N	Ellevest		\N	f	741
555	3379a40c501c7f24d233be62ce9a94c5@gmail.com	*****	*****	*****	2016-06-06 20:53:44.829-04	2016-09-28 06:15:17.29-04	\N	\N	*****	*****	\N	Shahnaz	Kamberi	\N	f	743
1326	64b6e8606a0a0dcdd531b7f51f0dfe24@gmail.com	*****	*****	*****	2016-09-29 14:06:44.745-04	2016-09-29 14:06:44.745-04	\N	\N	*****	*****	\N	KeSha	Shah	\N	f	742
1323	d4caf7062fecc15e4fa181bf8632bbdf@gmail.com	*****	*****	*****	2016-09-29 14:05:19.073-04	2016-09-29 14:05:19.073-04	\N	\N	*****	*****	\N	Maira	Bejamin	\N	f	745
1324	8fd43f5cd0be03abdf7f57c45559f394@gmail.com	*****	*****	*****	2016-09-29 14:05:19.079-04	2016-09-29 14:05:19.079-04	\N	\N	*****	*****	\N	Candace	Lazarou	\N	f	744
897	a48b149e339d16ec672b8abea68be0e3@gmail.com	*****	*****	*****	2016-08-02 20:00:00-04	2017-04-17 12:41:26.051-04	\N	\N	*****	*****	\N	Radhika	Malik	\N	f	748
898	ad38fa1d5fec65ace946d4b5a1da5e78@gmail.com	*****	*****	*****	2016-08-02 20:00:00-04	2016-08-02 20:00:00-04	\N	\N	*****	*****	\N	Casey	Gruppioni	\N	f	746
4749	42cdf9a221d1dbffc6da14cd53207b4c@gmail.com	*****	*****	*****	2017-05-10 19:45:43.307-04	2017-05-10 19:45:44.074-04	\N	\N	*****	*****	\N	Elijah	Van Der Giessen	\N	f	747
1322	bc72c4b9fd99b99cfd7cc6decbd58008@gmail.com	*****	*****	*****	2016-09-29 14:03:46.798-04	2017-02-15 13:12:58.843-05	\N	\N	*****	*****	\N	Carole	Bennett	\N	f	749
1094	acb49a7f9ec2454380130c56c32ebbec@gmail.com	*****	*****	*****	2016-09-01 10:41:33.243-04	2016-09-01 10:43:52.954-04	\N	\N	*****	*****	\N	thirteen23		\N	f	849
1328	8808873dd5e6a229bca3641b8890d754@gmail.com	*****	*****	*****	2016-09-29 14:08:19.492-04	2016-09-29 14:08:19.492-04	\N	\N	*****	*****	\N	Michelle	Sun	\N	f	686
2	b0021cf62c2ef3dc137cf0a87e2af92b@gmail.com	*****	*****	*****	2015-11-05 08:44:30.93-05	2017-05-25 14:22:59.819-04	\N	\N	*****	*****	2016-03-03 19:07:14.176-05	Xavier	Damman	\N	f	688
3	a1c73eb4917522c4cdcebe8736395eb3@gmail.com	*****	*****	*****	2015-11-19 05:07:53.479-05	2017-05-22 12:22:41.796-04	\N	\N	*****	*****	2017-03-02 00:58:23.993-05	Women	Who Code	\N	t	51
142	3723537c491f597e9c203bad685dd9d7@gmail.com	*****	*****	*****	2016-03-07 04:51:08.328-05	2017-02-10 19:24:03.134-05	\N	\N	*****	*****	\N	Sarah	Olson	\N	f	696
2594	ad47316cbe8c10d21978ee1dc5746792@gmail.com	*****	*****	*****	2017-01-18 08:49:53.082-05	2017-01-18 08:55:44.616-05	\N	\N	*****	*****	\N	Tamouse	Temple	\N	f	697
1344	d6dd386d45dd48d56872b57c7502ba72@gmail.com	*****	*****	*****	2016-09-29 14:19:11.45-04	2017-04-30 18:09:37.177-04	\N	\N	*****	*****	\N	Karina		\N	f	698
2220	73e73afea6c744a00d6963fbf8a4ef16@gmail.com	*****	*****	*****	2016-12-18 20:41:26.473-05	2017-01-07 02:47:05.144-05	\N	\N	*****	*****	\N	Cameron	🐳✨	\N	f	699
2561	0dbc97aceea70683f46b266f2c0e559a@gmail.com	*****	*****	*****	2017-01-16 13:03:53.479-05	2017-01-16 13:03:53.479-05	\N	\N	*****	*****	\N	Amanda	Folson	\N	f	700
1303	da23087dbcb3966f332eb0d22ebbdde1@gmail.com	*****	*****	*****	2016-09-29 13:43:14.052-04	2016-11-23 02:21:46.01-05	\N	\N	*****	*****	\N	Shirley	Hicks	\N	f	702
1846	f57e8a5f4bb72290e312a6c29b1407a3@gmail.com	*****	*****	*****	2016-11-22 10:22:35.912-05	2016-11-22 10:23:28.441-05	\N	\N	*****	*****	\N	Portland	Modern Manufacturing Collective	\N	f	701
2431	f4da08d72d1a2dfe1f47db5f46a62a5b@gmail.com	*****	*****	*****	2017-01-03 19:00:00-05	2017-04-28 16:39:58.316-04	\N	\N	*****	*****	\N	Nataliia	Ilchenko	\N	f	703
1374	4d9f4287fe4e2a93b73c1cb08be76148@gmail.com	*****	*****	*****	2016-09-29 14:41:11.059-04	2016-12-19 17:20:00.592-05	\N	\N	*****	*****	\N	Snehal	Patil	\N	f	706
129	f93705c9774686499d4f9efbcaa81e07@gmail.com	*****	*****	*****	2016-03-02 16:31:50.497-05	2016-03-02 16:32:53.053-05	\N	\N	*****	*****	\N	MakerSquare		\N	f	848
126	89144a979199c98e09581ea3cdcd89f5@gmail.com	*****	*****	*****	2016-03-01 23:41:59.905-05	2016-12-01 15:04:48.511-05	\N	\N	*****	*****	\N	Alaina	Percival	\N	f	704
1957	d9ca31bcfecac96ff71cf6036d192503@gmail.com	*****	*****	*****	2016-11-30 11:11:38.749-05	2016-11-30 11:12:01.534-05	\N	\N	*****	*****	\N	Maddy	Lau	\N	f	710
1373	4b43d6eaedbb506b76bf9f73351958f4@gmail.com	*****	*****	*****	2016-09-29 14:41:11.058-04	2016-09-29 14:41:11.058-04	\N	\N	*****	*****	\N	Sonia	Prabhu	\N	f	791
884	ee80bff7c018dc2ecb0468b05451d03c@gmail.com	*****	*****	*****	2016-08-01 11:55:23.132-04	2016-08-01 11:56:25.628-04	\N	\N	*****	*****	\N	New	York Code + Design Academy (Austin)	\N	f	850
1304	e1b16aaaf8961ee0acdbd9d306561b03@gmail.com	*****	*****	*****	2016-09-29 13:44:40.419-04	2016-12-29 13:39:36.018-05	\N	\N	*****	*****	\N	Afia	Owusu-Forfie	\N	f	705
1808	ca0ddd5acb195ee0e3884842e8656755@gmail.com	*****	*****	*****	2016-11-17 12:43:26.15-05	2016-11-17 12:44:20.864-05	\N	\N	*****	*****	\N	Rigado		\N	f	708
2416	c909e10b24422a34ea20a79b9a906cf5@gmail.com	*****	*****	*****	2017-01-03 15:59:33.995-05	2017-01-03 15:59:33.995-05	\N	\N	*****	*****	\N	Kelly	Erickson	\N	f	709
3442	b6e18803305e056856ccb858af7e6d86@gmail.com	*****	*****	*****	2017-03-09 13:29:51.939-05	2017-03-09 13:30:24.238-05	\N	\N	*****	*****	\N	Polson	& Polson, P.C.	\N	f	754
1908	8a3f905ee55db87a19779a214587e529@gmail.com	*****	*****	*****	2016-11-29 05:03:21.301-05	2016-11-29 05:04:01.298-05	\N	\N	*****	*****	\N	Wooga		\N	f	707
4711	32714f8fbf59186a1fe4eb47e2d1d40e@gmail.com	*****	*****	*****	2017-05-09 01:59:11.628-04	2017-05-09 01:59:13.896-04	\N	\N	*****	*****	\N	Kristine	Paas	\N	f	711
1446	17ab59318e1a638274d84ee4f4617cd4@gmail.com	*****	*****	*****	2016-10-07 12:49:14.297-04	2016-10-07 12:49:50.24-04	\N	\N	*****	*****	\N	Wei-Juin	Lin	\N	f	712
1438	ca459f986fe2770c3231788ec004352a@gmail.com	*****	*****	*****	2016-10-06 14:36:34.986-04	2016-10-06 14:37:42.185-04	\N	\N	*****	*****	\N	Hector	Torres	\N	f	713
1357	923bd4c7e11e7c7afc4c51e31374a7f5@gmail.com	*****	*****	*****	2016-09-29 14:32:00.979-04	2016-09-29 14:32:00.979-04	\N	\N	*****	*****	\N	Britten	Kuckelman	\N	f	714
1354	a77dcae86c4a98f96f10de27166b1212@gmail.com	*****	*****	*****	2016-09-29 14:30:08.971-04	2016-09-29 14:30:08.971-04	\N	\N	*****	*****	\N	Ksenia	Barshchyk	\N	f	715
1352	6b0788c1db2895a00b16e51bbda21ee5@gmail.com	*****	*****	*****	2016-09-29 14:28:08.475-04	2016-12-20 14:09:35.349-05	\N	\N	*****	*****	\N	Sarrah	Vesselov	\N	f	716
1244	e953c9a4e2c5bb69552f3c92acb936ed@gmail.com	*****	*****	*****	2016-09-20 16:58:49.633-04	2016-09-28 06:15:18.662-04	\N	\N	*****	*****	\N	Grain		\N	f	717
308	6bdf7bcd29fbb8a428b7a2ccf20c38d2@gmail.com	*****	*****	*****	2016-04-29 14:46:16.143-04	2016-05-03 09:10:49.728-04	\N	\N	*****	*****	\N	Cisco		\N	f	851
1263	6dc155c0ad37d1bea19426f9c9f5c882@gmail.com	*****	*****	*****	2016-09-22 21:07:06.058-04	2016-09-28 06:15:17.268-04	\N	\N	*****	*****	\N	Isaac	Potoczny-Jones	\N	f	792
\.


                                                3752.dat                                                                                            0000600 0004000 0002000 00000000005 13174666341 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000154603 13174666341 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_CollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_UserId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_GroupId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "PaymentMethods_CollectiveId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_TierId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_FromCollectiveId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_TierId_fkey";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_MemberCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_UserId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_GroupId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_HostCollectiveId_fkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Collectives_CreatedByUserId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
DROP INDEX public."type-tags";
DROP INDEX public.transactions_uuid;
DROP INDEX public.subscriptions_type__group_id__user_id;
DROP INDEX public."UniqueSlugIndex";
DROP INDEX public."Transactions_GroupId";
DROP INDEX public."ParentCollectiveId";
DROP INDEX public."MemberCollectiveId-CollectiveId-role";
DROP INDEX public."DonationId";
DROP INDEX public."CollectiveId-type";
DROP INDEX public."CollectiveId-role";
DROP INDEX public."CollectiveId-deletedAt";
DROP INDEX public."CollectiveId-FromCollectiveId-type";
DROP INDEX public."CollectiveId";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
ALTER TABLE ONLY public."Members" DROP CONSTRAINT "UserGroups_pkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE ONLY public."Collectives" DROP CONSTRAINT "Groups_pkey";
ALTER TABLE ONLY public."CollectiveHistories" DROP CONSTRAINT "GroupHistories_pkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Donations_pkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Collectives" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."CollectiveHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."Users_id_seq";
DROP TABLE public."Users";
DROP SEQUENCE public."UserGroups_id_seq";
DROP SEQUENCE public."Transactions_id_seq";
DROP TABLE public."Transactions";
DROP SEQUENCE public."Tiers_id_seq";
DROP TABLE public."Tiers";
DROP SEQUENCE public."Subscriptions_id_seq1";
DROP SEQUENCE public."Subscriptions_id_seq";
DROP TABLE public."Subscriptions";
DROP TABLE public."Sessions";
DROP TABLE public."SequelizeMeta";
DROP TABLE public."Notifications";
DROP TABLE public."Members";
DROP SEQUENCE public."Groups_id_seq";
DROP SEQUENCE public."GroupHistories_hid_seq";
DROP SEQUENCE public."Expenses_id_seq";
DROP TABLE public."Expenses";
DROP SEQUENCE public."ExpenseHistories_hid_seq";
DROP TABLE public."ExpenseHistories";
DROP SEQUENCE public."Donations_id_seq";
DROP TABLE public."Orders";
DROP SEQUENCE public."ConnectedAccounts_id_seq";
DROP TABLE public."ConnectedAccounts";
DROP TABLE public."Collectives";
DROP TABLE public."CollectiveHistories";
DROP SEQUENCE public."Cards_id_seq";
DROP TABLE public."PaymentMethods";
DROP SEQUENCE public."Activities_id_seq";
DROP TABLE public."Activities";
DROP TYPE public."enum_UserGroups_role";
DROP TYPE public."enum_Groups_membership_type";
DROP EXTENSION postgis;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

--
-- Name: enum_Groups_membership_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);


--
-- Name: enum_UserGroups_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "CollectiveId" integer,
    "UserId" integer,
    "TransactionId" integer
);


--
-- Name: Activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;


--
-- Name: PaymentMethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    name character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "expiryDate" timestamp with time zone,
    uuid uuid,
    "CollectiveId" integer,
    "archivedAt" timestamp with time zone,
    "monthlyLimitPerMember" integer,
    "primary" boolean DEFAULT false,
    currency character varying(3)
);


--
-- Name: Cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;


--
-- Name: CollectiveHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "CollectiveHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(255),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "LastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);


--
-- Name: Collectives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Collectives" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    mission character varying(128),
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "LastEditedByUserId" integer,
    "CreatedByUserId" integer,
    "HostCollectiveId" integer,
    "ParentCollectiveId" integer,
    type character varying(255) DEFAULT 'COLLECTIVE'::character varying,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "locationName" character varying(255),
    address character varying(255),
    timezone character varying(255),
    "maxAmount" integer,
    "maxQuantity" integer,
    "geoLocationLatLong" geometry(Point)
);


--
-- Name: ConnectedAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    service character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    token character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    "refreshToken" character varying(255)
);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Orders" (
    id integer NOT NULL,
    "CreatedByUserId" integer,
    "CollectiveId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "totalAmount" integer,
    description character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "processedAt" timestamp with time zone,
    "privateMessage" text,
    "TierId" integer,
    "FromCollectiveId" integer,
    "publicMessage" character varying(255),
    quantity integer
);


--
-- Name: Donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Donations_id_seq" OWNED BY "Orders".id;


--
-- Name: ExpenseHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "CollectiveId" integer,
    currency character varying(255),
    amount integer,
    description character varying(255),
    "payoutMethod" character varying(255),
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;


--
-- Name: Expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    "privateMessage" text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);


--
-- Name: Expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "CollectiveHistories".hid;


--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Groups_id_seq" OWNED BY "Collectives".id;


--
-- Name: Members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Members" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "CreatedByUserId" integer NOT NULL,
    "CollectiveId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL,
    description character varying(255),
    "MemberCollectiveId" integer,
    "TierId" integer
);


--
-- Name: Notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "CollectiveId" integer,
    "webhookUrl" character varying(255)
);


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(8) DEFAULT NULL::character varying,
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;


--
-- Name: Tiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Tiers" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(510),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255),
    "maxQuantityPerUser" integer,
    goal integer,
    type character varying(255) DEFAULT 'TICKET'::character varying,
    "CollectiveId" integer,
    "interval" character varying(8) DEFAULT NULL::character varying,
    button character varying(255),
    presets json
);


--
-- Name: Tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;


--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "CollectiveId" integer,
    "CreatedByUserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "OrderId" integer,
    "platformFeeInHostCurrency" integer,
    "hostFeeInHostCurrency" integer,
    "paymentProcessorFeeInHostCurrency" integer,
    "hostCurrency" character varying(255),
    "hostCurrencyFxRate" double precision,
    "amountInHostCurrency" integer,
    "netAmountInCollectiveCurrency" integer,
    "ExpenseId" integer,
    uuid uuid,
    "FromCollectiveId" integer,
    "HostCollectiveId" integer,
    "TransactionGroup" uuid
);


--
-- Name: Transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "Members".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "paypalEmail" character varying(255),
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    "isHost" boolean DEFAULT false,
    "CollectiveId" integer
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);


--
-- Name: CollectiveHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);


--
-- Name: Collectives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);


--
-- Name: ConnectedAccounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);


--
-- Name: ExpenseHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);


--
-- Name: Expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);


--
-- Name: Members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);


--
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);


--
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);


--
-- Name: PaymentMethods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);


--
-- Name: Subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);


--
-- Name: Tiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);


--
-- Name: Transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM stdin;
\.
COPY "Activities" (id, type, data, "createdAt", "CollectiveId", "UserId", "TransactionId") FROM '$$PATH$$/4001.dat';

--
-- Data for Name: CollectiveHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
\.
COPY "CollectiveHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", hid, "archivedAt", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM '$$PATH$$/4013.dat';

--
-- Data for Name: Collectives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM stdin;
\.
COPY "Collectives" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", image, slug, website, "twitterHandle", mission, "backgroundImage", "hostFeePercent", settings, data, tags, "isSupercollective", "LastEditedByUserId", "CreatedByUserId", "HostCollectiveId", "ParentCollectiveId", type, "startsAt", "endsAt", "locationName", address, timezone, "maxAmount", "maxQuantity", "geoLocationLatLong") FROM '$$PATH$$/4015.dat';

--
-- Data for Name: ConnectedAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM stdin;
\.
COPY "ConnectedAccounts" (id, service, username, "clientId", token, data, "createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", "refreshToken") FROM '$$PATH$$/4005.dat';

--
-- Data for Name: ExpenseHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
\.
COPY "ExpenseHistories" (id, "UserId", "CollectiveId", currency, amount, description, "payoutMethod", "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM '$$PATH$$/4009.dat';

--
-- Data for Name: Expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
\.
COPY "Expenses" (id, "UserId", "CollectiveId", currency, amount, description, "privateMessage", attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM '$$PATH$$/4011.dat';

--
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM stdin;
\.
COPY "Members" ("createdAt", "updatedAt", "deletedAt", "CreatedByUserId", "CollectiveId", role, id, description, "MemberCollectiveId", "TierId") FROM '$$PATH$$/4027.dat';

--
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM stdin;
\.
COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "CollectiveId", "webhookUrl") FROM '$$PATH$$/4017.dat';

--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM stdin;
\.
COPY "Orders" (id, "CreatedByUserId", "CollectiveId", currency, "totalAmount", description, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "processedAt", "privateMessage", "TierId", "FromCollectiveId", "publicMessage", quantity) FROM '$$PATH$$/4007.dat';

--
-- Data for Name: PaymentMethods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM stdin;
\.
COPY "PaymentMethods" (id, name, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "CreatedByUserId", "expiryDate", uuid, "CollectiveId", "archivedAt", "monthlyLimitPerMember", "primary", currency) FROM '$$PATH$$/4003.dat';

--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "SequelizeMeta" (name) FROM stdin;
\.
COPY "SequelizeMeta" (name) FROM '$$PATH$$/4018.dat';

--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.
COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM '$$PATH$$/4019.dat';

--
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.
COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM '$$PATH$$/4020.dat';

--
-- Data for Name: Tiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM stdin;
\.
COPY "Tiers" (id, name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug, "maxQuantityPerUser", goal, type, "CollectiveId", "interval", button, presets) FROM '$$PATH$$/4023.dat';

--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId", "TransactionGroup") FROM stdin;
\.
COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "CollectiveId", "CreatedByUserId", "PaymentMethodId", "deletedAt", data, "OrderId", "platformFeeInHostCurrency", "hostFeeInHostCurrency", "paymentProcessorFeeInHostCurrency", "hostCurrency", "hostCurrencyFxRate", "amountInHostCurrency", "netAmountInCollectiveCurrency", "ExpenseId", uuid, "FromCollectiveId", "HostCollectiveId", "TransactionGroup") FROM '$$PATH$$/4025.dat';

--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM stdin;
\.
COPY "Users" (id, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "paypalEmail", "resetPasswordTokenHash", "resetPasswordSentAt", "firstName", "lastName", "billingAddress", "isHost", "CollectiveId") FROM '$$PATH$$/4029.dat';

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/3752.dat';

--
-- Name: Activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);


--
-- Name: Cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 1026, true);


--
-- Name: Donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);


--
-- Name: Expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);


--
-- Name: Groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Groups_id_seq"', 857, true);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);


--
-- Name: Tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Tiers_id_seq"', 128, true);


--
-- Name: Transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Transactions_id_seq"', 11354, true);


--
-- Name: UserGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"UserGroups_id_seq"', 4728, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);


--
-- Name: Activities Activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethods Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);


--
-- Name: ConnectedAccounts ConnectedAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);


--
-- Name: Orders Donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);


--
-- Name: ExpenseHistories ExpenseHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Expenses Expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);


--
-- Name: CollectiveHistories GroupHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Collectives Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Notifications Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);


--
-- Name: Subscriptions Subscriptions_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);


--
-- Name: Tiers Tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: Members UserGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users email_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);


--
-- Name: CollectiveId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId" ON "Users" USING btree ("CollectiveId");


--
-- Name: CollectiveId-FromCollectiveId-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-FromCollectiveId-type" ON "Transactions" USING btree ("CollectiveId", "FromCollectiveId", "deletedAt");


--
-- Name: CollectiveId-deletedAt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-deletedAt" ON "Tiers" USING btree ("CollectiveId", "deletedAt");


--
-- Name: CollectiveId-role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-role" ON "Members" USING btree ("CollectiveId", role);


--
-- Name: CollectiveId-type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CollectiveId-type" ON "Transactions" USING btree ("CollectiveId", type);


--
-- Name: DonationId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "DonationId" ON "Transactions" USING btree ("OrderId");


--
-- Name: MemberCollectiveId-CollectiveId-role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "MemberCollectiveId-CollectiveId-role" ON "Members" USING btree ("MemberCollectiveId", "CollectiveId", role);


--
-- Name: ParentCollectiveId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ParentCollectiveId" ON "Collectives" USING btree ("ParentCollectiveId");


--
-- Name: Transactions_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("CollectiveId", "deletedAt");


--
-- Name: UniqueSlugIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Collectives" USING btree (slug);


--
-- Name: subscriptions_type__group_id__user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "CollectiveId", "UserId");


--
-- Name: transactions_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);


--
-- Name: type-tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "type-tags" ON "Collectives" USING btree (type, tags);


--
-- Name: Activities Activities_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods Cards_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CollectiveHistories CollectiveHistories_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CollectiveHistories"
    ADD CONSTRAINT "CollectiveHistories_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_CreatedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_CreatedByUserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Collectives_ParentCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Collectives_ParentCollectiveId_fkey" FOREIGN KEY ("ParentCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ConnectedAccounts ConnectedAccounts_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ConnectedAccounts ConnectedAccounts_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_PaymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_SubscriptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Donations_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_lastEditedById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Collectives Groups_lastEditedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Collectives"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("LastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_MemberCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_MemberCollectiveId_fkey" FOREIGN KEY ("MemberCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members Members_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "Members_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Orders Orders_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Orders"
    ADD CONSTRAINT "Orders_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethods PaymentMethods_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "PaymentMethods_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tiers Tiers_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_CardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_DonationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("OrderId") REFERENCES "Orders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_ExpenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_FromCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_FromCollectiveId_fkey" FOREIGN KEY ("FromCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_HostCollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostCollectiveId_fkey" FOREIGN KEY ("HostCollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Members UserGroups_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id);


--
-- Name: Members UserGroups_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Members"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("CreatedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_CollectiveId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_CollectiveId_fkey" FOREIGN KEY ("CollectiveId") REFERENCES "Collectives"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geography_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geography_columns TO opencollective;


--
-- Name: geometry_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geometry_columns TO opencollective;


--
-- Name: raster_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_columns TO opencollective;


--
-- Name: raster_overviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_overviews TO opencollective;


--
-- Name: spatial_ref_sys; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE spatial_ref_sys FROM aseem;
REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
GRANT ALL ON TABLE spatial_ref_sys TO opencollective;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             