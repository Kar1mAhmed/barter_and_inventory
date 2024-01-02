PGDMP         ;                {         	   template1 %   14.10 (Ubuntu 14.10-0ubuntu0.22.04.1) %   14.10 (Ubuntu 14.10-0ubuntu0.22.04.1) �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    1 	   template1    DATABASE     X   CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_IN';
    DROP DATABASE template1;
                postgres    false                       0    0    DATABASE template1    COMMENT     G   COMMENT ON DATABASE template1 IS 'default template for new databases';
                   postgres    false    3603                       0    0    DATABASE template1    ACL     k   REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
                   postgres    false    3603                       0    0 	   template1    DATABASE PROPERTIES     -   ALTER DATABASE template1 IS_TEMPLATE = true;
 U   UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
                postgres    false            �            1259    16410 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16409    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    216                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            �            1259    16419    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16418    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    218                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            �            1259    16403    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16402    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    214                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            �            1259    16426 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16435    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16434    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    222                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    221            �            1259    16425    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    220                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    219            �            1259    16442    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16441 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    224                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    223            �            1259    16531    barter_and_inventory_category    TABLE     Z  CREATE TABLE public.barter_and_inventory_category (
    id bigint NOT NULL,
    category_title character varying(400) NOT NULL,
    category_status character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    updated_by_id integer
);
 1   DROP TABLE public.barter_and_inventory_category;
       public         heap    postgres    false            �            1259    16530 $   barter_and_inventory_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.barter_and_inventory_category_id_seq;
       public          postgres    false    228                       0    0 $   barter_and_inventory_category_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.barter_and_inventory_category_id_seq OWNED BY public.barter_and_inventory_category.id;
          public          postgres    false    227            �            1259    16540    barter_and_inventory_offer    TABLE       CREATE TABLE public.barter_and_inventory_offer (
    id bigint NOT NULL,
    offer_title character varying(400) NOT NULL,
    offer_description text NOT NULL,
    estimated_cost numeric(10,2) NOT NULL,
    estimated_cost_currency character varying(255) NOT NULL,
    includes_cash boolean NOT NULL,
    cash_in_hand numeric(10,2),
    cash_in_hand_currency character varying(255),
    exchange_date timestamp with time zone,
    shipment_method character varying(255),
    shipment_address character varying(500),
    final_remarks text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    exchanged_with_id bigint,
    updated_by_id integer,
    offer_status character varying(255)
);
 .   DROP TABLE public.barter_and_inventory_offer;
       public         heap    postgres    false            �            1259    16539 !   barter_and_inventory_offer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.barter_and_inventory_offer_id_seq;
       public          postgres    false    230                       0    0 !   barter_and_inventory_offer_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.barter_and_inventory_offer_id_seq OWNED BY public.barter_and_inventory_offer.id;
          public          postgres    false    229            �            1259    16693    barter_and_inventory_offerbid    TABLE     1  CREATE TABLE public.barter_and_inventory_offerbid (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    bid_offer_id bigint NOT NULL,
    created_by_id integer NOT NULL,
    offer_id bigint NOT NULL,
    updated_by_id integer
);
 1   DROP TABLE public.barter_and_inventory_offerbid;
       public         heap    postgres    false            �            1259    16692 $   barter_and_inventory_offerbid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_offerbid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.barter_and_inventory_offerbid_id_seq;
       public          postgres    false    242                       0    0 $   barter_and_inventory_offerbid_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.barter_and_inventory_offerbid_id_seq OWNED BY public.barter_and_inventory_offerbid.id;
          public          postgres    false    241            �            1259    16583 !   barter_and_inventory_offerproduct    TABLE     Z  CREATE TABLE public.barter_and_inventory_offerproduct (
    id bigint NOT NULL,
    product_quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    offer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    updated_by_id integer
);
 5   DROP TABLE public.barter_and_inventory_offerproduct;
       public         heap    postgres    false            �            1259    16582 (   barter_and_inventory_offerproduct_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_offerproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.barter_and_inventory_offerproduct_id_seq;
       public          postgres    false    240                        0    0 (   barter_and_inventory_offerproduct_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.barter_and_inventory_offerproduct_id_seq OWNED BY public.barter_and_inventory_offerproduct.id;
          public          postgres    false    239            �            1259    16549    barter_and_inventory_product    TABLE     0  CREATE TABLE public.barter_and_inventory_product (
    id bigint NOT NULL,
    product_title character varying(400) NOT NULL,
    product_description text,
    product_quantity integer NOT NULL,
    product_condition character varying(10) NOT NULL,
    price_per_unit numeric(7,2) NOT NULL,
    price_currency character varying(255) NOT NULL,
    product_status character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    updated_by_id integer
);
 0   DROP TABLE public.barter_and_inventory_product;
       public         heap    postgres    false            �            1259    16548 #   barter_and_inventory_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.barter_and_inventory_product_id_seq;
       public          postgres    false    232            !           0    0 #   barter_and_inventory_product_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.barter_and_inventory_product_id_seq OWNED BY public.barter_and_inventory_product.id;
          public          postgres    false    231            �            1259    16558 /   barter_and_inventory_product_product_categories    TABLE     �   CREATE TABLE public.barter_and_inventory_product_product_categories (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 C   DROP TABLE public.barter_and_inventory_product_product_categories;
       public         heap    postgres    false            �            1259    16557 6   barter_and_inventory_product_product_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_product_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.barter_and_inventory_product_product_categories_id_seq;
       public          postgres    false    234            "           0    0 6   barter_and_inventory_product_product_categories_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.barter_and_inventory_product_product_categories_id_seq OWNED BY public.barter_and_inventory_product_product_categories.id;
          public          postgres    false    233            �            1259    16576 #   barter_and_inventory_productpicture    TABLE     J  CREATE TABLE public.barter_and_inventory_productpicture (
    id bigint NOT NULL,
    product_photo character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    product_id bigint NOT NULL,
    updated_by_id integer
);
 7   DROP TABLE public.barter_and_inventory_productpicture;
       public         heap    postgres    false            �            1259    16575 *   barter_and_inventory_productpicture_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_productpicture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.barter_and_inventory_productpicture_id_seq;
       public          postgres    false    238            #           0    0 *   barter_and_inventory_productpicture_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.barter_and_inventory_productpicture_id_seq OWNED BY public.barter_and_inventory_productpicture.id;
          public          postgres    false    237            �            1259    16565    barter_and_inventory_profile    TABLE     /  CREATE TABLE public.barter_and_inventory_profile (
    id bigint NOT NULL,
    bio text NOT NULL,
    location text NOT NULL,
    birth_date date,
    email_confirmed boolean NOT NULL,
    profile_picture character varying(100),
    initial_color character varying(255),
    user_id integer NOT NULL
);
 0   DROP TABLE public.barter_and_inventory_profile;
       public         heap    postgres    false            �            1259    16564 #   barter_and_inventory_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barter_and_inventory_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.barter_and_inventory_profile_id_seq;
       public          postgres    false    236            $           0    0 #   barter_and_inventory_profile_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.barter_and_inventory_profile_id_seq OWNED BY public.barter_and_inventory_profile.id;
          public          postgres    false    235            �            1259    16501    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16500    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    226            %           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    225            �            1259    16394    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16393    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212            &           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    16385    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16384    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210            '           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            �            1259    16724    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �           2604    16413    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16422    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16406    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    16429    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16438    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16445    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16534     barter_and_inventory_category id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_category ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_category_id_seq'::regclass);
 O   ALTER TABLE public.barter_and_inventory_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16543    barter_and_inventory_offer id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_offer ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_offer_id_seq'::regclass);
 L   ALTER TABLE public.barter_and_inventory_offer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    16696     barter_and_inventory_offerbid id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_offerbid ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_offerbid_id_seq'::regclass);
 O   ALTER TABLE public.barter_and_inventory_offerbid ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    16586 $   barter_and_inventory_offerproduct id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_offerproduct_id_seq'::regclass);
 S   ALTER TABLE public.barter_and_inventory_offerproduct ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    16552    barter_and_inventory_product id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_product ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_product_id_seq'::regclass);
 N   ALTER TABLE public.barter_and_inventory_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    16561 2   barter_and_inventory_product_product_categories id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_product_product_categories_id_seq'::regclass);
 a   ALTER TABLE public.barter_and_inventory_product_product_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    16579 &   barter_and_inventory_productpicture id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_productpicture ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_productpicture_id_seq'::regclass);
 U   ALTER TABLE public.barter_and_inventory_productpicture ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    16568    barter_and_inventory_profile id    DEFAULT     �   ALTER TABLE ONLY public.barter_and_inventory_profile ALTER COLUMN id SET DEFAULT nextval('public.barter_and_inventory_profile_id_seq'::regclass);
 N   ALTER TABLE public.barter_and_inventory_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    16504    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16397    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    16388    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �          0    16410 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   */      �          0    16419    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   G/      �          0    16403    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214   d/      �          0    16426 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    220   �1      �          0    16435    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    222   D3      �          0    16442    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    224   a3      �          0    16531    barter_and_inventory_category 
   TABLE DATA           �   COPY public.barter_and_inventory_category (id, category_title, category_status, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    228   ~3                 0    16540    barter_and_inventory_offer 
   TABLE DATA           M  COPY public.barter_and_inventory_offer (id, offer_title, offer_description, estimated_cost, estimated_cost_currency, includes_cash, cash_in_hand, cash_in_hand_currency, exchange_date, shipment_method, shipment_address, final_remarks, created_at, updated_at, created_by_id, exchanged_with_id, updated_by_id, offer_status) FROM stdin;
    public          postgres    false    230   �3                0    16693    barter_and_inventory_offerbid 
   TABLE DATA           �   COPY public.barter_and_inventory_offerbid (id, created_at, updated_at, bid_offer_id, created_by_id, offer_id, updated_by_id) FROM stdin;
    public          postgres    false    242   �3      
          0    16583 !   barter_and_inventory_offerproduct 
   TABLE DATA           �   COPY public.barter_and_inventory_offerproduct (id, product_quantity, created_at, updated_at, created_by_id, offer_id, product_id, updated_by_id) FROM stdin;
    public          postgres    false    240   �3                0    16549    barter_and_inventory_product 
   TABLE DATA           �   COPY public.barter_and_inventory_product (id, product_title, product_description, product_quantity, product_condition, price_per_unit, price_currency, product_status, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    232   �3                0    16558 /   barter_and_inventory_product_product_categories 
   TABLE DATA           f   COPY public.barter_and_inventory_product_product_categories (id, product_id, category_id) FROM stdin;
    public          postgres    false    234   4                0    16576 #   barter_and_inventory_productpicture 
   TABLE DATA           �   COPY public.barter_and_inventory_productpicture (id, product_photo, created_at, updated_at, created_by_id, product_id, updated_by_id) FROM stdin;
    public          postgres    false    238   ,4                0    16565    barter_and_inventory_profile 
   TABLE DATA           �   COPY public.barter_and_inventory_profile (id, bio, location, birth_date, email_confirmed, profile_picture, initial_color, user_id) FROM stdin;
    public          postgres    false    236   I4      �          0    16501    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    226   �4      �          0    16394    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   5      �          0    16385    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   �5                0    16724    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    243   �7      (           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215            )           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217            *           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);
          public          postgres    false    213            +           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    221            ,           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);
          public          postgres    false    219            -           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            .           0    0 $   barter_and_inventory_category_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.barter_and_inventory_category_id_seq', 1, false);
          public          postgres    false    227            /           0    0 !   barter_and_inventory_offer_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.barter_and_inventory_offer_id_seq', 1, false);
          public          postgres    false    229            0           0    0 $   barter_and_inventory_offerbid_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.barter_and_inventory_offerbid_id_seq', 1, false);
          public          postgres    false    241            1           0    0 (   barter_and_inventory_offerproduct_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.barter_and_inventory_offerproduct_id_seq', 1, false);
          public          postgres    false    239            2           0    0 #   barter_and_inventory_product_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.barter_and_inventory_product_id_seq', 1, false);
          public          postgres    false    231            3           0    0 6   barter_and_inventory_product_product_categories_id_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.barter_and_inventory_product_product_categories_id_seq', 1, false);
          public          postgres    false    233            4           0    0 *   barter_and_inventory_productpicture_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.barter_and_inventory_productpicture_id_seq', 1, false);
          public          postgres    false    237            5           0    0 #   barter_and_inventory_profile_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.barter_and_inventory_profile_id_seq', 2, true);
          public          postgres    false    235            6           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);
          public          postgres    false    225            7           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
          public          postgres    false    211            8           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);
          public          postgres    false    209            �           2606    16528    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            �           2606    16458 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218                        2606    16424 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            �           2606    16415    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            �           2606    16449 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            �           2606    16408 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214                       2606    16440 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    222                       2606    16473 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    222    222                       2606    16431    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    220                       2606    16447 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    224                       2606    16487 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    224    224                       2606    16523     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    220                       2606    16538 @   barter_and_inventory_category barter_and_inventory_category_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.barter_and_inventory_category
    ADD CONSTRAINT barter_and_inventory_category_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.barter_and_inventory_category DROP CONSTRAINT barter_and_inventory_category_pkey;
       public            postgres    false    228                       2606    16547 :   barter_and_inventory_offer barter_and_inventory_offer_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.barter_and_inventory_offer
    ADD CONSTRAINT barter_and_inventory_offer_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.barter_and_inventory_offer DROP CONSTRAINT barter_and_inventory_offer_pkey;
       public            postgres    false    230            <           2606    16698 @   barter_and_inventory_offerbid barter_and_inventory_offerbid_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.barter_and_inventory_offerbid
    ADD CONSTRAINT barter_and_inventory_offerbid_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.barter_and_inventory_offerbid DROP CONSTRAINT barter_and_inventory_offerbid_pkey;
       public            postgres    false    242            5           2606    16588 H   barter_and_inventory_offerproduct barter_and_inventory_offerproduct_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct
    ADD CONSTRAINT barter_and_inventory_offerproduct_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.barter_and_inventory_offerproduct DROP CONSTRAINT barter_and_inventory_offerproduct_pkey;
       public            postgres    false    240            $           2606    16632 m   barter_and_inventory_product_product_categories barter_and_inventory_pro_product_id_category_id_2c846385_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories
    ADD CONSTRAINT barter_and_inventory_pro_product_id_category_id_2c846385_uniq UNIQUE (product_id, category_id);
 �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories DROP CONSTRAINT barter_and_inventory_pro_product_id_category_id_2c846385_uniq;
       public            postgres    false    234    234            !           2606    16556 >   barter_and_inventory_product barter_and_inventory_product_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.barter_and_inventory_product
    ADD CONSTRAINT barter_and_inventory_product_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.barter_and_inventory_product DROP CONSTRAINT barter_and_inventory_product_pkey;
       public            postgres    false    232            (           2606    16563 d   barter_and_inventory_product_product_categories barter_and_inventory_product_product_categories_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories
    ADD CONSTRAINT barter_and_inventory_product_product_categories_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories DROP CONSTRAINT barter_and_inventory_product_product_categories_pkey;
       public            postgres    false    234            /           2606    16581 L   barter_and_inventory_productpicture barter_and_inventory_productpicture_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_productpicture
    ADD CONSTRAINT barter_and_inventory_productpicture_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.barter_and_inventory_productpicture DROP CONSTRAINT barter_and_inventory_productpicture_pkey;
       public            postgres    false    238            *           2606    16572 >   barter_and_inventory_profile barter_and_inventory_profile_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.barter_and_inventory_profile
    ADD CONSTRAINT barter_and_inventory_profile_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.barter_and_inventory_profile DROP CONSTRAINT barter_and_inventory_profile_pkey;
       public            postgres    false    236            ,           2606    16574 E   barter_and_inventory_profile barter_and_inventory_profile_user_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_profile
    ADD CONSTRAINT barter_and_inventory_profile_user_id_key UNIQUE (user_id);
 o   ALTER TABLE ONLY public.barter_and_inventory_profile DROP CONSTRAINT barter_and_inventory_profile_user_id_key;
       public            postgres    false    236                       2606    16509 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    226            �           2606    16401 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            �           2606    16399 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            �           2606    16392 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            @           2606    16730 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    243            �           1259    16529    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            �           1259    16469 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            �           1259    16470 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            �           1259    16455 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214                       1259    16485 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    222            	           1259    16484 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    222                       1259    16499 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    224                       1259    16498 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    224                       1259    16524     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    220                       1259    16599 4   barter_and_inventory_category_created_by_id_c0c3bcb5    INDEX     �   CREATE INDEX barter_and_inventory_category_created_by_id_c0c3bcb5 ON public.barter_and_inventory_category USING btree (created_by_id);
 H   DROP INDEX public.barter_and_inventory_category_created_by_id_c0c3bcb5;
       public            postgres    false    228                       1259    16600 4   barter_and_inventory_category_updated_by_id_9b6148e4    INDEX     �   CREATE INDEX barter_and_inventory_category_updated_by_id_9b6148e4 ON public.barter_and_inventory_category USING btree (updated_by_id);
 H   DROP INDEX public.barter_and_inventory_category_updated_by_id_9b6148e4;
       public            postgres    false    228                       1259    16616 1   barter_and_inventory_offer_created_by_id_3db75016    INDEX     �   CREATE INDEX barter_and_inventory_offer_created_by_id_3db75016 ON public.barter_and_inventory_offer USING btree (created_by_id);
 E   DROP INDEX public.barter_and_inventory_offer_created_by_id_3db75016;
       public            postgres    false    230                       1259    16617 5   barter_and_inventory_offer_exchanged_with_id_bf64bbb7    INDEX     �   CREATE INDEX barter_and_inventory_offer_exchanged_with_id_bf64bbb7 ON public.barter_and_inventory_offer USING btree (exchanged_with_id);
 I   DROP INDEX public.barter_and_inventory_offer_exchanged_with_id_bf64bbb7;
       public            postgres    false    230                       1259    16618 1   barter_and_inventory_offer_updated_by_id_f03ed31f    INDEX     �   CREATE INDEX barter_and_inventory_offer_updated_by_id_f03ed31f ON public.barter_and_inventory_offer USING btree (updated_by_id);
 E   DROP INDEX public.barter_and_inventory_offer_updated_by_id_f03ed31f;
       public            postgres    false    230            8           1259    16719 3   barter_and_inventory_offerbid_bid_offer_id_34bfab58    INDEX     �   CREATE INDEX barter_and_inventory_offerbid_bid_offer_id_34bfab58 ON public.barter_and_inventory_offerbid USING btree (bid_offer_id);
 G   DROP INDEX public.barter_and_inventory_offerbid_bid_offer_id_34bfab58;
       public            postgres    false    242            9           1259    16720 4   barter_and_inventory_offerbid_created_by_id_6bae4fd4    INDEX     �   CREATE INDEX barter_and_inventory_offerbid_created_by_id_6bae4fd4 ON public.barter_and_inventory_offerbid USING btree (created_by_id);
 H   DROP INDEX public.barter_and_inventory_offerbid_created_by_id_6bae4fd4;
       public            postgres    false    242            :           1259    16721 /   barter_and_inventory_offerbid_offer_id_7253aade    INDEX     }   CREATE INDEX barter_and_inventory_offerbid_offer_id_7253aade ON public.barter_and_inventory_offerbid USING btree (offer_id);
 C   DROP INDEX public.barter_and_inventory_offerbid_offer_id_7253aade;
       public            postgres    false    242            =           1259    16722 4   barter_and_inventory_offerbid_updated_by_id_edb84df8    INDEX     �   CREATE INDEX barter_and_inventory_offerbid_updated_by_id_edb84df8 ON public.barter_and_inventory_offerbid USING btree (updated_by_id);
 H   DROP INDEX public.barter_and_inventory_offerbid_updated_by_id_edb84df8;
       public            postgres    false    242            2           1259    16688 8   barter_and_inventory_offerproduct_created_by_id_a25efb28    INDEX     �   CREATE INDEX barter_and_inventory_offerproduct_created_by_id_a25efb28 ON public.barter_and_inventory_offerproduct USING btree (created_by_id);
 L   DROP INDEX public.barter_and_inventory_offerproduct_created_by_id_a25efb28;
       public            postgres    false    240            3           1259    16689 3   barter_and_inventory_offerproduct_offer_id_0b5c77d2    INDEX     �   CREATE INDEX barter_and_inventory_offerproduct_offer_id_0b5c77d2 ON public.barter_and_inventory_offerproduct USING btree (offer_id);
 G   DROP INDEX public.barter_and_inventory_offerproduct_offer_id_0b5c77d2;
       public            postgres    false    240            6           1259    16690 5   barter_and_inventory_offerproduct_product_id_5ca8b203    INDEX     �   CREATE INDEX barter_and_inventory_offerproduct_product_id_5ca8b203 ON public.barter_and_inventory_offerproduct USING btree (product_id);
 I   DROP INDEX public.barter_and_inventory_offerproduct_product_id_5ca8b203;
       public            postgres    false    240            7           1259    16691 8   barter_and_inventory_offerproduct_updated_by_id_c2686367    INDEX     �   CREATE INDEX barter_and_inventory_offerproduct_updated_by_id_c2686367 ON public.barter_and_inventory_offerproduct USING btree (updated_by_id);
 L   DROP INDEX public.barter_and_inventory_offerproduct_updated_by_id_c2686367;
       public            postgres    false    240            %           1259    16644 /   barter_and_inventory_produ_category_id_14dc9b0a    INDEX     �   CREATE INDEX barter_and_inventory_produ_category_id_14dc9b0a ON public.barter_and_inventory_product_product_categories USING btree (category_id);
 C   DROP INDEX public.barter_and_inventory_produ_category_id_14dc9b0a;
       public            postgres    false    234            &           1259    16643 .   barter_and_inventory_produ_product_id_85483e23    INDEX     �   CREATE INDEX barter_and_inventory_produ_product_id_85483e23 ON public.barter_and_inventory_product_product_categories USING btree (product_id);
 B   DROP INDEX public.barter_and_inventory_produ_product_id_85483e23;
       public            postgres    false    234                       1259    16629 3   barter_and_inventory_product_created_by_id_6d781cb0    INDEX     �   CREATE INDEX barter_and_inventory_product_created_by_id_6d781cb0 ON public.barter_and_inventory_product USING btree (created_by_id);
 G   DROP INDEX public.barter_and_inventory_product_created_by_id_6d781cb0;
       public            postgres    false    232            "           1259    16630 3   barter_and_inventory_product_updated_by_id_4ee0660e    INDEX     �   CREATE INDEX barter_and_inventory_product_updated_by_id_4ee0660e ON public.barter_and_inventory_product USING btree (updated_by_id);
 G   DROP INDEX public.barter_and_inventory_product_updated_by_id_4ee0660e;
       public            postgres    false    232            -           1259    16665 :   barter_and_inventory_productpicture_created_by_id_64625439    INDEX     �   CREATE INDEX barter_and_inventory_productpicture_created_by_id_64625439 ON public.barter_and_inventory_productpicture USING btree (created_by_id);
 N   DROP INDEX public.barter_and_inventory_productpicture_created_by_id_64625439;
       public            postgres    false    238            0           1259    16666 7   barter_and_inventory_productpicture_product_id_0c641654    INDEX     �   CREATE INDEX barter_and_inventory_productpicture_product_id_0c641654 ON public.barter_and_inventory_productpicture USING btree (product_id);
 K   DROP INDEX public.barter_and_inventory_productpicture_product_id_0c641654;
       public            postgres    false    238            1           1259    16667 :   barter_and_inventory_productpicture_updated_by_id_4171cfe0    INDEX     �   CREATE INDEX barter_and_inventory_productpicture_updated_by_id_4171cfe0 ON public.barter_and_inventory_productpicture USING btree (updated_by_id);
 N   DROP INDEX public.barter_and_inventory_productpicture_updated_by_id_4171cfe0;
       public            postgres    false    238                       1259    16520 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    226                       1259    16521 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    226            >           1259    16732 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    243            A           1259    16731 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    243            D           2606    16464 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    214    3317    218            C           2606    16459 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    218    216    3322            B           2606    16450 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3312    214    212            F           2606    16479 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3322    216    222            E           2606    16474 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    220    222    3330            H           2606    16493 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3317    214    224            G           2606    16488 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    224    220    3330            \           2606    16699 U   barter_and_inventory_offerbid barter_and_inventory_bid_offer_id_34bfab58_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerbid
    ADD CONSTRAINT barter_and_inventory_bid_offer_id_34bfab58_fk_barter_an FOREIGN KEY (bid_offer_id) REFERENCES public.barter_and_inventory_offer(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.barter_and_inventory_offerbid DROP CONSTRAINT barter_and_inventory_bid_offer_id_34bfab58_fk_barter_an;
       public          postgres    false    3357    242    230            S           2606    16638 f   barter_and_inventory_product_product_categories barter_and_inventory_category_id_14dc9b0a_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories
    ADD CONSTRAINT barter_and_inventory_category_id_14dc9b0a_fk_barter_an FOREIGN KEY (category_id) REFERENCES public.barter_and_inventory_category(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories DROP CONSTRAINT barter_and_inventory_category_id_14dc9b0a_fk_barter_an;
       public          postgres    false    228    3352    234            M           2606    16601 S   barter_and_inventory_offer barter_and_inventory_created_by_id_3db75016_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offer
    ADD CONSTRAINT barter_and_inventory_created_by_id_3db75016_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.barter_and_inventory_offer DROP CONSTRAINT barter_and_inventory_created_by_id_3db75016_fk_auth_user;
       public          postgres    false    220    3330    230            U           2606    16650 \   barter_and_inventory_productpicture barter_and_inventory_created_by_id_64625439_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_productpicture
    ADD CONSTRAINT barter_and_inventory_created_by_id_64625439_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_productpicture DROP CONSTRAINT barter_and_inventory_created_by_id_64625439_fk_auth_user;
       public          postgres    false    3330    220    238            ]           2606    16704 V   barter_and_inventory_offerbid barter_and_inventory_created_by_id_6bae4fd4_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerbid
    ADD CONSTRAINT barter_and_inventory_created_by_id_6bae4fd4_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_offerbid DROP CONSTRAINT barter_and_inventory_created_by_id_6bae4fd4_fk_auth_user;
       public          postgres    false    220    242    3330            P           2606    16619 U   barter_and_inventory_product barter_and_inventory_created_by_id_6d781cb0_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_product
    ADD CONSTRAINT barter_and_inventory_created_by_id_6d781cb0_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.barter_and_inventory_product DROP CONSTRAINT barter_and_inventory_created_by_id_6d781cb0_fk_auth_user;
       public          postgres    false    3330    232    220            X           2606    16668 Z   barter_and_inventory_offerproduct barter_and_inventory_created_by_id_a25efb28_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct
    ADD CONSTRAINT barter_and_inventory_created_by_id_a25efb28_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct DROP CONSTRAINT barter_and_inventory_created_by_id_a25efb28_fk_auth_user;
       public          postgres    false    220    3330    240            K           2606    16589 V   barter_and_inventory_category barter_and_inventory_created_by_id_c0c3bcb5_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_category
    ADD CONSTRAINT barter_and_inventory_created_by_id_c0c3bcb5_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_category DROP CONSTRAINT barter_and_inventory_created_by_id_c0c3bcb5_fk_auth_user;
       public          postgres    false    228    3330    220            N           2606    16606 W   barter_and_inventory_offer barter_and_inventory_exchanged_with_id_bf64bbb7_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offer
    ADD CONSTRAINT barter_and_inventory_exchanged_with_id_bf64bbb7_fk_barter_an FOREIGN KEY (exchanged_with_id) REFERENCES public.barter_and_inventory_offer(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_offer DROP CONSTRAINT barter_and_inventory_exchanged_with_id_bf64bbb7_fk_barter_an;
       public          postgres    false    230    3357    230            Y           2606    16673 U   barter_and_inventory_offerproduct barter_and_inventory_offer_id_0b5c77d2_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct
    ADD CONSTRAINT barter_and_inventory_offer_id_0b5c77d2_fk_barter_an FOREIGN KEY (offer_id) REFERENCES public.barter_and_inventory_offer(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.barter_and_inventory_offerproduct DROP CONSTRAINT barter_and_inventory_offer_id_0b5c77d2_fk_barter_an;
       public          postgres    false    240    3357    230            ^           2606    16709 Q   barter_and_inventory_offerbid barter_and_inventory_offer_id_7253aade_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerbid
    ADD CONSTRAINT barter_and_inventory_offer_id_7253aade_fk_barter_an FOREIGN KEY (offer_id) REFERENCES public.barter_and_inventory_offer(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.barter_and_inventory_offerbid DROP CONSTRAINT barter_and_inventory_offer_id_7253aade_fk_barter_an;
       public          postgres    false    3357    242    230            V           2606    16655 Y   barter_and_inventory_productpicture barter_and_inventory_product_id_0c641654_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_productpicture
    ADD CONSTRAINT barter_and_inventory_product_id_0c641654_fk_barter_an FOREIGN KEY (product_id) REFERENCES public.barter_and_inventory_product(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_productpicture DROP CONSTRAINT barter_and_inventory_product_id_0c641654_fk_barter_an;
       public          postgres    false    238    232    3361            Z           2606    16678 W   barter_and_inventory_offerproduct barter_and_inventory_product_id_5ca8b203_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct
    ADD CONSTRAINT barter_and_inventory_product_id_5ca8b203_fk_barter_an FOREIGN KEY (product_id) REFERENCES public.barter_and_inventory_product(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct DROP CONSTRAINT barter_and_inventory_product_id_5ca8b203_fk_barter_an;
       public          postgres    false    240    3361    232            R           2606    16633 e   barter_and_inventory_product_product_categories barter_and_inventory_product_id_85483e23_fk_barter_an    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories
    ADD CONSTRAINT barter_and_inventory_product_id_85483e23_fk_barter_an FOREIGN KEY (product_id) REFERENCES public.barter_and_inventory_product(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_product_product_categories DROP CONSTRAINT barter_and_inventory_product_id_85483e23_fk_barter_an;
       public          postgres    false    234    232    3361            T           2606    16645 Z   barter_and_inventory_profile barter_and_inventory_profile_user_id_f79ef985_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_profile
    ADD CONSTRAINT barter_and_inventory_profile_user_id_f79ef985_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_profile DROP CONSTRAINT barter_and_inventory_profile_user_id_f79ef985_fk_auth_user_id;
       public          postgres    false    236    220    3330            W           2606    16660 \   barter_and_inventory_productpicture barter_and_inventory_updated_by_id_4171cfe0_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_productpicture
    ADD CONSTRAINT barter_and_inventory_updated_by_id_4171cfe0_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_productpicture DROP CONSTRAINT barter_and_inventory_updated_by_id_4171cfe0_fk_auth_user;
       public          postgres    false    220    238    3330            Q           2606    16624 U   barter_and_inventory_product barter_and_inventory_updated_by_id_4ee0660e_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_product
    ADD CONSTRAINT barter_and_inventory_updated_by_id_4ee0660e_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.barter_and_inventory_product DROP CONSTRAINT barter_and_inventory_updated_by_id_4ee0660e_fk_auth_user;
       public          postgres    false    232    3330    220            L           2606    16594 V   barter_and_inventory_category barter_and_inventory_updated_by_id_9b6148e4_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_category
    ADD CONSTRAINT barter_and_inventory_updated_by_id_9b6148e4_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_category DROP CONSTRAINT barter_and_inventory_updated_by_id_9b6148e4_fk_auth_user;
       public          postgres    false    228    220    3330            [           2606    16683 Z   barter_and_inventory_offerproduct barter_and_inventory_updated_by_id_c2686367_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct
    ADD CONSTRAINT barter_and_inventory_updated_by_id_c2686367_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_offerproduct DROP CONSTRAINT barter_and_inventory_updated_by_id_c2686367_fk_auth_user;
       public          postgres    false    3330    240    220            _           2606    16714 V   barter_and_inventory_offerbid barter_and_inventory_updated_by_id_edb84df8_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offerbid
    ADD CONSTRAINT barter_and_inventory_updated_by_id_edb84df8_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.barter_and_inventory_offerbid DROP CONSTRAINT barter_and_inventory_updated_by_id_edb84df8_fk_auth_user;
       public          postgres    false    220    3330    242            O           2606    16611 S   barter_and_inventory_offer barter_and_inventory_updated_by_id_f03ed31f_fk_auth_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.barter_and_inventory_offer
    ADD CONSTRAINT barter_and_inventory_updated_by_id_f03ed31f_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.barter_and_inventory_offer DROP CONSTRAINT barter_and_inventory_updated_by_id_f03ed31f_fk_auth_user;
       public          postgres    false    3330    230    220            I           2606    16510 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3312    226    212            J           2606    16515 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    220    226    3330            �      x������ � �      �      x������ � �      �     x�m�ێ�0�����	��C ���>@�*N)�!����9��a�����{;�Ź�{�q��Oܲ���a�K@.����� ��=��[� ��?��5l��ӟ����JP��rD;Ŷ�ϰ(��N	��;��mJ���@�}8h9:G/D�v"u)E� ���^�8��Oj}?���h����8��xW�Öo��q^^��?�5`�[����(d�������� �t���AW�4y=3i�SY������xK�0����������y��+��Ơ
��r��t��^���@+�߾2�sBĤ�TAD�� ��cI�����ev���+_��C�O�I�`4�����g��V]�{t˜�Һ�U�Q"H�2w�8'R��#EYe&l�T��9�t��e~M^~�5�����J�m%ջ�J�n,46s�����c��]5���%�.��D��K�MFu������߇ޅJ��o��C��t?E�j[@��D�X���o���>��T      �   �  x�m�Ms�@�3���Q!3=T�j����T�u+U[����(ʯ�����Y�ҷ���)҅�����.���%�pП������SqZ�Y:�G�z-��>��m.x{�wD�U	3&ay�bW��p��g�m 	)����k	�� y����b�iA5|��g���v��m��qT:?�r��q�t�M��ϩR��.��u>�l�N���-��K�҈JM�����W�����/d�Scc��ެ��%q�Q�Xm5G�ܬ7��Q���<�Eu����F�p�8�!f��c���N�Ѽ�vF�{��J�b��Y@T�Sȧ��W�GO�B��Y�At8~[n�x����?Anîٙ
�0� �~�ـ�^w�Le�j9N{��q�u�v��mi�l�
��l�{���I�������!���g<
�I�n���M��j��Ͳr      �      x������ � �      �      x������ � �      �      x������ � �             x������ � �            x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �         -   x�3�����L��T6�t33��4�2B�YX�Xr�p��qqq ��      �   y   x�m�1�@��z�Z�f޼Y1s��,���X�n�� ���������G�����UL��=A ��M�ͭ��n�M\���P-���<L��Y/Qk8�4�"��k���LגR� ��*z      �   �   x�}�K�0D��ai��	��["�q�8H�=�E�n�oFc�O!��E��E�H��s���r�K��bJ&�#8�Zk:'ʿO�����g�(��F�Y�,38�4T��u�}_���0	����/��Hh�f?�Ej�����n����C��|�      �     x���ю� �k���d7̀}�M��K��"6۷?�#��b�o�|~Ɓ�uc0c���!�m���� }|C�C��#��� �K�#%����!�\�VD+�v|���(a�b�*T�;ǎ�Uy3��Q��tוA�L^�zgb��m�nT�^�U��l�(r�|�+=L=m/��F�z0E�$iM����j2~��6�j�?�7�9���A-hJLd�n�2Ǉ��BH�$3���qk�M��p�@ ���^�a�	����I�4��R��a/��oנ� �C*Er���l]to;��o#a�w^f��ygh��eiE1�g�sNE�X�䯼^ҚZ�<iuҀl�ٻezM�4 ��e�q5y�s}֝�$�23y��w�����F�&q���~U��ŭr��������E���]%�ޝlo�Ķz]ehҜ!�E�r��񟶼�xM�v��E� W����F��G�]�N;,u���[ڠ�=�e>~���i5�m�^B;�*?���?Ik�	           x��m�B@  �����F���|#{:I,��͘
-I�d�_�#�\4��������[3\!��1�d�{öbl-K+�y:��z\�����U�y]O1x�U�g��s�BMg.�_��M~��=��9�N �_N���x�}~x�[�m�Z�L�G�g�\�Ts��XZM�+j��J6���Cd���f�Ύ�v��ڑ��E߇°�}����^8nM���R�6	�d��we��f{��}/��>��L �X���`���Mj@�	����3U���]�     