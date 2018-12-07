PGDMP         :                v            LuanVanBackUp_development    9.5.15    9.5.15 �    Y	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            Z	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            [	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            \	           1262    16385    LuanVanBackUp_development    DATABASE     �   CREATE DATABASE "LuanVanBackUp_development" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 +   DROP DATABASE "LuanVanBackUp_development";
             anh    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ]	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            ^	           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12397    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            _	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
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
       public       anh    false    6    192            `	           0    0 !   active_storage_attachments_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;
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
       public       anh    false    6    190            a	           0    0    active_storage_blobs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;
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
       public       anh    false    6    196            b	           0    0    carts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;
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
       public       anh    false    208    6            c	           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
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
       public       anh    false    212    6            d	           0    0    coupons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;
            public       anh    false    211            �            1259    16720    delayed_jobs    TABLE     �  CREATE TABLE public.delayed_jobs (
    id bigint NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.delayed_jobs;
       public         anh    false    6            �            1259    16718    delayed_jobs_id_seq    SEQUENCE     |   CREATE SEQUENCE public.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.delayed_jobs_id_seq;
       public       anh    false    216    6            e	           0    0    delayed_jobs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;
            public       anh    false    215            �            1259    16405 	   districts    TABLE     �   CREATE TABLE public.districts (
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
       public       anh    false    6    184            f	           0    0    districts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;
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
       public       anh    false    6    198            g	           0    0    line_items_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.line_items_id_seq OWNED BY public.line_items.id;
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
       public       anh    false    206    6            h	           0    0    order_types_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_types_id_seq OWNED BY public.order_types.id;
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
       public       anh    false    200    6            i	           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
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
       public       anh    false    202    6            j	           0    0    product_types_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.product_types_id_seq OWNED BY public.product_types.id;
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
       public       anh    false    194    6            k	           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
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
       public       anh    false    214    6            l	           0    0    restaurant_favorites_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.restaurant_favorites_id_seq OWNED BY public.restaurant_favorites.id;
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
       public       anh    false    204    6            m	           0    0    restaurant_types_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.restaurant_types_id_seq OWNED BY public.restaurant_types.id;
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
       public       anh    false    188    6            n	           0    0    restaurants_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;
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
       public       anh    false    210    6            o	           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
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
       public       anh    false    186    6            p	           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       anh    false    185            e           2604    16464    id    DEFAULT     �   ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);
 L   ALTER TABLE public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
       public       anh    false    192    191    192            d           2604    16452    id    DEFAULT     �   ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);
 F   ALTER TABLE public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
       public       anh    false    190    189    190            g           2604    16506    id    DEFAULT     d   ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);
 7   ALTER TABLE public.carts ALTER COLUMN id DROP DEFAULT;
       public       anh    false    195    196    196            o           2604    16611    id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       anh    false    208    207    208            s           2604    16669    id    DEFAULT     h   ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);
 9   ALTER TABLE public.coupons ALTER COLUMN id DROP DEFAULT;
       public       anh    false    211    212    212            v           2604    16723    id    DEFAULT     r   ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);
 >   ALTER TABLE public.delayed_jobs ALTER COLUMN id DROP DEFAULT;
       public       anh    false    215    216    216            ]           2604    16408    id    DEFAULT     l   ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);
 ;   ALTER TABLE public.districts ALTER COLUMN id DROP DEFAULT;
       public       anh    false    183    184    184            h           2604    16514    id    DEFAULT     n   ALTER TABLE ONLY public.line_items ALTER COLUMN id SET DEFAULT nextval('public.line_items_id_seq'::regclass);
 <   ALTER TABLE public.line_items ALTER COLUMN id DROP DEFAULT;
       public       anh    false    197    198    198            n           2604    16586    id    DEFAULT     p   ALTER TABLE ONLY public.order_types ALTER COLUMN id SET DEFAULT nextval('public.order_types_id_seq'::regclass);
 =   ALTER TABLE public.order_types ALTER COLUMN id DROP DEFAULT;
       public       anh    false    206    205    206            j           2604    16535    id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       anh    false    200    199    200            l           2604    16552    id    DEFAULT     t   ALTER TABLE ONLY public.product_types ALTER COLUMN id SET DEFAULT nextval('public.product_types_id_seq'::regclass);
 ?   ALTER TABLE public.product_types ALTER COLUMN id DROP DEFAULT;
       public       anh    false    202    201    202            f           2604    16489    id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       anh    false    194    193    194            u           2604    16693    id    DEFAULT     �   ALTER TABLE ONLY public.restaurant_favorites ALTER COLUMN id SET DEFAULT nextval('public.restaurant_favorites_id_seq'::regclass);
 F   ALTER TABLE public.restaurant_favorites ALTER COLUMN id DROP DEFAULT;
       public       anh    false    214    213    214            m           2604    16563    id    DEFAULT     z   ALTER TABLE ONLY public.restaurant_types ALTER COLUMN id SET DEFAULT nextval('public.restaurant_types_id_seq'::regclass);
 B   ALTER TABLE public.restaurant_types ALTER COLUMN id DROP DEFAULT;
       public       anh    false    204    203    204            c           2604    16441    id    DEFAULT     p   ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);
 =   ALTER TABLE public.restaurants ALTER COLUMN id DROP DEFAULT;
       public       anh    false    188    187    188            r           2604    16636    id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       anh    false    209    210    210            ^           2604    16419    id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       anh    false    185    186    186            >	          0    16461    active_storage_attachments 
   TABLE DATA               k   COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
    public       anh    false    192   P�       q	           0    0 !   active_storage_attachments_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 68, true);
            public       anh    false    191            <	          0    16449    active_storage_blobs 
   TABLE DATA               z   COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
    public       anh    false    190   ��       r	           0    0    active_storage_blobs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 93, true);
            public       anh    false    189            4	          0    16395    ar_internal_metadata 
   TABLE DATA               R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       anh    false    182   ��       B	          0    16503    carts 
   TABLE DATA               ;   COPY public.carts (id, created_at, updated_at) FROM stdin;
    public       anh    false    196   ��       s	           0    0    carts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.carts_id_seq', 61, true);
            public       anh    false    195            N	          0    16608    comments 
   TABLE DATA               k   COPY public.comments (id, description, rating, user_id, restaurant_id, created_at, updated_at) FROM stdin;
    public       anh    false    208   ��       t	           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 53, true);
            public       anh    false    207            R	          0    16666    coupons 
   TABLE DATA               W   COPY public.coupons (id, code, amount, expiration, created_at, updated_at) FROM stdin;
    public       anh    false    212   7�       u	           0    0    coupons_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.coupons_id_seq', 4, true);
            public       anh    false    211            V	          0    16720    delayed_jobs 
   TABLE DATA               �   COPY public.delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
    public       anh    false    216   �       v	           0    0    delayed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.delayed_jobs_id_seq', 2, true);
            public       anh    false    215            6	          0    16405 	   districts 
   TABLE DATA               E   COPY public.districts (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    184   -�       w	           0    0    districts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.districts_id_seq', 10, true);
            public       anh    false    183            D	          0    16511 
   line_items 
   TABLE DATA               i   COPY public.line_items (id, product_id, cart_id, quantity, created_at, updated_at, order_id) FROM stdin;
    public       anh    false    198   ��       x	           0    0    line_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.line_items_id_seq', 78, true);
            public       anh    false    197            L	          0    16583    order_types 
   TABLE DATA               G   COPY public.order_types (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    206   ��       y	           0    0    order_types_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_types_id_seq', 5, true);
            public       anh    false    205            F	          0    16532    orders 
   TABLE DATA               �   COPY public.orders (id, total, note, feeship, buyer_id, shipper_id, payments, created_at, updated_at, order_type_id, card_token) FROM stdin;
    public       anh    false    200   Y�       z	           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 20, true);
            public       anh    false    199            H	          0    16549    product_types 
   TABLE DATA               I   COPY public.product_types (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    202   (�       {	           0    0    product_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_types_id_seq', 8, true);
            public       anh    false    201            @	          0    16486    products 
   TABLE DATA               x   COPY public.products (id, name, description, price, created_at, updated_at, restaurant_id, product_type_id) FROM stdin;
    public       anh    false    194   �       |	           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 11, true);
            public       anh    false    193            T	          0    16690    restaurant_favorites 
   TABLE DATA               b   COPY public.restaurant_favorites (id, restaurant_id, user_id, created_at, updated_at) FROM stdin;
    public       anh    false    214   ��       }	           0    0    restaurant_favorites_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.restaurant_favorites_id_seq', 13, true);
            public       anh    false    213            J	          0    16560    restaurant_types 
   TABLE DATA               L   COPY public.restaurant_types (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    204   ��       ~	           0    0    restaurant_types_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.restaurant_types_id_seq', 11, true);
            public       anh    false    203            :	          0    16438    restaurants 
   TABLE DATA               �   COPY public.restaurants (id, name, phone, address, description, timeopen, timeclose, created_at, updated_at, user_id, district_id, restaurant_type_id) FROM stdin;
    public       anh    false    188   �       	           0    0    restaurants_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.restaurants_id_seq', 5, true);
            public       anh    false    187            P	          0    16633    roles 
   TABLE DATA               A   COPY public.roles (id, name, created_at, updated_at) FROM stdin;
    public       anh    false    210   N�       �	           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 4, true);
            public       anh    false    209            3	          0    16387    schema_migrations 
   TABLE DATA               4   COPY public.schema_migrations (version) FROM stdin;
    public       anh    false    181   ��       8	          0    16416    users 
   TABLE DATA               �   COPY public.users (id, email, password_digest, username, address, phone, created_at, updated_at, role_id, district_id, uid, provider, remember_digest, activation_digest, activated, activated_at, reset_digest, reset_sent_at) FROM stdin;
    public       anh    false    186   ��       �	           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 48, true);
            public       anh    false    185            �           2606    16469    active_storage_attachments_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.active_storage_attachments DROP CONSTRAINT active_storage_attachments_pkey;
       public         anh    false    192    192            �           2606    16457    active_storage_blobs_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.active_storage_blobs DROP CONSTRAINT active_storage_blobs_pkey;
       public         anh    false    190    190            |           2606    16402    ar_internal_metadata_pkey 
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
       public         anh    false    212    212            �           2606    16730    delayed_jobs_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.delayed_jobs DROP CONSTRAINT delayed_jobs_pkey;
       public         anh    false    216    216            ~           2606    16413    districts_pkey 
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
       public         anh    false    204    204            �           2606    16446    restaurants_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_pkey;
       public         anh    false    188    188            �           2606    16641 
   roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         anh    false    210    210            z           2606    16394    schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         anh    false    181    181            �           2606    16427 
   users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         anh    false    186    186            �           1259    16731    delayed_jobs_priority    INDEX     Z   CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);
 )   DROP INDEX public.delayed_jobs_priority;
       public         anh    false    216    216            �           1259    16470 +   index_active_storage_attachments_on_blob_id    INDEX     u   CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);
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
       public         anh    false    214            �           1259    16478     index_restaurants_on_district_id    INDEX     _   CREATE INDEX index_restaurants_on_district_id ON public.restaurants USING btree (district_id);
 4   DROP INDEX public.index_restaurants_on_district_id;
       public         anh    false    188            �           1259    16569 '   index_restaurants_on_restaurant_type_id    INDEX     m   CREATE INDEX index_restaurants_on_restaurant_type_id ON public.restaurants USING btree (restaurant_type_id);
 ;   DROP INDEX public.index_restaurants_on_restaurant_type_id;
       public         anh    false    188            �           1259    16472    index_restaurants_on_user_id    INDEX     W   CREATE INDEX index_restaurants_on_user_id ON public.restaurants USING btree (user_id);
 0   DROP INDEX public.index_restaurants_on_user_id;
       public         anh    false    188                       1259    16649    index_users_on_district_id    INDEX     S   CREATE INDEX index_users_on_district_id ON public.users USING btree (district_id);
 .   DROP INDEX public.index_users_on_district_id;
       public         anh    false    186            �           1259    16642    index_users_on_role_id    INDEX     K   CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);
 *   DROP INDEX public.index_users_on_role_id;
       public         anh    false    186            �           2606    16496    fk_rails_009fa2d872    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_009fa2d872 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);
 F   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_rails_009fa2d872;
       public       anh    false    2183    194    188            �           2606    16619    fk_rails_03de2dc08c    FK CONSTRAINT     {   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_03de2dc08c;
       public       anh    false    208    186    2178            �           2606    16696    fk_rails_0e17f6ab93    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_favorites
    ADD CONSTRAINT fk_rails_0e17f6ab93 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);
 R   ALTER TABLE ONLY public.restaurant_favorites DROP CONSTRAINT fk_rails_0e17f6ab93;
       public       anh    false    2183    214    188            �           2606    16518    fk_rails_11e15d5c6b    FK CONSTRAINT     �   ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_11e15d5c6b FOREIGN KEY (product_id) REFERENCES public.products(id);
 H   ALTER TABLE ONLY public.line_items DROP CONSTRAINT fk_rails_11e15d5c6b;
       public       anh    false    2194    194    198            �           2606    16624    fk_rails_1b0c29f17e    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_1b0c29f17e FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_1b0c29f17e;
       public       anh    false    188    2183    208            �           2606    16542    fk_rails_2dc2e5c22c    FK CONSTRAINT        ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_2dc2e5c22c FOREIGN KEY (order_id) REFERENCES public.orders(id);
 H   ALTER TABLE ONLY public.line_items DROP CONSTRAINT fk_rails_2dc2e5c22c;
       public       anh    false    2204    198    200            �           2606    16570    fk_rails_464fdadd08    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_rails_464fdadd08 FOREIGN KEY (restaurant_type_id) REFERENCES public.restaurant_types(id);
 I   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_rails_464fdadd08;
       public       anh    false    2208    188    204            �           2606    16643    fk_rails_642f17018b    FK CONSTRAINT     x   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_rails_642f17018b;
       public       anh    false    210    186    2216            �           2606    16576    fk_rails_8464b8e5d7    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_8464b8e5d7 FOREIGN KEY (product_type_id) REFERENCES public.product_types(id);
 F   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_rails_8464b8e5d7;
       public       anh    false    194    2206    202            �           2606    16601    fk_rails_aea2044a0b    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_aea2044a0b FOREIGN KEY (order_type_id) REFERENCES public.order_types(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_rails_aea2044a0b;
       public       anh    false    200    206    2210            �           2606    16473    fk_rails_aef57e41ec    FK CONSTRAINT     ~   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_rails_aef57e41ec FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_rails_aef57e41ec;
       public       anh    false    186    2178    188            �           2606    16523    fk_rails_af645e8e5f    FK CONSTRAINT     }   ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_af645e8e5f FOREIGN KEY (cart_id) REFERENCES public.carts(id);
 H   ALTER TABLE ONLY public.line_items DROP CONSTRAINT fk_rails_af645e8e5f;
       public       anh    false    2196    198    196            �           2606    16701    fk_rails_c1a45eec9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_favorites
    ADD CONSTRAINT fk_rails_c1a45eec9f FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.restaurant_favorites DROP CONSTRAINT fk_rails_c1a45eec9f;
       public       anh    false    214    186    2178            �           2606    16650    fk_rails_c49b9ab796    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_c49b9ab796 FOREIGN KEY (district_id) REFERENCES public.districts(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_rails_c49b9ab796;
       public       anh    false    184    186    2174            �           2606    16479    fk_rails_fb56ca7446    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_rails_fb56ca7446 FOREIGN KEY (district_id) REFERENCES public.districts(id);
 I   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_rails_fb56ca7446;
       public       anh    false    188    184    2174            >	   I  x�u�;n\1Ekr���W��l�p�f����ٿ���gH�pH������O��������;�:�)ND��=&��{�J��e<��~�l8��$i�2��Ri����8P-�{Z�iH��g�j�M�2�P���֎����=.�V7a�Qp����2�HêȊoF�������
��{GtZ6A�R"�j�bӨ�ل�n�x���-�����2$[S2RyuD5fY'-���'����]�O}<t��δyR�@���~ݮ��ft�SlRN�����G�8Vĺ�u�"�T]7�����H�CE{g&�8R��e��sC�O���      <	   �  x�͛K��J��ǮU��4���f5 �J�H^��DB�HB�j�K��z5��N��̾7�n������Z0��4�/�s�Α;d��]�a6\�օ=�\����cˋ����(q���%����s�`���"�����6��������}�\ow@xo}�ΧW�������ҡhA���;]�@�Be[B����Ҟ�:{~�f�TX��U\��V��ǻ���O����������׿��9�F��������_�~~��wF�c9�͈���T���ArN�S�n8��z�n���V~s[�[���D(����C|�ܢX��u�q&�;կ��$m(t)�F�B'	N/���ں3#����?c��B��0 Y��}�)�dY����{HX�u.�x� ���|t:�'��Pn&�sv�����=rYN��m^�P$��DԫM0e�h����Y��K�Q�Kʢ�K�ӻT�"�j%Q+�%V���A$�R
�u�!s�u��4��c�>�� �G�N8�n�$)�Hg��;s�����D�h�ս��xt�V��S������:~��f�.�?]��i�I�8�qg�����Q��37^�C'�T����^~LE�$0���~w<_���M��Y`��w���JE�9�$0������ҷJ3qmV�%�PU�۴.�Tl�c�u�(��S���#}�tw�Dg�;&��l#�]h���;O�m���!��������C�+$�@\X\��h�6��A�z�U��Z4L��t�c�A�Q��+K>^�{���*^E��qP
!E򋹵� �G�#�Q���(����?�_���z1��t��P��1�H M��N�����~�+kٖL��W��>P}U"n����O_HR" d���������Go?��T���jVQ�P�b��f���V������b���kP��1=���M���RH ��kHs^-w����#r��[��^�`�l.(�$�8V|]�Ž��� n�t�-l+̂��*U=Y�>L(����UvK��IB�&�R��s���z퇿��/:nK�8G� ��eN��دו	��O����w@�V%��X�&�?e]��Æ=�����e��PN�'��Ϥ3հU�Lb�?-�������}H��)z~�����*q@��{u�9�8�mw;����@�F�y˽Dm?��*�����p/���w�(=���EP�����B	�;)+�"6�G;����KJ_~����P��z۩�/�Óy��s�����V��B���)��۔�A�iHV�K��Ywt�V�ug6zg��>���`���jH�#�����dS���q��m��<���贍 Li��l6����2�XwN��a?�(Z=��6�����	�]|X�B��k8�6��"����n�ݲ0���"�3P�2àwy�m=\~�"5돷�̟���|B P�<$������éwa���KX�>N7��,ȋ�0S+H� �lP���n5?���WG�oSL�D5Z��пn��qq����\˛����3�u0�t�����V��r����w���|��GI1p�D�E�lKl��)uN�%=&ͷO�+���$Wmq�O�I<��»�v�E�n��oI�wP�r�a�"F5$ �]���9ye��x��0�NO ��e�I��g	,I���j����b˃X?��=F LԼ�5���K?��2��� B�rr=��6S4$� ���#і��+<�+�Ci�|
em��$P��+�o1��`�_�C�z;ޜ��M�䙲M�T41�O�=�,�qؙ�U=?`OZZ�@
��j�R�)�1�G�?=�n��q�d��s�|ͨ6�bf�vn��z��Ym��М%o�h�:�4�0�#������Qy�����|��)�jk�0��:�0M'�n�]3n�ȸN���J��~$d�&��-�1H]�,Y��o�G;����4��l|�j>C2�(��f^��{qe�`���"g�%yz�H%��а�q~Bݭk�`Z�f��j>^e�KHE'8�R#�.=�u�$���>��חa�Ȟf���.U9hD��KW��h�<ƫ��ǃ~0��;JH�%��&�%�E�e�in0'����{2"�m(չF@{|=MU�������&��.I%ThD����R8\%�h�	��E�r�x�?�dj�k<�����>Y��C�d��S��MJ��T�:0���Jɐ���Sd��k�������|�F���~Y���&�b�7<��i��t�y�&R�P#܋�@=#=��(�cE����)�ۺ*o%'!`�>Vr(|~	�/vg841yf�@��P:2`Z�U��n2��<�^f�!)6�a�1�#�p�=P{q��8��)Ϗ����Z�@U����V1����ˮ�\��/D�P�'���q�Y�OK缰��_'�gf�`HH%!�(��k���uVO����������ȱ|������d3ˢ͚/݅߹O�&��T�D-��,�#�p4��]�>/G{|�U#�D�F0(��٘�7�Ɨ����e�z��I�1��1m�F��-o�=�f;[f��)��ą�GND��+��;5�2VV�p64�tny��٧n�C�ӃXږ�`k��_��3/<�Τs���������Y��2�!cDc:x�T0w�|�����>`��ei<��RK��ٮZ:�~�����9Ǚe{7{����o@� Lj����͓��q�CVz��T�r�{�+� q�8lc\�FD��}wy�Ț�/�_�ea&{�Re�:Rm�Qp(�p�,G�2oQ3�#��7%��t�Ӆ@�!�ZU7r;ƅ�2:����s���07��<�Li&�P0��Xr�8�(�'#{}�'�خ������P�s)� $���f��+�@�x�i��7=��&_��Ȃc��L���1�p��7�v�a�[l�!M�M+I��5h���OKU�o9�C�"g�t�g��{/xuH���z�y@�g�q��~:�����hg���.g,�7�ameǔ"�C� s���[����ވ\��I6��M�x[m\%9G�����_v�$��� M����7�j�X��s��u�I�Y�ɺ������ǁ�c�' Am�9$R���ܸ���}����2J{��~�
�Ǒ��xS�1�V����nV"1?Ӿуc#�.��$|���,��\�  ׾뱣ZwwMp�S>\�,
�:"}�ԛ��9�O\O�0�\�՘��<��e~~��5�d�R�`��GǦ����9�ϖ�� �bD�
�BD�Є�����K��_����{JT��[쨥����ѫ �v�%P�̦ۨy�l����]g��[�ӿ#�-�JI����xBBW��v �#��%������j/��l?_�����*.���N���*��c�pb]( v��������C?�z"u߼U|HI�!A�	�����EG�WQ�On2Y;�I���ㆥN9{(HA:��}�3ݥ+v�'*v�x����0*u�	�k����8^&���ַ�<����3�|\\���u���;�����`ԡ[�,u�V���0}�J��XH�߲���^�|3��`i��n8O�z�'.,^Q�djB�pd�I�ˋ�L��>7�j:�.�2����ĪEkR�YN�'s���USW�����Ԁ~��9	�V�w��3�gq�4��������m���#`xS�g�/��ͩw���r�Wo�d_��dHi�Ab�Q=#�ȗ��y��0M�[=5�_ �r6��k[Ӵ��ߗ�      4	   ?   x�K�+�,���M�+�LI-K��/ ��-tu�,�ͬL��,��L���Hq��qqq ���      B	   �   x�}��m!��
Xk�\K��#l��͍.�G��ǇB�%ra6����<�=�@$��Q均d��$~UФ����+�q"����+��"��� Rn܇�[ }�Ś�P69�'"�/(8C<��l�O�TZ��&#ND��P���,��|t�O��L�ߡ�� d�|l]�fa�'���B���)j��&C�O9�C{C�jN�u�)Ɓ蓉��z�#      N	   r   x�35��K���4��4�420��54�50W00�2��26ҳ02�0�!elfi�ej���p��d�҇�'�+=ܵ�D!h��TNC4�&@d�glijda�U�����؈+F���  ]%b      R	   8   x�3�t����4�420��54�56�3��L�L���,-�p�p��qqq c�      V	   �  x��\_������^�Wu6 0`�n+����檒��2)E��f#N��T�{Zx0��c��٩ڝ1BR���Z�jyЍu�n&���;^G�E�h\���U��?�(�RӚ~������hF64�WM[��_8)
�o�O,�	�Hx��x�3R��!&d��I��0	L�70��&�1���x�Ibϝ��$
�lb���B�'���ӄr���
�8'++I�T}S��j�:��W4�J�ob�\R�@�gǬ�+L�D@V��s��0���H&�/��if5�'k���~R���t1��F�Z���DC�b�T
n~bguEx/ii�'$R`�}��&i��7F���,�и��}�`^'t��%t�<b���j���&�}����+�4ʨQ�vb ���$R2�}�y��K��&ɗ�G4_� �RP5�ԝ�f�F���]�6K}TlB �)�ڲ�j�IZ�����<��q ��H8��47���9夢��P@�/�o�KZ	��^
v(�$��g4u�w$X<م��8�-D�C�����f��4&�.�):Z�\��hy_�����{�S�#������ ���'n�S�P�5�.�ܨ��l��j�M���s��@,��@�?��b�홍,o�B���]�Ʈ��qݙe��:_�ӾxE�Y�U��b�g�D��yB�6�5-�`��AX�*�3gUz��ʅK(�%���	˽J����#��p�K�B��FϒU$��[��m���{p���$���W; ]w�z���WY�\󑴒r^\�H��v���9��y�k^aO"��;�i�Đ��|Ii�.�+��i��Ox��ȣ����C)}K��{��`WG,�"�^�1!ޅ1��U,��G�����9�X@�ζ,�-�g��ZJ��TDII��2��H��������=@�(hԐf'����]7��Mm�����rfϕ�+8�iYb5��A�+��E��fX<GĴ;h�Jݼ���2�/���u8;�1�z���$�hg�뛄^��ڗ$O2��o1-d֣Y�����AZ�ߚ�g����-��Lr�����j�+ B7���d9O�*M�QB�Vn�!n|��u�V*�<G�����IBA�(	��Na��5
��,+�w�АB��T��/H\�v�O�Ϣ�x�αI��і�M�(v��2#�໼�bI���o�>hׅ��I���Ɨ1�A����-����Փ���>��:t�{\>�8�n���{g\�9���JEX��R�b��;p|{������a��s�
�Z��mO�;���8��\GG��n<<L@zeԻZ�^^K<��08$(UJ;����G�r���c�n����[y��D��f�$���K�5A�6)�)e����J�I�� W��4��`�� Uu�4�';���~��)`p��!0q��t&�6���1͓�Ҥ�O��^C���x�ڄ� �R���>K'� ��2��65��,�4���+_��߷�u��h}RaRQ��e�� >���ͫ��l��b�aD�Z�@�x�"�^�VS��$�ha�[��Aα{�NK����<�b���͡�9�}�k�y���~��0���Cm����u2i����&D�����N��݃���<�����]�;��A��Z�PK8c쬴�Tz[��"��f��k�E�V���A�7G�?��g��`���B/I�:���<��;������{��G^})�[��TsHz޵N���FS�9oϒ�:�Y� �=��w��#263�p�9&�a���x	�;=�Z1p,�	"U�M��@$���y��Y��y{��\VN#���ɐ�Ț���gu� F'i{y�
,u�e�=˰V.�oq��!��ZB����sǱ�*m��＞w�t����yBx�xQ˛�i���mP0%�'�s[�4h����:�4����7J�f
�I�1�Y�+(�0��7)����7�l� �Oe�G���)��qVN3��(
�����p�s�q�H��4O7�%���C�V+X|���x�>	@�]��uw��F<�)�g\�#-Ğ�}[�r=o���en���Д�VMa����/��D�m0�qUyG�������ޔ�_�	�����l��d��Ķ'�2�%���>���onj�5_���E�̛��2��i,�qܙ��v��ݻ�2���      6	   �   x�3�t:�&/C!$���啜F������
�V&&V��z���Ffx���8�/�T:Ҝ��]�����9).cN�L�3�3�n,Ū��������	��)
����aWdhf`n�G�˔
K�@$v�F��8������ �0O`      D	   �  x�}��y+1���*܀��
P�����89'^)���;0�M�Qc���9o4&�� ErͿ��G7n�Vի��7�I29@2��;i��'B�-m�~�#�/������F�n��ʭ '{�Rb"N,ųl���. \�ZL�`���@�jԴӨ 
2�����"0�[`�1M�J'Ӌ�	�-�w�w� ,��Fc,�6Yޔ9�%G^�
�Նp��v�P��|���$x��<�CE�j��2a$��U"R����%��?��ke!��U�8Zv�CU6��f��L�X�v���D]T��"���xP�} G�H��@���B�qj@F��>�v��<"�^b\\���uZ��rt��p��\��ۈ���8���/rp�Ej�e�ލ�E�4��FQu�G]�"l�q93_uux@0�e3�TW��z��ܫΡV����7"e�9���z      L	   �   x�3�t�8�!Q����d�������qZ��X*XX�ZZ�����2� d�����)).cN����J2�dv���f�x��L8=�^^���pw?vu���&�x��L9�LH�KWH�L�W �%���L�����L�������W� hgV�      F	   �  x���;r�@�c�)t�����c&% �N�$ �9�o��"��؛�#���ٓI���wO2�^��>]>��_���?�M}�y3`|��#j�RBV��hU�fH�Prr\> ,��#a�ْ���D�2%��3��Ȟ���6��s���@��@��2�Y���Q3DZ�h}�a�'�;$k`���<	�hk�nU��7�{^.I
���S��.Y�����
%4(���3�ɡG��'�)������D�6�t�X"($�'ᄔ��ח������/�˴�n�F������o�ik�66'��LN̺'�!��!�Q�p5Qٓ������OZAWk�͜�0R0�Rr[E�=_Z�MߓN�ע��o���'Ͷ�B�:�-hn���Ɏ4C�P��4K�
d3,{�D�����Q'� �IԞP�X��ɛt8� nfS      H	   �   x�}�1N1Ek�)|�X3�g�2U*$���&��Ҹ�	(�"%��=.7�M���������!u;�|ѷ���^K��+F�D��.Z1D}h �*(�4ܗ��l��0����B^��'Щ�n�귒�7�B�A��pU��xM��P��er�.:gD��ϩxuw	Kd6��}�@ U���L6���n�Ez�?ӠӶ����Ib,9dj x6 �Y���      @	   {  x����j�@���)�.;;�1�h�xj���A��F�)�c��
^�ғ}��IW�E4�������l�曏��^���?/��k�VE�~+G J�GH_�{�=�Sə����H��5l- �DW����C��j��:s��sJ�\:v�b�OC5�DDt
;"�9����3}O�;N�o �v�nOE�%���h�����E�Z���W��LFhF��#����n�:��ut�2r���Y�M�%�Xl��*�5�tVL��� ��~-�tG�4Ƃ�	C?Ty҇����0�̠��1��ȓ4@qWnw��Û��r�B�N�z�,z��Q�u�~/G�9�M�O^x�s{�Ċ���⟺�$	�k<D�۽��E�$�̜�E      T	   1   x�34�4��420��54�50W00�21�2��307640�#����� ���      J	     x�}бJ1��:�y��$������@8��	�ya+E�-��G�N@�\_$o�"W����3��*y:��0�Alt����h�
���#6�J2oY��s�M�����ᵓ�t�[�Z���;�~��t���֑��X��Lw�	�SH�U�������ؘF[�!Z���0�
A+ֹ����C���<�CDVA�a_!`q2�G��}韧�8��cG!T��\��q��FK���jW!@-��i@�X�Fg*�����b�ȳ��\( ���2      :	   =  x�u��JA�뽧�𖝙����`a��V6IɁ^P�
k���������R&�=�M�&($���`��V�|<�.����~�d)<��w�l�Y*�y���+6=�ڑ��ʍ������,ELM�ls�g�Y<�2�N9��%�Ƴ���"13*d��S�|�p�]�Sؼ��b~}�%�g�F�!��v\��t@� �.��5gl�΁�c�^�PTûa�z�d)Dߓ���]}�	w#XHAb��xԀ�m=�@'Pp2^+�8uQȿ���G󻔳p=����k	7����������pJM ùL�Y�}�h��h)Xe���[�$��x��      P	   �   x�3��K?���
.�w�sZ��X*�[��Xꙙ�����2�t�O��P�K��|��� �ZKc3C<R\�פg&�+d^��I���x��Lf�>ܵ8O!��^�͍,�Hq��qqq S�L�      3	   �   x�MϱD!Оa�l'���?�A��	p��IPt���8��&㡡�c<�2��a�K:�feƍZ�ȰBv�ɱK��x�ӺT9���H��]�r������J�O(��\�\���,�/�vW����(}Ƽ��&-�Z�a�|�<N�z���������]Z      8	   �  x���K����׮O���}}��f5���6��0�lc�)�ne)�"%��fF�.]ʪG�=��tWwUU�H�@>�{~����\"Nr���4�}��So�/���w�+�åZ��hײ�z����X�{zd^T���iIV�zS��M7ژ2��GR+�Ǉ��9��?���i����$7p?�+� �${L$����P�A�gJs U�ʛ!�H߷�������3��ѢA/y�M�v�C}�i ��[�c�7|��S����E���c8���;�)I�挏�Msŏ?����V��2S����C�Ӱ'��%��M���r���ZU����nwklb��g�5T��T����?��N4��Ç�_��xT*B�H\�cC���z��K�v��0p�W:T4�IM>���C4�u����I�[�ƻ�rYZ���u47j2��ђ��}��5pr�x��?�P���}������Ke�q	�~�+%ar@ �oE��T�ꊍ�E2I��6({PȴPK�p�]��eZ��d��-%���UI���(!|!����̙p�ǘ�z�G����.ILW�Ӵb�{���Ǔco�l���qT��v�<#������,��������l$�<��8������O�	b�@U�*z�7by�������HX
�+�s��,K��]�Z7�̶�m-�VK�������
t��,w�%�]��0*�s5��i�]���*虑�a��8� r&$�O�\�N.�by����v#9�i0�K@{�;UoM�h��&�n�9lǓFS6�����r�����qwItJ�I�,��+��CD �_v�1�ڴ"��|VY#���K@��q��m%}o<ڭ+;�����bl�iV���0&��u���퇁������~V��W�;y�G�)	$���=9H�X�#�i����S�P��K.)
�BA�e�KN:k�O�4�]��&w��ٗL�U�@��ŝ+;���3�zʤ/&ˎN++g-����� ������,|)�i��i���g���j��|`�*1�)�յ��Ն��M�Xk��\�Z�ׇ�U�+yJ�D !��m�)���~ 
,���1}/&��F��b����x X$�1��.�I���6�C�flI��I��u{��a�ldz��Ϯ�e�jց��Ja�N���&�����J�2X���z󆼳
��u|�$�_u��E�A|%�d��̿b���vl�������fT�20�K<�ŢQ8��j�E+���P���I<V#J��id~Q�K�d��}�l�䄕��B��G�E(�D&"�M��'�d�SJ�P��^�	�J���ø�Ω�l�Rl�Ck<���[�5=v䱖��R�_h�����-�+K;�+5�����l^^7�M�m��+�~wDU�XGSr���Uv97
��z�x�2@9w�|g�z�d�Fqu�vj��9��[m��q6׳�5w�6��.�w��,�\�]�-�m�k��28-&.(������ڽz     