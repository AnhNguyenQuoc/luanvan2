PGDMP     )    #            
    v            LuanVanBackUp_development    9.5.15    9.5.15 �    J	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            K	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            L	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            M	           1262    16385    LuanVanBackUp_development    DATABASE     �   CREATE DATABASE "LuanVanBackUp_development" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 +   DROP DATABASE "LuanVanBackUp_development";
             anh    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            N	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            O	           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12397    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            P	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16461    active_storage_attachments    TABLE       CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 .   DROP TABLE public.active_storage_attachments;
       public         anh    false    6            �            1259    16459 !   active_storage_attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.active_storage_attachments_id_seq;
       public       anh    false    6    192            Q	           0    0 !   active_storage_attachments_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;
            public       anh    false    191            �            1259    16449    active_storage_blobs    TABLE     F  CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.active_storage_blobs;
       public         anh    false    6            �            1259    16447    active_storage_blobs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.active_storage_blobs_id_seq;
       public       anh    false    190    6            R	           0    0    active_storage_blobs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;
            public       anh    false    189            �            1259    16395    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         anh    false    6            �            1259    16503    carts    TABLE     �   CREATE TABLE public.carts (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.carts;
       public         anh    false    6            �            1259    16501    carts_id_seq    SEQUENCE     u   CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.carts_id_seq;
       public       anh    false    6    196            S	           0    0    carts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;
            public       anh    false    195            �            1259    16608    comments    TABLE     0  CREATE TABLE public.comments (
    id bigint NOT NULL,
    description character varying DEFAULT ''::character varying,
    rating integer DEFAULT 0,
    user_id bigint,
    restaurant_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.comments;
       public         anh    false    6            �            1259    16606    comments_id_seq    SEQUENCE     x   CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public       anh    false    208    6            T	           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
            public       anh    false    207            �            1259    16666    coupons    TABLE     �   CREATE TABLE public.coupons (
    id bigint NOT NULL,
    code character varying,
    amount integer DEFAULT 0,
    expiration date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.coupons;
       public         anh    false    6            �            1259    16664    coupons_id_seq    SEQUENCE     w   CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.coupons_id_seq;
       public       anh    false    6    212            U	           0    0    coupons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;
            public       anh    false    211            �            1259    16405 	   districts    TABLE     �   CREATE TABLE public.districts (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.districts;
       public         anh    false    6            �            1259    16403    districts_id_seq    SEQUENCE     y   CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.districts_id_seq;
       public       anh    false    184    6            V	           0    0    districts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;
            public       anh    false    183            �            1259    16511 
   line_items    TABLE       CREATE TABLE public.line_items (
    id bigint NOT NULL,
    product_id bigint,
    cart_id bigint,
    quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_id bigint
);
    DROP TABLE public.line_items;
       public         anh    false    6            �            1259    16509    line_items_id_seq    SEQUENCE     z   CREATE SEQUENCE public.line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.line_items_id_seq;
       public       anh    false    6    198            W	           0    0    line_items_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.line_items_id_seq OWNED BY public.line_items.id;
            public       anh    false    197            �            1259    16583    order_types    TABLE     �   CREATE TABLE public.order_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.order_types;
       public         anh    false    6            �            1259    16581    order_types_id_seq    SEQUENCE     {   CREATE SEQUENCE public.order_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_types_id_seq;
       public       anh    false    206    6            X	           0    0    order_types_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_types_id_seq OWNED BY public.order_types.id;
            public       anh    false    205            �            1259    16532    orders    TABLE     o  CREATE TABLE public.orders (
    id bigint NOT NULL,
    total integer,
    note character varying,
    feeship integer,
    buyer_id integer,
    shipper_id integer,
    payments integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_type_id bigint DEFAULT 1,
    card_token character varying
);
    DROP TABLE public.orders;
       public         anh    false    6            �            1259    16530    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       anh    false    200    6            Y	           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       anh    false    199            �            1259    16549    product_types    TABLE     �   CREATE TABLE public.product_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 !   DROP TABLE public.product_types;
       public         anh    false    6            �            1259    16547    product_types_id_seq    SEQUENCE     }   CREATE SEQUENCE public.product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.product_types_id_seq;
       public       anh    false    202    6            Z	           0    0    product_types_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.product_types_id_seq OWNED BY public.product_types.id;
            public       anh    false    201            �            1259    16486    products    TABLE     :  CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying,
    price numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    restaurant_id bigint,
    product_type_id bigint
);
    DROP TABLE public.products;
       public         anh    false    6            �            1259    16484    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       anh    false    194    6            [	           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       anh    false    193            �            1259    16690    restaurant_favorites    TABLE     �   CREATE TABLE public.restaurant_favorites (
    id bigint NOT NULL,
    restaurant_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.restaurant_favorites;
       public         anh    false    6            �            1259    16688    restaurant_favorites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.restaurant_favorites_id_seq;
       public       anh    false    214    6            \	           0    0    restaurant_favorites_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.restaurant_favorites_id_seq OWNED BY public.restaurant_favorites.id;
            public       anh    false    213            �            1259    16560    restaurant_types    TABLE     �   CREATE TABLE public.restaurant_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 $   DROP TABLE public.restaurant_types;
       public         anh    false    6            �            1259    16558    restaurant_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.restaurant_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.restaurant_types_id_seq;
       public       anh    false    204    6            ]	           0    0    restaurant_types_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.restaurant_types_id_seq OWNED BY public.restaurant_types.id;
            public       anh    false    203            �            1259    16438    restaurants    TABLE     �  CREATE TABLE public.restaurants (
    id bigint NOT NULL,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    address character varying NOT NULL,
    description character varying NOT NULL,
    timeopen time without time zone NOT NULL,
    timeclose time without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    district_id bigint,
    restaurant_type_id bigint
);
    DROP TABLE public.restaurants;
       public         anh    false    6            �            1259    16436    restaurants_id_seq    SEQUENCE     {   CREATE SEQUENCE public.restaurants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.restaurants_id_seq;
       public       anh    false    188    6            ^	           0    0    restaurants_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;
            public       anh    false    187            �            1259    16633    roles    TABLE     �   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.roles;
       public         anh    false    6            �            1259    16631    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       anh    false    210    6            _	           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       anh    false    209            �            1259    16387    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         anh    false    6            �            1259    16416    users    TABLE        CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    password_digest character varying,
    username character varying DEFAULT ''::character varying,
    address character varying DEFAULT ''::character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_id bigint,
    district_id bigint,
    uid character varying,
    provider character varying,
    remember_digest character varying,
    activation_digest character varying,
    activated boolean DEFAULT false,
    activated_at timestamp without time zone,
    reset_digest character varying,
    reset_sent_at timestamp without time zone
);
    DROP TABLE public.users;
       public         anh    false    6            �            1259    16414    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       anh    false    186    6            `	           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       anh    false    185            ^           2604    16464    id    DEFAULT     �   ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);
 L   ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
       public       anh    false    192    191    192            ]           2604    16452    id    DEFAULT     �   ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);
 F   ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
       public       anh    false    189    190    190            `           2604    16506    id    DEFAULT     d   ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);
 7   ALTER TABLE public.carts ALTER COLUMN id DROP DEFAULT;
       public       anh    false    195    196    196            h           2604    16611    id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       anh    false    207    208    208            l           2604    16669    id    DEFAULT     h   ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);
 9   ALTER TABLE public.coupons ALTER COLUMN id DROP DEFAULT;
       public       anh    false    212    211    212            V           2604    16408    id    DEFAULT     l   ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);
 ;   ALTER TABLE public.districts ALTER COLUMN id DROP DEFAULT;
       public       anh    false    184    183    184            a           2604    16514    id    DEFAULT     n   ALTER TABLE ONLY public.line_items ALTER COLUMN id SET DEFAULT nextval('public.line_items_id_seq'::regclass);
 <   ALTER TABLE public.line_items ALTER COLUMN id DROP DEFAULT;
       public       anh    false    198    197    198            g           2604    16586    id    DEFAULT     p   ALTER TABLE ONLY public.order_types ALTER COLUMN id SET DEFAULT nextval('public.order_types_id_seq'::regclass);
 =   ALTER TABLE public.order_types ALTER COLUMN id DROP DEFAULT;
       public       anh    false    206    205    206            c           2604    16535    id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       anh    false    199    200    200            e           2604    16552    id    DEFAULT     t   ALTER TABLE ONLY public.product_types ALTER COLUMN id SET DEFAULT nextval('public.product_types_id_seq'::regclass);
 ?   ALTER TABLE public.product_types ALTER COLUMN id DROP DEFAULT;
       public       anh    false    201    202    202            _           2604    16489    id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       anh    false    193    194    194            n           2604    16693    id    DEFAULT     �   ALTER TABLE ONLY public.restaurant_favorites ALTER COLUMN id SET DEFAULT nextval('public.restaurant_favorites_id_seq'::regclass);
 F   ALTER TABLE public.restaurant_favorites ALTER COLUMN id DROP DEFAULT;
       public       anh    false    214    213    214            f           2604    16563    id    DEFAULT     z   ALTER TABLE ONLY public.restaurant_types ALTER COLUMN id SET DEFAULT nextval('public.restaurant_types_id_seq'::regclass);
 B   ALTER TABLE public.restaurant_types ALTER COLUMN id DROP DEFAULT;
       public       anh    false    204    203    204            \           2604    16441    id    DEFAULT     p   ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);
 =   ALTER TABLE public.restaurants ALTER COLUMN id DROP DEFAULT;
       public       anh    false    187    188    188            k           2604    16636    id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       anh    false    209    210    210            W           2604    16419    id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       anh    false    185    186    186            1	          0    16461    active_storage_attachments 
   TABLE DATA               k   COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
    public       anh    false    192   H�       a	           0    0 !   active_storage_attachments_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 43, true);
            public       anh    false    191            /	          0    16449    active_storage_blobs 
   TABLE DATA               z   COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
    public       anh    false    190   ��       b	           0    0    active_storage_blobs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 58, true);
            public       anh    false    189            '	          0    16395    ar_internal_metadata 
   TABLE DATA               R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       anh    false    182   ��       5	          0    16503    carts 
   TABLE DATA               ;   COPY public.carts (id, created_at, updated_at) FROM stdin;
    public       anh    false    196   5�       c	           0    0    carts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.carts_id_seq', 29, true);
            public       anh    false    195            A	          0    16608    comments 
   TABLE DATA               k   COPY public.comments (id, description, rating, user_id, restaurant_id, created_at, updated_at) FROM stdin;
    public       anh    false    208   ��       d	           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 14, true);
            public       anh    false    207            E	          0    16666    coupons 
   TABLE DATA               W   COPY public.coupons (id, code, amount, expiration, created_at, updated_at) FROM stdin;
    public       anh    false    212   S�       e	           0    0    coupons_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.coupons_id_seq', 4, true);
            public       anh    false    211            )	          0    16405 	   districts 
   TABLE DATA               E   COPY public.districts (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    184   ��       f	           0    0    districts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.districts_id_seq', 10, true);
            public       anh    false    183            7	          0    16511 
   line_items 
   TABLE DATA               i   COPY public.line_items (id, product_id, cart_id, quantity, created_at, updated_at, order_id) FROM stdin;
    public       anh    false    198   =�       g	           0    0    line_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.line_items_id_seq', 21, true);
            public       anh    false    197            ?	          0    16583    order_types 
   TABLE DATA               G   COPY public.order_types (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    206   ��       h	           0    0    order_types_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_types_id_seq', 4, true);
            public       anh    false    205            9	          0    16532    orders 
   TABLE DATA               �   COPY public.orders (id, total, note, feeship, buyer_id, shipper_id, payments, created_at, updated_at, order_type_id, card_token) FROM stdin;
    public       anh    false    200   T�       i	           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 6, true);
            public       anh    false    199            ;	          0    16549    product_types 
   TABLE DATA               I   COPY public.product_types (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    202   ��       j	           0    0    product_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_types_id_seq', 8, true);
            public       anh    false    201            3	          0    16486    products 
   TABLE DATA               x   COPY public.products (id, name, description, price, created_at, updated_at, restaurant_id, product_type_id) FROM stdin;
    public       anh    false    194   ��       k	           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 11, true);
            public       anh    false    193            G	          0    16690    restaurant_favorites 
   TABLE DATA               b   COPY public.restaurant_favorites (id, restaurant_id, user_id, created_at, updated_at) FROM stdin;
    public       anh    false    214   n�       l	           0    0    restaurant_favorites_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.restaurant_favorites_id_seq', 2, true);
            public       anh    false    213            =	          0    16560    restaurant_types 
   TABLE DATA               L   COPY public.restaurant_types (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    204   ��       m	           0    0    restaurant_types_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.restaurant_types_id_seq', 5, true);
            public       anh    false    203            -	          0    16438    restaurants 
   TABLE DATA               �   COPY public.restaurants (id, name, phone, address, description, timeopen, timeclose, created_at, updated_at, user_id, district_id, restaurant_type_id) FROM stdin;
    public       anh    false    188   R�       n	           0    0    restaurants_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.restaurants_id_seq', 3, true);
            public       anh    false    187            C	          0    16633    roles 
   TABLE DATA               A   COPY public.roles (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    210   ^�       o	           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 4, true);
            public       anh    false    209            &	          0    16387    schema_migrations 
   TABLE DATA               4   COPY public.schema_migrations (version) FROM stdin;
    public       anh    false    181   ��       +	          0    16416    users 
   TABLE DATA               �   COPY public.users (id, email, password_digest, username, address, phone, created_at, updated_at, role_id, district_id, uid, provider, remember_digest, activation_digest, activated, activated_at, reset_digest, reset_sent_at) FROM stdin;
    public       anh    false    186   ��       p	           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 25, true);
            public       anh    false    185            �           2606    16469    active_storage_attachments_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
       public         anh    false    192    192                       2606    16457    active_storage_blobs_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
       public         anh    false    190    190            r           2606    16402    ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public         anh    false    182    182            �           2606    16508 
   carts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public         anh    false    196    196            �           2606    16618    comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         anh    false    208    208            �           2606    16675    coupons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_pkey;
       public         anh    false    212    212            t           2606    16413    districts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.districts DROP CONSTRAINT districts_pkey;
       public         anh    false    184    184            �           2606    16517    line_items_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.line_items DROP CONSTRAINT line_items_pkey;
       public         anh    false    198    198            �           2606    16591    order_types_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_types
    ADD CONSTRAINT order_types_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_types DROP CONSTRAINT order_types_pkey;
       public         anh    false    206    206            �           2606    16540    orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         anh    false    200    200            �           2606    16557    product_types_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.product_types DROP CONSTRAINT product_types_pkey;
       public         anh    false    202    202            �           2606    16494    products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         anh    false    194    194            �           2606    16695    restaurant_favorites_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.restaurant_favorites
    ADD CONSTRAINT restaurant_favorites_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.restaurant_favorites DROP CONSTRAINT restaurant_favorites_pkey;
       public         anh    false    214    214            �           2606    16568    restaurant_types_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.restaurant_types
    ADD CONSTRAINT restaurant_types_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.restaurant_types DROP CONSTRAINT restaurant_types_pkey;
       public         anh    false    204    204            }           2606    16446    restaurants_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_pkey;
       public         anh    false    188    188            �           2606    16641 
   roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         anh    false    210    210            p           2606    16394    schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         anh    false    181    181            x           2606    16427 
   users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         anh    false    186    186            �           1259    16470 +   index_active_storage_attachments_on_blob_id    INDEX     u   CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);
 ?   DROP INDEX public.index_active_storage_attachments_on_blob_id;
       public         anh    false    192            �           1259    16471 +   index_active_storage_attachments_uniqueness    INDEX     �   CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);
 ?   DROP INDEX public.index_active_storage_attachments_uniqueness;
       public         anh    false    192    192    192    192            �           1259    16458 !   index_active_storage_blobs_on_key    INDEX     h   CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);
 5   DROP INDEX public.index_active_storage_blobs_on_key;
       public         anh    false    190            �           1259    16630    index_comments_on_restaurant_id    INDEX     ]   CREATE INDEX index_comments_on_restaurant_id ON public.comments USING btree (restaurant_id);
 3   DROP INDEX public.index_comments_on_restaurant_id;
       public         anh    false    208            �           1259    16629    index_comments_on_user_id    INDEX     Q   CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);
 -   DROP INDEX public.index_comments_on_user_id;
       public         anh    false    208            �           1259    16529    index_line_items_on_cart_id    INDEX     U   CREATE INDEX index_line_items_on_cart_id ON public.line_items USING btree (cart_id);
 /   DROP INDEX public.index_line_items_on_cart_id;
       public         anh    false    198            �           1259    16541    index_line_items_on_order_id    INDEX     W   CREATE INDEX index_line_items_on_order_id ON public.line_items USING btree (order_id);
 0   DROP INDEX public.index_line_items_on_order_id;
       public         anh    false    198            �           1259    16528    index_line_items_on_product_id    INDEX     [   CREATE INDEX index_line_items_on_product_id ON public.line_items USING btree (product_id);
 2   DROP INDEX public.index_line_items_on_product_id;
       public         anh    false    198            �           1259    16600    index_orders_on_order_type_id    INDEX     Y   CREATE INDEX index_orders_on_order_type_id ON public.orders USING btree (order_type_id);
 1   DROP INDEX public.index_orders_on_order_type_id;
       public         anh    false    200            �           1259    16575 !   index_products_on_product_type_id    INDEX     a   CREATE INDEX index_products_on_product_type_id ON public.products USING btree (product_type_id);
 5   DROP INDEX public.index_products_on_product_type_id;
       public         anh    false    194            �           1259    16495    index_products_on_restaurant_id    INDEX     ]   CREATE INDEX index_products_on_restaurant_id ON public.products USING btree (restaurant_id);
 3   DROP INDEX public.index_products_on_restaurant_id;
       public         anh    false    194            �           1259    16706 +   index_restaurant_favorites_on_restaurant_id    INDEX     u   CREATE INDEX index_restaurant_favorites_on_restaurant_id ON public.restaurant_favorites USING btree (restaurant_id);
 ?   DROP INDEX public.index_restaurant_favorites_on_restaurant_id;
       public         anh    false    214            �           1259    16707 %   index_restaurant_favorites_on_user_id    INDEX     i   CREATE INDEX index_restaurant_favorites_on_user_id ON public.restaurant_favorites USING btree (user_id);
 9   DROP INDEX public.index_restaurant_favorites_on_user_id;
       public         anh    false    214            y           1259    16478     index_restaurants_on_district_id    INDEX     _   CREATE INDEX index_restaurants_on_district_id ON public.restaurants USING btree (district_id);
 4   DROP INDEX public.index_restaurants_on_district_id;
       public         anh    false    188            z           1259    16569 '   index_restaurants_on_restaurant_type_id    INDEX     m   CREATE INDEX index_restaurants_on_restaurant_type_id ON public.restaurants USING btree (restaurant_type_id);
 ;   DROP INDEX public.index_restaurants_on_restaurant_type_id;
       public         anh    false    188            {           1259    16472    index_restaurants_on_user_id    INDEX     W   CREATE INDEX index_restaurants_on_user_id ON public.restaurants USING btree (user_id);
 0   DROP INDEX public.index_restaurants_on_user_id;
       public         anh    false    188            u           1259    16649    index_users_on_district_id    INDEX     S   CREATE INDEX index_users_on_district_id ON public.users USING btree (district_id);
 .   DROP INDEX public.index_users_on_district_id;
       public         anh    false    186            v           1259    16642    index_users_on_role_id    INDEX     K   CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);
 *   DROP INDEX public.index_users_on_role_id;
       public         anh    false    186            �           2606    16496    fk_rails_009fa2d872    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_009fa2d872 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);
 F   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_rails_009fa2d872;
       public       anh    false    188    194    2173            �           2606    16619    fk_rails_03de2dc08c    FK CONSTRAINT     {   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_03de2dc08c;
       public       anh    false    186    2168    208            �           2606    16696    fk_rails_0e17f6ab93    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_favorites
    ADD CONSTRAINT fk_rails_0e17f6ab93 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);
 R   ALTER TABLE ONLY public.restaurant_favorites DROP CONSTRAINT fk_rails_0e17f6ab93;
       public       anh    false    214    188    2173            �           2606    16518    fk_rails_11e15d5c6b    FK CONSTRAINT     �   ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_11e15d5c6b FOREIGN KEY (product_id) REFERENCES public.products(id);
 H   ALTER TABLE ONLY public.line_items DROP CONSTRAINT fk_rails_11e15d5c6b;
       public       anh    false    198    194    2184            �           2606    16624    fk_rails_1b0c29f17e    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_1b0c29f17e FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_1b0c29f17e;
       public       anh    false    208    188    2173            �           2606    16542    fk_rails_2dc2e5c22c    FK CONSTRAINT        ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_2dc2e5c22c FOREIGN KEY (order_id) REFERENCES public.orders(id);
 H   ALTER TABLE ONLY public.line_items DROP CONSTRAINT fk_rails_2dc2e5c22c;
       public       anh    false    198    200    2194            �           2606    16570    fk_rails_464fdadd08    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_rails_464fdadd08 FOREIGN KEY (restaurant_type_id) REFERENCES public.restaurant_types(id);
 I   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_rails_464fdadd08;
       public       anh    false    188    2198    204            �           2606    16643    fk_rails_642f17018b    FK CONSTRAINT     x   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_rails_642f17018b;
       public       anh    false    186    2206    210            �           2606    16576    fk_rails_8464b8e5d7    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_8464b8e5d7 FOREIGN KEY (product_type_id) REFERENCES public.product_types(id);
 F   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_rails_8464b8e5d7;
       public       anh    false    2196    194    202            �           2606    16601    fk_rails_aea2044a0b    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_aea2044a0b FOREIGN KEY (order_type_id) REFERENCES public.order_types(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_rails_aea2044a0b;
       public       anh    false    200    2200    206            �           2606    16473    fk_rails_aef57e41ec    FK CONSTRAINT     ~   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_rails_aef57e41ec FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_rails_aef57e41ec;
       public       anh    false    2168    186    188            �           2606    16523    fk_rails_af645e8e5f    FK CONSTRAINT     }   ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_af645e8e5f FOREIGN KEY (cart_id) REFERENCES public.carts(id);
 H   ALTER TABLE ONLY public.line_items DROP CONSTRAINT fk_rails_af645e8e5f;
       public       anh    false    198    196    2186            �           2606    16701    fk_rails_c1a45eec9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_favorites
    ADD CONSTRAINT fk_rails_c1a45eec9f FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.restaurant_favorites DROP CONSTRAINT fk_rails_c1a45eec9f;
       public       anh    false    2168    214    186            �           2606    16650    fk_rails_c49b9ab796    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_c49b9ab796 FOREIGN KEY (district_id) REFERENCES public.districts(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_rails_c49b9ab796;
       public       anh    false    2164    186    184            �           2606    16479    fk_rails_fb56ca7446    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_rails_fb56ca7446 FOREIGN KEY (district_id) REFERENCES public.districts(id);
 I   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_rails_fb56ca7446;
       public       anh    false    2164    188    184            1	   S  x�u�1N1E��\�(ߎ{Z.��iV�B,�'#�ެf��=�;?3(���˱<?χ���۹`>���m�����Zm݄�׸�x�z�qN8�R�dI��H���Wfe��h)���@w	���\4}���F8Yڠ˸�qD�4�e\�u�qe�[�MF�љ"�D�w���\%��q������M���i/��n��:dr�Q�땟�L!<� W<�`r�3r�2o��j����g�{?��?W�_͐ݘ�<LB	�0liDk� ��1�6�Ȇ���f�l|k�F�hA�F_^lc���m�ͼ0lmpStbY�!�@�������      /	   +
  x�͙K����ǩU��iZ�TfEx �u�@�x�'��P��ၗ�x^@��މ��v�n9ܮv\n�"*��?���,
��.���Z;�\�֧�����4l���>��'�>�~ ��U���2:D���粸���I������s����9�������OO�������R!oA�R��?C�LE[@�1MA`��|��k� �Ҵ�f�o�#X��������� ��|��_�e��7K��0b�3�F&����/�Sg����SF�>Cܦ���4�l�	vuԩG���^��(�u�8��)��]�a�3uX���)K�N���x�ԟb�gHڐ���H��6��e�ufz0I5����]H��u���� c���j��4	�q Be��7�������:;T�Ig�}w��AAѬ\�/�A�O��#J��zC "?m�)�Da ���kn�]r���^R���.�=�"��D�8J�XQ��ރH��vS ��n��4��з�r�"���DcXр�5H��g���f��;c���h�"F���\~d��uv�w�j�10h��Q�/.�]��Q��������	�c��c�����g,EWm?s�E5��?���}�:��TԘ �������?�c�+|}�ހӞ�&U�X�� �Гx���Bxfe���?�A�y+��p�VfҰ���U�(p�c`O��:i�;Z��{#D�m�T�rE���0{��:���p��ܞg������h��,.wj��u�t��^yR矊��=y�JU�>�v��<�6�ޭi�`/��c�,(��"�C��b?�=�q����>�ץ֧��_�ãmM>��g
ۚ`IRH��:�yc��m�O�2Z�����F羽��Sf�s�e�p�>����;����'ō��7@�s�����}=���dv���NE&�����*b�0K��=�������mH�.�����������4�%,m�q
�	 3>Y��;��u9@���6%�����J_���{�����2n)�$ YB�J6'?uB�|J�=��-�4�@
bs\e�d��{ۮ��b>��/��;�lٱXN��k�6�l\_;]f�C1��I9f����3�q�hmFq��ooC�?L��;�'VF�=��}R���d�Z����Z(����r��e{�UgE|��N��F�SFY�u�~�:����M�
0쬒��r�WE��Z���>#�Li[U�l�ر�[��Ѹ����ۄ���������od2��6�r�b
R��y�qϬ;�����̆C7e����3Fm�SM@��#=��:5����IWն�; c�*m#�9��! �uw0.��+��1��`���CȠ֦B�r{�`��h5��q5���̑B'q/E��ݤr\f��b���c���_.�̛�:@�C P�y�� 2��rx�n����KXi��5�~����o��%���S1����[�Sz ��~|݈�D�1�D�@AtEۆ�iݍC�@��*ӝ���z�1�U0�/e�U�j�m듽8���f��*�[��|���Vx5��tstL�2a|�����k�Lh�B�&�$��	D�m�u�2cj��I�P����6E�*�2���>�U��x��u�.���������gLIlfq�d|Ko\�Ł� c�9�i�l�iʅ�sS�Is�a5��B�Y��C��i�hK��%��%ϡZ�xem�� P��5×X��`��WC�t	/�k�Y�ȴ{���DHV��d��YY�����ī�#\z����H.9�\n^2�1|=f�h\�����:l6�>�b���+��3��@�������w��A��q"�����s_M����)��@�IQ�xu>��vM���s~��/H)�[��5P�N�����)��h׌�>�O��O��{��YfI+�$�Te��B�e/�XN��9\S��|���4r���ں��z���rr�3��RH��\����#�n��U�=ֻj�e񸆔t\#X(�ء�5I�E�f��v>����e�j�B�A!*�nf��\�u#��u��}�?:w��BT!,ߴ*�喕ǹ�61�ėރ!lC���)��ǧ�TVz3�4�~��p��3��v���SB�B���(��eR���?`�.�V;�q�}��A�P�v���3��	�;�z��g���9)��R������J%6�����S�����HU>�B�z����G��E���]���~���s_M�*�B �����z��/����a/믫/��j[���rvX�!��<�:����ph`�H�@�!�:2`�����n2��<��3{H����#l#UCL��;�j ��`�>h�43���hK�,@�*�����w�f9�;�_]oa;_@�s"T(C��#�i�.�����b�Z�)������BJHA=�n�UXb`��u�on�۹���Ψaq/3��r�����ֶ�p,�s�u����s"�^�j�Xs�|�d��^=������F���`P�fm�X\\�QU\�����Q�$�c�c��-��s6��6�"��V����zI��q���ʉ��}{�S[Q�^M�\      '	   ?   x�K�+�,���M�+�LI-K��/ ��-tu�,�ͬL��,��L���Hq��qqq ���      5	   ~   x�}��1E�5�"���o�Z�`3#�����|�`�!k�ٱx�V���2ۋ'2M7D�S!�V���ˎuS��`�Hq)����5���׋|�mq���t�4��Y�Y�!z2� ��J�      A	   �   x�}̱1F�ڞ"\�?�a;c J�HL��,�M�M��8Q?}t�WO�zˣ��X����|&��ڪ5hvS���B�z�J�����@��7�b��<K�E����_�h2��C�������~�4u      E	   8   x�3�t����4�420��54�56�3��L�L���,-�p�p��qqq c�      )	   �   x�3�t:�&/C!$���啜F������
�V&&V��z���Ffx���8�/�T:Ҝ��]�����9).cN�L�3�3�n,Ū��������	��)
����aWdhf`n�G�˔
K�@$v�F��8������ �0O`      7	   }   x�u��1Eѵ]�4��g���`��#�.�����@�׹�0��9D����Jb-J���ç��K��V{�)I�����ܼ˪�1�? ��lW��?���1lbxi�׺*��pќ�	��0�      ?	   z   x�3�t�8�!Q����d�������qZ��X*XX�ZZ�����2� d�����)).cN����J2�dv���f�x��L8=�^^���pw?vu���&�x��b���� �%D�      9	   �   x�}α�0�Z�����e[QK��*5�4,�Mp��"w����N�r�@F㉘l�~Q�E]rj���^�}�:ձ��r���)����5�ݒ���\���!1���ܼ�+R5��ů�Ē����GNRф����c
!| �4�      ;	   �   x�}�1N1Ek�)|�X3�g�2U*$���&��Ҹ�	(�"%��=.7�M���������!u;�|ѷ���^K��+F�D��.Z1D}h �*(�4ܗ��l��0����B^��'Щ�n�귒�7�B�A��pU��xM��P��er�.:gD��ϩxuw	Kd6��}�@ U���L6���n�Ez�?ӠӶ����Ib,9dj x6 �Y���      3	   {  x����j�@���)�.;;�1�h�xj���A��F�)�c��
^�ғ}��IW�E4�������l�曏��^���?/��k�VE�~+G J�GH_�{�=�Sə����H��5l- �DW����C��j��:s��sJ�\:v�b�OC5�DDt
;"�9����3}O�;N�o �v�nOE�%���h�����E�Z���W��LFhF��#����n�:��ut�2r���Y�M�%�Xl��*�5�tVL��� ��~-�tG�4Ƃ�	C?Ty҇����0�̠��1��ȓ4@qWnw��Û��r�B�N�z�,z��Q�u�~/G�9�M�O^x�s{�Ċ���⟺�$	�k<D�۽��E�$�̜�E      G	   0   x�3�4��420��54�54S04�24�25�334254�#����� ~��      =	   �   x�3���8�@�����tN#C]CC]K+S+c3=KKs3S<R\F�aww&*d^�E��������).c�������R��3557�-�e5�H3А��J�J��ML��Hq�r�$f�*$�c�`aeb�ghjhfi�G�+F��� [�L�      -	   �   x�u��J�@���S��egf��36Z'����������,bc%\�ȽG�����;f���߷ê��<P�����J�]���v�씉�1���M�����VD��`,K�@ ��%�mLgPd�S�\��}�y13�Bfh^�髃���{���e�Xi��`�Γ8�c�I�\��tD� �.U�5gl��@�n��n�֏�������%�[~>Ą�	FYH�!O����S
t'�b�Ž.��Z�e�      C	   �   x�3��K?���
.�w�sZ��X*�[��Xꙙ�����2�t�O��P�K��|��� �ZKc3C<R\�פg&�+d^��I���x��Lf�>ܵ8O!��^�͍,�Hq��qqq S�L�      &	   �   x�M��!�?Ŭl'���_����F�l#pt5=Ne��xh�����Lda�ΰY�q�V*2���or쑨$�mǴ.UF�|�:üpO�\E��.���~
��˝+W�-����R�����Ϙ���ڤe����G����k��COZ�      +	   z  x���ˎ�F���`1�)��Ue{�������ƀ������(�2R� ��l�I�Qv�VV=���M��t�nQ��lՑ����"B�;7�8��+/r����;o|S�S�kղ�z�=�P�N)�� ��ܱSe��,�Ȣ�,LQ�l,���xx�&Ι���s�I����oi��?�a�-C$�E�-Tr��TV1PVd,_	Dx�zY�~o���)���:��m�o�KcM�qDl�2={�`˰��r�'IX*�x]g�NQ�RN����}!��8�	9#�ʀC	���4�frJck�6o�<:s�V�g���vm�u�O��(���8��Hco�
�(ώh�'������}��c @EV�̕ኊ9@Ɋr5t��	�����s�T�`��5q��jX��ѝ��4#҇�`V���i1,��a2�k"�l'$���3@�y�6�ryA?|�3�Q��������ME)��L&�V�
�
 J�"�2�:c�j��)+Y
��������|��m�mY�W�I�wmAɘ��S�O��H��j&`�0��BWx��}tJb�|��V��&�j�`��l�����%����,+Г��]�_�b��\;=<|?��@�̓�'�����?|�)��*�nDU�TJf�?B�2��L�y��N���}�Z77�u�e-�"���XK�n��\��Ҥ��~/H08!�g��Ȏy��>O���-T�@(�WFB$��*aA�d��eğ���O�:�wn}=4������c��h�T-/�{d|W�����tVo֓�L��t�����B9S%��B=�ޗm�{����Q�U�~�J��4���O�b�fC�j�Έ�N� W��*qV�M�nz���8k�?�5�DLJR<p'S u��J��ɬ�N�=\L�ch�����o��i�����������$1,�3�l��0;���S{6*[��~]���) �t?�����n0�Vaee���O&u��8������٧�i��r��"׊'���]^v��a�mW�&�4���8�
k��׃X�������2�$I%p�W�>b9��D����;��d�y�[ݚ�H����hn仍!��)c��6��"o%}y���R&zJ��e0k�l�s eՒ��;pss�y��P     