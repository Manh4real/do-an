--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id bigint NOT NULL,
    category_name character varying(50)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colors (
    color_id bigint NOT NULL,
    color_name character varying(10) NOT NULL,
    color_code character varying(10)
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.color_id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    district_id bigint NOT NULL,
    district_code_name character varying(50),
    district_name character varying(50),
    division_type character varying(30),
    province_id bigint
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- Name: districts_district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.districts_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_district_id_seq OWNER TO postgres;

--
-- Name: districts_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.districts_district_id_seq OWNED BY public.districts.district_id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    favorite_id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL,
    color_id bigint NOT NULL,
    size character(5) NOT NULL,
    size_id bigint
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.favorite_id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    image_id bigint NOT NULL,
    url text NOT NULL,
    product_id bigint NOT NULL,
    product_color_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.image_id;


--
-- Name: images_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_product_id_seq OWNER TO postgres;

--
-- Name: images_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_product_id_seq OWNED BY public.images.product_id;


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    manufacturer_id bigint NOT NULL,
    manufacturer_name character(50) DEFAULT 'Nike Co.'::bpchar,
    brand_name character(20) DEFAULT 'Nike'::bpchar
);


ALTER TABLE public.manufacturers OWNER TO postgres;

--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manufacturers_id_seq OWNER TO postgres;

--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.manufacturer_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_item_id bigint NOT NULL,
    order_id bigint,
    product_id bigint,
    color_id bigint,
    quantity integer DEFAULT 1,
    total_price integer DEFAULT 0,
    size character(5),
    size_id bigint
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_order_item_id_seq OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;


--
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_statuses (
    order_status_id bigint NOT NULL,
    order_status_name character varying(20)
);


ALTER TABLE public.order_statuses OWNER TO postgres;

--
-- Name: order_statuses_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_statuses_order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_statuses_order_status_id_seq OWNER TO postgres;

--
-- Name: order_statuses_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_statuses_order_status_id_seq OWNED BY public.order_statuses.order_status_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    user_id bigint NOT NULL,
    address character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    receiver character varying(20) NOT NULL,
    email character varying(50),
    est_arrived_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_DATE,
    total_price double precision DEFAULT 0 NOT NULL,
    status character varying(20) DEFAULT 'prepared'::character varying,
    order_status_id bigint DEFAULT 1,
    payment text DEFAULT ''::text,
    payment_status_id bigint DEFAULT 0,
    payment_method_id bigint DEFAULT 2,
    CONSTRAINT orders_status_check CHECK ((((status)::text = 'prepared'::text) OR ((status)::text = 'ready'::text) OR ((status)::text = 'canceled'::text) OR ((status)::text = 'delivering'::text) OR ((status)::text = 'delivered'::text) OR ((status)::text = 'done'::text)))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    payment_method_id bigint NOT NULL,
    payment_method_name character varying(50)
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_payment_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_payment_method_id_seq OWNER TO postgres;

--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_payment_method_id_seq OWNED BY public.payment_methods.payment_method_id;


--
-- Name: payment_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_statuses (
    payment_status_id bigint NOT NULL,
    payment_status_name character varying(30)
);


ALTER TABLE public.payment_statuses OWNER TO postgres;

--
-- Name: payment_statuses_payment_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_statuses_payment_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_statuses_payment_status_id_seq OWNER TO postgres;

--
-- Name: payment_statuses_payment_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_statuses_payment_status_id_seq OWNED BY public.payment_statuses.payment_status_id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    product_category_id bigint NOT NULL,
    category_id bigint DEFAULT 1 NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_categories_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_product_category_id_seq OWNER TO postgres;

--
-- Name: product_categories_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_product_category_id_seq OWNED BY public.product_categories.product_category_id;


--
-- Name: product_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_statuses (
    product_status_id bigint NOT NULL,
    product_status_name character varying(20),
    product_status_desc character varying(100) DEFAULT ''::character varying
);


ALTER TABLE public.product_statuses OWNER TO postgres;

--
-- Name: product_statuses_product_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_statuses_product_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_statuses_product_status_id_seq OWNER TO postgres;

--
-- Name: product_statuses_product_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_statuses_product_status_id_seq OWNED BY public.product_statuses.product_status_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id bigint NOT NULL,
    category character varying(50) NOT NULL,
    product_name character varying(50) NOT NULL,
    type character(20) NOT NULL,
    gender character(10) NOT NULL,
    target character(20) NOT NULL,
    color_num integer NOT NULL,
    price double precision NOT NULL,
    on_sale boolean NOT NULL,
    old_price double precision,
    sizes character(50) NOT NULL,
    sales integer DEFAULT 0,
    quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    description text DEFAULT ''::text,
    manufacturer_id bigint,
    style_id bigint DEFAULT 2,
    type_id bigint,
    size_type_id bigint DEFAULT 2,
    product_status_id bigint DEFAULT 1
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.product_id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    province_id bigint NOT NULL,
    province_code_name character varying(50),
    province_name character varying(50),
    division_type character varying(30),
    phone_code integer
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_province_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinces_province_id_seq OWNER TO postgres;

--
-- Name: provinces_province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_province_id_seq OWNED BY public.provinces.province_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    product_id bigint NOT NULL,
    user_id bigint NOT NULL,
    review character varying(500) DEFAULT ''::character varying NOT NULL,
    rating integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    title character varying(50) DEFAULT ''::character varying
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id bigint NOT NULL,
    role_name character varying(20)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: size_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size_types (
    size_type_id bigint NOT NULL,
    size_type_name character varying(20)
);


ALTER TABLE public.size_types OWNER TO postgres;

--
-- Name: size_types_size_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.size_types_size_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.size_types_size_type_id_seq OWNER TO postgres;

--
-- Name: size_types_size_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.size_types_size_type_id_seq OWNED BY public.size_types.size_type_id;


--
-- Name: sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sizes (
    size_id bigint NOT NULL,
    size character varying(5),
    size_type_id bigint DEFAULT 2
);


ALTER TABLE public.sizes OWNER TO postgres;

--
-- Name: sizes_size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sizes_size_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sizes_size_id_seq OWNER TO postgres;

--
-- Name: sizes_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sizes_size_id_seq OWNED BY public.sizes.size_id;


--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stock_id bigint NOT NULL,
    product_id bigint,
    color_id bigint,
    size_id bigint,
    quantity integer DEFAULT 0
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_stock_id_seq OWNER TO postgres;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock.stock_id;


--
-- Name: styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.styles (
    style_id bigint NOT NULL,
    style_name character varying(20)
);


ALTER TABLE public.styles OWNER TO postgres;

--
-- Name: styles_style_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.styles_style_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.styles_style_id_seq OWNER TO postgres;

--
-- Name: styles_style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.styles_style_id_seq OWNED BY public.styles.style_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    type_id bigint NOT NULL,
    type_name character varying(30) DEFAULT ''::character varying
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_type_id_seq OWNER TO postgres;

--
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_type_id_seq OWNED BY public.types.type_id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    email character(50) NOT NULL,
    password text NOT NULL,
    first_name character(10),
    last_name character(10),
    birthday date,
    country character(20),
    registration_time bigint NOT NULL,
    with_email boolean DEFAULT false,
    avatar text DEFAULT 'default-avatar.png'::text,
    role character(1) DEFAULT '1'::bpchar,
    CONSTRAINT users_role_check CHECK (((role = '0'::bpchar) OR (role = '1'::bpchar) OR (role = '2'::bpchar)))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.user_id;


--
-- Name: wards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wards (
    ward_id bigint NOT NULL,
    ward_code_name character varying(50),
    ward_name character varying(50),
    division_type character varying(30),
    district_id bigint
);


ALTER TABLE public.wards OWNER TO postgres;

--
-- Name: wards_ward_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wards_ward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wards_ward_id_seq OWNER TO postgres;

--
-- Name: wards_ward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wards_ward_id_seq OWNED BY public.wards.ward_id;


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: colors color_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors ALTER COLUMN color_id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: districts district_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts ALTER COLUMN district_id SET DEFAULT nextval('public.districts_district_id_seq'::regclass);


--
-- Name: favorites favorite_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN favorite_id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: images image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN image_id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: images product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN product_id SET DEFAULT nextval('public.images_product_id_seq'::regclass);


--
-- Name: manufacturers manufacturer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN manufacturer_id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


--
-- Name: order_items order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);


--
-- Name: order_statuses order_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_statuses_order_status_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: payment_methods payment_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_methods_payment_method_id_seq'::regclass);


--
-- Name: payment_statuses payment_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_statuses ALTER COLUMN payment_status_id SET DEFAULT nextval('public.payment_statuses_payment_status_id_seq'::regclass);


--
-- Name: product_categories product_category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN product_category_id SET DEFAULT nextval('public.product_categories_product_category_id_seq'::regclass);


--
-- Name: product_statuses product_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_statuses ALTER COLUMN product_status_id SET DEFAULT nextval('public.product_statuses_product_status_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: provinces province_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN province_id SET DEFAULT nextval('public.provinces_province_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: size_types size_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_types ALTER COLUMN size_type_id SET DEFAULT nextval('public.size_types_size_type_id_seq'::regclass);


--
-- Name: sizes size_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes ALTER COLUMN size_id SET DEFAULT nextval('public.sizes_size_id_seq'::regclass);


--
-- Name: stock stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN stock_id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);


--
-- Name: styles style_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.styles ALTER COLUMN style_id SET DEFAULT nextval('public.styles_style_id_seq'::regclass);


--
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.type_type_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wards ward_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards ALTER COLUMN ward_id SET DEFAULT nextval('public.wards_ward_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Just In
2	Best Seller
3	Classic
4	Best for Sports
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colors (color_id, color_name, color_code) FROM stdin;
1	black	000000
2	blue	3f83f8
3	red	e02424
4	yellow	faca15
5	white	ffffff
6	grey	808080
7	pink	e74694
8	dark blue	233876
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (district_id, district_code_name, district_name, division_type, province_id) FROM stdin;
1	quan_ba_dinh	Quận Ba Đình	quận	1
2	quan_hoan_kiem	Quận Hoàn Kiếm	quận	1
3	quan_tay_ho	Quận Tây Hồ	quận	1
4	quan_long_bien	Quận Long Biên	quận	1
5	quan_cau_giay	Quận Cầu Giấy	quận	1
6	quan_dong_da	Quận Đống Đa	quận	1
7	quan_hai_ba_trung	Quận Hai Bà Trưng	quận	1
8	quan_hoang_mai	Quận Hoàng Mai	quận	1
9	quan_thanh_xuan	Quận Thanh Xuân	quận	1
16	huyen_soc_son	Huyện Sóc Sơn	huyện	1
17	huyen_dong_anh	Huyện Đông Anh	huyện	1
18	huyen_gia_lam	Huyện Gia Lâm	huyện	1
19	quan_nam_tu_liem	Quận Nam Từ Liêm	quận	1
20	huyen_thanh_tri	Huyện Thanh Trì	huyện	1
21	quan_bac_tu_liem	Quận Bắc Từ Liêm	quận	1
250	huyen_me_linh	Huyện Mê Linh	huyện	1
268	quan_ha_dong	Quận Hà Đông	quận	1
269	thi_xa_son_tay	Thị xã Sơn Tây	thị xã	1
271	huyen_ba_vi	Huyện Ba Vì	huyện	1
272	huyen_phuc_tho	Huyện Phúc Thọ	huyện	1
273	huyen_dan_phuong	Huyện Đan Phượng	huyện	1
274	huyen_hoai_duc	Huyện Hoài Đức	huyện	1
275	huyen_quoc_oai	Huyện Quốc Oai	huyện	1
276	huyen_thach_that	Huyện Thạch Thất	huyện	1
277	huyen_chuong_my	Huyện Chương Mỹ	huyện	1
278	huyen_thanh_oai	Huyện Thanh Oai	huyện	1
279	huyen_thuong_tin	Huyện Thường Tín	huyện	1
280	huyen_phu_xuyen	Huyện Phú Xuyên	huyện	1
281	huyen_ung_hoa	Huyện Ứng Hòa	huyện	1
282	huyen_my_duc	Huyện Mỹ Đức	huyện	1
24	thanh_pho_ha_giang	Thành phố Hà Giang	thành phố	2
26	huyen_dong_van	Huyện Đồng Văn	huyện	2
27	huyen_meo_vac	Huyện Mèo Vạc	huyện	2
28	huyen_yen_minh	Huyện Yên Minh	huyện	2
29	huyen_quan_ba	Huyện Quản Bạ	huyện	2
30	huyen_vi_xuyen	Huyện Vị Xuyên	huyện	2
31	huyen_bac_me	Huyện Bắc Mê	huyện	2
32	huyen_hoang_su_phi	Huyện Hoàng Su Phì	huyện	2
33	huyen_xin_man	Huyện Xín Mần	huyện	2
34	huyen_bac_quang	Huyện Bắc Quang	huyện	2
35	huyen_quang_binh	Huyện Quang Bình	huyện	2
40	thanh_pho_cao_bang	Thành phố Cao Bằng	thành phố	4
42	huyen_bao_lam	Huyện Bảo Lâm	huyện	4
43	huyen_bao_lac	Huyện Bảo Lạc	huyện	4
45	huyen_ha_quang	Huyện Hà Quảng	huyện	4
47	huyen_trung_khanh	Huyện Trùng Khánh	huyện	4
48	huyen_ha_lang	Huyện Hạ Lang	huyện	4
49	huyen_quang_hoa	Huyện Quảng Hòa	huyện	4
51	huyen_hoa_an	Huyện Hoà An	huyện	4
52	huyen_nguyen_binh	Huyện Nguyên Bình	huyện	4
53	huyen_thach_an	Huyện Thạch An	huyện	4
58	thanh_pho_bac_kan	Thành Phố Bắc Kạn	thành phố	6
60	huyen_pac_nam	Huyện Pác Nặm	huyện	6
61	huyen_ba_be	Huyện Ba Bể	huyện	6
62	huyen_ngan_son	Huyện Ngân Sơn	huyện	6
63	huyen_bach_thong	Huyện Bạch Thông	huyện	6
64	huyen_cho_don	Huyện Chợ Đồn	huyện	6
65	huyen_cho_moi	Huyện Chợ Mới	huyện	6
66	huyen_na_ri	Huyện Na Rì	huyện	6
70	thanh_pho_tuyen_quang	Thành phố Tuyên Quang	thành phố	8
71	huyen_lam_binh	Huyện Lâm Bình	huyện	8
72	huyen_na_hang	Huyện Na Hang	huyện	8
73	huyen_chiem_hoa	Huyện Chiêm Hóa	huyện	8
74	huyen_ham_yen	Huyện Hàm Yên	huyện	8
75	huyen_yen_son	Huyện Yên Sơn	huyện	8
76	huyen_son_duong	Huyện Sơn Dương	huyện	8
80	thanh_pho_lao_cai	Thành phố Lào Cai	thành phố	10
82	huyen_bat_xat	Huyện Bát Xát	huyện	10
83	huyen_muong_khuong	Huyện Mường Khương	huyện	10
84	huyen_si_ma_cai	Huyện Si Ma Cai	huyện	10
85	huyen_bac_ha	Huyện Bắc Hà	huyện	10
86	huyen_bao_thang	Huyện Bảo Thắng	huyện	10
87	huyen_bao_yen	Huyện Bảo Yên	huyện	10
88	thi_xa_sa_pa	Thị xã Sa Pa	thị xã	10
89	huyen_van_ban	Huyện Văn Bàn	huyện	10
94	thanh_pho_dien_bien_phu	Thành phố Điện Biên Phủ	thành phố	11
95	thi_xa_muong_lay	Thị xã Mường Lay	thị xã	11
96	huyen_muong_nhe	Huyện Mường Nhé	huyện	11
97	huyen_muong_cha	Huyện Mường Chà	huyện	11
98	huyen_tua_chua	Huyện Tủa Chùa	huyện	11
99	huyen_tuan_giao	Huyện Tuần Giáo	huyện	11
100	huyen_dien_bien	Huyện Điện Biên	huyện	11
101	huyen_dien_bien_dong	Huyện Điện Biên Đông	huyện	11
102	huyen_muong_ang	Huyện Mường Ảng	huyện	11
103	huyen_nam_po	Huyện Nậm Pồ	huyện	11
105	thanh_pho_lai_chau	Thành phố Lai Châu	thành phố	12
106	huyen_tam_duong	Huyện Tam Đường	huyện	12
107	huyen_muong_te	Huyện Mường Tè	huyện	12
108	huyen_sin_ho	Huyện Sìn Hồ	huyện	12
109	huyen_phong_tho	Huyện Phong Thổ	huyện	12
110	huyen_than_uyen	Huyện Than Uyên	huyện	12
111	huyen_tan_uyen	Huyện Tân Uyên	huyện	12
112	huyen_nam_nhun	Huyện Nậm Nhùn	huyện	12
116	thanh_pho_son_la	Thành phố Sơn La	thành phố	14
118	huyen_quynh_nhai	Huyện Quỳnh Nhai	huyện	14
119	huyen_thuan_chau	Huyện Thuận Châu	huyện	14
120	huyen_muong_la	Huyện Mường La	huyện	14
121	huyen_bac_yen	Huyện Bắc Yên	huyện	14
122	huyen_phu_yen	Huyện Phù Yên	huyện	14
123	huyen_moc_chau	Huyện Mộc Châu	huyện	14
124	huyen_yen_chau	Huyện Yên Châu	huyện	14
125	huyen_mai_son	Huyện Mai Sơn	huyện	14
126	huyen_song_ma	Huyện Sông Mã	huyện	14
127	huyen_sop_cop	Huyện Sốp Cộp	huyện	14
128	huyen_van_ho	Huyện Vân Hồ	huyện	14
132	thanh_pho_yen_bai	Thành phố Yên Bái	thành phố	15
133	thi_xa_nghia_lo	Thị xã Nghĩa Lộ	thị xã	15
135	huyen_luc_yen	Huyện Lục Yên	huyện	15
136	huyen_van_yen	Huyện Văn Yên	huyện	15
137	huyen_mu_cang_chai	Huyện Mù Căng Chải	huyện	15
138	huyen_tran_yen	Huyện Trấn Yên	huyện	15
139	huyen_tram_tau	Huyện Trạm Tấu	huyện	15
140	huyen_van_chan	Huyện Văn Chấn	huyện	15
141	huyen_yen_binh	Huyện Yên Bình	huyện	15
148	thanh_pho_hoa_binh	Thành phố Hòa Bình	thành phố	17
150	huyen_da_bac	Huyện Đà Bắc	huyện	17
152	huyen_luong_son	Huyện Lương Sơn	huyện	17
153	huyen_kim_boi	Huyện Kim Bôi	huyện	17
154	huyen_cao_phong	Huyện Cao Phong	huyện	17
155	huyen_tan_lac	Huyện Tân Lạc	huyện	17
156	huyen_mai_chau	Huyện Mai Châu	huyện	17
157	huyen_lac_son	Huyện Lạc Sơn	huyện	17
158	huyen_yen_thuy	Huyện Yên Thủy	huyện	17
159	huyen_lac_thuy	Huyện Lạc Thủy	huyện	17
164	thanh_pho_thai_nguyen	Thành phố Thái Nguyên	thành phố	19
165	thanh_pho_song_cong	Thành phố Sông Công	thành phố	19
167	huyen_dinh_hoa	Huyện Định Hóa	huyện	19
168	huyen_phu_luong	Huyện Phú Lương	huyện	19
169	huyen_dong_hy	Huyện Đồng Hỷ	huyện	19
170	huyen_vo_nhai	Huyện Võ Nhai	huyện	19
171	huyen_dai_tu	Huyện Đại Từ	huyện	19
172	thi_xa_pho_yen	Thị xã Phổ Yên	thị xã	19
173	huyen_phu_binh	Huyện Phú Bình	huyện	19
178	thanh_pho_lang_son	Thành phố Lạng Sơn	thành phố	20
180	huyen_trang_dinh	Huyện Tràng Định	huyện	20
181	huyen_binh_gia	Huyện Bình Gia	huyện	20
182	huyen_van_lang	Huyện Văn Lãng	huyện	20
183	huyen_cao_loc	Huyện Cao Lộc	huyện	20
184	huyen_van_quan	Huyện Văn Quan	huyện	20
185	huyen_bac_son	Huyện Bắc Sơn	huyện	20
186	huyen_huu_lung	Huyện Hữu Lũng	huyện	20
187	huyen_chi_lang	Huyện Chi Lăng	huyện	20
188	huyen_loc_binh	Huyện Lộc Bình	huyện	20
189	huyen_dinh_lap	Huyện Đình Lập	huyện	20
193	thanh_pho_ha_long	Thành phố Hạ Long	thành phố	22
194	thanh_pho_mong_cai	Thành phố Móng Cái	thành phố	22
195	thanh_pho_cam_pha	Thành phố Cẩm Phả	thành phố	22
196	thanh_pho_uong_bi	Thành phố Uông Bí	thành phố	22
198	huyen_binh_lieu	Huyện Bình Liêu	huyện	22
199	huyen_tien_yen	Huyện Tiên Yên	huyện	22
200	huyen_dam_ha	Huyện Đầm Hà	huyện	22
201	huyen_hai_ha	Huyện Hải Hà	huyện	22
202	huyen_ba_che	Huyện Ba Chẽ	huyện	22
203	huyen_van_don	Huyện Vân Đồn	huyện	22
205	thi_xa_dong_trieu	Thị xã Đông Triều	thị xã	22
206	thi_xa_quang_yen	Thị xã Quảng Yên	thị xã	22
207	huyen_co_to	Huyện Cô Tô	huyện	22
213	thanh_pho_bac_giang	Thành phố Bắc Giang	thành phố	24
215	huyen_yen_the	Huyện Yên Thế	huyện	24
216	huyen_tan_yen	Huyện Tân Yên	huyện	24
217	huyen_lang_giang	Huyện Lạng Giang	huyện	24
218	huyen_luc_nam	Huyện Lục Nam	huyện	24
219	huyen_luc_ngan	Huyện Lục Ngạn	huyện	24
220	huyen_son_dong	Huyện Sơn Động	huyện	24
221	huyen_yen_dung	Huyện Yên Dũng	huyện	24
222	huyen_viet_yen	Huyện Việt Yên	huyện	24
223	huyen_hiep_hoa	Huyện Hiệp Hòa	huyện	24
227	thanh_pho_viet_tri	Thành phố Việt Trì	thành phố	25
228	thi_xa_phu_tho	Thị xã Phú Thọ	thị xã	25
230	huyen_doan_hung	Huyện Đoan Hùng	huyện	25
231	huyen_ha_hoa	Huyện Hạ Hoà	huyện	25
232	huyen_thanh_ba	Huyện Thanh Ba	huyện	25
233	huyen_phu_ninh	Huyện Phù Ninh	huyện	25
234	huyen_yen_lap	Huyện Yên Lập	huyện	25
235	huyen_cam_khe	Huyện Cẩm Khê	huyện	25
236	huyen_tam_nong	Huyện Tam Nông	huyện	25
237	huyen_lam_thao	Huyện Lâm Thao	huyện	25
238	huyen_thanh_son	Huyện Thanh Sơn	huyện	25
239	huyen_thanh_thuy	Huyện Thanh Thuỷ	huyện	25
240	huyen_tan_son	Huyện Tân Sơn	huyện	25
243	thanh_pho_vinh_yen	Thành phố Vĩnh Yên	thành phố	26
244	thanh_pho_phuc_yen	Thành phố Phúc Yên	thành phố	26
246	huyen_lap_thach	Huyện Lập Thạch	huyện	26
247	huyen_tam_duong	Huyện Tam Dương	huyện	26
248	huyen_tam_dao	Huyện Tam Đảo	huyện	26
249	huyen_binh_xuyen	Huyện Bình Xuyên	huyện	26
251	huyen_yen_lac	Huyện Yên Lạc	huyện	26
252	huyen_vinh_tuong	Huyện Vĩnh Tường	huyện	26
253	huyen_song_lo	Huyện Sông Lô	huyện	26
256	thanh_pho_bac_ninh	Thành phố Bắc Ninh	thành phố	27
258	huyen_yen_phong	Huyện Yên Phong	huyện	27
259	huyen_que_vo	Huyện Quế Võ	huyện	27
260	huyen_tien_du	Huyện Tiên Du	huyện	27
261	thi_xa_tu_son	Thị xã Từ Sơn	thị xã	27
262	huyen_thuan_thanh	Huyện Thuận Thành	huyện	27
263	huyen_gia_binh	Huyện Gia Bình	huyện	27
264	huyen_luong_tai	Huyện Lương Tài	huyện	27
288	thanh_pho_hai_duong	Thành phố Hải Dương	thành phố	30
290	thanh_pho_chi_linh	Thành phố Chí Linh	thành phố	30
291	huyen_nam_sach	Huyện Nam Sách	huyện	30
292	thi_xa_kinh_mon	Thị xã Kinh Môn	thị xã	30
293	huyen_kim_thanh	Huyện Kim Thành	huyện	30
294	huyen_thanh_ha	Huyện Thanh Hà	huyện	30
295	huyen_cam_giang	Huyện Cẩm Giàng	huyện	30
296	huyen_binh_giang	Huyện Bình Giang	huyện	30
297	huyen_gia_loc	Huyện Gia Lộc	huyện	30
298	huyen_tu_ky	Huyện Tứ Kỳ	huyện	30
299	huyen_ninh_giang	Huyện Ninh Giang	huyện	30
300	huyen_thanh_mien	Huyện Thanh Miện	huyện	30
303	quan_hong_bang	Quận Hồng Bàng	quận	31
304	quan_ngo_quyen	Quận Ngô Quyền	quận	31
305	quan_le_chan	Quận Lê Chân	quận	31
306	quan_hai_an	Quận Hải An	quận	31
307	quan_kien_an	Quận Kiến An	quận	31
308	quan_do_son	Quận Đồ Sơn	quận	31
309	quan_duong_kinh	Quận Dương Kinh	quận	31
311	huyen_thuy_nguyen	Huyện Thuỷ Nguyên	huyện	31
312	huyen_an_duong	Huyện An Dương	huyện	31
313	huyen_an_lao	Huyện An Lão	huyện	31
314	huyen_kien_thuy	Huyện Kiến Thuỵ	huyện	31
315	huyen_tien_lang	Huyện Tiên Lãng	huyện	31
316	huyen_vinh_bao	Huyện Vĩnh Bảo	huyện	31
317	huyen_cat_hai	Huyện Cát Hải	huyện	31
318	huyen_bach_long_vi	Huyện Bạch Long Vĩ	huyện	31
323	thanh_pho_hung_yen	Thành phố Hưng Yên	thành phố	33
325	huyen_van_lam	Huyện Văn Lâm	huyện	33
326	huyen_van_giang	Huyện Văn Giang	huyện	33
327	huyen_yen_my	Huyện Yên Mỹ	huyện	33
328	thi_xa_my_hao	Thị xã Mỹ Hào	thị xã	33
329	huyen_an_thi	Huyện Ân Thi	huyện	33
330	huyen_khoai_chau	Huyện Khoái Châu	huyện	33
331	huyen_kim_dong	Huyện Kim Động	huyện	33
332	huyen_tien_lu	Huyện Tiên Lữ	huyện	33
333	huyen_phu_cu	Huyện Phù Cừ	huyện	33
336	thanh_pho_thai_binh	Thành phố Thái Bình	thành phố	34
338	huyen_quynh_phu	Huyện Quỳnh Phụ	huyện	34
339	huyen_hung_ha	Huyện Hưng Hà	huyện	34
340	huyen_dong_hung	Huyện Đông Hưng	huyện	34
341	huyen_thai_thuy	Huyện Thái Thụy	huyện	34
342	huyen_tien_hai	Huyện Tiền Hải	huyện	34
343	huyen_kien_xuong	Huyện Kiến Xương	huyện	34
344	huyen_vu_thu	Huyện Vũ Thư	huyện	34
347	thanh_pho_phu_ly	Thành phố Phủ Lý	thành phố	35
349	thi_xa_duy_tien	Thị xã Duy Tiên	thị xã	35
350	huyen_kim_bang	Huyện Kim Bảng	huyện	35
351	huyen_thanh_liem	Huyện Thanh Liêm	huyện	35
352	huyen_binh_luc	Huyện Bình Lục	huyện	35
353	huyen_ly_nhan	Huyện Lý Nhân	huyện	35
356	thanh_pho_nam_dinh	Thành phố Nam Định	thành phố	36
358	huyen_my_loc	Huyện Mỹ Lộc	huyện	36
359	huyen_vu_ban	Huyện Vụ Bản	huyện	36
360	huyen_y_yen	Huyện Ý Yên	huyện	36
361	huyen_nghia_hung	Huyện Nghĩa Hưng	huyện	36
362	huyen_nam_truc	Huyện Nam Trực	huyện	36
363	huyen_truc_ninh	Huyện Trực Ninh	huyện	36
364	huyen_xuan_truong	Huyện Xuân Trường	huyện	36
365	huyen_giao_thuy	Huyện Giao Thủy	huyện	36
366	huyen_hai_hau	Huyện Hải Hậu	huyện	36
369	thanh_pho_ninh_binh	Thành phố Ninh Bình	thành phố	37
370	thanh_pho_tam_diep	Thành phố Tam Điệp	thành phố	37
372	huyen_nho_quan	Huyện Nho Quan	huyện	37
373	huyen_gia_vien	Huyện Gia Viễn	huyện	37
374	huyen_hoa_lu	Huyện Hoa Lư	huyện	37
375	huyen_yen_khanh	Huyện Yên Khánh	huyện	37
376	huyen_kim_son	Huyện Kim Sơn	huyện	37
377	huyen_yen_mo	Huyện Yên Mô	huyện	37
380	thanh_pho_thanh_hoa	Thành phố Thanh Hóa	thành phố	38
381	thi_xa_bim_son	Thị xã Bỉm Sơn	thị xã	38
382	thanh_pho_sam_son	Thành phố Sầm Sơn	thành phố	38
384	huyen_muong_lat	Huyện Mường Lát	huyện	38
385	huyen_quan_hoa	Huyện Quan Hóa	huyện	38
386	huyen_ba_thuoc	Huyện Bá Thước	huyện	38
387	huyen_quan_son	Huyện Quan Sơn	huyện	38
388	huyen_lang_chanh	Huyện Lang Chánh	huyện	38
389	huyen_ngoc_lac	Huyện Ngọc Lặc	huyện	38
390	huyen_cam_thuy	Huyện Cẩm Thủy	huyện	38
391	huyen_thach_thanh	Huyện Thạch Thành	huyện	38
392	huyen_ha_trung	Huyện Hà Trung	huyện	38
393	huyen_vinh_loc	Huyện Vĩnh Lộc	huyện	38
394	huyen_yen_dinh	Huyện Yên Định	huyện	38
395	huyen_tho_xuan	Huyện Thọ Xuân	huyện	38
396	huyen_thuong_xuan	Huyện Thường Xuân	huyện	38
397	huyen_trieu_son	Huyện Triệu Sơn	huyện	38
398	huyen_thieu_hoa	Huyện Thiệu Hóa	huyện	38
399	huyen_hoang_hoa	Huyện Hoằng Hóa	huyện	38
400	huyen_hau_loc	Huyện Hậu Lộc	huyện	38
401	huyen_nga_son	Huyện Nga Sơn	huyện	38
402	huyen_nhu_xuan	Huyện Như Xuân	huyện	38
403	huyen_nhu_thanh	Huyện Như Thanh	huyện	38
404	huyen_nong_cong	Huyện Nông Cống	huyện	38
405	huyen_dong_son	Huyện Đông Sơn	huyện	38
406	huyen_quang_xuong	Huyện Quảng Xương	huyện	38
407	thi_xa_nghi_son	Thị xã Nghi Sơn	thị xã	38
412	thanh_pho_vinh	Thành phố Vinh	thành phố	40
413	thi_xa_cua_lo	Thị xã Cửa Lò	thị xã	40
414	thi_xa_thai_hoa	Thị xã Thái Hoà	thị xã	40
415	huyen_que_phong	Huyện Quế Phong	huyện	40
416	huyen_quy_chau	Huyện Quỳ Châu	huyện	40
417	huyen_ky_son	Huyện Kỳ Sơn	huyện	40
418	huyen_tuong_duong	Huyện Tương Dương	huyện	40
419	huyen_nghia_dan	Huyện Nghĩa Đàn	huyện	40
420	huyen_quy_hop	Huyện Quỳ Hợp	huyện	40
421	huyen_quynh_luu	Huyện Quỳnh Lưu	huyện	40
422	huyen_con_cuong	Huyện Con Cuông	huyện	40
423	huyen_tan_ky	Huyện Tân Kỳ	huyện	40
424	huyen_anh_son	Huyện Anh Sơn	huyện	40
425	huyen_dien_chau	Huyện Diễn Châu	huyện	40
426	huyen_yen_thanh	Huyện Yên Thành	huyện	40
427	huyen_do_luong	Huyện Đô Lương	huyện	40
428	huyen_thanh_chuong	Huyện Thanh Chương	huyện	40
429	huyen_nghi_loc	Huyện Nghi Lộc	huyện	40
430	huyen_nam_dan	Huyện Nam Đàn	huyện	40
431	huyen_hung_nguyen	Huyện Hưng Nguyên	huyện	40
432	thi_xa_hoang_mai	Thị xã Hoàng Mai	thị xã	40
436	thanh_pho_ha_tinh	Thành phố Hà Tĩnh	thành phố	42
437	thi_xa_hong_linh	Thị xã Hồng Lĩnh	thị xã	42
439	huyen_huong_son	Huyện Hương Sơn	huyện	42
440	huyen_duc_tho	Huyện Đức Thọ	huyện	42
441	huyen_vu_quang	Huyện Vũ Quang	huyện	42
442	huyen_nghi_xuan	Huyện Nghi Xuân	huyện	42
443	huyen_can_loc	Huyện Can Lộc	huyện	42
444	huyen_huong_khe	Huyện Hương Khê	huyện	42
445	huyen_thach_ha	Huyện Thạch Hà	huyện	42
446	huyen_cam_xuyen	Huyện Cẩm Xuyên	huyện	42
447	huyen_ky_anh	Huyện Kỳ Anh	huyện	42
448	huyen_loc_ha	Huyện Lộc Hà	huyện	42
449	thi_xa_ky_anh	Thị xã Kỳ Anh	thị xã	42
450	thanh_pho_dong_hoi	Thành Phố Đồng Hới	thành phố	44
452	huyen_minh_hoa	Huyện Minh Hóa	huyện	44
453	huyen_tuyen_hoa	Huyện Tuyên Hóa	huyện	44
454	huyen_quang_trach	Huyện Quảng Trạch	huyện	44
455	huyen_bo_trach	Huyện Bố Trạch	huyện	44
456	huyen_quang_ninh	Huyện Quảng Ninh	huyện	44
457	huyen_le_thuy	Huyện Lệ Thủy	huyện	44
458	thi_xa_ba_don	Thị xã Ba Đồn	thị xã	44
461	thanh_pho_dong_ha	Thành phố Đông Hà	thành phố	45
462	thi_xa_quang_tri	Thị xã Quảng Trị	thị xã	45
464	huyen_vinh_linh	Huyện Vĩnh Linh	huyện	45
465	huyen_huong_hoa	Huyện Hướng Hóa	huyện	45
466	huyen_gio_linh	Huyện Gio Linh	huyện	45
467	huyen_da_krong	Huyện Đa Krông	huyện	45
468	huyen_cam_lo	Huyện Cam Lộ	huyện	45
469	huyen_trieu_phong	Huyện Triệu Phong	huyện	45
470	huyen_hai_lang	Huyện Hải Lăng	huyện	45
471	huyen_con_co	Huyện Cồn Cỏ	huyện	45
474	thanh_pho_hue	Thành phố Huế	thành phố	46
476	huyen_phong_dien	Huyện Phong Điền	huyện	46
477	huyen_quang_dien	Huyện Quảng Điền	huyện	46
478	huyen_phu_vang	Huyện Phú Vang	huyện	46
479	thi_xa_huong_thuy	Thị xã Hương Thủy	thị xã	46
480	thi_xa_huong_tra	Thị xã Hương Trà	thị xã	46
481	huyen_a_luoi	Huyện A Lưới	huyện	46
482	huyen_phu_loc	Huyện Phú Lộc	huyện	46
483	huyen_nam_dong	Huyện Nam Đông	huyện	46
490	quan_lien_chieu	Quận Liên Chiểu	quận	48
491	quan_thanh_khe	Quận Thanh Khê	quận	48
492	quan_hai_chau	Quận Hải Châu	quận	48
493	quan_son_tra	Quận Sơn Trà	quận	48
494	quan_ngu_hanh_son	Quận Ngũ Hành Sơn	quận	48
495	quan_cam_le	Quận Cẩm Lệ	quận	48
497	huyen_hoa_vang	Huyện Hòa Vang	huyện	48
498	huyen_hoang_sa	Huyện Hoàng Sa	huyện	48
502	thanh_pho_tam_ky	Thành phố Tam Kỳ	thành phố	49
503	thanh_pho_hoi_an	Thành phố Hội An	thành phố	49
504	huyen_tay_giang	Huyện Tây Giang	huyện	49
505	huyen_dong_giang	Huyện Đông Giang	huyện	49
506	huyen_dai_loc	Huyện Đại Lộc	huyện	49
507	thi_xa_dien_ban	Thị xã Điện Bàn	thị xã	49
508	huyen_duy_xuyen	Huyện Duy Xuyên	huyện	49
509	huyen_que_son	Huyện Quế Sơn	huyện	49
510	huyen_nam_giang	Huyện Nam Giang	huyện	49
511	huyen_phuoc_son	Huyện Phước Sơn	huyện	49
512	huyen_hiep_duc	Huyện Hiệp Đức	huyện	49
513	huyen_thang_binh	Huyện Thăng Bình	huyện	49
514	huyen_tien_phuoc	Huyện Tiên Phước	huyện	49
515	huyen_bac_tra_my	Huyện Bắc Trà My	huyện	49
516	huyen_nam_tra_my	Huyện Nam Trà My	huyện	49
517	huyen_nui_thanh	Huyện Núi Thành	huyện	49
518	huyen_phu_ninh	Huyện Phú Ninh	huyện	49
519	huyen_nong_son	Huyện Nông Sơn	huyện	49
522	thanh_pho_quang_ngai	Thành phố Quảng Ngãi	thành phố	51
524	huyen_binh_son	Huyện Bình Sơn	huyện	51
525	huyen_tra_bong	Huyện Trà Bồng	huyện	51
527	huyen_son_tinh	Huyện Sơn Tịnh	huyện	51
528	huyen_tu_nghia	Huyện Tư Nghĩa	huyện	51
529	huyen_son_ha	Huyện Sơn Hà	huyện	51
530	huyen_son_tay	Huyện Sơn Tây	huyện	51
531	huyen_minh_long	Huyện Minh Long	huyện	51
532	huyen_nghia_hanh	Huyện Nghĩa Hành	huyện	51
533	huyen_mo_duc	Huyện Mộ Đức	huyện	51
534	thi_xa_duc_pho	Thị xã Đức Phổ	thị xã	51
535	huyen_ba_to	Huyện Ba Tơ	huyện	51
536	huyen_ly_son	Huyện Lý Sơn	huyện	51
540	thanh_pho_quy_nhon	Thành phố Quy Nhơn	thành phố	52
542	huyen_an_lao	Huyện An Lão	huyện	52
543	thi_xa_hoai_nhon	Thị xã Hoài Nhơn	thị xã	52
544	huyen_hoai_an	Huyện Hoài Ân	huyện	52
545	huyen_phu_my	Huyện Phù Mỹ	huyện	52
546	huyen_vinh_thanh	Huyện Vĩnh Thạnh	huyện	52
547	huyen_tay_son	Huyện Tây Sơn	huyện	52
548	huyen_phu_cat	Huyện Phù Cát	huyện	52
549	thi_xa_an_nhon	Thị xã An Nhơn	thị xã	52
550	huyen_tuy_phuoc	Huyện Tuy Phước	huyện	52
551	huyen_van_canh	Huyện Vân Canh	huyện	52
555	thanh_pho_tuy_hoa	Thành phố Tuy Hoà	thành phố	54
557	thi_xa_song_cau	Thị xã Sông Cầu	thị xã	54
558	huyen_dong_xuan	Huyện Đồng Xuân	huyện	54
559	huyen_tuy_an	Huyện Tuy An	huyện	54
560	huyen_son_hoa	Huyện Sơn Hòa	huyện	54
561	huyen_song_hinh	Huyện Sông Hinh	huyện	54
562	huyen_tay_hoa	Huyện Tây Hoà	huyện	54
563	huyen_phu_hoa	Huyện Phú Hoà	huyện	54
564	thi_xa_dong_hoa	Thị xã Đông Hòa	thị xã	54
568	thanh_pho_nha_trang	Thành phố Nha Trang	thành phố	56
569	thanh_pho_cam_ranh	Thành phố Cam Ranh	thành phố	56
570	huyen_cam_lam	Huyện Cam Lâm	huyện	56
571	huyen_van_ninh	Huyện Vạn Ninh	huyện	56
572	thi_xa_ninh_hoa	Thị xã Ninh Hòa	thị xã	56
573	huyen_khanh_vinh	Huyện Khánh Vĩnh	huyện	56
574	huyen_dien_khanh	Huyện Diên Khánh	huyện	56
575	huyen_khanh_son	Huyện Khánh Sơn	huyện	56
576	huyen_truong_sa	Huyện Trường Sa	huyện	56
582	thanh_pho_phan_rang_thap_cham	Thành phố Phan Rang-Tháp Chàm	thành phố	58
584	huyen_bac_ai	Huyện Bác Ái	huyện	58
585	huyen_ninh_son	Huyện Ninh Sơn	huyện	58
586	huyen_ninh_hai	Huyện Ninh Hải	huyện	58
587	huyen_ninh_phuoc	Huyện Ninh Phước	huyện	58
588	huyen_thuan_bac	Huyện Thuận Bắc	huyện	58
589	huyen_thuan_nam	Huyện Thuận Nam	huyện	58
593	thanh_pho_phan_thiet	Thành phố Phan Thiết	thành phố	60
594	thi_xa_la_gi	Thị xã La Gi	thị xã	60
595	huyen_tuy_phong	Huyện Tuy Phong	huyện	60
596	huyen_bac_binh	Huyện Bắc Bình	huyện	60
597	huyen_ham_thuan_bac	Huyện Hàm Thuận Bắc	huyện	60
598	huyen_ham_thuan_nam	Huyện Hàm Thuận Nam	huyện	60
599	huyen_tanh_linh	Huyện Tánh Linh	huyện	60
600	huyen_duc_linh	Huyện Đức Linh	huyện	60
601	huyen_ham_tan	Huyện Hàm Tân	huyện	60
602	huyen_phu_qui	Huyện Phú Quí	huyện	60
608	thanh_pho_kon_tum	Thành phố Kon Tum	thành phố	62
610	huyen_dak_glei	Huyện Đắk Glei	huyện	62
611	huyen_ngoc_hoi	Huyện Ngọc Hồi	huyện	62
612	huyen_dak_to	Huyện Đắk Tô	huyện	62
613	huyen_kon_plong	Huyện Kon Plông	huyện	62
614	huyen_kon_ray	Huyện Kon Rẫy	huyện	62
615	huyen_dak_ha	Huyện Đắk Hà	huyện	62
616	huyen_sa_thay	Huyện Sa Thầy	huyện	62
617	huyen_tu_mo_rong	Huyện Tu Mơ Rông	huyện	62
618	huyen_ia_h_drai	Huyện Ia H' Drai	huyện	62
622	thanh_pho_pleiku	Thành phố Pleiku	thành phố	64
623	thi_xa_an_khe	Thị xã An Khê	thị xã	64
624	thi_xa_ayun_pa	Thị xã Ayun Pa	thị xã	64
625	huyen_kbang	Huyện KBang	huyện	64
626	huyen_dak_doa	Huyện Đăk Đoa	huyện	64
627	huyen_chu_pah	Huyện Chư Păh	huyện	64
628	huyen_ia_grai	Huyện Ia Grai	huyện	64
629	huyen_mang_yang	Huyện Mang Yang	huyện	64
630	huyen_kong_chro	Huyện Kông Chro	huyện	64
631	huyen_duc_co	Huyện Đức Cơ	huyện	64
632	huyen_chu_prong	Huyện Chư Prông	huyện	64
633	huyen_chu_se	Huyện Chư Sê	huyện	64
634	huyen_dak_po	Huyện Đăk Pơ	huyện	64
635	huyen_ia_pa	Huyện Ia Pa	huyện	64
637	huyen_krong_pa	Huyện Krông Pa	huyện	64
638	huyen_phu_thien	Huyện Phú Thiện	huyện	64
639	huyen_chu_puh	Huyện Chư Pưh	huyện	64
643	thanh_pho_buon_ma_thuot	Thành phố Buôn Ma Thuột	thành phố	66
644	thi_xa_buon_ho	Thị xã Buôn Hồ	thị xã	66
645	huyen_ea_hleo	Huyện Ea H'leo	huyện	66
646	huyen_ea_sup	Huyện Ea Súp	huyện	66
647	huyen_buon_don	Huyện Buôn Đôn	huyện	66
648	huyen_cu_mgar	Huyện Cư M'gar	huyện	66
649	huyen_krong_buk	Huyện Krông Búk	huyện	66
650	huyen_krong_nang	Huyện Krông Năng	huyện	66
651	huyen_ea_kar	Huyện Ea Kar	huyện	66
652	huyen_mdrak	Huyện M'Đrắk	huyện	66
653	huyen_krong_bong	Huyện Krông Bông	huyện	66
654	huyen_krong_pac	Huyện Krông Pắc	huyện	66
655	huyen_krong_a_na	Huyện Krông A Na	huyện	66
656	huyen_lak	Huyện Lắk	huyện	66
657	huyen_cu_kuin	Huyện Cư Kuin	huyện	66
660	thanh_pho_gia_nghia	Thành phố Gia Nghĩa	thành phố	67
661	huyen_dak_glong	Huyện Đăk Glong	huyện	67
662	huyen_cu_jut	Huyện Cư Jút	huyện	67
663	huyen_dak_mil	Huyện Đắk Mil	huyện	67
664	huyen_krong_no	Huyện Krông Nô	huyện	67
665	huyen_dak_song	Huyện Đắk Song	huyện	67
666	huyen_dak_rlap	Huyện Đắk R'Lấp	huyện	67
667	huyen_tuy_duc	Huyện Tuy Đức	huyện	67
672	thanh_pho_da_lat	Thành phố Đà Lạt	thành phố	68
673	thanh_pho_bao_loc	Thành phố Bảo Lộc	thành phố	68
674	huyen_dam_rong	Huyện Đam Rông	huyện	68
675	huyen_lac_duong	Huyện Lạc Dương	huyện	68
676	huyen_lam_ha	Huyện Lâm Hà	huyện	68
677	huyen_don_duong	Huyện Đơn Dương	huyện	68
678	huyen_duc_trong	Huyện Đức Trọng	huyện	68
679	huyen_di_linh	Huyện Di Linh	huyện	68
680	huyen_bao_lam	Huyện Bảo Lâm	huyện	68
681	huyen_da_huoai	Huyện Đạ Huoai	huyện	68
682	huyen_da_teh	Huyện Đạ Tẻh	huyện	68
683	huyen_cat_tien	Huyện Cát Tiên	huyện	68
688	thi_xa_phuoc_long	Thị xã Phước Long	thị xã	70
689	thanh_pho_dong_xoai	Thành phố Đồng Xoài	thành phố	70
690	thi_xa_binh_long	Thị xã Bình Long	thị xã	70
691	huyen_bu_gia_map	Huyện Bù Gia Mập	huyện	70
692	huyen_loc_ninh	Huyện Lộc Ninh	huyện	70
693	huyen_bu_dop	Huyện Bù Đốp	huyện	70
694	huyen_hon_quan	Huyện Hớn Quản	huyện	70
695	huyen_dong_phu	Huyện Đồng Phú	huyện	70
696	huyen_bu_dang	Huyện Bù Đăng	huyện	70
697	huyen_chon_thanh	Huyện Chơn Thành	huyện	70
698	huyen_phu_rieng	Huyện Phú Riềng	huyện	70
703	thanh_pho_tay_ninh	Thành phố Tây Ninh	thành phố	72
705	huyen_tan_bien	Huyện Tân Biên	huyện	72
706	huyen_tan_chau	Huyện Tân Châu	huyện	72
707	huyen_duong_minh_chau	Huyện Dương Minh Châu	huyện	72
708	huyen_chau_thanh	Huyện Châu Thành	huyện	72
709	thi_xa_hoa_thanh	Thị xã Hòa Thành	thị xã	72
710	huyen_go_dau	Huyện Gò Dầu	huyện	72
711	huyen_ben_cau	Huyện Bến Cầu	huyện	72
712	thi_xa_trang_bang	Thị xã Trảng Bàng	thị xã	72
718	thanh_pho_thu_dau_mot	Thành phố Thủ Dầu Một	thành phố	74
719	huyen_bau_bang	Huyện Bàu Bàng	huyện	74
720	huyen_dau_tieng	Huyện Dầu Tiếng	huyện	74
721	thi_xa_ben_cat	Thị xã Bến Cát	thị xã	74
722	huyen_phu_giao	Huyện Phú Giáo	huyện	74
723	thi_xa_tan_uyen	Thị xã Tân Uyên	thị xã	74
724	thanh_pho_di_an	Thành phố Dĩ An	thành phố	74
725	thanh_pho_thuan_an	Thành phố Thuận An	thành phố	74
726	huyen_bac_tan_uyen	Huyện Bắc Tân Uyên	huyện	74
731	thanh_pho_bien_hoa	Thành phố Biên Hòa	thành phố	75
732	thanh_pho_long_khanh	Thành phố Long Khánh	thành phố	75
734	huyen_tan_phu	Huyện Tân Phú	huyện	75
735	huyen_vinh_cuu	Huyện Vĩnh Cửu	huyện	75
736	huyen_dinh_quan	Huyện Định Quán	huyện	75
737	huyen_trang_bom	Huyện Trảng Bom	huyện	75
738	huyen_thong_nhat	Huyện Thống Nhất	huyện	75
739	huyen_cam_my	Huyện Cẩm Mỹ	huyện	75
740	huyen_long_thanh	Huyện Long Thành	huyện	75
741	huyen_xuan_loc	Huyện Xuân Lộc	huyện	75
742	huyen_nhon_trach	Huyện Nhơn Trạch	huyện	75
747	thanh_pho_vung_tau	Thành phố Vũng Tàu	thành phố	77
748	thanh_pho_ba_ria	Thành phố Bà Rịa	thành phố	77
750	huyen_chau_duc	Huyện Châu Đức	huyện	77
751	huyen_xuyen_moc	Huyện Xuyên Mộc	huyện	77
752	huyen_long_dien	Huyện Long Điền	huyện	77
753	huyen_dat_do	Huyện Đất Đỏ	huyện	77
754	thi_xa_phu_my	Thị xã Phú Mỹ	thị xã	77
755	huyen_con_dao	Huyện Côn Đảo	huyện	77
760	quan_1	Quận 1	quận	79
761	quan_12	Quận 12	quận	79
764	quan_go_vap	Quận Gò Vấp	quận	79
765	quan_binh_thanh	Quận Bình Thạnh	quận	79
766	quan_tan_binh	Quận Tân Bình	quận	79
767	quan_tan_phu	Quận Tân Phú	quận	79
768	quan_phu_nhuan	Quận Phú Nhuận	quận	79
769	thanh_pho_thu_duc	Thành phố Thủ Đức	thành phố	79
770	quan_3	Quận 3	quận	79
771	quan_10	Quận 10	quận	79
772	quan_11	Quận 11	quận	79
773	quan_4	Quận 4	quận	79
774	quan_5	Quận 5	quận	79
775	quan_6	Quận 6	quận	79
776	quan_8	Quận 8	quận	79
777	quan_binh_tan	Quận Bình Tân	quận	79
778	quan_7	Quận 7	quận	79
783	huyen_cu_chi	Huyện Củ Chi	huyện	79
784	huyen_hoc_mon	Huyện Hóc Môn	huyện	79
785	huyen_binh_chanh	Huyện Bình Chánh	huyện	79
786	huyen_nha_be	Huyện Nhà Bè	huyện	79
787	huyen_can_gio	Huyện Cần Giờ	huyện	79
794	thanh_pho_tan_an	Thành phố Tân An	thành phố	80
795	thi_xa_kien_tuong	Thị xã Kiến Tường	thị xã	80
796	huyen_tan_hung	Huyện Tân Hưng	huyện	80
797	huyen_vinh_hung	Huyện Vĩnh Hưng	huyện	80
798	huyen_moc_hoa	Huyện Mộc Hóa	huyện	80
799	huyen_tan_thanh	Huyện Tân Thạnh	huyện	80
800	huyen_thanh_hoa	Huyện Thạnh Hóa	huyện	80
801	huyen_duc_hue	Huyện Đức Huệ	huyện	80
802	huyen_duc_hoa	Huyện Đức Hòa	huyện	80
803	huyen_ben_luc	Huyện Bến Lức	huyện	80
804	huyen_thu_thua	Huyện Thủ Thừa	huyện	80
805	huyen_tan_tru	Huyện Tân Trụ	huyện	80
806	huyen_can_duoc	Huyện Cần Đước	huyện	80
807	huyen_can_giuoc	Huyện Cần Giuộc	huyện	80
808	huyen_chau_thanh	Huyện Châu Thành	huyện	80
815	thanh_pho_my_tho	Thành phố Mỹ Tho	thành phố	82
816	thi_xa_go_cong	Thị xã Gò Công	thị xã	82
817	thi_xa_cai_lay	Thị xã Cai Lậy	thị xã	82
818	huyen_tan_phuoc	Huyện Tân Phước	huyện	82
819	huyen_cai_be	Huyện Cái Bè	huyện	82
820	huyen_cai_lay	Huyện Cai Lậy	huyện	82
821	huyen_chau_thanh	Huyện Châu Thành	huyện	82
822	huyen_cho_gao	Huyện Chợ Gạo	huyện	82
823	huyen_go_cong_tay	Huyện Gò Công Tây	huyện	82
824	huyen_go_cong_dong	Huyện Gò Công Đông	huyện	82
825	huyen_tan_phu_dong	Huyện Tân Phú Đông	huyện	82
829	thanh_pho_ben_tre	Thành phố Bến Tre	thành phố	83
831	huyen_chau_thanh	Huyện Châu Thành	huyện	83
832	huyen_cho_lach	Huyện Chợ Lách	huyện	83
833	huyen_mo_cay_nam	Huyện Mỏ Cày Nam	huyện	83
834	huyen_giong_trom	Huyện Giồng Trôm	huyện	83
835	huyen_binh_dai	Huyện Bình Đại	huyện	83
836	huyen_ba_tri	Huyện Ba Tri	huyện	83
837	huyen_thanh_phu	Huyện Thạnh Phú	huyện	83
838	huyen_mo_cay_bac	Huyện Mỏ Cày Bắc	huyện	83
842	thanh_pho_tra_vinh	Thành phố Trà Vinh	thành phố	84
844	huyen_cang_long	Huyện Càng Long	huyện	84
845	huyen_cau_ke	Huyện Cầu Kè	huyện	84
846	huyen_tieu_can	Huyện Tiểu Cần	huyện	84
847	huyen_chau_thanh	Huyện Châu Thành	huyện	84
848	huyen_cau_ngang	Huyện Cầu Ngang	huyện	84
849	huyen_tra_cu	Huyện Trà Cú	huyện	84
850	huyen_duyen_hai	Huyện Duyên Hải	huyện	84
851	thi_xa_duyen_hai	Thị xã Duyên Hải	thị xã	84
855	thanh_pho_vinh_long	Thành phố Vĩnh Long	thành phố	86
857	huyen_long_ho	Huyện Long Hồ	huyện	86
858	huyen_mang_thit	Huyện Mang Thít	huyện	86
859	huyen_vung_liem	Huyện Vũng Liêm	huyện	86
860	huyen_tam_binh	Huyện Tam Bình	huyện	86
861	thi_xa_binh_minh	Thị xã Bình Minh	thị xã	86
862	huyen_tra_on	Huyện Trà Ôn	huyện	86
863	huyen_binh_tan	Huyện Bình Tân	huyện	86
866	thanh_pho_cao_lanh	Thành phố Cao Lãnh	thành phố	87
867	thanh_pho_sa_dec	Thành phố Sa Đéc	thành phố	87
868	thanh_pho_hong_ngu	Thành phố Hồng Ngự	thành phố	87
869	huyen_tan_hong	Huyện Tân Hồng	huyện	87
870	huyen_hong_ngu	Huyện Hồng Ngự	huyện	87
871	huyen_tam_nong	Huyện Tam Nông	huyện	87
872	huyen_thap_muoi	Huyện Tháp Mười	huyện	87
873	huyen_cao_lanh	Huyện Cao Lãnh	huyện	87
874	huyen_thanh_binh	Huyện Thanh Bình	huyện	87
875	huyen_lap_vo	Huyện Lấp Vò	huyện	87
876	huyen_lai_vung	Huyện Lai Vung	huyện	87
877	huyen_chau_thanh	Huyện Châu Thành	huyện	87
883	thanh_pho_long_xuyen	Thành phố Long Xuyên	thành phố	89
884	thanh_pho_chau_doc	Thành phố Châu Đốc	thành phố	89
886	huyen_an_phu	Huyện An Phú	huyện	89
887	thi_xa_tan_chau	Thị xã Tân Châu	thị xã	89
888	huyen_phu_tan	Huyện Phú Tân	huyện	89
889	huyen_chau_phu	Huyện Châu Phú	huyện	89
890	huyen_tinh_bien	Huyện Tịnh Biên	huyện	89
891	huyen_tri_ton	Huyện Tri Tôn	huyện	89
892	huyen_chau_thanh	Huyện Châu Thành	huyện	89
893	huyen_cho_moi	Huyện Chợ Mới	huyện	89
894	huyen_thoai_son	Huyện Thoại Sơn	huyện	89
899	thanh_pho_rach_gia	Thành phố Rạch Giá	thành phố	91
900	thanh_pho_ha_tien	Thành phố Hà Tiên	thành phố	91
902	huyen_kien_luong	Huyện Kiên Lương	huyện	91
903	huyen_hon_dat	Huyện Hòn Đất	huyện	91
904	huyen_tan_hiep	Huyện Tân Hiệp	huyện	91
905	huyen_chau_thanh	Huyện Châu Thành	huyện	91
906	huyen_giong_rieng	Huyện Giồng Riềng	huyện	91
907	huyen_go_quao	Huyện Gò Quao	huyện	91
908	huyen_an_bien	Huyện An Biên	huyện	91
909	huyen_an_minh	Huyện An Minh	huyện	91
910	huyen_vinh_thuan	Huyện Vĩnh Thuận	huyện	91
911	thanh_pho_phu_quoc	Thành phố Phú Quốc	thành phố	91
912	huyen_kien_hai	Huyện Kiên Hải	huyện	91
913	huyen_u_minh_thuong	Huyện U Minh Thượng	huyện	91
914	huyen_giang_thanh	Huyện Giang Thành	huyện	91
916	quan_ninh_kieu	Quận Ninh Kiều	quận	92
917	quan_o_mon	Quận Ô Môn	quận	92
918	quan_binh_thuy	Quận Bình Thuỷ	quận	92
919	quan_cai_rang	Quận Cái Răng	quận	92
923	quan_thot_not	Quận Thốt Nốt	quận	92
924	huyen_vinh_thanh	Huyện Vĩnh Thạnh	huyện	92
925	huyen_co_do	Huyện Cờ Đỏ	huyện	92
926	huyen_phong_dien	Huyện Phong Điền	huyện	92
927	huyen_thoi_lai	Huyện Thới Lai	huyện	92
930	thanh_pho_vi_thanh	Thành phố Vị Thanh	thành phố	93
931	thanh_pho_nga_bay	Thành phố Ngã Bảy	thành phố	93
932	huyen_chau_thanh_a	Huyện Châu Thành A	huyện	93
933	huyen_chau_thanh	Huyện Châu Thành	huyện	93
934	huyen_phung_hiep	Huyện Phụng Hiệp	huyện	93
935	huyen_vi_thuy	Huyện Vị Thuỷ	huyện	93
936	huyen_long_my	Huyện Long Mỹ	huyện	93
937	thi_xa_long_my	Thị xã Long Mỹ	thị xã	93
941	thanh_pho_soc_trang	Thành phố Sóc Trăng	thành phố	94
942	huyen_chau_thanh	Huyện Châu Thành	huyện	94
943	huyen_ke_sach	Huyện Kế Sách	huyện	94
944	huyen_my_tu	Huyện Mỹ Tú	huyện	94
945	huyen_cu_lao_dung	Huyện Cù Lao Dung	huyện	94
946	huyen_long_phu	Huyện Long Phú	huyện	94
947	huyen_my_xuyen	Huyện Mỹ Xuyên	huyện	94
948	thi_xa_nga_nam	Thị xã Ngã Năm	thị xã	94
949	huyen_thanh_tri	Huyện Thạnh Trị	huyện	94
950	thi_xa_vinh_chau	Thị xã Vĩnh Châu	thị xã	94
951	huyen_tran_de	Huyện Trần Đề	huyện	94
954	thanh_pho_bac_lieu	Thành phố Bạc Liêu	thành phố	95
956	huyen_hong_dan	Huyện Hồng Dân	huyện	95
957	huyen_phuoc_long	Huyện Phước Long	huyện	95
958	huyen_vinh_loi	Huyện Vĩnh Lợi	huyện	95
959	thi_xa_gia_rai	Thị xã Giá Rai	thị xã	95
960	huyen_dong_hai	Huyện Đông Hải	huyện	95
961	huyen_hoa_binh	Huyện Hoà Bình	huyện	95
964	thanh_pho_ca_mau	Thành phố Cà Mau	thành phố	96
966	huyen_u_minh	Huyện U Minh	huyện	96
967	huyen_thoi_binh	Huyện Thới Bình	huyện	96
968	huyen_tran_van_thoi	Huyện Trần Văn Thời	huyện	96
969	huyen_cai_nuoc	Huyện Cái Nước	huyện	96
970	huyen_dam_doi	Huyện Đầm Dơi	huyện	96
971	huyen_nam_can	Huyện Năm Căn	huyện	96
972	huyen_phu_tan	Huyện Phú Tân	huyện	96
973	huyen_ngoc_hien	Huyện Ngọc Hiển	huyện	96
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (favorite_id, product_id, user_id, color_id, size, size_id) FROM stdin;
10	9	4	1	M    	20
11	9	4	1	S    	19
15	7	4	1	M    	20
16	8	4	1	L    	21
23	8	1	1	M    	20
29	30	1	1	7    	7
32	6	2	1	9.5  	12
33	76	2	1	11   	15
34	7	2	1	M    	20
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (image_id, url, product_id, product_color_id) FROM stdin;
257	13b79f26-9041-411b-ba72-62378705f49e	76	5
258	3d0b4bc3-38b1-4c8c-8b4a-e2e8c1d8e49a	76	5
259	5cfeff4e-a805-4db3-a497-d466e01ffa84	76	5
260	240c57c7-63b8-42b9-beb7-11553a6cb7e2	76	5
261	1867ae2f-cbfc-445f-bd50-116a15e7ff89	76	5
270	b20051c0-8091-4147-9508-32c1e3a16b4b	79	1
46	adidas-yoga-studio-7-8-leggings-ef8ef56f-dcd3-454b-a3b6-6b97274bffc3.jpg	8	1
47	adidas-yoga-studio-7-8-leggings-2-799b79f0-04f1-463b-9b90-eb1e25935283.jpg	8	1
48	adidas-yoga-studio-7-8-leggings-3-29974499-e99c-457e-a1f0-8a39b8555c04.jpg	8	1
49	adidas-yoga-studio-7-8-leggings-4-7ff52c39-4c80-4ca8-aab2-e535f0e9186d.jpg	8	1
50	adidas-yoga-studio-7-8-leggings-5-e72a38bc-7c9b-4ef4-a044-636577b55dd0.jpg	8	1
51	adidas-yoga-studio-7-8-leggings-6-a29f84e4-5dd7-4d95-b6ee-8b0aa252700e.jpg	8	1
52	adidas-yoga-studio-7-8-leggings-7-870feabf-3e0d-4f88-940b-c05b82b59049.jpg	8	1
53	adidas-yoga-studio-7-8-leggings-8-5aa44100-213a-4468-9de1-498eed140585.jpg	8	1
54	techfit-period-proof-7-8-leggings-1-3251e249-df22-432e-a010-58fe602ee14b.jpg	9	1
55	techfit-period-proof-7-8-leggings-2-a31ba502-4c69-4313-9c4d-63bf940c7a3e.jpg	9	1
56	techfit-period-proof-7-8-leggings-3-6f1ebcbb-cd15-46c2-8575-acf6a3090de5.jpg	9	1
57	techfit-period-proof-7-8-leggings-4-51049cdc-7140-457e-bf4f-dc423135f33f.jpg	9	1
58	techfit-period-proof-7-8-leggings-5-357a39d1-6f7f-414e-8b99-b0107a61f967.jpg	9	1
59	techfit-period-proof-7-8-leggings-6-6a4943a5-7d7b-477b-8dc3-1403c78352a0.jpg	9	1
60	techfit-period-proof-7-8-leggings-7-577337c2-6981-42b2-b961-fbbf5de4ff9e.jpg	9	1
61	techfit-period-proof-7-8-leggings-8-7cd9c592-a0a8-46ef-be6b-d03a22ce6139.jpg	9	1
79	adicolor-neuclassics-shorts2-b33f91de-a9ba-4e2e-9dc9-121027f84976.jpg	7	1
80	adicolor-neuclassics-shorts3-e4cd8ed8-1d4d-494d-9e0a-564003de8fdd.jpg	7	1
81	adicolor-neuclassics-shorts4-81f7d76d-8507-49cf-9bba-3ea152cae667.jpg	7	1
71	adicross-golf-shorts2-497d8d94-ec39-4122-ab0e-8fe1bbb5b1fd.jpg	2	4
72	adicross-golf-shorts5-da746f63-153c-4ed4-84db-2e7338e4f10d.jpg	2	4
73	adicross-golf-shorts6-744e4c73-02a9-4185-9c7e-d7a89f3e6be3.jpg	2	4
74	adicross-golf-shorts7-0dc3e793-48bc-42e4-8cac-5e79006540fb.jpg	2	4
75	adicross-golf-shorts11-54fab5fa-ff4c-497f-885e-fe0191d71ee5.jpg	2	5
76	adicross-golf-shorts13-cb12f434-ec1e-4039-b1d6-77764de8cbd8.jpg	2	5
77	adicross-golf-shorts-3ba4b652-b147-41c7-8e40-f5aeab2036db.jpg	2	5
78	adicross-golf-shorts8-b285f836-0fbe-4e30-a9fa-ee583ed6ecfa.jpg	2	5
82	adicolor-neuclassics-shorts5-6febc695-714f-48b6-9b4b-11c91180cef9.jpg	7	1
83	adicolor-neuclassics-shorts-5b860cbc-7025-44c5-8886-103bcd53f4c1.jpg	7	1
94	heat.rdy-polo-shirt2-323be46c-1a20-46a8-87f2-7d40e8c42f9b.jpg	5	5
95	heat.rdy-polo-shirt3-4d747d21-b884-43e1-ae7f-8a3d21190c6d.jpg	5	5
96	heat.rdy-polo-shirt4-3569dca3-7533-4387-8d62-8615ce1bb1fd.jpg	5	5
97	heat.rdy-polo-shirt5-3cdd9da6-18d7-4716-8c97-98e9a898d483.jpg	5	5
98	heat.rdy-polo-shirt-7024376a-ef6d-4a55-88fe-1977ece5cf0c.jpg	5	5
99	adilette-aqua-slides27-a24d2705-4f14-4f50-80b7-c8e6ff56fd39.jpg	6	8
100	adilette-aqua-slides28-85f5b667-78cc-42c3-b7c6-ffd0159f3859.jpg	6	8
101	adilette-aqua-slides29-5f7f1a30-5b99-47fe-8403-f2271d097a6e.jpg	6	2
102	adilette-aqua-slides4-ad81c681-04a5-4b04-9c5a-0b1cf833bf1c.jpg	6	8
103	adilette-aqua-slides10-65c64abe-b15b-4fc3-8310-dddee3526d5d.jpg	6	1
104	adilette-aqua-slides11-6fcbaa02-86f7-45d7-bb30-bd05c77f009c.jpg	6	1
105	adilette-aqua-slides12-c124d1b4-b0ee-4a82-bfbd-dcc7f303dab8.jpg	6	2
106	adilette-aqua-slides14-56e638b1-512e-4fa3-bc72-02271a30363b.jpg	6	8
107	adilette-aqua-slides16-db1a05d6-1767-4248-88a9-c848257186ad.jpg	6	8
108	adilette-aqua-slides17-7511e9a4-dcdb-438a-96a7-d69768eba63f.jpg	6	2
109	adilette-aqua-slides18-55c730d9-50eb-4c5f-bbc5-4f70e4c76a88.jpg	6	2
110	adilette-aqua-slides20-28af3ffa-74ce-4c46-9539-f554c5a2c4fa.jpg	6	1
111	adilette-aqua-slides21-66d62b04-6a06-4989-bbe7-90540e6ca912.jpg	6	1
112	adilette-aqua-slides23-f02b44a1-04f3-47d2-9c4c-164c02253c19.jpg	6	1
113	adilette-aqua-slides26-9a4e4c48-c796-4ebb-80ab-39e10111888a.jpg	6	2
262	49d2e020-ec6b-4f49-9f2e-b05ca29fa047	76	1
263	0d06adcf-067a-494c-bf21-edd146c6489b	76	1
136	b11029a0-de0c-450f-8d6f-1983ebbc70d4	26	5
137	8a0bc768-6545-4564-ba6a-6a46789852bb	26	5
138	8366641a-d67c-4231-9234-0b00bfbd20f1	26	5
139	662b78e9-a419-4de5-a2e5-76653c70e9a3	26	5
140	f9dd8a8e-08d2-4fed-ac31-6b56ab2b9666	26	5
154	2d018501-8a38-4de4-9ebb-f44b420d6196	29	1
155	3c609131-c492-466c-ac2a-d0b567982ab5	29	1
156	bba579ac-987b-4565-a76b-531030feddb9	29	1
157	21567782-556b-4d83-b7b9-2050c8fc1ab4	29	1
158	657cd0b6-d1d1-42ea-92cf-e59ee6d41539	29	1
159	e06114d5-073e-404b-812a-b235bf01949f	30	4
160	31c5569b-ad3e-4828-9314-0768339377d4	30	4
161	a9554651-42b0-47a9-8a53-7966480bc5a8	30	4
163	f5e048f8-438f-4dc3-9608-1e9f5ed68617	30	4
164	581e163f-40b1-42f7-bfb8-ec731e1fdfe8	30	4
165	7e559f01-00d2-4508-918e-b59f328a2e13	30	1
166	17932df2-675b-430b-9c15-109c321e2a59	30	1
167	200d56f1-a48b-46d5-8d12-4002d6cb0245	30	1
168	e03224d8-4559-4246-9b00-ba48dc89a07d	30	4
169	2634a53c-da05-480c-ac0c-3f09e0e954ba	30	1
170	d0adbb8f-a0ae-4bd0-a43a-1deb1aa2711c	30	1
264	7fa95f12-0a05-4008-b08c-6d3ac0a506a7	77	1
265	0f5492bf-90fb-44cd-82a1-4365c79d3799	77	1
266	4ff84c85-418b-4812-8850-41ac7e345fc0	77	1
267	04534627-3f4c-442d-a8b2-605ea1345100	77	1
268	2cce6041-d9e8-4fca-b1b2-96a8daa21936	77	1
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturers (manufacturer_id, manufacturer_name, brand_name) FROM stdin;
1	Nike Co.                                          	Nike                
2	Adidas Co.                                        	Adidas              
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, order_id, product_id, color_id, quantity, total_price, size, size_id) FROM stdin;
82	84	76	1	1	2000000	12   	17
84	86	29	1	1	120000	XL   	22
85	87	26	5	2	200000	XS   	18
86	87	6	2	3	900000	10.5 	14
87	88	2	4	5	500000	M    	20
88	88	76	1	2	4000000	12   	17
89	89	76	1	1	2000000	12   	17
90	89	7	1	1	200000	M    	20
91	90	7	1	1	200000	M    	20
92	91	76	5	1	2000000	9.5  	12
18	22	2	4	10	1000000	S    	19
93	92	29	1	10	1200000	XL   	22
94	92	76	5	1	2000000	9.5  	12
4	9	29	1	1	150000	M    	20
95	93	8	1	1	1000000	S    	19
96	94	77	1	5	8000000	10.5 	14
8	10	29	1	1	150000	M    	20
99	96	76	5	1	2000000	12   	17
10	12	30	1	1	120000	10   	13
100	96	79	1	1	1000000	9.5  	12
7	10	6	1	4	1200000	8    	9
3	9	6	1	4	1200000	8    	9
9	11	8	1	1	1000000	M    	20
5	10	8	1	4	4000000	M    	20
1	9	8	1	4	4000000	M    	20
101	97	8	1	1	1000000	S    	19
30	32	6	1	1	300000	9.5  	12
31	33	6	1	1	300000	9.5  	12
32	34	30	1	1	120000	8    	9
33	35	29	1	1	150000	S    	19
34	36	29	1	1	150000	S    	19
79	81	7	1	1	200000	S    	19
\.


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_statuses (order_status_id, order_status_name) FROM stdin;
2	ready
4	delivering
6	done
3	canceled
1	processing
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, user_id, address, phone, receiver, email, est_arrived_date, created_at, total_price, status, order_status_id, payment, payment_status_id, payment_method_id) FROM stdin;
9	1	ngo 3 duong Truong Dinh, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+840333314968	Manh Nguyen	nguyenmanh@gmail.com	2023-04-13 00:00:00+07	2023-04-10 00:00:00+07	870000	prepared	3		2	2
11	1	ngo 3 duong Truong Dinh, Phường Hàng Buồm, Quận Hoàn Kiếm, Thành phố Hà Nội	+840333314968	Manh Nguyen	nguyenmanh@gmail.com	2023-04-14 00:00:00+07	2023-04-11 00:00:00+07	120000	prepared	6		1	2
96	2	fuck you talm bout, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+840123456789	thang nguyen	nguyenthang@gmail.com	2023-08-22 19:23:21.958+07	2023-08-19 19:23:21.958+07	3030000	prepared	3		1	2
22	1	ngõ 3 đường Trương Định, TDP Cả, Phường Hoàng Văn Thụ, Thành phố Bắc Giang, Tỉnh Bắc Giang	+840333314968	Vi Phung	viphung@gmail.com	2023-04-19 00:00:00+07	2023-04-16 00:00:00+07	1008000	prepared	6		1	2
23	1	ngo 3 duong Truong Dinh, TDP Ca, Phường Tứ Liên, Quận Tây Hồ, Thành phố Hà Nội	+840123456789	Vi Phung	phungvi@gmail.com	2023-04-23 18:50:56.523+07	2023-04-20 00:00:00+07	200006	prepared	6		1	2
10	1	ngach 132/49, Nguyen Xa, Phường Minh Khai, Quận Bắc Từ Liêm, Thành phố Hà Nội	+840333314968	Manh Nguyen	nguyenmanh30102001@gmail.com	2023-04-13 00:00:00+07	2023-04-10 00:00:00+07	870000	prepared	6		1	2
12	2	ngo 3 duong Truong Dinh, TDP Ca, Phường Hội Hợp, Thành phố Vĩnh Yên, Tỉnh Vĩnh Phúc	+840333314968	Thang Nguyen	nguyenthang@gmail.com	2023-04-30 00:00:00+07	2023-04-14 00:00:00+07	128000	prepared	6		1	2
33	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	tét test	test@g.co	2023-05-09 07:09:54.318+07	2023-05-06 07:09:54.318+07	330000	prepared	6		1	2
34	2	test, test, test, test	+84123456789	test test	test@g.co	2023-05-09 10:30:52.405+07	2023-05-06 10:30:52.405+07	150000	prepared	6		1	2
35	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	test test	test@g.co	2023-05-10 00:43:16.036+07	2023-05-07 00:43:16.036+07	180000	prepared	3		2	2
36	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	test test	tes@g.co	2023-05-10 00:47:13.089+07	2023-05-07 00:47:13.089+07	180000	prepared	6		1	2
32	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	test test	test@g.co	2023-05-08 15:50:20.462+07	2023-05-05 15:50:20.462+07	330000	prepared	6		1	2
31	2	ngo 3 duong truong dinh, Phường Hàng Buồm, Quận Hoàn Kiếm, Thành phố Hà Nội	+84123456789	test test	test@g.co	2023-05-06 15:17:08.483+07	2023-05-03 15:17:08.483+07	229998	prepared	3		2	2
84	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	thang nguyen	test@g.co	2023-05-20 00:18:28.425+07	2023-05-17 00:18:28.425+07	2030000	prepared	3		2	1
89	2	ngo 3 duong truong dinh, Phường Lý Thái Tổ, Quận Hoàn Kiếm, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 10:51:59.851+07	2023-05-18 10:51:59.851+07	2230000	prepared	1		1	2
86	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	test test	test@g.co	2023-05-20 22:43:21.591+07	2023-05-17 22:43:21.591+07	150000	prepared	2		1	2
93	2	ngo 3 duong truong dinh, Phường Hàng Mã, Quận Hoàn Kiếm, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-23 16:18:09.445+07	2023-05-20 16:18:09.445+07	1030000	prepared	2		1	2
81	2	test, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	test TEST	test@g.co	2023-05-19 00:05:10.211+07	2023-05-16 00:05:10.211+07	230000	prepared	3		1	2
88	2	ngo 3 duong truong dinh, Phường Chương Dương, Quận Hoàn Kiếm, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 07:52:26.478+07	2023-05-18 07:52:26.478+07	4530000	prepared	4		1	2
87	2	ngo 3 duong truong dinh, Phường Yên Phụ, Quận Tây Hồ, Thành phố Hà Nội	+84123456789	thang nguyen	thang@gmail.com	2023-05-20 23:02:28.539+07	2023-05-17 23:02:28.539+07	1130000	prepared	2		1	2
90	2	ngo 3 duong truong dinh, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 10:54:26.127+07	2023-05-18 10:54:26.127+07	230000	prepared	3		1	2
92	2	ngo 3 duong truong dinh, Phường Đồng Xuân, Quận Hoàn Kiếm, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-22 08:22:36.027+07	2023-05-19 08:22:36.027+07	3230000	prepared	3		1	2
91	2	ngo 3 duong truong dinh, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-21 13:28:27.031+07	2023-05-18 13:28:27.031+07	2030000	prepared	2		1	1
94	2	ngo 3 duong truong dinh, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội	+84123456789	manh nguyen	manh@gmail.com	2023-05-24 09:50:37.152+07	2023-05-21 09:50:37.152+07	8030000	prepared	2		1	1
97	30	asdf, Xã Cửu Cao, Huyện Văn Giang, Tỉnh Hưng Yên	+36033314968	manh nguyen	nguyenmanh@gmail.com	2023-11-01 18:46:20.279+07	2023-10-29 18:46:20.279+07	1030000	prepared	3		1	2
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (payment_method_id, payment_method_name) FROM stdin;
2	Credit card
1	COD
\.


--
-- Data for Name: payment_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_statuses (payment_status_id, payment_status_name) FROM stdin;
0	initial
1	success
2	failed
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (product_category_id, category_id, product_id) FROM stdin;
1	1	8
4	1	6
8	1	26
2	4	9
3	3	2
5	3	7
6	4	5
7	3	30
9	3	29
\.


--
-- Data for Name: product_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_statuses (product_status_id, product_status_name, product_status_desc) FROM stdin;
1	active	The product is available
2	inactive	The product is not avaible at the moment
3	discontinued	The product is not available anymore
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, category, product_name, type, gender, target, color_num, price, on_sale, old_price, sizes, sales, quantity, created_at, description, manufacturer_id, style_id, type_id, size_type_id, product_status_id) FROM stdin;
2	Golf Shorts	Adicross Golf Shorts	shorts              	male      	Men's Short         	2	100000	t	125000	S,M,L,XL,XXL                                      	103	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	2	2	1
9	Leggings	Techfit Period Proof Leggings	pants               	female    	Female's Sportswear 	1	300000	f	30000	S, M, L, XL                                       	0	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	5	2	1
8	Classic Leggings	Adidas Yoga Studio Leggings	pants               	female    	Female's Sportswear 	1	1000000	f	100000	S, M, L, XL                                       	2	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	5	2	1
6	Slides	Adilette Aqua Slides	slides              	male      	Sportswear          	3	300000	f	30000	7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11                 	13	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	4	1	1
7	Shorts	Adicolor Neuclassics Shorts	shorts              	male      	Men's Shorts        	1	200000	f	200000	S, M, L, XL, XXL                                  	6	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	2	2	1
5	Classic Shirt	adidas x Classic LEGOr Tee	shirt               	unisex    	Unisex's Sportswear 	1	100000	f	100000	XS, S, M, L, XL, 2XL                              	0	1	2023-03-08 18:36:19.557054+07	Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it's also lightweight and incredibly versatile whether you're jogging after work or hitting the shops.	2	2	3	2	1
30	Slides	Adilette Comfort Slides	slides              	unisex    	Unisex's Slides     	2	120000	f	120000	6,7,8,9,10,10.5,11,14,15,13,12                    	4	300	2023-04-08 21:34:56.66795+07	Ensure your feet are supported and protected during your activities. The upper strap is adjustable for easy fit with a velcro fastening to ensure a secure fit. The upper layer is made from soft, breathable fabric with a classic 3-stripes design to boost classic style. The cushioned footbed is perfect for all-day comfort and the outsole is designed for maximum durability for those long days out and about.	2	3	4	1	2
76	Best for Sports	Alphabounce Sustainable Bounce Shoes	shoes               	unisex    	Unisex's Shoes      	1	2000000	f	1999999	11,12                                             	13	106	2023-05-14 08:09:15.809115+07	Introducing Alphabounce Sustainable Bounce Shoes: a fusion of eco-conscious design and high-performance technology. Crafted with recycled materials and advanced cushioning, these shoes offer exceptional comfort and style while minimizing environmental impact. Step towards sustainability without compromising on performance.	2	2	23	1	1
26	Shorts	adidas rifta metro short	shorts              	male      	Men's Shorts        	2	100000	t	150000	XS,S,M,L,XL,2XL                                   	2	100	2023-04-06 23:00:11.41633+07	They are lightweight and comfortable, allowing you to look and feel your best. White shorts can be paired with a variety of tops, whether it be a bright tank top or a classic button down. The bright white will brighten up any outfit, making you stand out in the summer heat. From distressed shorts to high waisted and beyond, there are a number of choices when it comes to white shorts. So why not get ready for summer with a perfect pair of white shorts?	2	2	2	2	1
29	Fit Leggings	Techfit Period Proof Leggings	pants               	female    	Female's Leggings   	1	120000	t	150000	S,M,L,XL                                          	15	200	2023-04-08 21:11:10.933123+07	 Crafted from a lightweight and soft material, they sit close to the skin without feeling restrictive and feature an elasticated waistband. They provide a slenderizing look while being breathable and lightweight, making them perfect for yoga, running and other forms of exercise. The black colour pairs with almost every outfit, so they easily become your go-to item in your wardrobe. No matter where you're headed, you can trust black fit leggings to keep you looking and feeling your best.	2	1	5	2	1
77	Men's Shoes	Duramo 10 Shoes	shoes               	male      	Men's Shoes         	1	1600000	f	1600000	10.5,11,12,11.5                                   	5	75	2023-05-17 23:16:32.001151+07	Versatile athletic footwear designed for comfort and performance. With a breathable mesh upper and supportive overlays, they keep your feet cool and stable. The Cloudfoam midsole offers plush cushioning and energy return, while the durable rubber outsole provides reliable traction. These sleek and stylish shoes are perfect for any activity, from the gym to running errands.	2	2	23	1	1
79		asdf test	swimwear            	female    	asdfasdf            	1	1000000	f	1000000	9.5,5                                             	1	103	2023-08-19 19:17:05.993322+07	fuck you talm about	1	2	20	1	2
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (province_id, province_code_name, province_name, division_type, phone_code) FROM stdin;
1	thanh_pho_ha_noi	Thành phố Hà Nội	thành phố trung ương	24
2	tinh_ha_giang	Tỉnh Hà Giang	tỉnh	219
4	tinh_cao_bang	Tỉnh Cao Bằng	tỉnh	206
6	tinh_bac_kan	Tỉnh Bắc Kạn	tỉnh	209
8	tinh_tuyen_quang	Tỉnh Tuyên Quang	tỉnh	207
10	tinh_lao_cai	Tỉnh Lào Cai	tỉnh	214
11	tinh_dien_bien	Tỉnh Điện Biên	tỉnh	215
12	tinh_lai_chau	Tỉnh Lai Châu	tỉnh	213
14	tinh_son_la	Tỉnh Sơn La	tỉnh	212
15	tinh_yen_bai	Tỉnh Yên Bái	tỉnh	216
17	tinh_hoa_binh	Tỉnh Hoà Bình	tỉnh	218
19	tinh_thai_nguyen	Tỉnh Thái Nguyên	tỉnh	208
20	tinh_lang_son	Tỉnh Lạng Sơn	tỉnh	205
22	tinh_quang_ninh	Tỉnh Quảng Ninh	tỉnh	203
24	tinh_bac_giang	Tỉnh Bắc Giang	tỉnh	204
25	tinh_phu_tho	Tỉnh Phú Thọ	tỉnh	210
26	tinh_vinh_phuc	Tỉnh Vĩnh Phúc	tỉnh	211
27	tinh_bac_ninh	Tỉnh Bắc Ninh	tỉnh	222
30	tinh_hai_duong	Tỉnh Hải Dương	tỉnh	220
31	thanh_pho_hai_phong	Thành phố Hải Phòng	thành phố trung ương	225
33	tinh_hung_yen	Tỉnh Hưng Yên	tỉnh	221
34	tinh_thai_binh	Tỉnh Thái Bình	tỉnh	227
35	tinh_ha_nam	Tỉnh Hà Nam	tỉnh	226
36	tinh_nam_dinh	Tỉnh Nam Định	tỉnh	228
37	tinh_ninh_binh	Tỉnh Ninh Bình	tỉnh	229
38	tinh_thanh_hoa	Tỉnh Thanh Hóa	tỉnh	237
40	tinh_nghe_an	Tỉnh Nghệ An	tỉnh	238
42	tinh_ha_tinh	Tỉnh Hà Tĩnh	tỉnh	239
44	tinh_quang_binh	Tỉnh Quảng Bình	tỉnh	232
45	tinh_quang_tri	Tỉnh Quảng Trị	tỉnh	233
46	tinh_thua_thien_hue	Tỉnh Thừa Thiên Huế	tỉnh	234
48	thanh_pho_da_nang	Thành phố Đà Nẵng	thành phố trung ương	236
49	tinh_quang_nam	Tỉnh Quảng Nam	tỉnh	235
51	tinh_quang_ngai	Tỉnh Quảng Ngãi	tỉnh	255
52	tinh_binh_dinh	Tỉnh Bình Định	tỉnh	256
54	tinh_phu_yen	Tỉnh Phú Yên	tỉnh	257
56	tinh_khanh_hoa	Tỉnh Khánh Hòa	tỉnh	258
58	tinh_ninh_thuan	Tỉnh Ninh Thuận	tỉnh	259
60	tinh_binh_thuan	Tỉnh Bình Thuận	tỉnh	252
62	tinh_kon_tum	Tỉnh Kon Tum	tỉnh	260
64	tinh_gia_lai	Tỉnh Gia Lai	tỉnh	269
66	tinh_dak_lak	Tỉnh Đắk Lắk	tỉnh	262
67	tinh_dak_nong	Tỉnh Đắk Nông	tỉnh	261
68	tinh_lam_dong	Tỉnh Lâm Đồng	tỉnh	263
70	tinh_binh_phuoc	Tỉnh Bình Phước	tỉnh	271
72	tinh_tay_ninh	Tỉnh Tây Ninh	tỉnh	276
74	tinh_binh_duong	Tỉnh Bình Dương	tỉnh	274
75	tinh_dong_nai	Tỉnh Đồng Nai	tỉnh	251
77	tinh_ba_ria_vung_tau	Tỉnh Bà Rịa - Vũng Tàu	tỉnh	254
79	thanh_pho_ho_chi_minh	Thành phố Hồ Chí Minh	thành phố trung ương	28
80	tinh_long_an	Tỉnh Long An	tỉnh	272
82	tinh_tien_giang	Tỉnh Tiền Giang	tỉnh	273
83	tinh_ben_tre	Tỉnh Bến Tre	tỉnh	275
84	tinh_tra_vinh	Tỉnh Trà Vinh	tỉnh	294
86	tinh_vinh_long	Tỉnh Vĩnh Long	tỉnh	270
87	tinh_dong_thap	Tỉnh Đồng Tháp	tỉnh	277
89	tinh_an_giang	Tỉnh An Giang	tỉnh	296
91	tinh_kien_giang	Tỉnh Kiên Giang	tỉnh	297
92	thanh_pho_can_tho	Thành phố Cần Thơ	thành phố trung ương	292
93	tinh_hau_giang	Tỉnh Hậu Giang	tỉnh	293
94	tinh_soc_trang	Tỉnh Sóc Trăng	tỉnh	299
95	tinh_bac_lieu	Tỉnh Bạc Liêu	tỉnh	291
96	tinh_ca_mau	Tỉnh Cà Mau	tỉnh	290
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (product_id, user_id, review, rating, created_at, title) FROM stdin;
2	4	This is such a gooooooood product <3	5	2023-03-18 20:33:10.171674+07	
6	1	These slides are fireeeeee🔥🔥🔥	4	2023-03-19 17:14:13.296118+07	Bangin'
9	1	I've been impressed with these leggings! They are made of high quality material that is soft and flexible. The fit is true to size and they are very comfortable. The fabric is stretchy enough to move with you while providing a snug fit that won't slip or sag. I love the colorful styles they offer and they are perfect for any outfit. I'm very pleased with these leggings and would definitely recommend them!	4	2023-04-09 10:39:15.420142+07	Good!
30	2	These slides are sooooo comfortable. It's fit into my feet so nicely. I loved it	5	2023-04-14 22:48:04.961999+07	Awwwesommmme
29	2	sdfasdf	5	2023-05-10 13:14:14.786366+07	
6	2	awesomee	5	2023-05-13 09:23:32.299815+07	good
2	2	good short	5	2023-05-18 07:50:21.897432+07	Awwwesommmme
8	2	good pant	5	2023-05-18 10:09:32.800976+07	Awwwesommmme
76	2	good p	5	2023-05-19 08:21:30.17067+07	awesomeeee
2	30	assdf	5	2023-10-29 18:42:47.927849+07	
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name) FROM stdin;
0	admin
1	user
2	warehouse manager
\.


--
-- Data for Name: size_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.size_types (size_type_id, size_type_name) FROM stdin;
1	shoes/slides
2	clothes
\.


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sizes (size_id, size, size_type_id) FROM stdin;
1	4	1
2	4.5	1
3	5	1
4	5.5	1
5	6	1
6	6.5	1
7	7	1
8	7.5	1
9	8	1
10	8.5	1
11	9	1
12	9.5	1
13	10	1
14	10.5	1
15	11	1
16	11.5	1
17	12	1
18	XS	2
19	S	2
20	M	2
21	L	2
22	XL	2
23	2XL	2
24	3XL	2
25	4XL	2
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (stock_id, product_id, color_id, size_id, quantity) FROM stdin;
99	30	1	9	17
41	6	1	12	18
444	77	1	17	15
46	2	4	20	15
433	76	1	17	0
72	7	1	19	17
16	8	1	20	30
17	8	1	21	40
18	8	1	22	50
19	9	1	19	20
20	9	1	20	2
21	9	1	21	20
22	9	1	22	20
25	29	1	21	0
87	26	5	18	18
43	6	2	14	17
42	6	1	13	0
73	7	1	20	20
37	6	1	8	20
38	6	1	9	20
39	6	1	10	30
40	6	1	11	40
26	29	1	22	19
442	77	1	14	5
438	76	5	11	3
441	76	5	15	6
23	29	1	19	0
74	7	1	21	20
75	7	1	22	20
76	7	1	23	20
434	76	1	15	0
439	76	5	17	9
24	29	1	20	0
15	8	1	19	19
450	79	1	12	11
97	30	1	5	20
100	30	4	11	20
101	30	4	13	20
102	30	4	15	20
103	30	4	17	20
49	2	5	23	20
47	2	4	21	20
45	2	4	19	0
48	2	5	22	20
66	5	5	18	20
67	5	5	19	20
68	5	5	20	20
69	5	5	21	20
70	5	5	22	20
71	5	5	23	20
44	6	8	15	20
98	30	1	7	19
88	26	5	19	20
89	26	5	20	20
90	26	5	21	20
91	26	5	22	20
92	26	5	23	20
436	76	5	13	0
443	77	1	15	20
445	77	1	16	25
440	76	5	12	1
451	79	1	3	3
437	76	5	14	5
435	76	5	16	2
\.


--
-- Data for Name: styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.styles (style_id, style_name) FROM stdin;
1	Gym
2	Sport
3	Classics
4	Street
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (type_id, type_name) FROM stdin;
2	shorts
3	shirt
4	slides
5	pants
15	bras
16	bodysuit
17	hoodie
18	jacket
19	skirt
20	swimwear
21	socks
22	accessory
23	shoes
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
4	1
2	1
3	2
14	0
1	1
30	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, password, first_name, last_name, birthday, country, registration_time, with_email, avatar, role) FROM stdin;
4	nguyenmanh@gmail.com                              	$2b$10$htq0AxbuPdRc4xfwWK4JDubt767vOCr/56QVsDp5CmOcv1dC5k5yS	Manh      	Nguyen    	2001-07-10	VN                  	1644665202923	f	e93f50e1-f2e9-4226-87db-5744128c909b	1
2	nguyenthang@gmail.com                             	$2b$10$F92uu.rv7BV0cMgNYLyJleh1J5jTD6WuOKL7p.ICnxBVEECRL9Mka	Thang     	Nguyen    	2022-02-12	US                  	1644665202923	f	7iM2qMwcpA-aU7lEqdwa0	1
3	nguyencuong@gmail.com                             	$2b$10$7bG0cjTyNkf3LPBbF51ZL.35bJGIUCcm18o1Z7Cse4FEuh2mD0qGu	Cuong     	Nguyen    	1999-01-12	US                  	1644665202923	t	default-avatar.png	2
14	admin@gmail.com                                   	$2b$10$FUvTMAMBOJaiG8t8nJCS5e7gjJziDfRcAbBZSQSCJMPpejzJ/ljym	admin     	___       	1998-01-05	VN                  	1680235476866	f	5c47df43-7baf-438c-ba87-2dc071780d32	0
1	phungvi@gmail.com                                 	$2b$10$xUpqeXPEyDVr4Xlw7xzD3.ekKIPwqpM0n2Xx/EF.Eb.f2ioBmUFSi	Vi        	Phung     	1997-06-11	US                  	1644665202923	f	D4sOu6Jc0SmfyqMha9Ch3	1
30	nguyenmanh@gmail.com                              	$2b$10$BwNvkX9iN79EtO6YleUFHuhbuVtTShl1KfFZeEWESuGOvFo3qtIKa	Manh      	Nguyen    	2023-10-29	US                  	1698579585267	f	ZVyrib1pYv7rNgBqpNhAJ	1
\.


--
-- Data for Name: wards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wards (ward_id, ward_code_name, ward_name, division_type, district_id) FROM stdin;
1	phuong_phuc_xa	Phường Phúc Xá	phường	1
4	phuong_truc_bach	Phường Trúc Bạch	phường	1
6	phuong_vinh_phuc	Phường Vĩnh Phúc	phường	1
7	phuong_cong_vi	Phường Cống Vị	phường	1
8	phuong_lieu_giai	Phường Liễu Giai	phường	1
10	phuong_nguyen_trung_truc	Phường Nguyễn Trung Trực	phường	1
13	phuong_quan_thanh	Phường Quán Thánh	phường	1
16	phuong_ngoc_ha	Phường Ngọc Hà	phường	1
19	phuong_dien_bien	Phường Điện Biên	phường	1
22	phuong_doi_can	Phường Đội Cấn	phường	1
25	phuong_ngoc_khanh	Phường Ngọc Khánh	phường	1
28	phuong_kim_ma	Phường Kim Mã	phường	1
31	phuong_giang_vo	Phường Giảng Võ	phường	1
34	phuong_thanh_cong	Phường Thành Công	phường	1
37	phuong_phuc_tan	Phường Phúc Tân	phường	2
40	phuong_dong_xuan	Phường Đồng Xuân	phường	2
43	phuong_hang_ma	Phường Hàng Mã	phường	2
46	phuong_hang_buom	Phường Hàng Buồm	phường	2
49	phuong_hang_dao	Phường Hàng Đào	phường	2
52	phuong_hang_bo	Phường Hàng Bồ	phường	2
55	phuong_cua_dong	Phường Cửa Đông	phường	2
58	phuong_ly_thai_to	Phường Lý Thái Tổ	phường	2
61	phuong_hang_bac	Phường Hàng Bạc	phường	2
64	phuong_hang_gai	Phường Hàng Gai	phường	2
67	phuong_chuong_duong	Phường Chương Dương	phường	2
70	phuong_hang_trong	Phường Hàng Trống	phường	2
73	phuong_cua_nam	Phường Cửa Nam	phường	2
76	phuong_hang_bong	Phường Hàng Bông	phường	2
79	phuong_trang_tien	Phường Tràng Tiền	phường	2
82	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	2
85	phuong_phan_chu_trinh	Phường Phan Chu Trinh	phường	2
88	phuong_hang_bai	Phường Hàng Bài	phường	2
91	phuong_phu_thuong	Phường Phú Thượng	phường	3
94	phuong_nhat_tan	Phường Nhật Tân	phường	3
97	phuong_tu_lien	Phường Tứ Liên	phường	3
100	phuong_quang_an	Phường Quảng An	phường	3
103	phuong_xuan_la	Phường Xuân La	phường	3
106	phuong_yen_phu	Phường Yên Phụ	phường	3
109	phuong_buoi	Phường Bưởi	phường	3
112	phuong_thuy_khue	Phường Thụy Khuê	phường	3
115	phuong_thuong_thanh	Phường Thượng Thanh	phường	4
118	phuong_ngoc_thuy	Phường Ngọc Thụy	phường	4
121	phuong_giang_bien	Phường Giang Biên	phường	4
124	phuong_duc_giang	Phường Đức Giang	phường	4
127	phuong_viet_hung	Phường Việt Hưng	phường	4
130	phuong_gia_thuy	Phường Gia Thụy	phường	4
133	phuong_ngoc_lam	Phường Ngọc Lâm	phường	4
136	phuong_phuc_loi	Phường Phúc Lợi	phường	4
139	phuong_bo_de	Phường Bồ Đề	phường	4
142	phuong_sai_dong	Phường Sài Đồng	phường	4
145	phuong_long_bien	Phường Long Biên	phường	4
148	phuong_thach_ban	Phường Thạch Bàn	phường	4
151	phuong_phuc_dong	Phường Phúc Đồng	phường	4
154	phuong_cu_khoi	Phường Cự Khối	phường	4
157	phuong_nghia_do	Phường Nghĩa Đô	phường	5
160	phuong_nghia_tan	Phường Nghĩa Tân	phường	5
163	phuong_mai_dich	Phường Mai Dịch	phường	5
166	phuong_dich_vong	Phường Dịch Vọng	phường	5
167	phuong_dich_vong_hau	Phường Dịch Vọng Hậu	phường	5
169	phuong_quan_hoa	Phường Quan Hoa	phường	5
172	phuong_yen_hoa	Phường Yên Hoà	phường	5
175	phuong_trung_hoa	Phường Trung Hoà	phường	5
178	phuong_cat_linh	Phường Cát Linh	phường	6
181	phuong_van_mieu	Phường Văn Miếu	phường	6
184	phuong_quoc_tu_giam	Phường Quốc Tử Giám	phường	6
187	phuong_lang_thuong	Phường Láng Thượng	phường	6
190	phuong_o_cho_dua	Phường Ô Chợ Dừa	phường	6
193	phuong_van_chuong	Phường Văn Chương	phường	6
196	phuong_hang_bot	Phường Hàng Bột	phường	6
199	phuong_lang_ha	Phường Láng Hạ	phường	6
202	phuong_kham_thien	Phường Khâm Thiên	phường	6
205	phuong_tho_quan	Phường Thổ Quan	phường	6
208	phuong_nam_dong	Phường Nam Đồng	phường	6
211	phuong_trung_phung	Phường Trung Phụng	phường	6
214	phuong_quang_trung	Phường Quang Trung	phường	6
217	phuong_trung_liet	Phường Trung Liệt	phường	6
220	phuong_phuong_lien	Phường Phương Liên	phường	6
223	phuong_thinh_quang	Phường Thịnh Quang	phường	6
226	phuong_trung_tu	Phường Trung Tự	phường	6
229	phuong_kim_lien	Phường Kim Liên	phường	6
232	phuong_phuong_mai	Phường Phương Mai	phường	6
235	phuong_nga_tu_so	Phường Ngã Tư Sở	phường	6
238	phuong_khuong_thuong	Phường Khương Thượng	phường	6
241	phuong_nguyen_du	Phường Nguyễn Du	phường	7
244	phuong_bach_dang	Phường Bạch Đằng	phường	7
247	phuong_pham_dinh_ho	Phường Phạm Đình Hổ	phường	7
256	phuong_le_dai_hanh	Phường Lê Đại Hành	phường	7
259	phuong_dong_nhan	Phường Đồng Nhân	phường	7
262	phuong_pho_hue	Phường Phố Huế	phường	7
265	phuong_dong_mac	Phường Đống Mác	phường	7
268	phuong_thanh_luong	Phường Thanh Lương	phường	7
271	phuong_thanh_nhan	Phường Thanh Nhàn	phường	7
274	phuong_cau_den	Phường Cầu Dền	phường	7
277	phuong_bach_khoa	Phường Bách Khoa	phường	7
280	phuong_dong_tam	Phường Đồng Tâm	phường	7
283	phuong_vinh_tuy	Phường Vĩnh Tuy	phường	7
286	phuong_bach_mai	Phường Bạch Mai	phường	7
289	phuong_quynh_mai	Phường Quỳnh Mai	phường	7
292	phuong_quynh_loi	Phường Quỳnh Lôi	phường	7
295	phuong_minh_khai	Phường Minh Khai	phường	7
298	phuong_truong_dinh	Phường Trương Định	phường	7
301	phuong_thanh_tri	Phường Thanh Trì	phường	8
304	phuong_vinh_hung	Phường Vĩnh Hưng	phường	8
307	phuong_dinh_cong	Phường Định Công	phường	8
310	phuong_mai_dong	Phường Mai Động	phường	8
313	phuong_tuong_mai	Phường Tương Mai	phường	8
316	phuong_dai_kim	Phường Đại Kim	phường	8
319	phuong_tan_mai	Phường Tân Mai	phường	8
322	phuong_hoang_van_thu	Phường Hoàng Văn Thụ	phường	8
325	phuong_giap_bat	Phường Giáp Bát	phường	8
328	phuong_linh_nam	Phường Lĩnh Nam	phường	8
331	phuong_thinh_liet	Phường Thịnh Liệt	phường	8
334	phuong_tran_phu	Phường Trần Phú	phường	8
337	phuong_hoang_liet	Phường Hoàng Liệt	phường	8
340	phuong_yen_so	Phường Yên Sở	phường	8
343	phuong_nhan_chinh	Phường Nhân Chính	phường	9
346	phuong_thuong_dinh	Phường Thượng Đình	phường	9
349	phuong_khuong_trung	Phường Khương Trung	phường	9
352	phuong_khuong_mai	Phường Khương Mai	phường	9
355	phuong_thanh_xuan_trung	Phường Thanh Xuân Trung	phường	9
358	phuong_phuong_liet	Phường Phương Liệt	phường	9
361	phuong_ha_dinh	Phường Hạ Đình	phường	9
364	phuong_khuong_dinh	Phường Khương Đình	phường	9
367	phuong_thanh_xuan_bac	Phường Thanh Xuân Bắc	phường	9
370	phuong_thanh_xuan_nam	Phường Thanh Xuân Nam	phường	9
373	phuong_kim_giang	Phường Kim Giang	phường	9
376	thi_tran_soc_son	Thị trấn Sóc Sơn	thị trấn	16
379	xa_bac_son	Xã Bắc Sơn	xã	16
382	xa_minh_tri	Xã Minh Trí	xã	16
385	xa_hong_ky	Xã Hồng Kỳ	xã	16
388	xa_nam_son	Xã Nam Sơn	xã	16
391	xa_trung_gia	Xã Trung Giã	xã	16
394	xa_tan_hung	Xã Tân Hưng	xã	16
397	xa_minh_phu	Xã Minh Phú	xã	16
400	xa_phu_linh	Xã Phù Linh	xã	16
403	xa_bac_phu	Xã Bắc Phú	xã	16
406	xa_tan_minh	Xã Tân Minh	xã	16
409	xa_quang_tien	Xã Quang Tiến	xã	16
412	xa_hien_ninh	Xã Hiền Ninh	xã	16
415	xa_tan_dan	Xã Tân Dân	xã	16
418	xa_tien_duoc	Xã Tiên Dược	xã	16
421	xa_viet_long	Xã Việt Long	xã	16
424	xa_xuan_giang	Xã Xuân Giang	xã	16
427	xa_mai_dinh	Xã Mai Đình	xã	16
430	xa_duc_hoa	Xã Đức Hoà	xã	16
433	xa_thanh_xuan	Xã Thanh Xuân	xã	16
436	xa_dong_xuan	Xã Đông Xuân	xã	16
439	xa_kim_lu	Xã Kim Lũ	xã	16
442	xa_phu_cuong	Xã Phú Cường	xã	16
445	xa_phu_minh	Xã Phú Minh	xã	16
448	xa_phu_lo	Xã Phù Lỗ	xã	16
451	xa_xuan_thu	Xã Xuân Thu	xã	16
454	thi_tran_dong_anh	Thị trấn Đông Anh	thị trấn	17
457	xa_xuan_non	Xã Xuân Nộn	xã	17
460	xa_thuy_lam	Xã Thuỵ Lâm	xã	17
463	xa_bac_hong	Xã Bắc Hồng	xã	17
466	xa_nguyen_khe	Xã Nguyên Khê	xã	17
469	xa_nam_hong	Xã Nam Hồng	xã	17
472	xa_tien_duong	Xã Tiên Dương	xã	17
475	xa_van_ha	Xã Vân Hà	xã	17
478	xa_uy_no	Xã Uy Nỗ	xã	17
481	xa_van_noi	Xã Vân Nội	xã	17
484	xa_lien_ha	Xã Liên Hà	xã	17
487	xa_viet_hung	Xã Việt Hùng	xã	17
490	xa_kim_no	Xã Kim Nỗ	xã	17
493	xa_kim_chung	Xã Kim Chung	xã	17
496	xa_duc_tu	Xã Dục Tú	xã	17
499	xa_dai_mach	Xã Đại Mạch	xã	17
502	xa_vinh_ngoc	Xã Vĩnh Ngọc	xã	17
505	xa_co_loa	Xã Cổ Loa	xã	17
508	xa_hai_boi	Xã Hải Bối	xã	17
511	xa_xuan_canh	Xã Xuân Canh	xã	17
514	xa_vong_la	Xã Võng La	xã	17
517	xa_tam_xa	Xã Tàm Xá	xã	17
520	xa_mai_lam	Xã Mai Lâm	xã	17
523	xa_dong_hoi	Xã Đông Hội	xã	17
20440	xa_ga_ri	Xã Ga Ri	xã	504
526	thi_tran_yen_vien	Thị trấn Yên Viên	thị trấn	18
529	xa_yen_thuong	Xã Yên Thường	xã	18
532	xa_yen_vien	Xã Yên Viên	xã	18
535	xa_ninh_hiep	Xã Ninh Hiệp	xã	18
538	xa_dinh_xuyen	Xã Đình Xuyên	xã	18
541	xa_duong_ha	Xã Dương Hà	xã	18
544	xa_phu_dong	Xã Phù Đổng	xã	18
547	xa_trung_mau	Xã Trung Mầu	xã	18
550	xa_le_chi	Xã Lệ Chi	xã	18
553	xa_co_bi	Xã Cổ Bi	xã	18
556	xa_dang_xa	Xã Đặng Xá	xã	18
559	xa_phu_thi	Xã Phú Thị	xã	18
562	xa_kim_son	Xã Kim Sơn	xã	18
565	thi_tran_trau_quy	Thị trấn Trâu Quỳ	thị trấn	18
568	xa_duong_quang	Xã Dương Quang	xã	18
571	xa_duong_xa	Xã Dương Xá	xã	18
574	xa_dong_du	Xã Đông Dư	xã	18
577	xa_da_ton	Xã Đa Tốn	xã	18
580	xa_kieu_ky	Xã Kiêu Kỵ	xã	18
583	xa_bat_trang	Xã Bát Tràng	xã	18
586	xa_kim_lan	Xã Kim Lan	xã	18
589	xa_van_duc	Xã Văn Đức	xã	18
592	phuong_cau_dien	Phường Cầu Diễn	phường	19
622	phuong_xuan_phuong	Phường Xuân Phương	phường	19
623	phuong_phuong_canh	Phường Phương Canh	phường	19
625	phuong_my_dinh_1	Phường Mỹ Đình 1	phường	19
626	phuong_my_dinh_2	Phường Mỹ Đình 2	phường	19
628	phuong_tay_mo	Phường Tây Mỗ	phường	19
631	phuong_me_tri	Phường Mễ Trì	phường	19
632	phuong_phu_do	Phường Phú Đô	phường	19
634	phuong_dai_mo	Phường Đại Mỗ	phường	19
637	phuong_trung_van	Phường Trung Văn	phường	19
640	thi_tran_van_dien	Thị trấn Văn Điển	thị trấn	20
643	xa_tan_trieu	Xã Tân Triều	xã	20
646	xa_thanh_liet	Xã Thanh Liệt	xã	20
649	xa_ta_thanh_oai	Xã Tả Thanh Oai	xã	20
652	xa_huu_hoa	Xã Hữu Hoà	xã	20
655	xa_tam_hiep	Xã Tam Hiệp	xã	20
658	xa_tu_hiep	Xã Tứ Hiệp	xã	20
661	xa_yen_my	Xã Yên Mỹ	xã	20
664	xa_vinh_quynh	Xã Vĩnh Quỳnh	xã	20
667	xa_ngu_hiep	Xã Ngũ Hiệp	xã	20
670	xa_duyen_ha	Xã Duyên Hà	xã	20
673	xa_ngoc_hoi	Xã Ngọc Hồi	xã	20
676	xa_van_phuc	Xã Vạn Phúc	xã	20
679	xa_dai_ang	Xã Đại áng	xã	20
682	xa_lien_ninh	Xã Liên Ninh	xã	20
685	xa_dong_my	Xã Đông Mỹ	xã	20
595	phuong_thuong_cat	Phường Thượng Cát	phường	21
598	phuong_lien_mac	Phường Liên Mạc	phường	21
601	phuong_dong_ngac	Phường Đông Ngạc	phường	21
602	phuong_duc_thang	Phường Đức Thắng	phường	21
604	phuong_thuy_phuong	Phường Thụy Phương	phường	21
607	phuong_tay_tuu	Phường Tây Tựu	phường	21
610	phuong_xuan_dinh	Phường Xuân Đỉnh	phường	21
611	phuong_xuan_tao	Phường Xuân Tảo	phường	21
613	phuong_minh_khai	Phường Minh Khai	phường	21
616	phuong_co_nhue_1	Phường Cổ Nhuế 1	phường	21
617	phuong_co_nhue_2	Phường Cổ Nhuế 2	phường	21
619	phuong_phu_dien	Phường Phú Diễn	phường	21
620	phuong_phuc_dien	Phường Phúc Diễn	phường	21
8973	thi_tran_chi_dong	Thị trấn Chi Đông	thị trấn	250
8974	xa_dai_thinh	Xã Đại Thịnh	xã	250
8977	xa_kim_hoa	Xã Kim Hoa	xã	250
8980	xa_thach_da	Xã Thạch Đà	xã	250
8983	xa_tien_thang	Xã Tiến Thắng	xã	250
8986	xa_tu_lap	Xã Tự Lập	xã	250
8989	thi_tran_quang_minh	Thị trấn Quang Minh	thị trấn	250
8992	xa_thanh_lam	Xã Thanh Lâm	xã	250
8995	xa_tam_dong	Xã Tam Đồng	xã	250
8998	xa_lien_mac	Xã Liên Mạc	xã	250
9001	xa_van_yen	Xã Vạn Yên	xã	250
9004	xa_chu_phan	Xã Chu Phan	xã	250
9007	xa_tien_thinh	Xã Tiến Thịnh	xã	250
9010	xa_me_linh	Xã Mê Linh	xã	250
9013	xa_van_khe	Xã Văn Khê	xã	250
9016	xa_hoang_kim	Xã Hoàng Kim	xã	250
9019	xa_tien_phong	Xã Tiền Phong	xã	250
9022	xa_trang_viet	Xã Tráng Việt	xã	250
9538	phuong_nguyen_trai	Phường Nguyễn Trãi	phường	268
9541	phuong_mo_lao	Phường Mộ Lao	phường	268
9542	phuong_van_quan	Phường Văn Quán	phường	268
9544	phuong_van_phuc	Phường Vạn Phúc	phường	268
9547	phuong_yet_kieu	Phường Yết Kiêu	phường	268
9550	phuong_quang_trung	Phường Quang Trung	phường	268
9551	phuong_la_khe	Phường La Khê	phường	268
9552	phuong_phu_la	Phường Phú La	phường	268
9553	phuong_phuc_la	Phường Phúc La	phường	268
9556	phuong_ha_cau	Phường Hà Cầu	phường	268
9562	phuong_yen_nghia	Phường Yên Nghĩa	phường	268
9565	phuong_kien_hung	Phường Kiến Hưng	phường	268
9568	phuong_phu_lam	Phường Phú Lãm	phường	268
9571	phuong_phu_luong	Phường Phú Lương	phường	268
20443	xa_a_xan	Xã A Xan	xã	504
9886	phuong_duong_noi	Phường Dương Nội	phường	268
10117	phuong_dong_mai	Phường Đồng Mai	phường	268
10123	phuong_bien_giang	Phường Biên Giang	phường	268
9574	phuong_le_loi	Phường Lê Lợi	phường	269
9577	phuong_phu_thinh	Phường Phú Thịnh	phường	269
9580	phuong_ngo_quyen	Phường Ngô Quyền	phường	269
9583	phuong_quang_trung	Phường Quang Trung	phường	269
9586	phuong_son_loc	Phường Sơn Lộc	phường	269
9589	phuong_xuan_khanh	Phường Xuân Khanh	phường	269
9592	xa_duong_lam	Xã Đường Lâm	xã	269
9595	phuong_vien_son	Phường Viên Sơn	phường	269
9598	xa_xuan_son	Xã Xuân Sơn	xã	269
9601	phuong_trung_hung	Phường Trung Hưng	phường	269
9604	xa_thanh_my	Xã Thanh Mỹ	xã	269
9607	phuong_trung_son_tram	Phường Trung Sơn Trầm	phường	269
9610	xa_kim_son	Xã Kim Sơn	xã	269
9613	xa_son_dong	Xã Sơn Đông	xã	269
9616	xa_co_dong	Xã Cổ Đông	xã	269
9619	thi_tran_tay_dang	Thị trấn Tây Đằng	thị trấn	271
9625	xa_phu_cuong	Xã Phú Cường	xã	271
9628	xa_co_do	Xã Cổ Đô	xã	271
9631	xa_tan_hong	Xã Tản Hồng	xã	271
9634	xa_van_thang	Xã Vạn Thắng	xã	271
9637	xa_chau_son	Xã Châu Sơn	xã	271
9640	xa_phong_van	Xã Phong Vân	xã	271
9643	xa_phu_dong	Xã Phú Đông	xã	271
9646	xa_phu_phuong	Xã Phú Phương	xã	271
9649	xa_phu_chau	Xã Phú Châu	xã	271
9652	xa_thai_hoa	Xã Thái Hòa	xã	271
9655	xa_dong_thai	Xã Đồng Thái	xã	271
9658	xa_phu_son	Xã Phú Sơn	xã	271
9661	xa_minh_chau	Xã Minh Châu	xã	271
9664	xa_vat_lai	Xã Vật Lại	xã	271
9667	xa_chu_minh	Xã Chu Minh	xã	271
9670	xa_tong_bat	Xã Tòng Bạt	xã	271
9673	xa_cam_linh	Xã Cẩm Lĩnh	xã	271
9676	xa_son_da	Xã Sơn Đà	xã	271
9679	xa_dong_quang	Xã Đông Quang	xã	271
9682	xa_tien_phong	Xã Tiên Phong	xã	271
9685	xa_thuy_an	Xã Thụy An	xã	271
9688	xa_cam_thuong	Xã Cam Thượng	xã	271
9691	xa_thuan_my	Xã Thuần Mỹ	xã	271
9694	xa_tan_linh	Xã Tản Lĩnh	xã	271
9697	xa_ba_trai	Xã Ba Trại	xã	271
9700	xa_minh_quang	Xã Minh Quang	xã	271
9703	xa_ba_vi	Xã Ba Vì	xã	271
9706	xa_van_hoa	Xã Vân Hòa	xã	271
9709	xa_yen_bai	Xã Yên Bài	xã	271
9712	xa_khanh_thuong	Xã Khánh Thượng	xã	271
9715	thi_tran_phuc_tho	Thị trấn Phúc Thọ	thị trấn	272
9718	xa_van_ha	Xã Vân Hà	xã	272
9721	xa_van_phuc	Xã Vân Phúc	xã	272
9724	xa_van_nam	Xã Vân Nam	xã	272
9727	xa_xuan_dinh	Xã Xuân Đình	xã	272
9733	xa_sen_phuong	Xã Sen Phương	xã	272
9739	xa_vong_xuyen	Xã Võng Xuyên	xã	272
9742	xa_tho_loc	Xã Thọ Lộc	xã	272
9745	xa_long_xuyen	Xã Long Xuyên	xã	272
9748	xa_thuong_coc	Xã Thượng Cốc	xã	272
9751	xa_hat_mon	Xã Hát Môn	xã	272
9754	xa_tich_giang	Xã Tích Giang	xã	272
9757	xa_thanh_da	Xã Thanh Đa	xã	272
9760	xa_trach_my_loc	Xã Trạch Mỹ Lộc	xã	272
9763	xa_phuc_hoa	Xã Phúc Hòa	xã	272
9766	xa_ngoc_tao	Xã Ngọc Tảo	xã	272
9769	xa_phung_thuong	Xã Phụng Thượng	xã	272
9772	xa_tam_thuan	Xã Tam Thuấn	xã	272
9775	xa_tam_hiep	Xã Tam Hiệp	xã	272
9778	xa_hiep_thuan	Xã Hiệp Thuận	xã	272
9781	xa_lien_hiep	Xã Liên Hiệp	xã	272
9784	thi_tran_phung	Thị trấn Phùng	thị trấn	273
9787	xa_trung_chau	Xã Trung Châu	xã	273
9790	xa_tho_an	Xã Thọ An	xã	273
9793	xa_tho_xuan	Xã Thọ Xuân	xã	273
9796	xa_hong_ha	Xã Hồng Hà	xã	273
9799	xa_lien_hong	Xã Liên Hồng	xã	273
9802	xa_lien_ha	Xã Liên Hà	xã	273
9805	xa_ha_mo	Xã Hạ Mỗ	xã	273
9808	xa_lien_trung	Xã Liên Trung	xã	273
9811	xa_phuong_dinh	Xã Phương Đình	xã	273
9814	xa_thuong_mo	Xã Thượng Mỗ	xã	273
9817	xa_tan_hoi	Xã Tân Hội	xã	273
9820	xa_tan_lap	Xã Tân Lập	xã	273
9823	xa_dan_phuong	Xã Đan Phượng	xã	273
9826	xa_dong_thap	Xã Đồng Tháp	xã	273
9829	xa_song_phuong	Xã Song Phượng	xã	273
9832	thi_tran_tram_troi	Thị trấn Trạm Trôi	thị trấn	274
9835	xa_duc_thuong	Xã Đức Thượng	xã	274
9838	xa_minh_khai	Xã Minh Khai	xã	274
9841	xa_duong_lieu	Xã Dương Liễu	xã	274
9844	xa_di_trach	Xã Di Trạch	xã	274
9847	xa_duc_giang	Xã Đức Giang	xã	274
9850	xa_cat_que	Xã Cát Quế	xã	274
9853	xa_kim_chung	Xã Kim Chung	xã	274
9856	xa_yen_so	Xã Yên Sở	xã	274
9859	xa_son_dong	Xã Sơn Đồng	xã	274
9862	xa_van_canh	Xã Vân Canh	xã	274
9865	xa_dac_so	Xã Đắc Sở	xã	274
9868	xa_lai_yen	Xã Lại Yên	xã	274
9871	xa_tien_yen	Xã Tiền Yên	xã	274
9874	xa_song_phuong	Xã Song Phương	xã	274
9877	xa_an_khanh	Xã An Khánh	xã	274
9880	xa_an_thuong	Xã An Thượng	xã	274
9883	xa_van_con	Xã Vân Côn	xã	274
9889	xa_la_phu	Xã La Phù	xã	274
9892	xa_dong_la	Xã Đông La	xã	274
4939	xa_dong_xuan	Xã Đông Xuân	xã	275
9895	thi_tran_quoc_oai	Thị trấn Quốc Oai	thị trấn	275
9898	xa_sai_son	Xã Sài Sơn	xã	275
9901	xa_phuong_cach	Xã Phượng Cách	xã	275
9904	xa_yen_son	Xã Yên Sơn	xã	275
9907	xa_ngoc_liep	Xã Ngọc Liệp	xã	275
9910	xa_ngoc_my	Xã Ngọc Mỹ	xã	275
9913	xa_liep_tuyet	Xã Liệp Tuyết	xã	275
9916	xa_thach_than	Xã Thạch Thán	xã	275
9919	xa_dong_quang	Xã Đồng Quang	xã	275
9922	xa_phu_cat	Xã Phú Cát	xã	275
9925	xa_tuyet_nghia	Xã Tuyết Nghĩa	xã	275
9928	xa_nghia_huong	Xã Nghĩa Hương	xã	275
9931	xa_cong_hoa	Xã Cộng Hòa	xã	275
9934	xa_tan_phu	Xã Tân Phú	xã	275
9937	xa_dai_thanh	Xã Đại Thành	xã	275
9940	xa_phu_man	Xã Phú Mãn	xã	275
9943	xa_can_huu	Xã Cấn Hữu	xã	275
9946	xa_tan_hoa	Xã Tân Hòa	xã	275
9949	xa_hoa_thach	Xã Hòa Thạch	xã	275
9952	xa_dong_yen	Xã Đông Yên	xã	275
4927	xa_yen_trung	Xã Yên Trung	xã	276
4930	xa_yen_binh	Xã Yên Bình	xã	276
4936	xa_tien_xuan	Xã Tiến Xuân	xã	276
9955	thi_tran_lien_quan	Thị trấn Liên Quan	thị trấn	276
9958	xa_dai_dong	Xã Đại Đồng	xã	276
9961	xa_cam_yen	Xã Cẩm Yên	xã	276
9964	xa_lai_thuong	Xã Lại Thượng	xã	276
9967	xa_phu_kim	Xã Phú Kim	xã	276
9970	xa_huong_ngai	Xã Hương Ngải	xã	276
9973	xa_canh_nau	Xã Canh Nậu	xã	276
9976	xa_kim_quan	Xã Kim Quan	xã	276
9979	xa_di_nau	Xã Dị Nậu	xã	276
9982	xa_binh_yen	Xã Bình Yên	xã	276
9985	xa_chang_son	Xã Chàng Sơn	xã	276
9988	xa_thach_hoa	Xã Thạch Hoà	xã	276
9991	xa_can_kiem	Xã Cần Kiệm	xã	276
9994	xa_huu_bang	Xã Hữu Bằng	xã	276
9997	xa_phung_xa	Xã Phùng Xá	xã	276
10000	xa_tan_xa	Xã Tân Xã	xã	276
10003	xa_thach_xa	Xã Thạch Xá	xã	276
10006	xa_binh_phu	Xã Bình Phú	xã	276
10009	xa_ha_bang	Xã Hạ Bằng	xã	276
10012	xa_dong_truc	Xã Đồng Trúc	xã	276
10015	thi_tran_chuc_son	Thị trấn Chúc Sơn	thị trấn	277
10018	thi_tran_xuan_mai	Thị trấn Xuân Mai	thị trấn	277
10021	xa_phung_chau	Xã Phụng Châu	xã	277
10024	xa_tien_phuong	Xã Tiên Phương	xã	277
10027	xa_dong_son	Xã Đông Sơn	xã	277
10030	xa_dong_phuong_yen	Xã Đông Phương Yên	xã	277
10033	xa_phu_nghia	Xã Phú Nghĩa	xã	277
10039	xa_truong_yen	Xã Trường Yên	xã	277
10042	xa_ngoc_hoa	Xã Ngọc Hòa	xã	277
10045	xa_thuy_xuan_tien	Xã Thủy Xuân Tiên	xã	277
10048	xa_thanh_binh	Xã Thanh Bình	xã	277
10051	xa_trung_hoa	Xã Trung Hòa	xã	277
10054	xa_dai_yen	Xã Đại Yên	xã	277
10057	xa_thuy_huong	Xã Thụy Hương	xã	277
10060	xa_tot_dong	Xã Tốt Động	xã	277
10063	xa_lam_dien	Xã Lam Điền	xã	277
10066	xa_tan_tien	Xã Tân Tiến	xã	277
10069	xa_nam_phuong_tien	Xã Nam Phương Tiến	xã	277
10072	xa_hop_dong	Xã Hợp Đồng	xã	277
10075	xa_hoang_van_thu	Xã Hoàng Văn Thụ	xã	277
10078	xa_hoang_dieu	Xã Hoàng Diệu	xã	277
10081	xa_huu_van	Xã Hữu Văn	xã	277
10084	xa_quang_bi	Xã Quảng Bị	xã	277
10087	xa_my_luong	Xã Mỹ Lương	xã	277
10090	xa_thuong_vuc	Xã Thượng Vực	xã	277
10093	xa_hong_phong	Xã Hồng Phong	xã	277
10096	xa_dong_phu	Xã Đồng Phú	xã	277
10099	xa_tran_phu	Xã Trần Phú	xã	277
10102	xa_van_vo	Xã Văn Võ	xã	277
10105	xa_dong_lac	Xã Đồng Lạc	xã	277
10108	xa_hoa_chinh	Xã Hòa Chính	xã	277
10111	xa_phu_nam_an	Xã Phú Nam An	xã	277
10114	thi_tran_kim_bai	Thị trấn Kim Bài	thị trấn	278
10120	xa_cu_khe	Xã Cự Khê	xã	278
10126	xa_bich_hoa	Xã Bích Hòa	xã	278
10129	xa_my_hung	Xã Mỹ Hưng	xã	278
10132	xa_cao_vien	Xã Cao Viên	xã	278
10135	xa_binh_minh	Xã Bình Minh	xã	278
10138	xa_tam_hung	Xã Tam Hưng	xã	278
10141	xa_thanh_cao	Xã Thanh Cao	xã	278
10144	xa_thanh_thuy	Xã Thanh Thùy	xã	278
10147	xa_thanh_mai	Xã Thanh Mai	xã	278
10150	xa_thanh_van	Xã Thanh Văn	xã	278
10153	xa_do_dong	Xã Đỗ Động	xã	278
10156	xa_kim_an	Xã Kim An	xã	278
10159	xa_kim_thu	Xã Kim Thư	xã	278
10162	xa_phuong_trung	Xã Phương Trung	xã	278
10165	xa_tan_uoc	Xã Tân Ước	xã	278
10168	xa_dan_hoa	Xã Dân Hòa	xã	278
10171	xa_lien_chau	Xã Liên Châu	xã	278
10174	xa_cao_duong	Xã Cao Dương	xã	278
10177	xa_xuan_duong	Xã Xuân Dương	xã	278
10180	xa_hong_duong	Xã Hồng Dương	xã	278
10183	thi_tran_thuong_tin	Thị trấn Thường Tín	thị trấn	279
10186	xa_ninh_so	Xã Ninh Sở	xã	279
10189	xa_nhi_khe	Xã Nhị Khê	xã	279
10192	xa_duyen_thai	Xã Duyên Thái	xã	279
10195	xa_khanh_ha	Xã Khánh Hà	xã	279
10198	xa_hoa_binh	Xã Hòa Bình	xã	279
10201	xa_van_binh	Xã Văn Bình	xã	279
10204	xa_hien_giang	Xã Hiền Giang	xã	279
10207	xa_hong_van	Xã Hồng Vân	xã	279
10210	xa_van_tao	Xã Vân Tảo	xã	279
10213	xa_lien_phuong	Xã Liên Phương	xã	279
10216	xa_van_phu	Xã Văn Phú	xã	279
10219	xa_tu_nhien	Xã Tự Nhiên	xã	279
10222	xa_tien_phong	Xã Tiền Phong	xã	279
10225	xa_ha_hoi	Xã Hà Hồi	xã	279
10228	xa_thu_phu	Xã Thư Phú	xã	279
10231	xa_nguyen_trai	Xã Nguyễn Trãi	xã	279
10234	xa_quat_dong	Xã Quất Động	xã	279
10237	xa_chuong_duong	Xã Chương Dương	xã	279
10240	xa_tan_minh	Xã Tân Minh	xã	279
10243	xa_le_loi	Xã Lê Lợi	xã	279
10246	xa_thang_loi	Xã Thắng Lợi	xã	279
10249	xa_dung_tien	Xã Dũng Tiến	xã	279
10252	xa_thong_nhat	Xã Thống Nhất	xã	279
10255	xa_nghiem_xuyen	Xã Nghiêm Xuyên	xã	279
10258	xa_to_hieu	Xã Tô Hiệu	xã	279
10261	xa_van_tu	Xã Văn Tự	xã	279
10264	xa_van_diem	Xã Vạn Điểm	xã	279
10267	xa_minh_cuong	Xã Minh Cường	xã	279
10270	thi_tran_phu_minh	Thị trấn Phú Minh	thị trấn	280
10273	thi_tran_phu_xuyen	Thị trấn Phú Xuyên	thị trấn	280
10276	xa_hong_minh	Xã Hồng Minh	xã	280
10279	xa_phuong_duc	Xã Phượng Dực	xã	280
10282	xa_nam_tien	Xã Nam Tiến	xã	280
10288	xa_tri_trung	Xã Tri Trung	xã	280
10291	xa_dai_thang	Xã Đại Thắng	xã	280
10294	xa_phu_tuc	Xã Phú Túc	xã	280
10297	xa_van_hoang	Xã Văn Hoàng	xã	280
10300	xa_hong_thai	Xã Hồng Thái	xã	280
10303	xa_hoang_long	Xã Hoàng Long	xã	280
10306	xa_quang_trung	Xã Quang Trung	xã	280
10309	xa_nam_phong	Xã Nam Phong	xã	280
10312	xa_nam_trieu	Xã Nam Triều	xã	280
10315	xa_tan_dan	Xã Tân Dân	xã	280
10318	xa_son_ha	Xã Sơn Hà	xã	280
10321	xa_chuyen_my	Xã Chuyên Mỹ	xã	280
10324	xa_khai_thai	Xã Khai Thái	xã	280
10327	xa_phuc_tien	Xã Phúc Tiến	xã	280
10330	xa_van_tu	Xã Vân Từ	xã	280
10333	xa_tri_thuy	Xã Tri Thủy	xã	280
10336	xa_dai_xuyen	Xã Đại Xuyên	xã	280
10339	xa_phu_yen	Xã Phú Yên	xã	280
10342	xa_bach_ha	Xã Bạch Hạ	xã	280
10345	xa_quang_lang	Xã Quang Lãng	xã	280
10348	xa_chau_can	Xã Châu Can	xã	280
10351	xa_minh_tan	Xã Minh Tân	xã	280
10354	thi_tran_van_dinh	Thị trấn Vân Đình	thị trấn	281
10357	xa_vien_an	Xã Viên An	xã	281
10360	xa_vien_noi	Xã Viên Nội	xã	281
10363	xa_hoa_son	Xã Hoa Sơn	xã	281
10366	xa_quang_phu_cau	Xã Quảng Phú Cầu	xã	281
10369	xa_truong_thinh	Xã Trường Thịnh	xã	281
10372	xa_cao_thanh	Xã Cao Thành	xã	281
10375	xa_lien_bat	Xã Liên Bạt	xã	281
10378	xa_son_cong	Xã Sơn Công	xã	281
10381	xa_dong_tien	Xã Đồng Tiến	xã	281
10384	xa_phuong_tu	Xã Phương Tú	xã	281
10387	xa_trung_tu	Xã Trung Tú	xã	281
10390	xa_dong_tan	Xã Đồng Tân	xã	281
10393	xa_tao_duong_van	Xã Tảo Dương Văn	xã	281
10396	xa_van_thai	Xã Vạn Thái	xã	281
10399	xa_minh_duc	Xã Minh Đức	xã	281
10402	xa_hoa_lam	Xã Hòa Lâm	xã	281
10405	xa_hoa_xa	Xã Hòa Xá	xã	281
10408	xa_tram_long	Xã Trầm Lộng	xã	281
10411	xa_kim_duong	Xã Kim Đường	xã	281
10414	xa_hoa_nam	Xã Hòa Nam	xã	281
10417	xa_hoa_phu	Xã Hòa Phú	xã	281
10420	xa_doi_binh	Xã Đội Bình	xã	281
10423	xa_dai_hung	Xã Đại Hùng	xã	281
10426	xa_dong_lo	Xã Đông Lỗ	xã	281
10429	xa_phu_luu	Xã Phù Lưu	xã	281
10432	xa_dai_cuong	Xã Đại Cường	xã	281
10435	xa_luu_hoang	Xã Lưu Hoàng	xã	281
10438	xa_hong_quang	Xã Hồng Quang	xã	281
10441	thi_tran_dai_nghia	Thị trấn Đại Nghĩa	thị trấn	282
10444	xa_dong_tam	Xã Đồng Tâm	xã	282
10447	xa_thuong_lam	Xã Thượng Lâm	xã	282
10450	xa_tuy_lai	Xã Tuy Lai	xã	282
10453	xa_phuc_lam	Xã Phúc Lâm	xã	282
10456	xa_my_thanh	Xã Mỹ Thành	xã	282
10459	xa_bot_xuyen	Xã Bột Xuyên	xã	282
10462	xa_an_my	Xã An Mỹ	xã	282
10465	xa_hong_son	Xã Hồng Sơn	xã	282
10468	xa_le_thanh	Xã Lê Thanh	xã	282
10471	xa_xuy_xa	Xã Xuy Xá	xã	282
10474	xa_phung_xa	Xã Phùng Xá	xã	282
10477	xa_phu_luu_te	Xã Phù Lưu Tế	xã	282
10480	xa_dai_hung	Xã Đại Hưng	xã	282
10483	xa_van_kim	Xã Vạn Kim	xã	282
10486	xa_doc_tin	Xã Đốc Tín	xã	282
10489	xa_huong_son	Xã Hương Sơn	xã	282
10492	xa_hung_tien	Xã Hùng Tiến	xã	282
10495	xa_an_tien	Xã An Tiến	xã	282
10498	xa_hop_tien	Xã Hợp Tiến	xã	282
10501	xa_hop_thanh	Xã Hợp Thanh	xã	282
10504	xa_an_phu	Xã An Phú	xã	282
688	phuong_quang_trung	Phường Quang Trung	phường	24
691	phuong_tran_phu	Phường Trần Phú	phường	24
692	phuong_ngoc_ha	Phường Ngọc Hà	phường	24
694	phuong_nguyen_trai	Phường Nguyễn Trãi	phường	24
697	phuong_minh_khai	Phường Minh Khai	phường	24
700	xa_ngoc_duong	Xã Ngọc Đường	xã	24
946	xa_phuong_do	Xã Phương Độ	xã	24
949	xa_phuong_thien	Xã Phương Thiện	xã	24
712	thi_tran_pho_bang	Thị trấn Phó Bảng	thị trấn	26
715	xa_lung_cu	Xã Lũng Cú	xã	26
718	xa_ma_le	Xã Má Lé	xã	26
721	thi_tran_dong_van	Thị trấn Đồng Văn	thị trấn	26
724	xa_lung_tao	Xã Lũng Táo	xã	26
727	xa_pho_la	Xã Phố Là	xã	26
730	xa_thai_phin_tung	Xã Thài Phìn Tủng	xã	26
733	xa_sung_la	Xã Sủng Là	xã	26
736	xa_xa_phin	Xã Xà Phìn	xã	26
739	xa_ta_phin	Xã Tả Phìn	xã	26
742	xa_ta_lung	Xã Tả Lủng	xã	26
745	xa_pho_cao	Xã Phố Cáo	xã	26
748	xa_sinh_lung	Xã Sính Lủng	xã	26
751	xa_sang_tung	Xã Sảng Tủng	xã	26
754	xa_lung_thau	Xã Lũng Thầu	xã	26
757	xa_ho_quang_phin	Xã Hố Quáng Phìn	xã	26
760	xa_van_chai	Xã Vần Chải	xã	26
763	xa_lung_phin	Xã Lũng Phìn	xã	26
766	xa_sung_trai	Xã Sủng Trái	xã	26
769	thi_tran_meo_vac	Thị trấn Mèo Vạc	thị trấn	27
772	xa_thuong_phung	Xã Thượng Phùng	xã	27
775	xa_pai_lung	Xã Pải Lủng	xã	27
778	xa_xin_cai	Xã Xín Cái	xã	27
781	xa_pa_vi	Xã Pả Vi	xã	27
784	xa_giang_chu_phin	Xã Giàng Chu Phìn	xã	27
787	xa_sung_tra	Xã Sủng Trà	xã	27
790	xa_sung_mang	Xã Sủng Máng	xã	27
793	xa_son_vi	Xã Sơn Vĩ	xã	27
796	xa_ta_lung	Xã Tả Lủng	xã	27
799	xa_can_chu_phin	Xã Cán Chu Phìn	xã	27
802	xa_lung_pu	Xã Lũng Pù	xã	27
805	xa_lung_chinh	Xã Lũng Chinh	xã	27
808	xa_tat_nga	Xã Tát Ngà	xã	27
811	xa_nam_ban	Xã Nậm Ban	xã	27
814	xa_khau_vai	Xã Khâu Vai	xã	27
815	xa_niem_tong	Xã Niêm Tòng	xã	27
817	xa_niem_son	Xã Niêm Sơn	xã	27
820	thi_tran_yen_minh	Thị trấn Yên Minh	thị trấn	28
823	xa_thang_mo	Xã Thắng Mố	xã	28
826	xa_phu_lung	Xã Phú Lũng	xã	28
829	xa_sung_trang	Xã Sủng Tráng	xã	28
832	xa_bach_dich	Xã Bạch Đích	xã	28
835	xa_na_khe	Xã Na Khê	xã	28
838	xa_sung_thai	Xã Sủng Thài	xã	28
841	xa_huu_vinh	Xã Hữu Vinh	xã	28
844	xa_lao_va_chai	Xã Lao Và Chải	xã	28
847	xa_mau_due	Xã Mậu Duệ	xã	28
850	xa_dong_minh	Xã Đông Minh	xã	28
853	xa_mau_long	Xã Mậu Long	xã	28
856	xa_ngam_la	Xã Ngam La	xã	28
859	xa_ngoc_long	Xã Ngọc Long	xã	28
862	xa_duong_thuong	Xã Đường Thượng	xã	28
865	xa_lung_ho	Xã Lũng Hồ	xã	28
868	xa_du_tien	Xã Du Tiến	xã	28
871	xa_du_gia	Xã Du Già	xã	28
874	thi_tran_tam_son	Thị trấn Tam Sơn	thị trấn	29
877	xa_bat_dai_son	Xã Bát Đại Sơn	xã	29
880	xa_nghia_thuan	Xã Nghĩa Thuận	xã	29
883	xa_can_ty	Xã Cán Tỷ	xã	29
886	xa_cao_ma_po	Xã Cao Mã Pờ	xã	29
889	xa_thanh_van	Xã Thanh Vân	xã	29
892	xa_tung_vai	Xã Tùng Vài	xã	29
895	xa_dong_ha	Xã Đông Hà	xã	29
898	xa_quan_ba	Xã Quản Bạ	xã	29
901	xa_lung_tam	Xã Lùng Tám	xã	29
904	xa_quyet_tien	Xã Quyết Tiến	xã	29
907	xa_ta_van	Xã Tả Ván	xã	29
910	xa_thai_an	Xã Thái An	xã	29
703	xa_kim_thach	Xã Kim Thạch	xã	30
706	xa_phu_linh	Xã Phú Linh	xã	30
709	xa_kim_linh	Xã Kim Linh	xã	30
913	thi_tran_vi_xuyen	Thị trấn Vị Xuyên	thị trấn	30
916	thi_tran_nong_truong_viet_lam	Thị trấn Nông Trường Việt Lâm	thị trấn	30
919	xa_minh_tan	Xã Minh Tân	xã	30
922	xa_thuan_hoa	Xã Thuận Hoà	xã	30
925	xa_tung_ba	Xã Tùng Bá	xã	30
928	xa_thanh_thuy	Xã Thanh Thủy	xã	30
931	xa_thanh_duc	Xã Thanh Đức	xã	30
934	xa_phong_quang	Xã Phong Quang	xã	30
937	xa_xin_chai	Xã Xín Chải	xã	30
940	xa_phuong_tien	Xã Phương Tiến	xã	30
943	xa_lao_chai	Xã Lao Chải	xã	30
952	xa_cao_bo	Xã Cao Bồ	xã	30
955	xa_dao_duc	Xã Đạo Đức	xã	30
958	xa_thuong_son	Xã Thượng Sơn	xã	30
961	xa_linh_ho	Xã Linh Hồ	xã	30
964	xa_quang_ngan	Xã Quảng Ngần	xã	30
967	xa_viet_lam	Xã Việt Lâm	xã	30
970	xa_ngoc_linh	Xã Ngọc Linh	xã	30
973	xa_ngoc_minh	Xã Ngọc Minh	xã	30
976	xa_bach_ngoc	Xã Bạch Ngọc	xã	30
979	xa_trung_thanh	Xã Trung Thành	xã	30
982	xa_minh_son	Xã Minh Sơn	xã	31
985	xa_giap_trung	Xã Giáp Trung	xã	31
988	xa_yen_dinh	Xã Yên Định	xã	31
991	thi_tran_yen_phu	Thị trấn Yên Phú	thị trấn	31
994	xa_minh_ngoc	Xã Minh Ngọc	xã	31
997	xa_yen_phong	Xã Yên Phong	xã	31
1000	xa_lac_nong	Xã Lạc Nông	xã	31
1003	xa_phu_nam	Xã Phú Nam	xã	31
1006	xa_yen_cuong	Xã Yên Cường	xã	31
1009	xa_thuong_tan	Xã Thượng Tân	xã	31
1012	xa_duong_am	Xã Đường Âm	xã	31
1015	xa_duong_hong	Xã Đường Hồng	xã	31
1018	xa_phieng_luong	Xã Phiêng Luông	xã	31
1021	thi_tran_vinh_quang	Thị trấn Vinh Quang	thị trấn	32
1024	xa_ban_may	Xã Bản Máy	xã	32
1027	xa_thang_tin	Xã Thàng Tín	xã	32
1030	xa_then_chu_phin	Xã Thèn Chu Phìn	xã	32
1033	xa_po_lo	Xã Pố Lồ	xã	32
1036	xa_ban_phung	Xã Bản Phùng	xã	32
1039	xa_tung_san	Xã Túng Sán	xã	32
1042	xa_chien_pho	Xã Chiến Phố	xã	32
1045	xa_dan_van	Xã Đản Ván	xã	32
1048	xa_tu_nhan	Xã Tụ Nhân	xã	32
1051	xa_tan_tien	Xã Tân Tiến	xã	32
1054	xa_nang_don	Xã Nàng Đôn	xã	32
1057	xa_po_ly_ngai	Xã Pờ Ly Ngài	xã	32
1060	xa_san_xa_ho	Xã Sán Xả Hồ	xã	32
1063	xa_ban_luoc	Xã Bản Luốc	xã	32
1066	xa_ngam_dang_vai	Xã Ngàm Đăng Vài	xã	32
1069	xa_ban_nhung	Xã Bản Nhùng	xã	32
1072	xa_ta_su_choong	Xã Tả Sử Choóng	xã	32
1075	xa_nam_dich	Xã Nậm Dịch	xã	32
1081	xa_ho_thau	Xã Hồ Thầu	xã	32
1084	xa_nam_son	Xã Nam Sơn	xã	32
1087	xa_nam_ty	Xã Nậm Tỵ	xã	32
1090	xa_thong_nguyen	Xã Thông Nguyên	xã	32
1093	xa_nam_khoa	Xã Nậm Khòa	xã	32
1096	thi_tran_coc_pai	Thị trấn Cốc Pài	thị trấn	33
1099	xa_nan_xin	Xã Nàn Xỉn	xã	33
1102	xa_ban_diu	Xã Bản Díu	xã	33
1105	xa_chi_ca	Xã Chí Cà	xã	33
1108	xa_xin_man	Xã Xín Mần	xã	33
1114	xa_then_phang	Xã Thèn Phàng	xã	33
1117	xa_trung_thinh	Xã Trung Thịnh	xã	33
1120	xa_pa_vay_su	Xã Pà Vầy Sủ	xã	33
1123	xa_coc_re	Xã Cốc Rế	xã	33
1126	xa_thu_ta	Xã Thu Tà	xã	33
1129	xa_nan_ma	Xã Nàn Ma	xã	33
1132	xa_ta_nhiu	Xã Tả Nhìu	xã	33
1135	xa_ban_ngo	Xã Bản Ngò	xã	33
1138	xa_che_la	Xã Chế Là	xã	33
1141	xa_nam_dan	Xã Nấm Dẩn	xã	33
1144	xa_quang_nguyen	Xã Quảng Nguyên	xã	33
1147	xa_na_chi	Xã Nà Chì	xã	33
1150	xa_khuon_lung	Xã Khuôn Lùng	xã	33
1153	thi_tran_viet_quang	Thị trấn Việt Quang	thị trấn	34
1156	thi_tran_vinh_tuy	Thị trấn Vĩnh Tuy	thị trấn	34
1159	xa_tan_lap	Xã Tân Lập	xã	34
1162	xa_tan_thanh	Xã Tân Thành	xã	34
1165	xa_dong_tien	Xã Đồng Tiến	xã	34
1168	xa_dong_tam	Xã Đồng Tâm	xã	34
1171	xa_tan_quang	Xã Tân Quang	xã	34
1174	xa_thuong_binh	Xã Thượng Bình	xã	34
1177	xa_huu_san	Xã Hữu Sản	xã	34
1180	xa_kim_ngoc	Xã Kim Ngọc	xã	34
1183	xa_viet_vinh	Xã Việt Vinh	xã	34
1186	xa_bang_hanh	Xã Bằng Hành	xã	34
1189	xa_quang_minh	Xã Quang Minh	xã	34
1192	xa_lien_hiep	Xã Liên Hiệp	xã	34
1195	xa_vo_diem	Xã Vô Điếm	xã	34
1198	xa_viet_hong	Xã Việt Hồng	xã	34
1201	xa_hung_an	Xã Hùng An	xã	34
1204	xa_duc_xuan	Xã Đức Xuân	xã	34
1207	xa_tien_kieu	Xã Tiên Kiều	xã	34
1210	xa_vinh_hao	Xã Vĩnh Hảo	xã	34
1213	xa_vinh_phuc	Xã Vĩnh Phúc	xã	34
1216	xa_dong_yen	Xã Đồng Yên	xã	34
1219	xa_dong_thanh	Xã Đông Thành	xã	34
1222	xa_xuan_minh	Xã Xuân Minh	xã	35
1225	xa_tien_nguyen	Xã Tiên Nguyên	xã	35
1228	xa_tan_nam	Xã Tân Nam	xã	35
1231	xa_ban_ria	Xã Bản Rịa	xã	35
1234	xa_yen_thanh	Xã Yên Thành	xã	35
1237	thi_tran_yen_binh	Thị trấn Yên Bình	thị trấn	35
1240	xa_tan_trinh	Xã Tân Trịnh	xã	35
1243	xa_tan_bac	Xã Tân Bắc	xã	35
1246	xa_bang_lang	Xã Bằng Lang	xã	35
1249	xa_yen_ha	Xã Yên Hà	xã	35
1252	xa_huong_son	Xã Hương Sơn	xã	35
1255	xa_xuan_giang	Xã Xuân Giang	xã	35
1258	xa_na_khuong	Xã Nà Khương	xã	35
1261	xa_tien_yen	Xã Tiên Yên	xã	35
1264	xa_vi_thuong	Xã Vĩ Thượng	xã	35
1267	phuong_song_hien	Phường Sông Hiến	phường	40
1270	phuong_song_bang	Phường Sông Bằng	phường	40
1273	phuong_hop_giang	Phường Hợp Giang	phường	40
1276	phuong_tan_giang	Phường Tân Giang	phường	40
1279	phuong_ngoc_xuan	Phường Ngọc Xuân	phường	40
1282	phuong_de_tham	Phường Đề Thám	phường	40
1285	phuong_hoa_chung	Phường Hoà Chung	phường	40
1288	phuong_duyet_trung	Phường Duyệt Trung	phường	40
1693	xa_vinh_quang	Xã Vĩnh Quang	xã	40
1705	xa_hung_dao	Xã Hưng Đạo	xã	40
1720	xa_chu_trinh	Xã Chu Trinh	xã	40
1290	thi_tran_pac_miau	Thị trấn Pác Miầu	thị trấn	42
1291	xa_duc_hanh	Xã Đức Hạnh	xã	42
1294	xa_ly_bon	Xã Lý Bôn	xã	42
1296	xa_nam_cao	Xã Nam Cao	xã	42
1297	xa_nam_quang	Xã Nam Quang	xã	42
1300	xa_vinh_quang	Xã Vĩnh Quang	xã	42
1303	xa_quang_lam	Xã Quảng Lâm	xã	42
1304	xa_thach_lam	Xã Thạch Lâm	xã	42
1309	xa_vinh_phong	Xã Vĩnh Phong	xã	42
1312	xa_mong_an	Xã Mông Ân	xã	42
1315	xa_thai_hoc	Xã Thái Học	xã	42
1316	xa_thai_son	Xã Thái Sơn	xã	42
1318	xa_yen_tho	Xã Yên Thổ	xã	42
1321	thi_tran_bao_lac	Thị trấn Bảo Lạc	thị trấn	43
1324	xa_coc_pang	Xã Cốc Pàng	xã	43
1327	xa_thuong_ha	Xã Thượng Hà	xã	43
1330	xa_co_ba	Xã Cô Ba	xã	43
1333	xa_bao_toan	Xã Bảo Toàn	xã	43
1336	xa_khanh_xuan	Xã Khánh Xuân	xã	43
1339	xa_xuan_truong	Xã Xuân Trường	xã	43
1342	xa_hong_tri	Xã Hồng Trị	xã	43
1343	xa_kim_cuc	Xã Kim Cúc	xã	43
1345	xa_phan_thanh	Xã Phan Thanh	xã	43
1348	xa_hong_an	Xã Hồng An	xã	43
1351	xa_hung_dao	Xã Hưng Đạo	xã	43
1352	xa_hung_thinh	Xã Hưng Thịnh	xã	43
1354	xa_huy_giap	Xã Huy Giáp	xã	43
1357	xa_dinh_phung	Xã Đình Phùng	xã	43
1359	xa_son_lap	Xã Sơn Lập	xã	43
1360	xa_son_lo	Xã Sơn Lộ	xã	43
1363	thi_tran_thong_nong	Thị trấn Thông Nông	thị trấn	45
1366	xa_can_yen	Xã Cần Yên	xã	45
1367	xa_can_nong	Xã Cần Nông	xã	45
1372	xa_luong_thong	Xã Lương Thông	xã	45
1375	xa_da_thong	Xã Đa Thông	xã	45
1378	xa_ngoc_dong	Xã Ngọc Động	xã	45
1381	xa_yen_son	Xã Yên Sơn	xã	45
1384	xa_luong_can	Xã Lương Can	xã	45
1387	xa_thanh_long	Xã Thanh Long	xã	45
1392	thi_tran_xuan_hoa	Thị trấn Xuân Hòa	thị trấn	45
1393	xa_lung_nam	Xã Lũng Nặm	xã	45
1399	xa_truong_ha	Xã Trường Hà	xã	45
1402	xa_cai_vien	Xã Cải Viên	xã	45
1411	xa_noi_thon	Xã Nội Thôn	xã	45
1414	xa_tong_cot	Xã Tổng Cọt	xã	45
1417	xa_soc_ha	Xã Sóc Hà	xã	45
1420	xa_thuong_thon	Xã Thượng Thôn	xã	45
1429	xa_hong_sy	Xã Hồng Sỹ	xã	45
1432	xa_quy_quan	Xã Quý Quân	xã	45
1435	xa_ma_ba	Xã Mã Ba	xã	45
1438	xa_ngoc_dao	Xã Ngọc Đào	xã	45
1447	thi_tran_tra_linh	Thị trấn Trà Lĩnh	thị trấn	47
1453	xa_tri_phuong	Xã Tri Phương	xã	47
1456	xa_quang_han	Xã Quang Hán	xã	47
1462	xa_xuan_noi	Xã Xuân Nội	xã	47
1465	xa_quang_trung	Xã Quang Trung	xã	47
1468	xa_quang_vinh	Xã Quang Vinh	xã	47
1471	xa_cao_chuong	Xã Cao Chương	xã	47
1477	thi_tran_trung_khanh	Thị trấn Trùng Khánh	thị trấn	47
1480	xa_ngoc_khe	Xã Ngọc Khê	xã	47
1481	xa_ngoc_con	Xã Ngọc Côn	xã	47
1483	xa_phong_nam	Xã Phong Nậm	xã	47
1489	xa_dinh_phong	Xã Đình Phong	xã	47
1495	xa_dam_thuy	Xã Đàm Thuỷ	xã	47
1498	xa_kham_thanh	Xã Khâm Thành	xã	47
1501	xa_chi_vien	Xã Chí Viễn	xã	47
1504	xa_lang_hieu	Xã Lăng Hiếu	xã	47
1507	xa_phong_chau	Xã Phong Châu	xã	47
1516	xa_trung_phuc	Xã Trung Phúc	xã	47
1519	xa_cao_thang	Xã Cao Thăng	xã	47
1522	xa_duc_hong	Xã Đức Hồng	xã	47
1525	xa_doai_duong	Xã Đoài Dương	xã	47
1534	xa_minh_long	Xã Minh Long	xã	48
1537	xa_ly_quoc	Xã Lý Quốc	xã	48
1540	xa_thang_loi	Xã Thắng Lợi	xã	48
1543	xa_dong_loan	Xã Đồng Loan	xã	48
1546	xa_duc_quang	Xã Đức Quang	xã	48
1549	xa_kim_loan	Xã Kim Loan	xã	48
1552	xa_quang_long	Xã Quang Long	xã	48
1555	xa_an_lac	Xã An Lạc	xã	48
1558	thi_tran_thanh_nhat	Thị trấn Thanh Nhật	thị trấn	48
1561	xa_vinh_quy	Xã Vinh Quý	xã	48
1564	xa_thong_nhat	Xã Thống Nhất	xã	48
1567	xa_co_ngan	Xã Cô Ngân	xã	48
1573	xa_thi_hoa	Xã Thị Hoa	xã	48
1474	xa_quoc_toan	Xã Quốc Toản	xã	49
1576	thi_tran_quang_uyen	Thị trấn Quảng Uyên	thị trấn	49
1579	xa_phi_hai	Xã Phi Hải	xã	49
1582	xa_quang_hung	Xã Quảng Hưng	xã	49
1594	xa_doc_lap	Xã Độc Lập	xã	49
1597	xa_cai_bo	Xã Cai Bộ	xã	49
1603	xa_phuc_sen	Xã Phúc Sen	xã	49
1606	xa_chi_thao	Xã Chí Thảo	xã	49
1609	xa_tu_do	Xã Tự Do	xã	49
1615	xa_hong_quang	Xã Hồng Quang	xã	49
1618	xa_ngoc_dong	Xã Ngọc Động	xã	49
1624	xa_hanh_phuc	Xã Hạnh Phúc	xã	49
1627	thi_tran_ta_lung	Thị trấn Tà Lùng	thị trấn	49
1630	xa_be_van_dan	Xã Bế Văn Đàn	xã	49
1636	xa_cach_linh	Xã Cách Linh	xã	49
1639	xa_dai_son	Xã Đại Sơn	xã	49
1645	xa_tien_thanh	Xã Tiên Thành	xã	49
1648	thi_tran_hoa_thuan	Thị trấn Hoà Thuận	thị trấn	49
1651	xa_my_hung	Xã Mỹ Hưng	xã	49
1654	thi_tran_nuoc_hai	Thị trấn Nước Hai	thị trấn	51
1657	xa_dan_chu	Xã Dân Chủ	xã	51
1660	xa_nam_tuan	Xã Nam Tuấn	xã	51
1666	xa_dai_tien	Xã Đại Tiến	xã	51
1669	xa_duc_long	Xã Đức Long	xã	51
1672	xa_ngu_lao	Xã Ngũ Lão	xã	51
1675	xa_truong_luong	Xã Trương Lương	xã	51
1687	xa_hong_viet	Xã Hồng Việt	xã	51
1696	xa_hoang_tung	Xã Hoàng Tung	xã	51
1699	xa_nguyen_hue	Xã Nguyễn Huệ	xã	51
1702	xa_quang_trung	Xã Quang Trung	xã	51
1708	xa_bach_dang	Xã Bạch Đằng	xã	51
1711	xa_binh_duong	Xã Bình Dương	xã	51
1714	xa_le_chung	Xã Lê Chung	xã	51
1723	xa_hong_nam	Xã Hồng Nam	xã	51
1726	thi_tran_nguyen_binh	Thị trấn Nguyên Bình	thị trấn	52
1729	thi_tran_tinh_tuc	Thị trấn Tĩnh Túc	thị trấn	52
1732	xa_yen_lac	Xã Yên Lạc	xã	52
1735	xa_trieu_nguyen	Xã Triệu Nguyên	xã	52
1738	xa_ca_thanh	Xã Ca Thành	xã	52
1744	xa_vu_nong	Xã Vũ Nông	xã	52
1747	xa_minh_tam	Xã Minh Tâm	xã	52
1750	xa_the_duc	Xã Thể Dục	xã	52
1756	xa_mai_long	Xã Mai Long	xã	52
1762	xa_vu_minh	Xã Vũ Minh	xã	52
1765	xa_hoa_tham	Xã Hoa Thám	xã	52
1768	xa_phan_thanh	Xã Phan Thanh	xã	52
1771	xa_quang_thanh	Xã Quang Thành	xã	52
1774	xa_tam_kim	Xã Tam Kim	xã	52
1777	xa_thanh_cong	Xã Thành Công	xã	52
1780	xa_thinh_vuong	Xã Thịnh Vượng	xã	52
1783	xa_hung_dao	Xã Hưng Đạo	xã	52
1786	thi_tran_dong_khe	Thị trấn Đông Khê	thị trấn	53
1789	xa_canh_tan	Xã Canh Tân	xã	53
1792	xa_kim_dong	Xã Kim Đồng	xã	53
1795	xa_minh_khai	Xã Minh Khai	xã	53
1801	xa_duc_thong	Xã Đức Thông	xã	53
1804	xa_thai_cuong	Xã Thái Cường	xã	53
1807	xa_van_trinh	Xã Vân Trình	xã	53
1810	xa_thuy_hung	Xã Thụy Hùng	xã	53
1813	xa_quang_trong	Xã Quang Trọng	xã	53
1816	xa_trong_con	Xã Trọng Con	xã	53
1819	xa_le_lai	Xã Lê Lai	xã	53
1822	xa_duc_long	Xã Đức Long	xã	53
1828	xa_le_loi	Xã Lê Lợi	xã	53
1831	xa_duc_xuan	Xã Đức Xuân	xã	53
1834	phuong_nguyen_thi_minh_khai	Phường Nguyễn Thị Minh Khai	phường	58
1837	phuong_song_cau	Phường Sông Cầu	phường	58
1840	phuong_duc_xuan	Phường Đức Xuân	phường	58
1843	phuong_phung_chi_kien	Phường Phùng Chí Kiên	phường	58
1846	phuong_huyen_tung	Phường Huyền Tụng	phường	58
1849	xa_duong_quang	Xã Dương Quang	xã	58
1852	xa_nong_thuong	Xã Nông Thượng	xã	58
1855	phuong_xuat_hoa	Phường Xuất Hóa	phường	58
1858	xa_bang_thanh	Xã Bằng Thành	xã	60
1861	xa_nhan_mon	Xã Nhạn Môn	xã	60
1864	xa_boc_bo	Xã Bộc Bố	xã	60
1867	xa_cong_bang	Xã Công Bằng	xã	60
1870	xa_giao_hieu	Xã Giáo Hiệu	xã	60
1873	xa_xuan_la	Xã Xuân La	xã	60
1876	xa_an_thang	Xã An Thắng	xã	60
1879	xa_co_linh	Xã Cổ Linh	xã	60
1882	xa_nghien_loan	Xã Nghiên Loan	xã	60
1885	xa_cao_tan	Xã Cao Tân	xã	60
1888	thi_tran_cho_ra	Thị trấn Chợ Rã	thị trấn	61
1891	xa_banh_trach	Xã Bành Trạch	xã	61
1894	xa_phuc_loc	Xã Phúc Lộc	xã	61
1897	xa_ha_hieu	Xã Hà Hiệu	xã	61
1900	xa_cao_thuong	Xã Cao Thượng	xã	61
1906	xa_khang_ninh	Xã Khang Ninh	xã	61
1909	xa_nam_mau	Xã Nam Mẫu	xã	61
1912	xa_thuong_giao	Xã Thượng Giáo	xã	61
20446	xa_trhy	Xã Tr'Hy	xã	504
1915	xa_dia_linh	Xã Địa Linh	xã	61
1918	xa_yen_duong	Xã Yến Dương	xã	61
1921	xa_chu_huong	Xã Chu Hương	xã	61
1924	xa_quang_khe	Xã Quảng Khê	xã	61
1927	xa_my_phuong	Xã Mỹ Phương	xã	61
1930	xa_hoang_tri	Xã Hoàng Trĩ	xã	61
1933	xa_dong_phuc	Xã Đồng Phúc	xã	61
1936	thi_tran_na_phac	Thị trấn Nà Phặc	thị trấn	62
1939	xa_thuong_an	Xã Thượng Ân	xã	62
1942	xa_bang_van	Xã Bằng Vân	xã	62
1945	xa_coc_dan	Xã Cốc Đán	xã	62
1948	xa_trung_hoa	Xã Trung Hoà	xã	62
1951	xa_duc_van	Xã Đức Vân	xã	62
1954	xa_van_tung	Xã Vân Tùng	xã	62
1957	xa_thuong_quan	Xã Thượng Quan	xã	62
1960	xa_hiep_luc	Xã Hiệp Lực	xã	62
1963	xa_thuan_mang	Xã Thuần Mang	xã	62
1969	thi_tran_phu_thong	Thị trấn Phủ Thông	thị trấn	63
1975	xa_vi_huong	Xã Vi Hương	xã	63
1978	xa_si_binh	Xã Sĩ Bình	xã	63
1981	xa_vu_muon	Xã Vũ Muộn	xã	63
1984	xa_don_phong	Xã Đôn Phong	xã	63
1990	xa_luc_binh	Xã Lục Bình	xã	63
1993	xa_tan_tu	Xã Tân Tú	xã	63
1999	xa_nguyen_phuc	Xã Nguyên Phúc	xã	63
2002	xa_cao_son	Xã Cao Sơn	xã	63
2005	xa_quan_ha	Xã Quân Hà	xã	63
2008	xa_cam_giang	Xã Cẩm Giàng	xã	63
2011	xa_my_thanh	Xã Mỹ Thanh	xã	63
2014	xa_duong_phong	Xã Dương Phong	xã	63
2017	xa_quang_thuan	Xã Quang Thuận	xã	63
2020	thi_tran_bang_lung	Thị trấn Bằng Lũng	thị trấn	64
2023	xa_xuan_lac	Xã Xuân Lạc	xã	64
2026	xa_nam_cuong	Xã Nam Cường	xã	64
2029	xa_dong_lac	Xã Đồng Lạc	xã	64
2032	xa_tan_lap	Xã Tân Lập	xã	64
2035	xa_ban_thi	Xã Bản Thi	xã	64
2038	xa_quang_bach	Xã Quảng Bạch	xã	64
2041	xa_bang_phuc	Xã Bằng Phúc	xã	64
2044	xa_yen_thinh	Xã Yên Thịnh	xã	64
2047	xa_yen_thuong	Xã Yên Thượng	xã	64
2050	xa_phuong_vien	Xã Phương Viên	xã	64
2053	xa_ngoc_phai	Xã Ngọc Phái	xã	64
2059	xa_dong_thang	Xã Đồng Thắng	xã	64
2062	xa_luong_bang	Xã Lương Bằng	xã	64
2065	xa_bang_lang	Xã Bằng Lãng	xã	64
2068	xa_dai_sao	Xã Đại Sảo	xã	64
2071	xa_nghia_ta	Xã Nghĩa Tá	xã	64
2077	xa_yen_my	Xã Yên Mỹ	xã	64
2080	xa_binh_trung	Xã Bình Trung	xã	64
2083	xa_yen_phong	Xã Yên Phong	xã	64
2086	thi_tran_dong_tam	Thị trấn Đồng Tâm	thị trấn	65
2089	xa_tan_son	Xã Tân Sơn	xã	65
2092	xa_thanh_van	Xã Thanh Vận	xã	65
2095	xa_mai_lap	Xã Mai Lạp	xã	65
2098	xa_hoa_muc	Xã Hoà Mục	xã	65
2101	xa_thanh_mai	Xã Thanh Mai	xã	65
2104	xa_cao_ky	Xã Cao Kỳ	xã	65
2107	xa_nong_ha	Xã Nông Hạ	xã	65
2110	xa_yen_cu	Xã Yên Cư	xã	65
2113	xa_thanh_thinh	Xã Thanh Thịnh	xã	65
2116	xa_yen_han	Xã Yên Hân	xã	65
2122	xa_nhu_co	Xã Như Cố	xã	65
2125	xa_binh_van	Xã Bình Văn	xã	65
2131	xa_quang_chu	Xã Quảng Chu	xã	65
2137	xa_van_vu	Xã Văn Vũ	xã	66
2140	xa_van_lang	Xã Văn Lang	xã	66
2143	xa_luong_thuong	Xã Lương Thượng	xã	66
2146	xa_kim_hy	Xã Kim Hỷ	xã	66
2152	xa_cuong_loi	Xã Cường Lợi	xã	66
2155	thi_tran_yen_lac	Thị trấn Yến Lạc	thị trấn	66
2158	xa_kim_lu	Xã Kim Lư	xã	66
2161	xa_son_thanh	Xã Sơn Thành	xã	66
2170	xa_van_minh	Xã Văn Minh	xã	66
2173	xa_con_minh	Xã Côn Minh	xã	66
2176	xa_cu_le	Xã Cư Lễ	xã	66
2179	xa_tran_phu	Xã Trần Phú	xã	66
2185	xa_quang_phong	Xã Quang Phong	xã	66
2188	xa_duong_son	Xã Dương Sơn	xã	66
2191	xa_xuan_duong	Xã Xuân Dương	xã	66
2194	xa_dong_xa	Xã Đổng Xá	xã	66
2197	xa_liem_thuy	Xã Liêm Thuỷ	xã	66
2200	phuong_phan_thiet	Phường Phan Thiết	phường	70
2203	phuong_minh_xuan	Phường Minh Xuân	phường	70
2206	phuong_tan_quang	Phường Tân Quang	phường	70
2209	xa_trang_da	Xã Tràng Đà	xã	70
2212	phuong_nong_tien	Phường Nông Tiến	phường	70
2215	phuong_y_la	Phường Ỷ La	phường	70
2216	phuong_tan_ha	Phường Tân Hà	phường	70
2218	phuong_hung_thanh	Phường Hưng Thành	phường	70
2497	xa_kim_phu	Xã Kim Phú	xã	70
2503	xa_an_khang	Xã An Khang	xã	70
2509	phuong_my_lam	Phường Mỹ Lâm	phường	70
2512	phuong_an_tuong	Phường An Tường	phường	70
2515	xa_luong_vuong	Xã Lưỡng Vượng	xã	70
2521	xa_thai_long	Xã Thái Long	xã	70
2524	phuong_doi_can	Phường Đội Cấn	phường	70
2233	xa_phuc_yen	Xã Phúc Yên	xã	71
2242	xa_xuan_lap	Xã Xuân Lập	xã	71
2251	xa_khuon_ha	Xã Khuôn Hà	xã	71
2266	xa_lang_can	Xã Lăng Can	xã	71
2269	xa_thuong_lam	Xã Thượng Lâm	xã	71
2290	xa_binh_an	Xã Bình An	xã	71
2293	xa_hong_quang	Xã Hồng Quang	xã	71
2296	xa_tho_binh	Xã Thổ Bình	xã	71
2221	thi_tran_na_hang	Thị trấn Na Hang	thị trấn	72
2227	xa_sinh_long	Xã Sinh Long	xã	72
2230	xa_thuong_giap	Xã Thượng Giáp	xã	72
2239	xa_thuong_nong	Xã Thượng Nông	xã	72
2245	xa_con_lon	Xã Côn Lôn	xã	72
2248	xa_yen_hoa	Xã Yên Hoa	xã	72
2254	xa_hong_thai	Xã Hồng Thái	xã	72
2260	xa_da_vi	Xã Đà Vị	xã	72
2263	xa_khau_tinh	Xã Khau Tinh	xã	72
2275	xa_son_phu	Xã Sơn Phú	xã	72
2281	xa_nang_kha	Xã Năng Khả	xã	72
2284	xa_thanh_tuong	Xã Thanh Tương	xã	72
2287	thi_tran_vinh_loc	Thị trấn Vĩnh Lộc	thị trấn	73
2299	xa_phuc_son	Xã Phúc Sơn	xã	73
2302	xa_minh_quang	Xã Minh Quang	xã	73
2305	xa_trung_ha	Xã Trung Hà	xã	73
2308	xa_tan_my	Xã Tân Mỹ	xã	73
2311	xa_ha_lang	Xã Hà Lang	xã	73
2314	xa_hung_my	Xã Hùng Mỹ	xã	73
2317	xa_yen_lap	Xã Yên Lập	xã	73
2320	xa_tan_an	Xã Tân An	xã	73
2323	xa_binh_phu	Xã Bình Phú	xã	73
2326	xa_xuan_quang	Xã Xuân Quang	xã	73
2329	xa_ngoc_hoi	Xã Ngọc Hội	xã	73
2332	xa_phu_binh	Xã Phú Bình	xã	73
2335	xa_hoa_phu	Xã Hòa Phú	xã	73
2338	xa_phuc_thinh	Xã Phúc Thịnh	xã	73
2341	xa_kien_dai	Xã Kiên Đài	xã	73
2344	xa_tan_thinh	Xã Tân Thịnh	xã	73
2347	xa_trung_hoa	Xã Trung Hòa	xã	73
2350	xa_kim_binh	Xã Kim Bình	xã	73
2353	xa_hoa_an	Xã Hòa An	xã	73
2356	xa_vinh_quang	Xã Vinh Quang	xã	73
2359	xa_tri_phu	Xã Tri Phú	xã	73
2362	xa_nhan_ly	Xã Nhân Lý	xã	73
2365	xa_yen_nguyen	Xã Yên Nguyên	xã	73
2368	xa_linh_phu	Xã Linh Phú	xã	73
2371	xa_binh_nhan	Xã Bình Nhân	xã	73
2374	thi_tran_tan_yen	Thị trấn Tân Yên	thị trấn	74
2377	xa_yen_thuan	Xã Yên Thuận	xã	74
2380	xa_bach_xa	Xã Bạch Xa	xã	74
2383	xa_minh_khuong	Xã Minh Khương	xã	74
2386	xa_yen_lam	Xã Yên Lâm	xã	74
2389	xa_minh_dan	Xã Minh Dân	xã	74
2392	xa_phu_luu	Xã Phù Lưu	xã	74
2395	xa_minh_huong	Xã Minh Hương	xã	74
2398	xa_yen_phu	Xã Yên Phú	xã	74
2401	xa_tan_thanh	Xã Tân Thành	xã	74
2404	xa_binh_xa	Xã Bình Xa	xã	74
2407	xa_thai_son	Xã Thái Sơn	xã	74
2410	xa_nhan_muc	Xã Nhân Mục	xã	74
2413	xa_thanh_long	Xã Thành Long	xã	74
2416	xa_bang_coc	Xã Bằng Cốc	xã	74
2419	xa_thai_hoa	Xã Thái Hòa	xã	74
2422	xa_duc_ninh	Xã Đức Ninh	xã	74
2425	xa_hung_duc	Xã Hùng Đức	xã	74
2431	xa_qui_quan	Xã Quí Quân	xã	75
2434	xa_luc_hanh	Xã Lực Hành	xã	75
2437	xa_kien_thiet	Xã Kiến Thiết	xã	75
2440	xa_trung_minh	Xã Trung Minh	xã	75
2443	xa_chieu_yen	Xã Chiêu Yên	xã	75
2446	xa_trung_truc	Xã Trung Trực	xã	75
2449	xa_xuan_van	Xã Xuân Vân	xã	75
2452	xa_phuc_ninh	Xã Phúc Ninh	xã	75
2455	xa_hung_loi	Xã Hùng Lợi	xã	75
2458	xa_trung_son	Xã Trung Sơn	xã	75
2461	xa_tan_tien	Xã Tân Tiến	xã	75
2464	xa_tu_quan	Xã Tứ Quận	xã	75
2467	xa_dao_vien	Xã Đạo Viện	xã	75
2470	xa_tan_long	Xã Tân Long	xã	75
2473	xa_thang_quan	Xã Thắng Quân	xã	75
2476	xa_kim_quan	Xã Kim Quan	xã	75
2479	xa_lang_quan	Xã Lang Quán	xã	75
2482	xa_phu_thinh	Xã Phú Thịnh	xã	75
2485	xa_cong_da	Xã Công Đa	xã	75
2488	xa_trung_mon	Xã Trung Môn	xã	75
2491	xa_chan_son	Xã Chân Sơn	xã	75
2494	xa_thai_binh	Xã Thái Bình	xã	75
2500	xa_tien_bo	Xã Tiến Bộ	xã	75
2506	xa_my_bang	Xã Mỹ Bằng	xã	75
2518	xa_hoang_khai	Xã Hoàng Khai	xã	75
2527	xa_nhu_han	Xã Nhữ Hán	xã	75
2530	xa_nhu_khe	Xã Nhữ Khê	xã	75
2533	xa_doi_binh	Xã Đội Bình	xã	75
2536	thi_tran_son_duong	Thị trấn Sơn Dương	thị trấn	76
2539	xa_trung_yen	Xã Trung Yên	xã	76
2542	xa_minh_thanh	Xã Minh Thanh	xã	76
2545	xa_tan_trao	Xã Tân Trào	xã	76
2548	xa_vinh_loi	Xã Vĩnh Lợi	xã	76
2551	xa_thuong_am	Xã Thượng Ấm	xã	76
2554	xa_binh_yen	Xã Bình Yên	xã	76
2557	xa_luong_thien	Xã Lương Thiện	xã	76
2560	xa_tu_thinh	Xã Tú Thịnh	xã	76
2563	xa_cap_tien	Xã Cấp Tiến	xã	76
2566	xa_hop_thanh	Xã Hợp Thành	xã	76
2569	xa_phuc_ung	Xã Phúc Ứng	xã	76
2572	xa_dong_tho	Xã Đông Thọ	xã	76
2575	xa_khang_nhat	Xã Kháng Nhật	xã	76
2578	xa_hop_hoa	Xã Hợp Hòa	xã	76
2584	xa_quyet_thang	Xã Quyết Thắng	xã	76
2587	xa_dong_quy	Xã Đồng Quý	xã	76
2590	xa_tan_thanh	Xã Tân Thanh	xã	76
2593	xa_van_son	Xã Vân Sơn	xã	76
2596	xa_van_phu	Xã Văn Phú	xã	76
2599	xa_chi_thiet	Xã Chi Thiết	xã	76
2602	xa_dong_loi	Xã Đông Lợi	xã	76
2605	xa_thien_ke	Xã Thiện Kế	xã	76
2608	xa_hong_lac	Xã Hồng Lạc	xã	76
2611	xa_phu_luong	Xã Phú Lương	xã	76
2614	xa_ninh_lai	Xã Ninh Lai	xã	76
2617	xa_dai_phu	Xã Đại Phú	xã	76
2620	xa_son_nam	Xã Sơn Nam	xã	76
2623	xa_hao_phu	Xã Hào Phú	xã	76
2626	xa_tam_da	Xã Tam Đa	xã	76
2632	xa_truong_sinh	Xã Trường Sinh	xã	76
2635	phuong_duyen_hai	Phường Duyên Hải	phường	80
2641	phuong_lao_cai	Phường Lào Cai	phường	80
2644	phuong_coc_leu	Phường Cốc Lếu	phường	80
2647	phuong_kim_tan	Phường Kim Tân	phường	80
2650	phuong_bac_lenh	Phường Bắc Lệnh	phường	80
2653	phuong_pom_han	Phường Pom Hán	phường	80
2656	phuong_xuan_tang	Phường Xuân Tăng	phường	80
2658	phuong_binh_minh	Phường Bình Minh	phường	80
2659	xa_thong_nhat	Xã Thống Nhất	xã	80
2662	xa_dong_tuyen	Xã Đồng Tuyển	xã	80
2665	xa_van_hoa	Xã Vạn Hoà	xã	80
2668	phuong_bac_cuong	Phường Bắc Cường	phường	80
2671	phuong_nam_cuong	Phường Nam Cường	phường	80
2674	xa_cam_duong	Xã Cam Đường	xã	80
2677	xa_ta_phoi	Xã Tả Phời	xã	80
2680	xa_hop_thanh	Xã Hợp Thành	xã	80
2746	xa_coc_san	Xã Cốc San	xã	80
2683	thi_tran_bat_xat	Thị trấn Bát Xát	thị trấn	82
2686	xa_a_mu_sung	Xã A Mú Sung	xã	82
2689	xa_nam_chac	Xã Nậm Chạc	xã	82
2692	xa_a_lu	Xã A Lù	xã	82
2695	xa_trinh_tuong	Xã Trịnh Tường	xã	82
2701	xa_y_ty	Xã Y Tý	xã	82
2704	xa_coc_my	Xã Cốc Mỳ	xã	82
2707	xa_den_sang	Xã Dền Sáng	xã	82
2710	xa_ban_vuoc	Xã Bản Vược	xã	82
2713	xa_sang_ma_sao	Xã Sàng Ma Sáo	xã	82
2716	xa_ban_qua	Xã Bản Qua	xã	82
2719	xa_muong_vi	Xã Mường Vi	xã	82
2722	xa_den_thang	Xã Dền Thàng	xã	82
2725	xa_ban_xeo	Xã Bản Xèo	xã	82
2728	xa_muong_hum	Xã Mường Hum	xã	82
2731	xa_trung_leng_ho	Xã Trung Lèng Hồ	xã	82
2734	xa_quang_kim	Xã Quang Kim	xã	82
2737	xa_pa_cheo	Xã Pa Cheo	xã	82
2740	xa_nam_pung	Xã Nậm Pung	xã	82
2743	xa_phin_ngan	Xã Phìn Ngan	xã	82
2749	xa_tong_sanh	Xã Tòng Sành	xã	82
2752	xa_pha_long	Xã Pha Long	xã	83
2755	xa_ta_ngai_cho	Xã Tả Ngải Chồ	xã	83
2758	xa_tung_chung_pho	Xã Tung Chung Phố	xã	83
2761	thi_tran_muong_khuong	Thị trấn Mường Khương	thị trấn	83
2764	xa_din_chin	Xã Dìn Chin	xã	83
2767	xa_ta_gia_khau	Xã Tả Gia Khâu	xã	83
2770	xa_nam_chay	Xã Nậm Chảy	xã	83
2773	xa_nam_lu	Xã Nấm Lư	xã	83
2776	xa_lung_khau_nhin	Xã Lùng Khấu Nhin	xã	83
2779	xa_thanh_binh	Xã Thanh Bình	xã	83
2782	xa_cao_son	Xã Cao Sơn	xã	83
2785	xa_lung_vai	Xã Lùng Vai	xã	83
2788	xa_ban_lau	Xã Bản Lầu	xã	83
2791	xa_la_pan_tan	Xã La Pan Tẩn	xã	83
2794	xa_ta_thang	Xã Tả Thàng	xã	83
2797	xa_ban_sen	Xã Bản Sen	xã	83
2800	xa_nan_san	Xã Nàn Sán	xã	84
2803	xa_thao_chu_phin	Xã Thào Chư Phìn	xã	84
2806	xa_ban_me	Xã Bản Mế	xã	84
2809	thi_tran_si_ma_cai	Thị trấn Si Ma Cai	thị trấn	84
2812	xa_san_chai	Xã Sán Chải	xã	84
2818	xa_lung_than	Xã Lùng Thẩn	xã	84
2821	xa_can_cau	Xã Cán Cấu	xã	84
2824	xa_sin_cheng	Xã Sín Chéng	xã	84
2827	xa_quan_ho_than	Xã Quan Hồ Thẩn	xã	84
2836	xa_nan_xin	Xã Nàn Xín	xã	84
2839	thi_tran_bac_ha	Thị trấn Bắc Hà	thị trấn	85
2842	xa_lung_cai	Xã Lùng Cải	xã	85
2848	xa_lung_phinh	Xã Lùng Phình	xã	85
2851	xa_ta_van_chu	Xã Tả Van Chư	xã	85
2854	xa_ta_cu_ty	Xã Tả Củ Tỷ	xã	85
2857	xa_thai_giang_pho	Xã Thải Giàng Phố	xã	85
2863	xa_hoang_thu_pho	Xã Hoàng Thu Phố	xã	85
2866	xa_ban_pho	Xã Bản Phố	xã	85
2869	xa_ban_lien	Xã Bản Liền	xã	85
2872	xa_ta_chai	Xã Tà Chải	xã	85
2875	xa_na_hoi	Xã Na Hối	xã	85
2878	xa_coc_ly	Xã Cốc Ly	xã	85
2881	xa_nam_mon	Xã Nậm Mòn	xã	85
2884	xa_nam_det	Xã Nậm Đét	xã	85
2887	xa_nam_khanh	Xã Nậm Khánh	xã	85
2890	xa_bao_nhai	Xã Bảo Nhai	xã	85
2893	xa_nam_luc	Xã Nậm Lúc	xã	85
2896	xa_coc_lau	Xã Cốc Lầu	xã	85
2899	xa_ban_cai	Xã Bản Cái	xã	85
2902	thi_tran_n_t_phong_hai	Thị trấn N.T Phong Hải	thị trấn	86
2905	thi_tran_pho_lu	Thị trấn Phố Lu	thị trấn	86
2908	thi_tran_tang_loong	Thị trấn Tằng Loỏng	thị trấn	86
2911	xa_ban_phiet	Xã Bản Phiệt	xã	86
2914	xa_ban_cam	Xã Bản Cầm	xã	86
2917	xa_thai_nien	Xã Thái Niên	xã	86
2920	xa_phong_nien	Xã Phong Niên	xã	86
2923	xa_gia_phu	Xã Gia Phú	xã	86
2926	xa_xuan_quang	Xã Xuân Quang	xã	86
2929	xa_son_hai	Xã Sơn Hải	xã	86
2932	xa_xuan_giao	Xã Xuân Giao	xã	86
2935	xa_tri_quang	Xã Trì Quang	xã	86
2938	xa_son_ha	Xã Sơn Hà	xã	86
2944	xa_phu_nhuan	Xã Phú Nhuận	xã	86
2947	thi_tran_pho_rang	Thị trấn Phố Ràng	thị trấn	87
2950	xa_tan_tien	Xã Tân Tiến	xã	87
2953	xa_nghia_do	Xã Nghĩa Đô	xã	87
2956	xa_vinh_yen	Xã Vĩnh Yên	xã	87
2959	xa_dien_quan	Xã Điện Quan	xã	87
2962	xa_xuan_hoa	Xã Xuân Hoà	xã	87
2965	xa_tan_duong	Xã Tân Dương	xã	87
2968	xa_thuong_ha	Xã Thượng Hà	xã	87
2971	xa_kim_son	Xã Kim Sơn	xã	87
2974	xa_cam_con	Xã Cam Cọn	xã	87
2977	xa_minh_tan	Xã Minh Tân	xã	87
2980	xa_xuan_thuong	Xã Xuân Thượng	xã	87
2983	xa_viet_tien	Xã Việt Tiến	xã	87
2986	xa_yen_son	Xã Yên Sơn	xã	87
2989	xa_bao_ha	Xã Bảo Hà	xã	87
2992	xa_luong_son	Xã Lương Sơn	xã	87
2998	xa_phuc_khanh	Xã Phúc Khánh	xã	87
3001	phuong_sa_pa	Phường Sa Pa	phường	88
3002	phuong_sa_pa	Phường Sa Pả	phường	88
3003	phuong_o_quy_ho	Phường Ô Quý Hồ	phường	88
3004	xa_ngu_chi_son	Xã Ngũ Chỉ Sơn	xã	88
3006	phuong_phan_si_pang	Phường Phan Si Păng	phường	88
3010	xa_trung_chai	Xã Trung Chải	xã	88
3013	xa_ta_phin	Xã Tả Phìn	xã	88
3016	phuong_ham_rong	Phường Hàm Rồng	phường	88
3019	xa_hoang_lien	Xã Hoàng Liên	xã	88
3022	xa_thanh_binh	Xã Thanh Bình	xã	88
3028	phuong_cau_may	Phường Cầu Mây	phường	88
3037	xa_muong_hoa	Xã Mường Hoa	xã	88
3040	xa_ta_van	Xã Tả Van	xã	88
3043	xa_muong_bo	Xã Mường Bo	xã	88
3046	xa_ban_ho	Xã Bản Hồ	xã	88
3052	xa_lien_minh	Xã Liên Minh	xã	88
3055	thi_tran_khanh_yen	Thị trấn Khánh Yên	thị trấn	89
3061	xa_vo_lao	Xã Võ Lao	xã	89
3064	xa_son_thuy	Xã Sơn Thuỷ	xã	89
3067	xa_nam_ma	Xã Nậm Mả	xã	89
3070	xa_tan_thuong	Xã Tân Thượng	xã	89
3073	xa_nam_rang	Xã Nậm Rạng	xã	89
3076	xa_nam_chay	Xã Nậm Chầy	xã	89
3079	xa_tan_an	Xã Tân An	xã	89
3082	xa_khanh_yen_thuong	Xã Khánh Yên Thượng	xã	89
3085	xa_nam_xe	Xã Nậm Xé	xã	89
3088	xa_dan_thang	Xã Dần Thàng	xã	89
3091	xa_chieng_ken	Xã Chiềng Ken	xã	89
3094	xa_lang_giang	Xã Làng Giàng	xã	89
3097	xa_hoa_mac	Xã Hoà Mạc	xã	89
3100	xa_khanh_yen_trung	Xã Khánh Yên Trung	xã	89
3103	xa_khanh_yen_ha	Xã Khánh Yên Hạ	xã	89
3106	xa_duong_quy	Xã Dương Quỳ	xã	89
3109	xa_nam_tha	Xã Nậm Tha	xã	89
3112	xa_minh_luong	Xã Minh Lương	xã	89
3115	xa_tham_duong	Xã Thẩm Dương	xã	89
3118	xa_liem_phu	Xã Liêm Phú	xã	89
3121	xa_nam_xay	Xã Nậm Xây	xã	89
3124	phuong_noong_bua	Phường Noong Bua	phường	94
3127	phuong_him_lam	Phường Him Lam	phường	94
3130	phuong_thanh_binh	Phường Thanh Bình	phường	94
3133	phuong_tan_thanh	Phường Tân Thanh	phường	94
3136	phuong_muong_thanh	Phường Mường Thanh	phường	94
3139	phuong_nam_thanh	Phường Nam Thanh	phường	94
3142	phuong_thanh_truong	Phường Thanh Trường	phường	94
3145	xa_thanh_minh	Xã Thanh Minh	xã	94
3316	xa_na_tau	Xã Nà Tấu	xã	94
3317	xa_na_nhan	Xã Nà Nhạn	xã	94
3325	xa_muong_phang	Xã Mường Phăng	xã	94
3326	xa_pa_khoang	Xã Pá Khoang	xã	94
3148	phuong_song_da	Phường Sông Đà	phường	95
3151	phuong_na_lay	Phường Na Lay	phường	95
3184	xa_lay_nua	Xã Lay Nưa	xã	95
3154	xa_sin_thau	Xã Sín Thầu	xã	96
3155	xa_sen_thuong	Xã Sen Thượng	xã	96
3157	xa_chung_chai	Xã Chung Chải	xã	96
3158	xa_leng_su_sin	Xã Leng Su Sìn	xã	96
3159	xa_pa_my	Xã Pá Mỳ	xã	96
3160	xa_muong_nhe	Xã Mường Nhé	xã	96
3161	xa_nam_vi	Xã Nậm Vì	xã	96
3162	xa_nam_ke	Xã Nậm Kè	xã	96
3163	xa_muong_toong	Xã Mường Toong	xã	96
3164	xa_quang_lam	Xã Quảng Lâm	xã	96
3177	xa_huoi_lenh	Xã Huổi Lếnh	xã	96
3172	thi_tran_muong_cha	Thị trấn Mường Chà	thị trấn	97
3178	xa_xa_tong	Xã Xá Tổng	xã	97
3181	xa_muong_tung	Xã Mường Tùng	xã	97
3190	xa_hua_ngai	Xã Hừa Ngài	xã	97
3191	xa_huoi_mi	Xã Huổi Mí	xã	97
3193	xa_pa_ham	Xã Pa Ham	xã	97
3194	xa_nam_nen	Xã Nậm Nèn	xã	97
3196	xa_huoi_leng	Xã Huổi Lèng	xã	97
3197	xa_sa_long	Xã Sa Lông	xã	97
3200	xa_ma_thi_ho	Xã Ma Thì Hồ	xã	97
3201	xa_na_sang	Xã Na Sang	xã	97
3202	xa_muong_muon	Xã Mường Mươn	xã	97
3217	thi_tran_tua_chua	Thị trấn Tủa Chùa	thị trấn	98
3220	xa_huoi_so	Xã Huổi Só	xã	98
3223	xa_xin_chai	Xã Xín Chải	xã	98
3226	xa_ta_sin_thang	Xã Tả Sìn Thàng	xã	98
3229	xa_lao_xa_phinh	Xã Lao Xả Phình	xã	98
3232	xa_ta_phin	Xã Tả Phìn	xã	98
3235	xa_tua_thang	Xã Tủa Thàng	xã	98
3238	xa_trung_thu	Xã Trung Thu	xã	98
3241	xa_sinh_phinh	Xã Sính Phình	xã	98
3244	xa_sang_nhe	Xã Sáng Nhè	xã	98
3247	xa_muong_dun	Xã Mường Đun	xã	98
3250	xa_muong_bang	Xã Mường Báng	xã	98
3253	thi_tran_tuan_giao	Thị trấn Tuần Giáo	thị trấn	99
3259	xa_phinh_sang	Xã Phình Sáng	xã	99
3260	xa_rang_dong	Xã Rạng Đông	xã	99
3262	xa_mun_chung	Xã Mùn Chung	xã	99
3263	xa_na_tong	Xã Nà Tòng	xã	99
3265	xa_ta_ma	Xã Ta Ma	xã	99
3268	xa_muong_mun	Xã Mường Mùn	xã	99
3269	xa_pu_xi	Xã Pú Xi	xã	99
3271	xa_pu_nhung	Xã Pú Nhung	xã	99
3274	xa_quai_nua	Xã Quài Nưa	xã	99
3277	xa_muong_thin	Xã Mường Thín	xã	99
3280	xa_toa_tinh	Xã Tỏa Tình	xã	99
3283	xa_na_say	Xã Nà Sáy	xã	99
3284	xa_muong_khong	Xã Mường Khong	xã	99
3289	xa_quai_cang	Xã Quài Cang	xã	99
3295	xa_quai_to	Xã Quài Tở	xã	99
3298	xa_chieng_sinh	Xã Chiềng Sinh	xã	99
3299	xa_chieng_dong	Xã Chiềng Đông	xã	99
3304	xa_tenh_phong	Xã Tênh Phông	xã	99
3319	xa_muong_pon	Xã Mường Pồn	xã	100
3322	xa_thanh_nua	Xã Thanh Nưa	xã	100
3323	xa_hua_thanh	Xã Hua Thanh	xã	100
3328	xa_thanh_luong	Xã Thanh Luông	xã	100
3331	xa_thanh_hung	Xã Thanh Hưng	xã	100
3334	xa_thanh_xuong	Xã Thanh Xương	xã	100
3337	xa_thanh_chan	Xã Thanh Chăn	xã	100
3340	xa_pa_thom	Xã Pa Thơm	xã	100
3343	xa_thanh_an	Xã Thanh An	xã	100
3346	xa_thanh_yen	Xã Thanh Yên	xã	100
3349	xa_noong_luong	Xã Noong Luống	xã	100
3352	xa_noong_het	Xã Noọng Hẹt	xã	100
3355	xa_sam_mun	Xã Sam Mứn	xã	100
3356	xa_pom_lot	Xã Pom Lót	xã	100
3358	xa_nua_ngam	Xã Núa Ngam	xã	100
3359	xa_he_muong	Xã Hẹ Muông	xã	100
3361	xa_na_u	Xã Na Ư	xã	100
3364	xa_muong_nha	Xã Mường Nhà	xã	100
3365	xa_na_tong	Xã Na Tông	xã	100
3367	xa_muong_loi	Xã Mường Lói	xã	100
3368	xa_phu_luong	Xã Phu Luông	xã	100
3203	thi_tran_dien_bien_dong	Thị trấn Điện Biên Đông	thị trấn	101
3205	xa_na_son	Xã Na Son	xã	101
3208	xa_phi_nhu	Xã Phì Nhừ	xã	101
3211	xa_chieng_so	Xã Chiềng Sơ	xã	101
3214	xa_muong_luan	Xã Mường Luân	xã	101
3370	xa_pu_nhi	Xã Pú Nhi	xã	101
3371	xa_nong_u	Xã Nong U	xã	101
3373	xa_xa_dung	Xã Xa Dung	xã	101
3376	xa_keo_lom	Xã Keo Lôm	xã	101
3379	xa_luan_gioi	Xã Luân Giới	xã	101
3382	xa_phinh_giang	Xã Phình Giàng	xã	101
3383	xa_pu_hong	Xã Pú Hồng	xã	101
3384	xa_tia_dinh	Xã Tìa Dình	xã	101
3385	xa_hang_lia	Xã Háng Lìa	xã	101
3256	thi_tran_muong_ang	Thị trấn Mường Ảng	thị trấn	102
3286	xa_muong_dang	Xã Mường Đăng	xã	102
3287	xa_ngoi_cay	Xã Ngối Cáy	xã	102
3292	xa_ang_to	Xã Ẳng Tở	xã	102
3301	xa_bung_lao	Xã Búng Lao	xã	102
3302	xa_xuan_lao	Xã Xuân Lao	xã	102
3307	xa_ang_nua	Xã Ẳng Nưa	xã	102
3310	xa_ang_cang	Xã Ẳng Cang	xã	102
3312	xa_nam_lich	Xã Nặm Lịch	xã	102
3313	xa_muong_lan	Xã Mường Lạn	xã	102
3156	xa_nam_tin	Xã Nậm Tin	xã	103
3165	xa_pa_tan	Xã Pa Tần	xã	103
3166	xa_cha_cang	Xã Chà Cang	xã	103
3167	xa_na_co_sa	Xã Na Cô Sa	xã	103
3168	xa_na_khoa	Xã Nà Khoa	xã	103
3169	xa_na_hy	Xã Nà Hỳ	xã	103
3170	xa_na_bung	Xã Nà Bủng	xã	103
3171	xa_nam_nhu	Xã Nậm Nhừ	xã	103
3173	xa_nam_chua	Xã Nậm Chua	xã	103
3174	xa_nam_khan	Xã Nậm Khăn	xã	103
3175	xa_cha_to	Xã Chà Tở	xã	103
3176	xa_vang_dan	Xã Vàng Đán	xã	103
3187	xa_cha_nua	Xã Chà Nưa	xã	103
3198	xa_phin_ho	Xã Phìn Hồ	xã	103
3199	xa_si_pa_phin	Xã Si Pa Phìn	xã	103
3386	phuong_quyet_thang	Phường Quyết Thắng	phường	105
3387	phuong_tan_phong	Phường Tân Phong	phường	105
3388	phuong_quyet_tien	Phường Quyết Tiến	phường	105
3389	phuong_doan_ket	Phường Đoàn Kết	phường	105
3403	xa_sung_phai	Xã Sùng Phài	xã	105
3408	phuong_dong_phong	Phường Đông Phong	phường	105
3409	xa_san_thang	Xã San Thàng	xã	105
3390	thi_tran_tam_duong	Thị trấn Tam Đường	thị trấn	106
3394	xa_then_sin	Xã Thèn Sin	xã	106
3400	xa_ta_leng	Xã Tả Lèng	xã	106
3405	xa_giang_ma	Xã Giang Ma	xã	106
3406	xa_ho_thau	Xã Hồ Thầu	xã	106
3412	xa_binh_lu	Xã Bình Lư	xã	106
3413	xa_son_binh	Xã Sơn Bình	xã	106
3415	xa_nung_nang	Xã Nùng Nàng	xã	106
3418	xa_ban_giang	Xã Bản Giang	xã	106
3421	xa_ban_hon	Xã Bản Hon	xã	106
3424	xa_ban_bo	Xã Bản Bo	xã	106
3427	xa_na_tam	Xã Nà Tăm	xã	106
3430	xa_khun_ha	Xã Khun Há	xã	106
3433	thi_tran_muong_te	Thị trấn Mường Tè	thị trấn	107
3436	xa_thu_lum	Xã Thu Lũm	xã	107
3439	xa_ka_lang	Xã Ka Lăng	xã	107
3440	xa_ta_ba	Xã Tá Bạ	xã	107
3442	xa_pa_u	Xã Pa ủ	xã	107
3445	xa_muong_te	Xã Mường Tè	xã	107
3448	xa_pa_ve_su	Xã Pa Vệ Sử	xã	107
3451	xa_mu_ca	Xã Mù Cả	xã	107
3454	xa_bum_to	Xã Bum Tở	xã	107
3457	xa_nam_khao	Xã Nậm Khao	xã	107
3463	xa_ta_tong	Xã Tà Tổng	xã	107
3466	xa_bum_nua	Xã Bum Nưa	xã	107
3467	xa_vang_san	Xã Vàng San	xã	107
3469	xa_kan_ho	Xã Kan Hồ	xã	107
3478	thi_tran_sin_ho	Thị trấn Sìn Hồ	thị trấn	108
3487	xa_chan_nua	Xã Chăn Nưa	xã	108
3493	xa_pa_tan	Xã Pa Tần	xã	108
3496	xa_phin_ho	Xã Phìn Hồ	xã	108
3499	xa_hong_thu	Xã Hồng Thu	xã	108
3505	xa_phang_so_lin	Xã Phăng Sô Lin	xã	108
3508	xa_ma_quai	Xã Ma Quai	xã	108
3509	xa_lung_thang	Xã Lùng Thàng	xã	108
3511	xa_ta_phin	Xã Tả Phìn	xã	108
3514	xa_sa_de_phin	Xã Sà Dề Phìn	xã	108
3517	xa_nam_tam	Xã Nậm Tăm	xã	108
3520	xa_ta_ngao	Xã Tả Ngảo	xã	108
3523	xa_pu_sam_cap	Xã Pu Sam Cáp	xã	108
3526	xa_nam_cha	Xã Nậm Cha	xã	108
3527	xa_pa_khoa	Xã Pa Khoá	xã	108
3529	xa_lang_mo	Xã Làng Mô	xã	108
3532	xa_noong_heo	Xã Noong Hẻo	xã	108
3535	xa_nam_ma	Xã Nậm Mạ	xã	108
3538	xa_can_co	Xã Căn Co	xã	108
3541	xa_tua_sin_chai	Xã Tủa Sín Chải	xã	108
3544	xa_nam_cuoi	Xã Nậm Cuổi	xã	108
3547	xa_nam_han	Xã Nậm Hăn	xã	108
3391	xa_la_nhi_thang	Xã Lả Nhì Thàng	xã	109
3490	xa_huoi_luong	Xã Huổi Luông	xã	109
3549	thi_tran_phong_tho	Thị trấn Phong Thổ	thị trấn	109
3550	xa_si_lo_lau	Xã Sì Lở Lầu	xã	109
3553	xa_mo_si_san	Xã Mồ Sì San	xã	109
3559	xa_pa_vay_su	Xã Pa Vây Sử	xã	109
3562	xa_vang_ma_chai	Xã Vàng Ma Chải	xã	109
3565	xa_tong_qua_lin	Xã Tông Qua Lìn	xã	109
3568	xa_mu_sang	Xã Mù Sang	xã	109
3571	xa_dao_san	Xã Dào San	xã	109
3574	xa_ma_ly_pho	Xã Ma Ly Pho	xã	109
3577	xa_ban_lang	Xã Bản Lang	xã	109
3580	xa_hoang_then	Xã Hoang Thèn	xã	109
3583	xa_khong_lao	Xã Khổng Lào	xã	109
3586	xa_nam_xe	Xã Nậm Xe	xã	109
3589	xa_muong_so	Xã Mường So	xã	109
3592	xa_sin_suoi_ho	Xã Sin Suối Hồ	xã	109
3595	thi_tran_than_uyen	Thị trấn Than Uyên	thị trấn	110
3618	xa_phuc_than	Xã Phúc Than	xã	110
3619	xa_muong_than	Xã Mường Than	xã	110
3625	xa_muong_mit	Xã Mường Mít	xã	110
3628	xa_pha_mu	Xã Pha Mu	xã	110
3631	xa_muong_cang	Xã Mường Cang	xã	110
3632	xa_hua_na	Xã Hua Nà	xã	110
3634	xa_ta_hua	Xã Tà Hừa	xã	110
3637	xa_muong_kim	Xã Mường Kim	xã	110
3638	xa_ta_mung	Xã Tà Mung	xã	110
3640	xa_ta_gia	Xã Tà Gia	xã	110
3643	xa_khoen_on	Xã Khoen On	xã	110
3598	thi_tran_tan_uyen	Thị trấn Tân Uyên	thị trấn	111
3601	xa_muong_khoa	Xã Mường Khoa	xã	111
3602	xa_phuc_khoa	Xã Phúc Khoa	xã	111
3604	xa_than_thuoc	Xã Thân Thuộc	xã	111
3605	xa_trung_dong	Xã Trung Đồng	xã	111
3607	xa_ho_mit	Xã Hố Mít	xã	111
3610	xa_nam_can	Xã Nậm Cần	xã	111
3613	xa_nam_so	Xã Nậm Sỏ	xã	111
3616	xa_pac_ta	Xã Pắc Ta	xã	111
3622	xa_ta_mit	Xã Tà Mít	xã	111
3434	thi_tran_nam_nhun	Thị trấn Nậm Nhùn	thị trấn	112
3460	xa_hua_bun	Xã Hua Bun	xã	112
3472	xa_muong_mo	Xã Mường Mô	xã	112
3473	xa_nam_cha	Xã Nậm Chà	xã	112
3474	xa_nam_manh	Xã Nậm Manh	xã	112
3475	xa_nam_hang	Xã Nậm Hàng	xã	112
3481	xa_le_loi	Xã Lê Lợi	xã	112
3484	xa_pu_dao	Xã Pú Đao	xã	112
3488	xa_nam_pi	Xã Nậm Pì	xã	112
3502	xa_nam_ban	Xã Nậm Ban	xã	112
3503	xa_trung_chai	Xã Trung Chải	xã	112
3646	phuong_chieng_le	Phường Chiềng Lề	phường	116
3649	phuong_to_hieu	Phường Tô Hiệu	phường	116
3652	phuong_quyet_thang	Phường Quyết Thắng	phường	116
3655	phuong_quyet_tam	Phường Quyết Tâm	phường	116
3658	xa_chieng_co	Xã Chiềng Cọ	xã	116
3661	xa_chieng_den	Xã Chiềng Đen	xã	116
3664	xa_chieng_xom	Xã Chiềng Xôm	xã	116
3667	phuong_chieng_an	Phường Chiềng An	phường	116
3670	phuong_chieng_coi	Phường Chiềng Cơi	phường	116
3673	xa_chieng_ngan	Xã Chiềng Ngần	xã	116
3676	xa_hua_la	Xã Hua La	xã	116
3679	phuong_chieng_sinh	Phường Chiềng Sinh	phường	116
3682	xa_muong_chien	Xã Mường Chiên	xã	118
3685	xa_ca_nang	Xã Cà Nàng	xã	118
3688	xa_chieng_khay	Xã Chiềng Khay	xã	118
3694	xa_muong_gion	Xã Mường Giôn	xã	118
3697	xa_pa_ma_pha_khinh	Xã Pá Ma Pha Khinh	xã	118
3700	xa_chieng_on	Xã Chiềng Ơn	xã	118
3703	xa_muong_giang	Xã Mường Giàng	xã	118
3706	xa_chieng_bang	Xã Chiềng Bằng	xã	118
3709	xa_muong_sai	Xã Mường Sại	xã	118
3712	xa_nam_et	Xã Nậm ét	xã	118
3718	xa_chieng_khoang	Xã Chiềng Khoang	xã	118
3721	thi_tran_thuan_chau	Thị trấn Thuận Châu	thị trấn	119
3724	xa_phong_lai	Xã Phổng Lái	xã	119
3727	xa_muong_e	Xã Mường é	xã	119
3730	xa_chieng_pha	Xã Chiềng Pha	xã	119
3733	xa_chieng_la	Xã Chiềng La	xã	119
3736	xa_chieng_ngam	Xã Chiềng Ngàm	xã	119
3739	xa_liep_te	Xã Liệp Tè	xã	119
3742	xa_e_tong	Xã é Tòng	xã	119
3745	xa_phong_lap	Xã Phổng Lập	xã	119
3748	xa_phong_lang	Xã Phổng Lăng	xã	119
3751	xa_chieng_ly	Xã Chiềng Ly	xã	119
3754	xa_noong_lay	Xã Noong Lay	xã	119
3757	xa_muong_khieng	Xã Mường Khiêng	xã	119
3760	xa_muong_bam	Xã Mường Bám	xã	119
3763	xa_long_he	Xã Long Hẹ	xã	119
3766	xa_chieng_bom	Xã Chiềng Bôm	xã	119
3769	xa_thom_mon	Xã Thôm Mòn	xã	119
3772	xa_tong_lanh	Xã Tông Lạnh	xã	119
3775	xa_tong_co	Xã Tông Cọ	xã	119
3778	xa_bo_muoi	Xã Bó Mười	xã	119
3781	xa_co_ma	Xã Co Mạ	xã	119
3784	xa_pung_tra	Xã Púng Tra	xã	119
3787	xa_chieng_pac	Xã Chiềng Pấc	xã	119
3790	xa_nam_lau	Xã Nậm Lầu	xã	119
3793	xa_bon_phang	Xã Bon Phặng	xã	119
3796	xa_co_tong	Xã Co Tòng	xã	119
3799	xa_muoi_noi	Xã Muổi Nọi	xã	119
3802	xa_pa_long	Xã Pá Lông	xã	119
3805	xa_ban_lam	Xã Bản Lầm	xã	119
3808	thi_tran_it_ong	Thị trấn Ít Ong	thị trấn	120
3811	xa_nam_gion	Xã Nậm Giôn	xã	120
3814	xa_chieng_lao	Xã Chiềng Lao	xã	120
3817	xa_hua_trai	Xã Hua Trai	xã	120
3820	xa_ngoc_chien	Xã Ngọc Chiến	xã	120
3823	xa_muong_trai	Xã Mường Trai	xã	120
3826	xa_nam_pam	Xã Nậm Păm	xã	120
3829	xa_chieng_muon	Xã Chiềng Muôn	xã	120
3832	xa_chieng_an	Xã Chiềng Ân	xã	120
3835	xa_pi_toong	Xã Pi Toong	xã	120
3838	xa_chieng_cong	Xã Chiềng Công	xã	120
3841	xa_ta_bu	Xã Tạ Bú	xã	120
3844	xa_chieng_san	Xã Chiềng San	xã	120
3847	xa_muong_bu	Xã Mường Bú	xã	120
3850	xa_chieng_hoa	Xã Chiềng Hoa	xã	120
3853	xa_muong_chum	Xã Mường Chùm	xã	120
3856	thi_tran_bac_yen	Thị trấn Bắc Yên	thị trấn	121
3859	xa_phieng_ban	Xã Phiêng Ban	xã	121
3862	xa_hang_chu	Xã Hang Chú	xã	121
3865	xa_xim_vang	Xã Xím Vàng	xã	121
3868	xa_ta_xua	Xã Tà Xùa	xã	121
3869	xa_hang_dong	Xã Háng Đồng	xã	121
3871	xa_pac_nga	Xã Pắc Ngà	xã	121
3874	xa_lang_cheu	Xã Làng Chếu	xã	121
3877	xa_chim_van	Xã Chim Vàn	xã	121
3880	xa_muong_khoa	Xã Mường Khoa	xã	121
3883	xa_song_pe	Xã Song Pe	xã	121
3886	xa_hong_ngai	Xã Hồng Ngài	xã	121
3889	xa_ta_khoa	Xã Tạ Khoa	xã	121
3890	xa_hua_nhan	Xã Hua Nhàn	xã	121
3892	xa_phieng_con	Xã Phiêng Côn	xã	121
3895	xa_chieng_sai	Xã Chiềng Sại	xã	121
3898	thi_tran_phu_yen	Thị trấn Phù Yên	thị trấn	122
3901	xa_suoi_to	Xã Suối Tọ	xã	122
3904	xa_muong_thai	Xã Mường Thải	xã	122
3907	xa_muong_coi	Xã Mường Cơi	xã	122
3910	xa_quang_huy	Xã Quang Huy	xã	122
3913	xa_huy_bac	Xã Huy Bắc	xã	122
3916	xa_huy_thuong	Xã Huy Thượng	xã	122
3919	xa_tan_lang	Xã Tân Lang	xã	122
3922	xa_gia_phu	Xã Gia Phù	xã	122
3925	xa_tuong_phu	Xã Tường Phù	xã	122
3928	xa_huy_ha	Xã Huy Hạ	xã	122
3931	xa_huy_tan	Xã Huy Tân	xã	122
3934	xa_muong_lang	Xã Mường Lang	xã	122
3937	xa_suoi_bau	Xã Suối Bau	xã	122
3940	xa_huy_tuong	Xã Huy Tường	xã	122
3943	xa_muong_do	Xã Mường Do	xã	122
3946	xa_sap_xa	Xã Sập Xa	xã	122
3949	xa_tuong_thuong	Xã Tường Thượng	xã	122
3952	xa_tuong_tien	Xã Tường Tiến	xã	122
3955	xa_tuong_phong	Xã Tường Phong	xã	122
3958	xa_tuong_ha	Xã Tường Hạ	xã	122
3961	xa_kim_bon	Xã Kim Bon	xã	122
3964	xa_muong_bang	Xã Mường Bang	xã	122
3967	xa_da_do	Xã Đá Đỏ	xã	122
3970	xa_tan_phong	Xã Tân Phong	xã	122
3973	xa_nam_phong	Xã Nam Phong	xã	122
3976	xa_bac_phong	Xã Bắc Phong	xã	122
3979	thi_tran_moc_chau	Thị trấn Mộc Châu	thị trấn	123
3982	thi_tran_nt_moc_chau	Thị trấn NT Mộc Châu	thị trấn	123
3985	xa_chieng_son	Xã Chiềng Sơn	xã	123
3988	xa_tan_hop	Xã Tân Hợp	xã	123
3991	xa_qui_huong	Xã Qui Hướng	xã	123
3997	xa_tan_lap	Xã Tân Lập	xã	123
4000	xa_na_muong	Xã Nà Mường	xã	123
4003	xa_ta_lai	Xã Tà Lai	xã	123
4012	xa_chieng_hac	Xã Chiềng Hắc	xã	123
4015	xa_hua_pang	Xã Hua Păng	xã	123
4024	xa_chieng_khua	Xã Chiềng Khừa	xã	123
4027	xa_muong_sang	Xã Mường Sang	xã	123
4030	xa_dong_sang	Xã Đông Sang	xã	123
4033	xa_phieng_luong	Xã Phiêng Luông	xã	123
4045	xa_long_sap	Xã Lóng Sập	xã	123
4060	thi_tran_yen_chau	Thị trấn Yên Châu	thị trấn	124
4063	xa_chieng_dong	Xã Chiềng Đông	xã	124
4066	xa_sap_vat	Xã Sập Vạt	xã	124
4069	xa_chieng_sang	Xã Chiềng Sàng	xã	124
4072	xa_chieng_pan	Xã Chiềng Pằn	xã	124
4075	xa_vieng_lan	Xã Viêng Lán	xã	124
4078	xa_chieng_hac	Xã Chiềng Hặc	xã	124
4081	xa_muong_lum	Xã Mường Lựm	xã	124
4084	xa_chieng_on	Xã Chiềng On	xã	124
4087	xa_yen_son	Xã Yên Sơn	xã	124
4090	xa_chieng_khoi	Xã Chiềng Khoi	xã	124
4093	xa_tu_nang	Xã Tú Nang	xã	124
4096	xa_long_phieng	Xã Lóng Phiêng	xã	124
4099	xa_phieng_khoai	Xã Phiêng Khoài	xã	124
4102	xa_chieng_tuong	Xã Chiềng Tương	xã	124
4105	thi_tran_hat_lot	Thị trấn Hát Lót	thị trấn	125
4108	xa_chieng_sung	Xã Chiềng Sung	xã	125
4111	xa_muong_bang	Xã Mường Bằng	xã	125
4114	xa_chieng_chan	Xã Chiềng Chăn	xã	125
4117	xa_muong_chanh	Xã Mương Chanh	xã	125
4120	xa_chieng_ban	Xã Chiềng Ban	xã	125
4123	xa_chieng_mung	Xã Chiềng Mung	xã	125
4126	xa_muong_bon	Xã Mường Bon	xã	125
4129	xa_chieng_chung	Xã Chiềng Chung	xã	125
4132	xa_chieng_mai	Xã Chiềng Mai	xã	125
4135	xa_hat_lot	Xã Hát Lót	xã	125
4136	xa_na_po	Xã Nà Pó	xã	125
4138	xa_co_noi	Xã Cò Nòi	xã	125
4141	xa_chieng_noi	Xã Chiềng Nơi	xã	125
4144	xa_phieng_cam	Xã Phiêng Cằm	xã	125
4147	xa_chieng_dong	Xã Chiềng Dong	xã	125
4150	xa_chieng_kheo	Xã Chiềng Kheo	xã	125
4153	xa_chieng_ve	Xã Chiềng Ve	xã	125
4156	xa_chieng_luong	Xã Chiềng Lương	xã	125
4159	xa_phieng_pan	Xã Phiêng Pằn	xã	125
4162	xa_na_ot	Xã Nà Ơt	xã	125
4165	xa_ta_hoc	Xã Tà Hộc	xã	125
4168	thi_tran_song_ma	Thị trấn Sông Mã	thị trấn	126
4171	xa_bo_sinh	Xã Bó Sinh	xã	126
4174	xa_pu_pau	Xã Pú Pẩu	xã	126
4177	xa_chieng_phung	Xã Chiềng Phung	xã	126
4180	xa_chieng_en	Xã Chiềng En	xã	126
4183	xa_muong_lam	Xã Mường Lầm	xã	126
4186	xa_nam_ty	Xã Nậm Ty	xã	126
4189	xa_dua_mon	Xã Đứa Mòn	xã	126
4192	xa_yen_hung	Xã Yên Hưng	xã	126
4195	xa_chieng_so	Xã Chiềng Sơ	xã	126
4198	xa_na_nghiu	Xã Nà Nghịu	xã	126
4201	xa_nam_man	Xã Nậm Mằn	xã	126
4204	xa_chieng_khoong	Xã Chiềng Khoong	xã	126
4207	xa_chieng_cang	Xã Chiềng Cang	xã	126
4210	xa_huoi_mot	Xã Huổi Một	xã	126
4213	xa_muong_sai	Xã Mường Sai	xã	126
4216	xa_muong_cai	Xã Mường Cai	xã	126
4219	xa_muong_hung	Xã Mường Hung	xã	126
4222	xa_chieng_khuong	Xã Chiềng Khương	xã	126
4225	xa_sam_kha	Xã Sam Kha	xã	127
4228	xa_pung_banh	Xã Púng Bánh	xã	127
4231	xa_sop_cop	Xã Sốp Cộp	xã	127
4234	xa_dom_cang	Xã Dồm Cang	xã	127
4237	xa_nam_lanh	Xã Nậm Lạnh	xã	127
4240	xa_muong_leo	Xã Mường Lèo	xã	127
4243	xa_muong_va	Xã Mường Và	xã	127
4246	xa_muong_lan	Xã Mường Lạn	xã	127
3994	xa_suoi_bang	Xã Suối Bàng	xã	128
4006	xa_song_khua	Xã Song Khủa	xã	128
4009	xa_lien_hoa	Xã Liên Hoà	xã	128
4018	xa_to_mua	Xã Tô Múa	xã	128
4021	xa_muong_te	Xã Mường Tè	xã	128
4036	xa_chieng_khoa	Xã Chiềng Khoa	xã	128
4039	xa_muong_men	Xã Mường Men	xã	128
4042	xa_quang_minh	Xã Quang Minh	xã	128
4048	xa_van_ho	Xã Vân Hồ	xã	128
4051	xa_long_luong	Xã Lóng Luông	xã	128
4054	xa_chieng_yen	Xã Chiềng Yên	xã	128
4056	xa_chieng_xuan	Xã Chiềng Xuân	xã	128
4057	xa_xuan_nha	Xã Xuân Nha	xã	128
4058	xa_tan_xuan	Xã Tân Xuân	xã	128
4249	phuong_yen_thinh	Phường Yên Thịnh	phường	132
4252	phuong_yen_ninh	Phường Yên Ninh	phường	132
4255	phuong_minh_tan	Phường Minh Tân	phường	132
4258	phuong_nguyen_thai_hoc	Phường Nguyễn Thái Học	phường	132
4261	phuong_dong_tam	Phường Đồng Tâm	phường	132
4264	phuong_nguyen_phuc	Phường Nguyễn Phúc	phường	132
4267	phuong_hong_ha	Phường Hồng Hà	phường	132
4270	xa_minh_bao	Xã Minh Bảo	xã	132
4273	phuong_nam_cuong	Phường Nam Cường	phường	132
4276	xa_tuy_loc	Xã Tuy Lộc	xã	132
4279	xa_tan_thinh	Xã Tân Thịnh	xã	132
4540	xa_au_lau	Xã Âu Lâu	xã	132
4543	xa_gioi_phien	Xã Giới Phiên	xã	132
4546	phuong_hop_minh	Phường Hợp Minh	phường	132
4558	xa_van_phu	Xã Văn Phú	xã	132
4282	phuong_pu_trang	Phường Pú Trạng	phường	133
4285	phuong_trung_tam	Phường Trung Tâm	phường	133
4288	phuong_tan_an	Phường Tân An	phường	133
4291	phuong_cau_thia	Phường Cầu Thia	phường	133
4294	xa_nghia_loi	Xã Nghĩa Lợi	xã	133
4297	xa_nghia_phuc	Xã Nghĩa Phúc	xã	133
4300	xa_nghia_an	Xã Nghĩa An	xã	133
4624	xa_nghia_lo	Xã Nghĩa Lộ	xã	133
4660	xa_son_a	Xã Sơn A	xã	133
4663	xa_phu_nham	Xã Phù Nham	xã	133
4675	xa_thanh_luong	Xã Thanh Lương	xã	133
4678	xa_hanh_son	Xã Hạnh Sơn	xã	133
4681	xa_phuc_son	Xã Phúc Sơn	xã	133
4684	xa_thach_luong	Xã Thạch Lương	xã	133
4303	thi_tran_yen_the	Thị trấn Yên Thế	thị trấn	135
4306	xa_tan_phuong	Xã Tân Phượng	xã	135
4309	xa_lam_thuong	Xã Lâm Thượng	xã	135
4312	xa_khanh_thien	Xã Khánh Thiện	xã	135
4315	xa_minh_chuan	Xã Minh Chuẩn	xã	135
4318	xa_mai_son	Xã Mai Sơn	xã	135
4321	xa_khai_trung	Xã Khai Trung	xã	135
4324	xa_muong_lai	Xã Mường Lai	xã	135
4327	xa_an_lac	Xã An Lạc	xã	135
4330	xa_minh_xuan	Xã Minh Xuân	xã	135
4333	xa_to_mau	Xã Tô Mậu	xã	135
4336	xa_tan_linh	Xã Tân Lĩnh	xã	135
4339	xa_yen_thang	Xã Yên Thắng	xã	135
4342	xa_khanh_hoa	Xã Khánh Hoà	xã	135
4345	xa_vinh_lac	Xã Vĩnh Lạc	xã	135
4348	xa_lieu_do	Xã Liễu Đô	xã	135
4351	xa_dong_quan	Xã Động Quan	xã	135
4354	xa_tan_lap	Xã Tân Lập	xã	135
4357	xa_minh_tien	Xã Minh Tiến	xã	135
4360	xa_truc_lau	Xã Trúc Lâu	xã	135
4363	xa_phuc_loi	Xã Phúc Lợi	xã	135
4366	xa_phan_thanh	Xã Phan Thanh	xã	135
4369	xa_an_phu	Xã An Phú	xã	135
4372	xa_trung_tam	Xã Trung Tâm	xã	135
4375	thi_tran_mau_a	Thị trấn Mậu A	thị trấn	136
4378	xa_lang_thip	Xã Lang Thíp	xã	136
4381	xa_lam_giang	Xã Lâm Giang	xã	136
4384	xa_chau_que_thuong	Xã Châu Quế Thượng	xã	136
4387	xa_chau_que_ha	Xã Châu Quế Hạ	xã	136
4390	xa_an_binh	Xã An Bình	xã	136
4393	xa_quang_minh	Xã Quang Minh	xã	136
4396	xa_dong_an	Xã Đông An	xã	136
4399	xa_dong_cuong	Xã Đông Cuông	xã	136
4402	xa_phong_du_ha	Xã Phong Dụ Hạ	xã	136
4405	xa_mau_dong	Xã Mậu Đông	xã	136
4408	xa_ngoi_a	Xã Ngòi A	xã	136
4411	xa_xuan_tam	Xã Xuân Tầm	xã	136
4414	xa_tan_hop	Xã Tân Hợp	xã	136
4417	xa_an_thinh	Xã An Thịnh	xã	136
4420	xa_yen_thai	Xã Yên Thái	xã	136
4423	xa_phong_du_thuong	Xã Phong Dụ Thượng	xã	136
4426	xa_yen_hop	Xã Yên Hợp	xã	136
4429	xa_dai_son	Xã Đại Sơn	xã	136
4435	xa_dai_phac	Xã Đại Phác	xã	136
4438	xa_yen_phu	Xã Yên Phú	xã	136
4441	xa_xuan_ai	Xã Xuân Ái	xã	136
4447	xa_vien_son	Xã Viễn Sơn	xã	136
4450	xa_mo_vang	Xã Mỏ Vàng	xã	136
4453	xa_na_hau	Xã Nà Hẩu	xã	136
4456	thi_tran_mu_cang_chai	Thị trấn Mù Căng Chải	thị trấn	137
4459	xa_ho_bon	Xã Hồ Bốn	xã	137
4462	xa_nam_co	Xã Nậm Có	xã	137
4465	xa_khao_mang	Xã Khao Mang	xã	137
4468	xa_mo_de	Xã Mồ Dề	xã	137
4471	xa_che_cu_nha	Xã Chế Cu Nha	xã	137
4474	xa_lao_chai	Xã Lao Chải	xã	137
4477	xa_kim_noi	Xã Kim Nọi	xã	137
4480	xa_cao_pha	Xã Cao Phạ	xã	137
4483	xa_la_pan_tan	Xã La Pán Tẩn	xã	137
4486	xa_de_su_phinh	Xã Dế Su Phình	xã	137
4489	xa_che_tao	Xã Chế Tạo	xã	137
4492	xa_pung_luong	Xã Púng Luông	xã	137
4495	xa_nam_khat	Xã Nậm Khắt	xã	137
4498	thi_tran_co_phuc	Thị trấn Cổ Phúc	thị trấn	138
4501	xa_tan_dong	Xã Tân Đồng	xã	138
4504	xa_bao_dap	Xã Báo Đáp	xã	138
4507	xa_dao_thinh	Xã Đào Thịnh	xã	138
4510	xa_viet_thanh	Xã Việt Thành	xã	138
4513	xa_hoa_cuong	Xã Hòa Cuông	xã	138
4516	xa_minh_quan	Xã Minh Quán	xã	138
4519	xa_quy_mong	Xã Quy Mông	xã	138
4522	xa_cuong_thinh	Xã Cường Thịnh	xã	138
4525	xa_kien_thanh	Xã Kiên Thành	xã	138
4528	xa_nga_quan	Xã Nga Quán	xã	138
4531	xa_y_can	Xã Y Can	xã	138
4537	xa_luong_thinh	Xã Lương Thịnh	xã	138
4561	xa_bao_hung	Xã Bảo Hưng	xã	138
4564	xa_viet_cuong	Xã Việt Cường	xã	138
4567	xa_minh_quan	Xã Minh Quân	xã	138
4570	xa_hong_ca	Xã Hồng Ca	xã	138
4573	xa_hung_thinh	Xã Hưng Thịnh	xã	138
4576	xa_hung_khanh	Xã Hưng Khánh	xã	138
4579	xa_viet_hong	Xã Việt Hồng	xã	138
4582	xa_van_hoi	Xã Vân Hội	xã	138
4585	thi_tran_tram_tau	Thị trấn Trạm Tấu	thị trấn	139
4588	xa_tuc_dan	Xã Túc Đán	xã	139
4591	xa_pa_lau	Xã Pá Lau	xã	139
4594	xa_xa_ho	Xã Xà Hồ	xã	139
4597	xa_phinh_ho	Xã Phình Hồ	xã	139
4600	xa_tram_tau	Xã Trạm Tấu	xã	139
4603	xa_ta_si_lang	Xã Tà Si Láng	xã	139
4606	xa_pa_hu	Xã Pá Hu	xã	139
4609	xa_lang_nhi	Xã Làng Nhì	xã	139
4612	xa_ban_cong	Xã Bản Công	xã	139
4615	xa_ban_mu	Xã Bản Mù	xã	139
4618	xa_hat_liu	Xã Hát Lìu	xã	139
4621	thi_tran_nt_lien_son	Thị trấn NT Liên Sơn	thị trấn	140
4627	thi_tran_nt_tran_phu	Thị trấn NT Trần Phú	thị trấn	140
4630	xa_tu_le	Xã Tú Lệ	xã	140
4633	xa_nam_bung	Xã Nậm Búng	xã	140
4636	xa_gia_hoi	Xã Gia Hội	xã	140
4639	xa_sung_do	Xã Sùng Đô	xã	140
4642	xa_nam_muoi	Xã Nậm Mười	xã	140
4645	xa_an_luong	Xã An Lương	xã	140
4648	xa_nam_lanh	Xã Nậm Lành	xã	140
4651	xa_son_luong	Xã Sơn Lương	xã	140
4654	xa_suoi_quyen	Xã Suối Quyền	xã	140
4657	xa_suoi_giang	Xã Suối Giàng	xã	140
4666	xa_nghia_son	Xã Nghĩa Sơn	xã	140
4669	xa_suoi_bu	Xã Suối Bu	xã	140
4672	thi_tran_son_thinh	Thị trấn Sơn Thịnh	thị trấn	140
4687	xa_dai_lich	Xã Đại Lịch	xã	140
4690	xa_dong_khe	Xã Đồng Khê	xã	140
4693	xa_cat_thinh	Xã Cát Thịnh	xã	140
4696	xa_tan_thinh	Xã Tân Thịnh	xã	140
4699	xa_chan_thinh	Xã Chấn Thịnh	xã	140
4702	xa_binh_thuan	Xã Bình Thuận	xã	140
4705	xa_thuong_bang_la	Xã Thượng Bằng La	xã	140
4708	xa_minh_an	Xã Minh An	xã	140
4711	xa_nghia_tam	Xã Nghĩa Tâm	xã	140
4714	thi_tran_yen_binh	Thị trấn Yên Bình	thị trấn	141
4717	thi_tran_thac_ba	Thị trấn Thác Bà	thị trấn	141
4720	xa_xuan_long	Xã Xuân Long	xã	141
4726	xa_cam_nhan	Xã Cảm Nhân	xã	141
4729	xa_ngoc_chan	Xã Ngọc Chấn	xã	141
4732	xa_tan_nguyen	Xã Tân Nguyên	xã	141
4735	xa_phuc_ninh	Xã Phúc Ninh	xã	141
4738	xa_bao_ai	Xã Bảo Ái	xã	141
4741	xa_my_gia	Xã Mỹ Gia	xã	141
4744	xa_xuan_lai	Xã Xuân Lai	xã	141
4747	xa_mong_son	Xã Mông Sơn	xã	141
4750	xa_cam_an	Xã Cảm Ân	xã	141
4753	xa_yen_thanh	Xã Yên Thành	xã	141
4756	xa_tan_huong	Xã Tân Hương	xã	141
4759	xa_phuc_an	Xã Phúc An	xã	141
4762	xa_bach_ha	Xã Bạch Hà	xã	141
4765	xa_vu_linh	Xã Vũ Linh	xã	141
4768	xa_dai_dong	Xã Đại Đồng	xã	141
4771	xa_vinh_kien	Xã Vĩnh Kiên	xã	141
4774	xa_yen_binh	Xã Yên Bình	xã	141
4777	xa_thinh_hung	Xã Thịnh Hưng	xã	141
4780	xa_han_da	Xã Hán Đà	xã	141
4783	xa_phu_thinh	Xã Phú Thịnh	xã	141
4786	xa_dai_minh	Xã Đại Minh	xã	141
4789	phuong_thai_binh	Phường Thái Bình	phường	148
4792	phuong_tan_hoa	Phường Tân Hòa	phường	148
4795	phuong_thinh_lang	Phường Thịnh Lang	phường	148
4798	phuong_huu_nghi	Phường Hữu Nghị	phường	148
4801	phuong_tan_thinh	Phường Tân Thịnh	phường	148
4804	phuong_dong_tien	Phường Đồng Tiến	phường	148
20449	xa_lang	Xã Lăng	xã	504
4807	phuong_phuong_lam	Phường Phương Lâm	phường	148
4813	xa_yen_mong	Xã Yên Mông	xã	148
4816	phuong_quynh_lam	Phường Quỳnh Lâm	phường	148
4819	phuong_dan_chu	Phường Dân Chủ	phường	148
4825	xa_hoa_binh	Xã Hòa Bình	xã	148
4828	phuong_thong_nhat	Phường Thống Nhất	phường	148
4894	phuong_ky_son	Phường Kỳ Sơn	phường	148
4897	xa_thinh_minh	Xã Thịnh Minh	xã	148
4903	xa_hop_thanh	Xã Hợp Thành	xã	148
4906	xa_quang_tien	Xã Quang Tiến	xã	148
4912	xa_mong_hoa	Xã Mông Hóa	xã	148
4918	phuong_trung_minh	Phường Trung Minh	phường	148
4921	xa_doc_lap	Xã Độc Lập	xã	148
4831	thi_tran_da_bac	Thị trấn Đà Bắc	thị trấn	150
4834	xa_nanh_nghe	Xã Nánh Nghê	xã	150
4840	xa_giap_dat	Xã Giáp Đắt	xã	150
4846	xa_muong_chieng	Xã Mường Chiềng	xã	150
4849	xa_tan_pheo	Xã Tân Pheo	xã	150
4852	xa_dong_chum	Xã Đồng Chum	xã	150
4855	xa_tan_minh	Xã Tân Minh	xã	150
4858	xa_doan_ket	Xã Đoàn Kết	xã	150
4861	xa_dong_ruong	Xã Đồng Ruộng	xã	150
4867	xa_tu_ly	Xã Tú Lý	xã	150
4870	xa_trung_thanh	Xã Trung Thành	xã	150
4873	xa_yen_hoa	Xã Yên Hòa	xã	150
4876	xa_cao_son	Xã Cao Sơn	xã	150
4879	xa_toan_son	Xã Toàn Sơn	xã	150
4885	xa_hien_luong	Xã Hiền Lương	xã	150
4888	xa_tien_phong	Xã Tiền Phong	xã	150
4891	xa_vay_nua	Xã Vầy Nưa	xã	150
4924	thi_tran_luong_son	Thị trấn Lương Sơn	thị trấn	152
4942	xa_lam_son	Xã Lâm Sơn	xã	152
4945	xa_hoa_son	Xã Hòa Sơn	xã	152
4951	xa_tan_vinh	Xã Tân Vinh	xã	152
4954	xa_nhuan_trach	Xã Nhuận Trạch	xã	152
4957	xa_cao_son	Xã Cao Sơn	xã	152
4960	xa_cu_yen	Xã Cư Yên	xã	152
4969	xa_lien_son	Xã Liên Sơn	xã	152
5008	xa_cao_duong	Xã Cao Dương	xã	152
5041	xa_thanh_son	Xã Thanh Sơn	xã	152
5047	xa_thanh_cao	Xã Thanh Cao	xã	152
4978	thi_tran_bo	Thị trấn Bo	thị trấn	153
4984	xa_du_sang	Xã Đú Sáng	xã	153
4987	xa_hung_son	Xã Hùng Sơn	xã	153
4990	xa_binh_son	Xã Bình Sơn	xã	153
4999	xa_tu_son	Xã Tú Sơn	xã	153
5005	xa_vinh_tien	Xã Vĩnh Tiến	xã	153
5014	xa_dong_bac	Xã Đông Bắc	xã	153
5017	xa_xuan_thuy	Xã Xuân Thủy	xã	153
5026	xa_vinh_dong	Xã Vĩnh Đồng	xã	153
5035	xa_kim_lap	Xã Kim Lập	xã	153
5038	xa_hop_tien	Xã Hợp Tiến	xã	153
5065	xa_kim_boi	Xã Kim Bôi	xã	153
5068	xa_nam_thuong	Xã Nam Thượng	xã	153
5077	xa_cuoi_ha	Xã Cuối Hạ	xã	153
5080	xa_sao_bay	Xã Sào Báy	xã	153
5083	xa_mi_hoa	Xã Mi Hòa	xã	153
5086	xa_nuong_dam	Xã Nuông Dăm	xã	153
5089	thi_tran_cao_phong	Thị trấn Cao Phong	thị trấn	154
5092	xa_binh_thanh	Xã Bình Thanh	xã	154
5095	xa_thung_nai	Xã Thung Nai	xã	154
5098	xa_bac_phong	Xã Bắc Phong	xã	154
5101	xa_thu_phong	Xã Thu Phong	xã	154
5104	xa_hop_phong	Xã Hợp Phong	xã	154
5110	xa_tay_phong	Xã Tây Phong	xã	154
5116	xa_dung_phong	Xã Dũng Phong	xã	154
5119	xa_nam_phong	Xã Nam Phong	xã	154
5125	xa_thach_yen	Xã Thạch Yên	xã	154
5128	thi_tran_man_duc	Thị trấn Mãn Đức	thị trấn	155
5134	xa_suoi_hoa	Xã Suối Hoa	xã	155
5137	xa_phu_vinh	Xã Phú Vinh	xã	155
5140	xa_phu_cuong	Xã Phú Cường	xã	155
5143	xa_my_hoa	Xã Mỹ Hòa	xã	155
5152	xa_quyet_chien	Xã Quyết Chiến	xã	155
5158	xa_phong_phu	Xã Phong Phú	xã	155
5164	xa_tu_ne	Xã Tử Nê	xã	155
5167	xa_thanh_hoi	Xã Thanh Hối	xã	155
5170	xa_ngoc_my	Xã Ngọc Mỹ	xã	155
5173	xa_dong_lai	Xã Đông Lai	xã	155
5176	xa_van_son	Xã Vân Sơn	xã	155
5182	xa_nhan_my	Xã Nhân Mỹ	xã	155
5191	xa_lo_son	Xã Lỗ Sơn	xã	155
5194	xa_ngo_luong	Xã Ngổ Luông	xã	155
5197	xa_gia_mo	Xã Gia Mô	xã	155
4882	xa_tan_thanh	Xã Tân Thành	xã	156
5200	thi_tran_mai_chau	Thị trấn Mai Châu	thị trấn	156
5206	xa_son_thuy	Xã Sơn Thủy	xã	156
5209	xa_pa_co	Xã Pà Cò	xã	156
5212	xa_hang_kia	Xã Hang Kia	xã	156
5221	xa_dong_tan	Xã Đồng Tân	xã	156
5224	xa_cun_pheo	Xã Cun Pheo	xã	156
5227	xa_bao_la	Xã Bao La	xã	156
5233	xa_tong_dau	Xã Tòng Đậu	xã	156
5242	xa_na_phon	Xã Nà Phòn	xã	156
5245	xa_sam_khoe	Xã Săm Khóe	xã	156
5248	xa_chieng_chau	Xã Chiềng Châu	xã	156
5251	xa_mai_ha	Xã Mai Hạ	xã	156
5254	xa_thanh_son	Xã Thành Sơn	xã	156
5257	xa_mai_hich	Xã Mai Hịch	xã	156
5263	xa_van_mai	Xã Vạn Mai	xã	156
5266	thi_tran_vu_ban	Thị trấn Vụ Bản	thị trấn	157
5269	xa_quy_hoa	Xã Quý Hòa	xã	157
5272	xa_mien_doi	Xã Miền Đồi	xã	157
5275	xa_my_thanh	Xã Mỹ Thành	xã	157
5278	xa_tuan_dao	Xã Tuân Đạo	xã	157
5281	xa_van_nghia	Xã Văn Nghĩa	xã	157
5284	xa_van_son	Xã Văn Sơn	xã	157
5287	xa_tan_lap	Xã Tân Lập	xã	157
5290	xa_nhan_nghia	Xã Nhân Nghĩa	xã	157
5293	xa_thuong_coc	Xã Thượng Cốc	xã	157
5299	xa_quyet_thang	Xã Quyết Thắng	xã	157
5302	xa_xuat_hoa	Xã Xuất Hóa	xã	157
5305	xa_yen_phu	Xã Yên Phú	xã	157
5308	xa_binh_hem	Xã Bình Hẻm	xã	157
5320	xa_dinh_cu	Xã Định Cư	xã	157
5323	xa_chi_dao	Xã Chí Đạo	xã	157
5329	xa_ngoc_son	Xã Ngọc Sơn	xã	157
5332	xa_huong_nhuong	Xã Hương Nhượng	xã	157
5335	xa_vu_binh	Xã Vũ Bình	xã	157
5338	xa_tu_do	Xã Tự Do	xã	157
5341	xa_yen_nghiep	Xã Yên Nghiệp	xã	157
5344	xa_tan_my	Xã Tân Mỹ	xã	157
5347	xa_an_nghia	Xã Ân Nghĩa	xã	157
5350	xa_ngoc_lau	Xã Ngọc Lâu	xã	157
5353	thi_tran_hang_tram	Thị trấn Hàng Trạm	thị trấn	158
5356	xa_lac_sy	Xã Lạc Sỹ	xã	158
5362	xa_lac_luong	Xã Lạc Lương	xã	158
5365	xa_bao_hieu	Xã Bảo Hiệu	xã	158
5368	xa_da_phuc	Xã Đa Phúc	xã	158
5371	xa_huu_loi	Xã Hữu Lợi	xã	158
5374	xa_lac_thinh	Xã Lạc Thịnh	xã	158
5380	xa_doan_ket	Xã Đoàn Kết	xã	158
5383	xa_phu_lai	Xã Phú Lai	xã	158
5386	xa_yen_tri	Xã Yên Trị	xã	158
5389	xa_ngoc_luong	Xã Ngọc Lương	xã	158
4981	thi_tran_ba_hang_doi	Thị trấn Ba Hàng Đồi	thị trấn	159
5392	thi_tran_chi_ne	Thị trấn Chi Nê	thị trấn	159
5395	xa_phu_nghia	Xã Phú Nghĩa	xã	159
5398	xa_phu_thanh	Xã Phú Thành	xã	159
5404	xa_hung_thi	Xã Hưng Thi	xã	159
5413	xa_khoan_du	Xã Khoan Dụ	xã	159
5419	xa_dong_tam	Xã Đồng Tâm	xã	159
5422	xa_yen_bong	Xã Yên Bồng	xã	159
5425	xa_thong_nhat	Xã Thống Nhất	xã	159
5428	xa_an_binh	Xã An Bình	xã	159
5431	phuong_quan_trieu	Phường Quán Triều	phường	164
5434	phuong_quang_vinh	Phường Quang Vinh	phường	164
5437	phuong_tuc_duyen	Phường Túc Duyên	phường	164
5440	phuong_hoang_van_thu	Phường Hoàng Văn Thụ	phường	164
5443	phuong_trung_vuong	Phường Trưng Vương	phường	164
5446	phuong_quang_trung	Phường Quang Trung	phường	164
5449	phuong_phan_dinh_phung	Phường Phan Đình Phùng	phường	164
5452	phuong_tan_thinh	Phường Tân Thịnh	phường	164
5455	phuong_thinh_dan	Phường Thịnh Đán	phường	164
5458	phuong_dong_quang	Phường Đồng Quang	phường	164
5461	phuong_gia_sang	Phường Gia Sàng	phường	164
5464	phuong_tan_lap	Phường Tân Lập	phường	164
5467	phuong_cam_gia	Phường Cam Giá	phường	164
5470	phuong_phu_xa	Phường Phú Xá	phường	164
5473	phuong_huong_son	Phường Hương Sơn	phường	164
5476	phuong_trung_thanh	Phường Trung Thành	phường	164
5479	phuong_tan_thanh	Phường Tân Thành	phường	164
5482	phuong_tan_long	Phường Tân Long	phường	164
5485	xa_phuc_ha	Xã Phúc Hà	xã	164
5488	xa_phuc_xuan	Xã Phúc Xuân	xã	164
5491	xa_quyet_thang	Xã Quyết Thắng	xã	164
5494	xa_phuc_triu	Xã Phúc Trìu	xã	164
5497	xa_thinh_duc	Xã Thịnh Đức	xã	164
5500	phuong_tich_luong	Phường Tích Lương	phường	164
5503	xa_tan_cuong	Xã Tân Cương	xã	164
5653	xa_son_cam	Xã Sơn Cẩm	xã	164
5659	phuong_chua_hang	Phường Chùa Hang	phường	164
5695	xa_cao_ngan	Xã Cao Ngạn	xã	164
5701	xa_linh_son	Xã Linh Sơn	xã	164
5710	phuong_dong_bam	Phường Đồng Bẩm	phường	164
5713	xa_huong_thuong	Xã Huống Thượng	xã	164
5914	xa_dong_lien	Xã Đồng Liên	xã	164
5506	phuong_luong_son	Phường Lương Sơn	phường	165
5509	phuong_chau_son	Phường Châu Sơn	phường	165
5512	phuong_mo_che	Phường Mỏ Chè	phường	165
5515	phuong_cai_dan	Phường Cải Đan	phường	165
5518	phuong_thang_loi	Phường Thắng Lợi	phường	165
5521	phuong_pho_co	Phường Phố Cò	phường	165
5527	xa_tan_quang	Xã Tân Quang	xã	165
5528	phuong_bach_quang	Phường Bách Quang	phường	165
5530	xa_binh_son	Xã Bình Sơn	xã	165
5533	xa_ba_xuyen	Xã Bá Xuyên	xã	165
5536	thi_tran_cho_chu	Thị trấn Chợ Chu	thị trấn	167
5539	xa_linh_thong	Xã Linh Thông	xã	167
5542	xa_lam_vy	Xã Lam Vỹ	xã	167
5545	xa_quy_ky	Xã Quy Kỳ	xã	167
5548	xa_tan_thinh	Xã Tân Thịnh	xã	167
5551	xa_kim_phuong	Xã Kim Phượng	xã	167
5554	xa_bao_linh	Xã Bảo Linh	xã	167
5560	xa_phuc_chu	Xã Phúc Chu	xã	167
5563	xa_tan_duong	Xã Tân Dương	xã	167
5566	xa_phuong_tien	Xã Phượng Tiến	xã	167
5569	xa_bao_cuong	Xã Bảo Cường	xã	167
5572	xa_dong_thinh	Xã Đồng Thịnh	xã	167
5575	xa_dinh_bien	Xã Định Biên	xã	167
5578	xa_thanh_dinh	Xã Thanh Định	xã	167
5581	xa_trung_hoi	Xã Trung Hội	xã	167
5584	xa_trung_luong	Xã Trung Lương	xã	167
5587	xa_binh_yen	Xã Bình Yên	xã	167
5590	xa_diem_mac	Xã Điềm Mặc	xã	167
5593	xa_phu_tien	Xã Phú Tiến	xã	167
5596	xa_boc_nhieu	Xã Bộc Nhiêu	xã	167
5599	xa_son_phu	Xã Sơn Phú	xã	167
5602	xa_phu_dinh	Xã Phú Đình	xã	167
5605	xa_binh_thanh	Xã Bình Thành	xã	167
5608	thi_tran_giang_tien	Thị trấn Giang Tiên	thị trấn	168
5611	thi_tran_du	Thị trấn Đu	thị trấn	168
5614	xa_yen_ninh	Xã Yên Ninh	xã	168
5617	xa_yen_trach	Xã Yên Trạch	xã	168
5620	xa_yen_do	Xã Yên Đổ	xã	168
5623	xa_yen_lac	Xã Yên Lạc	xã	168
5626	xa_on_luong	Xã Ôn Lương	xã	168
5629	xa_dong_dat	Xã Động Đạt	xã	168
5632	xa_phu_ly	Xã Phủ Lý	xã	168
5635	xa_phu_do	Xã Phú Đô	xã	168
5638	xa_hop_thanh	Xã Hợp Thành	xã	168
5641	xa_tuc_tranh	Xã Tức Tranh	xã	168
5644	xa_phan_me	Xã Phấn Mễ	xã	168
5647	xa_vo_tranh	Xã Vô Tranh	xã	168
5650	xa_co_lung	Xã Cổ Lũng	xã	168
5656	thi_tran_song_cau	Thị trấn Sông Cầu	thị trấn	169
5662	thi_tran_trai_cau	Thị trấn Trại Cau	thị trấn	169
5665	xa_van_lang	Xã Văn Lăng	xã	169
5668	xa_tan_long	Xã Tân Long	xã	169
5671	xa_hoa_binh	Xã Hòa Bình	xã	169
5674	xa_quang_son	Xã Quang Sơn	xã	169
5677	xa_minh_lap	Xã Minh Lập	xã	169
5680	xa_van_han	Xã Văn Hán	xã	169
5683	xa_hoa_trung	Xã Hóa Trung	xã	169
5686	xa_khe_mo	Xã Khe Mo	xã	169
5689	xa_cay_thi	Xã Cây Thị	xã	169
5692	xa_hoa_thuong	Xã Hóa Thượng	xã	169
5698	xa_hop_tien	Xã Hợp Tiến	xã	169
5704	xa_tan_loi	Xã Tân Lợi	xã	169
5707	xa_nam_hoa	Xã Nam Hòa	xã	169
5716	thi_tran_dinh_ca	Thị trấn Đình Cả	thị trấn	170
5719	xa_sang_moc	Xã Sảng Mộc	xã	170
5722	xa_nghinh_tuong	Xã Nghinh Tường	xã	170
5725	xa_than_xa	Xã Thần Xa	xã	170
5728	xa_vu_chan	Xã Vũ Chấn	xã	170
5731	xa_thuong_nung	Xã Thượng Nung	xã	170
5734	xa_phu_thuong	Xã Phú Thượng	xã	170
5737	xa_cuc_duong	Xã Cúc Đường	xã	170
5740	xa_la_hien	Xã La Hiên	xã	170
5743	xa_lau_thuong	Xã Lâu Thượng	xã	170
5746	xa_trang_xa	Xã Tràng Xá	xã	170
5749	xa_phuong_giao	Xã Phương Giao	xã	170
5752	xa_lien_minh	Xã Liên Minh	xã	170
5755	xa_dan_tien	Xã Dân Tiến	xã	170
5758	xa_binh_long	Xã Bình Long	xã	170
5761	thi_tran_hung_son	Thị trấn Hùng Sơn	thị trấn	171
5764	thi_tran_quan_chu	Thị trấn Quân Chu	thị trấn	171
5767	xa_phuc_luong	Xã Phúc Lương	xã	171
5770	xa_minh_tien	Xã Minh Tiến	xã	171
5773	xa_yen_lang	Xã Yên Lãng	xã	171
5776	xa_duc_luong	Xã Đức Lương	xã	171
5779	xa_phu_cuong	Xã Phú Cường	xã	171
5782	xa_na_mao	Xã Na Mao	xã	171
5785	xa_phu_lac	Xã Phú Lạc	xã	171
5788	xa_tan_linh	Xã Tân Linh	xã	171
5791	xa_phu_thinh	Xã Phú Thịnh	xã	171
5794	xa_phuc_linh	Xã Phục Linh	xã	171
5797	xa_phu_xuyen	Xã Phú Xuyên	xã	171
5800	xa_ban_ngoai	Xã Bản Ngoại	xã	171
5803	xa_tien_hoi	Xã Tiên Hội	xã	171
5809	xa_cu_van	Xã Cù Vân	xã	171
5812	xa_ha_thuong	Xã Hà Thượng	xã	171
5815	xa_la_bang	Xã La Bằng	xã	171
5818	xa_hoang_nong	Xã Hoàng Nông	xã	171
5821	xa_khoi_ky	Xã Khôi Kỳ	xã	171
5824	xa_an_khanh	Xã An Khánh	xã	171
5827	xa_tan_thai	Xã Tân Thái	xã	171
5830	xa_binh_thuan	Xã Bình Thuận	xã	171
5833	xa_luc_ba	Xã Lục Ba	xã	171
5836	xa_my_yen	Xã Mỹ Yên	xã	171
5839	xa_van_tho	Xã Vạn Thọ	xã	171
5842	xa_van_yen	Xã Văn Yên	xã	171
5845	xa_ky_phu	Xã Ký Phú	xã	171
5848	xa_cat_ne	Xã Cát Nê	xã	171
5851	xa_quan_chu	Xã Quân Chu	xã	171
5854	phuong_bai_bong	Phường Bãi Bông	phường	172
5857	phuong_bac_son	Phường Bắc Sơn	phường	172
5860	phuong_ba_hang	Phường Ba Hàng	phường	172
5863	xa_phuc_tan	Xã Phúc Tân	xã	172
5866	xa_phuc_thuan	Xã Phúc Thuận	xã	172
5869	xa_hong_tien	Xã Hồng Tiến	xã	172
5872	xa_minh_duc	Xã Minh Đức	xã	172
5875	xa_dac_son	Xã Đắc Sơn	xã	172
5878	phuong_dong_tien	Phường Đồng Tiến	phường	172
5881	xa_thanh_cong	Xã Thành Công	xã	172
5884	xa_tien_phong	Xã Tiên Phong	xã	172
5887	xa_van_phai	Xã Vạn Phái	xã	172
5890	xa_nam_tien	Xã Nam Tiến	xã	172
5893	xa_tan_huong	Xã Tân Hương	xã	172
5896	xa_dong_cao	Xã Đông Cao	xã	172
5899	xa_trung_thanh	Xã Trung Thành	xã	172
5902	xa_tan_phu	Xã Tân Phú	xã	172
5905	xa_thuan_thanh	Xã Thuận Thành	xã	172
5908	thi_tran_huong_son	Thị trấn Hương Sơn	thị trấn	173
5911	xa_ban_dat	Xã Bàn Đạt	xã	173
5917	xa_tan_khanh	Xã Tân Khánh	xã	173
5920	xa_tan_kim	Xã Tân Kim	xã	173
5923	xa_tan_thanh	Xã Tân Thành	xã	173
5926	xa_dao_xa	Xã Đào Xá	xã	173
5929	xa_bao_ly	Xã Bảo Lý	xã	173
5932	xa_thuong_dinh	Xã Thượng Đình	xã	173
5935	xa_tan_hoa	Xã Tân Hòa	xã	173
5938	xa_nha_long	Xã Nhã Lộng	xã	173
5941	xa_diem_thuy	Xã Điềm Thụy	xã	173
5944	xa_xuan_phuong	Xã Xuân Phương	xã	173
5947	xa_tan_duc	Xã Tân Đức	xã	173
5950	xa_uc_ky	Xã Úc Kỳ	xã	173
5953	xa_luong_phu	Xã Lương Phú	xã	173
5956	xa_nga_my	Xã Nga My	xã	173
5959	xa_kha_son	Xã Kha Sơn	xã	173
5962	xa_thanh_ninh	Xã Thanh Ninh	xã	173
5965	xa_duong_thanh	Xã Dương Thành	xã	173
5968	xa_ha_chau	Xã Hà Châu	xã	173
5971	phuong_hoang_van_thu	Phường Hoàng Văn Thụ	phường	178
5974	phuong_tam_thanh	Phường Tam Thanh	phường	178
5977	phuong_vinh_trai	Phường Vĩnh Trại	phường	178
5980	phuong_dong_kinh	Phường Đông Kinh	phường	178
5983	phuong_chi_lang	Phường Chi Lăng	phường	178
5986	xa_hoang_dong	Xã Hoàng Đồng	xã	178
5989	xa_quang_lac	Xã Quảng Lạc	xã	178
5992	xa_mai_pha	Xã Mai Pha	xã	178
5995	thi_tran_that_khe	Thị trấn Thất Khê	thị trấn	180
5998	xa_khanh_long	Xã Khánh Long	xã	180
6001	xa_doan_ket	Xã Đoàn Kết	xã	180
6004	xa_quoc_khanh	Xã Quốc Khánh	xã	180
6007	xa_vinh_tien	Xã Vĩnh Tiến	xã	180
6010	xa_cao_minh	Xã Cao Minh	xã	180
6013	xa_chi_minh	Xã Chí Minh	xã	180
6016	xa_tri_phuong	Xã Tri Phương	xã	180
6019	xa_tan_tien	Xã Tân Tiến	xã	180
6022	xa_tan_yen	Xã Tân Yên	xã	180
6025	xa_doi_can	Xã Đội Cấn	xã	180
6028	xa_tan_minh	Xã Tân Minh	xã	180
6031	xa_kim_dong	Xã Kim Đồng	xã	180
6034	xa_chi_lang	Xã Chi Lăng	xã	180
6037	xa_trung_thanh	Xã Trung Thành	xã	180
6040	xa_dai_dong	Xã Đại Đồng	xã	180
6043	xa_dao_vien	Xã Đào Viên	xã	180
6046	xa_de_tham	Xã Đề Thám	xã	180
6049	xa_khang_chien	Xã Kháng Chiến	xã	180
6055	xa_hung_son	Xã Hùng Sơn	xã	180
6058	xa_quoc_viet	Xã Quốc Việt	xã	180
6061	xa_hung_viet	Xã Hùng Việt	xã	180
6067	xa_hung_dao	Xã Hưng Đạo	xã	181
6070	xa_vinh_yen	Xã Vĩnh Yên	xã	181
6073	xa_hoa_tham	Xã Hoa Thám	xã	181
6076	xa_quy_hoa	Xã Quý Hòa	xã	181
6079	xa_hong_phong	Xã Hồng Phong	xã	181
6082	xa_yen_lo	Xã Yên Lỗ	xã	181
6085	xa_thien_hoa	Xã Thiện Hòa	xã	181
6088	xa_quang_trung	Xã Quang Trung	xã	181
6091	xa_thien_thuat	Xã Thiện Thuật	xã	181
6094	xa_minh_khai	Xã Minh Khai	xã	181
6097	xa_thien_long	Xã Thiện Long	xã	181
6100	xa_hoang_van_thu	Xã Hoàng Văn Thụ	xã	181
6103	xa_hoa_binh	Xã Hòa Bình	xã	181
6106	xa_mong_an	Xã Mông Ân	xã	181
6109	xa_tan_hoa	Xã Tân Hòa	xã	181
6112	thi_tran_binh_gia	Thị trấn Bình Gia	thị trấn	181
6115	xa_hong_thai	Xã Hồng Thái	xã	181
6118	xa_binh_la	Xã Bình La	xã	181
6121	xa_tan_van	Xã Tân Văn	xã	181
6124	thi_tran_na_sam	Thị trấn Na Sầm	thị trấn	182
6127	xa_trung_khanh	Xã Trùng Khánh	xã	182
6133	xa_bac_la	Xã Bắc La	xã	182
6136	xa_thuy_hung	Xã Thụy Hùng	xã	182
6139	xa_bac_hung	Xã Bắc Hùng	xã	182
6142	xa_tan_tac	Xã Tân Tác	xã	182
6148	xa_thanh_long	Xã Thanh Long	xã	182
6151	xa_hoi_hoan	Xã Hội Hoan	xã	182
6154	xa_bac_viet	Xã Bắc Việt	xã	182
6157	xa_hoang_viet	Xã Hoàng Việt	xã	182
6160	xa_gia_mien	Xã Gia Miễn	xã	182
6163	xa_thanh_hoa	Xã Thành Hòa	xã	182
6166	xa_tan_thanh	Xã Tân Thanh	xã	182
6172	xa_tan_my	Xã Tân Mỹ	xã	182
6175	xa_hong_thai	Xã Hồng Thái	xã	182
6178	xa_hoang_van_thu	Xã Hoàng Văn Thụ	xã	182
6181	xa_nhac_ky	Xã Nhạc Kỳ	xã	182
6184	thi_tran_dong_dang	Thị trấn Đồng Đăng	thị trấn	183
6187	thi_tran_cao_loc	Thị trấn Cao Lộc	thị trấn	183
6190	xa_bao_lam	Xã Bảo Lâm	xã	183
6193	xa_thanh_loa	Xã Thanh Lòa	xã	183
6196	xa_cao_lau	Xã Cao Lâu	xã	183
6199	xa_thach_dan	Xã Thạch Đạn	xã	183
6202	xa_xuat_le	Xã Xuất Lễ	xã	183
6205	xa_hong_phong	Xã Hồng Phong	xã	183
6208	xa_thuy_hung	Xã Thụy Hùng	xã	183
6211	xa_loc_yen	Xã Lộc Yên	xã	183
6214	xa_phu_xa	Xã Phú Xá	xã	183
6217	xa_binh_trung	Xã Bình Trung	xã	183
6220	xa_hai_yen	Xã Hải Yến	xã	183
6223	xa_hoa_cu	Xã Hòa Cư	xã	183
6226	xa_hop_thanh	Xã Hợp Thành	xã	183
6232	xa_cong_son	Xã Công Sơn	xã	183
6235	xa_gia_cat	Xã Gia Cát	xã	183
6238	xa_mau_son	Xã Mẫu Sơn	xã	183
6241	xa_xuan_long	Xã Xuân Long	xã	183
6244	xa_tan_lien	Xã Tân Liên	xã	183
6247	xa_yen_trach	Xã Yên Trạch	xã	183
6250	xa_tan_thanh	Xã Tân Thành	xã	183
6253	thi_tran_van_quan	Thị trấn Văn Quan	thị trấn	184
6256	xa_tran_ninh	Xã Trấn Ninh	xã	184
6268	xa_lien_hoi	Xã Liên Hội	xã	184
6274	xa_hoa_binh	Xã Hòa Bình	xã	184
6277	xa_tu_xuyen	Xã Tú Xuyên	xã	184
6280	xa_diem_he	Xã Điềm He	xã	184
6283	xa_an_son	Xã An Sơn	xã	184
6286	xa_khanh_khe	Xã Khánh Khê	xã	184
6292	xa_luong_nang	Xã Lương Năng	xã	184
6295	xa_dong_giap	Xã Đồng Giáp	xã	184
6298	xa_binh_phuc	Xã Bình Phúc	xã	184
6301	xa_trang_cac	Xã Tràng Các	xã	184
6307	xa_tan_doan	Xã Tân Đoàn	xã	184
6313	xa_tri_le	Xã Tri Lễ	xã	184
6316	xa_trang_phai	Xã Tràng Phái	xã	184
6319	xa_yen_phuc	Xã Yên Phúc	xã	184
6322	xa_huu_le	Xã Hữu Lễ	xã	184
6325	thi_tran_bac_son	Thị trấn Bắc Sơn	thị trấn	185
6328	xa_long_dong	Xã Long Đống	xã	185
6331	xa_van_thuy	Xã Vạn Thủy	xã	185
6337	xa_dong_y	Xã Đồng ý	xã	185
6340	xa_tan_tri	Xã Tân Tri	xã	185
6343	xa_bac_quynh	Xã Bắc Quỳnh	xã	185
6349	xa_hung_vu	Xã Hưng Vũ	xã	185
6352	xa_tan_lap	Xã Tân Lập	xã	185
6355	xa_vu_son	Xã Vũ Sơn	xã	185
6358	xa_chieu_vu	Xã Chiêu Vũ	xã	185
6361	xa_tan_huong	Xã Tân Hương	xã	185
6364	xa_chien_thang	Xã Chiến Thắng	xã	185
6367	xa_vu_lang	Xã Vũ Lăng	xã	185
6370	xa_tran_yen	Xã Trấn Yên	xã	185
6373	xa_vu_le	Xã Vũ Lễ	xã	185
6376	xa_nhat_hoa	Xã Nhất Hòa	xã	185
6379	xa_tan_thanh	Xã Tân Thành	xã	185
6382	xa_nhat_tien	Xã Nhất Tiến	xã	185
6385	thi_tran_huu_lung	Thị trấn Hữu Lũng	thị trấn	186
6388	xa_huu_lien	Xã Hữu Liên	xã	186
6391	xa_yen_binh	Xã Yên Bình	xã	186
6394	xa_quyet_thang	Xã Quyết Thắng	xã	186
6397	xa_hoa_binh	Xã Hòa Bình	xã	186
6400	xa_yen_thinh	Xã Yên Thịnh	xã	186
6403	xa_yen_son	Xã Yên Sơn	xã	186
6406	xa_thien_tan	Xã Thiện Tân	xã	186
6412	xa_yen_vuong	Xã Yên Vượng	xã	186
6415	xa_minh_tien	Xã Minh Tiến	xã	186
6418	xa_nhat_tien	Xã Nhật Tiến	xã	186
6421	xa_thanh_son	Xã Thanh Sơn	xã	186
6424	xa_dong_tan	Xã Đồng Tân	xã	186
6427	xa_cai_kinh	Xã Cai Kinh	xã	186
6430	xa_hoa_lac	Xã Hòa Lạc	xã	186
6433	xa_van_nham	Xã Vân Nham	xã	186
6436	xa_dong_tien	Xã Đồng Tiến	xã	186
6442	xa_tan_thanh	Xã Tân Thành	xã	186
6445	xa_hoa_son	Xã Hòa Sơn	xã	186
6448	xa_minh_son	Xã Minh Sơn	xã	186
6451	xa_ho_son	Xã Hồ Sơn	xã	186
6454	xa_son_ha	Xã Sơn Hà	xã	186
6457	xa_minh_hoa	Xã Minh Hòa	xã	186
6460	xa_hoa_thang	Xã Hòa Thắng	xã	186
6463	thi_tran_dong_mo	Thị trấn Đồng Mỏ	thị trấn	187
6466	thi_tran_chi_lang	Thị trấn Chi Lăng	thị trấn	187
6469	xa_van_an	Xã Vân An	xã	187
6472	xa_van_thuy	Xã Vân Thủy	xã	187
6475	xa_gia_loc	Xã Gia Lộc	xã	187
6478	xa_bac_thuy	Xã Bắc Thủy	xã	187
6481	xa_chien_thang	Xã Chiến Thắng	xã	187
6484	xa_mai_sao	Xã Mai Sao	xã	187
6487	xa_bang_huu	Xã Bằng Hữu	xã	187
6490	xa_thuong_cuong	Xã Thượng Cường	xã	187
6493	xa_bang_mac	Xã Bằng Mạc	xã	187
6496	xa_nhan_ly	Xã Nhân Lý	xã	187
6499	xa_lam_son	Xã Lâm Sơn	xã	187
6502	xa_lien_son	Xã Liên Sơn	xã	187
6505	xa_van_linh	Xã Vạn Linh	xã	187
6508	xa_hoa_binh	Xã Hòa Bình	xã	187
6514	xa_huu_kien	Xã Hữu Kiên	xã	187
6517	xa_quan_son	Xã Quan Sơn	xã	187
6520	xa_y_tich	Xã Y Tịch	xã	187
6523	xa_chi_lang	Xã Chi Lăng	xã	187
6526	thi_tran_na_duong	Thị trấn Na Dương	thị trấn	188
6529	thi_tran_loc_binh	Thị trấn Lộc Bình	thị trấn	188
6532	xa_mau_son	Xã Mẫu Sơn	xã	188
6541	xa_yen_khoai	Xã Yên Khoái	xã	188
6544	xa_khanh_xuan	Xã Khánh Xuân	xã	188
6547	xa_tu_mich	Xã Tú Mịch	xã	188
6550	xa_huu_khanh	Xã Hữu Khánh	xã	188
6553	xa_dong_buc	Xã Đồng Bục	xã	188
6559	xa_tam_gia	Xã Tam Gia	xã	188
6562	xa_tu_doan	Xã Tú Đoạn	xã	188
6565	xa_khuat_xa	Xã Khuất Xá	xã	188
6574	xa_tinh_bac	Xã Tĩnh Bắc	xã	188
6577	xa_thong_nhat	Xã Thống Nhất	xã	188
6589	xa_san_vien	Xã Sàn Viên	xã	188
6592	xa_dong_quan	Xã Đông Quan	xã	188
6595	xa_minh_hiep	Xã Minh Hiệp	xã	188
6598	xa_huu_lan	Xã Hữu Lân	xã	188
6601	xa_loi_bac	Xã Lợi Bác	xã	188
6604	xa_nam_quan	Xã Nam Quan	xã	188
6607	xa_xuan_duong	Xã Xuân Dương	xã	188
6610	xa_ai_quoc	Xã Ái Quốc	xã	188
6613	thi_tran_dinh_lap	Thị trấn Đình Lập	thị trấn	189
6616	thi_tran_nt_thai_binh	Thị trấn NT Thái Bình	thị trấn	189
6619	xa_bac_xa	Xã Bắc Xa	xã	189
6622	xa_binh_xa	Xã Bính Xá	xã	189
6625	xa_kien_moc	Xã Kiên Mộc	xã	189
6628	xa_dinh_lap	Xã Đình Lập	xã	189
6631	xa_thai_binh	Xã Thái Bình	xã	189
6634	xa_cuong_loi	Xã Cường Lợi	xã	189
6637	xa_chau_son	Xã Châu Sơn	xã	189
6640	xa_lam_ca	Xã Lâm Ca	xã	189
6643	xa_dong_thang	Xã Đồng Thắng	xã	189
6646	xa_bac_lang	Xã Bắc Lãng	xã	189
6649	phuong_ha_khanh	Phường Hà Khánh	phường	193
6652	phuong_ha_phong	Phường Hà Phong	phường	193
6655	phuong_ha_khau	Phường Hà Khẩu	phường	193
6658	phuong_cao_xanh	Phường Cao Xanh	phường	193
6661	phuong_gieng_day	Phường Giếng Đáy	phường	193
6664	phuong_ha_tu	Phường Hà Tu	phường	193
6667	phuong_ha_trung	Phường Hà Trung	phường	193
6670	phuong_ha_lam	Phường Hà Lầm	phường	193
6673	phuong_bai_chay	Phường Bãi Cháy	phường	193
6676	phuong_cao_thang	Phường Cao Thắng	phường	193
6679	phuong_hung_thang	Phường Hùng Thắng	phường	193
6682	phuong_yet_kieu	Phường Yết Kiêu	phường	193
6685	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	193
6688	phuong_hong_hai	Phường Hồng Hải	phường	193
6691	phuong_hong_gai	Phường Hồng Gai	phường	193
6694	phuong_bach_dang	Phường Bạch Đằng	phường	193
6697	phuong_hong_ha	Phường Hồng Hà	phường	193
6700	phuong_tuan_chau	Phường Tuần Châu	phường	193
6703	phuong_viet_hung	Phường Việt Hưng	phường	193
6706	phuong_dai_yen	Phường Đại Yên	phường	193
7030	phuong_hoanh_bo	Phường Hoành Bồ	phường	193
7033	xa_ky_thuong	Xã Kỳ Thượng	xã	193
7036	xa_dong_son	Xã Đồng Sơn	xã	193
7039	xa_tan_dan	Xã Tân Dân	xã	193
7042	xa_dong_lam	Xã Đồng Lâm	xã	193
7045	xa_hoa_binh	Xã Hòa Bình	xã	193
7048	xa_vu_oai	Xã Vũ Oai	xã	193
7051	xa_dan_chu	Xã Dân Chủ	xã	193
7054	xa_quang_la	Xã Quảng La	xã	193
7057	xa_bang_ca	Xã Bằng Cả	xã	193
7060	xa_thong_nhat	Xã Thống Nhất	xã	193
7063	xa_son_duong	Xã Sơn Dương	xã	193
7066	xa_le_loi	Xã Lê Lợi	xã	193
6709	phuong_ka_long	Phường Ka Long	phường	194
6712	phuong_tran_phu	Phường Trần Phú	phường	194
6715	phuong_ninh_duong	Phường Ninh Dương	phường	194
6718	phuong_hoa_lac	Phường Hoà Lạc	phường	194
6721	phuong_tra_co	Phường Trà Cổ	phường	194
6724	xa_hai_son	Xã Hải Sơn	xã	194
6727	xa_bac_son	Xã Bắc Sơn	xã	194
6730	xa_hai_dong	Xã Hải Đông	xã	194
6733	xa_hai_tien	Xã Hải Tiến	xã	194
6736	phuong_hai_yen	Phường Hải Yên	phường	194
6739	xa_quang_nghia	Xã Quảng Nghĩa	xã	194
6742	phuong_hai_hoa	Phường Hải Hoà	phường	194
6745	xa_hai_xuan	Xã Hải Xuân	xã	194
6748	xa_van_ninh	Xã Vạn Ninh	xã	194
6751	phuong_binh_ngoc	Phường Bình Ngọc	phường	194
6754	xa_vinh_trung	Xã Vĩnh Trung	xã	194
6757	xa_vinh_thuc	Xã Vĩnh Thực	xã	194
6760	phuong_mong_duong	Phường Mông Dương	phường	195
6763	phuong_cua_ong	Phường Cửa Ông	phường	195
6766	phuong_cam_son	Phường Cẩm Sơn	phường	195
6769	phuong_cam_dong	Phường Cẩm Đông	phường	195
6772	phuong_cam_phu	Phường Cẩm Phú	phường	195
6775	phuong_cam_tay	Phường Cẩm Tây	phường	195
6778	phuong_quang_hanh	Phường Quang Hanh	phường	195
6781	phuong_cam_thinh	Phường Cẩm Thịnh	phường	195
6784	phuong_cam_thuy	Phường Cẩm Thủy	phường	195
6787	phuong_cam_thach	Phường Cẩm Thạch	phường	195
6790	phuong_cam_thanh	Phường Cẩm Thành	phường	195
6793	phuong_cam_trung	Phường Cẩm Trung	phường	195
6796	phuong_cam_binh	Phường Cẩm Bình	phường	195
6799	xa_cong_hoa	Xã Cộng Hòa	xã	195
6802	xa_cam_hai	Xã Cẩm Hải	xã	195
6805	xa_duong_huy	Xã Dương Huy	xã	195
6808	phuong_vang_danh	Phường Vàng Danh	phường	196
6811	phuong_thanh_son	Phường Thanh Sơn	phường	196
6814	phuong_bac_son	Phường Bắc Sơn	phường	196
6817	phuong_quang_trung	Phường Quang Trung	phường	196
6820	phuong_trung_vuong	Phường Trưng Vương	phường	196
6823	phuong_nam_khe	Phường Nam Khê	phường	196
6826	phuong_yen_thanh	Phường Yên Thanh	phường	196
6829	xa_thuong_yen_cong	Xã Thượng Yên Công	xã	196
6832	phuong_phuong_dong	Phường Phương Đông	phường	196
6835	phuong_phuong_nam	Phường Phương Nam	phường	196
6838	thi_tran_binh_lieu	Thị trấn Bình Liêu	thị trấn	198
6841	xa_hoanh_mo	Xã Hoành Mô	xã	198
6844	xa_dong_tam	Xã Đồng Tâm	xã	198
6847	xa_dong_van	Xã Đồng Văn	xã	198
6853	xa_vo_ngai	Xã Vô Ngại	xã	198
6856	xa_luc_hon	Xã Lục Hồn	xã	198
6859	xa_huc_dong	Xã Húc Động	xã	198
6862	thi_tran_tien_yen	Thị trấn Tiên Yên	thị trấn	199
6865	xa_ha_lau	Xã Hà Lâu	xã	199
6868	xa_dai_duc	Xã Đại Dực	xã	199
6871	xa_phong_du	Xã Phong Dụ	xã	199
6874	xa_dien_xa	Xã Điền Xá	xã	199
6877	xa_dong_ngu	Xã Đông Ngũ	xã	199
6880	xa_yen_than	Xã Yên Than	xã	199
6883	xa_dong_hai	Xã Đông Hải	xã	199
6886	xa_hai_lang	Xã Hải Lạng	xã	199
6889	xa_tien_lang	Xã Tiên Lãng	xã	199
6892	xa_dong_rui	Xã Đồng Rui	xã	199
6895	thi_tran_dam_ha	Thị trấn Đầm Hà	thị trấn	200
6898	xa_quang_lam	Xã Quảng Lâm	xã	200
6901	xa_quang_an	Xã Quảng An	xã	200
6904	xa_tan_binh	Xã Tân Bình	xã	200
6910	xa_duc_yen	Xã Dực Yên	xã	200
6913	xa_quang_tan	Xã Quảng Tân	xã	200
6916	xa_dam_ha	Xã Đầm Hà	xã	200
6917	xa_tan_lap	Xã Tân Lập	xã	200
6919	xa_dai_binh	Xã Đại Bình	xã	200
6922	thi_tran_quang_ha	Thị trấn Quảng Hà	thị trấn	201
6925	xa_quang_duc	Xã Quảng Đức	xã	201
6928	xa_quang_son	Xã Quảng Sơn	xã	201
6931	xa_quang_thanh	Xã Quảng Thành	xã	201
6937	xa_quang_thinh	Xã Quảng Thịnh	xã	201
6940	xa_quang_minh	Xã Quảng Minh	xã	201
6943	xa_quang_chinh	Xã Quảng Chính	xã	201
6946	xa_quang_long	Xã Quảng Long	xã	201
6949	xa_duong_hoa	Xã Đường Hoa	xã	201
6952	xa_quang_phong	Xã Quảng Phong	xã	201
6967	xa_cai_chien	Xã Cái Chiên	xã	201
6970	thi_tran_ba_che	Thị trấn Ba Chẽ	thị trấn	202
6973	xa_thanh_son	Xã Thanh Sơn	xã	202
6976	xa_thanh_lam	Xã Thanh Lâm	xã	202
6979	xa_dap_thanh	Xã Đạp Thanh	xã	202
6982	xa_nam_son	Xã Nam Sơn	xã	202
6985	xa_luong_mong	Xã Lương Mông	xã	202
6988	xa_don_dac	Xã Đồn Đạc	xã	202
6991	xa_minh_cam	Xã Minh Cầm	xã	202
6994	thi_tran_cai_rong	Thị trấn Cái Rồng	thị trấn	203
6997	xa_dai_xuyen	Xã Đài Xuyên	xã	203
7000	xa_binh_dan	Xã Bình Dân	xã	203
7003	xa_van_yen	Xã Vạn Yên	xã	203
7006	xa_minh_chau	Xã Minh Châu	xã	203
7009	xa_doan_ket	Xã Đoàn Kết	xã	203
7012	xa_ha_long	Xã Hạ Long	xã	203
7015	xa_dong_xa	Xã Đông Xá	xã	203
7018	xa_ban_sen	Xã Bản Sen	xã	203
7021	xa_thang_loi	Xã Thắng Lợi	xã	203
7024	xa_quan_lan	Xã Quan Lạn	xã	203
7027	xa_ngoc_vung	Xã Ngọc Vừng	xã	203
7069	phuong_mao_khe	Phường Mạo Khê	phường	205
7072	phuong_dong_trieu	Phường Đông Triều	phường	205
7075	xa_an_sinh	Xã An Sinh	xã	205
7078	xa_trang_luong	Xã Tràng Lương	xã	205
7081	xa_binh_khe	Xã Bình Khê	xã	205
7084	xa_viet_dan	Xã Việt Dân	xã	205
7087	xa_tan_viet	Xã Tân Việt	xã	205
7090	xa_binh_duong	Xã Bình Dương	xã	205
7093	phuong_duc_chinh	Phường Đức Chính	phường	205
7096	phuong_trang_an	Phường Tràng An	phường	205
7099	xa_nguyen_hue	Xã Nguyễn Huệ	xã	205
7102	xa_thuy_an	Xã Thủy An	xã	205
7105	phuong_xuan_son	Phường Xuân Sơn	phường	205
7108	xa_hong_thai_tay	Xã Hồng Thái Tây	xã	205
7111	xa_hong_thai_dong	Xã Hồng Thái Đông	xã	205
7114	phuong_hoang_que	Phường Hoàng Quế	phường	205
7117	phuong_yen_tho	Phường Yên Thọ	phường	205
7120	phuong_hong_phong	Phường Hồng Phong	phường	205
7123	phuong_kim_son	Phường Kim Sơn	phường	205
7126	phuong_hung_dao	Phường Hưng Đạo	phường	205
7129	xa_yen_duc	Xã Yên Đức	xã	205
7132	phuong_quang_yen	Phường Quảng Yên	phường	206
7135	phuong_dong_mai	Phường Đông Mai	phường	206
7138	phuong_minh_thanh	Phường Minh Thành	phường	206
7144	xa_song_khoai	Xã Sông Khoai	xã	206
7147	xa_hiep_hoa	Xã Hiệp Hòa	xã	206
7150	phuong_cong_hoa	Phường Cộng Hòa	phường	206
7153	xa_tien_an	Xã Tiền An	xã	206
7156	xa_hoang_tan	Xã Hoàng Tân	xã	206
7159	phuong_tan_an	Phường Tân An	phường	206
7162	phuong_yen_giang	Phường Yên Giang	phường	206
7165	phuong_nam_hoa	Phường Nam Hoà	phường	206
7168	phuong_ha_an	Phường Hà An	phường	206
7171	xa_cam_la	Xã Cẩm La	xã	206
7174	phuong_phong_hai	Phường Phong Hải	phường	206
7177	phuong_yen_hai	Phường Yên Hải	phường	206
7180	xa_lien_hoa	Xã Liên Hòa	xã	206
7183	phuong_phong_coc	Phường Phong Cốc	phường	206
7186	xa_lien_vi	Xã Liên Vị	xã	206
7189	xa_tien_phong	Xã Tiền Phong	xã	206
7192	thi_tran_co_to	Thị trấn Cô Tô	thị trấn	207
7195	xa_dong_tien	Xã Đồng Tiến	xã	207
7198	xa_thanh_lan	Xã Thanh Lân	xã	207
7201	phuong_tho_xuong	Phường Thọ Xương	phường	213
7204	phuong_tran_nguyen_han	Phường Trần Nguyên Hãn	phường	213
7207	phuong_ngo_quyen	Phường Ngô Quyền	phường	213
7210	phuong_hoang_van_thu	Phường Hoàng Văn Thụ	phường	213
7213	phuong_tran_phu	Phường Trần Phú	phường	213
7216	phuong_my_do	Phường Mỹ Độ	phường	213
7219	phuong_le_loi	Phường Lê Lợi	phường	213
7222	xa_song_mai	Xã Song Mai	xã	213
7225	phuong_xuong_giang	Phường Xương Giang	phường	213
7228	phuong_da_mai	Phường Đa Mai	phường	213
7231	phuong_dinh_ke	Phường Dĩnh Kế	phường	213
7441	xa_dinh_tri	Xã Dĩnh Trì	xã	213
7687	xa_tan_my	Xã Tân Mỹ	xã	213
7696	xa_dong_son	Xã Đồng Sơn	xã	213
7699	xa_tan_tien	Xã Tân Tiến	xã	213
7705	xa_song_khe	Xã Song Khê	xã	213
7243	xa_dong_tien	Xã Đồng Tiến	xã	215
7246	xa_canh_nau	Xã Canh Nậu	xã	215
7249	xa_xuan_luong	Xã Xuân Lương	xã	215
7252	xa_tam_tien	Xã Tam Tiến	xã	215
7255	xa_dong_vuong	Xã Đồng Vương	xã	215
7258	xa_dong_huu	Xã Đồng Hưu	xã	215
7260	xa_dong_tam	Xã Đồng Tâm	xã	215
7261	xa_tam_hiep	Xã Tam Hiệp	xã	215
7264	xa_tien_thang	Xã Tiến Thắng	xã	215
7267	xa_hong_ky	Xã Hồng Kỳ	xã	215
7270	xa_dong_lac	Xã Đồng Lạc	xã	215
7273	xa_dong_son	Xã Đông Sơn	xã	215
7276	xa_tan_hiep	Xã Tân Hiệp	xã	215
7279	xa_huong_vi	Xã Hương Vĩ	xã	215
7282	xa_dong_ky	Xã Đồng Kỳ	xã	215
7285	xa_an_thuong	Xã An Thượng	xã	215
7288	thi_tran_phon_xuong	Thị trấn Phồn Xương	thị trấn	215
7291	xa_tan_soi	Xã Tân Sỏi	xã	215
7294	thi_tran_bo_ha	Thị trấn Bố Hạ	thị trấn	215
7303	xa_lan_gioi	Xã Lan Giới	xã	216
7306	thi_tran_nha_nam	Thị trấn Nhã Nam	thị trấn	216
7309	xa_tan_trung	Xã Tân Trung	xã	216
7312	xa_dai_hoa	Xã Đại Hóa	xã	216
7315	xa_quang_tien	Xã Quang Tiến	xã	216
7318	xa_phuc_son	Xã Phúc Sơn	xã	216
7321	xa_an_duong	Xã An Dương	xã	216
7324	xa_phuc_hoa	Xã Phúc Hòa	xã	216
7327	xa_lien_son	Xã Liên Sơn	xã	216
7330	xa_hop_duc	Xã Hợp Đức	xã	216
7333	xa_lam_cot	Xã Lam Cốt	xã	216
7336	xa_cao_xa	Xã Cao Xá	xã	216
7339	thi_tran_cao_thuong	Thị trấn Cao Thượng	thị trấn	216
7342	xa_viet_ngoc	Xã Việt Ngọc	xã	216
7345	xa_song_van	Xã Song Vân	xã	216
7348	xa_ngoc_chau	Xã Ngọc Châu	xã	216
7351	xa_ngoc_van	Xã Ngọc Vân	xã	216
7354	xa_viet_lap	Xã Việt Lập	xã	216
7357	xa_lien_chung	Xã Liên Chung	xã	216
7360	xa_ngoc_thien	Xã Ngọc Thiện	xã	216
7363	xa_ngoc_ly	Xã Ngọc Lý	xã	216
7366	xa_que_nham	Xã Quế Nham	xã	216
7375	thi_tran_voi	Thị trấn Vôi	thị trấn	217
7378	xa_nghia_hoa	Xã Nghĩa Hòa	xã	217
7381	xa_nghia_hung	Xã Nghĩa Hưng	xã	217
7384	xa_quang_thinh	Xã Quang Thịnh	xã	217
7387	xa_huong_son	Xã Hương Sơn	xã	217
7390	xa_dao_my	Xã Đào Mỹ	xã	217
7393	xa_tien_luc	Xã Tiên Lục	xã	217
7396	xa_an_ha	Xã An Hà	xã	217
7399	thi_tran_kep	Thị trấn Kép	thị trấn	217
7402	xa_my_ha	Xã Mỹ Hà	xã	217
7405	xa_huong_lac	Xã Hương Lạc	xã	217
7408	xa_duong_duc	Xã Dương Đức	xã	217
7411	xa_tan_thanh	Xã Tân Thanh	xã	217
7414	xa_yen_my	Xã Yên Mỹ	xã	217
7417	xa_tan_hung	Xã Tân Hưng	xã	217
7420	xa_my_thai	Xã Mỹ Thái	xã	217
7426	xa_xuong_lam	Xã Xương Lâm	xã	217
7429	xa_xuan_huong	Xã Xuân Hương	xã	217
7432	xa_tan_dinh	Xã Tân Dĩnh	xã	217
7435	xa_dai_lam	Xã Đại Lâm	xã	217
7438	xa_thai_dao	Xã Thái Đào	xã	217
7444	thi_tran_doi_ngo	Thị trấn Đồi Ngô	thị trấn	218
7450	xa_dong_hung	Xã Đông Hưng	xã	218
7453	xa_dong_phu	Xã Đông Phú	xã	218
7456	xa_tam_di	Xã Tam Dị	xã	218
7459	xa_bao_son	Xã Bảo Sơn	xã	218
7462	xa_bao_dai	Xã Bảo Đài	xã	218
7465	xa_thanh_lam	Xã Thanh Lâm	xã	218
7468	xa_tien_nha	Xã Tiên Nha	xã	218
7471	xa_truong_giang	Xã Trường Giang	xã	218
7477	xa_phuong_son	Xã Phương Sơn	xã	218
7480	xa_chu_dien	Xã Chu Điện	xã	218
7483	xa_cuong_son	Xã Cương Sơn	xã	218
7486	xa_nghia_phuong	Xã Nghĩa Phương	xã	218
7489	xa_vo_tranh	Xã Vô Tranh	xã	218
7492	xa_binh_son	Xã Bình Sơn	xã	218
7495	xa_lan_mau	Xã Lan Mẫu	xã	218
7498	xa_yen_son	Xã Yên Sơn	xã	218
7501	xa_kham_lang	Xã Khám Lạng	xã	218
7504	xa_huyen_son	Xã Huyền Sơn	xã	218
7507	xa_truong_son	Xã Trường Sơn	xã	218
7510	xa_luc_son	Xã Lục Sơn	xã	218
7513	xa_bac_lung	Xã Bắc Lũng	xã	218
7516	xa_vu_xa	Xã Vũ Xá	xã	218
7519	xa_cam_ly	Xã Cẩm Lý	xã	218
7522	xa_dan_hoi	Xã Đan Hội	xã	218
7525	thi_tran_chu	Thị trấn Chũ	thị trấn	219
7528	xa_cam_son	Xã Cấm Sơn	xã	219
7531	xa_tan_son	Xã Tân Sơn	xã	219
7534	xa_phong_minh	Xã Phong Minh	xã	219
7537	xa_phong_van	Xã Phong Vân	xã	219
7540	xa_xa_ly	Xã Xa Lý	xã	219
7543	xa_ho_dap	Xã Hộ Đáp	xã	219
7546	xa_son_hai	Xã Sơn Hải	xã	219
7549	xa_thanh_hai	Xã Thanh Hải	xã	219
7552	xa_kien_lao	Xã Kiên Lao	xã	219
7555	xa_bien_son	Xã Biên Sơn	xã	219
7558	xa_kien_thanh	Xã Kiên Thành	xã	219
7561	xa_hong_giang	Xã Hồng Giang	xã	219
7564	xa_kim_son	Xã Kim Sơn	xã	219
7567	xa_tan_hoa	Xã Tân Hoa	xã	219
7570	xa_giap_son	Xã Giáp Sơn	xã	219
7573	xa_bien_dong	Xã Biển Động	xã	219
7576	xa_quy_son	Xã Quý Sơn	xã	219
7579	xa_tru_huu	Xã Trù Hựu	xã	219
7582	xa_phi_dien	Xã Phì Điền	xã	219
7588	xa_tan_quang	Xã Tân Quang	xã	219
7591	xa_dong_coc	Xã Đồng Cốc	xã	219
7594	xa_tan_lap	Xã Tân Lập	xã	219
7597	xa_phu_nhuan	Xã Phú Nhuận	xã	219
7600	xa_my_an	Xã Mỹ An	xã	219
7603	xa_nam_duong	Xã Nam Dương	xã	219
7606	xa_tan_moc	Xã Tân Mộc	xã	219
7609	xa_deo_gia	Xã Đèo Gia	xã	219
7612	xa_phuong_son	Xã Phượng Sơn	xã	219
7615	thi_tran_an_chau	Thị trấn An Châu	thị trấn	220
7616	thi_tran_tay_yen_tu	Thị trấn Tây Yên Tử	thị trấn	220
7621	xa_van_son	Xã Vân Sơn	xã	220
7624	xa_huu_san	Xã Hữu Sản	xã	220
7627	xa_dai_son	Xã Đại Sơn	xã	220
7630	xa_phuc_son	Xã Phúc Sơn	xã	220
7636	xa_giao_liem	Xã Giáo Liêm	xã	220
7642	xa_cam_dan	Xã Cẩm Đàn	xã	220
7645	xa_an_lac	Xã An Lạc	xã	220
7648	xa_vinh_an	Xã Vĩnh An	xã	220
7651	xa_yen_dinh	Xã Yên Định	xã	220
7654	xa_le_vien	Xã Lệ Viễn	xã	220
7660	xa_an_ba	Xã An Bá	xã	220
7663	xa_tuan_dao	Xã Tuấn Đạo	xã	220
7666	xa_duong_huu	Xã Dương Hưu	xã	220
7672	xa_long_son	Xã Long Sơn	xã	220
7678	xa_thanh_luan	Xã Thanh Luận	xã	220
7681	thi_tran_nham_bien	Thị trấn Nham Biền	thị trấn	221
7682	thi_tran_tan_an	Thị trấn Tân An	thị trấn	221
7684	xa_lao_ho	Xã Lão Hộ	xã	221
7690	xa_huong_gian	Xã Hương Gián	xã	221
7702	xa_quynh_son	Xã Quỳnh Sơn	xã	221
7708	xa_noi_hoang	Xã Nội Hoàng	xã	221
7711	xa_tien_phong	Xã Tiền Phong	xã	221
7714	xa_xuan_phu	Xã Xuân Phú	xã	221
7717	xa_tan_lieu	Xã Tân Liễu	xã	221
7720	xa_tri_yen	Xã Trí Yên	xã	221
7723	xa_lang_son	Xã Lãng Sơn	xã	221
7726	xa_yen_lu	Xã Yên Lư	xã	221
7729	xa_tien_dung	Xã Tiến Dũng	xã	221
7735	xa_duc_giang	Xã Đức Giang	xã	221
7738	xa_canh_thuy	Xã Cảnh Thụy	xã	221
7741	xa_tu_mai	Xã Tư Mại	xã	221
7747	xa_dong_viet	Xã Đồng Việt	xã	221
7750	xa_dong_phuc	Xã Đồng Phúc	xã	221
7759	xa_thuong_lan	Xã Thượng Lan	xã	222
7762	xa_viet_tien	Xã Việt Tiến	xã	222
7765	xa_nghia_trung	Xã Nghĩa Trung	xã	222
7768	xa_minh_duc	Xã Minh Đức	xã	222
7771	xa_huong_mai	Xã Hương Mai	xã	222
7774	xa_tu_lan	Xã Tự Lạn	xã	222
7777	thi_tran_bich_dong	Thị trấn Bích Động	thị trấn	222
7780	xa_trung_son	Xã Trung Sơn	xã	222
7783	xa_hong_thai	Xã Hồng Thái	xã	222
7786	xa_tien_son	Xã Tiên Sơn	xã	222
7789	xa_tang_tien	Xã Tăng Tiến	xã	222
7792	xa_quang_minh	Xã Quảng Minh	xã	222
7795	thi_tran_nenh	Thị trấn Nếnh	thị trấn	222
7798	xa_ninh_son	Xã Ninh Sơn	xã	222
7801	xa_van_trung	Xã Vân Trung	xã	222
7804	xa_van_ha	Xã Vân Hà	xã	222
7807	xa_quang_chau	Xã Quang Châu	xã	222
7813	xa_dong_tan	Xã Đồng Tân	xã	223
7816	xa_thanh_van	Xã Thanh Vân	xã	223
7819	xa_hoang_luong	Xã Hoàng Lương	xã	223
7822	xa_hoang_van	Xã Hoàng Vân	xã	223
7825	xa_hoang_thanh	Xã Hoàng Thanh	xã	223
7828	xa_hoang_an	Xã Hoàng An	xã	223
7831	xa_ngoc_son	Xã Ngọc Sơn	xã	223
7834	xa_thai_son	Xã Thái Sơn	xã	223
7837	xa_hoa_son	Xã Hòa Sơn	xã	223
7840	thi_tran_thang	Thị trấn Thắng	thị trấn	223
7843	xa_quang_minh	Xã Quang Minh	xã	223
7846	xa_luong_phong	Xã Lương Phong	xã	223
7849	xa_hung_son	Xã Hùng Sơn	xã	223
7852	xa_dai_thanh	Xã Đại Thành	xã	223
7855	xa_thuong_thang	Xã Thường Thắng	xã	223
7858	xa_hop_thinh	Xã Hợp Thịnh	xã	223
7861	xa_danh_thang	Xã Danh Thắng	xã	223
7864	xa_mai_trung	Xã Mai Trung	xã	223
7867	xa_doan_bai	Xã Đoan Bái	xã	223
7870	xa_bac_ly	Xã Bắc Lý	xã	223
7873	xa_xuan_cam	Xã Xuân Cẩm	xã	223
7876	xa_huong_lam	Xã Hương Lâm	xã	223
7879	xa_dong_lo	Xã Đông Lỗ	xã	223
7882	xa_chau_minh	Xã Châu Minh	xã	223
7885	xa_mai_dinh	Xã Mai Đình	xã	223
7888	phuong_duu_lau	Phường Dữu Lâu	phường	227
7891	phuong_van_co	Phường Vân Cơ	phường	227
7894	phuong_nong_trang	Phường Nông Trang	phường	227
7897	phuong_tan_dan	Phường Tân Dân	phường	227
7900	phuong_gia_cam	Phường Gia Cẩm	phường	227
7903	phuong_tien_cat	Phường Tiên Cát	phường	227
7906	phuong_tho_son	Phường Thọ Sơn	phường	227
7909	phuong_thanh_mieu	Phường Thanh Miếu	phường	227
7912	phuong_bach_hac	Phường Bạch Hạc	phường	227
7915	phuong_ben_got	Phường Bến Gót	phường	227
7918	phuong_van_phu	Phường Vân Phú	phường	227
7921	xa_phuong_lau	Xã Phượng Lâu	xã	227
7924	xa_thuy_van	Xã Thụy Vân	xã	227
7927	phuong_minh_phuong	Phường Minh Phương	phường	227
7930	xa_trung_vuong	Xã Trưng Vương	xã	227
7933	phuong_minh_nong	Phường Minh Nông	phường	227
7936	xa_song_lo	Xã Sông Lô	xã	227
8281	xa_kim_duc	Xã Kim Đức	xã	227
8287	xa_hung_lo	Xã Hùng Lô	xã	227
8503	xa_hy_cuong	Xã Hy Cương	xã	227
8506	xa_chu_hoa	Xã Chu Hóa	xã	227
8515	xa_thanh_dinh	Xã Thanh Đình	xã	227
7942	phuong_hung_vuong	Phường Hùng Vương	phường	228
7945	phuong_phong_chau	Phường Phong Châu	phường	228
7948	phuong_au_co	Phường Âu Cơ	phường	228
7951	xa_ha_loc	Xã Hà Lộc	xã	228
7954	xa_phu_ho	Xã Phú Hộ	xã	228
7957	xa_van_lung	Xã Văn Lung	xã	228
7960	xa_thanh_minh	Xã Thanh Minh	xã	228
7963	xa_ha_thach	Xã Hà Thạch	xã	228
7966	phuong_thanh_vinh	Phường Thanh Vinh	phường	228
7969	thi_tran_doan_hung	Thị trấn Đoan Hùng	thị trấn	230
7975	xa_hung_xuyen	Xã Hùng Xuyên	xã	230
7981	xa_bang_luan	Xã Bằng Luân	xã	230
7984	xa_van_du	Xã Vân Du	xã	230
7987	xa_phu_lam	Xã Phú Lâm	xã	230
7993	xa_minh_luong	Xã Minh Lương	xã	230
7996	xa_bang_doan	Xã Bằng Doãn	xã	230
7999	xa_chi_dam	Xã Chí Đám	xã	230
8005	xa_phuc_lai	Xã Phúc Lai	xã	230
8008	xa_ngoc_quan	Xã Ngọc Quan	xã	230
8014	xa_hop_nhat	Xã Hợp Nhất	xã	230
8017	xa_soc_dang	Xã Sóc Đăng	xã	230
8023	xa_tay_coc	Xã Tây Cốc	xã	230
8026	xa_yen_kien	Xã Yên Kiện	xã	230
8029	xa_hung_long	Xã Hùng Long	xã	230
8032	xa_vu_quang	Xã Vụ Quang	xã	230
8035	xa_van_don	Xã Vân Đồn	xã	230
8038	xa_tieu_son	Xã Tiêu Sơn	xã	230
8041	xa_minh_tien	Xã Minh Tiến	xã	230
8044	xa_minh_phu	Xã Minh Phú	xã	230
8047	xa_chan_mong	Xã Chân Mộng	xã	230
8050	xa_ca_dinh	Xã Ca Đình	xã	230
8053	thi_tran_ha_hoa	Thị trấn Hạ Hoà	thị trấn	231
8056	xa_dai_pham	Xã Đại Phạm	xã	231
8062	xa_dan_thuong	Xã Đan Thượng	xã	231
8065	xa_ha_luong	Xã Hà Lương	xã	231
8071	xa_tu_hiep	Xã Tứ Hiệp	xã	231
8080	xa_hien_luong	Xã Hiền Lương	xã	231
8089	xa_phuong_vien	Xã Phương Viên	xã	231
8092	xa_gia_dien	Xã Gia Điền	xã	231
8095	xa_am_ha	Xã Ấm Hạ	xã	231
8104	xa_huong_xa	Xã Hương Xạ	xã	231
8110	xa_xuan_ang	Xã Xuân Áng	xã	231
8113	xa_yen_ky	Xã Yên Kỳ	xã	231
8119	xa_minh_hac	Xã Minh Hạc	xã	231
8122	xa_lang_son	Xã Lang Sơn	xã	231
8125	xa_bang_gia	Xã Bằng Giã	xã	231
8128	xa_yen_luat	Xã Yên Luật	xã	231
8131	xa_vo_tranh	Xã Vô Tranh	xã	231
8134	xa_van_lang	Xã Văn Lang	xã	231
8140	xa_minh_coi	Xã Minh Côi	xã	231
8143	xa_vinh_chan	Xã Vĩnh Chân	xã	231
8152	thi_tran_thanh_ba	Thị trấn Thanh Ba	thị trấn	232
8156	xa_van_linh	Xã Vân Lĩnh	xã	232
8158	xa_dong_linh	Xã Đông Lĩnh	xã	232
8161	xa_dai_an	Xã Đại An	xã	232
8164	xa_hanh_cu	Xã Hanh Cù	xã	232
8170	xa_dong_xuan	Xã Đồng Xuân	xã	232
8173	xa_quang_yen	Xã Quảng Yên	xã	232
8179	xa_ninh_dan	Xã Ninh Dân	xã	232
8194	xa_vo_lao	Xã Võ Lao	xã	232
8197	xa_khai_xuan	Xã Khải Xuân	xã	232
8200	xa_man_lan	Xã Mạn Lạn	xã	232
8203	xa_hoang_cuong	Xã Hoàng Cương	xã	232
8206	xa_chi_tien	Xã Chí Tiên	xã	232
8209	xa_dong_thanh	Xã Đông Thành	xã	232
8215	xa_son_cuong	Xã Sơn Cương	xã	232
8218	xa_thanh_ha	Xã Thanh Hà	xã	232
8221	xa_do_son	Xã Đỗ Sơn	xã	232
8224	xa_do_xuyen	Xã Đỗ Xuyên	xã	232
8227	xa_luong_lo	Xã Lương Lỗ	xã	232
8230	thi_tran_phong_chau	Thị trấn Phong Châu	thị trấn	233
8233	xa_phu_my	Xã Phú Mỹ	xã	233
8234	xa_le_my	Xã Lệ Mỹ	xã	233
8236	xa_lien_hoa	Xã Liên Hoa	xã	233
8239	xa_tram_than	Xã Trạm Thản	xã	233
8242	xa_tri_quan	Xã Trị Quận	xã	233
8245	xa_trung_giap	Xã Trung Giáp	xã	233
8248	xa_tien_phu	Xã Tiên Phú	xã	233
8251	xa_ha_giap	Xã Hạ Giáp	xã	233
8254	xa_bao_thanh	Xã Bảo Thanh	xã	233
8257	xa_phu_loc	Xã Phú Lộc	xã	233
8260	xa_gia_thanh	Xã Gia Thanh	xã	233
8263	xa_tien_du	Xã Tiên Du	xã	233
8266	xa_phu_nham	Xã Phú Nham	xã	233
8272	xa_an_dao	Xã An Đạo	xã	233
8275	xa_binh_phu	Xã Bình Phú	xã	233
8278	xa_phu_ninh	Xã Phù Ninh	xã	233
8290	thi_tran_yen_lap	Thị trấn Yên Lập	thị trấn	234
8293	xa_my_lung	Xã Mỹ Lung	xã	234
8296	xa_my_luong	Xã Mỹ Lương	xã	234
8299	xa_luong_son	Xã Lương Sơn	xã	234
8302	xa_xuan_an	Xã Xuân An	xã	234
8305	xa_xuan_vien	Xã Xuân Viên	xã	234
8308	xa_xuan_thuy	Xã Xuân Thủy	xã	234
8311	xa_trung_son	Xã Trung Sơn	xã	234
8314	xa_hung_long	Xã Hưng Long	xã	234
8317	xa_nga_hoang	Xã Nga Hoàng	xã	234
8320	xa_dong_lac	Xã Đồng Lạc	xã	234
8323	xa_thuong_long	Xã Thượng Long	xã	234
8326	xa_dong_thinh	Xã Đồng Thịnh	xã	234
8329	xa_phuc_khanh	Xã Phúc Khánh	xã	234
8332	xa_minh_hoa	Xã Minh Hòa	xã	234
8335	xa_ngoc_lap	Xã Ngọc Lập	xã	234
8338	xa_ngoc_dong	Xã Ngọc Đồng	xã	234
8341	thi_tran_cam_khe	Thị trấn Cẩm Khê	thị trấn	235
8344	xa_tien_luong	Xã Tiên Lương	xã	235
8347	xa_tuy_loc	Xã Tuy Lộc	xã	235
8350	xa_ngo_xa	Xã Ngô Xá	xã	235
8353	xa_minh_tan	Xã Minh Tân	xã	235
8356	xa_phuong_vi	Xã Phượng Vĩ	xã	235
8362	xa_thuy_lieu	Xã Thụy Liễu	xã	235
8374	xa_tung_khe	Xã Tùng Khê	xã	235
8377	xa_tam_son	Xã Tam Sơn	xã	235
8380	xa_van_ban	Xã Văn Bán	xã	235
8383	xa_cap_dan	Xã Cấp Dẫn	xã	235
8389	xa_xuong_thinh	Xã Xương Thịnh	xã	235
8392	xa_phu_khe	Xã Phú Khê	xã	235
8395	xa_son_tinh	Xã Sơn Tình	xã	235
8398	xa_yen_tap	Xã Yên Tập	xã	235
8401	xa_huong_lung	Xã Hương Lung	xã	235
8404	xa_ta_xa	Xã Tạ Xá	xã	235
8407	xa_phu_lac	Xã Phú Lạc	xã	235
8413	xa_chuong_xa	Xã Chương Xá	xã	235
8416	xa_hung_viet	Xã Hùng Việt	xã	235
8419	xa_van_khuc	Xã Văn Khúc	xã	235
8422	xa_yen_duong	Xã Yên Dưỡng	xã	235
8428	xa_dieu_luong	Xã Điêu Lương	xã	235
8431	xa_dong_luong	Xã Đồng Lương	xã	235
8434	thi_tran_hung_hoa	Thị trấn Hưng Hoá	thị trấn	236
8440	xa_hien_quan	Xã Hiền Quan	xã	236
8443	xa_bac_son	Xã Bắc Sơn	xã	236
8446	xa_thanh_uyen	Xã Thanh Uyên	xã	236
8461	xa_lam_son	Xã Lam Sơn	xã	236
8467	xa_van_xuan	Xã Vạn Xuân	xã	236
8470	xa_quang_huc	Xã Quang Húc	xã	236
8473	xa_huong_non	Xã Hương Nộn	xã	236
8476	xa_te_le	Xã Tề Lễ	xã	236
8479	xa_tho_van	Xã Thọ Văn	xã	236
8482	xa_di_nau	Xã Dị Nậu	xã	236
8491	xa_dan_quyen	Xã Dân Quyền	xã	236
8494	thi_tran_lam_thao	Thị trấn Lâm Thao	thị trấn	237
8497	xa_tien_kien	Xã Tiên Kiên	xã	237
8498	thi_tran_hung_son	Thị trấn Hùng Sơn	thị trấn	237
8500	xa_xuan_lung	Xã Xuân Lũng	xã	237
8509	xa_xuan_huy	Xã Xuân Huy	xã	237
8512	xa_thach_son	Xã Thạch Sơn	xã	237
8518	xa_son_vi	Xã Sơn Vi	xã	237
8521	xa_phung_nguyen	Xã Phùng Nguyên	xã	237
8527	xa_cao_xa	Xã Cao Xá	xã	237
8533	xa_vinh_lai	Xã Vĩnh Lại	xã	237
8536	xa_tu_xa	Xã Tứ Xã	xã	237
8539	xa_ban_nguyen	Xã Bản Nguyên	xã	237
8542	thi_tran_thanh_son	Thị trấn Thanh Sơn	thị trấn	238
8563	xa_son_hung	Xã Sơn Hùng	xã	238
8572	xa_dich_qua	Xã Địch Quả	xã	238
8575	xa_giap_lai	Xã Giáp Lai	xã	238
8581	xa_thuc_luyen	Xã Thục Luyện	xã	238
8584	xa_vo_mieu	Xã Võ Miếu	xã	238
8587	xa_thach_khoan	Xã Thạch Khoán	xã	238
8602	xa_cu_thang	Xã Cự Thắng	xã	238
8605	xa_tat_thang	Xã Tất Thắng	xã	238
8611	xa_van_mieu	Xã Văn Miếu	xã	238
8614	xa_cu_dong	Xã Cự Đồng	xã	238
8623	xa_thang_son	Xã Thắng Sơn	xã	238
8629	xa_tan_minh	Xã Tân Minh	xã	238
8632	xa_huong_can	Xã Hương Cần	xã	238
8635	xa_kha_cuu	Xã Khả Cửu	xã	238
8638	xa_dong_cuu	Xã Đông Cửu	xã	238
8641	xa_tan_lap	Xã Tân Lập	xã	238
8644	xa_yen_lang	Xã Yên Lãng	xã	238
8647	xa_yen_luong	Xã Yên Lương	xã	238
8650	xa_thuong_cuu	Xã Thượng Cửu	xã	238
8653	xa_luong_nha	Xã Lương Nha	xã	238
8656	xa_yen_son	Xã Yên Sơn	xã	238
8659	xa_tinh_nhue	Xã Tinh Nhuệ	xã	238
8662	xa_dao_xa	Xã Đào Xá	xã	239
8665	xa_thach_dong	Xã Thạch Đồng	xã	239
8668	xa_xuan_loc	Xã Xuân Lộc	xã	239
8671	xa_tan_phuong	Xã Tân Phương	xã	239
8674	thi_tran_thanh_thuy	Thị trấn Thanh Thủy	thị trấn	239
8677	xa_son_thuy	Xã Sơn Thủy	xã	239
8680	xa_bao_yen	Xã Bảo Yên	xã	239
8683	xa_doan_ha	Xã Đoan Hạ	xã	239
8686	xa_dong_trung	Xã Đồng Trung	xã	239
8689	xa_hoang_xa	Xã Hoàng Xá	xã	239
8701	xa_tu_vu	Xã Tu Vũ	xã	239
8545	xa_thu_cuc	Xã Thu Cúc	xã	240
8548	xa_thach_kiet	Xã Thạch Kiệt	xã	240
8551	xa_thu_ngac	Xã Thu Ngạc	xã	240
8554	xa_kiet_son	Xã Kiệt Sơn	xã	240
8557	xa_dong_son	Xã Đồng Sơn	xã	240
8560	xa_lai_dong	Xã Lai Đồng	xã	240
8566	xa_tan_phu	Xã Tân Phú	xã	240
8569	xa_my_thuan	Xã Mỹ Thuận	xã	240
8578	xa_tan_son	Xã Tân Sơn	xã	240
8590	xa_xuan_dai	Xã Xuân Đài	xã	240
8593	xa_minh_dai	Xã Minh Đài	xã	240
8596	xa_van_luong	Xã Văn Luông	xã	240
8599	xa_xuan_son	Xã Xuân Sơn	xã	240
8608	xa_long_coc	Xã Long Cốc	xã	240
8617	xa_kim_thuong	Xã Kim Thượng	xã	240
8620	xa_tam_thanh	Xã Tam Thanh	xã	240
8626	xa_vinh_tien	Xã Vinh Tiền	xã	240
8707	phuong_tich_son	Phường Tích Sơn	phường	243
8710	phuong_lien_bao	Phường Liên Bảo	phường	243
8713	phuong_hoi_hop	Phường Hội Hợp	phường	243
8716	phuong_dong_da	Phường Đống Đa	phường	243
8719	phuong_ngo_quyen	Phường Ngô Quyền	phường	243
8722	phuong_dong_tam	Phường Đồng Tâm	phường	243
8725	xa_dinh_trung	Xã Định Trung	xã	243
8728	phuong_khai_quang	Phường Khai Quang	phường	243
8731	xa_thanh_tru	Xã Thanh Trù	xã	243
8734	phuong_trung_trac	Phường Trưng Trắc	phường	244
8737	phuong_hung_vuong	Phường Hùng Vương	phường	244
8740	phuong_trung_nhi	Phường Trưng Nhị	phường	244
8743	phuong_phuc_thang	Phường Phúc Thắng	phường	244
8746	phuong_xuan_hoa	Phường Xuân Hoà	phường	244
8747	phuong_dong_xuan	Phường Đồng Xuân	phường	244
8749	xa_ngoc_thanh	Xã Ngọc Thanh	xã	244
8752	xa_cao_minh	Xã Cao Minh	xã	244
8755	phuong_nam_viem	Phường Nam Viêm	phường	244
8758	phuong_tien_chau	Phường Tiền Châu	phường	244
8761	thi_tran_lap_thach	Thị trấn Lập Thạch	thị trấn	246
8764	xa_quang_son	Xã Quang Sơn	xã	246
8767	xa_ngoc_my	Xã Ngọc Mỹ	xã	246
8770	xa_hop_ly	Xã Hợp Lý	xã	246
8785	xa_bac_binh	Xã Bắc Bình	xã	246
8788	xa_thai_hoa	Xã Thái Hòa	xã	246
8789	thi_tran_hoa_son	Thị trấn Hoa Sơn	thị trấn	246
8791	xa_lien_son	Xã Liễn Sơn	xã	246
8794	xa_xuan_hoa	Xã Xuân Hòa	xã	246
8797	xa_van_truc	Xã Vân Trục	xã	246
8812	xa_lien_hoa	Xã Liên Hòa	xã	246
8815	xa_tu_du	Xã Tử Du	xã	246
8833	xa_ban_gian	Xã Bàn Giản	xã	246
8836	xa_xuan_loi	Xã Xuân Lôi	xã	246
8839	xa_dong_ich	Xã Đồng Ích	xã	246
8842	xa_tien_lu	Xã Tiên Lữ	xã	246
8845	xa_van_quan	Xã Văn Quán	xã	246
8857	xa_dinh_chu	Xã Đình Chu	xã	246
8863	xa_trieu_de	Xã Triệu Đề	xã	246
8866	xa_son_dong	Xã Sơn Đông	xã	246
8869	thi_tran_hop_hoa	Thị trấn Hợp Hòa	thị trấn	247
8872	xa_hoang_hoa	Xã Hoàng Hoa	xã	247
8875	xa_dong_tinh	Xã Đồng Tĩnh	xã	247
8878	xa_kim_long	Xã Kim Long	xã	247
8881	xa_huong_dao	Xã Hướng Đạo	xã	247
8884	xa_dao_tu	Xã Đạo Tú	xã	247
8887	xa_an_hoa	Xã An Hòa	xã	247
8890	xa_thanh_van	Xã Thanh Vân	xã	247
8893	xa_duy_phien	Xã Duy Phiên	xã	247
8896	xa_hoang_dan	Xã Hoàng Đan	xã	247
8899	xa_hoang_lau	Xã Hoàng Lâu	xã	247
8902	xa_van_hoi	Xã Vân Hội	xã	247
8905	xa_hop_thinh	Xã Hợp Thịnh	xã	247
8908	thi_tran_tam_dao	Thị trấn Tam Đảo	thị trấn	248
8911	thi_tran_hop_chau	Thị trấn Hợp Châu	thị trấn	248
8914	xa_dao_tru	Xã Đạo Trù	xã	248
8917	xa_yen_duong	Xã Yên Dương	xã	248
8920	xa_bo_ly	Xã Bồ Lý	xã	248
8923	thi_tran_dai_dinh	Thị trấn Đại Đình	thị trấn	248
8926	xa_tam_quan	Xã Tam Quan	xã	248
8929	xa_ho_son	Xã Hồ Sơn	xã	248
8932	xa_minh_quang	Xã Minh Quang	xã	248
8935	thi_tran_huong_canh	Thị trấn Hương Canh	thị trấn	249
8936	thi_tran_gia_khanh	Thị trấn Gia Khánh	thị trấn	249
8938	xa_trung_my	Xã Trung Mỹ	xã	249
8944	thi_tran_ba_hien	Thị trấn Bá Hiến	thị trấn	249
8947	xa_thien_ke	Xã Thiện Kế	xã	249
8950	xa_huong_son	Xã Hương Sơn	xã	249
8953	xa_tam_hop	Xã Tam Hợp	xã	249
8956	xa_quat_luu	Xã Quất Lưu	xã	249
8959	xa_son_loi	Xã Sơn Lôi	xã	249
8962	thi_tran_dao_duc	Thị trấn Đạo Đức	thị trấn	249
8965	xa_tan_phong	Xã Tân Phong	xã	249
8968	thi_tran_thanh_lang	Thị trấn Thanh Lãng	thị trấn	249
8971	xa_phu_xuan	Xã Phú Xuân	xã	249
9025	thi_tran_yen_lac	Thị trấn Yên Lạc	thị trấn	251
9028	xa_dong_cuong	Xã Đồng Cương	xã	251
9031	xa_dong_van	Xã Đồng Văn	xã	251
9034	xa_binh_dinh	Xã Bình Định	xã	251
9037	xa_trung_nguyen	Xã Trung Nguyên	xã	251
9040	xa_te_lo	Xã Tề Lỗ	xã	251
9043	xa_tam_hong	Xã Tam Hồng	xã	251
9046	xa_yen_dong	Xã Yên Đồng	xã	251
9049	xa_van_tien	Xã Văn Tiến	xã	251
9052	xa_nguyet_duc	Xã Nguyệt Đức	xã	251
9055	xa_yen_phuong	Xã Yên Phương	xã	251
9058	xa_hong_phuong	Xã Hồng Phương	xã	251
9061	xa_trung_kien	Xã Trung Kiên	xã	251
9064	xa_lien_chau	Xã Liên Châu	xã	251
9067	xa_dai_tu	Xã Đại Tự	xã	251
9070	xa_hong_chau	Xã Hồng Châu	xã	251
9073	xa_trung_ha	Xã Trung Hà	xã	251
9076	thi_tran_vinh_tuong	Thị trấn Vĩnh Tường	thị trấn	252
9079	xa_kim_xa	Xã Kim Xá	xã	252
9082	xa_yen_binh	Xã Yên Bình	xã	252
9085	xa_chan_hung	Xã Chấn Hưng	xã	252
9088	xa_nghia_hung	Xã Nghĩa Hưng	xã	252
9091	xa_yen_lap	Xã Yên Lập	xã	252
9094	xa_viet_xuan	Xã Việt Xuân	xã	252
9097	xa_bo_sao	Xã Bồ Sao	xã	252
9100	xa_dai_dong	Xã Đại Đồng	xã	252
9103	xa_tan_tien	Xã Tân Tiến	xã	252
9106	xa_lung_hoa	Xã Lũng Hoà	xã	252
9109	xa_cao_dai	Xã Cao Đại	xã	252
9112	thi_tran_tho_tang	Thị trấn Thổ Tang	thị trấn	252
9115	xa_vinh_son	Xã Vĩnh Sơn	xã	252
9118	xa_binh_duong	Xã Bình Dương	xã	252
9124	xa_tan_phu	Xã Tân Phú	xã	252
9127	xa_thuong_trung	Xã Thượng Trưng	xã	252
9130	xa_vu_di	Xã Vũ Di	xã	252
9133	xa_ly_nhan	Xã Lý Nhân	xã	252
9136	xa_tuan_chinh	Xã Tuân Chính	xã	252
9139	xa_van_xuan	Xã Vân Xuân	xã	252
9142	xa_tam_phuc	Xã Tam Phúc	xã	252
9145	thi_tran_tu_trung	Thị trấn Tứ Trưng	thị trấn	252
9148	xa_ngu_kien	Xã Ngũ Kiên	xã	252
9151	xa_an_tuong	Xã An Tường	xã	252
9154	xa_vinh_thinh	Xã Vĩnh Thịnh	xã	252
9157	xa_phu_da	Xã Phú Đa	xã	252
9160	xa_vinh_ninh	Xã Vĩnh Ninh	xã	252
8773	xa_lang_cong	Xã Lãng Công	xã	253
8776	xa_quang_yen	Xã Quang Yên	xã	253
8779	xa_bach_luu	Xã Bạch Lưu	xã	253
8782	xa_hai_luu	Xã Hải Lựu	xã	253
8800	xa_dong_que	Xã Đồng Quế	xã	253
8803	xa_nhan_dao	Xã Nhân Đạo	xã	253
8806	xa_don_nhan	Xã Đôn Nhân	xã	253
8809	xa_phuong_khoan	Xã Phương Khoan	xã	253
8818	xa_tan_lap	Xã Tân Lập	xã	253
8821	xa_nhao_son	Xã Nhạo Sơn	xã	253
8824	thi_tran_tam_son	Thị trấn Tam Sơn	thị trấn	253
8827	xa_nhu_thuy	Xã Như Thụy	xã	253
8830	xa_yen_thach	Xã Yên Thạch	xã	253
8848	xa_dong_thinh	Xã Đồng Thịnh	xã	253
8851	xa_tu_yen	Xã Tứ Yên	xã	253
8854	xa_duc_bac	Xã Đức Bác	xã	253
8860	xa_cao_phong	Xã Cao Phong	xã	253
9163	phuong_vu_ninh	Phường Vũ Ninh	phường	256
9166	phuong_dap_cau	Phường Đáp Cầu	phường	256
9169	phuong_thi_cau	Phường Thị Cầu	phường	256
9172	phuong_kinh_bac	Phường Kinh Bắc	phường	256
9175	phuong_ve_an	Phường Vệ An	phường	256
9178	phuong_tien_an	Phường Tiền An	phường	256
9181	phuong_dai_phuc	Phường Đại Phúc	phường	256
9184	phuong_ninh_xa	Phường Ninh Xá	phường	256
9187	phuong_suoi_hoa	Phường Suối Hoa	phường	256
9190	phuong_vo_cuong	Phường Võ Cường	phường	256
9214	phuong_hoa_long	Phường Hòa Long	phường	256
9226	phuong_van_an	Phường Vạn An	phường	256
9235	phuong_khuc_xuyen	Phường Khúc Xuyên	phường	256
9244	phuong_phong_khe	Phường Phong Khê	phường	256
9256	phuong_kim_chan	Phường Kim Chân	phường	256
9271	phuong_van_duong	Phường Vân Dương	phường	256
9286	phuong_nam_son	Phường Nam Sơn	phường	256
9325	phuong_khac_niem	Phường Khắc Niệm	phường	256
9331	phuong_hap_linh	Phường Hạp Lĩnh	phường	256
9193	thi_tran_cho	Thị trấn Chờ	thị trấn	258
9196	xa_dung_liet	Xã Dũng Liệt	xã	258
9199	xa_tam_da	Xã Tam Đa	xã	258
9202	xa_tam_giang	Xã Tam Giang	xã	258
9205	xa_yen_trung	Xã Yên Trung	xã	258
9208	xa_thuy_hoa	Xã Thụy Hòa	xã	258
9211	xa_hoa_tien	Xã Hòa Tiến	xã	258
9217	xa_dong_tien	Xã Đông Tiến	xã	258
9220	xa_yen_phu	Xã Yên Phụ	xã	258
9223	xa_trung_nghia	Xã Trung Nghĩa	xã	258
9229	xa_dong_phong	Xã Đông Phong	xã	258
9232	xa_long_chau	Xã Long Châu	xã	258
9238	xa_van_mon	Xã Văn Môn	xã	258
9241	xa_dong_tho	Xã Đông Thọ	xã	258
9247	thi_tran_pho_moi	Thị trấn Phố Mới	thị trấn	259
9250	xa_viet_thong	Xã Việt Thống	xã	259
9253	xa_dai_xuan	Xã Đại Xuân	xã	259
9259	xa_nhan_hoa	Xã Nhân Hòa	xã	259
9262	xa_bang_an	Xã Bằng An	xã	259
9265	xa_phuong_lieu	Xã Phương Liễu	xã	259
9268	xa_que_tan	Xã Quế Tân	xã	259
9274	xa_phu_luong	Xã Phù Lương	xã	259
9277	xa_phu_lang	Xã Phù Lãng	xã	259
9280	xa_phuong_mao	Xã Phượng Mao	xã	259
9283	xa_viet_hung	Xã Việt Hùng	xã	259
9289	xa_ngoc_xa	Xã Ngọc Xá	xã	259
9292	xa_chau_phong	Xã Châu Phong	xã	259
9295	xa_bong_lai	Xã Bồng Lai	xã	259
9298	xa_cach_bi	Xã Cách Bi	xã	259
9301	xa_dao_vien	Xã Đào Viên	xã	259
9304	xa_yen_gia	Xã Yên Giả	xã	259
9307	xa_mo_dao	Xã Mộ Đạo	xã	259
9310	xa_duc_long	Xã Đức Long	xã	259
9313	xa_chi_lang	Xã Chi Lăng	xã	259
9316	xa_han_quang	Xã Hán Quảng	xã	259
9319	thi_tran_lim	Thị trấn Lim	thị trấn	260
9322	xa_phu_lam	Xã Phú Lâm	xã	260
9328	xa_noi_due	Xã Nội Duệ	xã	260
9334	xa_lien_bao	Xã Liên Bão	xã	260
9337	xa_hien_van	Xã Hiên Vân	xã	260
9340	xa_hoan_son	Xã Hoàn Sơn	xã	260
9343	xa_lac_ve	Xã Lạc Vệ	xã	260
9346	xa_viet_doan	Xã Việt Đoàn	xã	260
9349	xa_phat_tich	Xã Phật Tích	xã	260
9352	xa_tan_chi	Xã Tân Chi	xã	260
9355	xa_dai_dong	Xã Đại Đồng	xã	260
9358	xa_tri_phuong	Xã Tri Phương	xã	260
9361	xa_minh_dao	Xã Minh Đạo	xã	260
9364	xa_canh_hung	Xã Cảnh Hưng	xã	260
9367	phuong_dong_ngan	Phường Đông Ngàn	phường	261
9370	phuong_tam_son	Phường Tam Sơn	phường	261
9373	phuong_huong_mac	Phường Hương Mạc	phường	261
9376	phuong_tuong_giang	Phường Tương Giang	phường	261
9379	phuong_phu_khe	Phường Phù Khê	phường	261
9382	phuong_dong_ky	Phường Đồng Kỵ	phường	261
9383	phuong_trang_ha	Phường Trang Hạ	phường	261
9385	phuong_dong_nguyen	Phường Đồng Nguyên	phường	261
9388	phuong_chau_khe	Phường Châu Khê	phường	261
9391	phuong_tan_hong	Phường Tân Hồng	phường	261
9394	phuong_dinh_bang	Phường Đình Bảng	phường	261
9397	phuong_phu_chan	Phường Phù Chẩn	phường	261
9400	thi_tran_ho	Thị trấn Hồ	thị trấn	262
9403	xa_hoai_thuong	Xã Hoài Thượng	xã	262
9406	xa_dai_dong_thanh	Xã Đại Đồng Thành	xã	262
9409	xa_mao_dien	Xã Mão Điền	xã	262
9412	xa_song_ho	Xã Song Hồ	xã	262
9415	xa_dinh_to	Xã Đình Tổ	xã	262
9418	xa_an_binh	Xã An Bình	xã	262
9421	xa_tri_qua	Xã Trí Quả	xã	262
9424	xa_gia_dong	Xã Gia Đông	xã	262
9427	xa_thanh_khuong	Xã Thanh Khương	xã	262
9430	xa_tram_lo	Xã Trạm Lộ	xã	262
9433	xa_xuan_lam	Xã Xuân Lâm	xã	262
9436	xa_ha_man	Xã Hà Mãn	xã	262
9439	xa_ngu_thai	Xã Ngũ Thái	xã	262
9442	xa_nguyet_duc	Xã Nguyệt Đức	xã	262
9445	xa_ninh_xa	Xã Ninh Xá	xã	262
9448	xa_nghia_dao	Xã Nghĩa Đạo	xã	262
9451	xa_song_lieu	Xã Song Liễu	xã	262
9454	thi_tran_gia_binh	Thị trấn Gia Bình	thị trấn	263
9457	xa_van_ninh	Xã Vạn Ninh	xã	263
9460	xa_thai_bao	Xã Thái Bảo	xã	263
9463	xa_giang_son	Xã Giang Sơn	xã	263
9466	xa_cao_duc	Xã Cao Đức	xã	263
9469	xa_dai_lai	Xã Đại Lai	xã	263
9472	xa_song_giang	Xã Song Giang	xã	263
9475	xa_binh_duong	Xã Bình Dương	xã	263
9478	xa_lang_ngam	Xã Lãng Ngâm	xã	263
9481	xa_nhan_thang	Xã Nhân Thắng	xã	263
9484	xa_xuan_lai	Xã Xuân Lai	xã	263
9487	xa_dong_cuu	Xã Đông Cứu	xã	263
9490	xa_dai_bai	Xã Đại Bái	xã	263
9493	xa_quynh_phu	Xã Quỳnh Phú	xã	263
9496	thi_tran_thua	Thị trấn Thứa	thị trấn	264
9499	xa_an_thinh	Xã An Thịnh	xã	264
9502	xa_trung_kenh	Xã Trung Kênh	xã	264
9505	xa_phu_hoa	Xã Phú Hòa	xã	264
9508	xa_my_huong	Xã Mỹ Hương	xã	264
9511	xa_tan_lang	Xã Tân Lãng	xã	264
9514	xa_quang_phu	Xã Quảng Phú	xã	264
9517	xa_trung_xa	Xã Trừng Xá	xã	264
9520	xa_lai_ha	Xã Lai Hạ	xã	264
9523	xa_trung_chinh	Xã Trung Chính	xã	264
9526	xa_minh_tan	Xã Minh Tân	xã	264
9529	xa_binh_dinh	Xã Bình Định	xã	264
9532	xa_phu_luong	Xã Phú Lương	xã	264
9535	xa_lam_thao	Xã Lâm Thao	xã	264
10507	phuong_cam_thuong	Phường Cẩm Thượng	phường	288
10510	phuong_binh_han	Phường Bình Hàn	phường	288
10513	phuong_ngoc_chau	Phường Ngọc Châu	phường	288
10514	phuong_nhi_chau	Phường Nhị Châu	phường	288
10516	phuong_quang_trung	Phường Quang Trung	phường	288
10519	phuong_nguyen_trai	Phường Nguyễn Trãi	phường	288
10522	phuong_pham_ngu_lao	Phường Phạm Ngũ Lão	phường	288
10525	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	288
10528	phuong_tran_phu	Phường Trần Phú	phường	288
10531	phuong_thanh_binh	Phường Thanh Bình	phường	288
10532	phuong_tan_binh	Phường Tân Bình	phường	288
10534	phuong_le_thanh_nghi	Phường Lê Thanh Nghị	phường	288
10537	phuong_hai_tan	Phường Hải Tân	phường	288
10540	phuong_tu_minh	Phường Tứ Minh	phường	288
10543	phuong_viet_hoa	Phường Việt Hoà	phường	288
10660	phuong_ai_quoc	Phường Ái Quốc	phường	288
10663	xa_an_thuong	Xã An Thượng	xã	288
10672	phuong_nam_dong	Phường Nam Đồng	phường	288
10822	xa_quyet_thang	Xã Quyết Thắng	xã	288
10837	xa_tien_tien	Xã Tiền Tiến	xã	288
11002	phuong_thach_khoi	Phường Thạch Khôi	phường	288
11005	xa_lien_hong	Xã Liên Hồng	xã	288
11011	phuong_tan_hung	Phường Tân Hưng	phường	288
11017	xa_gia_xuyen	Xã Gia Xuyên	xã	288
11077	xa_ngoc_son	Xã Ngọc Sơn	xã	288
10546	phuong_pha_lai	Phường Phả Lại	phường	290
10549	phuong_sao_do	Phường Sao Đỏ	phường	290
10552	phuong_ben_tam	Phường Bến Tắm	phường	290
10555	xa_hoang_hoa_tham	Xã Hoàng Hoa Thám	xã	290
10558	xa_bac_an	Xã Bắc An	xã	290
10561	xa_hung_dao	Xã Hưng Đạo	xã	290
10564	xa_le_loi	Xã Lê Lợi	xã	290
10567	phuong_hoang_tien	Phường Hoàng Tiến	phường	290
10570	phuong_cong_hoa	Phường Cộng Hoà	phường	290
10573	phuong_hoang_tan	Phường Hoàng Tân	phường	290
10576	phuong_co_thanh	Phường Cổ Thành	phường	290
10579	phuong_van_an	Phường Văn An	phường	290
10582	phuong_chi_minh	Phường Chí Minh	phường	290
10585	phuong_van_duc	Phường Văn Đức	phường	290
10588	phuong_thai_hoc	Phường Thái Học	phường	290
10591	xa_nhan_hue	Xã Nhân Huệ	xã	290
10594	phuong_an_lac	Phường An Lạc	phường	290
10600	phuong_dong_lac	Phường Đồng Lạc	phường	290
10603	phuong_tan_dan	Phường Tân Dân	phường	290
10606	thi_tran_nam_sach	Thị trấn Nam Sách	thị trấn	291
10609	xa_nam_hung	Xã Nam Hưng	xã	291
10612	xa_nam_tan	Xã Nam Tân	xã	291
10615	xa_hop_tien	Xã Hợp Tiến	xã	291
10618	xa_hiep_cat	Xã Hiệp Cát	xã	291
10621	xa_thanh_quang	Xã Thanh Quang	xã	291
10624	xa_quoc_tuan	Xã Quốc Tuấn	xã	291
10627	xa_nam_chinh	Xã Nam Chính	xã	291
10630	xa_an_binh	Xã An Bình	xã	291
10633	xa_nam_trung	Xã Nam Trung	xã	291
10636	xa_an_son	Xã An Sơn	xã	291
10639	xa_cong_hoa	Xã Cộng Hòa	xã	291
10642	xa_thai_tan	Xã Thái Tân	xã	291
10645	xa_an_lam	Xã An Lâm	xã	291
10648	xa_phu_dien	Xã Phú Điền	xã	291
10651	xa_nam_hong	Xã Nam Hồng	xã	291
10654	xa_hong_phong	Xã Hồng Phong	xã	291
10657	xa_dong_lac	Xã Đồng Lạc	xã	291
10666	xa_minh_tan	Xã Minh Tân	xã	291
10675	phuong_an_luu	Phường An Lưu	phường	292
10678	xa_bach_dang	Xã Bạch Đằng	xã	292
10681	phuong_that_hung	Phường Thất Hùng	phường	292
10684	xa_le_ninh	Xã Lê Ninh	xã	292
10687	xa_hoanh_son	Xã Hoành Sơn	xã	292
10693	phuong_pham_thai	Phường Phạm Thái	phường	292
10696	phuong_duy_tan	Phường Duy Tân	phường	292
10699	phuong_tan_dan	Phường Tân Dân	phường	292
10702	phuong_minh_tan	Phường Minh Tân	phường	292
10705	xa_quang_thanh	Xã Quang Thành	xã	292
10708	xa_hiep_hoa	Xã Hiệp Hòa	xã	292
10714	phuong_phu_thu	Phường Phú Thứ	phường	292
10717	xa_thang_long	Xã Thăng Long	xã	292
10720	xa_lac_long	Xã Lạc Long	xã	292
10723	phuong_an_sinh	Phường An Sinh	phường	292
10726	phuong_hiep_son	Phường Hiệp Sơn	phường	292
10729	xa_thuong_quan	Xã Thượng Quận	xã	292
10732	phuong_an_phu	Phường An Phụ	phường	292
10735	phuong_hiep_an	Phường Hiệp An	phường	292
10738	phuong_long_xuyen	Phường Long Xuyên	phường	292
10741	phuong_thai_thinh	Phường Thái Thịnh	phường	292
10744	phuong_hien_thanh	Phường Hiến Thành	phường	292
10747	xa_minh_hoa	Xã Minh Hòa	xã	292
10750	thi_tran_phu_thai	Thị trấn Phú Thái	thị trấn	293
10753	xa_lai_vu	Xã Lai Vu	xã	293
10756	xa_cong_hoa	Xã Cộng Hòa	xã	293
10759	xa_thuong_vu	Xã Thượng Vũ	xã	293
10762	xa_co_dung	Xã Cổ Dũng	xã	293
10768	xa_tuan_viet	Xã Tuấn Việt	xã	293
10771	xa_kim_xuyen	Xã Kim Xuyên	xã	293
10774	xa_phuc_thanh_a	Xã Phúc Thành A	xã	293
10777	xa_ngu_phuc	Xã Ngũ Phúc	xã	293
10780	xa_kim_anh	Xã Kim Anh	xã	293
10783	xa_kim_lien	Xã Kim Liên	xã	293
10786	xa_kim_tan	Xã Kim Tân	xã	293
10792	xa_kim_dinh	Xã Kim Đính	xã	293
10798	xa_binh_dan	Xã Bình Dân	xã	293
10801	xa_tam_ky	Xã Tam Kỳ	xã	293
10804	xa_dong_cam	Xã Đồng Cẩm	xã	293
10807	xa_lien_hoa	Xã Liên Hòa	xã	293
10810	xa_dai_duc	Xã Đại Đức	xã	293
10813	thi_tran_thanh_ha	Thị trấn Thanh Hà	thị trấn	294
10816	xa_hong_lac	Xã Hồng Lạc	xã	294
10819	xa_viet_hong	Xã Việt Hồng	xã	294
10825	xa_tan_viet	Xã Tân Việt	xã	294
10828	xa_cam_che	Xã Cẩm Chế	xã	294
10831	xa_thanh_an	Xã Thanh An	xã	294
10834	xa_thanh_lang	Xã Thanh Lang	xã	294
10840	xa_tan_an	Xã Tân An	xã	294
10843	xa_lien_mac	Xã Liên Mạc	xã	294
10846	xa_thanh_hai	Xã Thanh Hải	xã	294
10849	xa_thanh_khe	Xã Thanh Khê	xã	294
10852	xa_thanh_xa	Xã Thanh Xá	xã	294
10855	xa_thanh_xuan	Xã Thanh Xuân	xã	294
10861	xa_thanh_thuy	Xã Thanh Thủy	xã	294
10864	xa_an_phuong	Xã An Phượng	xã	294
10867	xa_thanh_son	Xã Thanh Sơn	xã	294
10876	xa_thanh_quang	Xã Thanh Quang	xã	294
10879	xa_thanh_hong	Xã Thanh Hồng	xã	294
10882	xa_thanh_cuong	Xã Thanh Cường	xã	294
10885	xa_vinh_lap	Xã Vĩnh Lập	xã	294
10888	thi_tran_cam_giang	Thị trấn Cẩm Giang	thị trấn	295
10891	thi_tran_lai_cach	Thị trấn Lai Cách	thị trấn	295
10894	xa_cam_hung	Xã Cẩm Hưng	xã	295
10897	xa_cam_hoang	Xã Cẩm Hoàng	xã	295
10900	xa_cam_van	Xã Cẩm Văn	xã	295
10903	xa_ngoc_lien	Xã Ngọc Liên	xã	295
10906	xa_thach_loi	Xã Thạch Lỗi	xã	295
10909	xa_cam_vu	Xã Cẩm Vũ	xã	295
10912	xa_duc_chinh	Xã Đức Chính	xã	295
10918	xa_dinh_son	Xã Định Sơn	xã	295
10924	xa_luong_dien	Xã Lương Điền	xã	295
10927	xa_cao_an	Xã Cao An	xã	295
10930	xa_tan_truong	Xã Tân Trường	xã	295
10933	xa_cam_phuc	Xã Cẩm Phúc	xã	295
10936	xa_cam_dien	Xã Cẩm Điền	xã	295
10939	xa_cam_dong	Xã Cẩm Đông	xã	295
10942	xa_cam_doai	Xã Cẩm Đoài	xã	295
10945	thi_tran_ke_sat	Thị trấn Kẻ Sặt	thị trấn	296
10951	xa_vinh_hung	Xã Vĩnh Hưng	xã	296
10954	xa_hung_thang	Xã Hùng Thắng	xã	296
10960	xa_vinh_hong	Xã Vĩnh Hồng	xã	296
10963	xa_long_xuyen	Xã Long Xuyên	xã	296
10966	xa_tan_viet	Xã Tân Việt	xã	296
10969	xa_thuc_khang	Xã Thúc Kháng	xã	296
10972	xa_tan_hong	Xã Tân Hồng	xã	296
10975	xa_binh_minh	Xã Bình Minh	xã	296
10978	xa_hong_khe	Xã Hồng Khê	xã	296
10981	xa_thai_hoc	Xã Thái Học	xã	296
10984	xa_co_bi	Xã Cổ Bì	xã	296
10987	xa_nhan_quyen	Xã Nhân Quyền	xã	296
10990	xa_thai_duong	Xã Thái Dương	xã	296
10993	xa_thai_hoa	Xã Thái Hòa	xã	296
10996	xa_binh_xuyen	Xã Bình Xuyên	xã	296
10999	thi_tran_gia_loc	Thị trấn Gia Lộc	thị trấn	297
11008	xa_thong_nhat	Xã Thống Nhất	xã	297
11020	xa_yet_kieu	Xã Yết Kiêu	xã	297
11029	xa_gia_tan	Xã Gia Tân	xã	297
11032	xa_tan_tien	Xã Tân Tiến	xã	297
11035	xa_gia_khanh	Xã Gia Khánh	xã	297
11038	xa_gia_luong	Xã Gia Lương	xã	297
11041	xa_le_loi	Xã Lê Lợi	xã	297
11044	xa_toan_thang	Xã Toàn Thắng	xã	297
11047	xa_hoang_dieu	Xã Hoàng Diệu	xã	297
11050	xa_hong_hung	Xã Hồng Hưng	xã	297
11053	xa_pham_tran	Xã Phạm Trấn	xã	297
11056	xa_doan_thuong	Xã Đoàn Thượng	xã	297
11059	xa_thong_kenh	Xã Thống Kênh	xã	297
11062	xa_quang_minh	Xã Quang Minh	xã	297
11065	xa_dong_quang	Xã Đồng Quang	xã	297
11068	xa_nhat_tan	Xã Nhật Tân	xã	297
11071	xa_duc_xuong	Xã Đức Xương	xã	297
11074	thi_tran_tu_ky	Thị trấn Tứ Kỳ	thị trấn	298
11083	xa_dai_son	Xã Đại Sơn	xã	298
11086	xa_hung_dao	Xã Hưng Đạo	xã	298
11089	xa_ngoc_ky	Xã Ngọc Kỳ	xã	298
11092	xa_binh_lang	Xã Bình Lăng	xã	298
11095	xa_chi_minh	Xã Chí Minh	xã	298
11098	xa_tai_son	Xã Tái Sơn	xã	298
11101	xa_quang_phuc	Xã Quang Phục	xã	298
11110	xa_dan_chu	Xã Dân Chủ	xã	298
11113	xa_tan_ky	Xã Tân Kỳ	xã	298
11116	xa_quang_khai	Xã Quang Khải	xã	298
11119	xa_dai_hop	Xã Đại Hợp	xã	298
11122	xa_quang_nghiep	Xã Quảng Nghiệp	xã	298
11125	xa_an_thanh	Xã An Thanh	xã	298
11128	xa_minh_duc	Xã Minh Đức	xã	298
11131	xa_van_to	Xã Văn Tố	xã	298
11134	xa_quang_trung	Xã Quang Trung	xã	298
11137	xa_phuong_ky	Xã Phượng Kỳ	xã	298
11140	xa_cong_lac	Xã Cộng Lạc	xã	298
11143	xa_tien_dong	Xã Tiên Động	xã	298
11146	xa_nguyen_giap	Xã Nguyên Giáp	xã	298
11149	xa_ha_ky	Xã Hà Kỳ	xã	298
11152	xa_ha_thanh	Xã Hà Thanh	xã	298
11155	thi_tran_ninh_giang	Thị trấn Ninh Giang	thị trấn	299
11161	xa_ung_hoe	Xã Ứng Hoè	xã	299
11164	xa_nghia_an	Xã Nghĩa An	xã	299
11167	xa_hong_duc	Xã Hồng Đức	xã	299
11173	xa_an_duc	Xã An Đức	xã	299
11176	xa_van_phuc	Xã Vạn Phúc	xã	299
11179	xa_tan_huong	Xã Tân Hương	xã	299
11185	xa_vinh_hoa	Xã Vĩnh Hòa	xã	299
11188	xa_dong_xuyen	Xã Đông Xuyên	xã	299
11197	xa_tan_phong	Xã Tân Phong	xã	299
11200	xa_ninh_hai	Xã Ninh Hải	xã	299
11203	xa_dong_tam	Xã Đồng Tâm	xã	299
11206	xa_tan_quang	Xã Tân Quang	xã	299
11209	xa_kien_quoc	Xã Kiến Quốc	xã	299
11215	xa_hong_du	Xã Hồng Dụ	xã	299
11218	xa_van_hoi	Xã Văn Hội	xã	299
11224	xa_hong_phong	Xã Hồng Phong	xã	299
11227	xa_hiep_luc	Xã Hiệp Lực	xã	299
11230	xa_hong_phuc	Xã Hồng Phúc	xã	299
11233	xa_hung_long	Xã Hưng Long	xã	299
11239	thi_tran_thanh_mien	Thị trấn Thanh Miện	thị trấn	300
11242	xa_thanh_tung	Xã Thanh Tùng	xã	300
11245	xa_pham_kha	Xã Phạm Kha	xã	300
11248	xa_ngo_quyen	Xã Ngô Quyền	xã	300
11251	xa_doan_tung	Xã Đoàn Tùng	xã	300
11254	xa_hong_quang	Xã Hồng Quang	xã	300
11257	xa_tan_trao	Xã Tân Trào	xã	300
11260	xa_lam_son	Xã Lam Sơn	xã	300
11263	xa_doan_ket	Xã Đoàn Kết	xã	300
11266	xa_le_hong	Xã Lê Hồng	xã	300
11269	xa_tu_cuong	Xã Tứ Cường	xã	300
11275	xa_ngu_hung	Xã Ngũ Hùng	xã	300
11278	xa_cao_thang	Xã Cao Thắng	xã	300
11281	xa_chi_lang_bac	Xã Chi Lăng Bắc	xã	300
11284	xa_chi_lang_nam	Xã Chi Lăng Nam	xã	300
11287	xa_thanh_giang	Xã Thanh Giang	xã	300
11293	xa_hong_phong	Xã Hồng Phong	xã	300
11296	phuong_quan_toan	Phường Quán Toan	phường	303
11299	phuong_hung_vuong	Phường Hùng Vương	phường	303
11302	phuong_so_dau	Phường Sở Dầu	phường	303
11305	phuong_thuong_ly	Phường Thượng Lý	phường	303
11308	phuong_ha_ly	Phường Hạ Lý	phường	303
11311	phuong_minh_khai	Phường Minh Khai	phường	303
11314	phuong_trai_chuoi	Phường Trại Chuối	phường	303
11320	phuong_hoang_van_thu	Phường Hoàng Văn Thụ	phường	303
11323	phuong_phan_boi_chau	Phường Phan Bội Châu	phường	303
11329	phuong_may_chai	Phường Máy Chai	phường	304
11332	phuong_may_to	Phường Máy Tơ	phường	304
11335	phuong_van_my	Phường Vạn Mỹ	phường	304
11338	phuong_cau_tre	Phường Cầu Tre	phường	304
11341	phuong_lac_vien	Phường Lạc Viên	phường	304
11347	phuong_gia_vien	Phường Gia Viên	phường	304
11350	phuong_dong_khe	Phường Đông Khê	phường	304
11353	phuong_cau_dat	Phường Cầu Đất	phường	304
11356	phuong_le_loi	Phường Lê Lợi	phường	304
11359	phuong_dang_giang	Phường Đằng Giang	phường	304
11362	phuong_lach_tray	Phường Lạch Tray	phường	304
11365	phuong_dong_quoc_binh	Phường Đổng Quốc Bình	phường	304
11368	phuong_cat_dai	Phường Cát Dài	phường	305
11371	phuong_an_bien	Phường An Biên	phường	305
11374	phuong_lam_son	Phường Lam Sơn	phường	305
11377	phuong_an_duong	Phường An Dương	phường	305
11380	phuong_tran_nguyen_han	Phường Trần Nguyên Hãn	phường	305
11383	phuong_ho_nam	Phường Hồ Nam	phường	305
11386	phuong_trai_cau	Phường Trại Cau	phường	305
11389	phuong_du_hang	Phường Dư Hàng	phường	305
11392	phuong_hang_kenh	Phường Hàng Kênh	phường	305
11395	phuong_dong_hai	Phường Đông Hải	phường	305
11398	phuong_niem_nghia	Phường Niệm Nghĩa	phường	305
11401	phuong_nghia_xa	Phường Nghĩa Xá	phường	305
11404	phuong_du_hang_kenh	Phường Dư Hàng Kênh	phường	305
11405	phuong_kenh_duong	Phường Kênh Dương	phường	305
11407	phuong_vinh_niem	Phường Vĩnh Niệm	phường	305
11410	phuong_dong_hai_1	Phường Đông Hải 1	phường	306
11411	phuong_dong_hai_2	Phường Đông Hải 2	phường	306
11413	phuong_dang_lam	Phường Đằng Lâm	phường	306
11414	phuong_thanh_to	Phường Thành Tô	phường	306
11416	phuong_dang_hai	Phường Đằng Hải	phường	306
11419	phuong_nam_hai	Phường Nam Hải	phường	306
11422	phuong_cat_bi	Phường Cát Bi	phường	306
11425	phuong_trang_cat	Phường Tràng Cát	phường	306
11428	phuong_quan_tru	Phường Quán Trữ	phường	307
11429	phuong_lam_ha	Phường Lãm Hà	phường	307
11431	phuong_dong_hoa	Phường Đồng Hoà	phường	307
11434	phuong_bac_son	Phường Bắc Sơn	phường	307
11437	phuong_nam_son	Phường Nam Sơn	phường	307
11440	phuong_ngoc_son	Phường Ngọc Sơn	phường	307
11443	phuong_tran_thanh_ngo	Phường Trần Thành Ngọ	phường	307
11446	phuong_van_dau	Phường Văn Đẩu	phường	307
11449	phuong_phu_lien	Phường Phù Liễn	phường	307
11452	phuong_trang_minh	Phường Tràng Minh	phường	307
11455	phuong_ngoc_xuyen	Phường Ngọc Xuyên	phường	308
11458	phuong_hai_son	Phường Hải Sơn	phường	308
11461	phuong_van_huong	Phường Vạn Hương	phường	308
11465	phuong_minh_duc	Phường Minh Đức	phường	308
11467	phuong_bang_la	Phường Bàng La	phường	308
11737	phuong_hop_duc	Phường Hợp Đức	phường	308
11683	phuong_da_phuc	Phường Đa Phúc	phường	309
11686	phuong_hung_dao	Phường Hưng Đạo	phường	309
11689	phuong_anh_dung	Phường Anh Dũng	phường	309
11692	phuong_hai_thanh	Phường Hải Thành	phường	309
11707	phuong_hoa_nghia	Phường Hoà Nghĩa	phường	309
11740	phuong_tan_thanh	Phường Tân Thành	phường	309
11470	thi_tran_nui_deo	Thị trấn Núi Đèo	thị trấn	311
11473	thi_tran_minh_duc	Thị trấn Minh Đức	thị trấn	311
11476	xa_lai_xuan	Xã Lại Xuân	xã	311
11479	xa_an_son	Xã An Sơn	xã	311
11482	xa_ky_son	Xã Kỳ Sơn	xã	311
11485	xa_lien_khe	Xã Liên Khê	xã	311
11488	xa_luu_kiem	Xã Lưu Kiếm	xã	311
11491	xa_luu_ky	Xã Lưu Kỳ	xã	311
11494	xa_gia_minh	Xã Gia Minh	xã	311
11497	xa_gia_duc	Xã Gia Đức	xã	311
11500	xa_minh_tan	Xã Minh Tân	xã	311
11503	xa_phu_ninh	Xã Phù Ninh	xã	311
11506	xa_quang_thanh	Xã Quảng Thanh	xã	311
11509	xa_chinh_my	Xã Chính Mỹ	xã	311
11512	xa_kenh_giang	Xã Kênh Giang	xã	311
11515	xa_hop_thanh	Xã Hợp Thành	xã	311
11518	xa_cao_nhan	Xã Cao Nhân	xã	311
11521	xa_my_dong	Xã Mỹ Đồng	xã	311
11524	xa_dong_son	Xã Đông Sơn	xã	311
11527	xa_hoa_binh	Xã Hoà Bình	xã	311
11530	xa_trung_ha	Xã Trung Hà	xã	311
11533	xa_an_lu	Xã An Lư	xã	311
11536	xa_thuy_trieu	Xã Thuỷ Triều	xã	311
11539	xa_ngu_lao	Xã Ngũ Lão	xã	311
11542	xa_phuc_le	Xã Phục Lễ	xã	311
11545	xa_tam_hung	Xã Tam Hưng	xã	311
11548	xa_pha_le	Xã Phả Lễ	xã	311
11551	xa_lap_le	Xã Lập Lễ	xã	311
11554	xa_kien_bai	Xã Kiền Bái	xã	311
11557	xa_thien_huong	Xã Thiên Hương	xã	311
11560	xa_thuy_son	Xã Thuỷ Sơn	xã	311
11563	xa_thuy_duong	Xã Thuỷ Đường	xã	311
11566	xa_hoang_dong	Xã Hoàng Động	xã	311
11569	xa_lam_dong	Xã Lâm Động	xã	311
11572	xa_hoa_dong	Xã Hoa Động	xã	311
11575	xa_tan_duong	Xã Tân Dương	xã	311
11578	xa_duong_quan	Xã Dương Quan	xã	311
11581	thi_tran_an_duong	Thị trấn An Dương	thị trấn	312
11584	xa_le_thien	Xã Lê Thiện	xã	312
11587	xa_dai_ban	Xã Đại Bản	xã	312
11590	xa_an_hoa	Xã An Hoà	xã	312
11593	xa_hong_phong	Xã Hồng Phong	xã	312
11596	xa_tan_tien	Xã Tân Tiến	xã	312
11599	xa_an_hung	Xã An Hưng	xã	312
11602	xa_an_hong	Xã An Hồng	xã	312
11605	xa_bac_son	Xã Bắc Sơn	xã	312
11608	xa_nam_son	Xã Nam Sơn	xã	312
11611	xa_le_loi	Xã Lê Lợi	xã	312
11614	xa_dang_cuong	Xã Đặng Cương	xã	312
11617	xa_dong_thai	Xã Đồng Thái	xã	312
11620	xa_quoc_tuan	Xã Quốc Tuấn	xã	312
11623	xa_an_dong	Xã An Đồng	xã	312
11626	xa_hong_thai	Xã Hồng Thái	xã	312
11629	thi_tran_an_lao	Thị trấn An Lão	thị trấn	313
11632	xa_bat_trang	Xã Bát Trang	xã	313
11635	xa_truong_tho	Xã Trường Thọ	xã	313
11638	xa_truong_thanh	Xã Trường Thành	xã	313
11641	xa_an_tien	Xã An Tiến	xã	313
11644	xa_quang_hung	Xã Quang Hưng	xã	313
11647	xa_quang_trung	Xã Quang Trung	xã	313
11650	xa_quoc_tuan	Xã Quốc Tuấn	xã	313
11653	xa_an_thang	Xã An Thắng	xã	313
11656	thi_tran_truong_son	Thị trấn Trường Sơn	thị trấn	313
11659	xa_tan_dan	Xã Tân Dân	xã	313
11662	xa_thai_son	Xã Thái Sơn	xã	313
11665	xa_tan_vien	Xã Tân Viên	xã	313
11668	xa_my_duc	Xã Mỹ Đức	xã	313
11671	xa_chien_thang	Xã Chiến Thắng	xã	313
11674	xa_an_tho	Xã An Thọ	xã	313
11677	xa_an_thai	Xã An Thái	xã	313
11680	thi_tran_nui_doi	Thị trấn Núi Đối	thị trấn	314
11695	xa_dong_phuong	Xã Đông Phương	xã	314
11698	xa_thuan_thien	Xã Thuận Thiên	xã	314
11701	xa_huu_bang	Xã Hữu Bằng	xã	314
11704	xa_dai_dong	Xã Đại Đồng	xã	314
11710	xa_ngu_phuc	Xã Ngũ Phúc	xã	314
11713	xa_kien_quoc	Xã Kiến Quốc	xã	314
11716	xa_du_le	Xã Du Lễ	xã	314
11719	xa_thuy_huong	Xã Thuỵ Hương	xã	314
11722	xa_thanh_son	Xã Thanh Sơn	xã	314
11725	xa_minh_tan	Xã Minh Tân	xã	314
11728	xa_dai_ha	Xã Đại Hà	xã	314
11731	xa_ngu_doan	Xã Ngũ Đoan	xã	314
11734	xa_tan_phong	Xã Tân Phong	xã	314
11743	xa_tan_trao	Xã Tân Trào	xã	314
11746	xa_doan_xa	Xã Đoàn Xá	xã	314
11749	xa_tu_son	Xã Tú Sơn	xã	314
11752	xa_dai_hop	Xã Đại Hợp	xã	314
11755	thi_tran_tien_lang	Thị trấn Tiên Lãng	thị trấn	315
11758	xa_dai_thang	Xã Đại Thắng	xã	315
11761	xa_tien_cuong	Xã Tiên Cường	xã	315
11764	xa_tu_cuong	Xã Tự Cường	xã	315
11770	xa_quyet_tien	Xã Quyết Tiến	xã	315
11773	xa_khoi_nghia	Xã Khởi Nghĩa	xã	315
11776	xa_tien_thanh	Xã Tiên Thanh	xã	315
11779	xa_cap_tien	Xã Cấp Tiến	xã	315
11782	xa_kien_thiet	Xã Kiến Thiết	xã	315
11785	xa_doan_lap	Xã Đoàn Lập	xã	315
11788	xa_bach_dang	Xã Bạch Đằng	xã	315
11791	xa_quang_phuc	Xã Quang Phục	xã	315
11794	xa_toan_thang	Xã Toàn Thắng	xã	315
11797	xa_tien_thang	Xã Tiên Thắng	xã	315
11800	xa_tien_minh	Xã Tiên Minh	xã	315
11803	xa_bac_hung	Xã Bắc Hưng	xã	315
11806	xa_nam_hung	Xã Nam Hưng	xã	315
11809	xa_hung_thang	Xã Hùng Thắng	xã	315
11812	xa_tay_hung	Xã Tây Hưng	xã	315
11815	xa_dong_hung	Xã Đông Hưng	xã	315
11821	xa_vinh_quang	Xã Vinh Quang	xã	315
11824	thi_tran_vinh_bao	Thị trấn Vĩnh Bảo	thị trấn	316
11827	xa_dung_tien	Xã Dũng Tiến	xã	316
11830	xa_giang_bien	Xã Giang Biên	xã	316
11833	xa_thang_thuy	Xã Thắng Thuỷ	xã	316
11836	xa_trung_lap	Xã Trung Lập	xã	316
11839	xa_viet_tien	Xã Việt Tiến	xã	316
11842	xa_vinh_an	Xã Vĩnh An	xã	316
11845	xa_vinh_long	Xã Vĩnh Long	xã	316
11848	xa_hiep_hoa	Xã Hiệp Hoà	xã	316
11851	xa_hung_tien	Xã Hùng Tiến	xã	316
11854	xa_an_hoa	Xã An Hoà	xã	316
11857	xa_tan_hung	Xã Tân Hưng	xã	316
11860	xa_tan_lien	Xã Tân Liên	xã	316
11863	xa_nhan_hoa	Xã Nhân Hoà	xã	316
11866	xa_tam_da	Xã Tam Đa	xã	316
11869	xa_hung_nhan	Xã Hưng Nhân	xã	316
11872	xa_vinh_quang	Xã Vinh Quang	xã	316
11875	xa_dong_minh	Xã Đồng Minh	xã	316
11878	xa_thanh_luong	Xã Thanh Lương	xã	316
11881	xa_lien_am	Xã Liên Am	xã	316
11884	xa_ly_hoc	Xã Lý Học	xã	316
11887	xa_tam_cuong	Xã Tam Cường	xã	316
11890	xa_hoa_binh	Xã Hoà Bình	xã	316
11893	xa_tien_phong	Xã Tiền Phong	xã	316
11896	xa_vinh_phong	Xã Vĩnh Phong	xã	316
11899	xa_cong_hien	Xã Cộng Hiền	xã	316
11902	xa_cao_minh	Xã Cao Minh	xã	316
11905	xa_co_am	Xã Cổ Am	xã	316
11908	xa_vinh_tien	Xã Vĩnh Tiến	xã	316
11911	xa_tran_duong	Xã Trấn Dương	xã	316
11914	thi_tran_cat_ba	Thị trấn Cát Bà	thị trấn	317
11917	thi_tran_cat_hai	Thị trấn Cát Hải	thị trấn	317
11920	xa_nghia_lo	Xã Nghĩa Lộ	xã	317
11923	xa_dong_bai	Xã Đồng Bài	xã	317
11926	xa_hoang_chau	Xã Hoàng Châu	xã	317
11929	xa_van_phong	Xã Văn Phong	xã	317
11932	xa_phu_long	Xã Phù Long	xã	317
11935	xa_gia_luan	Xã Gia Luận	xã	317
11938	xa_hien_hao	Xã Hiền Hào	xã	317
11941	xa_tran_chau	Xã Trân Châu	xã	317
11944	xa_viet_hai	Xã Việt Hải	xã	317
11947	xa_xuan_dam	Xã Xuân Đám	xã	317
11950	phuong_lam_son	Phường Lam Sơn	phường	323
11953	phuong_hien_nam	Phường Hiến Nam	phường	323
11956	phuong_an_tao	Phường An Tảo	phường	323
11959	phuong_le_loi	Phường Lê Lợi	phường	323
11962	phuong_minh_khai	Phường Minh Khai	phường	323
11965	phuong_quang_trung	Phường Quang Trung	phường	323
11968	phuong_hong_chau	Phường Hồng Châu	phường	323
11971	xa_trung_nghia	Xã Trung Nghĩa	xã	323
11974	xa_lien_phuong	Xã Liên Phương	xã	323
11977	xa_hong_nam	Xã Hồng Nam	xã	323
11980	xa_quang_chau	Xã Quảng Châu	xã	323
11983	xa_bao_khe	Xã Bảo Khê	xã	323
12331	xa_phu_cuong	Xã Phú Cường	xã	323
12334	xa_hung_cuong	Xã Hùng Cường	xã	323
12382	xa_phuong_chieu	Xã Phương Chiểu	xã	323
12385	xa_tan_hung	Xã Tân Hưng	xã	323
12388	xa_hoang_hanh	Xã Hoàng Hanh	xã	323
11986	thi_tran_nhu_quynh	Thị trấn Như Quỳnh	thị trấn	325
11989	xa_lac_dao	Xã Lạc Đạo	xã	325
11992	xa_chi_dao	Xã Chỉ Đạo	xã	325
11995	xa_dai_dong	Xã Đại Đồng	xã	325
11998	xa_viet_hung	Xã Việt Hưng	xã	325
12001	xa_tan_quang	Xã Tân Quang	xã	325
12004	xa_dinh_du	Xã Đình Dù	xã	325
12007	xa_minh_hai	Xã Minh Hải	xã	325
12010	xa_luong_tai	Xã Lương Tài	xã	325
12013	xa_trung_trac	Xã Trưng Trắc	xã	325
12016	xa_lac_hong	Xã Lạc Hồng	xã	325
12019	thi_tran_van_giang	Thị trấn Văn Giang	thị trấn	326
12022	xa_xuan_quan	Xã Xuân Quan	xã	326
12025	xa_cuu_cao	Xã Cửu Cao	xã	326
12028	xa_phung_cong	Xã Phụng Công	xã	326
12031	xa_nghia_tru	Xã Nghĩa Trụ	xã	326
12034	xa_long_hung	Xã Long Hưng	xã	326
12037	xa_vinh_khuc	Xã Vĩnh Khúc	xã	326
12040	xa_lien_nghia	Xã Liên Nghĩa	xã	326
12043	xa_tan_tien	Xã Tân Tiến	xã	326
12046	xa_thang_loi	Xã Thắng Lợi	xã	326
12049	xa_me_so	Xã Mễ Sở	xã	326
12052	thi_tran_yen_my	Thị trấn Yên Mỹ	thị trấn	327
12055	xa_giai_pham	Xã Giai Phạm	xã	327
12058	xa_nghia_hiep	Xã Nghĩa Hiệp	xã	327
12061	xa_dong_than	Xã Đồng Than	xã	327
12064	xa_ngoc_long	Xã Ngọc Long	xã	327
12067	xa_lieu_xa	Xã Liêu Xá	xã	327
12070	xa_hoan_long	Xã Hoàn Long	xã	327
12073	xa_tan_lap	Xã Tân Lập	xã	327
12076	xa_thanh_long	Xã Thanh Long	xã	327
12079	xa_yen_phu	Xã Yên Phú	xã	327
12082	xa_viet_cuong	Xã Việt Cường	xã	327
12085	xa_trung_hoa	Xã Trung Hòa	xã	327
12088	xa_yen_hoa	Xã Yên Hòa	xã	327
12091	xa_minh_chau	Xã Minh Châu	xã	327
12094	xa_trung_hung	Xã Trung Hưng	xã	327
12097	xa_ly_thuong_kiet	Xã Lý Thường Kiệt	xã	327
12100	xa_tan_viet	Xã Tân Việt	xã	327
12103	phuong_ban_yen_nhan	Phường Bần Yên Nhân	phường	328
12106	phuong_phan_dinh_phung	Phường Phan Đình Phùng	phường	328
12109	xa_cam_xa	Xã Cẩm Xá	xã	328
12112	xa_duong_quang	Xã Dương Quang	xã	328
12115	xa_hoa_phong	Xã Hòa Phong	xã	328
12118	phuong_nhan_hoa	Phường Nhân Hòa	phường	328
12121	phuong_di_su	Phường Dị Sử	phường	328
12124	phuong_bach_sam	Phường Bạch Sam	phường	328
12127	phuong_minh_duc	Phường Minh Đức	phường	328
12130	phuong_phung_chi_kien	Phường Phùng Chí Kiên	phường	328
12133	xa_xuan_duc	Xã Xuân Dục	xã	328
12136	xa_ngoc_lam	Xã Ngọc Lâm	xã	328
12139	xa_hung_long	Xã Hưng Long	xã	328
12142	thi_tran_an_thi	Thị trấn Ân Thi	thị trấn	329
12145	xa_phu_ung	Xã Phù Ủng	xã	329
12148	xa_bac_son	Xã Bắc Sơn	xã	329
12151	xa_bai_say	Xã Bãi Sậy	xã	329
12154	xa_dao_duong	Xã Đào Dương	xã	329
12157	xa_tan_phuc	Xã Tân Phúc	xã	329
12160	xa_van_du	Xã Vân Du	xã	329
12163	xa_quang_vinh	Xã Quang Vinh	xã	329
12166	xa_xuan_truc	Xã Xuân Trúc	xã	329
12169	xa_hoang_hoa_tham	Xã Hoàng Hoa Thám	xã	329
12172	xa_quang_lang	Xã Quảng Lãng	xã	329
12175	xa_van_nhue	Xã Văn Nhuệ	xã	329
12178	xa_dang_le	Xã Đặng Lễ	xã	329
12181	xa_cam_ninh	Xã Cẩm Ninh	xã	329
12184	xa_nguyen_trai	Xã Nguyễn Trãi	xã	329
12187	xa_da_loc	Xã Đa Lộc	xã	329
12190	xa_ho_tung_mau	Xã Hồ Tùng Mậu	xã	329
12193	xa_tien_phong	Xã Tiền Phong	xã	329
12196	xa_hong_van	Xã Hồng Vân	xã	329
12199	xa_hong_quang	Xã Hồng Quang	xã	329
12202	xa_ha_le	Xã Hạ Lễ	xã	329
12205	thi_tran_khoai_chau	Thị trấn Khoái Châu	thị trấn	330
12208	xa_dong_tao	Xã Đông Tảo	xã	330
12211	xa_binh_minh	Xã Bình Minh	xã	330
12214	xa_da_trach	Xã Dạ Trạch	xã	330
12217	xa_ham_tu	Xã Hàm Tử	xã	330
12220	xa_ong_dinh	Xã Ông Đình	xã	330
12223	xa_tan_dan	Xã Tân Dân	xã	330
12226	xa_tu_dan	Xã Tứ Dân	xã	330
12229	xa_an_vi	Xã An Vĩ	xã	330
12232	xa_dong_ket	Xã Đông Kết	xã	330
12235	xa_binh_kieu	Xã Bình Kiều	xã	330
12238	xa_dan_tien	Xã Dân Tiến	xã	330
12241	xa_dong_tien	Xã Đồng Tiến	xã	330
12244	xa_hong_tien	Xã Hồng Tiến	xã	330
12247	xa_tan_chau	Xã Tân Châu	xã	330
12250	xa_lien_khe	Xã Liên Khê	xã	330
12253	xa_phung_hung	Xã Phùng Hưng	xã	330
12256	xa_viet_hoa	Xã Việt Hòa	xã	330
12259	xa_dong_ninh	Xã Đông Ninh	xã	330
12262	xa_dai_tap	Xã Đại Tập	xã	330
12265	xa_chi_tan	Xã Chí Tân	xã	330
12268	xa_dai_hung	Xã Đại Hưng	xã	330
12271	xa_thuan_hung	Xã Thuần Hưng	xã	330
12274	xa_thanh_cong	Xã Thành Công	xã	330
12277	xa_nhue_duong	Xã Nhuế Dương	xã	330
12280	thi_tran_luong_bang	Thị trấn Lương Bằng	thị trấn	331
12283	xa_nghia_dan	Xã Nghĩa Dân	xã	331
12286	xa_toan_thang	Xã Toàn Thắng	xã	331
12289	xa_vinh_xa	Xã Vĩnh Xá	xã	331
12292	xa_pham_ngu_lao	Xã Phạm Ngũ Lão	xã	331
12295	xa_tho_vinh	Xã Thọ Vinh	xã	331
12298	xa_dong_thanh	Xã Đồng Thanh	xã	331
12301	xa_song_mai	Xã Song Mai	xã	331
12304	xa_chinh_nghia	Xã Chính Nghĩa	xã	331
12307	xa_nhan_la	Xã Nhân La	xã	331
12310	xa_phu_thinh	Xã Phú Thịnh	xã	331
12313	xa_mai_dong	Xã Mai Động	xã	331
12316	xa_duc_hop	Xã Đức Hợp	xã	331
12319	xa_hung_an	Xã Hùng An	xã	331
12322	xa_ngoc_thanh	Xã Ngọc Thanh	xã	331
12325	xa_vu_xa	Xã Vũ Xá	xã	331
12328	xa_hiep_cuong	Xã Hiệp Cường	xã	331
12337	thi_tran_vuong	Thị trấn Vương	thị trấn	332
12340	xa_hung_dao	Xã Hưng Đạo	xã	332
12343	xa_ngo_quyen	Xã Ngô Quyền	xã	332
12346	xa_nhat_tan	Xã Nhật Tân	xã	332
12349	xa_di_che	Xã Dị Chế	xã	332
12352	xa_le_xa	Xã Lệ Xá	xã	332
12355	xa_an_vien	Xã An Viên	xã	332
12358	xa_duc_thang	Xã Đức Thắng	xã	332
12361	xa_trung_dung	Xã Trung Dũng	xã	332
12364	xa_hai_trieu	Xã Hải Triều	xã	332
12367	xa_thu_sy	Xã Thủ Sỹ	xã	332
12370	xa_thien_phien	Xã Thiện Phiến	xã	332
12373	xa_thuy_loi	Xã Thụy Lôi	xã	332
12376	xa_cuong_chinh	Xã Cương Chính	xã	332
12379	xa_minh_phuong	Xã Minh Phượng	xã	332
12391	thi_tran_tran_cao	Thị trấn Trần Cao	thị trấn	333
12394	xa_minh_tan	Xã Minh Tân	xã	333
12397	xa_phan_sao_nam	Xã Phan Sào Nam	xã	333
12400	xa_quang_hung	Xã Quang Hưng	xã	333
12403	xa_minh_hoang	Xã Minh Hoàng	xã	333
12406	xa_doan_dao	Xã Đoàn Đào	xã	333
12409	xa_tong_phan	Xã Tống Phan	xã	333
12412	xa_dinh_cao	Xã Đình Cao	xã	333
12415	xa_nhat_quang	Xã Nhật Quang	xã	333
12418	xa_tien_tien	Xã Tiền Tiến	xã	333
12421	xa_tam_da	Xã Tam Đa	xã	333
12424	xa_minh_tien	Xã Minh Tiến	xã	333
12427	xa_nguyen_hoa	Xã Nguyên Hòa	xã	333
12430	xa_tong_tran	Xã Tống Trân	xã	333
12433	phuong_le_hong_phong	Phường Lê Hồng Phong	phường	336
12436	phuong_bo_xuyen	Phường Bồ Xuyên	phường	336
12439	phuong_de_tham	Phường Đề Thám	phường	336
12442	phuong_ky_ba	Phường Kỳ Bá	phường	336
12445	phuong_quang_trung	Phường Quang Trung	phường	336
12448	phuong_phu_khanh	Phường Phú Khánh	phường	336
12451	phuong_tien_phong	Phường Tiền Phong	phường	336
12452	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	336
12454	phuong_tran_lam	Phường Trần Lãm	phường	336
12457	xa_dong_hoa	Xã Đông Hòa	xã	336
12460	phuong_hoang_dieu	Phường Hoàng Diệu	phường	336
12463	xa_phu_xuan	Xã Phú Xuân	xã	336
12466	xa_vu_phuc	Xã Vũ Phúc	xã	336
12469	xa_vu_chinh	Xã Vũ Chính	xã	336
12817	xa_dong_my	Xã Đông Mỹ	xã	336
12820	xa_dong_tho	Xã Đông Thọ	xã	336
13084	xa_vu_dong	Xã Vũ Đông	xã	336
13108	xa_vu_lac	Xã Vũ Lạc	xã	336
13225	xa_tan_binh	Xã Tân Bình	xã	336
12472	thi_tran_quynh_coi	Thị trấn Quỳnh Côi	thị trấn	338
12475	xa_an_khe	Xã An Khê	xã	338
12478	xa_an_dong	Xã An Đồng	xã	338
12481	xa_quynh_hoa	Xã Quỳnh Hoa	xã	338
12484	xa_quynh_lam	Xã Quỳnh Lâm	xã	338
12487	xa_quynh_tho	Xã Quỳnh Thọ	xã	338
12490	xa_an_hiep	Xã An Hiệp	xã	338
12493	xa_quynh_hoang	Xã Quỳnh Hoàng	xã	338
12496	xa_quynh_giao	Xã Quỳnh Giao	xã	338
12499	xa_an_thai	Xã An Thái	xã	338
12502	xa_an_cau	Xã An Cầu	xã	338
12505	xa_quynh_hong	Xã Quỳnh Hồng	xã	338
12508	xa_quynh_khe	Xã Quỳnh Khê	xã	338
12511	xa_quynh_minh	Xã Quỳnh Minh	xã	338
12514	xa_an_ninh	Xã An Ninh	xã	338
12517	xa_quynh_ngoc	Xã Quỳnh Ngọc	xã	338
12520	xa_quynh_hai	Xã Quỳnh Hải	xã	338
12523	thi_tran_an_bai	Thị trấn An Bài	thị trấn	338
12526	xa_an_ap	Xã An Ấp	xã	338
12529	xa_quynh_hoi	Xã Quỳnh Hội	xã	338
12532	xa_chau_son	Xã Châu Sơn	xã	338
12535	xa_quynh_my	Xã Quỳnh Mỹ	xã	338
12538	xa_an_qui	Xã An Quí	xã	338
12541	xa_an_thanh	Xã An Thanh	xã	338
12547	xa_an_vu	Xã An Vũ	xã	338
12550	xa_an_le	Xã An Lễ	xã	338
12553	xa_quynh_hung	Xã Quỳnh Hưng	xã	338
12556	xa_quynh_bao	Xã Quỳnh Bảo	xã	338
12559	xa_an_my	Xã An Mỹ	xã	338
12562	xa_quynh_nguyen	Xã Quỳnh Nguyên	xã	338
12565	xa_an_vinh	Xã An Vinh	xã	338
12568	xa_quynh_xa	Xã Quỳnh Xá	xã	338
12571	xa_an_duc	Xã An Dục	xã	338
12574	xa_dong_hai	Xã Đông Hải	xã	338
12577	xa_quynh_trang	Xã Quỳnh Trang	xã	338
12580	xa_an_trang	Xã An Tràng	xã	338
12583	xa_dong_tien	Xã Đồng Tiến	xã	338
12586	thi_tran_hung_ha	Thị trấn Hưng Hà	thị trấn	339
12589	xa_diep_nong	Xã Điệp Nông	xã	339
12592	xa_tan_le	Xã Tân Lễ	xã	339
12595	xa_cong_hoa	Xã Cộng Hòa	xã	339
12598	xa_dan_chu	Xã Dân Chủ	xã	339
12601	xa_canh_tan	Xã Canh Tân	xã	339
12604	xa_hoa_tien	Xã Hòa Tiến	xã	339
12607	xa_hung_dung	Xã Hùng Dũng	xã	339
12610	xa_tan_tien	Xã Tân Tiến	xã	339
12613	thi_tran_hung_nhan	Thị trấn Hưng Nhân	thị trấn	339
12616	xa_doan_hung	Xã Đoan Hùng	xã	339
12619	xa_duyen_hai	Xã Duyên Hải	xã	339
12622	xa_tan_hoa	Xã Tân Hòa	xã	339
12625	xa_van_cam	Xã Văn Cẩm	xã	339
12628	xa_bac_son	Xã Bắc Sơn	xã	339
12631	xa_dong_do	Xã Đông Đô	xã	339
12634	xa_phuc_khanh	Xã Phúc Khánh	xã	339
12637	xa_lien_hiep	Xã Liên Hiệp	xã	339
12640	xa_tay_do	Xã Tây Đô	xã	339
12643	xa_thong_nhat	Xã Thống Nhất	xã	339
12646	xa_tien_duc	Xã Tiến Đức	xã	339
12649	xa_thai_hung	Xã Thái Hưng	xã	339
12652	xa_thai_phuong	Xã Thái Phương	xã	339
12655	xa_hoa_binh	Xã Hòa Bình	xã	339
12656	xa_chi_lang	Xã Chi Lăng	xã	339
12658	xa_minh_khai	Xã Minh Khai	xã	339
12661	xa_hong_an	Xã Hồng An	xã	339
12664	xa_kim_chung	Xã Kim Chung	xã	339
12667	xa_hong_linh	Xã Hồng Lĩnh	xã	339
12670	xa_minh_tan	Xã Minh Tân	xã	339
12673	xa_van_lang	Xã Văn Lang	xã	339
12676	xa_doc_lap	Xã Độc Lập	xã	339
12679	xa_chi_hoa	Xã Chí Hòa	xã	339
12682	xa_minh_hoa	Xã Minh Hòa	xã	339
12685	xa_hong_minh	Xã Hồng Minh	xã	339
12688	thi_tran_dong_hung	Thị trấn Đông Hưng	thị trấn	340
12691	xa_do_luong	Xã Đô Lương	xã	340
12694	xa_dong_phuong	Xã Đông Phương	xã	340
12697	xa_lien_giang	Xã Liên Giang	xã	340
12700	xa_an_chau	Xã An Châu	xã	340
12703	xa_dong_son	Xã Đông Sơn	xã	340
12706	xa_dong_cuong	Xã Đông Cường	xã	340
12709	xa_phu_luong	Xã Phú Lương	xã	340
12712	xa_me_linh	Xã Mê Linh	xã	340
12715	xa_lo_giang	Xã Lô Giang	xã	340
12718	xa_dong_la	Xã Đông La	xã	340
12721	xa_minh_tan	Xã Minh Tân	xã	340
12724	xa_dong_xa	Xã Đông Xá	xã	340
12727	xa_chuong_duong	Xã Chương Dương	xã	340
12730	xa_nguyen_xa	Xã Nguyên Xá	xã	340
12733	xa_phong_chau	Xã Phong Châu	xã	340
12736	xa_hop_tien	Xã Hợp Tiến	xã	340
12739	xa_hong_viet	Xã Hồng Việt	xã	340
12745	xa_ha_giang	Xã Hà Giang	xã	340
12748	xa_dong_kinh	Xã Đông Kinh	xã	340
12751	xa_dong_hop	Xã Đông Hợp	xã	340
12754	xa_thang_long	Xã Thăng Long	xã	340
12757	xa_dong_cac	Xã Đông Các	xã	340
12760	xa_phu_chau	Xã Phú Châu	xã	340
12763	xa_lien_hoa	Xã Liên Hoa	xã	340
12769	xa_dong_tan	Xã Đông Tân	xã	340
12772	xa_dong_vinh	Xã Đông Vinh	xã	340
12775	xa_dong_dong	Xã Đông Động	xã	340
12778	xa_hong_bach	Xã Hồng Bạch	xã	340
12784	xa_trong_quan	Xã Trọng Quan	xã	340
12790	xa_hong_giang	Xã Hồng Giang	xã	340
12793	xa_dong_quan	Xã Đông Quan	xã	340
12796	xa_dong_quang	Xã Đông Quang	xã	340
12799	xa_dong_xuan	Xã Đông Xuân	xã	340
12802	xa_dong_a	Xã Đông Á	xã	340
12808	xa_dong_hoang	Xã Đông Hoàng	xã	340
12811	xa_dong_duong	Xã Đông Dương	xã	340
12823	xa_minh_phu	Xã Minh Phú	xã	340
12826	thi_tran_diem_dien	Thị trấn Diêm Điền	thị trấn	341
12832	xa_thuy_truong	Xã Thụy Trường	xã	341
12841	xa_hong_dung	Xã Hồng Dũng	xã	341
12844	xa_thuy_quynh	Xã Thụy Quỳnh	xã	341
12847	xa_an_tan	Xã An Tân	xã	341
12850	xa_thuy_ninh	Xã Thụy Ninh	xã	341
12853	xa_thuy_hung	Xã Thụy Hưng	xã	341
12856	xa_thuy_viet	Xã Thụy Việt	xã	341
12859	xa_thuy_van	Xã Thụy Văn	xã	341
12862	xa_thuy_xuan	Xã Thụy Xuân	xã	341
12865	xa_duong_phuc	Xã Dương Phúc	xã	341
12868	xa_thuy_trinh	Xã Thụy Trình	xã	341
12871	xa_thuy_binh	Xã Thụy Bình	xã	341
12874	xa_thuy_chinh	Xã Thụy Chính	xã	341
12877	xa_thuy_dan	Xã Thụy Dân	xã	341
12880	xa_thuy_hai	Xã Thụy Hải	xã	341
12889	xa_thuy_lien	Xã Thụy Liên	xã	341
12892	xa_thuy_duyen	Xã Thụy Duyên	xã	341
12898	xa_thuy_thanh	Xã Thụy Thanh	xã	341
12901	xa_thuy_son	Xã Thụy Sơn	xã	341
12904	xa_thuy_phong	Xã Thụy Phong	xã	341
12907	xa_thai_thuong	Xã Thái Thượng	xã	341
12910	xa_thai_nguyen	Xã Thái Nguyên	xã	341
12916	xa_duong_hong_thuy	Xã Dương Hồng Thủy	xã	341
12919	xa_thai_giang	Xã Thái Giang	xã	341
12922	xa_hoa_an	Xã Hòa An	xã	341
12925	xa_son_ha	Xã Sơn Hà	xã	341
12934	xa_thai_phuc	Xã Thái Phúc	xã	341
12937	xa_thai_hung	Xã Thái Hưng	xã	341
12940	xa_thai_do	Xã Thái Đô	xã	341
12943	xa_thai_xuyen	Xã Thái Xuyên	xã	341
12949	xa_my_loc	Xã Mỹ Lộc	xã	341
12958	xa_tan_hoc	Xã Tân Học	xã	341
12961	xa_thai_thinh	Xã Thái Thịnh	xã	341
12964	xa_thuan_thanh	Xã Thuần Thành	xã	341
12967	xa_thai_tho	Xã Thái Thọ	xã	341
12970	thi_tran_tien_hai	Thị trấn Tiền Hải	thị trấn	342
12976	xa_dong_tra	Xã Đông Trà	xã	342
12979	xa_dong_long	Xã Đông Long	xã	342
12982	xa_dong_qui	Xã Đông Quí	xã	342
12985	xa_vu_lang	Xã Vũ Lăng	xã	342
12988	xa_dong_xuyen	Xã Đông Xuyên	xã	342
12991	xa_tay_luong	Xã Tây Lương	xã	342
12994	xa_tay_ninh	Xã Tây Ninh	xã	342
12997	xa_dong_trung	Xã Đông Trung	xã	342
13000	xa_dong_hoang	Xã Đông Hoàng	xã	342
13003	xa_dong_minh	Xã Đông Minh	xã	342
13009	xa_dong_phong	Xã Đông Phong	xã	342
13012	xa_an_ninh	Xã An Ninh	xã	342
13018	xa_dong_co	Xã Đông Cơ	xã	342
13021	xa_tay_giang	Xã Tây Giang	xã	342
13024	xa_dong_lam	Xã Đông Lâm	xã	342
13027	xa_phuong_cong	Xã Phương Công	xã	342
13030	xa_tay_phong	Xã Tây Phong	xã	342
13033	xa_tay_tien	Xã Tây Tiến	xã	342
13036	xa_nam_cuong	Xã Nam Cường	xã	342
13039	xa_van_truong	Xã Vân Trường	xã	342
13042	xa_nam_thang	Xã Nam Thắng	xã	342
13045	xa_nam_chinh	Xã Nam Chính	xã	342
13048	xa_bac_hai	Xã Bắc Hải	xã	342
13051	xa_nam_thinh	Xã Nam Thịnh	xã	342
13054	xa_nam_ha	Xã Nam Hà	xã	342
13057	xa_nam_thanh	Xã Nam Thanh	xã	342
13060	xa_nam_trung	Xã Nam Trung	xã	342
13063	xa_nam_hong	Xã Nam Hồng	xã	342
13066	xa_nam_hung	Xã Nam Hưng	xã	342
13069	xa_nam_hai	Xã Nam Hải	xã	342
13072	xa_nam_phu	Xã Nam Phú	xã	342
13075	thi_tran_kien_xuong	Thị trấn Kiến Xương	thị trấn	343
13078	xa_tra_giang	Xã Trà Giang	xã	343
13081	xa_quoc_tuan	Xã Quốc Tuấn	xã	343
13087	xa_an_binh	Xã An Bình	xã	343
13090	xa_tay_son	Xã Tây Sơn	xã	343
13093	xa_hong_thai	Xã Hồng Thái	xã	343
13096	xa_binh_nguyen	Xã Bình Nguyên	xã	343
13102	xa_le_loi	Xã Lê Lợi	xã	343
13111	xa_vu_le	Xã Vũ Lễ	xã	343
13114	xa_thanh_tan	Xã Thanh Tân	xã	343
13117	xa_thuong_hien	Xã Thượng Hiền	xã	343
13120	xa_nam_cao	Xã Nam Cao	xã	343
13123	xa_dinh_phung	Xã Đình Phùng	xã	343
13126	xa_vu_ninh	Xã Vũ Ninh	xã	343
13129	xa_vu_an	Xã Vũ An	xã	343
13132	xa_quang_lich	Xã Quang Lịch	xã	343
13135	xa_hoa_binh	Xã Hòa Bình	xã	343
13138	xa_binh_minh	Xã Bình Minh	xã	343
13141	xa_vu_qui	Xã Vũ Quí	xã	343
13144	xa_quang_binh	Xã Quang Bình	xã	343
13150	xa_vu_trung	Xã Vũ Trung	xã	343
13153	xa_vu_thang	Xã Vũ Thắng	xã	343
13156	xa_vu_cong	Xã Vũ Công	xã	343
13159	xa_vu_hoa	Xã Vũ Hòa	xã	343
13162	xa_quang_minh	Xã Quang Minh	xã	343
13165	xa_quang_trung	Xã Quang Trung	xã	343
13171	xa_minh_quang	Xã Minh Quang	xã	343
13174	xa_vu_binh	Xã Vũ Bình	xã	343
13177	xa_minh_tan	Xã Minh Tân	xã	343
13180	xa_nam_binh	Xã Nam Bình	xã	343
13183	xa_binh_thanh	Xã Bình Thanh	xã	343
13186	xa_binh_dinh	Xã Bình Định	xã	343
13189	xa_hong_tien	Xã Hồng Tiến	xã	343
13192	thi_tran_vu_thu	Thị trấn Vũ Thư	thị trấn	344
13195	xa_hong_ly	Xã Hồng Lý	xã	344
13198	xa_dong_thanh	Xã Đồng Thanh	xã	344
13201	xa_xuan_hoa	Xã Xuân Hòa	xã	344
13204	xa_hiep_hoa	Xã Hiệp Hòa	xã	344
13207	xa_phuc_thanh	Xã Phúc Thành	xã	344
13210	xa_tan_phong	Xã Tân Phong	xã	344
13213	xa_song_lang	Xã Song Lãng	xã	344
13216	xa_tan_hoa	Xã Tân Hòa	xã	344
13219	xa_viet_hung	Xã Việt Hùng	xã	344
13222	xa_minh_lang	Xã Minh Lãng	xã	344
13228	xa_minh_khai	Xã Minh Khai	xã	344
13231	xa_dung_nghia	Xã Dũng Nghĩa	xã	344
13234	xa_minh_quang	Xã Minh Quang	xã	344
13237	xa_tam_quang	Xã Tam Quang	xã	344
13240	xa_tan_lap	Xã Tân Lập	xã	344
13243	xa_bach_thuan	Xã Bách Thuận	xã	344
13246	xa_tu_tan	Xã Tự Tân	xã	344
13249	xa_song_an	Xã Song An	xã	344
13252	xa_trung_an	Xã Trung An	xã	344
13255	xa_vu_hoi	Xã Vũ Hội	xã	344
13258	xa_hoa_binh	Xã Hòa Bình	xã	344
13261	xa_nguyen_xa	Xã Nguyên Xá	xã	344
13264	xa_viet_thuan	Xã Việt Thuận	xã	344
13267	xa_vu_vinh	Xã Vũ Vinh	xã	344
13270	xa_vu_doai	Xã Vũ Đoài	xã	344
13273	xa_vu_tien	Xã Vũ Tiến	xã	344
13276	xa_vu_van	Xã Vũ Vân	xã	344
13279	xa_duy_nhat	Xã Duy Nhất	xã	344
13282	xa_hong_phong	Xã Hồng Phong	xã	344
13285	phuong_quang_trung	Phường Quang Trung	phường	347
13288	phuong_luong_khanh_thien	Phường Lương Khánh Thiện	phường	347
13291	phuong_le_hong_phong	Phường Lê Hồng Phong	phường	347
13294	phuong_minh_khai	Phường Minh Khai	phường	347
13297	phuong_hai_ba_trung	Phường Hai Bà Trưng	phường	347
13300	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	347
13303	phuong_lam_ha	Phường Lam Hạ	phường	347
13306	xa_phu_van	Xã Phù Vân	xã	347
13309	phuong_liem_chinh	Phường Liêm Chính	phường	347
13312	xa_liem_chung	Xã Liêm Chung	xã	347
13315	phuong_thanh_chau	Phường Thanh Châu	phường	347
13318	phuong_chau_son	Phường Châu Sơn	phường	347
13366	xa_tien_tan	Xã Tiên Tân	xã	347
13372	xa_tien_hiep	Xã Tiên Hiệp	xã	347
13381	xa_tien_hai	Xã Tiên Hải	xã	347
13426	xa_kim_binh	Xã Kim Bình	xã	347
13444	xa_liem_tuyen	Xã Liêm Tuyền	xã	347
13447	xa_liem_tiet	Xã Liêm Tiết	xã	347
13459	phuong_thanh_tuyen	Phường Thanh Tuyền	phường	347
13507	xa_dinh_xa	Xã Đinh Xá	xã	347
13513	xa_trinh_xa	Xã Trịnh Xá	xã	347
13321	phuong_dong_van	Phường Đồng Văn	phường	349
13324	phuong_hoa_mac	Phường Hòa Mạc	phường	349
13327	xa_moc_bac	Xã Mộc Bắc	xã	349
13330	phuong_chau_giang	Phường Châu Giang	phường	349
13333	phuong_bach_thuong	Phường Bạch Thượng	phường	349
13336	phuong_duy_minh	Phường Duy Minh	phường	349
13339	xa_moc_nam	Xã Mộc Nam	xã	349
13342	phuong_duy_hai	Phường Duy Hải	phường	349
13345	xa_chuyen_ngoai	Xã Chuyên Ngoại	xã	349
13348	phuong_yen_bac	Phường Yên Bắc	phường	349
13351	xa_trac_van	Xã Trác Văn	xã	349
13354	phuong_tien_noi	Phường Tiên Nội	phường	349
13357	phuong_hoang_dong	Phường Hoàng Đông	phường	349
13360	xa_yen_nam	Xã Yên Nam	xã	349
13363	xa_tien_ngoai	Xã Tiên Ngoại	xã	349
13369	xa_tien_son	Xã Tiên Sơn	xã	349
13384	thi_tran_que	Thị trấn Quế	thị trấn	350
13387	xa_nguyen_uy	Xã Nguyễn Úy	xã	350
13390	xa_dai_cuong	Xã Đại Cương	xã	350
13393	xa_le_ho	Xã Lê Hồ	xã	350
13396	xa_tuong_linh	Xã Tượng Lĩnh	xã	350
13399	xa_nhat_tuu	Xã Nhật Tựu	xã	350
13402	xa_nhat_tan	Xã Nhật Tân	xã	350
13405	xa_dong_hoa	Xã Đồng Hóa	xã	350
13408	xa_hoang_tay	Xã Hoàng Tây	xã	350
13411	xa_tan_son	Xã Tân Sơn	xã	350
13414	xa_thuy_loi	Xã Thụy Lôi	xã	350
13417	xa_van_xa	Xã Văn Xá	xã	350
13420	xa_kha_phong	Xã Khả Phong	xã	350
13423	xa_ngoc_son	Xã Ngọc Sơn	xã	350
13429	thi_tran_ba_sao	Thị trấn Ba Sao	thị trấn	350
13432	xa_lien_son	Xã Liên Sơn	xã	350
13435	xa_thi_son	Xã Thi Sơn	xã	350
13438	xa_thanh_son	Xã Thanh Sơn	xã	350
13441	thi_tran_kien_khe	Thị trấn Kiện Khê	thị trấn	351
13450	xa_liem_phong	Xã Liêm Phong	xã	351
13453	xa_thanh_ha	Xã Thanh Hà	xã	351
13456	xa_liem_can	Xã Liêm Cần	xã	351
13465	xa_liem_thuan	Xã Liêm Thuận	xã	351
13468	xa_thanh_thuy	Xã Thanh Thủy	xã	351
13471	xa_thanh_phong	Xã Thanh Phong	xã	351
13474	thi_tran_tan_thanh	Thị trấn Tân Thanh	thị trấn	351
13477	xa_thanh_tan	Xã Thanh Tân	xã	351
13480	xa_liem_tuc	Xã Liêm Túc	xã	351
13483	xa_liem_son	Xã Liêm Sơn	xã	351
13486	xa_thanh_huong	Xã Thanh Hương	xã	351
13489	xa_thanh_nghi	Xã Thanh Nghị	xã	351
13492	xa_thanh_tam	Xã Thanh Tâm	xã	351
13495	xa_thanh_nguyen	Xã Thanh Nguyên	xã	351
13498	xa_thanh_hai	Xã Thanh Hải	xã	351
13501	thi_tran_binh_my	Thị trấn Bình Mỹ	thị trấn	352
13504	xa_binh_nghia	Xã Bình Nghĩa	xã	352
13510	xa_trang_an	Xã Tràng An	xã	352
13516	xa_dong_du	Xã Đồng Du	xã	352
13519	xa_ngoc_lu	Xã Ngọc Lũ	xã	352
13522	xa_hung_cong	Xã Hưng Công	xã	352
13525	xa_don_xa	Xã Đồn Xá	xã	352
13528	xa_an_ninh	Xã An Ninh	xã	352
13531	xa_bo_de	Xã Bồ Đề	xã	352
13534	xa_boi_cau	Xã Bối Cầu	xã	352
13540	xa_an_noi	Xã An Nội	xã	352
13543	xa_vu_ban	Xã Vũ Bản	xã	352
13546	xa_trung_luong	Xã Trung Lương	xã	352
13552	xa_an_do	Xã An Đổ	xã	352
13555	xa_la_son	Xã La Sơn	xã	352
13558	xa_tieu_dong	Xã Tiêu Động	xã	352
13561	xa_an_lao	Xã An Lão	xã	352
13567	xa_hop_ly	Xã Hợp Lý	xã	353
13570	xa_nguyen_ly	Xã Nguyên Lý	xã	353
13573	xa_chinh_ly	Xã Chính Lý	xã	353
13576	xa_chan_ly	Xã Chân Lý	xã	353
13579	xa_dao_ly	Xã Đạo Lý	xã	353
13582	xa_cong_ly	Xã Công Lý	xã	353
13585	xa_van_ly	Xã Văn Lý	xã	353
13588	xa_bac_ly	Xã Bắc Lý	xã	353
13591	xa_duc_ly	Xã Đức Lý	xã	353
13594	xa_tran_hung_dao	Xã Trần Hưng Đạo	xã	353
13597	thi_tran_vinh_tru	Thị trấn Vĩnh Trụ	thị trấn	353
13600	xa_nhan_thinh	Xã Nhân Thịnh	xã	353
13606	xa_nhan_khang	Xã Nhân Khang	xã	353
13609	xa_nhan_my	Xã Nhân Mỹ	xã	353
13612	xa_nhan_nghia	Xã Nhân Nghĩa	xã	353
13615	xa_nhan_chinh	Xã Nhân Chính	xã	353
13618	xa_nhan_binh	Xã Nhân Bình	xã	353
13621	xa_phu_phuc	Xã Phú Phúc	xã	353
13624	xa_xuan_khe	Xã Xuân Khê	xã	353
13627	xa_tien_thang	Xã Tiến Thắng	xã	353
13630	xa_hoa_hau	Xã Hòa Hậu	xã	353
13633	phuong_ha_long	Phường Hạ Long	phường	356
13636	phuong_tran_te_xuong	Phường Trần Tế Xương	phường	356
13639	phuong_vi_hoang	Phường Vị Hoàng	phường	356
13642	phuong_vi_xuyen	Phường Vị Xuyên	phường	356
13645	phuong_quang_trung	Phường Quang Trung	phường	356
13648	phuong_cua_bac	Phường Cửa Bắc	phường	356
13651	phuong_nguyen_du	Phường Nguyễn Du	phường	356
13654	phuong_ba_trieu	Phường Bà Triệu	phường	356
13657	phuong_truong_thi	Phường Trường Thi	phường	356
13660	phuong_phan_dinh_phung	Phường Phan Đình Phùng	phường	356
13663	phuong_ngo_quyen	Phường Ngô Quyền	phường	356
13666	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	356
13669	phuong_tran_dang_ninh	Phường Trần Đăng Ninh	phường	356
13672	phuong_nang_tinh	Phường Năng Tĩnh	phường	356
13675	phuong_van_mieu	Phường Văn Miếu	phường	356
13678	phuong_tran_quang_khai	Phường Trần Quang Khải	phường	356
13681	phuong_thong_nhat	Phường Thống Nhất	phường	356
13684	phuong_loc_ha	Phường Lộc Hạ	phường	356
13687	phuong_loc_vuong	Phường Lộc Vượng	phường	356
13690	phuong_cua_nam	Phường Cửa Nam	phường	356
13693	phuong_loc_hoa	Phường Lộc Hòa	phường	356
13696	xa_nam_phong	Xã Nam Phong	xã	356
13699	phuong_my_xa	Phường Mỹ Xá	phường	356
13702	xa_loc_an	Xã Lộc An	xã	356
13705	xa_nam_van	Xã Nam Vân	xã	356
13708	thi_tran_my_loc	Thị trấn Mỹ Lộc	thị trấn	358
13711	xa_my_ha	Xã Mỹ Hà	xã	358
13714	xa_my_tien	Xã Mỹ Tiến	xã	358
13717	xa_my_thang	Xã Mỹ Thắng	xã	358
13720	xa_my_trung	Xã Mỹ Trung	xã	358
13723	xa_my_tan	Xã Mỹ Tân	xã	358
13726	xa_my_phuc	Xã Mỹ Phúc	xã	358
13729	xa_my_hung	Xã Mỹ Hưng	xã	358
13732	xa_my_thuan	Xã Mỹ Thuận	xã	358
13735	xa_my_thinh	Xã Mỹ Thịnh	xã	358
13738	xa_my_thanh	Xã Mỹ Thành	xã	358
13741	thi_tran_goi	Thị trấn Gôi	thị trấn	359
13744	xa_minh_thuan	Xã Minh Thuận	xã	359
13747	xa_hien_khanh	Xã Hiển Khánh	xã	359
13750	xa_tan_khanh	Xã Tân Khánh	xã	359
13753	xa_hop_hung	Xã Hợp Hưng	xã	359
13756	xa_dai_an	Xã Đại An	xã	359
13759	xa_tan_thanh	Xã Tân Thành	xã	359
13762	xa_cong_hoa	Xã Cộng Hòa	xã	359
13765	xa_trung_thanh	Xã Trung Thành	xã	359
13768	xa_quang_trung	Xã Quang Trung	xã	359
13771	xa_minh_tan	Xã Minh Tân	xã	359
13774	xa_lien_bao	Xã Liên Bảo	xã	359
13777	xa_thanh_loi	Xã Thành Lợi	xã	359
13780	xa_kim_thai	Xã Kim Thái	xã	359
13783	xa_lien_minh	Xã Liên Minh	xã	359
13786	xa_dai_thang	Xã Đại Thắng	xã	359
13789	xa_tam_thanh	Xã Tam Thanh	xã	359
13792	xa_vinh_hao	Xã Vĩnh Hào	xã	359
13795	thi_tran_lam	Thị trấn Lâm	thị trấn	360
13798	xa_yen_trung	Xã Yên Trung	xã	360
13801	xa_yen_thanh	Xã Yên Thành	xã	360
13804	xa_yen_tan	Xã Yên Tân	xã	360
13807	xa_yen_loi	Xã Yên Lợi	xã	360
13810	xa_yen_tho	Xã Yên Thọ	xã	360
13813	xa_yen_nghia	Xã Yên Nghĩa	xã	360
13816	xa_yen_minh	Xã Yên Minh	xã	360
13819	xa_yen_phuong	Xã Yên Phương	xã	360
13822	xa_yen_chinh	Xã Yên Chính	xã	360
13825	xa_yen_binh	Xã Yên Bình	xã	360
13828	xa_yen_phu	Xã Yên Phú	xã	360
13831	xa_yen_my	Xã Yên Mỹ	xã	360
13834	xa_yen_duong	Xã Yên Dương	xã	360
13840	xa_yen_hung	Xã Yên Hưng	xã	360
13843	xa_yen_khanh	Xã Yên Khánh	xã	360
13846	xa_yen_phong	Xã Yên Phong	xã	360
13849	xa_yen_ninh	Xã Yên Ninh	xã	360
13852	xa_yen_luong	Xã Yên Lương	xã	360
13855	xa_yen_hong	Xã Yên Hồng	xã	360
13858	xa_yen_quang	Xã Yên Quang	xã	360
13861	xa_yen_tien	Xã Yên Tiến	xã	360
13864	xa_yen_thang	Xã Yên Thắng	xã	360
13867	xa_yen_phuc	Xã Yên Phúc	xã	360
13870	xa_yen_cuong	Xã Yên Cường	xã	360
13873	xa_yen_loc	Xã Yên Lộc	xã	360
13876	xa_yen_bang	Xã Yên Bằng	xã	360
13879	xa_yen_dong	Xã Yên Đồng	xã	360
13882	xa_yen_khang	Xã Yên Khang	xã	360
13885	xa_yen_nhan	Xã Yên Nhân	xã	360
13888	xa_yen_tri	Xã Yên Trị	xã	360
13891	thi_tran_lieu_de	Thị trấn Liễu Đề	thị trấn	361
13894	thi_tran_rang_dong	Thị trấn Rạng Đông	thị trấn	361
13897	xa_nghia_dong	Xã Nghĩa Đồng	xã	361
13900	xa_nghia_thinh	Xã Nghĩa Thịnh	xã	361
13903	xa_nghia_minh	Xã Nghĩa Minh	xã	361
13906	xa_nghia_thai	Xã Nghĩa Thái	xã	361
13909	xa_hoang_nam	Xã Hoàng Nam	xã	361
13912	xa_nghia_chau	Xã Nghĩa Châu	xã	361
13915	xa_nghia_trung	Xã Nghĩa Trung	xã	361
13918	xa_nghia_son	Xã Nghĩa Sơn	xã	361
13921	xa_nghia_lac	Xã Nghĩa Lạc	xã	361
13924	xa_nghia_hong	Xã Nghĩa Hồng	xã	361
13927	xa_nghia_phong	Xã Nghĩa Phong	xã	361
13930	xa_nghia_phu	Xã Nghĩa Phú	xã	361
13933	xa_nghia_binh	Xã Nghĩa Bình	xã	361
13936	thi_tran_quy_nhat	Thị trấn Quỹ Nhất	thị trấn	361
13939	xa_nghia_tan	Xã Nghĩa Tân	xã	361
13942	xa_nghia_hung	Xã Nghĩa Hùng	xã	361
13945	xa_nghia_lam	Xã Nghĩa Lâm	xã	361
13948	xa_nghia_thanh	Xã Nghĩa Thành	xã	361
13951	xa_phuc_thang	Xã Phúc Thắng	xã	361
13954	xa_nghia_loi	Xã Nghĩa Lợi	xã	361
13957	xa_nghia_hai	Xã Nghĩa Hải	xã	361
13963	xa_nam_dien	Xã Nam Điền	xã	361
13966	thi_tran_nam_giang	Thị trấn Nam Giang	thị trấn	362
13969	xa_nam_my	Xã Nam Mỹ	xã	362
13972	xa_dien_xa	Xã Điền Xá	xã	362
13975	xa_nghia_an	Xã Nghĩa An	xã	362
13978	xa_nam_thang	Xã Nam Thắng	xã	362
13981	xa_nam_toan	Xã Nam Toàn	xã	362
13984	xa_hong_quang	Xã Hồng Quang	xã	362
13987	xa_tan_thinh	Xã Tân Thịnh	xã	362
13990	xa_nam_cuong	Xã Nam Cường	xã	362
13993	xa_nam_hong	Xã Nam Hồng	xã	362
13996	xa_nam_hung	Xã Nam Hùng	xã	362
13999	xa_nam_hoa	Xã Nam Hoa	xã	362
14002	xa_nam_duong	Xã Nam Dương	xã	362
14005	xa_nam_thanh	Xã Nam Thanh	xã	362
14008	xa_nam_loi	Xã Nam Lợi	xã	362
14011	xa_binh_minh	Xã Bình Minh	xã	362
14014	xa_dong_son	Xã Đồng Sơn	xã	362
14017	xa_nam_tien	Xã Nam Tiến	xã	362
14020	xa_nam_hai	Xã Nam Hải	xã	362
14023	xa_nam_thai	Xã Nam Thái	xã	362
14026	thi_tran_co_le	Thị trấn Cổ Lễ	thị trấn	363
14029	xa_phuong_dinh	Xã Phương Định	xã	363
14032	xa_truc_chinh	Xã Trực Chính	xã	363
14035	xa_trung_dong	Xã Trung Đông	xã	363
14038	xa_liem_hai	Xã Liêm Hải	xã	363
14041	xa_truc_tuan	Xã Trực Tuấn	xã	363
14044	xa_viet_hung	Xã Việt Hùng	xã	363
14047	xa_truc_dao	Xã Trực Đạo	xã	363
14050	xa_truc_hung	Xã Trực Hưng	xã	363
14053	xa_truc_noi	Xã Trực Nội	xã	363
14056	thi_tran_cat_thanh	Thị trấn Cát Thành	thị trấn	363
14059	xa_truc_thanh	Xã Trực Thanh	xã	363
14062	xa_truc_khang	Xã Trực Khang	xã	363
14065	xa_truc_thuan	Xã Trực Thuận	xã	363
14068	xa_truc_my	Xã Trực Mỹ	xã	363
14071	xa_truc_dai	Xã Trực Đại	xã	363
14074	xa_truc_cuong	Xã Trực Cường	xã	363
14077	thi_tran_ninh_cuong	Thị trấn Ninh Cường	thị trấn	363
14080	xa_truc_thai	Xã Trực Thái	xã	363
14083	xa_truc_hung	Xã Trực Hùng	xã	363
14086	xa_truc_thang	Xã Trực Thắng	xã	363
14089	thi_tran_xuan_truong	Thị trấn Xuân Trường	thị trấn	364
14092	xa_xuan_chau	Xã Xuân Châu	xã	364
14095	xa_xuan_hong	Xã Xuân Hồng	xã	364
14098	xa_xuan_thanh	Xã Xuân Thành	xã	364
14101	xa_xuan_thuong	Xã Xuân Thượng	xã	364
14104	xa_xuan_phong	Xã Xuân Phong	xã	364
14107	xa_xuan_dai	Xã Xuân Đài	xã	364
14110	xa_xuan_tan	Xã Xuân Tân	xã	364
14113	xa_xuan_thuy	Xã Xuân Thủy	xã	364
14116	xa_xuan_ngoc	Xã Xuân Ngọc	xã	364
14119	xa_xuan_bac	Xã Xuân Bắc	xã	364
14122	xa_xuan_phuong	Xã Xuân Phương	xã	364
14125	xa_tho_nghiep	Xã Thọ Nghiệp	xã	364
14128	xa_xuan_phu	Xã Xuân Phú	xã	364
14131	xa_xuan_trung	Xã Xuân Trung	xã	364
14134	xa_xuan_vinh	Xã Xuân Vinh	xã	364
14137	xa_xuan_kien	Xã Xuân Kiên	xã	364
14140	xa_xuan_tien	Xã Xuân Tiến	xã	364
14143	xa_xuan_ninh	Xã Xuân Ninh	xã	364
14146	xa_xuan_hoa	Xã Xuân Hòa	xã	364
14149	thi_tran_ngo_dong	Thị trấn Ngô Đồng	thị trấn	365
14152	thi_tran_quat_lam	Thị trấn Quất Lâm	thị trấn	365
14155	xa_giao_huong	Xã Giao Hương	xã	365
14158	xa_hong_thuan	Xã Hồng Thuận	xã	365
14161	xa_giao_thien	Xã Giao Thiện	xã	365
14164	xa_giao_thanh	Xã Giao Thanh	xã	365
14167	xa_hoanh_son	Xã Hoành Sơn	xã	365
14170	xa_binh_hoa	Xã Bình Hòa	xã	365
14173	xa_giao_tien	Xã Giao Tiến	xã	365
14176	xa_giao_ha	Xã Giao Hà	xã	365
14179	xa_giao_nhan	Xã Giao Nhân	xã	365
14182	xa_giao_an	Xã Giao An	xã	365
14185	xa_giao_lac	Xã Giao Lạc	xã	365
14188	xa_giao_chau	Xã Giao Châu	xã	365
14191	xa_giao_tan	Xã Giao Tân	xã	365
14194	xa_giao_yen	Xã Giao Yến	xã	365
14197	xa_giao_xuan	Xã Giao Xuân	xã	365
14200	xa_giao_thinh	Xã Giao Thịnh	xã	365
14203	xa_giao_hai	Xã Giao Hải	xã	365
14206	xa_bach_long	Xã Bạch Long	xã	365
14209	xa_giao_long	Xã Giao Long	xã	365
14212	xa_giao_phong	Xã Giao Phong	xã	365
14215	thi_tran_yen_dinh	Thị trấn Yên Định	thị trấn	366
14218	thi_tran_con	Thị trấn Cồn	thị trấn	366
14221	thi_tran_thinh_long	Thị trấn Thịnh Long	thị trấn	366
14224	xa_hai_nam	Xã Hải Nam	xã	366
14227	xa_hai_trung	Xã Hải Trung	xã	366
14230	xa_hai_van	Xã Hải Vân	xã	366
14233	xa_hai_minh	Xã Hải Minh	xã	366
14236	xa_hai_anh	Xã Hải Anh	xã	366
14239	xa_hai_hung	Xã Hải Hưng	xã	366
14242	xa_hai_bac	Xã Hải Bắc	xã	366
14245	xa_hai_phuc	Xã Hải Phúc	xã	366
14248	xa_hai_thanh	Xã Hải Thanh	xã	366
14251	xa_hai_ha	Xã Hải Hà	xã	366
14254	xa_hai_long	Xã Hải Long	xã	366
14257	xa_hai_phuong	Xã Hải Phương	xã	366
14260	xa_hai_duong	Xã Hải Đường	xã	366
14263	xa_hai_loc	Xã Hải Lộc	xã	366
14266	xa_hai_quang	Xã Hải Quang	xã	366
14269	xa_hai_dong	Xã Hải Đông	xã	366
14272	xa_hai_son	Xã Hải Sơn	xã	366
14275	xa_hai_tan	Xã Hải Tân	xã	366
14281	xa_hai_phong	Xã Hải Phong	xã	366
14284	xa_hai_an	Xã Hải An	xã	366
14287	xa_hai_tay	Xã Hải Tây	xã	366
14290	xa_hai_ly	Xã Hải Lý	xã	366
14293	xa_hai_phu	Xã Hải Phú	xã	366
14296	xa_hai_giang	Xã Hải Giang	xã	366
14299	xa_hai_cuong	Xã Hải Cường	xã	366
14302	xa_hai_ninh	Xã Hải Ninh	xã	366
14305	xa_hai_chinh	Xã Hải Chính	xã	366
14308	xa_hai_xuan	Xã Hải Xuân	xã	366
14311	xa_hai_chau	Xã Hải Châu	xã	366
14314	xa_hai_trieu	Xã Hải Triều	xã	366
14317	xa_hai_hoa	Xã Hải Hòa	xã	366
14320	phuong_dong_thanh	Phường Đông Thành	phường	369
14323	phuong_tan_thanh	Phường Tân Thành	phường	369
14326	phuong_thanh_binh	Phường Thanh Bình	phường	369
14329	phuong_van_giang	Phường Vân Giang	phường	369
14332	phuong_bich_dao	Phường Bích Đào	phường	369
14335	phuong_phuc_thanh	Phường Phúc Thành	phường	369
14338	phuong_nam_binh	Phường Nam Bình	phường	369
14341	phuong_nam_thanh	Phường Nam Thành	phường	369
14344	phuong_ninh_khanh	Phường Ninh Khánh	phường	369
14347	xa_ninh_nhat	Xã Ninh Nhất	xã	369
14350	xa_ninh_tien	Xã Ninh Tiến	xã	369
14353	xa_ninh_phuc	Xã Ninh Phúc	xã	369
14356	phuong_ninh_son	Phường Ninh Sơn	phường	369
14359	phuong_ninh_phong	Phường Ninh Phong	phường	369
14362	phuong_bac_son	Phường Bắc Sơn	phường	370
14365	phuong_trung_son	Phường Trung Sơn	phường	370
14368	phuong_nam_son	Phường Nam Sơn	phường	370
14369	phuong_tay_son	Phường Tây Sơn	phường	370
14371	xa_yen_son	Xã Yên Sơn	xã	370
14374	phuong_yen_binh	Phường Yên Bình	phường	370
14375	phuong_tan_binh	Phường Tân Bình	phường	370
14377	xa_quang_son	Xã Quang Sơn	xã	370
14380	xa_dong_son	Xã Đông Sơn	xã	370
14383	thi_tran_nho_quan	Thị trấn Nho Quan	thị trấn	372
14386	xa_xich_tho	Xã Xích Thổ	xã	372
14389	xa_gia_lam	Xã Gia Lâm	xã	372
14392	xa_gia_son	Xã Gia Sơn	xã	372
14395	xa_thach_binh	Xã Thạch Bình	xã	372
14398	xa_gia_thuy	Xã Gia Thủy	xã	372
14401	xa_gia_tuong	Xã Gia Tường	xã	372
14404	xa_cuc_phuong	Xã Cúc Phương	xã	372
14407	xa_phu_son	Xã Phú Sơn	xã	372
14410	xa_duc_long	Xã Đức Long	xã	372
14413	xa_lac_van	Xã Lạc Vân	xã	372
14416	xa_dong_phong	Xã Đồng Phong	xã	372
14419	xa_yen_quang	Xã Yên Quang	xã	372
14422	xa_lang_phong	Xã Lạng Phong	xã	372
14425	xa_thuong_hoa	Xã Thượng Hòa	xã	372
14428	xa_van_phong	Xã Văn Phong	xã	372
14431	xa_van_phuong	Xã Văn Phương	xã	372
14434	xa_thanh_lac	Xã Thanh Lạc	xã	372
14437	xa_son_lai	Xã Sơn Lai	xã	372
14440	xa_son_thanh	Xã Sơn Thành	xã	372
14443	xa_van_phu	Xã Văn Phú	xã	372
14446	xa_phu_loc	Xã Phú Lộc	xã	372
14449	xa_ky_phu	Xã Kỳ Phú	xã	372
14452	xa_quynh_luu	Xã Quỳnh Lưu	xã	372
14455	xa_son_ha	Xã Sơn Hà	xã	372
14458	xa_phu_long	Xã Phú Long	xã	372
14461	xa_quang_lac	Xã Quảng Lạc	xã	372
14464	thi_tran_me	Thị trấn Me	thị trấn	373
14467	xa_gia_hoa	Xã Gia Hòa	xã	373
14470	xa_gia_hung	Xã Gia Hưng	xã	373
14473	xa_lien_son	Xã Liên Sơn	xã	373
14476	xa_gia_thanh	Xã Gia Thanh	xã	373
14479	xa_gia_van	Xã Gia Vân	xã	373
14482	xa_gia_phu	Xã Gia Phú	xã	373
14485	xa_gia_xuan	Xã Gia Xuân	xã	373
14488	xa_gia_lap	Xã Gia Lập	xã	373
14491	xa_gia_vuong	Xã Gia Vượng	xã	373
14494	xa_gia_tran	Xã Gia Trấn	xã	373
14497	xa_gia_thinh	Xã Gia Thịnh	xã	373
14500	xa_gia_phuong	Xã Gia Phương	xã	373
14503	xa_gia_tan	Xã Gia Tân	xã	373
14506	xa_gia_thang	Xã Gia Thắng	xã	373
14509	xa_gia_trung	Xã Gia Trung	xã	373
14512	xa_gia_minh	Xã Gia Minh	xã	373
14515	xa_gia_lac	Xã Gia Lạc	xã	373
14518	xa_gia_tien	Xã Gia Tiến	xã	373
14521	xa_gia_sinh	Xã Gia Sinh	xã	373
14524	xa_gia_phong	Xã Gia Phong	xã	373
14527	thi_tran_thien_ton	Thị trấn Thiên Tôn	thị trấn	374
14530	xa_ninh_giang	Xã Ninh Giang	xã	374
14533	xa_truong_yen	Xã Trường Yên	xã	374
14536	xa_ninh_khang	Xã Ninh Khang	xã	374
14539	xa_ninh_my	Xã Ninh Mỹ	xã	374
14542	xa_ninh_hoa	Xã Ninh Hòa	xã	374
14545	xa_ninh_xuan	Xã Ninh Xuân	xã	374
14548	xa_ninh_hai	Xã Ninh Hải	xã	374
14551	xa_ninh_thang	Xã Ninh Thắng	xã	374
14554	xa_ninh_van	Xã Ninh Vân	xã	374
14557	xa_ninh_an	Xã Ninh An	xã	374
14560	thi_tran_yen_ninh	Thị trấn Yên Ninh	thị trấn	375
14563	xa_khanh_tien	Xã Khánh Tiên	xã	375
14566	xa_khanh_phu	Xã Khánh Phú	xã	375
14569	xa_khanh_hoa	Xã Khánh Hòa	xã	375
14572	xa_khanh_loi	Xã Khánh Lợi	xã	375
14575	xa_khanh_an	Xã Khánh An	xã	375
14578	xa_khanh_cuong	Xã Khánh Cường	xã	375
14581	xa_khanh_cu	Xã Khánh Cư	xã	375
14584	xa_khanh_thien	Xã Khánh Thiện	xã	375
14587	xa_khanh_hai	Xã Khánh Hải	xã	375
14590	xa_khanh_trung	Xã Khánh Trung	xã	375
14593	xa_khanh_mau	Xã Khánh Mậu	xã	375
14596	xa_khanh_van	Xã Khánh Vân	xã	375
14599	xa_khanh_hoi	Xã Khánh Hội	xã	375
14602	xa_khanh_cong	Xã Khánh Công	xã	375
14608	xa_khanh_thanh	Xã Khánh Thành	xã	375
14611	xa_khanh_nhac	Xã Khánh Nhạc	xã	375
14614	xa_khanh_thuy	Xã Khánh Thủy	xã	375
14617	xa_khanh_hong	Xã Khánh Hồng	xã	375
14620	thi_tran_phat_diem	Thị trấn Phát Diệm	thị trấn	376
14623	thi_tran_binh_minh	Thị trấn Bình Minh	thị trấn	376
14629	xa_hoi_ninh	Xã Hồi Ninh	xã	376
14632	xa_xuan_chinh	Xã Xuân Chính	xã	376
14635	xa_kim_dinh	Xã Kim Định	xã	376
14638	xa_an_hoa	Xã Ân Hòa	xã	376
14641	xa_hung_tien	Xã Hùng Tiến	xã	376
14647	xa_quang_thien	Xã Quang Thiện	xã	376
14650	xa_nhu_hoa	Xã Như Hòa	xã	376
14653	xa_chat_binh	Xã Chất Bình	xã	376
14656	xa_dong_huong	Xã Đồng Hướng	xã	376
14659	xa_kim_chinh	Xã Kim Chính	xã	376
14662	xa_thuong_kiem	Xã Thượng Kiệm	xã	376
14665	xa_luu_phuong	Xã Lưu Phương	xã	376
14668	xa_tan_thanh	Xã Tân Thành	xã	376
14671	xa_yen_loc	Xã Yên Lộc	xã	376
14674	xa_lai_thanh	Xã Lai Thành	xã	376
14677	xa_dinh_hoa	Xã Định Hóa	xã	376
14680	xa_van_hai	Xã Văn Hải	xã	376
14683	xa_kim_tan	Xã Kim Tân	xã	376
14686	xa_kim_my	Xã Kim Mỹ	xã	376
14689	xa_con_thoi	Xã Cồn Thoi	xã	376
14692	xa_kim_hai	Xã Kim Hải	xã	376
14695	xa_kim_trung	Xã Kim Trung	xã	376
14698	xa_kim_dong	Xã Kim Đông	xã	376
14701	thi_tran_yen_thinh	Thị trấn Yên Thịnh	thị trấn	377
14704	xa_khanh_thuong	Xã Khánh Thượng	xã	377
14707	xa_khanh_duong	Xã Khánh Dương	xã	377
14710	xa_mai_son	Xã Mai Sơn	xã	377
14713	xa_khanh_thinh	Xã Khánh Thịnh	xã	377
14719	xa_yen_phong	Xã Yên Phong	xã	377
14722	xa_yen_hoa	Xã Yên Hòa	xã	377
14725	xa_yen_thang	Xã Yên Thắng	xã	377
14728	xa_yen_tu	Xã Yên Từ	xã	377
14731	xa_yen_hung	Xã Yên Hưng	xã	377
14734	xa_yen_thanh	Xã Yên Thành	xã	377
14737	xa_yen_nhan	Xã Yên Nhân	xã	377
14740	xa_yen_my	Xã Yên Mỹ	xã	377
14743	xa_yen_mac	Xã Yên Mạc	xã	377
14746	xa_yen_dong	Xã Yên Đồng	xã	377
14749	xa_yen_thai	Xã Yên Thái	xã	377
14752	xa_yen_lam	Xã Yên Lâm	xã	377
14755	phuong_ham_rong	Phường Hàm Rồng	phường	380
14758	phuong_dong_tho	Phường Đông Thọ	phường	380
14761	phuong_nam_ngan	Phường Nam Ngạn	phường	380
14764	phuong_truong_thi	Phường Trường Thi	phường	380
14767	phuong_dien_bien	Phường Điện Biên	phường	380
14770	phuong_phu_son	Phường Phú Sơn	phường	380
14773	phuong_lam_son	Phường Lam Sơn	phường	380
14776	phuong_ba_dinh	Phường Ba Đình	phường	380
14779	phuong_ngoc_trao	Phường Ngọc Trạo	phường	380
14782	phuong_dong_ve	Phường Đông Vệ	phường	380
14785	phuong_dong_son	Phường Đông Sơn	phường	380
14788	phuong_tan_son	Phường Tân Sơn	phường	380
14791	phuong_dong_cuong	Phường Đông Cương	phường	380
14794	phuong_dong_huong	Phường Đông Hương	phường	380
14797	phuong_dong_hai	Phường Đông Hải	phường	380
14800	phuong_quang_hung	Phường Quảng Hưng	phường	380
14803	phuong_quang_thang	Phường Quảng Thắng	phường	380
14806	phuong_quang_thanh	Phường Quảng Thành	phường	380
15850	xa_thieu_van	Xã Thiệu Vân	xã	380
15856	phuong_thieu_khanh	Phường Thiệu Khánh	phường	380
15859	phuong_thieu_duong	Phường Thiệu Dương	phường	380
15913	phuong_tao_xuyen	Phường Tào Xuyên	phường	380
15922	phuong_long_anh	Phường Long Anh	phường	380
15925	xa_hoang_quang	Xã Hoằng Quang	xã	380
15970	xa_hoang_dai	Xã Hoằng Đại	xã	380
16396	phuong_dong_linh	Phường Đông Lĩnh	phường	380
16429	xa_dong_vinh	Xã Đông Vinh	xã	380
16432	phuong_dong_tan	Phường Đông Tân	phường	380
16435	phuong_an_hung	Phường An Hưng	phường	380
16441	phuong_quang_thinh	Phường Quảng Thịnh	phường	380
16459	phuong_quang_dong	Phường Quảng Đông	phường	380
16507	phuong_quang_cat	Phường Quảng Cát	phường	380
16522	phuong_quang_phu	Phường Quảng Phú	phường	380
16525	phuong_quang_tam	Phường Quảng Tâm	phường	380
14809	phuong_bac_son	Phường Bắc Sơn	phường	381
14812	phuong_ba_dinh	Phường Ba Đình	phường	381
14815	phuong_lam_son	Phường Lam Sơn	phường	381
14818	phuong_ngoc_trao	Phường Ngọc Trạo	phường	381
14821	phuong_dong_son	Phường Đông Sơn	phường	381
14823	phuong_phu_son	Phường Phú Sơn	phường	381
14824	xa_quang_trung	Xã Quang Trung	xã	381
14830	phuong_trung_son	Phường Trung Sơn	phường	382
14833	phuong_bac_son	Phường Bắc Sơn	phường	382
14836	phuong_truong_son	Phường Trường Sơn	phường	382
14839	phuong_quang_cu	Phường Quảng Cư	phường	382
14842	phuong_quang_tien	Phường Quảng Tiến	phường	382
16513	xa_quang_minh	Xã Quảng Minh	xã	382
16516	xa_quang_hung	Xã Quảng Hùng	xã	382
16528	phuong_quang_tho	Phường Quảng Thọ	phường	382
16531	phuong_quang_chau	Phường Quảng Châu	phường	382
16534	phuong_quang_vinh	Phường Quảng Vinh	phường	382
16537	xa_quang_dai	Xã Quảng Đại	xã	382
14845	thi_tran_muong_lat	Thị trấn Mường Lát	thị trấn	384
14848	xa_tam_chung	Xã Tam Chung	xã	384
14854	xa_muong_ly	Xã Mường Lý	xã	384
14857	xa_trung_ly	Xã Trung Lý	xã	384
14860	xa_quang_chieu	Xã Quang Chiểu	xã	384
14863	xa_pu_nhi	Xã Pù Nhi	xã	384
14864	xa_nhi_son	Xã Nhi Sơn	xã	384
14866	xa_muong_chanh	Xã Mường Chanh	xã	384
14869	thi_tran_hoi_xuan	Thị trấn Hồi Xuân	thị trấn	385
14872	xa_thanh_son	Xã Thành Sơn	xã	385
14875	xa_trung_son	Xã Trung Sơn	xã	385
14878	xa_phu_thanh	Xã Phú Thanh	xã	385
14881	xa_trung_thanh	Xã Trung Thành	xã	385
14884	xa_phu_le	Xã Phú Lệ	xã	385
14887	xa_phu_son	Xã Phú Sơn	xã	385
14890	xa_phu_xuan	Xã Phú Xuân	xã	385
14896	xa_hien_chung	Xã Hiền Chung	xã	385
14899	xa_hien_kiet	Xã Hiền Kiệt	xã	385
14902	xa_nam_tien	Xã Nam Tiến	xã	385
14908	xa_thien_phu	Xã Thiên Phủ	xã	385
14911	xa_phu_nghiem	Xã Phú Nghiêm	xã	385
14914	xa_nam_xuan	Xã Nam Xuân	xã	385
14917	xa_nam_dong	Xã Nam Động	xã	385
14923	thi_tran_canh_nang	Thị trấn Cành Nàng	thị trấn	386
14926	xa_dien_thuong	Xã Điền Thượng	xã	386
14929	xa_dien_ha	Xã Điền Hạ	xã	386
14932	xa_dien_quang	Xã Điền Quang	xã	386
14935	xa_dien_trung	Xã Điền Trung	xã	386
14938	xa_thanh_son	Xã Thành Sơn	xã	386
14941	xa_luong_ngoai	Xã Lương Ngoại	xã	386
14944	xa_ai_thuong	Xã Ái Thượng	xã	386
14947	xa_luong_noi	Xã Lương Nội	xã	386
14950	xa_dien_lu	Xã Điền Lư	xã	386
14953	xa_luong_trung	Xã Lương Trung	xã	386
14956	xa_lung_niem	Xã Lũng Niêm	xã	386
14959	xa_lung_cao	Xã Lũng Cao	xã	386
14962	xa_ha_trung	Xã Hạ Trung	xã	386
14965	xa_co_lung	Xã Cổ Lũng	xã	386
14968	xa_thanh_lam	Xã Thành Lâm	xã	386
14971	xa_ban_cong	Xã Ban Công	xã	386
14974	xa_ky_tan	Xã Kỳ Tân	xã	386
14977	xa_van_nho	Xã Văn Nho	xã	386
14980	xa_thiet_ong	Xã Thiết Ống	xã	386
14986	xa_thiet_ke	Xã Thiết Kế	xã	386
14995	xa_trung_xuan	Xã Trung Xuân	xã	387
14998	xa_trung_thuong	Xã Trung Thượng	xã	387
14999	xa_trung_tien	Xã Trung Tiến	xã	387
15001	xa_trung_ha	Xã Trung Hạ	xã	387
15004	xa_son_ha	Xã Sơn Hà	xã	387
15007	xa_tam_thanh	Xã Tam Thanh	xã	387
15010	xa_son_thuy	Xã Sơn Thủy	xã	387
15013	xa_na_meo	Xã Na Mèo	xã	387
15016	thi_tran_son_lu	Thị trấn Sơn Lư	thị trấn	387
15019	xa_tam_lu	Xã Tam Lư	xã	387
15022	xa_son_dien	Xã Sơn Điện	xã	387
15025	xa_muong_min	Xã Mường Mìn	xã	387
15031	xa_yen_khuong	Xã Yên Khương	xã	388
15034	xa_yen_thang	Xã Yên Thắng	xã	388
15037	xa_tri_nang	Xã Trí Nang	xã	388
15040	xa_giao_an	Xã Giao An	xã	388
15043	xa_giao_thien	Xã Giao Thiện	xã	388
15046	xa_tan_phuc	Xã Tân Phúc	xã	388
15049	xa_tam_van	Xã Tam Văn	xã	388
15052	xa_lam_phu	Xã Lâm Phú	xã	388
15055	thi_tran_lang_chanh	Thị trấn Lang Chánh	thị trấn	388
15058	xa_dong_luong	Xã Đồng Lương	xã	388
15061	thi_tran_ngoc_lac	Thị trấn Ngọc Lặc	thị trấn	389
15064	xa_lam_son	Xã Lam Sơn	xã	389
15067	xa_my_tan	Xã Mỹ Tân	xã	389
15070	xa_thuy_son	Xã Thúy Sơn	xã	389
15073	xa_thach_lap	Xã Thạch Lập	xã	389
15076	xa_van_am	Xã Vân Âm	xã	389
15079	xa_cao_ngoc	Xã Cao Ngọc	xã	389
15085	xa_quang_trung	Xã Quang Trung	xã	389
15088	xa_dong_thinh	Xã Đồng Thịnh	xã	389
15091	xa_ngoc_lien	Xã Ngọc Liên	xã	389
15094	xa_ngoc_son	Xã Ngọc Sơn	xã	389
15097	xa_loc_thinh	Xã Lộc Thịnh	xã	389
15100	xa_cao_thinh	Xã Cao Thịnh	xã	389
15103	xa_ngoc_trung	Xã Ngọc Trung	xã	389
15106	xa_phung_giao	Xã Phùng Giáo	xã	389
15109	xa_phung_minh	Xã Phùng Minh	xã	389
15112	xa_phuc_thinh	Xã Phúc Thịnh	xã	389
15115	xa_nguyet_an	Xã Nguyệt Ấn	xã	389
15118	xa_kien_tho	Xã Kiên Thọ	xã	389
15121	xa_minh_tien	Xã Minh Tiến	xã	389
15124	xa_minh_son	Xã Minh Sơn	xã	389
15127	thi_tran_phong_son	Thị trấn Phong Sơn	thị trấn	390
15133	xa_cam_thanh	Xã Cẩm Thành	xã	390
15136	xa_cam_quy	Xã Cẩm Quý	xã	390
15139	xa_cam_luong	Xã Cẩm Lương	xã	390
15142	xa_cam_thach	Xã Cẩm Thạch	xã	390
15145	xa_cam_lien	Xã Cẩm Liên	xã	390
15148	xa_cam_giang	Xã Cẩm Giang	xã	390
15151	xa_cam_binh	Xã Cẩm Bình	xã	390
15154	xa_cam_tu	Xã Cẩm Tú	xã	390
15160	xa_cam_chau	Xã Cẩm Châu	xã	390
15163	xa_cam_tam	Xã Cẩm Tâm	xã	390
15169	xa_cam_ngoc	Xã Cẩm Ngọc	xã	390
15172	xa_cam_long	Xã Cẩm Long	xã	390
15175	xa_cam_yen	Xã Cẩm Yên	xã	390
15178	xa_cam_tan	Xã Cẩm Tân	xã	390
15181	xa_cam_phu	Xã Cẩm Phú	xã	390
15184	xa_cam_van	Xã Cẩm Vân	xã	390
15187	thi_tran_kim_tan	Thị trấn Kim Tân	thị trấn	391
15190	thi_tran_van_du	Thị trấn Vân Du	thị trấn	391
15196	xa_thach_lam	Xã Thạch Lâm	xã	391
15199	xa_thach_quang	Xã Thạch Quảng	xã	391
15202	xa_thach_tuong	Xã Thạch Tượng	xã	391
15205	xa_thach_cam	Xã Thạch Cẩm	xã	391
15208	xa_thach_son	Xã Thạch Sơn	xã	391
15211	xa_thach_binh	Xã Thạch Bình	xã	391
15214	xa_thach_dinh	Xã Thạch Định	xã	391
15217	xa_thach_dong	Xã Thạch Đồng	xã	391
15220	xa_thach_long	Xã Thạch Long	xã	391
15223	xa_thanh_my	Xã Thành Mỹ	xã	391
15226	xa_thanh_yen	Xã Thành Yên	xã	391
15229	xa_thanh_vinh	Xã Thành Vinh	xã	391
15232	xa_thanh_minh	Xã Thành Minh	xã	391
15235	xa_thanh_cong	Xã Thành Công	xã	391
15238	xa_thanh_tan	Xã Thành Tân	xã	391
15241	xa_thanh_truc	Xã Thành Trực	xã	391
15247	xa_thanh_tam	Xã Thành Tâm	xã	391
15250	xa_thanh_an	Xã Thành An	xã	391
15253	xa_thanh_tho	Xã Thành Thọ	xã	391
15256	xa_thanh_tien	Xã Thành Tiến	xã	391
15259	xa_thanh_long	Xã Thành Long	xã	391
15265	xa_thanh_hung	Xã Thành Hưng	xã	391
15268	xa_ngoc_trao	Xã Ngọc Trạo	xã	391
15271	thi_tran_ha_trung	Thị trấn Hà Trung	thị trấn	392
15274	xa_ha_long	Xã Hà Long	xã	392
15277	xa_ha_vinh	Xã Hà Vinh	xã	392
15280	xa_ha_bac	Xã Hà Bắc	xã	392
15283	xa_hoat_giang	Xã Hoạt Giang	xã	392
15286	xa_yen_duong	Xã Yên Dương	xã	392
15292	xa_ha_giang	Xã Hà Giang	xã	392
15298	xa_linh_toai	Xã Lĩnh Toại	xã	392
15304	xa_ha_ngoc	Xã Hà Ngọc	xã	392
15307	xa_yen_son	Xã Yến Sơn	xã	392
15313	xa_ha_son	Xã Hà Sơn	xã	392
15316	xa_ha_linh	Xã Hà Lĩnh	xã	392
15319	xa_ha_dong	Xã Hà Đông	xã	392
15322	xa_ha_tan	Xã Hà Tân	xã	392
15325	xa_ha_tien	Xã Hà Tiến	xã	392
15328	xa_ha_binh	Xã Hà Bình	xã	392
15331	xa_ha_lai	Xã Hà Lai	xã	392
15334	xa_ha_chau	Xã Hà Châu	xã	392
15340	xa_ha_thai	Xã Hà Thái	xã	392
15343	xa_ha_hai	Xã Hà Hải	xã	392
15349	thi_tran_vinh_loc	Thị trấn Vĩnh Lộc	thị trấn	393
15352	xa_vinh_quang	Xã Vĩnh Quang	xã	393
15355	xa_vinh_yen	Xã Vĩnh Yên	xã	393
15358	xa_vinh_tien	Xã Vĩnh Tiến	xã	393
15361	xa_vinh_long	Xã Vĩnh Long	xã	393
15364	xa_vinh_phuc	Xã Vĩnh Phúc	xã	393
15367	xa_vinh_hung	Xã Vĩnh Hưng	xã	393
15376	xa_vinh_hoa	Xã Vĩnh Hòa	xã	393
15379	xa_vinh_hung	Xã Vĩnh Hùng	xã	393
15382	xa_minh_tan	Xã Minh Tân	xã	393
15385	xa_ninh_khang	Xã Ninh Khang	xã	393
15388	xa_vinh_thinh	Xã Vĩnh Thịnh	xã	393
15391	xa_vinh_an	Xã Vĩnh An	xã	393
15397	thi_tran_thong_nhat	Thị trấn Thống Nhất	thị trấn	394
15403	xa_yen_lam	Xã Yên Lâm	xã	394
15406	xa_yen_tam	Xã Yên Tâm	xã	394
15409	xa_yen_phu	Xã Yên Phú	xã	394
15412	xa_qui_loc	Xã Quí Lộc	xã	394
15415	xa_yen_tho	Xã Yên Thọ	xã	394
15418	xa_yen_trung	Xã Yên Trung	xã	394
15421	xa_yen_truong	Xã Yên Trường	xã	394
15427	xa_yen_phong	Xã Yên Phong	xã	394
15430	xa_yen_thai	Xã Yên Thái	xã	394
15433	xa_yen_hung	Xã Yên Hùng	xã	394
15436	xa_yen_thinh	Xã Yên Thịnh	xã	394
15439	xa_yen_ninh	Xã Yên Ninh	xã	394
15442	xa_yen_lac	Xã Yên Lạc	xã	394
15445	xa_dinh_tang	Xã Định Tăng	xã	394
15448	xa_dinh_hoa	Xã Định Hòa	xã	394
15451	xa_dinh_thanh	Xã Định Thành	xã	394
15454	xa_dinh_cong	Xã Định Công	xã	394
15457	xa_dinh_tan	Xã Định Tân	xã	394
15460	xa_dinh_tien	Xã Định Tiến	xã	394
15463	xa_dinh_long	Xã Định Long	xã	394
15466	xa_dinh_lien	Xã Định Liên	xã	394
15469	thi_tran_quan_lao	Thị trấn Quán Lào	thị trấn	394
15472	xa_dinh_hung	Xã Định Hưng	xã	394
15475	xa_dinh_hai	Xã Định Hải	xã	394
15478	xa_dinh_binh	Xã Định Bình	xã	394
15493	xa_xuan_hong	Xã Xuân Hồng	xã	395
15499	thi_tran_tho_xuan	Thị trấn Thọ Xuân	thị trấn	395
15502	xa_bac_luong	Xã Bắc Lương	xã	395
15505	xa_nam_giang	Xã Nam Giang	xã	395
15508	xa_xuan_phong	Xã Xuân Phong	xã	395
15511	xa_tho_loc	Xã Thọ Lộc	xã	395
15514	xa_xuan_truong	Xã Xuân Trường	xã	395
15517	xa_xuan_hoa	Xã Xuân Hòa	xã	395
15520	xa_tho_hai	Xã Thọ Hải	xã	395
15523	xa_tay_ho	Xã Tây Hồ	xã	395
15526	xa_xuan_giang	Xã Xuân Giang	xã	395
15532	xa_xuan_sinh	Xã Xuân Sinh	xã	395
15535	xa_xuan_hung	Xã Xuân Hưng	xã	395
15538	xa_tho_dien	Xã Thọ Diên	xã	395
15541	xa_tho_lam	Xã Thọ Lâm	xã	395
15544	xa_tho_xuong	Xã Thọ Xương	xã	395
15547	xa_xuan_bai	Xã Xuân Bái	xã	395
15550	xa_xuan_phu	Xã Xuân Phú	xã	395
15553	thi_tran_sao_vang	Thị trấn Sao Vàng	thị trấn	395
15556	thi_tran_lam_son	Thị trấn Lam Sơn	thị trấn	395
15559	xa_xuan_thien	Xã Xuân Thiên	xã	395
15565	xa_thuan_minh	Xã Thuận Minh	xã	395
15568	xa_tho_lap	Xã Thọ Lập	xã	395
15571	xa_quang_phu	Xã Quảng Phú	xã	395
15574	xa_xuan_tin	Xã Xuân Tín	xã	395
15577	xa_phu_xuan	Xã Phú Xuân	xã	395
15583	xa_xuan_lai	Xã Xuân Lai	xã	395
15586	xa_xuan_lap	Xã Xuân Lập	xã	395
15592	xa_xuan_minh	Xã Xuân Minh	xã	395
15598	xa_truong_xuan	Xã Trường Xuân	xã	395
15607	xa_bat_mot	Xã Bát Mọt	xã	396
15610	xa_yen_nhan	Xã Yên Nhân	xã	396
15619	xa_xuan_le	Xã Xuân Lẹ	xã	396
15622	xa_van_xuan	Xã Vạn Xuân	xã	396
15628	xa_luong_son	Xã Lương Sơn	xã	396
15631	xa_xuan_cao	Xã Xuân Cao	xã	396
15634	xa_luan_thanh	Xã Luận Thành	xã	396
15637	xa_luan_khe	Xã Luận Khê	xã	396
15640	xa_xuan_thang	Xã Xuân Thắng	xã	396
15643	xa_xuan_loc	Xã Xuân Lộc	xã	396
15646	thi_tran_thuong_xuan	Thị trấn Thường Xuân	thị trấn	396
15649	xa_xuan_duong	Xã Xuân Dương	xã	396
15652	xa_tho_thanh	Xã Thọ Thanh	xã	396
15655	xa_ngoc_phung	Xã Ngọc Phụng	xã	396
15658	xa_xuan_chinh	Xã Xuân Chinh	xã	396
15661	xa_tan_thanh	Xã Tân Thành	xã	396
15664	thi_tran_trieu_son	Thị trấn Triệu Sơn	thị trấn	397
15667	xa_tho_son	Xã Thọ Sơn	xã	397
15670	xa_tho_binh	Xã Thọ Bình	xã	397
15673	xa_tho_tien	Xã Thọ Tiến	xã	397
15676	xa_hop_ly	Xã Hợp Lý	xã	397
15679	xa_hop_tien	Xã Hợp Tiến	xã	397
15682	xa_hop_thanh	Xã Hợp Thành	xã	397
15685	xa_trieu_thanh	Xã Triệu Thành	xã	397
15688	xa_hop_thang	Xã Hợp Thắng	xã	397
15691	xa_minh_son	Xã Minh Sơn	xã	397
15700	xa_dan_luc	Xã Dân Lực	xã	397
15703	xa_dan_ly	Xã Dân Lý	xã	397
15706	xa_dan_quyen	Xã Dân Quyền	xã	397
15709	xa_an_nong	Xã An Nông	xã	397
15712	xa_van_son	Xã Văn Sơn	xã	397
15715	xa_thai_hoa	Xã Thái Hòa	xã	397
15718	thi_tran_nua	Thị trấn Nưa	thị trấn	397
15721	xa_dong_loi	Xã Đồng Lợi	xã	397
15724	xa_dong_tien	Xã Đồng Tiến	xã	397
15727	xa_dong_thang	Xã Đồng Thắng	xã	397
15730	xa_tien_nong	Xã Tiến Nông	xã	397
15733	xa_khuyen_nong	Xã Khuyến Nông	xã	397
15736	xa_xuan_thinh	Xã Xuân Thịnh	xã	397
15739	xa_xuan_loc	Xã Xuân Lộc	xã	397
15742	xa_tho_dan	Xã Thọ Dân	xã	397
15745	xa_xuan_tho	Xã Xuân Thọ	xã	397
15748	xa_tho_tan	Xã Thọ Tân	xã	397
15751	xa_tho_ngoc	Xã Thọ Ngọc	xã	397
15754	xa_tho_cuong	Xã Thọ Cường	xã	397
15757	xa_tho_phu	Xã Thọ Phú	xã	397
15760	xa_tho_vuc	Xã Thọ Vực	xã	397
15763	xa_tho_the	Xã Thọ Thế	xã	397
15766	xa_nong_truong	Xã Nông Trường	xã	397
15769	xa_binh_son	Xã Bình Sơn	xã	397
15772	thi_tran_thieu_hoa	Thị trấn Thiệu Hóa	thị trấn	398
15775	xa_thieu_ngoc	Xã Thiệu Ngọc	xã	398
15778	xa_thieu_vu	Xã Thiệu Vũ	xã	398
15781	xa_thieu_phuc	Xã Thiệu Phúc	xã	398
15784	xa_thieu_tien	Xã Thiệu Tiến	xã	398
15787	xa_thieu_cong	Xã Thiệu Công	xã	398
15790	xa_thieu_phu	Xã Thiệu Phú	xã	398
15793	xa_thieu_long	Xã Thiệu Long	xã	398
15796	xa_thieu_giang	Xã Thiệu Giang	xã	398
15799	xa_thieu_duy	Xã Thiệu Duy	xã	398
15802	xa_thieu_nguyen	Xã Thiệu Nguyên	xã	398
15805	xa_thieu_hop	Xã Thiệu Hợp	xã	398
15808	xa_thieu_thinh	Xã Thiệu Thịnh	xã	398
15811	xa_thieu_quang	Xã Thiệu Quang	xã	398
15814	xa_thieu_thanh	Xã Thiệu Thành	xã	398
15817	xa_thieu_toan	Xã Thiệu Toán	xã	398
15820	xa_thieu_chinh	Xã Thiệu Chính	xã	398
15823	xa_thieu_hoa	Xã Thiệu Hòa	xã	398
15829	xa_minh_tam	Xã Minh Tâm	xã	398
15832	xa_thieu_vien	Xã Thiệu Viên	xã	398
15835	xa_thieu_ly	Xã Thiệu Lý	xã	398
15838	xa_thieu_van	Xã Thiệu Vận	xã	398
15841	xa_thieu_trung	Xã Thiệu Trung	xã	398
15847	xa_tan_chau	Xã Tân Châu	xã	398
15853	xa_thieu_giao	Xã Thiệu Giao	xã	398
15865	thi_tran_but_son	Thị trấn Bút Sơn	thị trấn	399
15871	xa_hoang_giang	Xã Hoằng Giang	xã	399
15877	xa_hoang_xuan	Xã Hoằng Xuân	xã	399
15880	xa_hoang_phuong	Xã Hoằng Phượng	xã	399
15883	xa_hoang_phu	Xã Hoằng Phú	xã	399
15886	xa_hoang_quy	Xã Hoằng Quỳ	xã	399
15889	xa_hoang_kim	Xã Hoằng Kim	xã	399
15892	xa_hoang_trung	Xã Hoằng Trung	xã	399
15895	xa_hoang_trinh	Xã Hoằng Trinh	xã	399
15901	xa_hoang_son	Xã Hoằng Sơn	xã	399
15907	xa_hoang_cat	Xã Hoằng Cát	xã	399
15910	xa_hoang_xuyen	Xã Hoằng Xuyên	xã	399
15916	xa_hoang_quy	Xã Hoằng Quý	xã	399
15919	xa_hoang_hop	Xã Hoằng Hợp	xã	399
15928	xa_hoang_duc	Xã Hoằng Đức	xã	399
15937	xa_hoang_ha	Xã Hoằng Hà	xã	399
15940	xa_hoang_dat	Xã Hoằng Đạt	xã	399
15946	xa_hoang_dao	Xã Hoằng Đạo	xã	399
15949	xa_hoang_thang	Xã Hoằng Thắng	xã	399
15952	xa_hoang_dong	Xã Hoằng Đồng	xã	399
15955	xa_hoang_thai	Xã Hoằng Thái	xã	399
15958	xa_hoang_thinh	Xã Hoằng Thịnh	xã	399
15961	xa_hoang_thanh	Xã Hoằng Thành	xã	399
15964	xa_hoang_loc	Xã Hoằng Lộc	xã	399
15967	xa_hoang_trach	Xã Hoằng Trạch	xã	399
15973	xa_hoang_phong	Xã Hoằng Phong	xã	399
15976	xa_hoang_luu	Xã Hoằng Lưu	xã	399
15979	xa_hoang_chau	Xã Hoằng Châu	xã	399
15982	xa_hoang_tan	Xã Hoằng Tân	xã	399
15985	xa_hoang_yen	Xã Hoằng Yến	xã	399
15988	xa_hoang_tien	Xã Hoằng Tiến	xã	399
15991	xa_hoang_hai	Xã Hoằng Hải	xã	399
15994	xa_hoang_ngoc	Xã Hoằng Ngọc	xã	399
15997	xa_hoang_dong	Xã Hoằng Đông	xã	399
16000	xa_hoang_thanh	Xã Hoằng Thanh	xã	399
16003	xa_hoang_phu	Xã Hoằng Phụ	xã	399
16006	xa_hoang_truong	Xã Hoằng Trường	xã	399
16012	thi_tran_hau_loc	Thị trấn Hậu Lộc	thị trấn	400
16015	xa_dong_loc	Xã Đồng Lộc	xã	400
16018	xa_dai_loc	Xã Đại Lộc	xã	400
16021	xa_trieu_loc	Xã Triệu Lộc	xã	400
16027	xa_tien_loc	Xã Tiến Lộc	xã	400
16030	xa_loc_son	Xã Lộc Sơn	xã	400
16033	xa_cau_loc	Xã Cầu Lộc	xã	400
16036	xa_thanh_loc	Xã Thành Lộc	xã	400
16039	xa_tuy_loc	Xã Tuy Lộc	xã	400
16042	xa_phong_loc	Xã Phong Lộc	xã	400
16045	xa_my_loc	Xã Mỹ Lộc	xã	400
16048	xa_thuan_loc	Xã Thuần Lộc	xã	400
16057	xa_xuan_loc	Xã Xuân Lộc	xã	400
16063	xa_hoa_loc	Xã Hoa Lộc	xã	400
16066	xa_lien_loc	Xã Liên Lộc	xã	400
16069	xa_quang_loc	Xã Quang Lộc	xã	400
16072	xa_phu_loc	Xã Phú Lộc	xã	400
16075	xa_hoa_loc	Xã Hòa Lộc	xã	400
16078	xa_minh_loc	Xã Minh Lộc	xã	400
16081	xa_hung_loc	Xã Hưng Lộc	xã	400
16084	xa_hai_loc	Xã Hải Lộc	xã	400
16087	xa_da_loc	Xã Đa Lộc	xã	400
16090	xa_ngu_loc	Xã Ngư Lộc	xã	400
16093	thi_tran_nga_son	Thị trấn Nga Sơn	thị trấn	401
16096	xa_ba_dinh	Xã Ba Đình	xã	401
16099	xa_nga_vinh	Xã Nga Vịnh	xã	401
16102	xa_nga_van	Xã Nga Văn	xã	401
16105	xa_nga_thien	Xã Nga Thiện	xã	401
16108	xa_nga_tien	Xã Nga Tiến	xã	401
16114	xa_nga_phuong	Xã Nga Phượng	xã	401
16117	xa_nga_trung	Xã Nga Trung	xã	401
16120	xa_nga_bach	Xã Nga Bạch	xã	401
16123	xa_nga_thanh	Xã Nga Thanh	xã	401
16132	xa_nga_yen	Xã Nga Yên	xã	401
16135	xa_nga_giap	Xã Nga Giáp	xã	401
16138	xa_nga_hai	Xã Nga Hải	xã	401
16141	xa_nga_thanh	Xã Nga Thành	xã	401
16144	xa_nga_an	Xã Nga An	xã	401
16147	xa_nga_phu	Xã Nga Phú	xã	401
16150	xa_nga_dien	Xã Nga Điền	xã	401
16153	xa_nga_tan	Xã Nga Tân	xã	401
16156	xa_nga_thuy	Xã Nga Thủy	xã	401
16159	xa_nga_lien	Xã Nga Liên	xã	401
16162	xa_nga_thai	Xã Nga Thái	xã	401
16165	xa_nga_thach	Xã Nga Thạch	xã	401
16168	xa_nga_thang	Xã Nga Thắng	xã	401
16171	xa_nga_truong	Xã Nga Trường	xã	401
16174	thi_tran_yen_cat	Thị trấn Yên Cát	thị trấn	402
16177	xa_bai_tranh	Xã Bãi Trành	xã	402
16180	xa_xuan_hoa	Xã Xuân Hòa	xã	402
16183	xa_xuan_binh	Xã Xuân Bình	xã	402
16186	xa_hoa_quy	Xã Hóa Quỳ	xã	402
16195	xa_cat_van	Xã Cát Vân	xã	402
16198	xa_cat_tan	Xã Cát Tân	xã	402
16201	xa_tan_binh	Xã Tân Bình	xã	402
16204	xa_binh_luong	Xã Bình Lương	xã	402
16207	xa_thanh_quan	Xã Thanh Quân	xã	402
16210	xa_thanh_xuan	Xã Thanh Xuân	xã	402
16213	xa_thanh_hoa	Xã Thanh Hòa	xã	402
16216	xa_thanh_phong	Xã Thanh Phong	xã	402
16219	xa_thanh_lam	Xã Thanh Lâm	xã	402
16222	xa_thanh_son	Xã Thanh Sơn	xã	402
16225	xa_thuong_ninh	Xã Thượng Ninh	xã	402
16228	thi_tran_ben_sung	Thị trấn Bến Sung	thị trấn	403
16231	xa_can_khe	Xã Cán Khê	xã	403
16234	xa_xuan_du	Xã Xuân Du	xã	403
16240	xa_phuong_nghi	Xã Phượng Nghi	xã	403
16243	xa_mau_lam	Xã Mậu Lâm	xã	403
16246	xa_xuan_khang	Xã Xuân Khang	xã	403
16249	xa_phu_nhuan	Xã Phú Nhuận	xã	403
16252	xa_hai_long	Xã Hải Long	xã	403
16258	xa_xuan_thai	Xã Xuân Thái	xã	403
16261	xa_xuan_phuc	Xã Xuân Phúc	xã	403
16264	xa_yen_tho	Xã Yên Thọ	xã	403
16267	xa_yen_lac	Xã Yên Lạc	xã	403
16273	xa_thanh_tan	Xã Thanh Tân	xã	403
16276	xa_thanh_ky	Xã Thanh Kỳ	xã	403
16279	thi_tran_nong_cong	Thị trấn Nông Cống	thị trấn	404
16282	xa_tan_phuc	Xã Tân Phúc	xã	404
16285	xa_tan_tho	Xã Tân Thọ	xã	404
16288	xa_hoang_son	Xã Hoàng Sơn	xã	404
16291	xa_tan_khang	Xã Tân Khang	xã	404
16294	xa_hoang_giang	Xã Hoàng Giang	xã	404
16297	xa_trung_chinh	Xã Trung Chính	xã	404
16303	xa_trung_thanh	Xã Trung Thành	xã	404
16309	xa_te_thang	Xã Tế Thắng	xã	404
16315	xa_te_loi	Xã Tế Lợi	xã	404
16318	xa_te_nong	Xã Tế Nông	xã	404
16321	xa_minh_nghia	Xã Minh Nghĩa	xã	404
16324	xa_minh_khoi	Xã Minh Khôi	xã	404
16327	xa_van_hoa	Xã Vạn Hòa	xã	404
16330	xa_truong_trung	Xã Trường Trung	xã	404
16333	xa_van_thang	Xã Vạn Thắng	xã	404
16336	xa_truong_giang	Xã Trường Giang	xã	404
16339	xa_van_thien	Xã Vạn Thiện	xã	404
16342	xa_thang_long	Xã Thăng Long	xã	404
16345	xa_truong_minh	Xã Trường Minh	xã	404
16348	xa_truong_son	Xã Trường Sơn	xã	404
16351	xa_thang_binh	Xã Thăng Bình	xã	404
16354	xa_cong_liem	Xã Công Liêm	xã	404
16357	xa_tuong_van	Xã Tượng Văn	xã	404
16360	xa_thang_tho	Xã Thăng Thọ	xã	404
16363	xa_tuong_linh	Xã Tượng Lĩnh	xã	404
16366	xa_tuong_son	Xã Tượng Sơn	xã	404
16369	xa_cong_chinh	Xã Công Chính	xã	404
16375	xa_yen_my	Xã Yên Mỹ	xã	404
16378	thi_tran_rung_thong	Thị trấn Rừng Thông	thị trấn	405
16381	xa_dong_hoang	Xã Đông Hoàng	xã	405
16384	xa_dong_ninh	Xã Đông Ninh	xã	405
16390	xa_dong_hoa	Xã Đông Hòa	xã	405
16393	xa_dong_yen	Xã Đông Yên	xã	405
16399	xa_dong_minh	Xã Đông Minh	xã	405
16402	xa_dong_thanh	Xã Đông Thanh	xã	405
16405	xa_dong_tien	Xã Đông Tiến	xã	405
16408	xa_dong_khe	Xã Đông Khê	xã	405
16414	xa_dong_thinh	Xã Đông Thịnh	xã	405
16417	xa_dong_van	Xã Đông Văn	xã	405
16420	xa_dong_phu	Xã Đông Phú	xã	405
16423	xa_dong_nam	Xã Đông Nam	xã	405
16426	xa_dong_quang	Xã Đông Quang	xã	405
16438	thi_tran_tan_phong	Thị trấn Tân Phong	thị trấn	406
16447	xa_quang_trach	Xã Quảng Trạch	xã	406
16453	xa_quang_duc	Xã Quảng Đức	xã	406
16456	xa_quang_dinh	Xã Quảng Định	xã	406
16462	xa_quang_nhan	Xã Quảng Nhân	xã	406
16465	xa_quang_ninh	Xã Quảng Ninh	xã	406
16468	xa_quang_binh	Xã Quảng Bình	xã	406
16471	xa_quang_hop	Xã Quảng Hợp	xã	406
16474	xa_quang_van	Xã Quảng Văn	xã	406
16477	xa_quang_long	Xã Quảng Long	xã	406
16480	xa_quang_yen	Xã Quảng Yên	xã	406
16483	xa_quang_hoa	Xã Quảng Hòa	xã	406
16489	xa_quang_khe	Xã Quảng Khê	xã	406
16492	xa_quang_trung	Xã Quảng Trung	xã	406
16495	xa_quang_chinh	Xã Quảng Chính	xã	406
16498	xa_quang_ngoc	Xã Quảng Ngọc	xã	406
16501	xa_quang_truong	Xã Quảng Trường	xã	406
16510	xa_quang_phuc	Xã Quảng Phúc	xã	406
16519	xa_quang_giao	Xã Quảng Giao	xã	406
16540	xa_quang_hai	Xã Quảng Hải	xã	406
16543	xa_quang_luu	Xã Quảng Lưu	xã	406
16546	xa_quang_loc	Xã Quảng Lộc	xã	406
16549	xa_tien_trang	Xã Tiên Trang	xã	406
16552	xa_quang_nham	Xã Quảng Nham	xã	406
16555	xa_quang_thach	Xã Quảng Thạch	xã	406
16558	xa_quang_thai	Xã Quảng Thái	xã	406
16561	phuong_hai_hoa	Phường Hải Hòa	phường	407
16564	phuong_hai_chau	Phường Hải Châu	phường	407
16567	xa_thanh_thuy	Xã Thanh Thủy	xã	407
16570	xa_thanh_son	Xã Thanh Sơn	xã	407
16576	phuong_hai_ninh	Phường Hải Ninh	phường	407
16579	xa_anh_son	Xã Anh Sơn	xã	407
16582	xa_ngoc_linh	Xã Ngọc Lĩnh	xã	407
16585	phuong_hai_an	Phường Hải An	phường	407
16591	xa_cac_son	Xã Các Sơn	xã	407
16594	phuong_tan_dan	Phường Tân Dân	phường	407
16597	phuong_hai_linh	Phường Hải Lĩnh	phường	407
16600	xa_dinh_hai	Xã Định Hải	xã	407
16603	xa_phu_son	Xã Phú Sơn	xã	407
16606	phuong_ninh_hai	Phường Ninh Hải	phường	407
16609	phuong_nguyen_binh	Phường Nguyên Bình	phường	407
16612	xa_hai_nhan	Xã Hải Nhân	xã	407
16618	phuong_binh_minh	Phường Bình Minh	phường	407
16621	phuong_hai_thanh	Phường Hải Thanh	phường	407
16624	xa_phu_lam	Xã Phú Lâm	xã	407
16627	phuong_xuan_lam	Phường Xuân Lâm	phường	407
16630	phuong_truc_lam	Phường Trúc Lâm	phường	407
16633	phuong_hai_binh	Phường Hải Bình	phường	407
16636	xa_tan_truong	Xã Tân Trường	xã	407
16639	xa_tung_lam	Xã Tùng Lâm	xã	407
16642	phuong_tinh_hai	Phường Tĩnh Hải	phường	407
16645	phuong_mai_lam	Phường Mai Lâm	phường	407
16648	xa_truong_lam	Xã Trường Lâm	xã	407
16651	xa_hai_yen	Xã Hải Yến	xã	407
16654	phuong_hai_thuong	Phường Hải Thượng	phường	407
16657	xa_nghi_son	Xã Nghi Sơn	xã	407
16660	xa_hai_ha	Xã Hải Hà	xã	407
16663	phuong_dong_vinh	Phường Đông Vĩnh	phường	412
16666	phuong_ha_huy_tap	Phường Hà Huy Tập	phường	412
16669	phuong_le_loi	Phường Lê Lợi	phường	412
16670	phuong_quan_bau	Phường Quán Bàu	phường	412
16672	phuong_hung_binh	Phường Hưng Bình	phường	412
16673	phuong_hung_phuc	Phường Hưng Phúc	phường	412
16675	phuong_hung_dung	Phường Hưng Dũng	phường	412
16678	phuong_cua_nam	Phường Cửa Nam	phường	412
16681	phuong_quang_trung	Phường Quang Trung	phường	412
16684	phuong_doi_cung	Phường Đội Cung	phường	412
16687	phuong_le_mao	Phường Lê Mao	phường	412
16690	phuong_truong_thi	Phường Trường Thi	phường	412
16693	phuong_ben_thuy	Phường Bến Thủy	phường	412
16696	phuong_hong_son	Phường Hồng Sơn	phường	412
16699	phuong_trung_do	Phường Trung Đô	phường	412
16702	xa_nghi_phu	Xã Nghi Phú	xã	412
16705	xa_hung_dong	Xã Hưng Đông	xã	412
16708	xa_hung_loc	Xã Hưng Lộc	xã	412
16711	xa_hung_hoa	Xã Hưng Hòa	xã	412
16714	phuong_vinh_tan	Phường Vinh Tân	phường	412
17908	xa_nghi_lien	Xã Nghi Liên	xã	412
17914	xa_nghi_an	Xã Nghi Ân	xã	412
17920	xa_nghi_kim	Xã Nghi Kim	xã	412
17923	xa_nghi_duc	Xã Nghi Đức	xã	412
18013	xa_hung_chinh	Xã Hưng Chính	xã	412
16717	phuong_nghi_thuy	Phường Nghi Thuỷ	phường	413
16720	phuong_nghi_tan	Phường Nghi Tân	phường	413
16723	phuong_thu_thuy	Phường Thu Thuỷ	phường	413
16726	phuong_nghi_hoa	Phường Nghi Hòa	phường	413
16729	phuong_nghi_hai	Phường Nghi Hải	phường	413
16732	phuong_nghi_huong	Phường Nghi Hương	phường	413
16735	phuong_nghi_thu	Phường Nghi Thu	phường	413
16939	phuong_hoa_hieu	Phường Hoà Hiếu	phường	414
16993	phuong_quang_phong	Phường Quang Phong	phường	414
16994	phuong_quang_tien	Phường Quang Tiến	phường	414
17003	phuong_long_son	Phường Long Sơn	phường	414
17005	xa_nghia_tien	Xã Nghĩa Tiến	xã	414
17008	xa_nghia_my	Xã Nghĩa Mỹ	xã	414
17011	xa_tay_hieu	Xã Tây Hiếu	xã	414
17014	xa_nghia_thuan	Xã Nghĩa Thuận	xã	414
17017	xa_dong_hieu	Xã Đông Hiếu	xã	414
16738	thi_tran_kim_son	Thị trấn Kim Sơn	thị trấn	415
16741	xa_thong_thu	Xã Thông Thụ	xã	415
16744	xa_dong_van	Xã Đồng Văn	xã	415
16747	xa_hanh_dich	Xã Hạnh Dịch	xã	415
16750	xa_tien_phong	Xã Tiền Phong	xã	415
16753	xa_nam_giai	Xã Nậm Giải	xã	415
16756	xa_tri_le	Xã Tri Lễ	xã	415
16759	xa_chau_kim	Xã Châu Kim	xã	415
16763	xa_muong_noc	Xã Mường Nọc	xã	415
16765	xa_chau_thon	Xã Châu Thôn	xã	415
16768	xa_nam_nhoong	Xã Nậm Nhoóng	xã	415
16771	xa_quang_phong	Xã Quang Phong	xã	415
16774	xa_cam_muon	Xã Căm Muộn	xã	415
16777	thi_tran_tan_lac	Thị trấn Tân Lạc	thị trấn	416
16780	xa_chau_binh	Xã Châu Bính	xã	416
16783	xa_chau_thuan	Xã Châu Thuận	xã	416
16786	xa_chau_hoi	Xã Châu Hội	xã	416
16789	xa_chau_nga	Xã Châu Nga	xã	416
16792	xa_chau_tien	Xã Châu Tiến	xã	416
16795	xa_chau_hanh	Xã Châu Hạnh	xã	416
16798	xa_chau_thang	Xã Châu Thắng	xã	416
16801	xa_chau_phong	Xã Châu Phong	xã	416
16804	xa_chau_binh	Xã Châu Bình	xã	416
16807	xa_chau_hoan	Xã Châu Hoàn	xã	416
16810	xa_dien_lam	Xã Diên Lãm	xã	416
16813	thi_tran_muong_xen	Thị trấn Mường Xén	thị trấn	417
16816	xa_my_ly	Xã Mỹ Lý	xã	417
16819	xa_bac_ly	Xã Bắc Lý	xã	417
16822	xa_keng_du	Xã Keng Đu	xã	417
16825	xa_dooc_may	Xã Đoọc Mạy	xã	417
16828	xa_huoi_tu	Xã Huồi Tụ	xã	417
16831	xa_muong_long	Xã Mường Lống	xã	417
16834	xa_na_loi	Xã Na Loi	xã	417
16837	xa_nam_can	Xã Nậm Cắn	xã	417
16840	xa_bao_nam	Xã Bảo Nam	xã	417
16843	xa_pha_danh	Xã Phà Đánh	xã	417
16846	xa_bao_thang	Xã Bảo Thắng	xã	417
16849	xa_huu_lap	Xã Hữu Lập	xã	417
16852	xa_ta_ca	Xã Tà Cạ	xã	417
16855	xa_chieu_luu	Xã Chiêu Lưu	xã	417
16858	xa_muong_tip	Xã Mường Típ	xã	417
16861	xa_huu_kiem	Xã Hữu Kiệm	xã	417
16864	xa_tay_son	Xã Tây Sơn	xã	417
16867	xa_muong_ai	Xã Mường Ải	xã	417
16870	xa_na_ngoi	Xã Na Ngoi	xã	417
16873	xa_nam_can	Xã Nậm Càn	xã	417
16876	thi_tran_thach_giam	Thị trấn Thạch Giám	thị trấn	418
16879	xa_mai_son	Xã Mai Sơn	xã	418
16882	xa_nhon_mai	Xã Nhôn Mai	xã	418
16885	xa_huu_khuong	Xã Hữu Khuông	xã	418
16900	xa_yen_tinh	Xã Yên Tĩnh	xã	418
16903	xa_nga_my	Xã Nga My	xã	418
16904	xa_xieng_my	Xã Xiêng My	xã	418
16906	xa_luong_minh	Xã Lưỡng Minh	xã	418
16909	xa_yen_hoa	Xã Yên Hòa	xã	418
16912	xa_yen_na	Xã Yên Na	xã	418
16915	xa_luu_kien	Xã Lưu Kiền	xã	418
16921	xa_xa_luong	Xã Xá Lượng	xã	418
16924	xa_tam_thai	Xã Tam Thái	xã	418
16927	xa_tam_dinh	Xã Tam Đình	xã	418
16930	xa_yen_thang	Xã Yên Thắng	xã	418
16933	xa_tam_quang	Xã Tam Quang	xã	418
16936	xa_tam_hop	Xã Tam Hợp	xã	418
16941	thi_tran_nghia_dan	Thị trấn Nghĩa Đàn	thị trấn	419
16942	xa_nghia_mai	Xã Nghĩa Mai	xã	419
16945	xa_nghia_yen	Xã Nghĩa Yên	xã	419
16948	xa_nghia_lac	Xã Nghĩa Lạc	xã	419
16951	xa_nghia_lam	Xã Nghĩa Lâm	xã	419
16954	xa_nghia_son	Xã Nghĩa Sơn	xã	419
16957	xa_nghia_loi	Xã Nghĩa Lợi	xã	419
16960	xa_nghia_binh	Xã Nghĩa Bình	xã	419
16963	xa_nghia_tho	Xã Nghĩa Thọ	xã	419
16966	xa_nghia_minh	Xã Nghĩa Minh	xã	419
16969	xa_nghia_phu	Xã Nghĩa Phú	xã	419
16972	xa_nghia_hung	Xã Nghĩa Hưng	xã	419
16975	xa_nghia_hong	Xã Nghĩa Hồng	xã	419
16978	xa_nghia_thinh	Xã Nghĩa Thịnh	xã	419
16981	xa_nghia_trung	Xã Nghĩa Trung	xã	419
16984	xa_nghia_hoi	Xã Nghĩa Hội	xã	419
16987	xa_nghia_thanh	Xã Nghĩa Thành	xã	419
16996	xa_nghia_hieu	Xã Nghĩa Hiếu	xã	419
17020	xa_nghia_duc	Xã Nghĩa Đức	xã	419
17023	xa_nghia_an	Xã Nghĩa An	xã	419
17026	xa_nghia_long	Xã Nghĩa Long	xã	419
17029	xa_nghia_loc	Xã Nghĩa Lộc	xã	419
17032	xa_nghia_khanh	Xã Nghĩa Khánh	xã	419
17035	thi_tran_quy_hop	Thị trấn Quỳ Hợp	thị trấn	420
17038	xa_yen_hop	Xã Yên Hợp	xã	420
17041	xa_chau_tien	Xã Châu Tiến	xã	420
17044	xa_chau_hong	Xã Châu Hồng	xã	420
17047	xa_dong_hop	Xã Đồng Hợp	xã	420
17050	xa_chau_thanh	Xã Châu Thành	xã	420
17053	xa_lien_hop	Xã Liên Hợp	xã	420
17056	xa_chau_loc	Xã Châu Lộc	xã	420
17059	xa_tam_hop	Xã Tam Hợp	xã	420
17062	xa_chau_cuong	Xã Châu Cường	xã	420
17065	xa_chau_quang	Xã Châu Quang	xã	420
17068	xa_tho_hop	Xã Thọ Hợp	xã	420
17071	xa_minh_hop	Xã Minh Hợp	xã	420
17074	xa_nghia_xuan	Xã Nghĩa Xuân	xã	420
17077	xa_chau_thai	Xã Châu Thái	xã	420
17080	xa_chau_dinh	Xã Châu Đình	xã	420
17083	xa_van_loi	Xã Văn Lợi	xã	420
17086	xa_nam_son	Xã Nam Sơn	xã	420
17089	xa_chau_ly	Xã Châu Lý	xã	420
17092	xa_ha_son	Xã Hạ Sơn	xã	420
17095	xa_bac_son	Xã Bắc Sơn	xã	420
17098	thi_tran_cau_giat	Thị trấn Cầu Giát	thị trấn	421
17101	xa_quynh_thang	Xã Quỳnh Thắng	xã	421
17119	xa_quynh_tan	Xã Quỳnh Tân	xã	421
17122	xa_quynh_chau	Xã Quỳnh Châu	xã	421
17140	xa_tan_son	Xã Tân Sơn	xã	421
17143	xa_quynh_van	Xã Quỳnh Văn	xã	421
17146	xa_ngoc_son	Xã Ngọc Sơn	xã	421
17149	xa_quynh_tam	Xã Quỳnh Tam	xã	421
17152	xa_quynh_hoa	Xã Quỳnh Hoa	xã	421
17155	xa_quynh_thach	Xã Quỳnh Thạch	xã	421
17158	xa_quynh_bang	Xã Quỳnh Bảng	xã	421
17161	xa_quynh_my	Xã Quỳnh Mỹ	xã	421
17164	xa_quynh_thanh	Xã Quỳnh Thanh	xã	421
17167	xa_quynh_hau	Xã Quỳnh Hậu	xã	421
17170	xa_quynh_lam	Xã Quỳnh Lâm	xã	421
17173	xa_quynh_doi	Xã Quỳnh Đôi	xã	421
17176	xa_quynh_luong	Xã Quỳnh Lương	xã	421
17179	xa_quynh_hong	Xã Quỳnh Hồng	xã	421
17182	xa_quynh_yen	Xã Quỳnh Yên	xã	421
17185	xa_quynh_ba	Xã Quỳnh Bá	xã	421
17188	xa_quynh_minh	Xã Quỳnh Minh	xã	421
17191	xa_quynh_dien	Xã Quỳnh Diễn	xã	421
17194	xa_quynh_hung	Xã Quỳnh Hưng	xã	421
17197	xa_quynh_giang	Xã Quỳnh Giang	xã	421
17200	xa_quynh_ngoc	Xã Quỳnh Ngọc	xã	421
17203	xa_quynh_nghia	Xã Quỳnh Nghĩa	xã	421
17206	xa_an_hoa	Xã An Hòa	xã	421
17209	xa_tien_thuy	Xã Tiến Thủy	xã	421
17212	xa_son_hai	Xã Sơn Hải	xã	421
17215	xa_quynh_tho	Xã Quỳnh Thọ	xã	421
17218	xa_quynh_thuan	Xã Quỳnh Thuận	xã	421
17221	xa_quynh_long	Xã Quỳnh Long	xã	421
17224	xa_tan_thang	Xã Tân Thắng	xã	421
17227	thi_tran_con_cuong	Thị trấn Con Cuông	thị trấn	422
17230	xa_binh_chuan	Xã Bình Chuẩn	xã	422
17233	xa_lang_khe	Xã Lạng Khê	xã	422
17236	xa_cam_lam	Xã Cam Lâm	xã	422
17239	xa_thach_ngan	Xã Thạch Ngàn	xã	422
17242	xa_don_phuc	Xã Đôn Phục	xã	422
17245	xa_mau_duc	Xã Mậu Đức	xã	422
17248	xa_chau_khe	Xã Châu Khê	xã	422
17251	xa_chi_khe	Xã Chi Khê	xã	422
17254	xa_bong_khe	Xã Bồng Khê	xã	422
17257	xa_yen_khe	Xã Yên Khê	xã	422
17260	xa_luc_da	Xã Lục Dạ	xã	422
17263	xa_mon_son	Xã Môn Sơn	xã	422
17266	thi_tran_tan_ky	Thị trấn Tân Kỳ	thị trấn	423
17269	xa_tan_hop	Xã Tân Hợp	xã	423
17272	xa_tan_phu	Xã Tân Phú	xã	423
17275	xa_tan_xuan	Xã Tân Xuân	xã	423
17278	xa_giai_xuan	Xã Giai Xuân	xã	423
17281	xa_nghia_binh	Xã Nghĩa Bình	xã	423
17284	xa_nghia_dong	Xã Nghĩa Đồng	xã	423
17287	xa_dong_van	Xã Đồng Văn	xã	423
17290	xa_nghia_thai	Xã Nghĩa Thái	xã	423
17293	xa_nghia_hop	Xã Nghĩa Hợp	xã	423
17296	xa_nghia_hoan	Xã Nghĩa Hoàn	xã	423
17299	xa_nghia_phuc	Xã Nghĩa Phúc	xã	423
17302	xa_tien_ky	Xã Tiên Kỳ	xã	423
17305	xa_tan_an	Xã Tân An	xã	423
17308	xa_nghia_dung	Xã Nghĩa Dũng	xã	423
17311	xa_tan_long	Xã Tân Long	xã	423
17314	xa_ky_son	Xã Kỳ Sơn	xã	423
17317	xa_huong_son	Xã Hương Sơn	xã	423
17320	xa_ky_tan	Xã Kỳ Tân	xã	423
17323	xa_phu_son	Xã Phú Sơn	xã	423
17325	xa_tan_huong	Xã Tân Hương	xã	423
17326	xa_nghia_hanh	Xã Nghĩa Hành	xã	423
17329	thi_tran_anh_son	Thị trấn Anh Sơn	thị trấn	424
17332	xa_tho_son	Xã Thọ Sơn	xã	424
17335	xa_thanh_son	Xã Thành Sơn	xã	424
17338	xa_binh_son	Xã Bình Sơn	xã	424
17341	xa_tam_son	Xã Tam Sơn	xã	424
17344	xa_dinh_son	Xã Đỉnh Sơn	xã	424
17347	xa_hung_son	Xã Hùng Sơn	xã	424
17350	xa_cam_son	Xã Cẩm Sơn	xã	424
17353	xa_duc_son	Xã Đức Sơn	xã	424
17356	xa_tuong_son	Xã Tường Sơn	xã	424
17357	xa_hoa_son	Xã Hoa Sơn	xã	424
17359	xa_tao_son	Xã Tào Sơn	xã	424
17362	xa_vinh_son	Xã Vĩnh Sơn	xã	424
17365	xa_lang_son	Xã Lạng Sơn	xã	424
17368	xa_hoi_son	Xã Hội Sơn	xã	424
17371	xa_thach_son	Xã Thạch Sơn	xã	424
17374	xa_phuc_son	Xã Phúc Sơn	xã	424
17377	xa_long_son	Xã Long Sơn	xã	424
17380	xa_khai_son	Xã Khai Sơn	xã	424
17383	xa_linh_son	Xã Lĩnh Sơn	xã	424
17386	xa_cao_son	Xã Cao Sơn	xã	424
17389	thi_tran_dien_chau	Thị trấn Diễn Châu	thị trấn	425
17392	xa_dien_lam	Xã Diễn Lâm	xã	425
17395	xa_dien_doai	Xã Diễn Đoài	xã	425
17398	xa_dien_truong	Xã Diễn Trường	xã	425
17401	xa_dien_yen	Xã Diễn Yên	xã	425
17404	xa_dien_hoang	Xã Diễn Hoàng	xã	425
17407	xa_dien_hung	Xã Diễn Hùng	xã	425
17410	xa_dien_my	Xã Diễn Mỹ	xã	425
17413	xa_dien_hong	Xã Diễn Hồng	xã	425
17416	xa_dien_phong	Xã Diễn Phong	xã	425
17419	xa_dien_hai	Xã Diễn Hải	xã	425
17422	xa_dien_thap	Xã Diễn Tháp	xã	425
17425	xa_dien_lien	Xã Diễn Liên	xã	425
17428	xa_dien_van	Xã Diễn Vạn	xã	425
17431	xa_dien_kim	Xã Diễn Kim	xã	425
17434	xa_dien_ky	Xã Diễn Kỷ	xã	425
17437	xa_dien_xuan	Xã Diễn Xuân	xã	425
17440	xa_dien_thai	Xã Diễn Thái	xã	425
17443	xa_dien_dong	Xã Diễn Đồng	xã	425
17446	xa_dien_bich	Xã Diễn Bích	xã	425
17449	xa_dien_hanh	Xã Diễn Hạnh	xã	425
17452	xa_dien_ngoc	Xã Diễn Ngọc	xã	425
17455	xa_dien_quang	Xã Diễn Quảng	xã	425
17458	xa_dien_nguyen	Xã Diễn Nguyên	xã	425
17461	xa_dien_hoa	Xã Diễn Hoa	xã	425
17464	xa_dien_thanh	Xã Diễn Thành	xã	425
17467	xa_dien_phuc	Xã Diễn Phúc	xã	425
17476	xa_dien_cat	Xã Diễn Cát	xã	425
17479	xa_dien_thinh	Xã Diễn Thịnh	xã	425
17482	xa_dien_tan	Xã Diễn Tân	xã	425
17485	xa_minh_chau	Xã Minh Châu	xã	425
17488	xa_dien_tho	Xã Diễn Thọ	xã	425
17491	xa_dien_loi	Xã Diễn Lợi	xã	425
17494	xa_dien_loc	Xã Diễn Lộc	xã	425
17497	xa_dien_trung	Xã Diễn Trung	xã	425
17500	xa_dien_an	Xã Diễn An	xã	425
17503	xa_dien_phu	Xã Diễn Phú	xã	425
17506	thi_tran_yen_thanh	Thị trấn Yên Thành	thị trấn	426
17509	xa_ma_thanh	Xã Mã Thành	xã	426
17510	xa_tien_thanh	Xã Tiến Thành	xã	426
17512	xa_lang_thanh	Xã Lăng Thành	xã	426
17515	xa_tan_thanh	Xã Tân Thành	xã	426
17518	xa_duc_thanh	Xã Đức Thành	xã	426
17521	xa_kim_thanh	Xã Kim Thành	xã	426
17524	xa_hau_thanh	Xã Hậu Thành	xã	426
17525	xa_hung_thanh	Xã Hùng Thành	xã	426
17527	xa_do_thanh	Xã Đô Thành	xã	426
17530	xa_tho_thanh	Xã Thọ Thành	xã	426
17533	xa_quang_thanh	Xã Quang Thành	xã	426
17536	xa_tay_thanh	Xã Tây Thành	xã	426
17539	xa_phuc_thanh	Xã Phúc Thành	xã	426
17542	xa_hong_thanh	Xã Hồng Thành	xã	426
17545	xa_dong_thanh	Xã Đồng Thành	xã	426
17548	xa_phu_thanh	Xã Phú Thành	xã	426
17551	xa_hoa_thanh	Xã Hoa Thành	xã	426
17554	xa_tang_thanh	Xã Tăng Thành	xã	426
17557	xa_van_thanh	Xã Văn Thành	xã	426
17560	xa_thinh_thanh	Xã Thịnh Thành	xã	426
17563	xa_hop_thanh	Xã Hợp Thành	xã	426
17566	xa_xuan_thanh	Xã Xuân Thành	xã	426
17569	xa_bac_thanh	Xã Bắc Thành	xã	426
17572	xa_nhan_thanh	Xã Nhân Thành	xã	426
17575	xa_trung_thanh	Xã Trung Thành	xã	426
17578	xa_long_thanh	Xã Long Thành	xã	426
17581	xa_minh_thanh	Xã Minh Thành	xã	426
17584	xa_nam_thanh	Xã Nam Thành	xã	426
17587	xa_vinh_thanh	Xã Vĩnh Thành	xã	426
17590	xa_ly_thanh	Xã Lý Thành	xã	426
17593	xa_khanh_thanh	Xã Khánh Thành	xã	426
17596	xa_vien_thanh	Xã Viên Thành	xã	426
17599	xa_dai_thanh	Xã Đại Thành	xã	426
17602	xa_lien_thanh	Xã Liên Thành	xã	426
17605	xa_bao_thanh	Xã Bảo Thành	xã	426
17608	xa_my_thanh	Xã Mỹ Thành	xã	426
17611	xa_cong_thanh	Xã Công Thành	xã	426
17614	xa_son_thanh	Xã Sơn Thành	xã	426
17617	thi_tran_do_luong	Thị trấn Đô Lương	thị trấn	427
17619	xa_giang_son_dong	Xã Giang Sơn Đông	xã	427
17620	xa_giang_son_tay	Xã Giang Sơn Tây	xã	427
17623	xa_lam_son	Xã Lam Sơn	xã	427
17626	xa_boi_son	Xã Bồi Sơn	xã	427
17629	xa_hong_son	Xã Hồng Sơn	xã	427
17632	xa_bai_son	Xã Bài Sơn	xã	427
17635	xa_ngoc_son	Xã Ngọc Sơn	xã	427
17638	xa_bac_son	Xã Bắc Sơn	xã	427
17641	xa_trang_son	Xã Tràng Sơn	xã	427
17644	xa_thuong_son	Xã Thượng Sơn	xã	427
17647	xa_hoa_son	Xã Hòa Sơn	xã	427
17650	xa_dang_son	Xã Đặng Sơn	xã	427
17653	xa_dong_son	Xã Đông Sơn	xã	427
17656	xa_nam_son	Xã Nam Sơn	xã	427
17659	xa_luu_son	Xã Lưu Sơn	xã	427
17662	xa_yen_son	Xã Yên Sơn	xã	427
17665	xa_van_son	Xã Văn Sơn	xã	427
17668	xa_da_son	Xã Đà Sơn	xã	427
17671	xa_lac_son	Xã Lạc Sơn	xã	427
17674	xa_tan_son	Xã Tân Sơn	xã	427
17677	xa_thai_son	Xã Thái Sơn	xã	427
17680	xa_quang_son	Xã Quang Sơn	xã	427
17683	xa_thinh_son	Xã Thịnh Sơn	xã	427
17686	xa_trung_son	Xã Trung Sơn	xã	427
17689	xa_xuan_son	Xã Xuân Sơn	xã	427
17692	xa_minh_son	Xã Minh Sơn	xã	427
17695	xa_thuan_son	Xã Thuận Sơn	xã	427
17698	xa_nhan_son	Xã Nhân Sơn	xã	427
17701	xa_hien_son	Xã Hiến Sơn	xã	427
17704	xa_my_son	Xã Mỹ Sơn	xã	427
17707	xa_tru_son	Xã Trù Sơn	xã	427
17710	xa_dai_son	Xã Đại Sơn	xã	427
17713	thi_tran_thanh_chuong	Thị trấn Thanh Chương	thị trấn	428
17716	xa_cat_van	Xã Cát Văn	xã	428
17719	xa_thanh_nho	Xã Thanh Nho	xã	428
17722	xa_hanh_lam	Xã Hạnh Lâm	xã	428
17723	xa_thanh_son	Xã Thanh Sơn	xã	428
17725	xa_thanh_hoa	Xã Thanh Hòa	xã	428
17728	xa_phong_thinh	Xã Phong Thịnh	xã	428
17731	xa_thanh_phong	Xã Thanh Phong	xã	428
17734	xa_thanh_my	Xã Thanh Mỹ	xã	428
17737	xa_thanh_tien	Xã Thanh Tiên	xã	428
17743	xa_thanh_lien	Xã Thanh Liên	xã	428
17749	xa_dai_dong	Xã Đại Đồng	xã	428
17752	xa_thanh_dong	Xã Thanh Đồng	xã	428
17755	xa_thanh_ngoc	Xã Thanh Ngọc	xã	428
17758	xa_thanh_huong	Xã Thanh Hương	xã	428
17759	xa_ngoc_lam	Xã Ngọc Lâm	xã	428
17761	xa_thanh_linh	Xã Thanh Lĩnh	xã	428
17764	xa_dong_van	Xã Đồng Văn	xã	428
17767	xa_ngoc_son	Xã Ngọc Sơn	xã	428
17770	xa_thanh_thinh	Xã Thanh Thịnh	xã	428
17773	xa_thanh_an	Xã Thanh An	xã	428
17776	xa_thanh_chi	Xã Thanh Chi	xã	428
17779	xa_xuan_tuong	Xã Xuân Tường	xã	428
17782	xa_thanh_duong	Xã Thanh Dương	xã	428
17785	xa_thanh_luong	Xã Thanh Lương	xã	428
17788	xa_thanh_khe	Xã Thanh Khê	xã	428
17791	xa_vo_liet	Xã Võ Liệt	xã	428
17794	xa_thanh_long	Xã Thanh Long	xã	428
17797	xa_thanh_thuy	Xã Thanh Thủy	xã	428
17800	xa_thanh_khai	Xã Thanh Khai	xã	428
17803	xa_thanh_yen	Xã Thanh Yên	xã	428
17806	xa_thanh_ha	Xã Thanh Hà	xã	428
17809	xa_thanh_giang	Xã Thanh Giang	xã	428
17812	xa_thanh_tung	Xã Thanh Tùng	xã	428
17815	xa_thanh_lam	Xã Thanh Lâm	xã	428
17818	xa_thanh_mai	Xã Thanh Mai	xã	428
17821	xa_thanh_xuan	Xã Thanh Xuân	xã	428
17824	xa_thanh_duc	Xã Thanh Đức	xã	428
17827	thi_tran_quan_hanh	Thị trấn Quán Hành	thị trấn	429
17830	xa_nghi_van	Xã Nghi Văn	xã	429
17833	xa_nghi_yen	Xã Nghi Yên	xã	429
17836	xa_nghi_tien	Xã Nghi Tiến	xã	429
17839	xa_nghi_hung	Xã Nghi Hưng	xã	429
17842	xa_nghi_dong	Xã Nghi Đồng	xã	429
17845	xa_nghi_thiet	Xã Nghi Thiết	xã	429
17848	xa_nghi_lam	Xã Nghi Lâm	xã	429
17851	xa_nghi_quang	Xã Nghi Quang	xã	429
17854	xa_nghi_kieu	Xã Nghi Kiều	xã	429
17857	xa_nghi_my	Xã Nghi Mỹ	xã	429
17860	xa_nghi_phuong	Xã Nghi Phương	xã	429
17863	xa_nghi_thuan	Xã Nghi Thuận	xã	429
17866	xa_nghi_long	Xã Nghi Long	xã	429
17869	xa_nghi_xa	Xã Nghi Xá	xã	429
17875	xa_nghi_hoa	Xã Nghi Hoa	xã	429
17878	xa_khanh_hop	Xã Khánh Hợp	xã	429
17881	xa_nghi_thinh	Xã Nghi Thịnh	xã	429
17884	xa_nghi_cong_bac	Xã Nghi Công Bắc	xã	429
17887	xa_nghi_cong_nam	Xã Nghi Công Nam	xã	429
17890	xa_nghi_thach	Xã Nghi Thạch	xã	429
17893	xa_nghi_trung	Xã Nghi Trung	xã	429
17896	xa_nghi_truong	Xã Nghi Trường	xã	429
17899	xa_nghi_dien	Xã Nghi Diên	xã	429
17902	xa_nghi_phong	Xã Nghi Phong	xã	429
17905	xa_nghi_xuan	Xã Nghi Xuân	xã	429
17911	xa_nghi_van	Xã Nghi Vạn	xã	429
17917	xa_phuc_tho	Xã Phúc Thọ	xã	429
17926	xa_nghi_thai	Xã Nghi Thái	xã	429
17932	xa_nam_hung	Xã Nam Hưng	xã	430
17935	xa_nam_nghia	Xã Nam Nghĩa	xã	430
17938	xa_nam_thanh	Xã Nam Thanh	xã	430
17941	xa_nam_anh	Xã Nam Anh	xã	430
17944	xa_nam_xuan	Xã Nam Xuân	xã	430
17947	xa_nam_thai	Xã Nam Thái	xã	430
17950	thi_tran_nam_dan	Thị trấn Nam Đàn	thị trấn	430
17953	xa_nam_linh	Xã Nam Lĩnh	xã	430
17956	xa_nam_giang	Xã Nam Giang	xã	430
17959	xa_xuan_hoa	Xã Xuân Hòa	xã	430
17962	xa_hung_tien	Xã Hùng Tiến	xã	430
17968	xa_thuong_tan_loc	Xã Thượng Tân Lộc	xã	430
17971	xa_kim_lien	Xã Kim Liên	xã	430
17977	xa_hong_long	Xã Hồng Long	xã	430
17980	xa_xuan_lam	Xã Xuân Lâm	xã	430
17983	xa_nam_cat	Xã Nam Cát	xã	430
17986	xa_khanh_son	Xã Khánh Sơn	xã	430
17989	xa_trung_phuc_cuong	Xã Trung Phúc Cường	xã	430
17998	xa_nam_kim	Xã Nam Kim	xã	430
18001	thi_tran_hung_nguyen	Thị trấn Hưng Nguyên	thị trấn	431
18004	xa_hung_trung	Xã Hưng Trung	xã	431
18007	xa_hung_yen	Xã Hưng Yên	xã	431
18008	xa_hung_yen_bac	Xã Hưng Yên Bắc	xã	431
18010	xa_hung_tay	Xã Hưng Tây	xã	431
18016	xa_hung_dao	Xã Hưng Đạo	xã	431
18019	xa_hung_my	Xã Hưng Mỹ	xã	431
18022	xa_hung_thinh	Xã Hưng Thịnh	xã	431
18025	xa_hung_linh	Xã Hưng Lĩnh	xã	431
18028	xa_hung_thong	Xã Hưng Thông	xã	431
18031	xa_hung_tan	Xã Hưng Tân	xã	431
18034	xa_hung_loi	Xã Hưng Lợi	xã	431
18037	xa_hung_nghia	Xã Hưng Nghĩa	xã	431
18040	xa_hung_phuc	Xã Hưng Phúc	xã	431
18043	xa_long_xa	Xã Long Xá	xã	431
18052	xa_chau_nhan	Xã Châu Nhân	xã	431
18055	xa_xuan_lam	Xã Xuân Lam	xã	431
18064	xa_hung_thanh	Xã Hưng Thành	xã	431
17104	xa_quynh_vinh	Xã Quỳnh Vinh	xã	432
17107	xa_quynh_loc	Xã Quỳnh Lộc	xã	432
17110	phuong_quynh_thien	Phường Quỳnh Thiện	phường	432
17113	xa_quynh_lap	Xã Quỳnh Lập	xã	432
17116	xa_quynh_trang	Xã Quỳnh Trang	xã	432
17125	phuong_mai_hung	Phường Mai Hùng	phường	432
17128	phuong_quynh_di	Phường Quỳnh Dị	phường	432
17131	phuong_quynh_xuan	Phường Quỳnh Xuân	phường	432
17134	phuong_quynh_phuong	Phường Quỳnh Phương	phường	432
17137	xa_quynh_lien	Xã Quỳnh Liên	xã	432
18070	phuong_tran_phu	Phường Trần Phú	phường	436
18073	phuong_nam_ha	Phường Nam Hà	phường	436
18076	phuong_bac_ha	Phường Bắc Hà	phường	436
18077	phuong_nguyen_du	Phường Nguyễn Du	phường	436
18079	phuong_tan_giang	Phường Tân Giang	phường	436
18082	phuong_dai_nai	Phường Đại Nài	phường	436
18085	phuong_ha_huy_tap	Phường Hà Huy Tập	phường	436
18088	xa_thach_trung	Xã Thạch Trung	xã	436
18091	phuong_thach_quy	Phường Thạch Quý	phường	436
18094	phuong_thach_linh	Phường Thạch Linh	phường	436
18097	phuong_van_yen	Phường Văn Yên	phường	436
18100	xa_thach_ha	Xã Thạch Hạ	xã	436
18103	xa_dong_mon	Xã Đồng Môn	xã	436
18109	xa_thach_hung	Xã Thạch Hưng	xã	436
18112	xa_thach_binh	Xã Thạch Bình	xã	436
18115	phuong_bac_hong	Phường Bắc Hồng	phường	437
18118	phuong_nam_hong	Phường Nam Hồng	phường	437
18121	phuong_trung_luong	Phường Trung Lương	phường	437
18124	phuong_duc_thuan	Phường Đức Thuận	phường	437
18127	phuong_dau_lieu	Phường Đậu Liêu	phường	437
18130	xa_thuan_loc	Xã Thuận Lộc	xã	437
18133	thi_tran_pho_chau	Thị trấn Phố Châu	thị trấn	439
18136	thi_tran_tay_son	Thị trấn Tây Sơn	thị trấn	439
18139	xa_son_hong	Xã Sơn Hồng	xã	439
18142	xa_son_tien	Xã Sơn Tiến	xã	439
18145	xa_son_lam	Xã Sơn Lâm	xã	439
18148	xa_son_le	Xã Sơn Lễ	xã	439
18157	xa_son_giang	Xã Sơn Giang	xã	439
18160	xa_son_linh	Xã Sơn Lĩnh	xã	439
18163	xa_an_hoa_thinh	Xã An Hòa Thịnh	xã	439
18172	xa_son_tay	Xã Sơn Tây	xã	439
18175	xa_son_ninh	Xã Sơn Ninh	xã	439
18178	xa_son_chau	Xã Sơn Châu	xã	439
18181	xa_tan_my_ha	Xã Tân Mỹ Hà	xã	439
18184	xa_quang_diem	Xã Quang Diệm	xã	439
18187	xa_son_trung	Xã Sơn Trung	xã	439
18190	xa_son_bang	Xã Sơn Bằng	xã	439
18193	xa_son_binh	Xã Sơn Bình	xã	439
18196	xa_son_kim_1	Xã Sơn Kim 1	xã	439
18199	xa_son_kim_2	Xã Sơn Kim 2	xã	439
18202	xa_son_tra	Xã Sơn Trà	xã	439
18205	xa_son_long	Xã Sơn Long	xã	439
18211	xa_kim_hoa	Xã Kim Hoa	xã	439
18214	xa_son_ham	Xã Sơn Hàm	xã	439
18217	xa_son_phu	Xã Sơn Phú	xã	439
18223	xa_son_truong	Xã Sơn Trường	xã	439
18229	thi_tran_duc_tho	Thị trấn Đức Thọ	thị trấn	440
18235	xa_quang_vinh	Xã Quang Vĩnh	xã	440
18241	xa_tung_chau	Xã Tùng Châu	xã	440
18244	xa_truong_son	Xã Trường Sơn	xã	440
18247	xa_lien_minh	Xã Liên Minh	xã	440
18253	xa_yen_ho	Xã Yên Hồ	xã	440
18259	xa_tung_anh	Xã Tùng Ảnh	xã	440
18262	xa_bui_la_nhan	Xã Bùi La Nhân	xã	440
18274	xa_thanh_binh_thinh	Xã Thanh Bình Thịnh	xã	440
18277	xa_lam_trung_thuy	Xã Lâm Trung Thủy	xã	440
18280	xa_hoa_lac	Xã Hòa Lạc	xã	440
18283	xa_tan_dan	Xã Tân Dân	xã	440
18298	xa_an_dung	Xã An Dũng	xã	440
18304	xa_duc_dong	Xã Đức Đồng	xã	440
18307	xa_duc_lang	Xã Đức Lạng	xã	440
18310	xa_tan_huong	Xã Tân Hương	xã	440
18313	thi_tran_vu_quang	Thị trấn Vũ Quang	thị trấn	441
18316	xa_an_phu	Xã Ân Phú	xã	441
18319	xa_duc_giang	Xã Đức Giang	xã	441
18322	xa_duc_linh	Xã Đức Lĩnh	xã	441
18325	xa_tho_dien	Xã Thọ Điền	xã	441
18328	xa_duc_huong	Xã Đức Hương	xã	441
18331	xa_duc_bong	Xã Đức Bồng	xã	441
18334	xa_duc_lien	Xã Đức Liên	xã	441
18340	xa_huong_minh	Xã Hương Minh	xã	441
18343	xa_quang_tho	Xã Quang Thọ	xã	441
18352	thi_tran_xuan_an	Thị trấn Xuân An	thị trấn	442
18355	xa_xuan_hoi	Xã Xuân Hội	xã	442
18358	xa_dan_truong	Xã Đan Trường	xã	442
18364	xa_xuan_pho	Xã Xuân Phổ	xã	442
18367	xa_xuan_hai	Xã Xuân Hải	xã	442
18370	xa_xuan_giang	Xã Xuân Giang	xã	442
18373	thi_tran_tien_dien	Thị trấn Tiên Điền	thị trấn	442
18376	xa_xuan_yen	Xã Xuân Yên	xã	442
18379	xa_xuan_my	Xã Xuân Mỹ	xã	442
18382	xa_xuan_thanh	Xã Xuân Thành	xã	442
18385	xa_xuan_vien	Xã Xuân Viên	xã	442
18388	xa_xuan_hong	Xã Xuân Hồng	xã	442
18391	xa_co_dam	Xã Cỗ Đạm	xã	442
18394	xa_xuan_lien	Xã Xuân Liên	xã	442
18397	xa_xuan_linh	Xã Xuân Lĩnh	xã	442
18400	xa_xuan_lam	Xã Xuân Lam	xã	442
18403	xa_cuong_gian	Xã Cương Gián	xã	442
18406	thi_tran_nghen	Thị trấn Nghèn	thị trấn	443
18415	xa_thien_loc	Xã Thiên Lộc	xã	443
18418	xa_thuan_thien	Xã Thuần Thiện	xã	443
18427	xa_vuong_loc	Xã Vượng Lộc	xã	443
18433	xa_thanh_loc	Xã Thanh Lộc	xã	443
18436	xa_kim_song_truong	Xã Kim Song Trường	xã	443
18439	xa_thuong_nga	Xã Thường Nga	xã	443
18445	xa_tung_loc	Xã Tùng Lộc	xã	443
18454	xa_phu_loc	Xã Phú Lộc	xã	443
18463	xa_gia_hanh	Xã Gia Hanh	xã	443
18466	xa_khanh_vinh_yen	Xã Khánh Vĩnh Yên	xã	443
18472	xa_trung_loc	Xã Trung Lộc	xã	443
18475	xa_xuan_loc	Xã Xuân Lộc	xã	443
18478	xa_thuong_loc	Xã Thượng Lộc	xã	443
18481	xa_quang_loc	Xã Quang Lộc	xã	443
18484	thi_tran_dong_loc	Thị trấn Đồng Lộc	thị trấn	443
18487	xa_my_loc	Xã Mỹ Lộc	xã	443
18490	xa_son_loc	Xã Sơn Lộc	xã	443
18496	thi_tran_huong_khe	Thị trấn Hương Khê	thị trấn	444
18499	xa_dien_my	Xã Điền Mỹ	xã	444
18502	xa_ha_linh	Xã Hà Linh	xã	444
18505	xa_huong_thuy	Xã Hương Thủy	xã	444
18508	xa_hoa_hai	Xã Hòa Hải	xã	444
18514	xa_phuc_dong	Xã Phúc Đồng	xã	444
18517	xa_huong_giang	Xã Hương Giang	xã	444
18520	xa_loc_yen	Xã Lộc Yên	xã	444
18523	xa_huong_binh	Xã Hương Bình	xã	444
18526	xa_huong_long	Xã Hương Long	xã	444
18529	xa_phu_gia	Xã Phú Gia	xã	444
18532	xa_gia_pho	Xã Gia Phố	xã	444
18535	xa_phu_phong	Xã Phú Phong	xã	444
18538	xa_huong_do	Xã Hương Đô	xã	444
18541	xa_huong_vinh	Xã Hương Vĩnh	xã	444
18544	xa_huong_xuan	Xã Hương Xuân	xã	444
18547	xa_phuc_trach	Xã Phúc Trạch	xã	444
18550	xa_huong_tra	Xã Hương Trà	xã	444
18553	xa_huong_trach	Xã Hương Trạch	xã	444
18556	xa_huong_lam	Xã Hương Lâm	xã	444
18559	xa_huong_lien	Xã Hương Liên	xã	444
18562	thi_tran_thach_ha	Thị trấn Thạch Hà	thị trấn	445
18565	xa_ngoc_son	Xã Ngọc Sơn	xã	445
18571	xa_thach_hai	Xã Thạch Hải	xã	445
18586	xa_thach_kenh	Xã Thạch Kênh	xã	445
18589	xa_thach_son	Xã Thạch Sơn	xã	445
18592	xa_thach_lien	Xã Thạch Liên	xã	445
18595	xa_dinh_ban	Xã Đỉnh Bàn	xã	445
18601	xa_viet_tien	Xã Việt Tiến	xã	445
18604	xa_thach_khe	Xã Thạch Khê	xã	445
18607	xa_thach_long	Xã Thạch Long	xã	445
18619	xa_thach_tri	Xã Thạch Trị	xã	445
18622	xa_thach_lac	Xã Thạch Lạc	xã	445
18625	xa_thach_ngoc	Xã Thạch Ngọc	xã	445
18628	xa_tuong_son	Xã Tượng Sơn	xã	445
18631	xa_thach_van	Xã Thạch Văn	xã	445
18634	xa_luu_vinh_son	Xã Lưu Vĩnh Sơn	xã	445
18637	xa_thach_thang	Xã Thạch Thắng	xã	445
18643	xa_thach_dai	Xã Thạch Đài	xã	445
18649	xa_thach_hoi	Xã Thạch Hội	xã	445
18652	xa_tan_lam_huong	Xã Tân Lâm Hương	xã	445
18658	xa_thach_xuan	Xã Thạch Xuân	xã	445
18667	xa_nam_dien	Xã Nam Điền	xã	445
18673	thi_tran_cam_xuyen	Thị trấn Cẩm Xuyên	thị trấn	446
18676	thi_tran_thien_cam	Thị trấn Thiên Cầm	thị trấn	446
18679	xa_yen_hoa	Xã Yên Hòa	xã	446
18682	xa_cam_duong	Xã Cẩm Dương	xã	446
18685	xa_cam_binh	Xã Cẩm Bình	xã	446
18691	xa_cam_vinh	Xã Cẩm Vĩnh	xã	446
18694	xa_cam_thanh	Xã Cẩm Thành	xã	446
18697	xa_cam_quang	Xã Cẩm Quang	xã	446
18706	xa_cam_thach	Xã Cẩm Thạch	xã	446
18709	xa_cam_nhuong	Xã Cẩm Nhượng	xã	446
18712	xa_nam_phuc_thang	Xã Nam Phúc Thăng	xã	446
18715	xa_cam_due	Xã Cẩm Duệ	xã	446
18721	xa_cam_linh	Xã Cẩm Lĩnh	xã	446
18724	xa_cam_quan	Xã Cẩm Quan	xã	446
18727	xa_cam_ha	Xã Cẩm Hà	xã	446
18730	xa_cam_loc	Xã Cẩm Lộc	xã	446
18733	xa_cam_hung	Xã Cẩm Hưng	xã	446
18736	xa_cam_thinh	Xã Cẩm Thịnh	xã	446
18739	xa_cam_my	Xã Cẩm Mỹ	xã	446
18742	xa_cam_trung	Xã Cẩm Trung	xã	446
18745	xa_cam_son	Xã Cẩm Sơn	xã	446
18748	xa_cam_lac	Xã Cẩm Lạc	xã	446
18751	xa_cam_minh	Xã Cẩm Minh	xã	446
18757	xa_ky_xuan	Xã Kỳ Xuân	xã	447
18760	xa_ky_bac	Xã Kỳ Bắc	xã	447
18763	xa_ky_phu	Xã Kỳ Phú	xã	447
18766	xa_ky_phong	Xã Kỳ Phong	xã	447
18769	xa_ky_tien	Xã Kỳ Tiến	xã	447
18772	xa_ky_giang	Xã Kỳ Giang	xã	447
18775	xa_ky_dong	Xã Kỳ Đồng	xã	447
18778	xa_ky_khang	Xã Kỳ Khang	xã	447
18784	xa_ky_van	Xã Kỳ Văn	xã	447
18787	xa_ky_trung	Xã Kỳ Trung	xã	447
18790	xa_ky_tho	Xã Kỳ Thọ	xã	447
18793	xa_ky_tay	Xã Kỳ Tây	xã	447
18799	xa_ky_thuong	Xã Kỳ Thượng	xã	447
18802	xa_ky_hai	Xã Kỳ Hải	xã	447
18805	xa_ky_thu	Xã Kỳ Thư	xã	447
18811	xa_ky_chau	Xã Kỳ Châu	xã	447
18814	xa_ky_tan	Xã Kỳ Tân	xã	447
18838	xa_lam_hop	Xã Lâm Hợp	xã	447
18844	xa_ky_son	Xã Kỳ Sơn	xã	447
18850	xa_ky_lac	Xã Kỳ Lạc	xã	447
18409	xa_tan_loc	Xã Tân Lộc	xã	448
18412	xa_hong_loc	Xã Hồng Lộc	xã	448
18421	xa_thinh_loc	Xã Thịnh Lộc	xã	448
18430	xa_binh_an	Xã Bình An	xã	448
18457	xa_ich_hau	Xã Ích Hậu	xã	448
18493	xa_phu_luu	Xã Phù Lưu	xã	448
18568	thi_tran_loc_ha	Thị trấn Lộc Hà	thị trấn	448
18577	xa_thach_my	Xã Thạch Mỹ	xã	448
18580	xa_thach_kim	Xã Thạch Kim	xã	448
18583	xa_thach_chau	Xã Thạch Châu	xã	448
18598	xa_ho_do	Xã Hộ Độ	xã	448
18670	xa_mai_phu	Xã Mai Phụ	xã	448
18754	phuong_hung_tri	Phường Hưng Trí	phường	449
18781	xa_ky_ninh	Xã Kỳ Ninh	xã	449
18796	xa_ky_loi	Xã Kỳ Lợi	xã	449
18808	xa_ky_ha	Xã Kỳ Hà	xã	449
18820	phuong_ky_trinh	Phường Kỳ Trinh	phường	449
18823	phuong_ky_thinh	Phường Kỳ Thịnh	phường	449
18829	xa_ky_hoa	Xã Kỳ Hoa	xã	449
18832	phuong_ky_phuong	Phường Kỳ Phương	phường	449
18835	phuong_ky_long	Phường Kỳ Long	phường	449
18841	phuong_ky_lien	Phường Kỳ Liên	phường	449
18847	xa_ky_nam	Xã Kỳ Nam	xã	449
18853	phuong_hai_thanh	Phường Hải Thành	phường	450
18856	phuong_dong_phu	Phường Đồng Phú	phường	450
18859	phuong_bac_ly	Phường Bắc Lý	phường	450
18865	phuong_nam_ly	Phường Nam Lý	phường	450
18868	phuong_dong_hai	Phường Đồng Hải	phường	450
18871	phuong_dong_son	Phường Đồng Sơn	phường	450
18874	phuong_phu_hai	Phường Phú Hải	phường	450
18877	phuong_bac_nghia	Phường Bắc Nghĩa	phường	450
18880	phuong_duc_ninh_dong	Phường Đức Ninh Đông	phường	450
18883	xa_quang_phu	Xã Quang Phú	xã	450
18886	xa_loc_ninh	Xã Lộc Ninh	xã	450
18889	xa_bao_ninh	Xã Bảo Ninh	xã	450
18892	xa_nghia_ninh	Xã Nghĩa Ninh	xã	450
18895	xa_thuan_duc	Xã Thuận Đức	xã	450
18898	xa_duc_ninh	Xã Đức Ninh	xã	450
18901	thi_tran_quy_dat	Thị trấn Quy Đạt	thị trấn	452
18904	xa_dan_hoa	Xã Dân Hóa	xã	452
18907	xa_trong_hoa	Xã Trọng Hóa	xã	452
18910	xa_hoa_phuc	Xã Hóa Phúc	xã	452
18913	xa_hong_hoa	Xã Hồng Hóa	xã	452
18916	xa_hoa_thanh	Xã Hóa Thanh	xã	452
18919	xa_hoa_tien	Xã Hóa Tiến	xã	452
18922	xa_hoa_hop	Xã Hóa Hợp	xã	452
18925	xa_xuan_hoa	Xã Xuân Hóa	xã	452
18928	xa_yen_hoa	Xã Yên Hóa	xã	452
18931	xa_minh_hoa	Xã Minh Hóa	xã	452
18934	xa_tan_hoa	Xã Tân Hóa	xã	452
18937	xa_hoa_son	Xã Hóa Sơn	xã	452
18943	xa_trung_hoa	Xã Trung Hóa	xã	452
18946	xa_thuong_hoa	Xã Thượng Hóa	xã	452
18949	thi_tran_dong_le	Thị trấn Đồng Lê	thị trấn	453
18952	xa_huong_hoa	Xã Hương Hóa	xã	453
18955	xa_kim_hoa	Xã Kim Hóa	xã	453
18958	xa_thanh_hoa	Xã Thanh Hóa	xã	453
18961	xa_thanh_thach	Xã Thanh Thạch	xã	453
18964	xa_thuan_hoa	Xã Thuận Hóa	xã	453
18967	xa_lam_hoa	Xã Lâm Hóa	xã	453
18970	xa_le_hoa	Xã Lê Hóa	xã	453
18973	xa_son_hoa	Xã Sơn Hóa	xã	453
18976	xa_dong_hoa	Xã Đồng Hóa	xã	453
18979	xa_ngu_hoa	Xã Ngư Hóa	xã	453
18985	xa_thach_hoa	Xã Thạch Hóa	xã	453
18988	xa_duc_hoa	Xã Đức Hóa	xã	453
18991	xa_phong_hoa	Xã Phong Hóa	xã	453
18994	xa_mai_hoa	Xã Mai Hóa	xã	453
18997	xa_tien_hoa	Xã Tiến Hóa	xã	453
19000	xa_chau_hoa	Xã Châu Hóa	xã	453
19003	xa_cao_quang	Xã Cao Quảng	xã	453
19006	xa_van_hoa	Xã Văn Hóa	xã	453
19012	xa_quang_hop	Xã Quảng Hợp	xã	454
19015	xa_quang_kim	Xã Quảng Kim	xã	454
19018	xa_quang_dong	Xã Quảng Đông	xã	454
19021	xa_quang_phu	Xã Quảng Phú	xã	454
19024	xa_quang_chau	Xã Quảng Châu	xã	454
19027	xa_quang_thach	Xã Quảng Thạch	xã	454
19030	xa_quang_luu	Xã Quảng Lưu	xã	454
19033	xa_quang_tung	Xã Quảng Tùng	xã	454
19036	xa_canh_duong	Xã Cảnh Dương	xã	454
19039	xa_quang_tien	Xã Quảng Tiến	xã	454
19042	xa_quang_hung	Xã Quảng Hưng	xã	454
19045	xa_quang_xuan	Xã Quảng Xuân	xã	454
19048	xa_canh_hoa	Xã Cảnh Hóa	xã	454
19051	xa_lien_truong	Xã Liên Trường	xã	454
19057	xa_quang_phuong	Xã Quảng Phương	xã	454
19063	xa_phu_hoa	Xã Phù Hóa	xã	454
19072	xa_quang_thanh	Xã Quảng Thanh	xã	454
19111	thi_tran_hoan_lao	Thị trấn Hoàn Lão	thị trấn	455
19114	thi_tran_nt_viet_trung	Thị trấn NT Việt Trung	thị trấn	455
19117	xa_xuan_trach	Xã Xuân Trạch	xã	455
19120	xa_my_trach	Xã Mỹ Trạch	xã	455
19123	xa_ha_trach	Xã Hạ Trạch	xã	455
19126	xa_bac_trach	Xã Bắc Trạch	xã	455
19129	xa_lam_trach	Xã Lâm Trạch	xã	455
19132	xa_thanh_trach	Xã Thanh Trạch	xã	455
19135	xa_lien_trach	Xã Liên Trạch	xã	455
19138	xa_phuc_trach	Xã Phúc Trạch	xã	455
19141	xa_cu_nam	Xã Cự Nẫm	xã	455
19144	xa_hai_phu	Xã Hải Phú	xã	455
19147	xa_thuong_trach	Xã Thượng Trạch	xã	455
19150	xa_son_loc	Xã Sơn Lộc	xã	455
19156	xa_hung_trach	Xã Hưng Trạch	xã	455
19159	xa_dong_trach	Xã Đồng Trạch	xã	455
19162	xa_duc_trach	Xã Đức Trạch	xã	455
19165	thi_tran_phong_nha	Thị trấn Phong Nha	thị trấn	455
19168	xa_van_trach	Xã Vạn Trạch	xã	455
19174	xa_phu_dinh	Xã Phú Định	xã	455
19177	xa_trung_trach	Xã Trung Trạch	xã	455
19180	xa_tay_trach	Xã Tây Trạch	xã	455
19183	xa_hoa_trach	Xã Hòa Trạch	xã	455
19186	xa_dai_trach	Xã Đại Trạch	xã	455
19189	xa_nhan_trach	Xã Nhân Trạch	xã	455
19192	xa_tan_trach	Xã Tân Trạch	xã	455
19195	xa_nam_trach	Xã Nam Trạch	xã	455
19198	xa_ly_trach	Xã Lý Trạch	xã	455
19201	thi_tran_quan_hau	Thị trấn Quán Hàu	thị trấn	456
19204	xa_truong_son	Xã Trường Sơn	xã	456
19207	xa_luong_ninh	Xã Lương Ninh	xã	456
19210	xa_vinh_ninh	Xã Vĩnh Ninh	xã	456
19213	xa_vo_ninh	Xã Võ Ninh	xã	456
19216	xa_hai_ninh	Xã Hải Ninh	xã	456
19219	xa_ham_ninh	Xã Hàm Ninh	xã	456
19222	xa_duy_ninh	Xã Duy Ninh	xã	456
19225	xa_gia_ninh	Xã Gia Ninh	xã	456
19228	xa_truong_xuan	Xã Trường Xuân	xã	456
19231	xa_hien_ninh	Xã Hiền Ninh	xã	456
19234	xa_tan_ninh	Xã Tân Ninh	xã	456
19237	xa_xuan_ninh	Xã Xuân Ninh	xã	456
19240	xa_an_ninh	Xã An Ninh	xã	456
19243	xa_van_ninh	Xã Vạn Ninh	xã	456
19246	thi_tran_nt_le_ninh	Thị trấn NT Lệ Ninh	thị trấn	457
19249	thi_tran_kien_giang	Thị trấn Kiến Giang	thị trấn	457
19252	xa_hong_thuy	Xã Hồng Thủy	xã	457
19255	xa_ngu_thuy_bac	Xã Ngư Thủy Bắc	xã	457
19258	xa_hoa_thuy	Xã Hoa Thủy	xã	457
19261	xa_thanh_thuy	Xã Thanh Thủy	xã	457
19264	xa_an_thuy	Xã An Thủy	xã	457
19267	xa_phong_thuy	Xã Phong Thủy	xã	457
19270	xa_cam_thuy	Xã Cam Thủy	xã	457
19273	xa_ngan_thuy	Xã Ngân Thủy	xã	457
19276	xa_son_thuy	Xã Sơn Thủy	xã	457
19279	xa_loc_thuy	Xã Lộc Thủy	xã	457
19285	xa_lien_thuy	Xã Liên Thủy	xã	457
19288	xa_hung_thuy	Xã Hưng Thủy	xã	457
19291	xa_duong_thuy	Xã Dương Thủy	xã	457
19294	xa_tan_thuy	Xã Tân Thủy	xã	457
19297	xa_phu_thuy	Xã Phú Thủy	xã	457
19300	xa_xuan_thuy	Xã Xuân Thủy	xã	457
19303	xa_my_thuy	Xã Mỹ Thủy	xã	457
19306	xa_ngu_thuy	Xã Ngư Thủy	xã	457
19309	xa_mai_thuy	Xã Mai Thủy	xã	457
19312	xa_sen_thuy	Xã Sen Thủy	xã	457
19315	xa_thai_thuy	Xã Thái Thủy	xã	457
19318	xa_kim_thuy	Xã Kim Thủy	xã	457
19321	xa_truong_thuy	Xã Trường Thủy	xã	457
19327	xa_lam_thuy	Xã Lâm Thủy	xã	457
19009	phuong_ba_don	Phường Ba Đồn	phường	458
19060	phuong_quang_long	Phường Quảng Long	phường	458
19066	phuong_quang_tho	Phường Quảng Thọ	phường	458
19069	xa_quang_tien	Xã Quảng Tiên	xã	458
19075	xa_quang_trung	Xã Quảng Trung	xã	458
19078	phuong_quang_phong	Phường Quảng Phong	phường	458
19081	phuong_quang_thuan	Phường Quảng Thuận	phường	458
19084	xa_quang_tan	Xã Quảng Tân	xã	458
19087	xa_quang_hai	Xã Quảng Hải	xã	458
19090	xa_quang_son	Xã Quảng Sơn	xã	458
19093	xa_quang_loc	Xã Quảng Lộc	xã	458
19096	xa_quang_thuy	Xã Quảng Thủy	xã	458
19099	xa_quang_van	Xã Quảng Văn	xã	458
19102	phuong_quang_phuc	Phường Quảng Phúc	phường	458
19105	xa_quang_hoa	Xã Quảng Hòa	xã	458
19108	xa_quang_minh	Xã Quảng Minh	xã	458
19330	phuong_dong_giang	Phường Đông Giang	phường	461
19333	phuong_1	Phường 1	phường	461
19336	phuong_dong_le	Phường Đông Lễ	phường	461
19339	phuong_dong_thanh	Phường Đông Thanh	phường	461
19342	phuong_2	Phường 2	phường	461
19345	phuong_4	Phường 4	phường	461
19348	phuong_5	Phường 5	phường	461
19351	phuong_dong_luong	Phường Đông Lương	phường	461
19354	phuong_3	Phường 3	phường	461
19357	phuong_1	Phường 1	phường	462
19358	phuong_an_don	Phường An Đôn	phường	462
19360	phuong_2	Phường 2	phường	462
19361	phuong_3	Phường 3	phường	462
19705	xa_hai_le	Xã Hải Lệ	xã	462
19363	thi_tran_ho_xa	Thị trấn Hồ Xá	thị trấn	464
19366	thi_tran_ben_quan	Thị trấn Bến Quan	thị trấn	464
19369	xa_vinh_thai	Xã Vĩnh Thái	xã	464
19372	xa_vinh_tu	Xã Vĩnh Tú	xã	464
19375	xa_vinh_chap	Xã Vĩnh Chấp	xã	464
19378	xa_trung_nam	Xã Trung Nam	xã	464
19384	xa_kim_thach	Xã Kim Thạch	xã	464
19387	xa_vinh_long	Xã Vĩnh Long	xã	464
19393	xa_vinh_khe	Xã Vĩnh Khê	xã	464
19396	xa_vinh_hoa	Xã Vĩnh Hòa	xã	464
19402	xa_vinh_thuy	Xã Vĩnh Thủy	xã	464
19405	xa_vinh_lam	Xã Vĩnh Lâm	xã	464
19408	xa_hien_thanh	Xã Hiền Thành	xã	464
19414	thi_tran_cua_tung	Thị trấn Cửa Tùng	thị trấn	464
19417	xa_vinh_ha	Xã Vĩnh Hà	xã	464
19420	xa_vinh_son	Xã Vĩnh Sơn	xã	464
19423	xa_vinh_giang	Xã Vĩnh Giang	xã	464
19426	xa_vinh_o	Xã Vĩnh Ô	xã	464
19429	thi_tran_khe_sanh	Thị trấn Khe Sanh	thị trấn	465
19432	thi_tran_lao_bao	Thị trấn Lao Bảo	thị trấn	465
19435	xa_huong_lap	Xã Hướng Lập	xã	465
19438	xa_huong_viet	Xã Hướng Việt	xã	465
19441	xa_huong_phung	Xã Hướng Phùng	xã	465
19444	xa_huong_son	Xã Hướng Sơn	xã	465
19447	xa_huong_linh	Xã Hướng Linh	xã	465
19450	xa_tan_hop	Xã Tân Hợp	xã	465
19453	xa_huong_tan	Xã Hướng Tân	xã	465
19456	xa_tan_thanh	Xã Tân Thành	xã	465
19459	xa_tan_long	Xã Tân Long	xã	465
19462	xa_tan_lap	Xã Tân Lập	xã	465
19465	xa_tan_lien	Xã Tân Liên	xã	465
19468	xa_huc	Xã Húc	xã	465
19471	xa_thuan	Xã Thuận	xã	465
19474	xa_huong_loc	Xã Hướng Lộc	xã	465
19477	xa_ba_tang	Xã Ba Tầng	xã	465
19480	xa_thanh	Xã Thanh	xã	465
19483	xa_a_doi	Xã A Dơi	xã	465
19489	xa_lia	Xã Lìa	xã	465
19492	xa_xy	Xã Xy	xã	465
19495	thi_tran_gio_linh	Thị trấn Gio Linh	thị trấn	466
19496	thi_tran_cua_viet	Thị trấn Cửa Việt	thị trấn	466
19498	xa_trung_giang	Xã Trung Giang	xã	466
19501	xa_trung_hai	Xã Trung Hải	xã	466
19504	xa_trung_son	Xã Trung Sơn	xã	466
19507	xa_phong_binh	Xã Phong Bình	xã	466
19510	xa_gio_my	Xã Gio Mỹ	xã	466
19519	xa_gio_hai	Xã Gio Hải	xã	466
19522	xa_gio_an	Xã Gio An	xã	466
19525	xa_gio_chau	Xã Gio Châu	xã	466
19531	xa_gio_viet	Xã Gio Việt	xã	466
19534	xa_linh_truong	Xã Linh Trường	xã	466
19537	xa_gio_son	Xã Gio Sơn	xã	466
19543	xa_gio_mai	Xã Gio Mai	xã	466
19546	xa_hai_thai	Xã Hải Thái	xã	466
19549	xa_linh_hai	Xã Linh Hải	xã	466
19552	xa_gio_quang	Xã Gio Quang	xã	466
19555	thi_tran_krong_klang	Thị trấn Krông Klang	thị trấn	467
19558	xa_mo_o	Xã Mò Ó	xã	467
19561	xa_huong_hiep	Xã Hướng Hiệp	xã	467
19564	xa_da_krong	Xã Đa Krông	xã	467
19567	xa_trieu_nguyen	Xã Triệu Nguyên	xã	467
19570	xa_ba_long	Xã Ba Lòng	xã	467
19576	xa_ba_nang	Xã Ba Nang	xã	467
19579	xa_ta_long	Xã Tà Long	xã	467
19582	xa_huc_nghi	Xã Húc Nghì	xã	467
19585	xa_a_vao	Xã A Vao	xã	467
19588	xa_ta_rut	Xã Tà Rụt	xã	467
19591	xa_a_bung	Xã A Bung	xã	467
19594	xa_a_ngo	Xã A Ngo	xã	467
19597	thi_tran_cam_lo	Thị trấn Cam Lộ	thị trấn	468
19600	xa_cam_tuyen	Xã Cam Tuyền	xã	468
19603	xa_thanh_an	Xã Thanh An	xã	468
19606	xa_cam_thuy	Xã Cam Thủy	xã	468
19612	xa_cam_thanh	Xã Cam Thành	xã	468
19615	xa_cam_hieu	Xã Cam Hiếu	xã	468
19618	xa_cam_chinh	Xã Cam Chính	xã	468
19621	xa_cam_nghia	Xã Cam Nghĩa	xã	468
19624	thi_tran_ai_tu	Thị trấn Ái Tử	thị trấn	469
19627	xa_trieu_an	Xã Triệu An	xã	469
19630	xa_trieu_van	Xã Triệu Vân	xã	469
19633	xa_trieu_phuoc	Xã Triệu Phước	xã	469
19636	xa_trieu_do	Xã Triệu Độ	xã	469
19639	xa_trieu_trach	Xã Triệu Trạch	xã	469
19642	xa_trieu_thuan	Xã Triệu Thuận	xã	469
19645	xa_trieu_dai	Xã Triệu Đại	xã	469
19648	xa_trieu_hoa	Xã Triệu Hòa	xã	469
19651	xa_trieu_lang	Xã Triệu Lăng	xã	469
19654	xa_trieu_son	Xã Triệu Sơn	xã	469
19657	xa_trieu_long	Xã Triệu Long	xã	469
19660	xa_trieu_tai	Xã Triệu Tài	xã	469
19666	xa_trieu_trung	Xã Triệu Trung	xã	469
19669	xa_trieu_ai	Xã Triệu Ái	xã	469
19672	xa_trieu_thuong	Xã Triệu Thượng	xã	469
19675	xa_trieu_giang	Xã Triệu Giang	xã	469
19678	xa_trieu_thanh	Xã Triệu Thành	xã	469
19681	thi_tran_dien_sanh	Thị trấn Diên Sanh	thị trấn	470
19684	xa_hai_an	Xã Hải An	xã	470
19687	xa_hai_ba	Xã Hải Ba	xã	470
19693	xa_hai_quy	Xã Hải Quy	xã	470
19696	xa_hai_que	Xã Hải Quế	xã	470
19699	xa_hai_hung	Xã Hải Hưng	xã	470
19702	xa_hai_phu	Xã Hải Phú	xã	470
19708	xa_hai_thuong	Xã Hải Thượng	xã	470
19711	xa_hai_duong	Xã Hải Dương	xã	470
19714	xa_hai_dinh	Xã Hải Định	xã	470
19717	xa_hai_lam	Xã Hải Lâm	xã	470
19726	xa_hai_phong	Xã Hải Phong	xã	470
19729	xa_hai_truong	Xã Hải Trường	xã	470
19735	xa_hai_son	Xã Hải Sơn	xã	470
19738	xa_hai_chanh	Xã Hải Chánh	xã	470
19741	xa_hai_khe	Xã Hải Khê	xã	470
19744	phuong_phu_thuan	Phường Phú Thuận	phường	474
19747	phuong_phu_binh	Phường Phú Bình	phường	474
19750	phuong_tay_loc	Phường Tây Lộc	phường	474
19753	phuong_thuan_loc	Phường Thuận Lộc	phường	474
19756	phuong_phu_hiep	Phường Phú Hiệp	phường	474
19759	phuong_phu_hau	Phường Phú Hậu	phường	474
19762	phuong_thuan_hoa	Phường Thuận Hòa	phường	474
19765	phuong_thuan_thanh	Phường Thuận Thành	phường	474
19768	phuong_phu_hoa	Phường Phú Hòa	phường	474
19771	phuong_phu_cat	Phường Phú Cát	phường	474
19774	phuong_kim_long	Phường Kim Long	phường	474
19777	phuong_vy_da	Phường Vỹ Dạ	phường	474
19780	phuong_phuong_duc	Phường Phường Đúc	phường	474
19783	phuong_vinh_ninh	Phường Vĩnh Ninh	phường	474
19786	phuong_phu_hoi	Phường Phú Hội	phường	474
19789	phuong_phu_nhuan	Phường Phú Nhuận	phường	474
19792	phuong_xuan_phu	Phường Xuân Phú	phường	474
19795	phuong_truong_an	Phường Trường An	phường	474
19798	phuong_phuoc_vinh	Phường Phước Vĩnh	phường	474
19801	phuong_an_cuu	Phường An Cựu	phường	474
19803	phuong_an_hoa	Phường An Hòa	phường	474
19804	phuong_huong_so	Phường Hương Sơ	phường	474
19807	phuong_thuy_bieu	Phường Thuỷ Biều	phường	474
19810	phuong_huong_long	Phường Hương Long	phường	474
19813	phuong_thuy_xuan	Phường Thuỷ Xuân	phường	474
19815	phuong_an_dong	Phường An Đông	phường	474
19816	phuong_an_tay	Phường An Tây	phường	474
19819	thi_tran_phong_dien	Thị trấn Phong Điền	thị trấn	476
19822	xa_dien_huong	Xã Điền Hương	xã	476
19825	xa_dien_mon	Xã Điền Môn	xã	476
19828	xa_dien_loc	Xã Điền Lộc	xã	476
19831	xa_phong_binh	Xã Phong Bình	xã	476
19834	xa_dien_hoa	Xã Điền Hòa	xã	476
19837	xa_phong_chuong	Xã Phong Chương	xã	476
19840	xa_phong_hai	Xã Phong Hải	xã	476
19843	xa_dien_hai	Xã Điền Hải	xã	476
19846	xa_phong_hoa	Xã Phong Hòa	xã	476
19849	xa_phong_thu	Xã Phong Thu	xã	476
19852	xa_phong_hien	Xã Phong Hiền	xã	476
19855	xa_phong_my	Xã Phong Mỹ	xã	476
19858	xa_phong_an	Xã Phong An	xã	476
19861	xa_phong_xuan	Xã Phong Xuân	xã	476
19864	xa_phong_son	Xã Phong Sơn	xã	476
19867	thi_tran_sia	Thị trấn Sịa	thị trấn	477
19870	xa_quang_thai	Xã Quảng Thái	xã	477
19873	xa_quang_ngan	Xã Quảng Ngạn	xã	477
19876	xa_quang_loi	Xã Quảng Lợi	xã	477
19879	xa_quang_cong	Xã Quảng Công	xã	477
19882	xa_quang_phuoc	Xã Quảng Phước	xã	477
19885	xa_quang_vinh	Xã Quảng Vinh	xã	477
19888	xa_quang_an	Xã Quảng An	xã	477
19891	xa_quang_thanh	Xã Quảng Thành	xã	477
19894	xa_quang_tho	Xã Quảng Thọ	xã	477
19897	xa_quang_phu	Xã Quảng Phú	xã	477
19900	thi_tran_thuan_an	Thị trấn Thuận An	thị trấn	478
19903	xa_phu_thuan	Xã Phú Thuận	xã	478
19906	xa_phu_duong	Xã Phú Dương	xã	478
19909	xa_phu_mau	Xã Phú Mậu	xã	478
19912	xa_phu_an	Xã Phú An	xã	478
19915	xa_phu_hai	Xã Phú Hải	xã	478
19918	xa_phu_xuan	Xã Phú Xuân	xã	478
19921	xa_phu_dien	Xã Phú Diên	xã	478
19924	xa_phu_thanh	Xã Phú Thanh	xã	478
19927	xa_phu_my	Xã Phú Mỹ	xã	478
19930	xa_phu_thuong	Xã Phú Thượng	xã	478
19933	xa_phu_ho	Xã Phú Hồ	xã	478
19936	xa_vinh_xuan	Xã Vinh Xuân	xã	478
19939	xa_phu_luong	Xã Phú Lương	xã	478
19942	thi_tran_phu_da	Thị trấn Phú Đa	thị trấn	478
19945	xa_vinh_thanh	Xã Vinh Thanh	xã	478
19948	xa_vinh_an	Xã Vinh An	xã	478
19954	xa_phu_gia	Xã Phú Gia	xã	478
19957	xa_vinh_ha	Xã Vinh Hà	xã	478
19960	phuong_phu_bai	Phường Phú Bài	phường	479
19963	xa_thuy_van	Xã Thủy Vân	xã	479
19966	xa_thuy_thanh	Xã Thủy Thanh	xã	479
19969	phuong_thuy_duong	Phường Thủy Dương	phường	479
19972	phuong_thuy_phuong	Phường Thủy Phương	phường	479
19975	phuong_thuy_chau	Phường Thủy Châu	phường	479
19978	phuong_thuy_luong	Phường Thủy Lương	phường	479
19981	xa_thuy_bang	Xã Thủy Bằng	xã	479
19984	xa_thuy_tan	Xã Thủy Tân	xã	479
19987	xa_thuy_phu	Xã Thủy Phù	xã	479
19990	xa_phu_son	Xã Phú Sơn	xã	479
19993	xa_duong_hoa	Xã Dương Hòa	xã	479
19996	phuong_tu_ha	Phường Tứ Hạ	phường	480
19999	xa_hai_duong	Xã Hải Dương	xã	480
20002	xa_huong_phong	Xã Hương Phong	xã	480
20005	xa_huong_toan	Xã Hương Toàn	xã	480
20008	phuong_huong_van	Phường Hương Vân	phường	480
20011	phuong_huong_van	Phường Hương Văn	phường	480
20014	xa_huong_vinh	Xã Hương Vinh	xã	480
20017	phuong_huong_xuan	Phường Hương Xuân	phường	480
20020	phuong_huong_chu	Phường Hương Chữ	phường	480
20023	phuong_huong_an	Phường Hương An	phường	480
20026	xa_huong_binh	Xã Hương Bình	xã	480
20029	phuong_huong_ho	Phường Hương Hồ	phường	480
20032	xa_huong_tho	Xã Hương Thọ	xã	480
20035	xa_binh_tien	Xã Bình Tiến	xã	480
20041	xa_binh_thanh	Xã Bình Thành	xã	480
20044	thi_tran_a_luoi	Thị trấn A Lưới	thị trấn	481
20047	xa_hong_van	Xã Hồng Vân	xã	481
20050	xa_hong_ha	Xã Hồng Hạ	xã	481
20053	xa_hong_kim	Xã Hồng Kim	xã	481
20056	xa_trung_son	Xã Trung Sơn	xã	481
20059	xa_huong_nguyen	Xã Hương Nguyên	xã	481
20065	xa_hong_bac	Xã Hồng Bắc	xã	481
20068	xa_a_ngo	Xã A Ngo	xã	481
20071	xa_son_thuy	Xã Sơn Thủy	xã	481
20074	xa_phu_vinh	Xã Phú Vinh	xã	481
20080	xa_huong_phong	Xã Hương Phong	xã	481
20083	xa_quang_nham	Xã Quảng Nhâm	xã	481
20086	xa_hong_thuong	Xã Hồng Thượng	xã	481
20089	xa_hong_thai	Xã Hồng Thái	xã	481
20095	xa_a_roang	Xã A Roàng	xã	481
20098	xa_dong_son	Xã Đông Sơn	xã	481
20101	xa_lam_dot	Xã Lâm Đớt	xã	481
20104	xa_hong_thuy	Xã Hồng Thủy	xã	481
20107	thi_tran_phu_loc	Thị trấn Phú Lộc	thị trấn	482
20110	thi_tran_lang_co	Thị trấn Lăng Cô	thị trấn	482
20113	xa_vinh_my	Xã Vinh Mỹ	xã	482
20116	xa_vinh_hung	Xã Vinh Hưng	xã	482
20122	xa_giang_hai	Xã Giang Hải	xã	482
20125	xa_vinh_hien	Xã Vinh Hiền	xã	482
20128	xa_loc_bon	Xã Lộc Bổn	xã	482
20131	xa_loc_son	Xã Lộc Sơn	xã	482
20134	xa_loc_binh	Xã Lộc Bình	xã	482
20137	xa_loc_vinh	Xã Lộc Vĩnh	xã	482
20140	xa_loc_an	Xã Lộc An	xã	482
20143	xa_loc_dien	Xã Lộc Điền	xã	482
20146	xa_loc_thuy	Xã Lộc Thủy	xã	482
20149	xa_loc_tri	Xã Lộc Trì	xã	482
20152	xa_loc_tien	Xã Lộc Tiến	xã	482
20155	xa_loc_hoa	Xã Lộc Hòa	xã	482
20158	xa_xuan_loc	Xã Xuân Lộc	xã	482
20161	thi_tran_khe_tre	Thị trấn Khe Tre	thị trấn	483
20164	xa_huong_phu	Xã Hương Phú	xã	483
20167	xa_huong_son	Xã Hương Sơn	xã	483
20170	xa_huong_loc	Xã Hương Lộc	xã	483
20173	xa_thuong_quang	Xã Thượng Quảng	xã	483
20179	xa_huong_xuan	Xã Hương Xuân	xã	483
20182	xa_huong_huu	Xã Hương Hữu	xã	483
20185	xa_thuong_lo	Xã Thượng Lộ	xã	483
20188	xa_thuong_long	Xã Thượng Long	xã	483
20191	xa_thuong_nhat	Xã Thượng Nhật	xã	483
20194	phuong_hoa_hiep_bac	Phường Hòa Hiệp Bắc	phường	490
20195	phuong_hoa_hiep_nam	Phường Hòa Hiệp Nam	phường	490
20197	phuong_hoa_khanh_bac	Phường Hòa Khánh Bắc	phường	490
20198	phuong_hoa_khanh_nam	Phường Hòa Khánh Nam	phường	490
20200	phuong_hoa_minh	Phường Hòa Minh	phường	490
20203	phuong_tam_thuan	Phường Tam Thuận	phường	491
20206	phuong_thanh_khe_tay	Phường Thanh Khê Tây	phường	491
20207	phuong_thanh_khe_dong	Phường Thanh Khê Đông	phường	491
20209	phuong_xuan_ha	Phường Xuân Hà	phường	491
20212	phuong_tan_chinh	Phường Tân Chính	phường	491
20215	phuong_chinh_gian	Phường Chính Gián	phường	491
20218	phuong_vinh_trung	Phường Vĩnh Trung	phường	491
20221	phuong_thac_gian	Phường Thạc Gián	phường	491
20224	phuong_an_khe	Phường An Khê	phường	491
20225	phuong_hoa_khe	Phường Hòa Khê	phường	491
20227	phuong_thanh_binh	Phường Thanh Bình	phường	492
20230	phuong_thuan_phuoc	Phường Thuận Phước	phường	492
20233	phuong_thach_thang	Phường Thạch Thang	phường	492
20236	phuong_hai_chau_i	Phường Hải Châu I	phường	492
20239	phuong_hai_chau_ii	Phường Hải Châu II	phường	492
20242	phuong_phuoc_ninh	Phường Phước Ninh	phường	492
20245	phuong_hoa_thuan_tay	Phường Hòa Thuận Tây	phường	492
20246	phuong_hoa_thuan_dong	Phường Hòa Thuận Đông	phường	492
20248	phuong_nam_duong	Phường Nam Dương	phường	492
20251	phuong_binh_hien	Phường Bình Hiên	phường	492
20254	phuong_binh_thuan	Phường Bình Thuận	phường	492
20257	phuong_hoa_cuong_bac	Phường Hòa Cường Bắc	phường	492
20258	phuong_hoa_cuong_nam	Phường Hòa Cường Nam	phường	492
20263	phuong_tho_quang	Phường Thọ Quang	phường	493
20266	phuong_nai_hien_dong	Phường Nại Hiên Đông	phường	493
20269	phuong_man_thai	Phường Mân Thái	phường	493
20272	phuong_an_hai_bac	Phường An Hải Bắc	phường	493
20275	phuong_phuoc_my	Phường Phước Mỹ	phường	493
20278	phuong_an_hai_tay	Phường An Hải Tây	phường	493
20281	phuong_an_hai_dong	Phường An Hải Đông	phường	493
20284	phuong_my_an	Phường Mỹ An	phường	494
20285	phuong_khue_my	Phường Khuê Mỹ	phường	494
20287	phuong_hoa_quy	Phường Hoà Quý	phường	494
20290	phuong_hoa_hai	Phường Hoà Hải	phường	494
20260	phuong_khue_trung	Phường Khuê Trung	phường	495
20305	phuong_hoa_phat	Phường Hòa Phát	phường	495
20306	phuong_hoa_an	Phường Hòa An	phường	495
20311	phuong_hoa_tho_tay	Phường Hòa Thọ Tây	phường	495
20312	phuong_hoa_tho_dong	Phường Hòa Thọ Đông	phường	495
20314	phuong_hoa_xuan	Phường Hòa Xuân	phường	495
20293	xa_hoa_bac	Xã Hòa Bắc	xã	497
20296	xa_hoa_lien	Xã Hòa Liên	xã	497
20299	xa_hoa_ninh	Xã Hòa Ninh	xã	497
20302	xa_hoa_son	Xã Hòa Sơn	xã	497
20308	xa_hoa_nhon	Xã Hòa Nhơn	xã	497
20317	xa_hoa_phu	Xã Hòa Phú	xã	497
20320	xa_hoa_phong	Xã Hòa Phong	xã	497
20323	xa_hoa_chau	Xã Hòa Châu	xã	497
20326	xa_hoa_tien	Xã Hòa Tiến	xã	497
20329	xa_hoa_phuoc	Xã Hòa Phước	xã	497
20332	xa_hoa_khuong	Xã Hòa Khương	xã	497
20335	phuong_tan_thanh	Phường Tân Thạnh	phường	502
20338	phuong_phuoc_hoa	Phường Phước Hòa	phường	502
20341	phuong_an_my	Phường An Mỹ	phường	502
20344	phuong_hoa_huong	Phường Hòa Hương	phường	502
20347	phuong_an_xuan	Phường An Xuân	phường	502
20350	phuong_an_son	Phường An Sơn	phường	502
20353	phuong_truong_xuan	Phường Trường Xuân	phường	502
20356	phuong_an_phu	Phường An Phú	phường	502
20359	xa_tam_thanh	Xã Tam Thanh	xã	502
20362	xa_tam_thang	Xã Tam Thăng	xã	502
20371	xa_tam_phu	Xã Tam Phú	xã	502
20375	phuong_hoa_thuan	Phường Hoà Thuận	phường	502
20389	xa_tam_ngoc	Xã Tam Ngọc	xã	502
20398	phuong_minh_an	Phường Minh An	phường	503
20401	phuong_tan_an	Phường Tân An	phường	503
20404	phuong_cam_pho	Phường Cẩm Phô	phường	503
20407	phuong_thanh_ha	Phường Thanh Hà	phường	503
20410	phuong_son_phong	Phường Sơn Phong	phường	503
20413	phuong_cam_chau	Phường Cẩm Châu	phường	503
20416	phuong_cua_dai	Phường Cửa Đại	phường	503
20419	phuong_cam_an	Phường Cẩm An	phường	503
20422	xa_cam_ha	Xã Cẩm Hà	xã	503
20425	xa_cam_kim	Xã Cẩm Kim	xã	503
20428	phuong_cam_nam	Phường Cẩm Nam	phường	503
20431	xa_cam_thanh	Xã Cẩm Thanh	xã	503
20434	xa_tan_hiep	Xã Tân Hiệp	xã	503
20437	xa_chom	Xã Ch'ơm	xã	504
20452	xa_a_nong	Xã A Nông	xã	504
20455	xa_a_tieng	Xã A Tiêng	xã	504
20458	xa_bha_le	Xã Bha Lê	xã	504
20461	xa_a_vuong	Xã A Vương	xã	504
20464	xa_dang	Xã Dang	xã	504
20467	thi_tran_p_rao	Thị trấn P Rao	thị trấn	505
20470	xa_ta_lu	Xã Tà Lu	xã	505
20473	xa_song_kon	Xã Sông Kôn	xã	505
20476	xa_jo_ngay	Xã Jơ Ngây	xã	505
20479	xa_a_ting	Xã A Ting	xã	505
20482	xa_tu	Xã Tư	xã	505
20485	xa_ba	Xã Ba	xã	505
20488	xa_a_rooi	Xã A Rooi	xã	505
20491	xa_za_hung	Xã Za Hung	xã	505
20494	xa_ma_cooi	Xã Mà Cooi	xã	505
20497	xa_ka_dang	Xã Ka Dăng	xã	505
20500	thi_tran_ai_nghia	Thị trấn Ái Nghĩa	thị trấn	506
20503	xa_dai_son	Xã Đại Sơn	xã	506
20506	xa_dai_lanh	Xã Đại Lãnh	xã	506
20509	xa_dai_hung	Xã Đại Hưng	xã	506
20512	xa_dai_hong	Xã Đại Hồng	xã	506
20515	xa_dai_dong	Xã Đại Đồng	xã	506
20518	xa_dai_quang	Xã Đại Quang	xã	506
20521	xa_dai_nghia	Xã Đại Nghĩa	xã	506
20524	xa_dai_hiep	Xã Đại Hiệp	xã	506
20527	xa_dai_thanh	Xã Đại Thạnh	xã	506
20530	xa_dai_chanh	Xã Đại Chánh	xã	506
20533	xa_dai_tan	Xã Đại Tân	xã	506
20536	xa_dai_phong	Xã Đại Phong	xã	506
20539	xa_dai_minh	Xã Đại Minh	xã	506
20542	xa_dai_thang	Xã Đại Thắng	xã	506
20545	xa_dai_cuong	Xã Đại Cường	xã	506
20547	xa_dai_an	Xã Đại An	xã	506
20548	xa_dai_hoa	Xã Đại Hòa	xã	506
20551	phuong_vinh_dien	Phường Vĩnh Điện	phường	507
20554	xa_dien_tien	Xã Điện Tiến	xã	507
20557	xa_dien_hoa	Xã Điện Hòa	xã	507
20560	xa_dien_thang_bac	Xã Điện Thắng Bắc	xã	507
20561	xa_dien_thang_trung	Xã Điện Thắng Trung	xã	507
20562	xa_dien_thang_nam	Xã Điện Thắng Nam	xã	507
20563	phuong_dien_ngoc	Phường Điện Ngọc	phường	507
20566	xa_dien_hong	Xã Điện Hồng	xã	507
20569	xa_dien_tho	Xã Điện Thọ	xã	507
20572	xa_dien_phuoc	Xã Điện Phước	xã	507
20575	phuong_dien_an	Phường Điện An	phường	507
20578	phuong_dien_nam_bac	Phường Điện Nam Bắc	phường	507
20579	phuong_dien_nam_trung	Phường Điện Nam Trung	phường	507
20580	phuong_dien_nam_dong	Phường Điện Nam Đông	phường	507
20581	phuong_dien_duong	Phường Điện Dương	phường	507
20584	xa_dien_quang	Xã Điện Quang	xã	507
20587	xa_dien_trung	Xã Điện Trung	xã	507
20590	xa_dien_phong	Xã Điện Phong	xã	507
20593	xa_dien_minh	Xã Điện Minh	xã	507
20596	xa_dien_phuong	Xã Điện Phương	xã	507
20599	thi_tran_nam_phuoc	Thị trấn Nam Phước	thị trấn	508
20602	xa_duy_thu	Xã Duy Thu	xã	508
20605	xa_duy_phu	Xã Duy Phú	xã	508
20608	xa_duy_tan	Xã Duy Tân	xã	508
20611	xa_duy_hoa	Xã Duy Hòa	xã	508
20614	xa_duy_chau	Xã Duy Châu	xã	508
20617	xa_duy_trinh	Xã Duy Trinh	xã	508
20620	xa_duy_son	Xã Duy Sơn	xã	508
20623	xa_duy_trung	Xã Duy Trung	xã	508
20626	xa_duy_phuoc	Xã Duy Phước	xã	508
20629	xa_duy_thanh	Xã Duy Thành	xã	508
20632	xa_duy_vinh	Xã Duy Vinh	xã	508
20635	xa_duy_nghia	Xã Duy Nghĩa	xã	508
20638	xa_duy_hai	Xã Duy Hải	xã	508
20641	thi_tran_dong_phu	Thị trấn Đông Phú	thị trấn	509
20644	xa_que_xuan_1	Xã Quế Xuân 1	xã	509
20647	xa_que_xuan_2	Xã Quế Xuân 2	xã	509
20650	xa_que_phu	Xã Quế Phú	xã	509
20651	thi_tran_huong_an	Thị trấn Hương An	thị trấn	509
20659	xa_que_hiep	Xã Quế Hiệp	xã	509
20662	xa_que_thuan	Xã Quế Thuận	xã	509
20665	xa_que_my	Xã Quế Mỹ	xã	509
20677	xa_que_long	Xã Quế Long	xã	509
20680	xa_que_chau	Xã Quế Châu	xã	509
20683	xa_que_phong	Xã Quế Phong	xã	509
20686	xa_que_an	Xã Quế An	xã	509
20689	xa_que_minh	Xã Quế Minh	xã	509
20695	thi_tran_thanh_my	Thị trấn Thạnh Mỹ	thị trấn	510
20698	xa_laee	Xã Laêê	xã	510
20699	xa_cho_chun	Xã Chơ Chun	xã	510
20701	xa_zuoich	Xã Zuôich	xã	510
20702	xa_ta_poo	Xã Tà Pơơ	xã	510
20704	xa_la_dee	Xã La Dêê	xã	510
20705	xa_dac_toi	Xã Đắc Tôi	xã	510
20707	xa_cha_val	Xã Chà Vàl	xã	510
20710	xa_ta_bhinh	Xã Tà Bhinh	xã	510
20713	xa_ca_dy	Xã Cà Dy	xã	510
20716	xa_dac_pre	Xã Đắc Pre	xã	510
20719	xa_dac_pring	Xã Đắc Pring	xã	510
20722	thi_tran_kham_duc	Thị trấn Khâm Đức	thị trấn	511
20725	xa_phuoc_xuan	Xã Phước Xuân	xã	511
20728	xa_phuoc_hiep	Xã Phước Hiệp	xã	511
20729	xa_phuoc_hoa	Xã Phước Hoà	xã	511
20731	xa_phuoc_duc	Xã Phước Đức	xã	511
20734	xa_phuoc_nang	Xã Phước Năng	xã	511
20737	xa_phuoc_my	Xã Phước Mỹ	xã	511
20740	xa_phuoc_chanh	Xã Phước Chánh	xã	511
20743	xa_phuoc_cong	Xã Phước Công	xã	511
20746	xa_phuoc_kim	Xã Phước Kim	xã	511
20749	xa_phuoc_loc	Xã Phước Lộc	xã	511
20752	xa_phuoc_thanh	Xã Phước Thành	xã	511
20758	xa_hiep_hoa	Xã Hiệp Hòa	xã	512
20761	xa_hiep_thuan	Xã Hiệp Thuận	xã	512
20764	xa_que_tho	Xã Quế Thọ	xã	512
20767	xa_binh_lam	Xã Bình Lâm	xã	512
20770	xa_song_tra	Xã Sông Trà	xã	512
20773	xa_phuoc_tra	Xã Phước Trà	xã	512
20776	xa_phuoc_gia	Xã Phước Gia	xã	512
20779	thi_tran_tan_binh	Thị trấn Tân Bình	thị trấn	512
20782	xa_que_luu	Xã Quế Lưu	xã	512
20785	xa_thang_phuoc	Xã Thăng Phước	xã	512
20788	xa_binh_son	Xã Bình Sơn	xã	512
20791	thi_tran_ha_lam	Thị trấn Hà Lam	thị trấn	513
20794	xa_binh_duong	Xã Bình Dương	xã	513
20797	xa_binh_giang	Xã Bình Giang	xã	513
20800	xa_binh_nguyen	Xã Bình Nguyên	xã	513
20803	xa_binh_phuc	Xã Bình Phục	xã	513
20806	xa_binh_trieu	Xã Bình Triều	xã	513
20809	xa_binh_dao	Xã Bình Đào	xã	513
20812	xa_binh_minh	Xã Bình Minh	xã	513
20815	xa_binh_lanh	Xã Bình Lãnh	xã	513
20818	xa_binh_tri	Xã Bình Trị	xã	513
20821	xa_binh_dinh_bac	Xã Bình Định Bắc	xã	513
20822	xa_binh_dinh_nam	Xã Bình Định Nam	xã	513
20824	xa_binh_quy	Xã Bình Quý	xã	513
20827	xa_binh_phu	Xã Bình Phú	xã	513
20830	xa_binh_chanh	Xã Bình Chánh	xã	513
20833	xa_binh_tu	Xã Bình Tú	xã	513
20836	xa_binh_sa	Xã Bình Sa	xã	513
20839	xa_binh_hai	Xã Bình Hải	xã	513
20842	xa_binh_que	Xã Bình Quế	xã	513
20845	xa_binh_an	Xã Bình An	xã	513
20848	xa_binh_trung	Xã Bình Trung	xã	513
20851	xa_binh_nam	Xã Bình Nam	xã	513
20854	thi_tran_tien_ky	Thị trấn Tiên Kỳ	thị trấn	514
20857	xa_tien_son	Xã Tiên Sơn	xã	514
20860	xa_tien_ha	Xã Tiên Hà	xã	514
20863	xa_tien_cam	Xã Tiên Cẩm	xã	514
20866	xa_tien_chau	Xã Tiên Châu	xã	514
20869	xa_tien_lanh	Xã Tiên Lãnh	xã	514
20872	xa_tien_ngoc	Xã Tiên Ngọc	xã	514
20875	xa_tien_hiep	Xã Tiên Hiệp	xã	514
20878	xa_tien_canh	Xã Tiên Cảnh	xã	514
20881	xa_tien_my	Xã Tiên Mỹ	xã	514
20884	xa_tien_phong	Xã Tiên Phong	xã	514
20887	xa_tien_tho	Xã Tiên Thọ	xã	514
20890	xa_tien_an	Xã Tiên An	xã	514
20893	xa_tien_loc	Xã Tiên Lộc	xã	514
20896	xa_tien_lap	Xã Tiên Lập	xã	514
20899	thi_tran_tra_my	Thị trấn Trà My	thị trấn	515
20900	xa_tra_son	Xã Trà Sơn	xã	515
20902	xa_tra_kot	Xã Trà Kót	xã	515
20905	xa_tra_nu	Xã Trà Nú	xã	515
20908	xa_tra_dong	Xã Trà Đông	xã	515
20911	xa_tra_duong	Xã Trà Dương	xã	515
20914	xa_tra_giang	Xã Trà Giang	xã	515
20917	xa_tra_bui	Xã Trà Bui	xã	515
20920	xa_tra_doc	Xã Trà Đốc	xã	515
20923	xa_tra_tan	Xã Trà Tân	xã	515
20926	xa_tra_giac	Xã Trà Giác	xã	515
20929	xa_tra_giap	Xã Trà Giáp	xã	515
20932	xa_tra_ka	Xã Trà Ka	xã	515
20935	xa_tra_leng	Xã Trà Leng	xã	516
20938	xa_tra_don	Xã Trà Dơn	xã	516
20941	xa_tra_tap	Xã Trà Tập	xã	516
20944	xa_tra_mai	Xã Trà Mai	xã	516
20947	xa_tra_cang	Xã Trà Cang	xã	516
20950	xa_tra_linh	Xã Trà Linh	xã	516
20953	xa_tra_nam	Xã Trà Nam	xã	516
20956	xa_tra_don	Xã Trà Don	xã	516
20959	xa_tra_van	Xã Trà Vân	xã	516
20962	xa_tra_vinh	Xã Trà Vinh	xã	516
20965	thi_tran_nui_thanh	Thị trấn Núi Thành	thị trấn	517
20968	xa_tam_xuan_i	Xã Tam Xuân I	xã	517
20971	xa_tam_xuan_ii	Xã Tam Xuân II	xã	517
20974	xa_tam_tien	Xã Tam Tiến	xã	517
20977	xa_tam_son	Xã Tam Sơn	xã	517
20980	xa_tam_thanh	Xã Tam Thạnh	xã	517
20983	xa_tam_anh_bac	Xã Tam Anh Bắc	xã	517
20984	xa_tam_anh_nam	Xã Tam Anh Nam	xã	517
20986	xa_tam_hoa	Xã Tam Hòa	xã	517
20989	xa_tam_hiep	Xã Tam Hiệp	xã	517
20992	xa_tam_hai	Xã Tam Hải	xã	517
20995	xa_tam_giang	Xã Tam Giang	xã	517
20998	xa_tam_quang	Xã Tam Quang	xã	517
21001	xa_tam_nghia	Xã Tam Nghĩa	xã	517
21004	xa_tam_my_tay	Xã Tam Mỹ Tây	xã	517
21005	xa_tam_my_dong	Xã Tam Mỹ Đông	xã	517
21007	xa_tam_tra	Xã Tam Trà	xã	517
20364	thi_tran_phu_thinh	Thị trấn Phú Thịnh	thị trấn	518
20365	xa_tam_thanh	Xã Tam Thành	xã	518
20368	xa_tam_an	Xã Tam An	xã	518
20374	xa_tam_dan	Xã Tam Đàn	xã	518
20377	xa_tam_loc	Xã Tam Lộc	xã	518
20380	xa_tam_phuoc	Xã Tam Phước	xã	518
20383	xa_tam_vinh	Xã Tam Vinh	xã	518
20386	xa_tam_thai	Xã Tam Thái	xã	518
20387	xa_tam_dai	Xã Tam Đại	xã	518
20392	xa_tam_dan	Xã Tam Dân	xã	518
20395	xa_tam_lanh	Xã Tam Lãnh	xã	518
20656	xa_que_trung	Xã Quế Trung	xã	519
20668	xa_ninh_phuoc	Xã Ninh Phước	xã	519
20669	xa_phuoc_ninh	Xã Phước Ninh	xã	519
20671	xa_que_loc	Xã Quế Lộc	xã	519
20672	xa_son_vien	Xã Sơn Viên	xã	519
20692	xa_que_lam	Xã Quế Lâm	xã	519
21010	phuong_le_hong_phong	Phường Lê Hồng Phong	phường	522
21013	phuong_tran_phu	Phường Trần Phú	phường	522
21016	phuong_quang_phu	Phường Quảng Phú	phường	522
21019	phuong_nghia_chanh	Phường Nghĩa Chánh	phường	522
21022	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	522
21025	phuong_nguyen_nghiem	Phường Nguyễn Nghiêm	phường	522
21028	phuong_nghia_lo	Phường Nghĩa Lộ	phường	522
21031	phuong_chanh_lo	Phường Chánh Lộ	phường	522
21034	xa_nghia_dung	Xã Nghĩa Dũng	xã	522
21037	xa_nghia_dong	Xã Nghĩa Dõng	xã	522
21172	phuong_truong_quang_trong	Phường Trương Quang Trọng	phường	522
21187	xa_tinh_hoa	Xã Tịnh Hòa	xã	522
21190	xa_tinh_ky	Xã Tịnh Kỳ	xã	522
21199	xa_tinh_thien	Xã Tịnh Thiện	xã	522
21202	xa_tinh_an_dong	Xã Tịnh Ấn Đông	xã	522
21208	xa_tinh_chau	Xã Tịnh Châu	xã	522
21211	xa_tinh_khe	Xã Tịnh Khê	xã	522
21214	xa_tinh_long	Xã Tịnh Long	xã	522
21223	xa_tinh_an_tay	Xã Tịnh Ấn Tây	xã	522
21232	xa_tinh_an	Xã Tịnh An	xã	522
21253	xa_nghia_phu	Xã Nghĩa Phú	xã	522
21256	xa_nghia_ha	Xã Nghĩa Hà	xã	522
21262	xa_nghia_an	Xã Nghĩa An	xã	522
21040	thi_tran_chau_o	Thị trấn Châu Ổ	thị trấn	524
21043	xa_binh_thuan	Xã Bình Thuận	xã	524
21046	xa_binh_thanh	Xã Bình Thạnh	xã	524
21049	xa_binh_dong	Xã Bình Đông	xã	524
21052	xa_binh_chanh	Xã Bình Chánh	xã	524
21055	xa_binh_nguyen	Xã Bình Nguyên	xã	524
21058	xa_binh_khuong	Xã Bình Khương	xã	524
21061	xa_binh_tri	Xã Bình Trị	xã	524
21064	xa_binh_an	Xã Bình An	xã	524
21067	xa_binh_hai	Xã Bình Hải	xã	524
21070	xa_binh_duong	Xã Bình Dương	xã	524
21073	xa_binh_phuoc	Xã Bình Phước	xã	524
21079	xa_binh_hoa	Xã Bình Hòa	xã	524
21082	xa_binh_trung	Xã Bình Trung	xã	524
21085	xa_binh_minh	Xã Bình Minh	xã	524
21088	xa_binh_long	Xã Bình Long	xã	524
21091	xa_binh_thanh	Xã Bình Thanh	xã	524
21100	xa_binh_chuong	Xã Bình Chương	xã	524
21103	xa_binh_hiep	Xã Bình Hiệp	xã	524
21106	xa_binh_my	Xã Bình Mỹ	xã	524
21109	xa_binh_tan_phu	Xã Bình Tân Phú	xã	524
21112	xa_binh_chau	Xã Bình Châu	xã	524
21115	thi_tran_tra_xuan	Thị trấn Trà Xuân	thị trấn	525
21118	xa_tra_giang	Xã Trà Giang	xã	525
21121	xa_tra_thuy	Xã Trà Thủy	xã	525
21124	xa_tra_hiep	Xã Trà Hiệp	xã	525
21127	xa_tra_binh	Xã Trà Bình	xã	525
21130	xa_tra_phu	Xã Trà Phú	xã	525
21133	xa_tra_lam	Xã Trà Lâm	xã	525
21136	xa_tra_tan	Xã Trà Tân	xã	525
21139	xa_tra_son	Xã Trà Sơn	xã	525
21142	xa_tra_bui	Xã Trà Bùi	xã	525
21145	xa_tra_thanh	Xã Trà Thanh	xã	525
21148	xa_son_tra	Xã Sơn Trà	xã	525
21154	xa_tra_phong	Xã Trà Phong	xã	525
21157	xa_huong_tra	Xã Hương Trà	xã	525
21163	xa_tra_xinh	Xã Trà Xinh	xã	525
21166	xa_tra_tay	Xã Trà Tây	xã	525
21175	xa_tinh_tho	Xã Tịnh Thọ	xã	527
21178	xa_tinh_tra	Xã Tịnh Trà	xã	527
21181	xa_tinh_phong	Xã Tịnh Phong	xã	527
21184	xa_tinh_hiep	Xã Tịnh Hiệp	xã	527
21193	xa_tinh_binh	Xã Tịnh Bình	xã	527
21196	xa_tinh_dong	Xã Tịnh Đông	xã	527
21205	xa_tinh_bac	Xã Tịnh Bắc	xã	527
21217	xa_tinh_son	Xã Tịnh Sơn	xã	527
21220	xa_tinh_ha	Xã Tịnh Hà	xã	527
21226	xa_tinh_giang	Xã Tịnh Giang	xã	527
21229	xa_tinh_minh	Xã Tịnh Minh	xã	527
21235	thi_tran_la_ha	Thị trấn La Hà	thị trấn	528
21238	thi_tran_song_ve	Thị trấn Sông Vệ	thị trấn	528
21241	xa_nghia_lam	Xã Nghĩa Lâm	xã	528
21244	xa_nghia_thang	Xã Nghĩa Thắng	xã	528
21247	xa_nghia_thuan	Xã Nghĩa Thuận	xã	528
21250	xa_nghia_ky	Xã Nghĩa Kỳ	xã	528
21259	xa_nghia_son	Xã Nghĩa Sơn	xã	528
21268	xa_nghia_hoa	Xã Nghĩa Hòa	xã	528
21271	xa_nghia_dien	Xã Nghĩa Điền	xã	528
21274	xa_nghia_thuong	Xã Nghĩa Thương	xã	528
21277	xa_nghia_trung	Xã Nghĩa Trung	xã	528
21280	xa_nghia_hiep	Xã Nghĩa Hiệp	xã	528
21283	xa_nghia_phuong	Xã Nghĩa Phương	xã	528
21286	xa_nghia_my	Xã Nghĩa Mỹ	xã	528
21289	thi_tran_di_lang	Thị trấn Di Lăng	thị trấn	529
21292	xa_son_ha	Xã Sơn Hạ	xã	529
21295	xa_son_thanh	Xã Sơn Thành	xã	529
21298	xa_son_nham	Xã Sơn Nham	xã	529
21301	xa_son_bao	Xã Sơn Bao	xã	529
21304	xa_son_linh	Xã Sơn Linh	xã	529
21307	xa_son_giang	Xã Sơn Giang	xã	529
21310	xa_son_trung	Xã Sơn Trung	xã	529
21313	xa_son_thuong	Xã Sơn Thượng	xã	529
21316	xa_son_cao	Xã Sơn Cao	xã	529
21319	xa_son_hai	Xã Sơn Hải	xã	529
21322	xa_son_thuy	Xã Sơn Thủy	xã	529
21325	xa_son_ky	Xã Sơn Kỳ	xã	529
21328	xa_son_ba	Xã Sơn Ba	xã	529
21331	xa_son_bua	Xã Sơn Bua	xã	530
21334	xa_son_mua	Xã Sơn Mùa	xã	530
21335	xa_son_lien	Xã Sơn Liên	xã	530
21337	xa_son_tan	Xã Sơn Tân	xã	530
21338	xa_son_mau	Xã Sơn Màu	xã	530
21340	xa_son_dung	Xã Sơn Dung	xã	530
21341	xa_son_long	Xã Sơn Long	xã	530
21343	xa_son_tinh	Xã Sơn Tinh	xã	530
21346	xa_son_lap	Xã Sơn Lập	xã	530
21349	xa_long_son	Xã Long Sơn	xã	531
21352	xa_long_mai	Xã Long Mai	xã	531
21355	xa_thanh_an	Xã Thanh An	xã	531
21358	xa_long_mon	Xã Long Môn	xã	531
21361	xa_long_hiep	Xã Long Hiệp	xã	531
21364	thi_tran_cho_chua	Thị trấn Chợ Chùa	thị trấn	532
21367	xa_hanh_thuan	Xã Hành Thuận	xã	532
21370	xa_hanh_dung	Xã Hành Dũng	xã	532
21373	xa_hanh_trung	Xã Hành Trung	xã	532
21376	xa_hanh_nhan	Xã Hành Nhân	xã	532
21379	xa_hanh_duc	Xã Hành Đức	xã	532
21382	xa_hanh_minh	Xã Hành Minh	xã	532
21385	xa_hanh_phuoc	Xã Hành Phước	xã	532
21388	xa_hanh_thien	Xã Hành Thiện	xã	532
21391	xa_hanh_thinh	Xã Hành Thịnh	xã	532
21394	xa_hanh_tin_tay	Xã Hành Tín Tây	xã	532
21397	xa_hanh_tin_dong	Xã Hành Tín Đông	xã	532
21400	thi_tran_mo_duc	Thị trấn Mộ Đức	thị trấn	533
21403	xa_duc_loi	Xã Đức Lợi	xã	533
21406	xa_duc_thang	Xã Đức Thắng	xã	533
21409	xa_duc_nhuan	Xã Đức Nhuận	xã	533
21412	xa_duc_chanh	Xã Đức Chánh	xã	533
21415	xa_duc_hiep	Xã Đức Hiệp	xã	533
21418	xa_duc_minh	Xã Đức Minh	xã	533
21421	xa_duc_thanh	Xã Đức Thạnh	xã	533
21424	xa_duc_hoa	Xã Đức Hòa	xã	533
21427	xa_duc_tan	Xã Đức Tân	xã	533
21430	xa_duc_phu	Xã Đức Phú	xã	533
21433	xa_duc_phong	Xã Đức Phong	xã	533
21436	xa_duc_lan	Xã Đức Lân	xã	533
21439	phuong_nguyen_nghiem	Phường Nguyễn Nghiêm	phường	534
21442	xa_pho_an	Xã Phổ An	xã	534
21445	xa_pho_phong	Xã Phổ Phong	xã	534
21448	xa_pho_thuan	Xã Phổ Thuận	xã	534
21451	phuong_pho_van	Phường Phổ Văn	phường	534
21454	phuong_pho_quang	Phường Phổ Quang	phường	534
21457	xa_pho_nhon	Xã Phổ Nhơn	xã	534
21460	phuong_pho_ninh	Phường Phổ Ninh	phường	534
21463	phuong_pho_minh	Phường Phổ Minh	phường	534
21466	phuong_pho_vinh	Phường Phổ Vinh	phường	534
21469	phuong_pho_hoa	Phường Phổ Hòa	phường	534
21472	xa_pho_cuong	Xã Phổ Cường	xã	534
21475	xa_pho_khanh	Xã Phổ Khánh	xã	534
21478	phuong_pho_thanh	Phường Phổ Thạnh	phường	534
21481	xa_pho_chau	Xã Phổ Châu	xã	534
21484	thi_tran_ba_to	Thị trấn Ba Tơ	thị trấn	535
21487	xa_ba_dien	Xã Ba Điền	xã	535
21490	xa_ba_vinh	Xã Ba Vinh	xã	535
21493	xa_ba_thanh	Xã Ba Thành	xã	535
21496	xa_ba_dong	Xã Ba Động	xã	535
21499	xa_ba_dinh	Xã Ba Dinh	xã	535
21500	xa_ba_giang	Xã Ba Giang	xã	535
21502	xa_ba_lien	Xã Ba Liên	xã	535
21505	xa_ba_ngac	Xã Ba Ngạc	xã	535
21508	xa_ba_kham	Xã Ba Khâm	xã	535
21511	xa_ba_cung	Xã Ba Cung	xã	535
21517	xa_ba_tieu	Xã Ba Tiêu	xã	535
21520	xa_ba_trang	Xã Ba Trang	xã	535
21523	xa_ba_to	Xã Ba Tô	xã	535
21526	xa_ba_bich	Xã Ba Bích	xã	535
21529	xa_ba_vi	Xã Ba Vì	xã	535
21532	xa_ba_le	Xã Ba Lế	xã	535
21535	xa_ba_nam	Xã Ba Nam	xã	535
21538	xa_ba_xa	Xã Ba Xa	xã	535
21550	phuong_nhon_binh	Phường Nhơn Bình	phường	540
21553	phuong_nhon_phu	Phường Nhơn Phú	phường	540
21556	phuong_dong_da	Phường Đống Đa	phường	540
21559	phuong_tran_quang_dieu	Phường Trần Quang Diệu	phường	540
21562	phuong_hai_cang	Phường Hải Cảng	phường	540
21565	phuong_quang_trung	Phường Quang Trung	phường	540
21568	phuong_thi_nai	Phường Thị Nại	phường	540
21571	phuong_le_hong_phong	Phường Lê Hồng Phong	phường	540
21574	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	540
21577	phuong_ngo_may	Phường Ngô Mây	phường	540
21580	phuong_ly_thuong_kiet	Phường Lý Thường Kiệt	phường	540
21583	phuong_le_loi	Phường Lê Lợi	phường	540
21586	phuong_tran_phu	Phường Trần Phú	phường	540
21589	phuong_bui_thi_xuan	Phường Bùi Thị Xuân	phường	540
21592	phuong_nguyen_van_cu	Phường Nguyễn Văn Cừ	phường	540
21595	phuong_ghenh_rang	Phường Ghềnh Ráng	phường	540
21598	xa_nhon_ly	Xã Nhơn Lý	xã	540
21601	xa_nhon_hoi	Xã Nhơn Hội	xã	540
21604	xa_nhon_hai	Xã Nhơn Hải	xã	540
21607	xa_nhon_chau	Xã Nhơn Châu	xã	540
21991	xa_phuoc_my	Xã Phước Mỹ	xã	540
21609	thi_tran_an_lao	Thị trấn An Lão	thị trấn	542
21610	xa_an_hung	Xã An Hưng	xã	542
21613	xa_an_trung	Xã An Trung	xã	542
21616	xa_an_dung	Xã An Dũng	xã	542
21619	xa_an_vinh	Xã An Vinh	xã	542
21622	xa_an_toan	Xã An Toàn	xã	542
21625	xa_an_tan	Xã An Tân	xã	542
21628	xa_an_hoa	Xã An Hòa	xã	542
21631	xa_an_quang	Xã An Quang	xã	542
21634	xa_an_nghia	Xã An Nghĩa	xã	542
21637	phuong_tam_quan	Phường Tam Quan	phường	543
21640	phuong_bong_son	Phường Bồng Sơn	phường	543
21643	xa_hoai_son	Xã Hoài Sơn	xã	543
21646	xa_hoai_chau_bac	Xã Hoài Châu Bắc	xã	543
21649	xa_hoai_chau	Xã Hoài Châu	xã	543
21652	xa_hoai_phu	Xã Hoài Phú	xã	543
21655	phuong_tam_quan_bac	Phường Tam Quan Bắc	phường	543
21658	phuong_tam_quan_nam	Phường Tam Quan Nam	phường	543
21661	phuong_hoai_hao	Phường Hoài Hảo	phường	543
21664	phuong_hoai_thanh_tay	Phường Hoài Thanh Tây	phường	543
21667	phuong_hoai_thanh	Phường Hoài Thanh	phường	543
21670	phuong_hoai_huong	Phường Hoài Hương	phường	543
21673	phuong_hoai_tan	Phường Hoài Tân	phường	543
21676	xa_hoai_hai	Xã Hoài Hải	xã	543
21679	phuong_hoai_xuan	Phường Hoài Xuân	phường	543
21682	xa_hoai_my	Xã Hoài Mỹ	xã	543
21685	phuong_hoai_duc	Phường Hoài Đức	phường	543
21688	thi_tran_tang_bat_ho	Thị trấn Tăng Bạt Hổ	thị trấn	544
21690	xa_an_hao_tay	Xã Ân Hảo Tây	xã	544
21691	xa_an_hao_dong	Xã Ân Hảo Đông	xã	544
21694	xa_an_son	Xã Ân Sơn	xã	544
21697	xa_an_my	Xã Ân Mỹ	xã	544
21700	xa_dak_mang	Xã Đak Mang	xã	544
21703	xa_an_tin	Xã Ân Tín	xã	544
21706	xa_an_thanh	Xã Ân Thạnh	xã	544
21709	xa_an_phong	Xã Ân Phong	xã	544
21712	xa_an_duc	Xã Ân Đức	xã	544
21715	xa_an_huu	Xã Ân Hữu	xã	544
21718	xa_bok_toi	Xã Bok Tới	xã	544
21721	xa_an_tuong_tay	Xã Ân Tường Tây	xã	544
21724	xa_an_tuong_dong	Xã Ân Tường Đông	xã	544
21727	xa_an_nghia	Xã Ân Nghĩa	xã	544
21730	thi_tran_phu_my	Thị trấn Phù Mỹ	thị trấn	545
21733	thi_tran_binh_duong	Thị trấn Bình Dương	thị trấn	545
21736	xa_my_duc	Xã Mỹ Đức	xã	545
21739	xa_my_chau	Xã Mỹ Châu	xã	545
21742	xa_my_thang	Xã Mỹ Thắng	xã	545
21745	xa_my_loc	Xã Mỹ Lộc	xã	545
21748	xa_my_loi	Xã Mỹ Lợi	xã	545
21751	xa_my_an	Xã Mỹ An	xã	545
21754	xa_my_phong	Xã Mỹ Phong	xã	545
21757	xa_my_trinh	Xã Mỹ Trinh	xã	545
21760	xa_my_tho	Xã Mỹ Thọ	xã	545
21763	xa_my_hoa	Xã Mỹ Hòa	xã	545
21766	xa_my_thanh	Xã Mỹ Thành	xã	545
21769	xa_my_chanh	Xã Mỹ Chánh	xã	545
21772	xa_my_quang	Xã Mỹ Quang	xã	545
21775	xa_my_hiep	Xã Mỹ Hiệp	xã	545
21778	xa_my_tai	Xã Mỹ Tài	xã	545
21781	xa_my_cat	Xã Mỹ Cát	xã	545
21784	xa_my_chanh_tay	Xã Mỹ Chánh Tây	xã	545
21786	thi_tran_vinh_thanh	Thị trấn Vĩnh Thạnh	thị trấn	546
21787	xa_vinh_son	Xã Vĩnh Sơn	xã	546
21790	xa_vinh_kim	Xã Vĩnh Kim	xã	546
21796	xa_vinh_hiep	Xã Vĩnh Hiệp	xã	546
21799	xa_vinh_hao	Xã Vĩnh Hảo	xã	546
21801	xa_vinh_hoa	Xã Vĩnh Hòa	xã	546
21802	xa_vinh_thinh	Xã Vĩnh Thịnh	xã	546
21804	xa_vinh_thuan	Xã Vĩnh Thuận	xã	546
21805	xa_vinh_quang	Xã Vĩnh Quang	xã	546
21808	thi_tran_phu_phong	Thị trấn Phú Phong	thị trấn	547
21811	xa_binh_tan	Xã Bình Tân	xã	547
21814	xa_tay_thuan	Xã Tây Thuận	xã	547
21817	xa_binh_thuan	Xã Bình Thuận	xã	547
21820	xa_tay_giang	Xã Tây Giang	xã	547
21823	xa_binh_thanh	Xã Bình Thành	xã	547
21826	xa_tay_an	Xã Tây An	xã	547
21829	xa_binh_hoa	Xã Bình Hòa	xã	547
21832	xa_tay_binh	Xã Tây Bình	xã	547
21835	xa_binh_tuong	Xã Bình Tường	xã	547
21838	xa_tay_vinh	Xã Tây Vinh	xã	547
21841	xa_vinh_an	Xã Vĩnh An	xã	547
21844	xa_tay_xuan	Xã Tây Xuân	xã	547
21847	xa_binh_nghi	Xã Bình Nghi	xã	547
21850	xa_tay_phu	Xã Tây Phú	xã	547
21853	thi_tran_ngo_may	Thị trấn Ngô Mây	thị trấn	548
21856	xa_cat_son	Xã Cát Sơn	xã	548
21859	xa_cat_minh	Xã Cát Minh	xã	548
21862	xa_cat_khanh	Xã Cát Khánh	xã	548
21865	xa_cat_tai	Xã Cát Tài	xã	548
21868	xa_cat_lam	Xã Cát Lâm	xã	548
21871	xa_cat_hanh	Xã Cát Hanh	xã	548
21874	xa_cat_thanh	Xã Cát Thành	xã	548
21877	xa_cat_trinh	Xã Cát Trinh	xã	548
21880	xa_cat_hai	Xã Cát Hải	xã	548
21883	xa_cat_hiep	Xã Cát Hiệp	xã	548
21886	xa_cat_nhon	Xã Cát Nhơn	xã	548
21889	xa_cat_hung	Xã Cát Hưng	xã	548
21892	xa_cat_tuong	Xã Cát Tường	xã	548
21895	xa_cat_tan	Xã Cát Tân	xã	548
21898	thi_tran_cat_tien	Thị trấn Cát Tiến	thị trấn	548
21901	xa_cat_thang	Xã Cát Thắng	xã	548
21904	xa_cat_chanh	Xã Cát Chánh	xã	548
21907	phuong_binh_dinh	Phường Bình Định	phường	549
21910	phuong_dap_da	Phường Đập Đá	phường	549
21913	xa_nhon_my	Xã Nhơn Mỹ	xã	549
21916	phuong_nhon_thanh	Phường Nhơn Thành	phường	549
21919	xa_nhon_hanh	Xã Nhơn Hạnh	xã	549
21922	xa_nhon_hau	Xã Nhơn Hậu	xã	549
21925	xa_nhon_phong	Xã Nhơn Phong	xã	549
21928	xa_nhon_an	Xã Nhơn An	xã	549
21931	xa_nhon_phuc	Xã Nhơn Phúc	xã	549
21934	phuong_nhon_hung	Phường Nhơn Hưng	phường	549
21937	xa_nhon_khanh	Xã Nhơn Khánh	xã	549
21940	xa_nhon_loc	Xã Nhơn Lộc	xã	549
21943	phuong_nhon_hoa	Phường Nhơn Hoà	phường	549
21946	xa_nhon_tan	Xã Nhơn Tân	xã	549
21949	xa_nhon_tho	Xã Nhơn Thọ	xã	549
21952	thi_tran_tuy_phuoc	Thị trấn Tuy Phước	thị trấn	550
21955	thi_tran_dieu_tri	Thị trấn Diêu Trì	thị trấn	550
21958	xa_phuoc_thang	Xã Phước Thắng	xã	550
21961	xa_phuoc_hung	Xã Phước Hưng	xã	550
21964	xa_phuoc_quang	Xã Phước Quang	xã	550
21967	xa_phuoc_hoa	Xã Phước Hòa	xã	550
21970	xa_phuoc_son	Xã Phước Sơn	xã	550
21973	xa_phuoc_hiep	Xã Phước Hiệp	xã	550
21976	xa_phuoc_loc	Xã Phước Lộc	xã	550
21979	xa_phuoc_nghia	Xã Phước Nghĩa	xã	550
21982	xa_phuoc_thuan	Xã Phước Thuận	xã	550
21985	xa_phuoc_an	Xã Phước An	xã	550
21988	xa_phuoc_thanh	Xã Phước Thành	xã	550
21994	thi_tran_van_canh	Thị trấn Vân Canh	thị trấn	551
21997	xa_canh_lien	Xã Canh Liên	xã	551
22000	xa_canh_hiep	Xã Canh Hiệp	xã	551
22003	xa_canh_vinh	Xã Canh Vinh	xã	551
22006	xa_canh_hien	Xã Canh Hiển	xã	551
22009	xa_canh_thuan	Xã Canh Thuận	xã	551
22012	xa_canh_hoa	Xã Canh Hòa	xã	551
22015	phuong_1	Phường 1	phường	555
22018	phuong_8	Phường 8	phường	555
22021	phuong_2	Phường 2	phường	555
22024	phuong_9	Phường 9	phường	555
22027	phuong_3	Phường 3	phường	555
22030	phuong_4	Phường 4	phường	555
22033	phuong_5	Phường 5	phường	555
22036	phuong_7	Phường 7	phường	555
22039	phuong_6	Phường 6	phường	555
22040	phuong_phu_thanh	Phường Phú Thạnh	phường	555
22041	phuong_phu_dong	Phường Phú Đông	phường	555
22042	xa_hoa_kien	Xã Hòa Kiến	xã	555
22045	xa_binh_kien	Xã Bình Kiến	xã	555
22048	xa_binh_ngoc	Xã Bình Ngọc	xã	555
22162	xa_an_phu	Xã An Phú	xã	555
22240	phuong_phu_lam	Phường Phú Lâm	phường	555
22051	phuong_xuan_phu	Phường Xuân Phú	phường	557
22052	xa_xuan_lam	Xã Xuân Lâm	xã	557
22053	phuong_xuan_thanh	Phường Xuân Thành	phường	557
22054	xa_xuan_hai	Xã Xuân Hải	xã	557
22057	xa_xuan_loc	Xã Xuân Lộc	xã	557
22060	xa_xuan_binh	Xã Xuân Bình	xã	557
22066	xa_xuan_canh	Xã Xuân Cảnh	xã	557
22069	xa_xuan_thinh	Xã Xuân Thịnh	xã	557
22072	xa_xuan_phuong	Xã Xuân Phương	xã	557
22073	phuong_xuan_yen	Phường Xuân Yên	phường	557
22075	xa_xuan_tho_1	Xã Xuân Thọ 1	xã	557
22076	phuong_xuan_dai	Phường Xuân Đài	phường	557
22078	xa_xuan_tho_2	Xã Xuân Thọ 2	xã	557
22081	thi_tran_la_hai	Thị trấn La Hai	thị trấn	558
22084	xa_da_loc	Xã Đa Lộc	xã	558
22087	xa_phu_mo	Xã Phú Mỡ	xã	558
22090	xa_xuan_lanh	Xã Xuân Lãnh	xã	558
22093	xa_xuan_long	Xã Xuân Long	xã	558
22096	xa_xuan_quang_1	Xã Xuân Quang 1	xã	558
22099	xa_xuan_son_bac	Xã Xuân Sơn Bắc	xã	558
22102	xa_xuan_quang_2	Xã Xuân Quang 2	xã	558
22105	xa_xuan_son_nam	Xã Xuân Sơn Nam	xã	558
22108	xa_xuan_quang_3	Xã Xuân Quang 3	xã	558
22111	xa_xuan_phuoc	Xã Xuân Phước	xã	558
22114	thi_tran_chi_thanh	Thị trấn Chí Thạnh	thị trấn	559
22117	xa_an_dan	Xã An Dân	xã	559
22120	xa_an_ninh_tay	Xã An Ninh Tây	xã	559
22123	xa_an_ninh_dong	Xã An Ninh Đông	xã	559
22126	xa_an_thach	Xã An Thạch	xã	559
22129	xa_an_dinh	Xã An Định	xã	559
22132	xa_an_nghiep	Xã An Nghiệp	xã	559
22138	xa_an_cu	Xã An Cư	xã	559
22141	xa_an_xuan	Xã An Xuân	xã	559
22144	xa_an_linh	Xã An Lĩnh	xã	559
22147	xa_an_hoa_hai	Xã An Hòa Hải	xã	559
22150	xa_an_hiep	Xã An Hiệp	xã	559
22153	xa_an_my	Xã An Mỹ	xã	559
22156	xa_an_chan	Xã An Chấn	xã	559
22159	xa_an_tho	Xã An Thọ	xã	559
22165	thi_tran_cung_son	Thị trấn Củng Sơn	thị trấn	560
22168	xa_phuoc_tan	Xã Phước Tân	xã	560
22171	xa_son_hoi	Xã Sơn Hội	xã	560
22174	xa_son_dinh	Xã Sơn Định	xã	560
22177	xa_son_long	Xã Sơn Long	xã	560
22180	xa_ca_lui	Xã Cà Lúi	xã	560
22183	xa_son_phuoc	Xã Sơn Phước	xã	560
22186	xa_son_xuan	Xã Sơn Xuân	xã	560
22189	xa_son_nguyen	Xã Sơn Nguyên	xã	560
22192	xa_eacha_rang	Xã Eachà Rang	xã	560
22195	xa_krong_pa	Xã Krông Pa	xã	560
22198	xa_suoi_bac	Xã Suối Bạc	xã	560
22201	xa_son_ha	Xã Sơn Hà	xã	560
22204	xa_suoi_trai	Xã Suối Trai	xã	560
22207	thi_tran_hai_rieng	Thị trấn Hai Riêng	thị trấn	561
22210	xa_ea_lam	Xã Ea Lâm	xã	561
22213	xa_duc_binh_tay	Xã Đức Bình Tây	xã	561
22216	xa_ea_ba	Xã Ea Bá	xã	561
22219	xa_son_giang	Xã Sơn Giang	xã	561
22222	xa_duc_binh_dong	Xã Đức Bình Đông	xã	561
22225	xa_eabar	Xã EaBar	xã	561
22228	xa_eabia	Xã EaBia	xã	561
22231	xa_eatrol	Xã EaTrol	xã	561
22234	xa_song_hinh	Xã Sông Hinh	xã	561
22237	xa_ealy	Xã Ealy	xã	561
22249	xa_son_thanh_tay	Xã Sơn Thành Tây	xã	562
22250	xa_son_thanh_dong	Xã Sơn Thành Đông	xã	562
22252	xa_hoa_binh_1	Xã Hòa Bình 1	xã	562
22255	thi_tran_phu_thu	Thị trấn Phú Thứ	thị trấn	562
22264	xa_hoa_phong	Xã Hòa Phong	xã	562
22270	xa_hoa_phu	Xã Hòa Phú	xã	562
22273	xa_hoa_tan_tay	Xã Hòa Tân Tây	xã	562
22276	xa_hoa_dong	Xã Hòa Đồng	xã	562
22285	xa_hoa_my_dong	Xã Hòa Mỹ Đông	xã	562
22288	xa_hoa_my_tay	Xã Hòa Mỹ Tây	xã	562
22294	xa_hoa_thinh	Xã Hòa Thịnh	xã	562
22303	xa_hoa_quang_bac	Xã Hòa Quang Bắc	xã	563
22306	xa_hoa_quang_nam	Xã Hòa Quang Nam	xã	563
22309	xa_hoa_hoi	Xã Hòa Hội	xã	563
22312	xa_hoa_tri	Xã Hòa Trị	xã	563
22315	xa_hoa_an	Xã Hòa An	xã	563
22318	xa_hoa_dinh_dong	Xã Hòa Định Đông	xã	563
22319	thi_tran_phu_hoa	Thị trấn Phú Hoà	thị trấn	563
22321	xa_hoa_dinh_tay	Xã Hòa Định Tây	xã	563
22324	xa_hoa_thang	Xã Hòa Thắng	xã	563
22243	xa_hoa_thanh	Xã Hòa Thành	xã	564
22246	phuong_hoa_hiep_bac	Phường Hòa Hiệp Bắc	phường	564
22258	phuong_hoa_vinh	Phường Hoà Vinh	phường	564
22261	phuong_hoa_hiep_trung	Phường Hoà Hiệp Trung	phường	564
22267	xa_hoa_tan_dong	Xã Hòa Tân Đông	xã	564
22279	phuong_hoa_xuan_tay	Phường Hòa Xuân Tây	phường	564
22282	phuong_hoa_hiep_nam	Phường Hòa Hiệp Nam	phường	564
22291	xa_hoa_xuan_dong	Xã Hòa Xuân Đông	xã	564
22297	xa_hoa_tam	Xã Hòa Tâm	xã	564
22300	xa_hoa_xuan_nam	Xã Hòa Xuân Nam	xã	564
22327	phuong_vinh_hoa	Phường Vĩnh Hòa	phường	568
22330	phuong_vinh_hai	Phường Vĩnh Hải	phường	568
22333	phuong_vinh_phuoc	Phường Vĩnh Phước	phường	568
22336	phuong_ngoc_hiep	Phường Ngọc Hiệp	phường	568
22339	phuong_vinh_tho	Phường Vĩnh Thọ	phường	568
22342	phuong_xuong_huan	Phường Xương Huân	phường	568
22345	phuong_van_thang	Phường Vạn Thắng	phường	568
22348	phuong_van_thanh	Phường Vạn Thạnh	phường	568
22351	phuong_phuong_sai	Phường Phương Sài	phường	568
22354	phuong_phuong_son	Phường Phương Sơn	phường	568
22357	phuong_phuoc_hai	Phường Phước Hải	phường	568
22360	phuong_phuoc_tan	Phường Phước Tân	phường	568
22363	phuong_loc_tho	Phường Lộc Thọ	phường	568
22366	phuong_phuoc_tien	Phường Phước Tiến	phường	568
22369	phuong_tan_lap	Phường Tân Lập	phường	568
22372	phuong_phuoc_hoa	Phường Phước Hòa	phường	568
22375	phuong_vinh_nguyen	Phường Vĩnh Nguyên	phường	568
22378	phuong_phuoc_long	Phường Phước Long	phường	568
22381	phuong_vinh_truong	Phường Vĩnh Trường	phường	568
22384	xa_vinh_luong	Xã Vĩnh Lương	xã	568
22387	xa_vinh_phuong	Xã Vĩnh Phương	xã	568
22390	xa_vinh_ngoc	Xã Vĩnh Ngọc	xã	568
22393	xa_vinh_thanh	Xã Vĩnh Thạnh	xã	568
22396	xa_vinh_trung	Xã Vĩnh Trung	xã	568
22399	xa_vinh_hiep	Xã Vĩnh Hiệp	xã	568
22402	xa_vinh_thai	Xã Vĩnh Thái	xã	568
22405	xa_phuoc_dong	Xã Phước Đồng	xã	568
22408	phuong_cam_nghia	Phường Cam Nghĩa	phường	569
22411	phuong_cam_phuc_bac	Phường Cam Phúc Bắc	phường	569
22414	phuong_cam_phuc_nam	Phường Cam Phúc Nam	phường	569
22417	phuong_cam_loc	Phường Cam Lộc	phường	569
22420	phuong_cam_phu	Phường Cam Phú	phường	569
22423	phuong_ba_ngoi	Phường Ba Ngòi	phường	569
22426	phuong_cam_thuan	Phường Cam Thuận	phường	569
22429	phuong_cam_loi	Phường Cam Lợi	phường	569
22432	phuong_cam_linh	Phường Cam Linh	phường	569
22468	xa_cam_thanh_nam	Xã Cam Thành Nam	xã	569
22474	xa_cam_phuoc_dong	Xã Cam Phước Đông	xã	569
22477	xa_cam_thinh_tay	Xã Cam Thịnh Tây	xã	569
22480	xa_cam_thinh_dong	Xã Cam Thịnh Đông	xã	569
22483	xa_cam_lap	Xã Cam Lập	xã	569
22486	xa_cam_binh	Xã Cam Bình	xã	569
22435	xa_cam_tan	Xã Cam Tân	xã	570
22438	xa_cam_hoa	Xã Cam Hòa	xã	570
22441	xa_cam_hai_dong	Xã Cam Hải Đông	xã	570
22444	xa_cam_hai_tay	Xã Cam Hải Tây	xã	570
22447	xa_son_tan	Xã Sơn Tân	xã	570
22450	xa_cam_hiep_bac	Xã Cam Hiệp Bắc	xã	570
22453	thi_tran_cam_duc	Thị trấn Cam Đức	thị trấn	570
22456	xa_cam_hiep_nam	Xã Cam Hiệp Nam	xã	570
22459	xa_cam_phuoc_tay	Xã Cam Phước Tây	xã	570
22462	xa_cam_thanh_bac	Xã Cam Thành Bắc	xã	570
22465	xa_cam_an_bac	Xã Cam An Bắc	xã	570
22471	xa_cam_an_nam	Xã Cam An Nam	xã	570
22708	xa_suoi_cat	Xã Suối Cát	xã	570
22711	xa_suoi_tan	Xã Suối Tân	xã	570
22489	thi_tran_van_gia	Thị trấn Vạn Giã	thị trấn	571
22492	xa_dai_lanh	Xã Đại Lãnh	xã	571
22495	xa_van_phuoc	Xã Vạn Phước	xã	571
22498	xa_van_long	Xã Vạn Long	xã	571
22501	xa_van_binh	Xã Vạn Bình	xã	571
22504	xa_van_tho	Xã Vạn Thọ	xã	571
22507	xa_van_khanh	Xã Vạn Khánh	xã	571
22510	xa_van_phu	Xã Vạn Phú	xã	571
22513	xa_van_luong	Xã Vạn Lương	xã	571
22516	xa_van_thang	Xã Vạn Thắng	xã	571
22519	xa_van_thanh	Xã Vạn Thạnh	xã	571
22522	xa_xuan_son	Xã Xuân Sơn	xã	571
22525	xa_van_hung	Xã Vạn Hưng	xã	571
22528	phuong_ninh_hiep	Phường Ninh Hiệp	phường	572
22531	xa_ninh_son	Xã Ninh Sơn	xã	572
22534	xa_ninh_tay	Xã Ninh Tây	xã	572
22537	xa_ninh_thuong	Xã Ninh Thượng	xã	572
22540	xa_ninh_an	Xã Ninh An	xã	572
22543	phuong_ninh_hai	Phường Ninh Hải	phường	572
22546	xa_ninh_tho	Xã Ninh Thọ	xã	572
22549	xa_ninh_trung	Xã Ninh Trung	xã	572
22552	xa_ninh_sim	Xã Ninh Sim	xã	572
22555	xa_ninh_xuan	Xã Ninh Xuân	xã	572
22558	xa_ninh_than	Xã Ninh Thân	xã	572
22561	phuong_ninh_diem	Phường Ninh Diêm	phường	572
22564	xa_ninh_dong	Xã Ninh Đông	xã	572
22567	phuong_ninh_thuy	Phường Ninh Thủy	phường	572
22570	phuong_ninh_da	Phường Ninh Đa	phường	572
22573	xa_ninh_phung	Xã Ninh Phụng	xã	572
22576	xa_ninh_binh	Xã Ninh Bình	xã	572
22579	xa_ninh_phuoc	Xã Ninh Phước	xã	572
22582	xa_ninh_phu	Xã Ninh Phú	xã	572
22585	xa_ninh_tan	Xã Ninh Tân	xã	572
22588	xa_ninh_quang	Xã Ninh Quang	xã	572
22591	phuong_ninh_giang	Phường Ninh Giang	phường	572
22594	phuong_ninh_ha	Phường Ninh Hà	phường	572
22597	xa_ninh_hung	Xã Ninh Hưng	xã	572
22600	xa_ninh_loc	Xã Ninh Lộc	xã	572
22603	xa_ninh_ich	Xã Ninh Ích	xã	572
22606	xa_ninh_van	Xã Ninh Vân	xã	572
22609	thi_tran_khanh_vinh	Thị trấn Khánh Vĩnh	thị trấn	573
22612	xa_khanh_hiep	Xã Khánh Hiệp	xã	573
22615	xa_khanh_binh	Xã Khánh Bình	xã	573
22618	xa_khanh_trung	Xã Khánh Trung	xã	573
22621	xa_khanh_dong	Xã Khánh Đông	xã	573
22624	xa_khanh_thuong	Xã Khánh Thượng	xã	573
22627	xa_khanh_nam	Xã Khánh Nam	xã	573
22630	xa_song_cau	Xã Sông Cầu	xã	573
22633	xa_giang_ly	Xã Giang Ly	xã	573
22636	xa_cau_ba	Xã Cầu Bà	xã	573
22639	xa_lien_sang	Xã Liên Sang	xã	573
22642	xa_khanh_thanh	Xã Khánh Thành	xã	573
22645	xa_khanh_phu	Xã Khánh Phú	xã	573
22648	xa_son_thai	Xã Sơn Thái	xã	573
22651	thi_tran_dien_khanh	Thị trấn Diên Khánh	thị trấn	574
22654	xa_dien_lam	Xã Diên Lâm	xã	574
22657	xa_dien_dien	Xã Diên Điền	xã	574
22660	xa_dien_xuan	Xã Diên Xuân	xã	574
22663	xa_dien_son	Xã Diên Sơn	xã	574
22666	xa_dien_dong	Xã Diên Đồng	xã	574
22669	xa_dien_phu	Xã Diên Phú	xã	574
22672	xa_dien_tho	Xã Diên Thọ	xã	574
22675	xa_dien_phuoc	Xã Diên Phước	xã	574
22678	xa_dien_lac	Xã Diên Lạc	xã	574
22681	xa_dien_tan	Xã Diên Tân	xã	574
22684	xa_dien_hoa	Xã Diên Hòa	xã	574
22687	xa_dien_thanh	Xã Diên Thạnh	xã	574
22690	xa_dien_toan	Xã Diên Toàn	xã	574
22693	xa_dien_an	Xã Diên An	xã	574
22696	xa_binh_loc	Xã Bình Lộc	xã	574
22702	xa_suoi_hiep	Xã Suối Hiệp	xã	574
22705	xa_suoi_tien	Xã Suối Tiên	xã	574
22714	thi_tran_to_hap	Thị trấn Tô Hạp	thị trấn	575
22717	xa_thanh_son	Xã Thành Sơn	xã	575
22720	xa_son_lam	Xã Sơn Lâm	xã	575
22723	xa_son_hiep	Xã Sơn Hiệp	xã	575
22726	xa_son_binh	Xã Sơn Bình	xã	575
22729	xa_son_trung	Xã Sơn Trung	xã	575
22732	xa_ba_cum_bac	Xã Ba Cụm Bắc	xã	575
22735	xa_ba_cum_nam	Xã Ba Cụm Nam	xã	575
22736	thi_tran_truong_sa	Thị trấn Trường Sa	thị trấn	576
22737	xa_song_tu_tay	Xã Song Tử Tây	xã	576
22739	xa_sinh_ton	Xã Sinh Tồn	xã	576
22738	phuong_do_vinh	Phường Đô Vinh	phường	582
22741	phuong_phuoc_my	Phường Phước Mỹ	phường	582
22744	phuong_bao_an	Phường Bảo An	phường	582
22747	phuong_phu_ha	Phường Phủ Hà	phường	582
22750	phuong_thanh_son	Phường Thanh Sơn	phường	582
22753	phuong_my_huong	Phường Mỹ Hương	phường	582
22756	phuong_tan_tai	Phường Tấn Tài	phường	582
22759	phuong_kinh_dinh	Phường Kinh Dinh	phường	582
22762	phuong_dao_long	Phường Đạo Long	phường	582
22765	phuong_dai_son	Phường Đài Sơn	phường	582
22768	phuong_dong_hai	Phường Đông Hải	phường	582
22771	phuong_my_dong	Phường Mỹ Đông	phường	582
22774	xa_thanh_hai	Xã Thành Hải	xã	582
22777	phuong_van_hai	Phường Văn Hải	phường	582
22779	phuong_my_binh	Phường Mỹ Bình	phường	582
22780	phuong_my_hai	Phường Mỹ Hải	phường	582
22783	xa_phuoc_binh	Xã Phước Bình	xã	584
22786	xa_phuoc_hoa	Xã Phước Hòa	xã	584
22789	xa_phuoc_tan	Xã Phước Tân	xã	584
22792	xa_phuoc_tien	Xã Phước Tiến	xã	584
22795	xa_phuoc_thang	Xã Phước Thắng	xã	584
22798	xa_phuoc_thanh	Xã Phước Thành	xã	584
22801	xa_phuoc_dai	Xã Phước Đại	xã	584
22804	xa_phuoc_chinh	Xã Phước Chính	xã	584
22807	xa_phuoc_trung	Xã Phước Trung	xã	584
22810	thi_tran_tan_son	Thị trấn Tân Sơn	thị trấn	585
22813	xa_lam_son	Xã Lâm Sơn	xã	585
22816	xa_luong_son	Xã Lương Sơn	xã	585
22819	xa_quang_son	Xã Quảng Sơn	xã	585
22822	xa_my_son	Xã Mỹ Sơn	xã	585
22825	xa_hoa_son	Xã Hòa Sơn	xã	585
22828	xa_ma_noi	Xã Ma Nới	xã	585
22831	xa_nhon_son	Xã Nhơn Sơn	xã	585
22834	thi_tran_khanh_hai	Thị trấn Khánh Hải	thị trấn	586
22846	xa_vinh_hai	Xã Vĩnh Hải	xã	586
22852	xa_phuong_hai	Xã Phương Hải	xã	586
22855	xa_tan_hai	Xã Tân Hải	xã	586
22858	xa_xuan_hai	Xã Xuân Hải	xã	586
22861	xa_ho_hai	Xã Hộ Hải	xã	586
22864	xa_tri_hai	Xã Tri Hải	xã	586
22867	xa_nhon_hai	Xã Nhơn Hải	xã	586
22868	xa_thanh_hai	Xã Thanh Hải	xã	586
22870	thi_tran_phuoc_dan	Thị trấn Phước Dân	thị trấn	587
22873	xa_phuoc_son	Xã Phước Sơn	xã	587
22876	xa_phuoc_thai	Xã Phước Thái	xã	587
22879	xa_phuoc_hau	Xã Phước Hậu	xã	587
22882	xa_phuoc_thuan	Xã Phước Thuận	xã	587
22888	xa_an_hai	Xã An Hải	xã	587
22891	xa_phuoc_huu	Xã Phước Hữu	xã	587
22894	xa_phuoc_hai	Xã Phước Hải	xã	587
22912	xa_phuoc_vinh	Xã Phước Vinh	xã	587
22837	xa_phuoc_chien	Xã Phước Chiến	xã	588
22840	xa_cong_hai	Xã Công Hải	xã	588
22843	xa_phuoc_khang	Xã Phước Kháng	xã	588
22849	xa_loi_hai	Xã Lợi Hải	xã	588
22853	xa_bac_son	Xã Bắc Sơn	xã	588
22856	xa_bac_phong	Xã Bắc Phong	xã	588
22885	xa_phuoc_ha	Xã Phước Hà	xã	589
22897	xa_phuoc_nam	Xã Phước Nam	xã	589
22898	xa_phuoc_ninh	Xã Phước Ninh	xã	589
22900	xa_nhi_ha	Xã Nhị Hà	xã	589
22903	xa_phuoc_dinh	Xã Phước Dinh	xã	589
22906	xa_phuoc_minh	Xã Phước Minh	xã	589
22909	xa_phuoc_diem	Xã Phước Diêm	xã	589
22910	xa_ca_na	Xã Cà Ná	xã	589
22915	phuong_mui_ne	Phường Mũi Né	phường	593
22918	phuong_ham_tien	Phường Hàm Tiến	phường	593
22921	phuong_phu_hai	Phường Phú Hài	phường	593
22924	phuong_phu_thuy	Phường Phú Thủy	phường	593
22927	phuong_phu_tai	Phường Phú Tài	phường	593
22930	phuong_phu_trinh	Phường Phú Trinh	phường	593
22933	phuong_xuan_an	Phường Xuân An	phường	593
22936	phuong_thanh_hai	Phường Thanh Hải	phường	593
22939	phuong_binh_hung	Phường Bình Hưng	phường	593
22942	phuong_duc_nghia	Phường Đức Nghĩa	phường	593
22945	phuong_lac_dao	Phường Lạc Đạo	phường	593
22948	phuong_duc_thang	Phường Đức Thắng	phường	593
22951	phuong_hung_long	Phường Hưng Long	phường	593
22954	phuong_duc_long	Phường Đức Long	phường	593
22957	xa_thien_nghiep	Xã Thiện Nghiệp	xã	593
22960	xa_phong_nam	Xã Phong Nẫm	xã	593
22963	xa_tien_loi	Xã Tiến Lợi	xã	593
22966	xa_tien_thanh	Xã Tiến Thành	xã	593
23231	phuong_phuoc_hoi	Phường Phước Hội	phường	594
23232	phuong_phuoc_loc	Phường Phước Lộc	phường	594
23234	phuong_tan_thien	Phường Tân Thiện	phường	594
23235	phuong_tan_an	Phường Tân An	phường	594
23237	phuong_binh_tan	Phường Bình Tân	phường	594
23245	xa_tan_hai	Xã Tân Hải	xã	594
23246	xa_tan_tien	Xã Tân Tiến	xã	594
23248	xa_tan_binh	Xã Tân Bình	xã	594
23268	xa_tan_phuoc	Xã Tân Phước	xã	594
22969	thi_tran_lien_huong	Thị trấn Liên Hương	thị trấn	595
22972	thi_tran_phan_ri_cua	Thị trấn Phan Rí Cửa	thị trấn	595
22975	xa_phan_dung	Xã Phan Dũng	xã	595
22978	xa_phong_phu	Xã Phong Phú	xã	595
22981	xa_vinh_hao	Xã Vĩnh Hảo	xã	595
22984	xa_vinh_tan	Xã Vĩnh Tân	xã	595
22987	xa_phu_lac	Xã Phú Lạc	xã	595
22990	xa_phuoc_the	Xã Phước Thể	xã	595
22993	xa_hoa_minh	Xã Hòa Minh	xã	595
22996	xa_chi_cong	Xã Chí Công	xã	595
22999	xa_binh_thanh	Xã Bình Thạnh	xã	595
23005	thi_tran_cho_lau	Thị trấn Chợ Lầu	thị trấn	596
23008	xa_phan_son	Xã Phan Sơn	xã	596
23011	xa_phan_lam	Xã Phan Lâm	xã	596
23014	xa_binh_an	Xã Bình An	xã	596
23017	xa_phan_dien	Xã Phan Điền	xã	596
23020	xa_hai_ninh	Xã Hải Ninh	xã	596
23023	xa_song_luy	Xã Sông Lũy	xã	596
23026	xa_phan_tien	Xã Phan Tiến	xã	596
23029	xa_song_binh	Xã Sông Bình	xã	596
23032	thi_tran_luong_son	Thị trấn Lương Sơn	thị trấn	596
23035	xa_phan_hoa	Xã Phan Hòa	xã	596
23038	xa_phan_thanh	Xã Phan Thanh	xã	596
23041	xa_hong_thai	Xã Hồng Thái	xã	596
23044	xa_phan_hiep	Xã Phan Hiệp	xã	596
23047	xa_binh_tan	Xã Bình Tân	xã	596
23050	xa_phan_ri_thanh	Xã Phan Rí Thành	xã	596
23053	xa_hoa_thang	Xã Hòa Thắng	xã	596
23056	xa_hong_phong	Xã Hồng Phong	xã	596
23059	thi_tran_ma_lam	Thị trấn Ma Lâm	thị trấn	597
23062	thi_tran_phu_long	Thị trấn Phú Long	thị trấn	597
23065	xa_la_da	Xã La Dạ	xã	597
23068	xa_dong_tien	Xã Đông Tiến	xã	597
23071	xa_thuan_hoa	Xã Thuận Hòa	xã	597
23074	xa_dong_giang	Xã Đông Giang	xã	597
23077	xa_ham_phu	Xã Hàm Phú	xã	597
23080	xa_hong_liem	Xã Hồng Liêm	xã	597
23083	xa_thuan_minh	Xã Thuận Minh	xã	597
23086	xa_hong_son	Xã Hồng Sơn	xã	597
23089	xa_ham_tri	Xã Hàm Trí	xã	597
23092	xa_ham_duc	Xã Hàm Đức	xã	597
23095	xa_ham_liem	Xã Hàm Liêm	xã	597
23098	xa_ham_chinh	Xã Hàm Chính	xã	597
23101	xa_ham_hiep	Xã Hàm Hiệp	xã	597
23104	xa_ham_thang	Xã Hàm Thắng	xã	597
23107	xa_da_mi	Xã Đa Mi	xã	597
23110	thi_tran_thuan_nam	Thị trấn Thuận Nam	thị trấn	598
23113	xa_my_thanh	Xã Mỹ Thạnh	xã	598
23116	xa_ham_can	Xã Hàm Cần	xã	598
23119	xa_muong_man	Xã Mương Mán	xã	598
23122	xa_ham_thanh	Xã Hàm Thạnh	xã	598
23125	xa_ham_kiem	Xã Hàm Kiệm	xã	598
23128	xa_ham_cuong	Xã Hàm Cường	xã	598
23131	xa_ham_my	Xã Hàm Mỹ	xã	598
23134	xa_tan_lap	Xã Tân Lập	xã	598
23137	xa_ham_minh	Xã Hàm Minh	xã	598
23140	xa_thuan_qui	Xã Thuận Quí	xã	598
23143	xa_tan_thuan	Xã Tân Thuận	xã	598
23146	xa_tan_thanh	Xã Tân Thành	xã	598
23149	thi_tran_lac_tanh	Thị trấn Lạc Tánh	thị trấn	599
23152	xa_bac_ruong	Xã Bắc Ruộng	xã	599
23158	xa_nghi_duc	Xã Nghị Đức	xã	599
23161	xa_la_ngau	Xã La Ngâu	xã	599
23164	xa_huy_khiem	Xã Huy Khiêm	xã	599
23167	xa_mang_to	Xã Măng Tố	xã	599
23170	xa_duc_phu	Xã Đức Phú	xã	599
23173	xa_dong_kho	Xã Đồng Kho	xã	599
23176	xa_gia_an	Xã Gia An	xã	599
23179	xa_duc_binh	Xã Đức Bình	xã	599
23182	xa_gia_huynh	Xã Gia Huynh	xã	599
23185	xa_duc_thuan	Xã Đức Thuận	xã	599
23188	xa_suoi_kiet	Xã Suối Kiết	xã	599
23191	thi_tran_vo_xu	Thị trấn Võ Xu	thị trấn	600
23194	thi_tran_duc_tai	Thị trấn Đức Tài	thị trấn	600
23197	xa_da_kai	Xã Đa Kai	xã	600
23200	xa_sung_nhon	Xã Sùng Nhơn	xã	600
23203	xa_me_pu	Xã Mê Pu	xã	600
23206	xa_nam_chinh	Xã Nam Chính	xã	600
23212	xa_duc_hanh	Xã Đức Hạnh	xã	600
23215	xa_duc_tin	Xã Đức Tín	xã	600
23218	xa_vu_hoa	Xã Vũ Hoà	xã	600
23221	xa_tan_ha	Xã Tân Hà	xã	600
23224	xa_dong_ha	Xã Đông Hà	xã	600
23227	xa_tra_tan	Xã Trà Tân	xã	600
23230	thi_tran_tan_minh	Thị trấn Tân Minh	thị trấn	601
23236	thi_tran_tan_nghia	Thị trấn Tân Nghĩa	thị trấn	601
23239	xa_song_phan	Xã Sông Phan	xã	601
23242	xa_tan_phuc	Xã Tân Phúc	xã	601
23251	xa_tan_duc	Xã Tân Đức	xã	601
23254	xa_tan_thang	Xã Tân Thắng	xã	601
23255	xa_thang_hai	Xã Thắng Hải	xã	601
23257	xa_tan_ha	Xã Tân Hà	xã	601
23260	xa_tan_xuan	Xã Tân Xuân	xã	601
23266	xa_son_my	Xã Sơn Mỹ	xã	601
23272	xa_ngu_phung	Xã Ngũ Phụng	xã	602
23275	xa_long_hai	Xã Long Hải	xã	602
23278	xa_tam_thanh	Xã Tam Thanh	xã	602
23281	phuong_quang_trung	Phường Quang Trung	phường	608
23284	phuong_duy_tan	Phường Duy Tân	phường	608
23287	phuong_quyet_thang	Phường Quyết Thắng	phường	608
23290	phuong_truong_chinh	Phường Trường Chinh	phường	608
23293	phuong_thang_loi	Phường Thắng Lợi	phường	608
23296	phuong_ngo_may	Phường Ngô Mây	phường	608
23299	phuong_thong_nhat	Phường Thống Nhất	phường	608
23302	phuong_le_loi	Phường Lê Lợi	phường	608
23305	phuong_nguyen_trai	Phường Nguyễn Trãi	phường	608
23308	phuong_tran_hung_dao	Phường Trần Hưng Đạo	phường	608
23311	xa_dak_cam	Xã Đắk Cấm	xã	608
23314	xa_kroong	Xã Kroong	xã	608
23317	xa_ngok_bay	Xã Ngọk Bay	xã	608
23320	xa_vinh_quang	Xã Vinh Quang	xã	608
23323	xa_dak_bla	Xã Đắk Blà	xã	608
23326	xa_ia_chim	Xã Ia Chim	xã	608
23327	xa_dak_nang	Xã Đăk Năng	xã	608
23329	xa_doan_ket	Xã Đoàn Kết	xã	608
23332	xa_chu_hreng	Xã Chư Hreng	xã	608
23335	xa_dak_ro_wa	Xã Đắk Rơ Wa	xã	608
23338	xa_hoa_binh	Xã Hòa Bình	xã	608
23341	thi_tran_dak_glei	Thị trấn Đắk Glei	thị trấn	610
23344	xa_dak_blo	Xã Đắk Blô	xã	610
23347	xa_dak_man	Xã Đắk Man	xã	610
23350	xa_dak_nhoong	Xã Đắk Nhoong	xã	610
23353	xa_dak_pek	Xã Đắk Pék	xã	610
23356	xa_dak_choong	Xã Đắk Choong	xã	610
23359	xa_xop	Xã Xốp	xã	610
23362	xa_muong_hoong	Xã Mường Hoong	xã	610
23365	xa_ngoc_linh	Xã Ngọc Linh	xã	610
23368	xa_dak_long	Xã Đắk Long	xã	610
23371	xa_dak_kroong	Xã Đắk KRoong	xã	610
23374	xa_dak_mon	Xã Đắk Môn	xã	610
23377	thi_tran_plei_kan	Thị trấn Plei Kần	thị trấn	611
23380	xa_dak_ang	Xã Đắk Ang	xã	611
23383	xa_dak_duc	Xã Đắk Dục	xã	611
23386	xa_dak_nong	Xã Đắk Nông	xã	611
23389	xa_dak_xu	Xã Đắk Xú	xã	611
23392	xa_dak_kan	Xã Đắk Kan	xã	611
23395	xa_bo_y	Xã Bờ Y	xã	611
23398	xa_sa_loong	Xã Sa Loong	xã	611
23401	thi_tran_dak_to	Thị trấn Đắk Tô	thị trấn	612
23427	xa_dak_ro_nga	Xã Đắk Rơ Nga	xã	612
23428	xa_ngok_tu	Xã Ngọk Tụ	xã	612
23430	xa_dak_tram	Xã Đắk Trăm	xã	612
23431	xa_van_lem	Xã Văn Lem	xã	612
23434	xa_kon_dao	Xã Kon Đào	xã	612
23437	xa_tan_canh	Xã Tân Cảnh	xã	612
23440	xa_dien_binh	Xã Diên Bình	xã	612
23443	xa_po_ko	Xã Pô Kô	xã	612
23452	xa_dak_nen	Xã Đắk Nên	xã	613
23455	xa_dak_ring	Xã Đắk Ring	xã	613
23458	xa_mang_buk	Xã Măng Buk	xã	613
23461	xa_dak_tang	Xã Đắk Tăng	xã	613
23464	xa_ngok_tem	Xã Ngok Tem	xã	613
23467	xa_po_e	Xã Pờ Ê	xã	613
23470	xa_mang_canh	Xã Măng Cành	xã	613
23473	thi_tran_mang_den	Thị trấn Măng Đen	thị trấn	613
23476	xa_hieu	Xã Hiếu	xã	613
23479	thi_tran_dak_rve	Thị trấn Đắk Rve	thị trấn	614
23482	xa_dak_koi	Xã Đắk Kôi	xã	614
23485	xa_dak_to_lung	Xã Đắk Tơ Lung	xã	614
23488	xa_dak_ruong	Xã Đắk Ruồng	xã	614
23491	xa_dak_pne	Xã Đắk Pne	xã	614
23494	xa_dak_to_re	Xã Đắk Tờ Re	xã	614
23497	xa_tan_lap	Xã Tân Lập	xã	614
23500	thi_tran_dak_ha	Thị trấn Đắk Hà	thị trấn	615
23503	xa_dak_pxi	Xã Đắk PXi	xã	615
23504	xa_dak_long	Xã Đăk Long	xã	615
23506	xa_dak_hring	Xã Đắk HRing	xã	615
23509	xa_dak_ui	Xã Đắk Ui	xã	615
23510	xa_dak_ngok	Xã Đăk Ngọk	xã	615
23512	xa_dak_mar	Xã Đắk Mar	xã	615
23515	xa_ngok_wang	Xã Ngok Wang	xã	615
23518	xa_ngok_reo	Xã Ngok Réo	xã	615
23521	xa_ha_mon	Xã Hà Mòn	xã	615
23524	xa_dak_la	Xã Đắk La	xã	615
23527	thi_tran_sa_thay	Thị trấn Sa Thầy	thị trấn	616
23530	xa_ro_koi	Xã Rơ Kơi	xã	616
23533	xa_sa_nhon	Xã Sa Nhơn	xã	616
23534	xa_ho_moong	Xã Hơ Moong	xã	616
23536	xa_mo_rai	Xã Mô Rai	xã	616
23539	xa_sa_son	Xã Sa Sơn	xã	616
23542	xa_sa_nghia	Xã Sa Nghĩa	xã	616
23545	xa_sa_binh	Xã Sa Bình	xã	616
23548	xa_ya_xier	Xã Ya Xiêr	xã	616
23551	xa_ya_tang	Xã Ya Tăng	xã	616
23554	xa_ya_ly	Xã Ya ly	xã	616
23404	xa_ngoc_lay	Xã Ngọc Lây	xã	617
23407	xa_dak_na	Xã Đắk Na	xã	617
23410	xa_mang_ri	Xã Măng Ri	xã	617
23413	xa_ngoc_yeu	Xã Ngọc Yêu	xã	617
23416	xa_dak_sao	Xã Đắk Sao	xã	617
23417	xa_dak_ro_ong	Xã Đắk Rơ Ông	xã	617
23419	xa_dak_to_kan	Xã Đắk Tờ Kan	xã	617
23422	xa_tu_mo_rong	Xã Tu Mơ Rông	xã	617
23425	xa_dak_ha	Xã Đắk Hà	xã	617
23446	xa_te_xang	Xã Tê Xăng	xã	617
23449	xa_van_xuoi	Xã Văn Xuôi	xã	617
23535	xa_ia_dal	Xã Ia Đal	xã	618
23537	xa_ia_dom	Xã Ia Dom	xã	618
23538	xa_ia_toi	Xã Ia Tơi	xã	618
23557	phuong_yen_do	Phường Yên Đỗ	phường	622
23560	phuong_dien_hong	Phường Diên Hồng	phường	622
23563	phuong_ia_kring	Phường Ia Kring	phường	622
23566	phuong_hoi_thuong	Phường Hội Thương	phường	622
23569	phuong_hoi_phu	Phường Hội Phú	phường	622
23570	phuong_phu_dong	Phường Phù Đổng	phường	622
23572	phuong_hoa_lu	Phường Hoa Lư	phường	622
23575	phuong_tay_son	Phường Tây Sơn	phường	622
23578	phuong_thong_nhat	Phường Thống Nhất	phường	622
23579	phuong_dong_da	Phường Đống Đa	phường	622
23581	phuong_tra_ba	Phường Trà Bá	phường	622
23582	phuong_thang_loi	Phường Thắng Lợi	phường	622
23584	phuong_yen_the	Phường Yên Thế	phường	622
23586	phuong_chi_lang	Phường Chi Lăng	phường	622
23590	xa_bien_ho	Xã Biển Hồ	xã	622
23593	xa_tan_son	Xã Tân Sơn	xã	622
23596	xa_tra_da	Xã Trà Đa	xã	622
23599	xa_chu_a	Xã Chư Á	xã	622
23602	xa_an_phu	Xã An Phú	xã	622
23605	xa_dien_phu	Xã Diên Phú	xã	622
23608	xa_ia_kenh	Xã Ia Kênh	xã	622
23611	xa_gao	Xã Gào	xã	622
23614	phuong_an_binh	Phường An Bình	phường	623
23617	phuong_tay_son	Phường Tây Sơn	phường	623
23620	phuong_an_phu	Phường An Phú	phường	623
23623	phuong_an_tan	Phường An Tân	phường	623
23626	xa_tu_an	Xã Tú An	xã	623
23627	xa_xuan_an	Xã Xuân An	xã	623
23629	xa_cuu_an	Xã Cửu An	xã	623
23630	phuong_an_phuoc	Phường An Phước	phường	623
23632	xa_song_an	Xã Song An	xã	623
23633	phuong_ngo_may	Phường Ngô Mây	phường	623
23635	xa_thanh_an	Xã Thành An	xã	623
24041	phuong_cheo_reo	Phường Cheo Reo	phường	624
24042	phuong_hoa_binh	Phường Hòa Bình	phường	624
24044	phuong_doan_ket	Phường Đoàn Kết	phường	624
24045	phuong_song_bo	Phường Sông Bờ	phường	624
24064	xa_ia_rbol	Xã Ia RBol	xã	624
24065	xa_chu_bah	Xã Chư Băh	xã	624
24070	xa_ia_rto	Xã Ia RTô	xã	624
24073	xa_ia_sao	Xã Ia Sao	xã	624
23638	thi_tran_kbang	Thị trấn KBang	thị trấn	625
23641	xa_kon_pne	Xã Kon Pne	xã	625
23644	xa_dak_roong	Xã Đăk Roong	xã	625
23647	xa_son_lang	Xã Sơn Lang	xã	625
23650	xa_krong	Xã KRong	xã	625
23653	xa_so_pai	Xã Sơ Pai	xã	625
23656	xa_lo_ku	Xã Lơ Ku	xã	625
23659	xa_dong	Xã Đông	xã	625
23660	xa_dak_smar	Xã Đak SMar	xã	625
23662	xa_nghia_an	Xã Nghĩa An	xã	625
23665	xa_to_tung	Xã Tơ Tung	xã	625
23668	xa_kong_long_khong	Xã Kông Lơng Khơng	xã	625
23671	xa_kong_pla	Xã Kông Pla	xã	625
23674	xa_dak_hlo	Xã Đăk HLơ	xã	625
23677	thi_tran_dak_doa	Thị trấn Đăk Đoa	thị trấn	626
23680	xa_ha_dong	Xã Hà Đông	xã	626
23683	xa_dak_somei	Xã Đăk Sơmei	xã	626
23684	xa_dak_krong	Xã Đăk Krong	xã	626
23686	xa_hai_yang	Xã Hải Yang	xã	626
23689	xa_kon_gang	Xã Kon Gang	xã	626
23692	xa_ha_bau	Xã Hà Bầu	xã	626
23695	xa_nam_yang	Xã Nam Yang	xã	626
23698	xa_k_dang	Xã K' Dang	xã	626
23701	xa_h_neng	Xã H' Neng	xã	626
23704	xa_tan_binh	Xã Tân Bình	xã	626
23707	xa_glar	Xã Glar	xã	626
23710	xa_a_dok	Xã A Dơk	xã	626
23713	xa_trang	Xã Trang	xã	626
23714	xa_hnol	Xã HNol	xã	626
23716	xa_ia_pet	Xã Ia Pết	xã	626
23719	xa_ia_bang	Xã Ia Băng	xã	626
23722	thi_tran_phu_hoa	Thị trấn Phú Hòa	thị trấn	627
23725	xa_ha_tay	Xã Hà Tây	xã	627
23728	xa_ia_khuol	Xã Ia Khươl	xã	627
23731	xa_ia_phi	Xã Ia Phí	xã	627
23734	thi_tran_ia_ly	Thị trấn Ia Ly	thị trấn	627
23737	xa_ia_mo_nong	Xã Ia Mơ Nông	xã	627
23738	xa_ia_kreng	Xã Ia Kreng	xã	627
23740	xa_dak_to_ver	Xã Đăk Tơ Ver	xã	627
23743	xa_hoa_phu	Xã Hòa Phú	xã	627
23746	xa_chu_dang_ya	Xã Chư Đăng Ya	xã	627
23749	xa_ia_ka	Xã Ia Ka	xã	627
23752	xa_ia_nhin	Xã Ia Nhin	xã	627
23755	xa_nghia_hoa	Xã Nghĩa Hòa	xã	627
23761	xa_nghia_hung	Xã Nghĩa Hưng	xã	627
23764	thi_tran_ia_kha	Thị trấn Ia Kha	thị trấn	628
23767	xa_ia_sao	Xã Ia Sao	xã	628
23768	xa_ia_yok	Xã Ia Yok	xã	628
23770	xa_ia_hrung	Xã Ia Hrung	xã	628
23771	xa_ia_ba	Xã Ia Bă	xã	628
23773	xa_ia_khai	Xã Ia Khai	xã	628
23776	xa_ia_krai	Xã Ia KRai	xã	628
23778	xa_ia_grang	Xã Ia Grăng	xã	628
23779	xa_ia_to	Xã Ia Tô	xã	628
23782	xa_ia_o	Xã Ia O	xã	628
23785	xa_ia_der	Xã Ia Dêr	xã	628
23788	xa_ia_chia	Xã Ia Chia	xã	628
23791	xa_ia_pech	Xã Ia Pếch	xã	628
23794	thi_tran_kon_dong	Thị trấn Kon Dơng	thị trấn	629
23797	xa_ayun	Xã Ayun	xã	629
23798	xa_dak_jo_ta	Xã Đak Jơ Ta	xã	629
23799	xa_dak_ta_ley	Xã Đak Ta Ley	xã	629
23800	xa_hra	Xã Hra	xã	629
23803	xa_dak_ya	Xã Đăk Yă	xã	629
23806	xa_dak_djrang	Xã Đăk Djrăng	xã	629
23809	xa_lo_pang	Xã Lơ Pang	xã	629
23812	xa_kon_thup	Xã Kon Thụp	xã	629
23815	xa_de_ar	Xã Đê Ar	xã	629
23818	xa_kon_chieng	Xã Kon Chiêng	xã	629
23821	xa_dak_troi	Xã Đăk Trôi	xã	629
23824	thi_tran_kong_chro	Thị trấn Kông Chro	thị trấn	630
23827	xa_chu_krey	Xã Chư Krêy	xã	630
23830	xa_an_trung	Xã An Trung	xã	630
23833	xa_kong_yang	Xã Kông Yang	xã	630
23836	xa_dak_to_pang	Xã Đăk Tơ Pang	xã	630
23839	xa_sro	Xã SRó	xã	630
23840	xa_dak_ko_ning	Xã Đắk Kơ Ning	xã	630
23842	xa_dak_song	Xã Đăk Song	xã	630
23843	xa_dak_pling	Xã Đăk Pling	xã	630
23845	xa_yang_trung	Xã Yang Trung	xã	630
23846	xa_dak_po_pho	Xã Đăk Pơ Pho	xã	630
23848	xa_ya_ma	Xã Ya Ma	xã	630
23851	xa_cho_long	Xã Chơ Long	xã	630
23854	xa_yang_nam	Xã Yang Nam	xã	630
23857	thi_tran_chu_ty	Thị trấn Chư Ty	thị trấn	631
23860	xa_ia_dok	Xã Ia Dơk	xã	631
23863	xa_ia_krel	Xã Ia Krêl	xã	631
23866	xa_ia_din	Xã Ia Din	xã	631
23869	xa_ia_kla	Xã Ia Kla	xã	631
23872	xa_ia_dom	Xã Ia Dom	xã	631
23875	xa_ia_lang	Xã Ia Lang	xã	631
23878	xa_ia_krieng	Xã Ia Kriêng	xã	631
23881	xa_ia_pnon	Xã Ia Pnôn	xã	631
23884	xa_ia_nan	Xã Ia Nan	xã	631
23887	thi_tran_chu_prong	Thị trấn Chư Prông	thị trấn	632
23888	xa_ia_kly	Xã Ia Kly	xã	632
23890	xa_binh_giao	Xã Bình Giáo	xã	632
23893	xa_ia_drang	Xã Ia Drăng	xã	632
23896	xa_thang_hung	Xã Thăng Hưng	xã	632
23899	xa_bau_can	Xã Bàu Cạn	xã	632
23902	xa_ia_phin	Xã Ia Phìn	xã	632
23905	xa_ia_bang	Xã Ia Băng	xã	632
23908	xa_ia_tor	Xã Ia Tôr	xã	632
23911	xa_ia_boong	Xã Ia Boòng	xã	632
23914	xa_ia_o	Xã Ia O	xã	632
23917	xa_ia_puch	Xã Ia Púch	xã	632
23920	xa_ia_me	Xã Ia Me	xã	632
23923	xa_ia_ve	Xã Ia Vê	xã	632
23924	xa_ia_bang	Xã Ia Bang	xã	632
23926	xa_ia_pia	Xã Ia Pia	xã	632
23929	xa_ia_ga	Xã Ia Ga	xã	632
23932	xa_ia_lau	Xã Ia Lâu	xã	632
23935	xa_ia_pior	Xã Ia Piơr	xã	632
23938	xa_ia_mo	Xã Ia Mơ	xã	632
23941	thi_tran_chu_se	Thị trấn Chư Sê	thị trấn	633
23944	xa_ia_tiem	Xã Ia Tiêm	xã	633
23945	xa_chu_pong	Xã Chư Pơng	xã	633
23946	xa_bar_maih	Xã Bar Măih	xã	633
23947	xa_bo_ngoong	Xã Bờ Ngoong	xã	633
23950	xa_ia_glai	Xã Ia Glai	xã	633
23953	xa_al_ba	Xã AL Bá	xã	633
23954	xa_kong_htok	Xã Kông HTok	xã	633
23956	xa_ayun	Xã AYun	xã	633
23959	xa_ia_hlop	Xã Ia HLốp	xã	633
23962	xa_ia_blang	Xã Ia Blang	xã	633
23965	xa_dun	Xã Dun	xã	633
23966	xa_ia_pal	Xã Ia Pal	xã	633
23968	xa_h_bong	Xã H Bông	xã	633
23977	xa_ia_ko	Xã Ia Ko	xã	633
23989	xa_ha_tam	Xã Hà Tam	xã	634
23992	xa_an_thanh	Xã An Thành	xã	634
23995	thi_tran_dak_po	Thị trấn Đak Pơ	thị trấn	634
23998	xa_yang_bac	Xã Yang Bắc	xã	634
24001	xa_cu_an	Xã Cư An	xã	634
24004	xa_tan_an	Xã Tân An	xã	634
24007	xa_phu_an	Xã Phú An	xã	634
24010	xa_ya_hoi	Xã Ya Hội	xã	634
24013	xa_po_to	Xã Pờ Tó	xã	635
24016	xa_chu_rang	Xã Chư Răng	xã	635
24019	xa_ia_kdam	Xã Ia KDăm	xã	635
24022	xa_kim_tan	Xã Kim Tân	xã	635
24025	xa_chu_mo	Xã Chư Mố	xã	635
24028	xa_ia_tul	Xã Ia Tul	xã	635
24031	xa_ia_ma_ron	Xã Ia Ma Rơn	xã	635
24034	xa_ia_broai	Xã Ia Broăi	xã	635
24037	xa_ia_trok	Xã Ia Trok	xã	635
24076	thi_tran_phu_tuc	Thị trấn Phú Túc	thị trấn	637
24079	xa_ia_rsai	Xã Ia RSai	xã	637
24082	xa_ia_rsuom	Xã Ia RSươm	xã	637
24085	xa_chu_gu	Xã Chư Gu	xã	637
24088	xa_dat_bang	Xã Đất Bằng	xã	637
24091	xa_ia_mlah	Xã Ia Mláh	xã	637
24094	xa_chu_drang	Xã Chư Drăng	xã	637
24097	xa_phu_can	Xã Phú Cần	xã	637
24100	xa_ia_hdreh	Xã Ia HDreh	xã	637
24103	xa_ia_rmok	Xã Ia RMok	xã	637
24106	xa_chu_ngoc	Xã Chư Ngọc	xã	637
24109	xa_uar	Xã Uar	xã	637
24112	xa_chu_rcam	Xã Chư Rcăm	xã	637
24115	xa_krong_nang	Xã Krông Năng	xã	637
24043	thi_tran_phu_thien	Thị trấn Phú Thiện	thị trấn	638
24046	xa_chu_a_thai	Xã Chư A Thai	xã	638
24048	xa_ayun_ha	Xã Ayun Hạ	xã	638
24049	xa_ia_ake	Xã Ia Ake	xã	638
24052	xa_ia_sol	Xã Ia Sol	xã	638
24055	xa_ia_piar	Xã Ia Piar	xã	638
24058	xa_ia_peng	Xã Ia Peng	xã	638
24060	xa_chroh_ponan	Xã Chrôh Pơnan	xã	638
24061	xa_ia_hiao	Xã Ia Hiao	xã	638
24067	xa_ia_yeng	Xã Ia Yeng	xã	638
23942	thi_tran_nhon_hoa	Thị trấn Nhơn Hoà	thị trấn	639
23971	xa_ia_hru	Xã Ia Hrú	xã	639
23972	xa_ia_rong	Xã Ia Rong	xã	639
23974	xa_ia_dreng	Xã Ia Dreng	xã	639
23978	xa_ia_hla	Xã Ia Hla	xã	639
23980	xa_chu_don	Xã Chư Don	xã	639
23983	xa_ia_phang	Xã Ia Phang	xã	639
23986	xa_ia_le	Xã Ia Le	xã	639
23987	xa_ia_blu	Xã Ia BLứ	xã	639
24118	phuong_tan_lap	Phường Tân Lập	phường	643
24121	phuong_tan_hoa	Phường Tân Hòa	phường	643
24124	phuong_tan_an	Phường Tân An	phường	643
24127	phuong_thong_nhat	Phường Thống Nhất	phường	643
24130	phuong_thanh_nhat	Phường Thành Nhất	phường	643
24133	phuong_thang_loi	Phường Thắng Lợi	phường	643
24136	phuong_tan_loi	Phường Tân Lợi	phường	643
24139	phuong_thanh_cong	Phường Thành Công	phường	643
24142	phuong_tan_thanh	Phường Tân Thành	phường	643
24145	phuong_tan_tien	Phường Tân Tiến	phường	643
24148	phuong_tu_an	Phường Tự An	phường	643
24151	phuong_ea_tam	Phường Ea Tam	phường	643
24154	phuong_khanh_xuan	Phường Khánh Xuân	phường	643
24157	xa_hoa_thuan	Xã Hòa Thuận	xã	643
24160	xa_cu_ebur	Xã Cư ÊBur	xã	643
24163	xa_ea_tu	Xã Ea Tu	xã	643
24166	xa_hoa_thang	Xã Hòa Thắng	xã	643
24169	xa_ea_kao	Xã Ea Kao	xã	643
24172	xa_hoa_phu	Xã Hòa Phú	xã	643
24175	xa_hoa_khanh	Xã Hòa Khánh	xã	643
24178	xa_hoa_xuan	Xã Hòa Xuân	xã	643
24305	phuong_an_lac	Phường An Lạc	phường	644
24308	phuong_an_binh	Phường An Bình	phường	644
24311	phuong_thien_an	Phường Thiện An	phường	644
24318	phuong_dat_hieu	Phường Đạt Hiếu	phường	644
24322	phuong_doan_ket	Phường Đoàn Kết	phường	644
24325	xa_ea_blang	Xã Ea Blang	xã	644
24328	xa_ea_drong	Xã Ea Drông	xã	644
24331	phuong_thong_nhat	Phường Thống Nhất	phường	644
24332	phuong_binh_tan	Phường Bình Tân	phường	644
24334	xa_ea_sien	Xã Ea Siên	xã	644
24337	xa_binh_thuan	Xã Bình Thuận	xã	644
24340	xa_cu_bao	Xã Cư Bao	xã	644
24181	thi_tran_ea_drang	Thị trấn Ea Drăng	thị trấn	645
24184	xa_ea_hleo	Xã Ea H'leo	xã	645
24187	xa_ea_sol	Xã Ea Sol	xã	645
24190	xa_ea_ral	Xã Ea Ral	xã	645
24193	xa_ea_wy	Xã Ea Wy	xã	645
24194	xa_cu_a_mung	Xã Cư A Mung	xã	645
24196	xa_cu_mot	Xã Cư Mốt	xã	645
24199	xa_ea_hiao	Xã Ea Hiao	xã	645
24202	xa_ea_khal	Xã Ea Khal	xã	645
24205	xa_dlie_yang	Xã Dliê Yang	xã	645
24207	xa_ea_tir	Xã Ea Tir	xã	645
24208	xa_ea_nam	Xã Ea Nam	xã	645
24211	thi_tran_ea_sup	Thị trấn Ea Súp	thị trấn	646
24214	xa_ia_lop	Xã Ia Lốp	xã	646
24215	xa_ia_jloi	Xã Ia JLơi	xã	646
24217	xa_ea_rok	Xã Ea Rốk	xã	646
24220	xa_ya_to_mot	Xã Ya Tờ Mốt	xã	646
24221	xa_ia_rve	Xã Ia RVê	xã	646
24223	xa_ea_le	Xã Ea Lê	xã	646
24226	xa_cu_kbang	Xã Cư KBang	xã	646
24229	xa_ea_bung	Xã Ea Bung	xã	646
24232	xa_cu_mlan	Xã Cư M'Lan	xã	646
24235	xa_krong_na	Xã Krông Na	xã	647
24238	xa_ea_huar	Xã Ea Huar	xã	647
24241	xa_ea_wer	Xã Ea Wer	xã	647
24244	xa_tan_hoa	Xã Tân Hoà	xã	647
24247	xa_cuor_knia	Xã Cuôr KNia	xã	647
24250	xa_ea_bar	Xã Ea Bar	xã	647
24253	xa_ea_nuol	Xã Ea Nuôl	xã	647
24256	thi_tran_ea_pok	Thị trấn Ea Pốk	thị trấn	648
24259	thi_tran_quang_phu	Thị trấn Quảng Phú	thị trấn	648
24262	xa_quang_tien	Xã Quảng Tiến	xã	648
24264	xa_ea_kueh	Xã Ea Kuêh	xã	648
24265	xa_ea_kiet	Xã Ea Kiết	xã	648
24268	xa_ea_tar	Xã Ea Tar	xã	648
24271	xa_cu_dlie_mnong	Xã Cư Dliê M'nông	xã	648
24274	xa_ea_hdinh	Xã Ea H'đinh	xã	648
24277	xa_ea_tul	Xã Ea Tul	xã	648
24280	xa_ea_kpam	Xã Ea KPam	xã	648
24283	xa_ea_mdroh	Xã Ea M'DRóh	xã	648
24286	xa_quang_hiep	Xã Quảng Hiệp	xã	648
24289	xa_cu_mgar	Xã Cư M'gar	xã	648
24292	xa_ea_drong	Xã Ea D'Rơng	xã	648
24295	xa_ea_mnang	Xã Ea M'nang	xã	648
24298	xa_cu_sue	Xã Cư Suê	xã	648
24301	xa_cuor_dang	Xã Cuor Đăng	xã	648
24307	xa_cu_ne	Xã Cư Né	xã	649
24310	xa_chu_kbo	Xã Chư KBô	xã	649
24313	xa_cu_pong	Xã Cư Pơng	xã	649
24314	xa_ea_sin	Xã Ea Sin	xã	649
24316	xa_pong_drang	Xã Pơng Drang	xã	649
24317	xa_tan_lap	Xã Tân Lập	xã	649
24319	xa_ea_ngai	Xã Ea Ngai	xã	649
24343	thi_tran_krong_nang	Thị trấn Krông Năng	thị trấn	650
24346	xa_dlie_ya	Xã ĐLiê Ya	xã	650
24349	xa_ea_toh	Xã Ea Tóh	xã	650
24352	xa_ea_tam	Xã Ea Tam	xã	650
24355	xa_phu_loc	Xã Phú Lộc	xã	650
24358	xa_tam_giang	Xã Tam Giang	xã	650
24359	xa_ea_puk	Xã Ea Puk	xã	650
24360	xa_ea_dah	Xã Ea Dăh	xã	650
24361	xa_ea_ho	Xã Ea Hồ	xã	650
24364	xa_phu_xuan	Xã Phú Xuân	xã	650
24367	xa_cu_klong	Xã Cư Klông	xã	650
24370	xa_ea_tan	Xã Ea Tân	xã	650
24373	thi_tran_ea_kar	Thị trấn Ea Kar	thị trấn	651
24376	thi_tran_ea_knop	Thị trấn Ea Knốp	thị trấn	651
24379	xa_ea_so	Xã Ea Sô	xã	651
24380	xa_ea_sar	Xã Ea Sar	xã	651
24382	xa_xuan_phu	Xã Xuân Phú	xã	651
24385	xa_cu_hue	Xã Cư Huê	xã	651
24388	xa_ea_tih	Xã Ea Tih	xã	651
24391	xa_ea_dar	Xã Ea Đar	xã	651
24394	xa_ea_kmut	Xã Ea Kmút	xã	651
24397	xa_cu_ni	Xã Cư Ni	xã	651
24400	xa_ea_pal	Xã Ea Păl	xã	651
24401	xa_cu_prong	Xã Cư Prông	xã	651
24403	xa_ea_o	Xã Ea Ô	xã	651
24404	xa_cu_elang	Xã Cư ELang	xã	651
24406	xa_cu_bong	Xã Cư Bông	xã	651
24409	xa_cu_jang	Xã Cư Jang	xã	651
24412	thi_tran_mdrak	Thị trấn M'Đrắk	thị trấn	652
24415	xa_cu_prao	Xã Cư Prao	xã	652
24418	xa_ea_pil	Xã Ea Pil	xã	652
24421	xa_ea_lai	Xã Ea Lai	xã	652
24424	xa_ea_hmlay	Xã Ea H'MLay	xã	652
24427	xa_krong_jing	Xã Krông Jing	xã	652
24430	xa_ea_m_doal	Xã Ea M' Doal	xã	652
24433	xa_ea_rieng	Xã Ea Riêng	xã	652
24436	xa_cu_mta	Xã Cư M'ta	xã	652
24439	xa_cu_k_roa	Xã Cư K Róa	xã	652
24442	xa_krong_a	Xã Krông Á	xã	652
24444	xa_cu_san	Xã Cư San	xã	652
24445	xa_ea_trang	Xã Ea Trang	xã	652
24448	thi_tran_krong_kmar	Thị trấn Krông Kmar	thị trấn	653
24451	xa_dang_kang	Xã Dang Kang	xã	653
24454	xa_cu_kty	Xã Cư KTy	xã	653
24457	xa_hoa_thanh	Xã Hòa Thành	xã	653
24460	xa_hoa_tan	Xã Hòa Tân	xã	653
24463	xa_hoa_phong	Xã Hòa Phong	xã	653
24466	xa_hoa_le	Xã Hòa Lễ	xã	653
24469	xa_yang_reh	Xã Yang Reh	xã	653
24472	xa_ea_trul	Xã Ea Trul	xã	653
24475	xa_khue_ngoc_dien	Xã Khuê Ngọc Điền	xã	653
24478	xa_cu_pui	Xã Cư Pui	xã	653
24481	xa_hoa_son	Xã Hòa Sơn	xã	653
24484	xa_cu_dram	Xã Cư Drăm	xã	653
24487	xa_yang_mao	Xã Yang Mao	xã	653
24490	thi_tran_phuoc_an	Thị trấn Phước An	thị trấn	654
24493	xa_krong_buk	Xã KRông Búk	xã	654
24496	xa_ea_kly	Xã Ea Kly	xã	654
24499	xa_ea_kenh	Xã Ea Kênh	xã	654
24502	xa_ea_phe	Xã Ea Phê	xã	654
24505	xa_ea_knuec	Xã Ea KNuec	xã	654
24508	xa_ea_yong	Xã Ea Yông	xã	654
24511	xa_hoa_an	Xã Hòa An	xã	654
24514	xa_ea_kuang	Xã Ea Kuăng	xã	654
24517	xa_hoa_dong	Xã Hòa Đông	xã	654
24520	xa_ea_hiu	Xã Ea Hiu	xã	654
24523	xa_hoa_tien	Xã Hòa Tiến	xã	654
24526	xa_tan_tien	Xã Tân Tiến	xã	654
24529	xa_vu_bon	Xã Vụ Bổn	xã	654
24532	xa_ea_uy	Xã Ea Uy	xã	654
24535	xa_ea_yieng	Xã Ea Yiêng	xã	654
24538	thi_tran_buon_trap	Thị trấn Buôn Trấp	thị trấn	655
24556	xa_dray_sap	Xã Dray Sáp	xã	655
24559	xa_ea_na	Xã Ea Na	xã	655
24565	xa_ea_bong	Xã Ea Bông	xã	655
24568	xa_bang_a_drenh	Xã Băng A Drênh	xã	655
24571	xa_dur_kmal	Xã Dur KMăl	xã	655
24574	xa_binh_hoa	Xã Bình Hòa	xã	655
24577	xa_quang_dien	Xã Quảng Điền	xã	655
24580	thi_tran_lien_son	Thị trấn Liên Sơn	thị trấn	656
24583	xa_yang_tao	Xã Yang Tao	xã	656
24586	xa_bong_krang	Xã Bông Krang	xã	656
24589	xa_dak_lieng	Xã Đắk Liêng	xã	656
24592	xa_buon_triet	Xã Buôn Triết	xã	656
24595	xa_buon_tria	Xã Buôn Tría	xã	656
24598	xa_dak_phoi	Xã Đắk Phơi	xã	656
24601	xa_dak_nue	Xã Đắk Nuê	xã	656
24604	xa_krong_no	Xã Krông Nô	xã	656
24607	xa_nam_ka	Xã Nam Ka	xã	656
24610	xa_ea_rbin	Xã Ea R'Bin	xã	656
24540	xa_ea_ning	Xã Ea Ning	xã	657
24541	xa_cu_e_wi	Xã Cư Ê Wi	xã	657
24544	xa_ea_ktur	Xã Ea Ktur	xã	657
24547	xa_ea_tieu	Xã Ea Tiêu	xã	657
24550	xa_ea_bhok	Xã Ea BHốk	xã	657
24553	xa_ea_hu	Xã Ea Hu	xã	657
24561	xa_dray_bhang	Xã Dray Bhăng	xã	657
24562	xa_hoa_hiep	Xã Hòa Hiệp	xã	657
24611	phuong_nghia_duc	Phường Nghĩa Đức	phường	660
24612	phuong_nghia_thanh	Phường Nghĩa Thành	phường	660
24614	phuong_nghia_phu	Phường Nghĩa Phú	phường	660
24615	phuong_nghia_tan	Phường Nghĩa Tân	phường	660
24617	phuong_nghia_trung	Phường Nghĩa Trung	phường	660
24618	xa_dak_rmoan	Xã Đăk R'Moan	xã	660
24619	phuong_quang_thanh	Phường Quảng Thành	phường	660
24628	xa_dak_nia	Xã Đắk Nia	xã	660
24616	xa_quang_son	Xã Quảng Sơn	xã	661
24620	xa_quang_hoa	Xã Quảng Hoà	xã	661
24622	xa_dak_ha	Xã Đắk Ha	xã	661
24625	xa_dak_rmang	Xã Đắk R'Măng	xã	661
24631	xa_quang_khe	Xã Quảng Khê	xã	661
24634	xa_dak_plao	Xã Đắk Plao	xã	661
24637	xa_dak_som	Xã Đắk Som	xã	661
24640	thi_tran_ea_tling	Thị trấn Ea T'Ling	thị trấn	662
24643	xa_dak_wil	Xã Đắk Wil	xã	662
24646	xa_ea_po	Xã Ea Pô	xã	662
24649	xa_nam_dong	Xã Nam Dong	xã	662
24652	xa_dak_drong	Xã Đắk DRông	xã	662
24655	xa_tam_thang	Xã Tâm Thắng	xã	662
24658	xa_cu_knia	Xã Cư Knia	xã	662
24661	xa_truc_son	Xã Trúc Sơn	xã	662
24664	thi_tran_dak_mil	Thị trấn Đắk Mil	thị trấn	663
24667	xa_dak_lao	Xã Đắk Lao	xã	663
24670	xa_dak_rla	Xã Đắk R'La	xã	663
24673	xa_dak_gan	Xã Đắk Gằn	xã	663
24676	xa_duc_manh	Xã Đức Mạnh	xã	663
24677	xa_dak_ndrot	Xã Đắk N'Drót	xã	663
24678	xa_long_son	Xã Long Sơn	xã	663
24679	xa_dak_sak	Xã Đắk Sắk	xã	663
24682	xa_thuan_an	Xã Thuận An	xã	663
24685	xa_duc_minh	Xã Đức Minh	xã	663
24688	thi_tran_dak_mam	Thị trấn Đắk Mâm	thị trấn	664
24691	xa_dak_sor	Xã Đắk Sôr	xã	664
24692	xa_nam_xuan	Xã Nam Xuân	xã	664
24694	xa_buon_choah	Xã Buôn Choah	xã	664
24697	xa_nam_da	Xã Nam Đà	xã	664
24699	xa_tan_thanh	Xã Tân Thành	xã	664
24700	xa_dak_dro	Xã Đắk Drô	xã	664
24703	xa_nam_nung	Xã Nâm Nung	xã	664
24706	xa_duc_xuyen	Xã Đức Xuyên	xã	664
24709	xa_dak_nang	Xã Đắk Nang	xã	664
24712	xa_quang_phu	Xã Quảng Phú	xã	664
24715	xa_nam_ndir	Xã Nâm N'Đir	xã	664
24717	thi_tran_duc_an	Thị trấn Đức An	thị trấn	665
24718	xa_dak_mol	Xã Đắk Môl	xã	665
24719	xa_dak_hoa	Xã Đắk Hòa	xã	665
24721	xa_nam_binh	Xã Nam Bình	xã	665
24722	xa_thuan_ha	Xã Thuận Hà	xã	665
24724	xa_thuan_hanh	Xã Thuận Hạnh	xã	665
24727	xa_dak_ndung	Xã Đắk N'Dung	xã	665
24728	xa_nam_njang	Xã Nâm N'Jang	xã	665
24730	xa_truong_xuan	Xã Trường Xuân	xã	665
24733	thi_tran_kien_duc	Thị trấn Kiến Đức	thị trấn	666
24745	xa_quang_tin	Xã Quảng Tín	xã	666
24750	xa_dak_wer	Xã Đắk Wer	xã	666
24751	xa_nhan_co	Xã Nhân Cơ	xã	666
24754	xa_kien_thanh	Xã Kiến Thành	xã	666
24756	xa_nghia_thang	Xã Nghĩa Thắng	xã	666
24757	xa_dao_nghia	Xã Đạo Nghĩa	xã	666
24760	xa_dak_sin	Xã Đắk Sin	xã	666
24761	xa_hung_binh	Xã Hưng Bình	xã	666
24763	xa_dak_ru	Xã Đắk Ru	xã	666
24766	xa_nhan_dao	Xã Nhân Đạo	xã	666
24736	xa_quang_truc	Xã Quảng Trực	xã	667
24739	xa_dak_buk_so	Xã Đắk Búk So	xã	667
24740	xa_quang_tam	Xã Quảng Tâm	xã	667
24742	xa_dak_rtih	Xã Đắk R'Tíh	xã	667
24746	xa_dak_ngo	Xã Đắk Ngo	xã	667
24748	xa_quang_tan	Xã Quảng Tân	xã	667
24769	phuong_7	Phường 7	phường	672
24772	phuong_8	Phường 8	phường	672
24775	phuong_12	Phường 12	phường	672
24778	phuong_9	Phường 9	phường	672
24781	phuong_2	Phường 2	phường	672
24784	phuong_1	Phường 1	phường	672
24787	phuong_6	Phường 6	phường	672
24790	phuong_5	Phường 5	phường	672
24793	phuong_4	Phường 4	phường	672
24796	phuong_10	Phường 10	phường	672
24799	phuong_11	Phường 11	phường	672
24802	phuong_3	Phường 3	phường	672
24805	xa_xuan_tho	Xã Xuân Thọ	xã	672
24808	xa_ta_nung	Xã Tà Nung	xã	672
24810	xa_tram_hanh	Xã Trạm Hành	xã	672
24811	xa_xuan_truong	Xã Xuân Trường	xã	672
24814	phuong_loc_phat	Phường Lộc Phát	phường	673
24817	phuong_loc_tien	Phường Lộc Tiến	phường	673
24820	phuong_2	Phường 2	phường	673
24823	phuong_1	Phường 1	phường	673
24826	phuong_blao	Phường B'lao	phường	673
24829	phuong_loc_son	Phường Lộc Sơn	phường	673
24832	xa_dam_bri	Xã Đạm Bri	xã	673
24835	xa_loc_thanh	Xã Lộc Thanh	xã	673
24838	xa_loc_nga	Xã Lộc Nga	xã	673
24841	xa_loc_chau	Xã Lộc Châu	xã	673
24844	xa_dai_lao	Xã Đại Lào	xã	673
24853	xa_da_tong	Xã Đạ Tông	xã	674
24856	xa_da_long	Xã Đạ Long	xã	674
24859	xa_da_m_rong	Xã Đạ M' Rong	xã	674
24874	xa_lieng_sronh	Xã Liêng Srônh	xã	674
24875	xa_da_rsal	Xã Đạ Rsal	xã	674
24877	xa_ro_men	Xã Rô Men	xã	674
24886	xa_phi_lieng	Xã Phi Liêng	xã	674
24889	xa_da_k_nang	Xã Đạ K' Nàng	xã	674
24846	thi_tran_lac_duong	Thị trấn Lạc Dương	thị trấn	675
24847	xa_da_chais	Xã Đạ Chais	xã	675
24848	xa_da_nhim	Xã Đạ Nhim	xã	675
24850	xa_dung_kno	Xã Đưng KNớ	xã	675
24862	xa_lat	Xã Lát	xã	675
24865	xa_da_sar	Xã Đạ Sar	xã	675
24868	thi_tran_nam_ban	Thị trấn Nam Ban	thị trấn	676
24871	thi_tran_dinh_van	Thị trấn Đinh Văn	thị trấn	676
24880	xa_phu_son	Xã Phú Sơn	xã	676
24883	xa_phi_to	Xã Phi Tô	xã	676
24892	xa_me_linh	Xã Mê Linh	xã	676
24895	xa_da_don	Xã Đạ Đờn	xã	676
24898	xa_phuc_tho	Xã Phúc Thọ	xã	676
24901	xa_dong_thanh	Xã Đông Thanh	xã	676
24904	xa_gia_lam	Xã Gia Lâm	xã	676
24907	xa_tan_thanh	Xã Tân Thanh	xã	676
24910	xa_tan_van	Xã Tân Văn	xã	676
24913	xa_hoai_duc	Xã Hoài Đức	xã	676
24916	xa_tan_ha	Xã Tân Hà	xã	676
24919	xa_lien_ha	Xã Liên Hà	xã	676
24922	xa_dan_phuong	Xã Đan Phượng	xã	676
24925	xa_nam_ha	Xã Nam Hà	xã	676
24928	thi_tran_dran	Thị trấn D'Ran	thị trấn	677
24931	thi_tran_thanh_my	Thị trấn Thạnh Mỹ	thị trấn	677
24934	xa_lac_xuan	Xã Lạc Xuân	xã	677
24937	xa_da_ron	Xã Đạ Ròn	xã	677
24940	xa_lac_lam	Xã Lạc Lâm	xã	677
24943	xa_ka_do	Xã Ka Đô	xã	677
24946	xa_quang_lap	Xã Quảng Lập	xã	677
24949	xa_ka_don	Xã Ka Đơn	xã	677
24952	xa_tu_tra	Xã Tu Tra	xã	677
24955	xa_pro	Xã Pró	xã	677
24958	thi_tran_lien_nghia	Thị trấn Liên Nghĩa	thị trấn	678
24961	xa_hiep_an	Xã Hiệp An	xã	678
24964	xa_lien_hiep	Xã Liên Hiệp	xã	678
24967	xa_hiep_thanh	Xã Hiệp Thạnh	xã	678
24970	xa_binh_thanh	Xã Bình Thạnh	xã	678
24973	xa_nthol_ha	Xã N'Thol Hạ	xã	678
24976	xa_tan_hoi	Xã Tân Hội	xã	678
24979	xa_tan_thanh	Xã Tân Thành	xã	678
24982	xa_phu_hoi	Xã Phú Hội	xã	678
24985	xa_ninh_gia	Xã Ninh Gia	xã	678
24988	xa_ta_nang	Xã Tà Năng	xã	678
24989	xa_da_quyn	Xã Đa Quyn	xã	678
24991	xa_ta_hine	Xã Tà Hine	xã	678
24994	xa_da_loan	Xã Đà Loan	xã	678
24997	xa_ninh_loan	Xã Ninh Loan	xã	678
25000	thi_tran_di_linh	Thị trấn Di Linh	thị trấn	679
25003	xa_dinh_trang_thuong	Xã Đinh Trang Thượng	xã	679
25006	xa_tan_thuong	Xã Tân Thượng	xã	679
25007	xa_tan_lam	Xã Tân Lâm	xã	679
25009	xa_tan_chau	Xã Tân Châu	xã	679
25012	xa_tan_nghia	Xã Tân Nghĩa	xã	679
25015	xa_gia_hiep	Xã Gia Hiệp	xã	679
25018	xa_dinh_lac	Xã Đinh Lạc	xã	679
25021	xa_tam_bo	Xã Tam Bố	xã	679
25024	xa_dinh_trang_hoa	Xã Đinh Trang Hòa	xã	679
25027	xa_lien_dam	Xã Liên Đầm	xã	679
25030	xa_gung_re	Xã Gung Ré	xã	679
25033	xa_bao_thuan	Xã Bảo Thuận	xã	679
25036	xa_hoa_ninh	Xã Hòa Ninh	xã	679
25039	xa_hoa_trung	Xã Hòa Trung	xã	679
25042	xa_hoa_nam	Xã Hòa Nam	xã	679
25045	xa_hoa_bac	Xã Hòa Bắc	xã	679
25048	xa_son_dien	Xã Sơn Điền	xã	679
25051	xa_gia_bac	Xã Gia Bắc	xã	679
25054	thi_tran_loc_thang	Thị trấn Lộc Thắng	thị trấn	680
25057	xa_loc_bao	Xã Lộc Bảo	xã	680
25060	xa_loc_lam	Xã Lộc Lâm	xã	680
25063	xa_loc_phu	Xã Lộc Phú	xã	680
25066	xa_loc_bac	Xã Lộc Bắc	xã	680
25069	xa_b_la	Xã B' Lá	xã	680
25072	xa_loc_ngai	Xã Lộc Ngãi	xã	680
25075	xa_loc_quang	Xã Lộc Quảng	xã	680
25078	xa_loc_tan	Xã Lộc Tân	xã	680
25081	xa_loc_duc	Xã Lộc Đức	xã	680
25084	xa_loc_an	Xã Lộc An	xã	680
25087	xa_tan_lac	Xã Tân Lạc	xã	680
25090	xa_loc_thanh	Xã Lộc Thành	xã	680
25093	xa_loc_nam	Xã Lộc Nam	xã	680
25096	thi_tran_da_mri	Thị trấn Đạ M'ri	thị trấn	681
25099	thi_tran_ma_da_guoi	Thị trấn Ma Đa Guôi	thị trấn	681
25105	xa_ha_lam	Xã Hà Lâm	xã	681
25108	xa_da_ton	Xã Đạ Tồn	xã	681
25111	xa_da_oai	Xã Đạ Oai	xã	681
25114	xa_da_ploa	Xã Đạ Ploa	xã	681
25117	xa_ma_da_guoi	Xã Ma Đa Guôi	xã	681
25120	xa_doan_ket	Xã Đoàn Kết	xã	681
25123	xa_phuoc_loc	Xã Phước Lộc	xã	681
25126	thi_tran_da_teh	Thị trấn Đạ Tẻh	thị trấn	682
25129	xa_an_nhon	Xã An Nhơn	xã	682
25132	xa_quoc_oai	Xã Quốc Oai	xã	682
25135	xa_my_duc	Xã Mỹ Đức	xã	682
25138	xa_quang_tri	Xã Quảng Trị	xã	682
25141	xa_da_lay	Xã Đạ Lây	xã	682
25147	xa_trieu_hai	Xã Triệu Hải	xã	682
25153	xa_da_kho	Xã Đạ Kho	xã	682
25156	xa_da_pal	Xã Đạ Pal	xã	682
25159	thi_tran_cat_tien	Thị trấn Cát Tiên	thị trấn	683
25162	xa_tien_hoang	Xã Tiên Hoàng	xã	683
25165	xa_phuoc_cat_2	Xã Phước Cát 2	xã	683
25168	xa_gia_vien	Xã Gia Viễn	xã	683
25171	xa_nam_ninh	Xã Nam Ninh	xã	683
25180	thi_tran_phuoc_cat	Thị trấn Phước Cát	thị trấn	683
25183	xa_duc_pho	Xã Đức Phổ	xã	683
25189	xa_quang_ngai	Xã Quảng Ngãi	xã	683
25192	xa_dong_nai_thuong	Xã Đồng Nai Thượng	xã	683
25216	phuong_thac_mo	Phường Thác Mơ	phường	688
25217	phuong_long_thuy	Phường Long Thủy	phường	688
25219	phuong_phuoc_binh	Phường Phước Bình	phường	688
25220	phuong_long_phuoc	Phường Long Phước	phường	688
25237	phuong_son_giang	Phường Sơn Giang	phường	688
25245	xa_long_giang	Xã Long Giang	xã	688
25249	xa_phuoc_tin	Xã Phước Tín	xã	688
25195	phuong_tan_phu	Phường Tân Phú	phường	689
25198	phuong_tan_dong	Phường Tân Đồng	phường	689
25201	phuong_tan_binh	Phường Tân Bình	phường	689
25204	phuong_tan_xuan	Phường Tân Xuân	phường	689
25205	phuong_tan_thien	Phường Tân Thiện	phường	689
25207	xa_tan_thanh	Xã Tân Thành	xã	689
25210	phuong_tien_thanh	Phường Tiến Thành	phường	689
25213	xa_tien_hung	Xã Tiến Hưng	xã	689
25320	phuong_hung_chien	Phường Hưng Chiến	phường	690
25324	phuong_an_loc	Phường An Lộc	phường	690
25325	phuong_phu_thinh	Phường Phú Thịnh	phường	690
25326	phuong_phu_duc	Phường Phú Đức	phường	690
25333	xa_thanh_luong	Xã Thanh Lương	xã	690
25336	xa_thanh_phu	Xã Thanh Phú	xã	690
25222	xa_bu_gia_map	Xã Bù Gia Mập	xã	691
25225	xa_dak_o	Xã Đak Ơ	xã	691
25228	xa_duc_hanh	Xã Đức Hạnh	xã	691
25229	xa_phu_van	Xã Phú Văn	xã	691
25231	xa_da_kia	Xã Đa Kia	xã	691
25232	xa_phuoc_minh	Xã Phước Minh	xã	691
25234	xa_binh_thang	Xã Bình Thắng	xã	691
25267	xa_phu_nghia	Xã Phú Nghĩa	xã	691
25270	thi_tran_loc_ninh	Thị trấn Lộc Ninh	thị trấn	692
25273	xa_loc_hoa	Xã Lộc Hòa	xã	692
25276	xa_loc_an	Xã Lộc An	xã	692
25279	xa_loc_tan	Xã Lộc Tấn	xã	692
25280	xa_loc_thanh	Xã Lộc Thạnh	xã	692
25282	xa_loc_hiep	Xã Lộc Hiệp	xã	692
25285	xa_loc_thien	Xã Lộc Thiện	xã	692
25288	xa_loc_thuan	Xã Lộc Thuận	xã	692
25291	xa_loc_quang	Xã Lộc Quang	xã	692
25292	xa_loc_phu	Xã Lộc Phú	xã	692
25294	xa_loc_thanh	Xã Lộc Thành	xã	692
25297	xa_loc_thai	Xã Lộc Thái	xã	692
25300	xa_loc_dien	Xã Lộc Điền	xã	692
25303	xa_loc_hung	Xã Lộc Hưng	xã	692
25305	xa_loc_thinh	Xã Lộc Thịnh	xã	692
25306	xa_loc_khanh	Xã Lộc Khánh	xã	692
25308	thi_tran_thanh_binh	Thị trấn Thanh Bình	thị trấn	693
25309	xa_hung_phuoc	Xã Hưng Phước	xã	693
25310	xa_phuoc_thien	Xã Phước Thiện	xã	693
25312	xa_thien_hung	Xã Thiện Hưng	xã	693
25315	xa_thanh_hoa	Xã Thanh Hòa	xã	693
25318	xa_tan_thanh	Xã Tân Thành	xã	693
25321	xa_tan_tien	Xã Tân Tiến	xã	693
25327	xa_thanh_an	Xã Thanh An	xã	694
25330	xa_an_khuong	Xã An Khương	xã	694
25339	xa_an_phu	Xã An Phú	xã	694
25342	xa_tan_loi	Xã Tân Lợi	xã	694
25345	xa_tan_hung	Xã Tân Hưng	xã	694
25348	xa_minh_duc	Xã Minh Đức	xã	694
25349	xa_minh_tam	Xã Minh Tâm	xã	694
25351	xa_phuoc_an	Xã Phước An	xã	694
25354	xa_thanh_binh	Xã Thanh Bình	xã	694
25357	thi_tran_tan_khai	Thị trấn Tân Khai	thị trấn	694
25360	xa_dong_no	Xã Đồng Nơ	xã	694
25361	xa_tan_hiep	Xã Tân Hiệp	xã	694
25438	xa_tan_quan	Xã Tân Quan	xã	694
25363	thi_tran_tan_phu	Thị trấn Tân Phú	thị trấn	695
25366	xa_thuan_loi	Xã Thuận Lợi	xã	695
25369	xa_dong_tam	Xã Đồng Tâm	xã	695
25372	xa_tan_phuoc	Xã Tân Phước	xã	695
25375	xa_tan_hung	Xã Tân Hưng	xã	695
25378	xa_tan_loi	Xã Tân Lợi	xã	695
25381	xa_tan_lap	Xã Tân Lập	xã	695
25384	xa_tan_hoa	Xã Tân Hòa	xã	695
25387	xa_thuan_phu	Xã Thuận Phú	xã	695
25390	xa_dong_tien	Xã Đồng Tiến	xã	695
25393	xa_tan_tien	Xã Tân Tiến	xã	695
25396	thi_tran_duc_phong	Thị trấn Đức Phong	thị trấn	696
25398	xa_duong_10	Xã Đường 10	xã	696
25399	xa_dak_nhau	Xã Đak Nhau	xã	696
25400	xa_phu_son	Xã Phú Sơn	xã	696
25402	xa_tho_son	Xã Thọ Sơn	xã	696
25404	xa_binh_minh	Xã Bình Minh	xã	696
25405	xa_bom_bo	Xã Bom Bo	xã	696
25408	xa_minh_hung	Xã Minh Hưng	xã	696
25411	xa_doan_ket	Xã Đoàn Kết	xã	696
25414	xa_dong_nai	Xã Đồng Nai	xã	696
25417	xa_duc_lieu	Xã Đức Liễu	xã	696
25420	xa_thong_nhat	Xã Thống Nhất	xã	696
25423	xa_nghia_trung	Xã Nghĩa Trung	xã	696
25424	xa_nghia_binh	Xã Nghĩa Bình	xã	696
25426	xa_dang_ha	Xã Đăng Hà	xã	696
25429	xa_phuoc_son	Xã Phước Sơn	xã	696
25432	thi_tran_chon_thanh	Thị trấn Chơn Thành	thị trấn	697
25433	xa_thanh_tam	Xã Thành Tâm	xã	697
25435	xa_minh_lap	Xã Minh Lập	xã	697
25439	xa_quang_minh	Xã Quang Minh	xã	697
25441	xa_minh_hung	Xã Minh Hưng	xã	697
25444	xa_minh_long	Xã Minh Long	xã	697
25447	xa_minh_thanh	Xã Minh Thành	xã	697
25450	xa_nha_bich	Xã Nha Bích	xã	697
25453	xa_minh_thang	Xã Minh Thắng	xã	697
25240	xa_long_binh	Xã Long Bình	xã	698
25243	xa_binh_tan	Xã Bình Tân	xã	698
25244	xa_binh_son	Xã Bình Sơn	xã	698
25246	xa_long_hung	Xã Long Hưng	xã	698
25250	xa_phuoc_tan	Xã Phước Tân	xã	698
25252	xa_bu_nho	Xã Bù Nho	xã	698
25255	xa_long_ha	Xã Long Hà	xã	698
25258	xa_long_tan	Xã Long Tân	xã	698
25261	xa_phu_trung	Xã Phú Trung	xã	698
25264	xa_phu_rieng	Xã Phú Riềng	xã	698
25456	phuong_1	Phường 1	phường	703
25459	phuong_3	Phường 3	phường	703
25462	phuong_4	Phường 4	phường	703
25465	phuong_hiep_ninh	Phường Hiệp Ninh	phường	703
25468	phuong_2	Phường 2	phường	703
25471	xa_thanh_tan	Xã Thạnh Tân	xã	703
25474	xa_tan_binh	Xã Tân Bình	xã	703
25477	xa_binh_minh	Xã Bình Minh	xã	703
25480	phuong_ninh_son	Phường Ninh Sơn	phường	703
25483	phuong_ninh_thanh	Phường Ninh Thạnh	phường	703
25486	thi_tran_tan_bien	Thị trấn Tân Biên	thị trấn	705
25489	xa_tan_lap	Xã Tân Lập	xã	705
25492	xa_thanh_bac	Xã Thạnh Bắc	xã	705
25495	xa_tan_binh	Xã Tân Bình	xã	705
25498	xa_thanh_binh	Xã Thạnh Bình	xã	705
25501	xa_thanh_tay	Xã Thạnh Tây	xã	705
25504	xa_hoa_hiep	Xã Hòa Hiệp	xã	705
25507	xa_tan_phong	Xã Tân Phong	xã	705
25510	xa_mo_cong	Xã Mỏ Công	xã	705
25513	xa_tra_vong	Xã Trà Vong	xã	705
25516	thi_tran_tan_chau	Thị trấn Tân Châu	thị trấn	706
25519	xa_tan_ha	Xã Tân Hà	xã	706
25522	xa_tan_dong	Xã Tân Đông	xã	706
25525	xa_tan_hoi	Xã Tân Hội	xã	706
25528	xa_tan_hoa	Xã Tân Hòa	xã	706
25531	xa_suoi_ngo	Xã Suối Ngô	xã	706
25534	xa_suoi_day	Xã Suối Dây	xã	706
25537	xa_tan_hiep	Xã Tân Hiệp	xã	706
25540	xa_thanh_dong	Xã Thạnh Đông	xã	706
25543	xa_tan_thanh	Xã Tân Thành	xã	706
25546	xa_tan_phu	Xã Tân Phú	xã	706
25549	xa_tan_hung	Xã Tân Hưng	xã	706
25552	thi_tran_duong_minh_chau	Thị trấn Dương Minh Châu	thị trấn	707
25555	xa_suoi_da	Xã Suối Đá	xã	707
25558	xa_phan	Xã Phan	xã	707
25561	xa_phuoc_ninh	Xã Phước Ninh	xã	707
25564	xa_phuoc_minh	Xã Phước Minh	xã	707
25567	xa_bau_nang	Xã Bàu Năng	xã	707
25570	xa_cha_la	Xã Chà Là	xã	707
25573	xa_cau_khoi	Xã Cầu Khởi	xã	707
25576	xa_ben_cui	Xã Bến Củi	xã	707
25579	xa_loc_ninh	Xã Lộc Ninh	xã	707
25582	xa_truong_mit	Xã Truông Mít	xã	707
25585	thi_tran_chau_thanh	Thị trấn Châu Thành	thị trấn	708
25588	xa_hao_duoc	Xã Hảo Đước	xã	708
25591	xa_phuoc_vinh	Xã Phước Vinh	xã	708
25594	xa_dong_khoi	Xã Đồng Khởi	xã	708
25597	xa_thai_binh	Xã Thái Bình	xã	708
25600	xa_an_co	Xã An Cơ	xã	708
25603	xa_bien_gioi	Xã Biên Giới	xã	708
25606	xa_hoa_thanh	Xã Hòa Thạnh	xã	708
25609	xa_tri_binh	Xã Trí Bình	xã	708
25612	xa_hoa_hoi	Xã Hòa Hội	xã	708
25615	xa_an_binh	Xã An Bình	xã	708
25618	xa_thanh_dien	Xã Thanh Điền	xã	708
25621	xa_thanh_long	Xã Thành Long	xã	708
25624	xa_ninh_dien	Xã Ninh Điền	xã	708
25627	xa_long_vinh	Xã Long Vĩnh	xã	708
25630	phuong_long_hoa	Phường Long Hoa	phường	709
25633	phuong_hiep_tan	Phường Hiệp Tân	phường	709
25636	phuong_long_thanh_bac	Phường Long Thành Bắc	phường	709
25639	xa_truong_hoa	Xã Trường Hòa	xã	709
25642	xa_truong_dong	Xã Trường Đông	xã	709
25645	phuong_long_thanh_trung	Phường Long Thành Trung	phường	709
25648	xa_truong_tay	Xã Trường Tây	xã	709
25651	xa_long_thanh_nam	Xã Long Thành Nam	xã	709
25654	thi_tran_go_dau	Thị trấn Gò Dầu	thị trấn	710
25657	xa_thanh_duc	Xã Thạnh Đức	xã	710
25660	xa_cam_giang	Xã Cẩm Giang	xã	710
25663	xa_hiep_thanh	Xã Hiệp Thạnh	xã	710
25666	xa_bau_don	Xã Bàu Đồn	xã	710
25669	xa_phuoc_thanh	Xã Phước Thạnh	xã	710
25672	xa_phuoc_dong	Xã Phước Đông	xã	710
25675	xa_phuoc_trach	Xã Phước Trạch	xã	710
25678	xa_thanh_phuoc	Xã Thanh Phước	xã	710
25681	thi_tran_ben_cau	Thị trấn Bến Cầu	thị trấn	711
25684	xa_long_chu	Xã Long Chữ	xã	711
25687	xa_long_phuoc	Xã Long Phước	xã	711
25690	xa_long_giang	Xã Long Giang	xã	711
25693	xa_tien_thuan	Xã Tiên Thuận	xã	711
25696	xa_long_khanh	Xã Long Khánh	xã	711
25699	xa_loi_thuan	Xã Lợi Thuận	xã	711
25702	xa_long_thuan	Xã Long Thuận	xã	711
25705	xa_an_thanh	Xã An Thạnh	xã	711
25708	phuong_trang_bang	Phường Trảng Bàng	phường	712
25711	xa_don_thuan	Xã Đôn Thuận	xã	712
25714	xa_hung_thuan	Xã Hưng Thuận	xã	712
25717	phuong_loc_hung	Phường Lộc Hưng	phường	712
25720	phuong_gia_loc	Phường Gia Lộc	phường	712
25723	phuong_gia_binh	Phường Gia Bình	phường	712
25729	xa_phuoc_binh	Xã Phước Bình	xã	712
25732	phuong_an_tinh	Phường An Tịnh	phường	712
25735	phuong_an_hoa	Phường An Hòa	phường	712
25738	xa_phuoc_chi	Xã Phước Chỉ	xã	712
25741	phuong_hiep_thanh	Phường Hiệp Thành	phường	718
25744	phuong_phu_loi	Phường Phú Lợi	phường	718
25747	phuong_phu_cuong	Phường Phú Cường	phường	718
25750	phuong_phu_hoa	Phường Phú Hòa	phường	718
25753	phuong_phu_tho	Phường Phú Thọ	phường	718
25756	phuong_chanh_nghia	Phường Chánh Nghĩa	phường	718
25759	phuong_dinh_hoa	Phường Định Hoà	phường	718
25760	phuong_hoa_phu	Phường Hoà Phú	phường	718
25762	phuong_phu_my	Phường Phú Mỹ	phường	718
25763	phuong_phu_tan	Phường Phú Tân	phường	718
25765	phuong_tan_an	Phường Tân An	phường	718
25768	phuong_hiep_an	Phường Hiệp An	phường	718
25771	phuong_tuong_binh_hiep	Phường Tương Bình Hiệp	phường	718
25774	phuong_chanh_my	Phường Chánh Mỹ	phường	718
25816	xa_tru_van_tho	Xã Trừ Văn Thố	xã	719
25819	xa_cay_truong_ii	Xã Cây Trường II	xã	719
25822	thi_tran_lai_uyen	Thị trấn Lai Uyên	thị trấn	719
25825	xa_tan_hung	Xã Tân Hưng	xã	719
25828	xa_long_nguyen	Xã Long Nguyên	xã	719
25831	xa_hung_hoa	Xã Hưng Hòa	xã	719
25834	xa_lai_hung	Xã Lai Hưng	xã	719
25777	thi_tran_dau_tieng	Thị trấn Dầu Tiếng	thị trấn	720
25780	xa_minh_hoa	Xã Minh Hoà	xã	720
25783	xa_minh_thanh	Xã Minh Thạnh	xã	720
25786	xa_minh_tan	Xã Minh Tân	xã	720
25789	xa_dinh_an	Xã Định An	xã	720
25792	xa_long_hoa	Xã Long Hoà	xã	720
25795	xa_dinh_thanh	Xã Định Thành	xã	720
25798	xa_dinh_hiep	Xã Định Hiệp	xã	720
25801	xa_an_lap	Xã An Lập	xã	720
25804	xa_long_tan	Xã Long Tân	xã	720
25807	xa_thanh_an	Xã Thanh An	xã	720
25810	xa_thanh_tuyen	Xã Thanh Tuyền	xã	720
25813	phuong_my_phuoc	Phường Mỹ Phước	phường	721
25837	phuong_chanh_phu_hoa	Phường Chánh Phú Hòa	phường	721
25840	xa_an_dien	Xã An Điền	xã	721
25843	xa_an_tay	Xã An Tây	xã	721
25846	phuong_thoi_hoa	Phường Thới Hòa	phường	721
25849	phuong_hoa_loi	Phường Hòa Lợi	phường	721
25852	phuong_tan_dinh	Phường Tân Định	phường	721
25855	xa_phu_an	Xã Phú An	xã	721
25858	thi_tran_phuoc_vinh	Thị trấn Phước Vĩnh	thị trấn	722
25861	xa_an_linh	Xã An Linh	xã	722
25864	xa_phuoc_sang	Xã Phước Sang	xã	722
25865	xa_an_thai	Xã An Thái	xã	722
25867	xa_an_long	Xã An Long	xã	722
25870	xa_an_binh	Xã An Bình	xã	722
25873	xa_tan_hiep	Xã Tân Hiệp	xã	722
25876	xa_tam_lap	Xã Tam Lập	xã	722
25879	xa_tan_long	Xã Tân Long	xã	722
25882	xa_vinh_hoa	Xã Vĩnh Hoà	xã	722
25885	xa_phuoc_hoa	Xã Phước Hoà	xã	722
25888	phuong_uyen_hung	Phường Uyên Hưng	phường	723
25891	phuong_tan_phuoc_khanh	Phường Tân Phước Khánh	phường	723
25912	phuong_vinh_tan	Phường Vĩnh Tân	phường	723
25915	phuong_hoi_nghia	Phường Hội Nghĩa	phường	723
25920	phuong_tan_hiep	Phường Tân Hiệp	phường	723
25921	phuong_khanh_binh	Phường Khánh Bình	phường	723
25924	phuong_phu_chanh	Phường Phú Chánh	phường	723
25930	xa_bach_dang	Xã Bạch Đằng	xã	723
25933	phuong_tan_vinh_hiep	Phường Tân Vĩnh Hiệp	phường	723
25936	phuong_thanh_phuoc	Phường Thạnh Phước	phường	723
25937	xa_thanh_hoi	Xã Thạnh Hội	xã	723
25939	phuong_thai_hoa	Phường Thái Hòa	phường	723
25942	phuong_di_an	Phường Dĩ An	phường	724
25945	phuong_tan_binh	Phường Tân Bình	phường	724
25948	phuong_tan_dong_hiep	Phường Tân Đông Hiệp	phường	724
25951	phuong_binh_an	Phường Bình An	phường	724
25954	phuong_binh_thang	Phường Bình Thắng	phường	724
25957	phuong_dong_hoa	Phường Đông Hòa	phường	724
25960	phuong_an_binh	Phường An Bình	phường	724
25963	phuong_an_thanh	Phường An Thạnh	phường	725
25966	phuong_lai_thieu	Phường Lái Thiêu	phường	725
25969	phuong_binh_chuan	Phường Bình Chuẩn	phường	725
25972	phuong_thuan_giao	Phường Thuận Giao	phường	725
25975	phuong_an_phu	Phường An Phú	phường	725
25978	phuong_hung_dinh	Phường Hưng Định	phường	725
25981	xa_an_son	Xã An Sơn	xã	725
25984	phuong_binh_nham	Phường Bình Nhâm	phường	725
25987	phuong_binh_hoa	Phường Bình Hòa	phường	725
25990	phuong_vinh_phu	Phường Vĩnh Phú	phường	725
25894	xa_tan_dinh	Xã Tân Định	xã	726
25897	xa_binh_my	Xã Bình Mỹ	xã	726
25900	thi_tran_tan_binh	Thị trấn Tân Bình	thị trấn	726
25903	xa_tan_lap	Xã Tân Lập	xã	726
25906	thi_tran_tan_thanh	Thị trấn Tân Thành	thị trấn	726
25907	xa_dat_cuoc	Xã Đất Cuốc	xã	726
25908	xa_hieu_liem	Xã Hiếu Liêm	xã	726
25909	xa_lac_an	Xã Lạc An	xã	726
25918	xa_tan_my	Xã Tân Mỹ	xã	726
25927	xa_thuong_tan	Xã Thường Tân	xã	726
25993	phuong_trang_dai	Phường Trảng Dài	phường	731
25996	phuong_tan_phong	Phường Tân Phong	phường	731
25999	phuong_tan_bien	Phường Tân Biên	phường	731
26002	phuong_ho_nai	Phường Hố Nai	phường	731
26005	phuong_tan_hoa	Phường Tân Hòa	phường	731
26008	phuong_tan_hiep	Phường Tân Hiệp	phường	731
26011	phuong_buu_long	Phường Bửu Long	phường	731
26014	phuong_tan_tien	Phường Tân Tiến	phường	731
26017	phuong_tam_hiep	Phường Tam Hiệp	phường	731
26020	phuong_long_binh	Phường Long Bình	phường	731
26023	phuong_quang_vinh	Phường Quang Vinh	phường	731
26026	phuong_tan_mai	Phường Tân Mai	phường	731
26029	phuong_thong_nhat	Phường Thống Nhất	phường	731
26032	phuong_trung_dung	Phường Trung Dũng	phường	731
26035	phuong_tam_hoa	Phường Tam Hòa	phường	731
26038	phuong_hoa_binh	Phường Hòa Bình	phường	731
26041	phuong_quyet_thang	Phường Quyết Thắng	phường	731
26044	phuong_thanh_binh	Phường Thanh Bình	phường	731
26047	phuong_binh_da	Phường Bình Đa	phường	731
26050	phuong_an_binh	Phường An Bình	phường	731
26053	phuong_buu_hoa	Phường Bửu Hòa	phường	731
26056	phuong_long_binh_tan	Phường Long Bình Tân	phường	731
26059	phuong_tan_van	Phường Tân Vạn	phường	731
26062	phuong_tan_hanh	Phường Tân Hạnh	phường	731
26065	phuong_hiep_hoa	Phường Hiệp Hòa	phường	731
26068	phuong_hoa_an	Phường Hóa An	phường	731
26371	phuong_an_hoa	Phường An Hòa	phường	731
26374	phuong_tam_phuoc	Phường Tam Phước	phường	731
26377	phuong_phuoc_tan	Phường Phước Tân	phường	731
26380	xa_long_hung	Xã Long Hưng	xã	731
26071	phuong_xuan_trung	Phường Xuân Trung	phường	732
26074	phuong_xuan_thanh	Phường Xuân Thanh	phường	732
26077	phuong_xuan_binh	Phường Xuân Bình	phường	732
26080	phuong_xuan_an	Phường Xuân An	phường	732
26083	phuong_xuan_hoa	Phường Xuân Hoà	phường	732
26086	phuong_phu_binh	Phường Phú Bình	phường	732
26089	xa_binh_loc	Xã Bình Lộc	xã	732
26092	xa_bao_quang	Xã Bảo Quang	xã	732
26095	phuong_suoi_tre	Phường Suối Tre	phường	732
26098	phuong_bao_vinh	Phường Bảo Vinh	phường	732
26101	phuong_xuan_lap	Phường Xuân Lập	phường	732
26104	phuong_bau_sen	Phường Bàu Sen	phường	732
26107	xa_bau_tram	Xã Bàu Trâm	xã	732
26110	phuong_xuan_tan	Phường Xuân Tân	phường	732
26113	xa_hang_gon	Xã Hàng Gòn	xã	732
26116	thi_tran_tan_phu	Thị trấn Tân Phú	thị trấn	734
26119	xa_dak_lua	Xã Dak Lua	xã	734
26122	xa_nam_cat_tien	Xã Nam Cát Tiên	xã	734
26125	xa_phu_an	Xã Phú An	xã	734
26128	xa_nui_tuong	Xã Núi Tượng	xã	734
26131	xa_ta_lai	Xã Tà Lài	xã	734
26134	xa_phu_lap	Xã Phú Lập	xã	734
26137	xa_phu_son	Xã Phú Sơn	xã	734
26140	xa_phu_thinh	Xã Phú Thịnh	xã	734
26143	xa_thanh_son	Xã Thanh Sơn	xã	734
26146	xa_phu_trung	Xã Phú Trung	xã	734
26149	xa_phu_xuan	Xã Phú Xuân	xã	734
26152	xa_phu_loc	Xã Phú Lộc	xã	734
26155	xa_phu_lam	Xã Phú Lâm	xã	734
26158	xa_phu_binh	Xã Phú Bình	xã	734
26161	xa_phu_thanh	Xã Phú Thanh	xã	734
26164	xa_tra_co	Xã Trà Cổ	xã	734
26167	xa_phu_dien	Xã Phú Điền	xã	734
26170	thi_tran_vinh_an	Thị trấn Vĩnh An	thị trấn	735
26173	xa_phu_ly	Xã Phú Lý	xã	735
26176	xa_tri_an	Xã Trị An	xã	735
26179	xa_tan_an	Xã Tân An	xã	735
26182	xa_vinh_tan	Xã Vĩnh Tân	xã	735
26185	xa_binh_loi	Xã Bình Lợi	xã	735
26188	xa_thanh_phu	Xã Thạnh Phú	xã	735
26191	xa_thien_tan	Xã Thiện Tân	xã	735
26194	xa_tan_binh	Xã Tân Bình	xã	735
26197	xa_binh_hoa	Xã Bình Hòa	xã	735
26200	xa_ma_da	Xã Mã Đà	xã	735
26203	xa_hieu_liem	Xã Hiếu Liêm	xã	735
26206	thi_tran_dinh_quan	Thị trấn Định Quán	thị trấn	736
26209	xa_thanh_son	Xã Thanh Sơn	xã	736
26212	xa_phu_tan	Xã Phú Tân	xã	736
26215	xa_phu_vinh	Xã Phú Vinh	xã	736
26218	xa_phu_loi	Xã Phú Lợi	xã	736
26221	xa_phu_hoa	Xã Phú Hòa	xã	736
26224	xa_ngoc_dinh	Xã Ngọc Định	xã	736
26227	xa_la_nga	Xã La Ngà	xã	736
26230	xa_gia_canh	Xã Gia Canh	xã	736
26233	xa_phu_ngoc	Xã Phú Ngọc	xã	736
26236	xa_phu_cuong	Xã Phú Cường	xã	736
26239	xa_tuc_trung	Xã Túc Trưng	xã	736
26242	xa_phu_tuc	Xã Phú Túc	xã	736
26245	xa_suoi_nho	Xã Suối Nho	xã	736
26248	thi_tran_trang_bom	Thị trấn Trảng Bom	thị trấn	737
26251	xa_thanh_binh	Xã Thanh Bình	xã	737
26254	xa_cay_gao	Xã Cây Gáo	xã	737
26257	xa_bau_ham	Xã Bàu Hàm	xã	737
26260	xa_song_thao	Xã Sông Thao	xã	737
26263	xa_song_trau	Xã Sông Trầu	xã	737
26266	xa_dong_hoa	Xã Đông Hoà	xã	737
26269	xa_bac_son	Xã Bắc Sơn	xã	737
26272	xa_ho_nai_3	Xã Hố Nai 3	xã	737
26275	xa_tay_hoa	Xã Tây Hoà	xã	737
26278	xa_binh_minh	Xã Bình Minh	xã	737
26281	xa_trung_hoa	Xã Trung Hoà	xã	737
26284	xa_doi_61	Xã Đồi 61	xã	737
26287	xa_hung_thinh	Xã Hưng Thịnh	xã	737
26290	xa_quang_tien	Xã Quảng Tiến	xã	737
26293	xa_giang_dien	Xã Giang Điền	xã	737
26296	xa_an_vien	Xã An Viễn	xã	737
26299	xa_gia_tan_1	Xã Gia Tân 1	xã	738
26302	xa_gia_tan_2	Xã Gia Tân 2	xã	738
26305	xa_gia_tan_3	Xã Gia Tân 3	xã	738
26308	xa_gia_kiem	Xã Gia Kiệm	xã	738
26311	xa_quang_trung	Xã Quang Trung	xã	738
26314	xa_bau_ham_2	Xã Bàu Hàm 2	xã	738
26317	xa_hung_loc	Xã Hưng Lộc	xã	738
26320	xa_lo_25	Xã Lộ 25	xã	738
26323	xa_xuan_thien	Xã Xuân Thiện	xã	738
26326	thi_tran_dau_giay	Thị trấn Dầu Giây	thị trấn	738
26329	xa_song_nhan	Xã Sông Nhạn	xã	739
26332	xa_xuan_que	Xã Xuân Quế	xã	739
26335	xa_nhan_nghia	Xã Nhân Nghĩa	xã	739
26338	xa_xuan_duong	Xã Xuân Đường	xã	739
26341	xa_long_giao	Xã Long Giao	xã	739
26344	xa_xuan_my	Xã Xuân Mỹ	xã	739
26347	xa_thua_duc	Xã Thừa Đức	xã	739
26350	xa_bao_binh	Xã Bảo Bình	xã	739
26353	xa_xuan_bao	Xã Xuân Bảo	xã	739
26356	xa_xuan_tay	Xã Xuân Tây	xã	739
26359	xa_xuan_dong	Xã Xuân Đông	xã	739
26362	xa_song_ray	Xã Sông Ray	xã	739
26365	xa_lam_san	Xã Lâm San	xã	739
26368	thi_tran_long_thanh	Thị trấn Long Thành	thị trấn	740
26383	xa_an_phuoc	Xã An Phước	xã	740
26386	xa_binh_an	Xã Bình An	xã	740
26389	xa_long_duc	Xã Long Đức	xã	740
26392	xa_loc_an	Xã Lộc An	xã	740
26395	xa_binh_son	Xã Bình Sơn	xã	740
26398	xa_tam_an	Xã Tam An	xã	740
26401	xa_cam_duong	Xã Cẩm Đường	xã	740
26404	xa_long_an	Xã Long An	xã	740
26410	xa_bau_can	Xã Bàu Cạn	xã	740
26413	xa_long_phuoc	Xã Long Phước	xã	740
26416	xa_phuoc_binh	Xã Phước Bình	xã	740
26419	xa_tan_hiep	Xã Tân Hiệp	xã	740
26422	xa_phuoc_thai	Xã Phước Thái	xã	740
26425	thi_tran_gia_ray	Thị trấn Gia Ray	thị trấn	741
26428	xa_xuan_bac	Xã Xuân Bắc	xã	741
26431	xa_suoi_cao	Xã Suối Cao	xã	741
26434	xa_xuan_thanh	Xã Xuân Thành	xã	741
26437	xa_xuan_tho	Xã Xuân Thọ	xã	741
26440	xa_xuan_truong	Xã Xuân Trường	xã	741
26443	xa_xuan_hoa	Xã Xuân Hòa	xã	741
26446	xa_xuan_hung	Xã Xuân Hưng	xã	741
26449	xa_xuan_tam	Xã Xuân Tâm	xã	741
26452	xa_suoi_cat	Xã Suối Cát	xã	741
26455	xa_xuan_hiep	Xã Xuân Hiệp	xã	741
26458	xa_xuan_phu	Xã Xuân Phú	xã	741
26461	xa_xuan_dinh	Xã Xuân Định	xã	741
26464	xa_bao_hoa	Xã Bảo Hoà	xã	741
26467	xa_lang_minh	Xã Lang Minh	xã	741
26470	xa_phuoc_thien	Xã Phước Thiền	xã	742
26473	xa_long_tan	Xã Long Tân	xã	742
26476	xa_dai_phuoc	Xã Đại Phước	xã	742
26479	thi_tran_hiep_phuoc	Thị trấn Hiệp Phước	thị trấn	742
26482	xa_phu_huu	Xã Phú Hữu	xã	742
26485	xa_phu_hoi	Xã Phú Hội	xã	742
26488	xa_phu_thanh	Xã Phú Thạnh	xã	742
26491	xa_phu_dong	Xã Phú Đông	xã	742
26494	xa_long_tho	Xã Long Thọ	xã	742
26497	xa_vinh_thanh	Xã Vĩnh Thanh	xã	742
26500	xa_phuoc_khanh	Xã Phước Khánh	xã	742
26503	xa_phuoc_an	Xã Phước An	xã	742
26506	phuong_1	Phường 1	phường	747
26508	phuong_thang_tam	Phường Thắng Tam	phường	747
26509	phuong_2	Phường 2	phường	747
26512	phuong_3	Phường 3	phường	747
26515	phuong_4	Phường 4	phường	747
26518	phuong_5	Phường 5	phường	747
26521	phuong_thang_nhi	Phường Thắng Nhì	phường	747
26524	phuong_7	Phường 7	phường	747
26526	phuong_nguyen_an_ninh	Phường Nguyễn An Ninh	phường	747
26527	phuong_8	Phường 8	phường	747
26530	phuong_9	Phường 9	phường	747
26533	phuong_thang_nhat	Phường Thắng Nhất	phường	747
26535	phuong_rach_dua	Phường Rạch Dừa	phường	747
26536	phuong_10	Phường 10	phường	747
26539	phuong_11	Phường 11	phường	747
26542	phuong_12	Phường 12	phường	747
26545	xa_long_son	Xã Long Sơn	xã	747
26548	phuong_phuoc_hung	Phường Phước Hưng	phường	748
26551	phuong_phuoc_hiep	Phường Phước Hiệp	phường	748
26554	phuong_phuoc_nguyen	Phường Phước Nguyên	phường	748
26557	phuong_long_toan	Phường Long Toàn	phường	748
26558	phuong_long_tam	Phường Long Tâm	phường	748
26560	phuong_phuoc_trung	Phường Phước Trung	phường	748
26563	phuong_long_huong	Phường Long Hương	phường	748
26566	phuong_kim_dinh	Phường Kim Dinh	phường	748
26567	xa_tan_hung	Xã Tân Hưng	xã	748
26569	xa_long_phuoc	Xã Long Phước	xã	748
26572	xa_hoa_long	Xã Hoà Long	xã	748
26574	xa_bau_chinh	Xã Bàu Chinh	xã	750
26575	thi_tran_ngai_giao	Thị trấn Ngãi Giao	thị trấn	750
26578	xa_binh_ba	Xã Bình Ba	xã	750
26581	xa_suoi_nghe	Xã Suối Nghệ	xã	750
26584	xa_xuan_son	Xã Xuân Sơn	xã	750
26587	xa_son_binh	Xã Sơn Bình	xã	750
26590	xa_binh_gia	Xã Bình Giã	xã	750
26593	xa_binh_trung	Xã Bình Trung	xã	750
26596	xa_xa_bang	Xã Xà Bang	xã	750
26599	xa_cu_bi	Xã Cù Bị	xã	750
26602	xa_lang_lon	Xã Láng Lớn	xã	750
26605	xa_quang_thanh	Xã Quảng Thành	xã	750
26608	xa_kim_long	Xã Kim Long	xã	750
26611	xa_suoi_rao	Xã Suối Rao	xã	750
26614	xa_da_bac	Xã Đá Bạc	xã	750
26617	xa_nghia_thanh	Xã Nghĩa Thành	xã	750
26620	thi_tran_phuoc_buu	Thị trấn Phước Bửu	thị trấn	751
26623	xa_phuoc_thuan	Xã Phước Thuận	xã	751
26626	xa_phuoc_tan	Xã Phước Tân	xã	751
26629	xa_xuyen_moc	Xã Xuyên Mộc	xã	751
26632	xa_bong_trang	Xã Bông Trang	xã	751
26635	xa_tan_lam	Xã Tân Lâm	xã	751
26638	xa_bau_lam	Xã Bàu Lâm	xã	751
26641	xa_hoa_binh	Xã Hòa Bình	xã	751
26644	xa_hoa_hung	Xã Hòa Hưng	xã	751
26647	xa_hoa_hiep	Xã Hòa Hiệp	xã	751
26650	xa_hoa_hoi	Xã Hòa Hội	xã	751
26653	xa_bung_rieng	Xã Bưng Riềng	xã	751
26656	xa_binh_chau	Xã Bình Châu	xã	751
26659	thi_tran_long_dien	Thị trấn Long Điền	thị trấn	752
26662	thi_tran_long_hai	Thị trấn Long Hải	thị trấn	752
26665	xa_an_ngai	Xã An Ngãi	xã	752
26668	xa_tam_phuoc	Xã Tam Phước	xã	752
26671	xa_an_nhut	Xã An Nhứt	xã	752
26674	xa_phuoc_tinh	Xã Phước Tỉnh	xã	752
26677	xa_phuoc_hung	Xã Phước Hưng	xã	752
26680	thi_tran_dat_do	Thị trấn Đất Đỏ	thị trấn	753
26683	xa_phuoc_long_tho	Xã Phước Long Thọ	xã	753
26686	xa_phuoc_hoi	Xã Phước Hội	xã	753
26689	xa_long_my	Xã Long Mỹ	xã	753
26692	thi_tran_phuoc_hai	Thị trấn Phước Hải	thị trấn	753
26695	xa_long_tan	Xã Long Tân	xã	753
26698	xa_lang_dai	Xã Láng Dài	xã	753
26701	xa_loc_an	Xã Lộc An	xã	753
26704	phuong_phu_my	Phường Phú Mỹ	phường	754
26707	xa_tan_hoa	Xã Tân Hoà	xã	754
26710	xa_tan_hai	Xã Tân Hải	xã	754
26713	phuong_phuoc_hoa	Phường Phước Hoà	phường	754
26716	phuong_tan_phuoc	Phường Tân Phước	phường	754
26719	phuong_my_xuan	Phường Mỹ Xuân	phường	754
26722	xa_song_xoai	Xã Sông Xoài	xã	754
26725	phuong_hac_dich	Phường Hắc Dịch	phường	754
26728	xa_chau_pha	Xã Châu Pha	xã	754
26731	xa_toc_tien	Xã Tóc Tiên	xã	754
26734	phuong_tan_dinh	Phường Tân Định	phường	760
26737	phuong_da_kao	Phường Đa Kao	phường	760
26740	phuong_ben_nghe	Phường Bến Nghé	phường	760
26743	phuong_ben_thanh	Phường Bến Thành	phường	760
26746	phuong_nguyen_thai_binh	Phường Nguyễn Thái Bình	phường	760
26749	phuong_pham_ngu_lao	Phường Phạm Ngũ Lão	phường	760
26800	phuong_linh_trung	Phường Linh Trung	phường	769
26752	phuong_cau_ong_lanh	Phường Cầu Ông Lãnh	phường	760
26755	phuong_co_giang	Phường Cô Giang	phường	760
26758	phuong_nguyen_cu_trinh	Phường Nguyễn Cư Trinh	phường	760
26761	phuong_cau_kho	Phường Cầu Kho	phường	760
26764	phuong_thanh_xuan	Phường Thạnh Xuân	phường	761
26767	phuong_thanh_loc	Phường Thạnh Lộc	phường	761
26770	phuong_hiep_thanh	Phường Hiệp Thành	phường	761
26773	phuong_thoi_an	Phường Thới An	phường	761
26776	phuong_tan_chanh_hiep	Phường Tân Chánh Hiệp	phường	761
26779	phuong_an_phu_dong	Phường An Phú Đông	phường	761
26782	phuong_tan_thoi_hiep	Phường Tân Thới Hiệp	phường	761
26785	phuong_trung_my_tay	Phường Trung Mỹ Tây	phường	761
26787	phuong_tan_hung_thuan	Phường Tân Hưng Thuận	phường	761
26788	phuong_dong_hung_thuan	Phường Đông Hưng Thuận	phường	761
26791	phuong_tan_thoi_nhat	Phường Tân Thới Nhất	phường	761
26869	phuong_15	Phường 15	phường	764
26872	phuong_13	Phường 13	phường	764
26875	phuong_17	Phường 17	phường	764
26876	phuong_6	Phường 6	phường	764
26878	phuong_16	Phường 16	phường	764
26881	phuong_12	Phường 12	phường	764
26882	phuong_14	Phường 14	phường	764
26884	phuong_10	Phường 10	phường	764
26887	phuong_05	Phường 05	phường	764
26890	phuong_07	Phường 07	phường	764
26893	phuong_04	Phường 04	phường	764
26896	phuong_01	Phường 01	phường	764
26897	phuong_9	Phường 9	phường	764
26898	phuong_8	Phường 8	phường	764
26899	phuong_11	Phường 11	phường	764
26902	phuong_03	Phường 03	phường	764
26905	phuong_13	Phường 13	phường	765
26908	phuong_11	Phường 11	phường	765
26911	phuong_27	Phường 27	phường	765
26914	phuong_26	Phường 26	phường	765
26917	phuong_12	Phường 12	phường	765
26920	phuong_25	Phường 25	phường	765
26923	phuong_05	Phường 05	phường	765
26926	phuong_07	Phường 07	phường	765
26929	phuong_24	Phường 24	phường	765
26932	phuong_06	Phường 06	phường	765
26935	phuong_14	Phường 14	phường	765
26938	phuong_15	Phường 15	phường	765
26941	phuong_02	Phường 02	phường	765
26944	phuong_01	Phường 01	phường	765
26947	phuong_03	Phường 03	phường	765
26950	phuong_17	Phường 17	phường	765
26953	phuong_21	Phường 21	phường	765
26956	phuong_22	Phường 22	phường	765
26959	phuong_19	Phường 19	phường	765
26962	phuong_28	Phường 28	phường	765
26965	phuong_02	Phường 02	phường	766
26968	phuong_04	Phường 04	phường	766
26971	phuong_12	Phường 12	phường	766
26974	phuong_13	Phường 13	phường	766
26977	phuong_01	Phường 01	phường	766
26980	phuong_03	Phường 03	phường	766
26983	phuong_11	Phường 11	phường	766
26986	phuong_07	Phường 07	phường	766
26989	phuong_05	Phường 05	phường	766
26992	phuong_10	Phường 10	phường	766
26995	phuong_06	Phường 06	phường	766
26998	phuong_08	Phường 08	phường	766
27001	phuong_09	Phường 09	phường	766
27004	phuong_14	Phường 14	phường	766
27007	phuong_15	Phường 15	phường	766
27010	phuong_tan_son_nhi	Phường Tân Sơn Nhì	phường	767
27013	phuong_tay_thanh	Phường Tây Thạnh	phường	767
27016	phuong_son_ky	Phường Sơn Kỳ	phường	767
27019	phuong_tan_quy	Phường Tân Quý	phường	767
27022	phuong_tan_thanh	Phường Tân Thành	phường	767
27025	phuong_phu_tho_hoa	Phường Phú Thọ Hòa	phường	767
27028	phuong_phu_thanh	Phường Phú Thạnh	phường	767
27031	phuong_phu_trung	Phường Phú Trung	phường	767
27034	phuong_hoa_thanh	Phường Hòa Thạnh	phường	767
27037	phuong_hiep_tan	Phường Hiệp Tân	phường	767
27040	phuong_tan_thoi_hoa	Phường Tân Thới Hòa	phường	767
27043	phuong_04	Phường 04	phường	768
27046	phuong_05	Phường 05	phường	768
27049	phuong_09	Phường 09	phường	768
27052	phuong_07	Phường 07	phường	768
27055	phuong_03	Phường 03	phường	768
27058	phuong_01	Phường 01	phường	768
27061	phuong_02	Phường 02	phường	768
27064	phuong_08	Phường 08	phường	768
27067	phuong_15	Phường 15	phường	768
27070	phuong_10	Phường 10	phường	768
27073	phuong_11	Phường 11	phường	768
27076	phuong_17	Phường 17	phường	768
27085	phuong_13	Phường 13	phường	768
26794	phuong_linh_xuan	Phường Linh Xuân	phường	769
26797	phuong_binh_chieu	Phường Bình Chiểu	phường	769
26803	phuong_tam_binh	Phường Tam Bình	phường	769
26806	phuong_tam_phu	Phường Tam Phú	phường	769
26809	phuong_hiep_binh_phuoc	Phường Hiệp Bình Phước	phường	769
26812	phuong_hiep_binh_chanh	Phường Hiệp Bình Chánh	phường	769
26815	phuong_linh_chieu	Phường Linh Chiểu	phường	769
26818	phuong_linh_tay	Phường Linh Tây	phường	769
26821	phuong_linh_dong	Phường Linh Đông	phường	769
26824	phuong_binh_tho	Phường Bình Thọ	phường	769
26827	phuong_truong_tho	Phường Trường Thọ	phường	769
26830	phuong_long_binh	Phường Long Bình	phường	769
26833	phuong_long_thanh_my	Phường Long Thạnh Mỹ	phường	769
26836	phuong_tan_phu	Phường Tân Phú	phường	769
26839	phuong_hiep_phu	Phường Hiệp Phú	phường	769
26842	phuong_tang_nhon_phu_a	Phường Tăng Nhơn Phú A	phường	769
26845	phuong_tang_nhon_phu_b	Phường Tăng Nhơn Phú B	phường	769
26848	phuong_phuoc_long_b	Phường Phước Long B	phường	769
26851	phuong_phuoc_long_a	Phường Phước Long A	phường	769
26854	phuong_truong_thanh	Phường Trường Thạnh	phường	769
26857	phuong_long_phuoc	Phường Long Phước	phường	769
26860	phuong_long_truong	Phường Long Trường	phường	769
26863	phuong_phuoc_binh	Phường Phước Bình	phường	769
26866	phuong_phu_huu	Phường Phú Hữu	phường	769
27088	phuong_thao_dien	Phường Thảo Điền	phường	769
27091	phuong_an_phu	Phường An Phú	phường	769
27094	phuong_an_khanh	Phường An Khánh	phường	769
27097	phuong_binh_trung_dong	Phường Bình Trưng Đông	phường	769
27100	phuong_binh_trung_tay	Phường Bình Trưng Tây	phường	769
27109	phuong_cat_lai	Phường Cát Lái	phường	769
27112	phuong_thanh_my_loi	Phường Thạnh Mỹ Lợi	phường	769
27115	phuong_an_loi_dong	Phường An Lợi Đông	phường	769
27118	phuong_thu_thiem	Phường Thủ Thiêm	phường	769
27127	phuong_14	Phường 14	phường	770
27130	phuong_12	Phường 12	phường	770
27133	phuong_11	Phường 11	phường	770
27136	phuong_13	Phường 13	phường	770
27139	phuong_vo_thi_sau	Phường Võ Thị Sáu	phường	770
27142	phuong_09	Phường 09	phường	770
27145	phuong_10	Phường 10	phường	770
27148	phuong_04	Phường 04	phường	770
27151	phuong_05	Phường 05	phường	770
27154	phuong_03	Phường 03	phường	770
27157	phuong_02	Phường 02	phường	770
27160	phuong_01	Phường 01	phường	770
27163	phuong_15	Phường 15	phường	771
27166	phuong_13	Phường 13	phường	771
27169	phuong_14	Phường 14	phường	771
27172	phuong_12	Phường 12	phường	771
27175	phuong_11	Phường 11	phường	771
27178	phuong_10	Phường 10	phường	771
27181	phuong_09	Phường 09	phường	771
27184	phuong_01	Phường 01	phường	771
27187	phuong_08	Phường 08	phường	771
27190	phuong_02	Phường 02	phường	771
27193	phuong_04	Phường 04	phường	771
27196	phuong_07	Phường 07	phường	771
27199	phuong_05	Phường 05	phường	771
27202	phuong_06	Phường 06	phường	771
27208	phuong_15	Phường 15	phường	772
27211	phuong_05	Phường 05	phường	772
27214	phuong_14	Phường 14	phường	772
27217	phuong_11	Phường 11	phường	772
27220	phuong_03	Phường 03	phường	772
27223	phuong_10	Phường 10	phường	772
27226	phuong_13	Phường 13	phường	772
27229	phuong_08	Phường 08	phường	772
27232	phuong_09	Phường 09	phường	772
27235	phuong_12	Phường 12	phường	772
27238	phuong_07	Phường 07	phường	772
27241	phuong_06	Phường 06	phường	772
27244	phuong_04	Phường 04	phường	772
27247	phuong_01	Phường 01	phường	772
27250	phuong_02	Phường 02	phường	772
27253	phuong_16	Phường 16	phường	772
27259	phuong_13	Phường 13	phường	773
27262	phuong_09	Phường 09	phường	773
27265	phuong_06	Phường 06	phường	773
27268	phuong_08	Phường 08	phường	773
27271	phuong_10	Phường 10	phường	773
27277	phuong_18	Phường 18	phường	773
27280	phuong_14	Phường 14	phường	773
27283	phuong_04	Phường 04	phường	773
27286	phuong_03	Phường 03	phường	773
27289	phuong_16	Phường 16	phường	773
27292	phuong_02	Phường 02	phường	773
27295	phuong_15	Phường 15	phường	773
27298	phuong_01	Phường 01	phường	773
27301	phuong_04	Phường 04	phường	774
27304	phuong_09	Phường 09	phường	774
27307	phuong_03	Phường 03	phường	774
27310	phuong_12	Phường 12	phường	774
27313	phuong_02	Phường 02	phường	774
27316	phuong_08	Phường 08	phường	774
27322	phuong_07	Phường 07	phường	774
27325	phuong_01	Phường 01	phường	774
27328	phuong_11	Phường 11	phường	774
27331	phuong_14	Phường 14	phường	774
27334	phuong_05	Phường 05	phường	774
27337	phuong_06	Phường 06	phường	774
27340	phuong_10	Phường 10	phường	774
27343	phuong_13	Phường 13	phường	774
27346	phuong_14	Phường 14	phường	775
27349	phuong_13	Phường 13	phường	775
27352	phuong_09	Phường 09	phường	775
27355	phuong_06	Phường 06	phường	775
27358	phuong_12	Phường 12	phường	775
27361	phuong_05	Phường 05	phường	775
27364	phuong_11	Phường 11	phường	775
27367	phuong_02	Phường 02	phường	775
27370	phuong_01	Phường 01	phường	775
27373	phuong_04	Phường 04	phường	775
27376	phuong_08	Phường 08	phường	775
27379	phuong_03	Phường 03	phường	775
27382	phuong_07	Phường 07	phường	775
27385	phuong_10	Phường 10	phường	775
27388	phuong_08	Phường 08	phường	776
27391	phuong_02	Phường 02	phường	776
27394	phuong_01	Phường 01	phường	776
27397	phuong_03	Phường 03	phường	776
27400	phuong_11	Phường 11	phường	776
27403	phuong_09	Phường 09	phường	776
27406	phuong_10	Phường 10	phường	776
27409	phuong_04	Phường 04	phường	776
27412	phuong_13	Phường 13	phường	776
27415	phuong_12	Phường 12	phường	776
27418	phuong_05	Phường 05	phường	776
27421	phuong_14	Phường 14	phường	776
27424	phuong_06	Phường 06	phường	776
27427	phuong_15	Phường 15	phường	776
27430	phuong_16	Phường 16	phường	776
27433	phuong_07	Phường 07	phường	776
27436	phuong_binh_hung_hoa	Phường Bình Hưng Hòa	phường	777
27439	phuong_binh_hung_hoa_a	Phường Bình Hưng Hoà A	phường	777
27442	phuong_binh_hung_hoa_b	Phường Bình Hưng Hoà B	phường	777
27445	phuong_binh_tri_dong	Phường Bình Trị Đông	phường	777
27448	phuong_binh_tri_dong_a	Phường Bình Trị Đông A	phường	777
27451	phuong_binh_tri_dong_b	Phường Bình Trị Đông B	phường	777
27454	phuong_tan_tao	Phường Tân Tạo	phường	777
27457	phuong_tan_tao_a	Phường Tân Tạo A	phường	777
27460	phuong_an_lac	Phường An Lạc	phường	777
27463	phuong_an_lac_a	Phường An Lạc A	phường	777
27466	phuong_tan_thuan_dong	Phường Tân Thuận Đông	phường	778
27469	phuong_tan_thuan_tay	Phường Tân Thuận Tây	phường	778
27472	phuong_tan_kieng	Phường Tân Kiểng	phường	778
27475	phuong_tan_hung	Phường Tân Hưng	phường	778
27478	phuong_binh_thuan	Phường Bình Thuận	phường	778
27481	phuong_tan_quy	Phường Tân Quy	phường	778
27484	phuong_phu_thuan	Phường Phú Thuận	phường	778
27487	phuong_tan_phu	Phường Tân Phú	phường	778
27490	phuong_tan_phong	Phường Tân Phong	phường	778
27493	phuong_phu_my	Phường Phú Mỹ	phường	778
27496	thi_tran_cu_chi	Thị trấn Củ Chi	thị trấn	783
27499	xa_phu_my_hung	Xã Phú Mỹ Hưng	xã	783
27502	xa_an_phu	Xã An Phú	xã	783
27505	xa_trung_lap_thuong	Xã Trung Lập Thượng	xã	783
27508	xa_an_nhon_tay	Xã An Nhơn Tây	xã	783
27511	xa_nhuan_duc	Xã Nhuận Đức	xã	783
27514	xa_pham_van_coi	Xã Phạm Văn Cội	xã	783
27517	xa_phu_hoa_dong	Xã Phú Hòa Đông	xã	783
27520	xa_trung_lap_ha	Xã Trung Lập Hạ	xã	783
27523	xa_trung_an	Xã Trung An	xã	783
27526	xa_phuoc_thanh	Xã Phước Thạnh	xã	783
27529	xa_phuoc_hiep	Xã Phước Hiệp	xã	783
27532	xa_tan_an_hoi	Xã Tân An Hội	xã	783
27535	xa_phuoc_vinh_an	Xã Phước Vĩnh An	xã	783
27538	xa_thai_my	Xã Thái Mỹ	xã	783
27541	xa_tan_thanh_tay	Xã Tân Thạnh Tây	xã	783
27544	xa_hoa_phu	Xã Hòa Phú	xã	783
27547	xa_tan_thanh_dong	Xã Tân Thạnh Đông	xã	783
27550	xa_binh_my	Xã Bình Mỹ	xã	783
27553	xa_tan_phu_trung	Xã Tân Phú Trung	xã	783
27556	xa_tan_thong_hoi	Xã Tân Thông Hội	xã	783
27559	thi_tran_hoc_mon	Thị trấn Hóc Môn	thị trấn	784
27562	xa_tan_hiep	Xã Tân Hiệp	xã	784
27565	xa_nhi_binh	Xã Nhị Bình	xã	784
27568	xa_dong_thanh	Xã Đông Thạnh	xã	784
27571	xa_tan_thoi_nhi	Xã Tân Thới Nhì	xã	784
27574	xa_thoi_tam_thon	Xã Thới Tam Thôn	xã	784
27577	xa_xuan_thoi_son	Xã Xuân Thới Sơn	xã	784
27580	xa_tan_xuan	Xã Tân Xuân	xã	784
27583	xa_xuan_thoi_dong	Xã Xuân Thới Đông	xã	784
27586	xa_trung_chanh	Xã Trung Chánh	xã	784
27589	xa_xuan_thoi_thuong	Xã Xuân Thới Thượng	xã	784
27592	xa_ba_diem	Xã Bà Điểm	xã	784
27595	thi_tran_tan_tuc	Thị trấn Tân Túc	thị trấn	785
27598	xa_pham_van_hai	Xã Phạm Văn Hai	xã	785
27601	xa_vinh_loc_a	Xã Vĩnh Lộc A	xã	785
27604	xa_vinh_loc_b	Xã Vĩnh Lộc B	xã	785
27607	xa_binh_loi	Xã Bình Lợi	xã	785
27610	xa_le_minh_xuan	Xã Lê Minh Xuân	xã	785
27613	xa_tan_nhut	Xã Tân Nhựt	xã	785
27616	xa_tan_kien	Xã Tân Kiên	xã	785
27619	xa_binh_hung	Xã Bình Hưng	xã	785
27622	xa_phong_phu	Xã Phong Phú	xã	785
27625	xa_an_phu_tay	Xã An Phú Tây	xã	785
27628	xa_hung_long	Xã Hưng Long	xã	785
27631	xa_da_phuoc	Xã Đa Phước	xã	785
27634	xa_tan_quy_tay	Xã Tân Quý Tây	xã	785
27637	xa_binh_chanh	Xã Bình Chánh	xã	785
27640	xa_quy_duc	Xã Quy Đức	xã	785
27643	thi_tran_nha_be	Thị trấn Nhà Bè	thị trấn	786
27646	xa_phuoc_kien	Xã Phước Kiển	xã	786
27649	xa_phuoc_loc	Xã Phước Lộc	xã	786
27652	xa_nhon_duc	Xã Nhơn Đức	xã	786
27655	xa_phu_xuan	Xã Phú Xuân	xã	786
27658	xa_long_thoi	Xã Long Thới	xã	786
27661	xa_hiep_phuoc	Xã Hiệp Phước	xã	786
27664	thi_tran_can_thanh	Thị trấn Cần Thạnh	thị trấn	787
27667	xa_binh_khanh	Xã Bình Khánh	xã	787
27670	xa_tam_thon_hiep	Xã Tam Thôn Hiệp	xã	787
27673	xa_an_thoi_dong	Xã An Thới Đông	xã	787
27676	xa_thanh_an	Xã Thạnh An	xã	787
27679	xa_long_hoa	Xã Long Hòa	xã	787
27682	xa_ly_nhon	Xã Lý Nhơn	xã	787
27685	phuong_5	Phường 5	phường	794
27688	phuong_2	Phường 2	phường	794
27691	phuong_4	Phường 4	phường	794
27692	phuong_tan_khanh	Phường Tân Khánh	phường	794
27694	phuong_1	Phường 1	phường	794
27697	phuong_3	Phường 3	phường	794
27698	phuong_7	Phường 7	phường	794
27700	phuong_6	Phường 6	phường	794
27703	xa_huong_tho_phu	Xã Hướng Thọ Phú	xã	794
27706	xa_nhon_thanh_trung	Xã Nhơn Thạnh Trung	xã	794
27709	xa_loi_binh_nhon	Xã Lợi Bình Nhơn	xã	794
27712	xa_binh_tam	Xã Bình Tâm	xã	794
27715	phuong_khanh_hau	Phường Khánh Hậu	phường	794
27718	xa_an_vinh_ngai	Xã An Vĩnh Ngãi	xã	794
27787	phuong_1	Phường 1	phường	795
27788	phuong_2	Phường 2	phường	795
27790	xa_thanh_tri	Xã Thạnh Trị	xã	795
27793	xa_binh_hiep	Xã Bình Hiệp	xã	795
27799	xa_binh_tan	Xã Bình Tân	xã	795
27805	xa_tuyen_thanh	Xã Tuyên Thạnh	xã	795
27806	phuong_3	Phường 3	phường	795
27817	xa_thanh_hung	Xã Thạnh Hưng	xã	795
27721	thi_tran_tan_hung	Thị trấn Tân Hưng	thị trấn	796
27724	xa_hung_ha	Xã Hưng Hà	xã	796
27727	xa_hung_dien_b	Xã Hưng Điền B	xã	796
27730	xa_hung_dien	Xã Hưng Điền	xã	796
27733	xa_thanh_hung	Xã Thạnh Hưng	xã	796
27736	xa_hung_thanh	Xã Hưng Thạnh	xã	796
27739	xa_vinh_thanh	Xã Vĩnh Thạnh	xã	796
27742	xa_vinh_chau_b	Xã Vĩnh Châu B	xã	796
27745	xa_vinh_loi	Xã Vĩnh Lợi	xã	796
27748	xa_vinh_dai	Xã Vĩnh Đại	xã	796
27751	xa_vinh_chau_a	Xã Vĩnh Châu A	xã	796
27754	xa_vinh_buu	Xã Vĩnh Bửu	xã	796
27757	thi_tran_vinh_hung	Thị trấn Vĩnh Hưng	thị trấn	797
27760	xa_hung_dien_a	Xã Hưng Điền A	xã	797
27763	xa_khanh_hung	Xã Khánh Hưng	xã	797
27766	xa_thai_tri	Xã Thái Trị	xã	797
27769	xa_vinh_tri	Xã Vĩnh Trị	xã	797
27772	xa_thai_binh_trung	Xã Thái Bình Trung	xã	797
27775	xa_vinh_binh	Xã Vĩnh Bình	xã	797
27778	xa_vinh_thuan	Xã Vĩnh Thuận	xã	797
27781	xa_tuyen_binh	Xã Tuyên Bình	xã	797
27784	xa_tuyen_binh_tay	Xã Tuyên Bình Tây	xã	797
27796	xa_binh_hoa_tay	Xã Bình Hòa Tây	xã	798
27802	xa_binh_thanh	Xã Bình Thạnh	xã	798
27808	xa_binh_hoa_trung	Xã Bình Hòa Trung	xã	798
27811	xa_binh_hoa_dong	Xã Bình Hòa Đông	xã	798
27814	thi_tran_binh_phong_thanh	Thị trấn Bình Phong Thạnh	thị trấn	798
27820	xa_tan_lap	Xã Tân Lập	xã	798
27823	xa_tan_thanh	Xã Tân Thành	xã	798
27826	thi_tran_tan_thanh	Thị trấn Tân Thạnh	thị trấn	799
27829	xa_bac_hoa	Xã Bắc Hòa	xã	799
27832	xa_hau_thanh_tay	Xã Hậu Thạnh Tây	xã	799
27835	xa_nhon_hoa_lap	Xã Nhơn Hòa Lập	xã	799
27838	xa_tan_lap	Xã Tân Lập	xã	799
27841	xa_hau_thanh_dong	Xã Hậu Thạnh Đông	xã	799
27844	xa_nhon_hoa	Xã Nhơn Hoà	xã	799
27847	xa_kien_binh	Xã Kiến Bình	xã	799
27850	xa_tan_thanh	Xã Tân Thành	xã	799
27853	xa_tan_binh	Xã Tân Bình	xã	799
27856	xa_tan_ninh	Xã Tân Ninh	xã	799
27859	xa_nhon_ninh	Xã Nhơn Ninh	xã	799
27862	xa_tan_hoa	Xã Tân Hòa	xã	799
27865	thi_tran_thanh_hoa	Thị trấn Thạnh Hóa	thị trấn	800
27868	xa_tan_hiep	Xã Tân Hiệp	xã	800
27871	xa_thuan_binh	Xã Thuận Bình	xã	800
27874	xa_thanh_phuoc	Xã Thạnh Phước	xã	800
27877	xa_thanh_phu	Xã Thạnh Phú	xã	800
27880	xa_thuan_nghia_hoa	Xã Thuận Nghĩa Hòa	xã	800
27883	xa_thuy_dong	Xã Thủy Đông	xã	800
27886	xa_thuy_tay	Xã Thủy Tây	xã	800
27889	xa_tan_tay	Xã Tân Tây	xã	800
27892	xa_tan_dong	Xã Tân Đông	xã	800
27895	xa_thanh_an	Xã Thạnh An	xã	800
27898	thi_tran_dong_thanh	Thị trấn Đông Thành	thị trấn	801
27901	xa_my_quy_dong	Xã Mỹ Quý Đông	xã	801
27904	xa_my_thanh_bac	Xã Mỹ Thạnh Bắc	xã	801
27907	xa_my_quy_tay	Xã Mỹ Quý Tây	xã	801
27910	xa_my_thanh_tay	Xã Mỹ Thạnh Tây	xã	801
27913	xa_my_thanh_dong	Xã Mỹ Thạnh Đông	xã	801
27916	xa_binh_thanh	Xã Bình Thành	xã	801
27919	xa_binh_hoa_bac	Xã Bình Hòa Bắc	xã	801
27922	xa_binh_hoa_hung	Xã Bình Hòa Hưng	xã	801
27925	xa_binh_hoa_nam	Xã Bình Hòa Nam	xã	801
27928	xa_my_binh	Xã Mỹ Bình	xã	801
27931	thi_tran_hau_nghia	Thị trấn Hậu Nghĩa	thị trấn	802
27934	thi_tran_hiep_hoa	Thị trấn Hiệp Hòa	thị trấn	802
27937	thi_tran_duc_hoa	Thị trấn Đức Hòa	thị trấn	802
27940	xa_loc_giang	Xã Lộc Giang	xã	802
27943	xa_an_ninh_dong	Xã An Ninh Đông	xã	802
27946	xa_an_ninh_tay	Xã An Ninh Tây	xã	802
27949	xa_tan_my	Xã Tân Mỹ	xã	802
27952	xa_hiep_hoa	Xã Hiệp Hòa	xã	802
27955	xa_duc_lap_thuong	Xã Đức Lập Thượng	xã	802
27958	xa_duc_lap_ha	Xã Đức Lập Hạ	xã	802
27961	xa_tan_phu	Xã Tân Phú	xã	802
27964	xa_my_hanh_bac	Xã Mỹ Hạnh Bắc	xã	802
27967	xa_duc_hoa_thuong	Xã Đức Hòa Thượng	xã	802
27970	xa_hoa_khanh_tay	Xã Hòa Khánh Tây	xã	802
27973	xa_hoa_khanh_dong	Xã Hòa Khánh Đông	xã	802
27976	xa_my_hanh_nam	Xã Mỹ Hạnh Nam	xã	802
27979	xa_hoa_khanh_nam	Xã Hòa Khánh Nam	xã	802
27982	xa_duc_hoa_dong	Xã Đức Hòa Đông	xã	802
27985	xa_duc_hoa_ha	Xã Đức Hòa Hạ	xã	802
27988	xa_huu_thanh	Xã Hựu Thạnh	xã	802
27991	thi_tran_ben_luc	Thị trấn Bến Lức	thị trấn	803
27994	xa_thanh_loi	Xã Thạnh Lợi	xã	803
27997	xa_luong_binh	Xã Lương Bình	xã	803
28000	xa_thanh_hoa	Xã Thạnh Hòa	xã	803
28003	xa_luong_hoa	Xã Lương Hòa	xã	803
28006	xa_tan_hoa	Xã Tân Hòa	xã	803
28009	xa_tan_buu	Xã Tân Bửu	xã	803
28012	xa_an_thanh	Xã An Thạnh	xã	803
28015	xa_binh_duc	Xã Bình Đức	xã	803
28018	xa_my_yen	Xã Mỹ Yên	xã	803
28021	xa_thanh_phu	Xã Thanh Phú	xã	803
28024	xa_long_hiep	Xã Long Hiệp	xã	803
28027	xa_thanh_duc	Xã Thạnh Đức	xã	803
28030	xa_phuoc_loi	Xã Phước Lợi	xã	803
28033	xa_nhut_chanh	Xã Nhựt Chánh	xã	803
28036	thi_tran_thu_thua	Thị trấn Thủ Thừa	thị trấn	804
28039	xa_long_thanh	Xã Long Thạnh	xã	804
28042	xa_tan_thanh	Xã Tân Thành	xã	804
28045	xa_long_thuan	Xã Long Thuận	xã	804
28048	xa_my_lac	Xã Mỹ Lạc	xã	804
28051	xa_my_thanh	Xã Mỹ Thạnh	xã	804
28054	xa_binh_an	Xã Bình An	xã	804
28057	xa_nhi_thanh	Xã Nhị Thành	xã	804
28060	xa_my_an	Xã Mỹ An	xã	804
28063	xa_binh_thanh	Xã Bình Thạnh	xã	804
28066	xa_my_phu	Xã Mỹ Phú	xã	804
28072	xa_tan_long	Xã Tân Long	xã	804
28075	thi_tran_tan_tru	Thị trấn Tân Trụ	thị trấn	805
28078	xa_tan_binh	Xã Tân Bình	xã	805
28084	xa_que_my_thanh	Xã Quê Mỹ Thạnh	xã	805
28087	xa_lac_tan	Xã Lạc Tấn	xã	805
28090	xa_binh_trinh_dong	Xã Bình Trinh Đông	xã	805
28093	xa_tan_phuoc_tay	Xã Tân Phước Tây	xã	805
28096	xa_binh_lang	Xã Bình Lãng	xã	805
28099	xa_binh_tinh	Xã Bình Tịnh	xã	805
28102	xa_duc_tan	Xã Đức Tân	xã	805
28105	xa_nhut_ninh	Xã Nhựt Ninh	xã	805
28108	thi_tran_can_duoc	Thị trấn Cần Đước	thị trấn	806
28111	xa_long_trach	Xã Long Trạch	xã	806
28114	xa_long_khe	Xã Long Khê	xã	806
28117	xa_long_dinh	Xã Long Định	xã	806
28120	xa_phuoc_van	Xã Phước Vân	xã	806
28123	xa_long_hoa	Xã Long Hòa	xã	806
28126	xa_long_cang	Xã Long Cang	xã	806
28129	xa_long_son	Xã Long Sơn	xã	806
28132	xa_tan_trach	Xã Tân Trạch	xã	806
28135	xa_my_le	Xã Mỹ Lệ	xã	806
28138	xa_tan_lan	Xã Tân Lân	xã	806
28141	xa_phuoc_tuy	Xã Phước Tuy	xã	806
28144	xa_long_huu_dong	Xã Long Hựu Đông	xã	806
28147	xa_tan_an	Xã Tân Ân	xã	806
28150	xa_phuoc_dong	Xã Phước Đông	xã	806
28153	xa_long_huu_tay	Xã Long Hựu Tây	xã	806
28156	xa_tan_chanh	Xã Tân Chánh	xã	806
28159	thi_tran_can_giuoc	Thị trấn Cần Giuộc	thị trấn	807
28162	xa_phuoc_ly	Xã Phước Lý	xã	807
28165	xa_long_thuong	Xã Long Thượng	xã	807
28168	xa_long_hau	Xã Long Hậu	xã	807
28174	xa_phuoc_hau	Xã Phước Hậu	xã	807
28177	xa_my_loc	Xã Mỹ Lộc	xã	807
28180	xa_phuoc_lai	Xã Phước Lại	xã	807
28183	xa_phuoc_lam	Xã Phước Lâm	xã	807
28189	xa_thuan_thanh	Xã Thuận Thành	xã	807
28192	xa_phuoc_vinh_tay	Xã Phước Vĩnh Tây	xã	807
28195	xa_phuoc_vinh_dong	Xã Phước Vĩnh Đông	xã	807
28198	xa_long_an	Xã Long An	xã	807
28201	xa_long_phung	Xã Long Phụng	xã	807
28204	xa_dong_thanh	Xã Đông Thạnh	xã	807
28207	xa_tan_tap	Xã Tân Tập	xã	807
28210	thi_tran_tam_vu	Thị trấn Tầm Vu	thị trấn	808
28213	xa_binh_quoi	Xã Bình Quới	xã	808
28216	xa_hoa_phu	Xã Hòa Phú	xã	808
28219	xa_phu_ngai_tri	Xã Phú Ngãi Trị	xã	808
28222	xa_vinh_cong	Xã Vĩnh Công	xã	808
28225	xa_thuan_my	Xã Thuận Mỹ	xã	808
28228	xa_hiep_thanh	Xã Hiệp Thạnh	xã	808
28231	xa_phuoc_tan_hung	Xã Phước Tân Hưng	xã	808
28234	xa_thanh_phu_long	Xã Thanh Phú Long	xã	808
28237	xa_duong_xuan_hoi	Xã Dương Xuân Hội	xã	808
28240	xa_an_luc_long	Xã An Lục Long	xã	808
28243	xa_long_tri	Xã Long Trì	xã	808
28246	xa_thanh_vinh_dong	Xã Thanh Vĩnh Đông	xã	808
28249	phuong_5	Phường 5	phường	815
28252	phuong_4	Phường 4	phường	815
28255	phuong_7	Phường 7	phường	815
28258	phuong_3	Phường 3	phường	815
28261	phuong_1	Phường 1	phường	815
28264	phuong_2	Phường 2	phường	815
28267	phuong_8	Phường 8	phường	815
28270	phuong_6	Phường 6	phường	815
28273	phuong_9	Phường 9	phường	815
28276	phuong_10	Phường 10	phường	815
28279	phuong_tan_long	Phường Tân Long	phường	815
28282	xa_dao_thanh	Xã Đạo Thạnh	xã	815
28285	xa_trung_an	Xã Trung An	xã	815
28288	xa_my_phong	Xã Mỹ Phong	xã	815
28291	xa_tan_my_chanh	Xã Tân Mỹ Chánh	xã	815
28567	xa_phuoc_thanh	Xã Phước Thạnh	xã	815
28591	xa_thoi_son	Xã Thới Sơn	xã	815
28294	phuong_3	Phường 3	phường	816
28297	phuong_2	Phường 2	phường	816
28300	phuong_4	Phường 4	phường	816
28303	phuong_1	Phường 1	phường	816
28306	phuong_5	Phường 5	phường	816
28309	xa_long_hung	Xã Long Hưng	xã	816
28312	xa_long_thuan	Xã Long Thuận	xã	816
28315	xa_long_chanh	Xã Long Chánh	xã	816
28318	xa_long_hoa	Xã Long Hòa	xã	816
28708	xa_binh_dong	Xã Bình Đông	xã	816
28717	xa_binh_xuan	Xã Bình Xuân	xã	816
28729	xa_tan_trung	Xã Tân Trung	xã	816
28435	phuong_1	Phường 1	phường	817
28436	phuong_2	Phường 2	phường	817
28437	phuong_3	Phường 3	phường	817
28439	phuong_4	Phường 4	phường	817
28440	phuong_5	Phường 5	phường	817
28447	xa_my_phuoc_tay	Xã Mỹ Phước Tây	xã	817
28450	xa_my_hanh_dong	Xã Mỹ Hạnh Đông	xã	817
28453	xa_my_hanh_trung	Xã Mỹ Hạnh Trung	xã	817
28459	xa_tan_phu	Xã Tân Phú	xã	817
28462	xa_tan_binh	Xã Tân Bình	xã	817
28468	xa_tan_hoi	Xã Tân Hội	xã	817
28474	phuong_nhi_my	Phường Nhị Mỹ	phường	817
28477	xa_nhi_quy	Xã Nhị Quý	xã	817
28480	xa_thanh_hoa	Xã Thanh Hòa	xã	817
28483	xa_phu_quy	Xã Phú Quý	xã	817
28486	xa_long_khanh	Xã Long Khánh	xã	817
28321	thi_tran_my_phuoc	Thị trấn Mỹ Phước	thị trấn	818
28324	xa_tan_hoa_dong	Xã Tân Hòa Đông	xã	818
28327	xa_thanh_tan	Xã Thạnh Tân	xã	818
28330	xa_thanh_my	Xã Thạnh Mỹ	xã	818
28333	xa_thanh_hoa	Xã Thạnh Hoà	xã	818
28336	xa_phu_my	Xã Phú Mỹ	xã	818
28339	xa_tan_hoa_thanh	Xã Tân Hòa Thành	xã	818
28342	xa_hung_thanh	Xã Hưng Thạnh	xã	818
28345	xa_tan_lap_1	Xã Tân Lập 1	xã	818
28348	xa_tan_hoa_tay	Xã Tân Hòa Tây	xã	818
28354	xa_tan_lap_2	Xã Tân Lập 2	xã	818
28357	xa_phuoc_lap	Xã Phước Lập	xã	818
28360	thi_tran_cai_be	Thị trấn Cái Bè	thị trấn	819
28363	xa_hau_my_bac_b	Xã Hậu Mỹ Bắc B	xã	819
28366	xa_hau_my_bac_a	Xã Hậu Mỹ Bắc A	xã	819
28369	xa_my_trung	Xã Mỹ Trung	xã	819
28372	xa_hau_my_trinh	Xã Hậu Mỹ Trinh	xã	819
28375	xa_hau_my_phu	Xã Hậu Mỹ Phú	xã	819
28378	xa_my_tan	Xã Mỹ Tân	xã	819
28381	xa_my_loi_b	Xã Mỹ Lợi B	xã	819
28384	xa_thien_trung	Xã Thiện Trung	xã	819
28387	xa_my_hoi	Xã Mỹ Hội	xã	819
28390	xa_an_cu	Xã An Cư	xã	819
28393	xa_hau_thanh	Xã Hậu Thành	xã	819
28396	xa_my_loi_a	Xã Mỹ Lợi A	xã	819
28399	xa_hoa_khanh	Xã Hòa Khánh	xã	819
28402	xa_thien_tri	Xã Thiện Trí	xã	819
28405	xa_my_duc_dong	Xã Mỹ Đức Đông	xã	819
28408	xa_my_duc_tay	Xã Mỹ Đức Tây	xã	819
28411	xa_dong_hoa_hiep	Xã Đông Hòa Hiệp	xã	819
28414	xa_an_thai_dong	Xã An Thái Đông	xã	819
28417	xa_tan_hung	Xã Tân Hưng	xã	819
28420	xa_my_luong	Xã Mỹ Lương	xã	819
28423	xa_tan_thanh	Xã Tân Thanh	xã	819
28426	xa_an_thai_trung	Xã An Thái Trung	xã	819
28429	xa_an_huu	Xã An Hữu	xã	819
28432	xa_hoa_hung	Xã Hòa Hưng	xã	819
28438	xa_thanh_loc	Xã Thạnh Lộc	xã	820
28441	xa_my_thanh_bac	Xã Mỹ Thành Bắc	xã	820
28444	xa_phu_cuong	Xã Phú Cường	xã	820
28456	xa_my_thanh_nam	Xã Mỹ Thành Nam	xã	820
28465	xa_phu_nhuan	Xã Phú Nhuận	xã	820
28471	xa_binh_phu	Xã Bình Phú	xã	820
28489	xa_cam_son	Xã Cẩm Sơn	xã	820
28492	xa_phu_an	Xã Phú An	xã	820
28495	xa_my_long	Xã Mỹ Long	xã	820
28498	xa_long_tien	Xã Long Tiên	xã	820
28501	xa_hiep_duc	Xã Hiệp Đức	xã	820
28504	xa_long_trung	Xã Long Trung	xã	820
28507	xa_hoi_xuan	Xã Hội Xuân	xã	820
28510	xa_tan_phong	Xã Tân Phong	xã	820
28513	xa_tam_binh	Xã Tam Bình	xã	820
28516	xa_ngu_hiep	Xã Ngũ Hiệp	xã	820
28519	thi_tran_tan_hiep	Thị trấn Tân Hiệp	thị trấn	821
28522	xa_tan_hoi_dong	Xã Tân Hội Đông	xã	821
28525	xa_tan_huong	Xã Tân Hương	xã	821
28528	xa_tan_ly_dong	Xã Tân Lý Đông	xã	821
28531	xa_tan_ly_tay	Xã Tân Lý Tây	xã	821
28534	xa_than_cuu_nghia	Xã Thân Cửu Nghĩa	xã	821
28537	xa_tam_hiep	Xã Tam Hiệp	xã	821
28540	xa_diem_hy	Xã Điềm Hy	xã	821
28543	xa_nhi_binh	Xã Nhị Bình	xã	821
28546	xa_duong_diem	Xã Dưỡng Điềm	xã	821
28549	xa_dong_hoa	Xã Đông Hòa	xã	821
28552	xa_long_dinh	Xã Long Định	xã	821
28555	xa_huu_dao	Xã Hữu Đạo	xã	821
28558	xa_long_an	Xã Long An	xã	821
28561	xa_long_hung	Xã Long Hưng	xã	821
28564	xa_binh_trung	Xã Bình Trưng	xã	821
28570	xa_thanh_phu	Xã Thạnh Phú	xã	821
28573	xa_ban_long	Xã Bàn Long	xã	821
28576	xa_vinh_kim	Xã Vĩnh Kim	xã	821
28579	xa_binh_duc	Xã Bình Đức	xã	821
28582	xa_song_thuan	Xã Song Thuận	xã	821
28585	xa_kim_son	Xã Kim Sơn	xã	821
28588	xa_phu_phong	Xã Phú Phong	xã	821
28594	thi_tran_cho_gao	Thị trấn Chợ Gạo	thị trấn	822
28597	xa_trung_hoa	Xã Trung Hòa	xã	822
28600	xa_hoa_tinh	Xã Hòa Tịnh	xã	822
28603	xa_my_tinh_an	Xã Mỹ Tịnh An	xã	822
28606	xa_tan_binh_thanh	Xã Tân Bình Thạnh	xã	822
28609	xa_phu_kiet	Xã Phú Kiết	xã	822
28612	xa_luong_hoa_lac	Xã Lương Hòa Lạc	xã	822
28615	xa_thanh_binh	Xã Thanh Bình	xã	822
28618	xa_quon_long	Xã Quơn Long	xã	822
28621	xa_binh_phuc_nhut	Xã Bình Phục Nhứt	xã	822
28624	xa_dang_hung_phuoc	Xã Đăng Hưng Phước	xã	822
28627	xa_tan_thuan_binh	Xã Tân Thuận Bình	xã	822
28630	xa_song_binh	Xã Song Bình	xã	822
28633	xa_binh_phan	Xã Bình Phan	xã	822
28636	xa_long_binh_dien	Xã Long Bình Điền	xã	822
28639	xa_an_thanh_thuy	Xã An Thạnh Thủy	xã	822
28642	xa_xuan_dong	Xã Xuân Đông	xã	822
28645	xa_hoa_dinh	Xã Hòa Định	xã	822
28648	xa_binh_ninh	Xã Bình Ninh	xã	822
28651	thi_tran_vinh_binh	Thị trấn Vĩnh Bình	thị trấn	823
28654	xa_dong_son	Xã Đồng Sơn	xã	823
28657	xa_binh_phu	Xã Bình Phú	xã	823
28660	xa_dong_thanh	Xã Đồng Thạnh	xã	823
28663	xa_thanh_cong	Xã Thành Công	xã	823
28666	xa_binh_nhi	Xã Bình Nhì	xã	823
28669	xa_yen_luong	Xã Yên Luông	xã	823
28672	xa_thanh_tri	Xã Thạnh Trị	xã	823
28675	xa_thanh_nhut	Xã Thạnh Nhựt	xã	823
28678	xa_long_vinh	Xã Long Vĩnh	xã	823
28681	xa_binh_tan	Xã Bình Tân	xã	823
28684	xa_vinh_huu	Xã Vĩnh Hựu	xã	823
28687	xa_long_binh	Xã Long Bình	xã	823
28702	thi_tran_tan_hoa	Thị trấn Tân Hòa	thị trấn	824
28705	xa_tang_hoa	Xã Tăng Hoà	xã	824
28711	xa_tan_phuoc	Xã Tân Phước	xã	824
28714	xa_gia_thuan	Xã Gia Thuận	xã	824
28720	thi_tran_vam_lang	Thị trấn Vàm Láng	thị trấn	824
28723	xa_tan_tay	Xã Tân Tây	xã	824
28726	xa_kieng_phuoc	Xã Kiểng Phước	xã	824
28732	xa_tan_dong	Xã Tân Đông	xã	824
28735	xa_binh_an	Xã Bình Ân	xã	824
28738	xa_tan_dien	Xã Tân Điền	xã	824
28741	xa_binh_nghi	Xã Bình Nghị	xã	824
28744	xa_phuoc_trung	Xã Phước Trung	xã	824
28747	xa_tan_thanh	Xã Tân Thành	xã	824
28690	xa_tan_thoi	Xã Tân Thới	xã	825
28693	xa_tan_phu	Xã Tân Phú	xã	825
28696	xa_phu_thanh	Xã Phú Thạnh	xã	825
28699	xa_tan_thanh	Xã Tân Thạnh	xã	825
28750	xa_phu_dong	Xã Phú Đông	xã	825
28753	xa_phu_tan	Xã Phú Tân	xã	825
28756	phuong_phu_khuong	Phường Phú Khương	phường	829
28757	phuong_phu_tan	Phường Phú Tân	phường	829
28759	phuong_8	Phường 8	phường	829
28762	phuong_6	Phường 6	phường	829
28765	phuong_4	Phường 4	phường	829
28768	phuong_5	Phường 5	phường	829
28777	phuong_an_hoi	Phường An Hội	phường	829
28780	phuong_7	Phường 7	phường	829
28783	xa_son_dong	Xã Sơn Đông	xã	829
28786	xa_phu_hung	Xã Phú Hưng	xã	829
28789	xa_binh_phu	Xã Bình Phú	xã	829
28792	xa_my_thanh_an	Xã Mỹ Thạnh An	xã	829
28795	xa_nhon_thanh	Xã Nhơn Thạnh	xã	829
28798	xa_phu_nhuan	Xã Phú Nhuận	xã	829
28801	thi_tran_chau_thanh	Thị trấn Châu Thành	thị trấn	831
28804	xa_tan_thach	Xã Tân Thạch	xã	831
28807	xa_quoi_son	Xã Qưới Sơn	xã	831
28810	xa_an_khanh	Xã An Khánh	xã	831
28813	xa_giao_long	Xã Giao Long	xã	831
28819	xa_phu_tuc	Xã Phú Túc	xã	831
28822	xa_phu_duc	Xã Phú Đức	xã	831
28825	xa_phu_an_hoa	Xã Phú An Hòa	xã	831
28828	xa_an_phuoc	Xã An Phước	xã	831
28831	xa_tam_phuoc	Xã Tam Phước	xã	831
28834	xa_thanh_trieu	Xã Thành Triệu	xã	831
28837	xa_tuong_da	Xã Tường Đa	xã	831
28840	xa_tan_phu	Xã Tân Phú	xã	831
28843	xa_quoi_thanh	Xã Quới Thành	xã	831
28846	xa_phuoc_thanh	Xã Phước Thạnh	xã	831
28849	xa_an_hoa	Xã An Hóa	xã	831
28852	xa_tien_long	Xã Tiên Long	xã	831
28855	xa_an_hiep	Xã An Hiệp	xã	831
28858	xa_huu_dinh	Xã Hữu Định	xã	831
28861	xa_tien_thuy	Xã Tiên Thủy	xã	831
28864	xa_son_hoa	Xã Sơn Hòa	xã	831
28870	thi_tran_cho_lach	Thị trấn Chợ Lách	thị trấn	832
28873	xa_phu_phung	Xã Phú Phụng	xã	832
28876	xa_son_dinh	Xã Sơn Định	xã	832
28879	xa_vinh_binh	Xã Vĩnh Bình	xã	832
28882	xa_hoa_nghia	Xã Hòa Nghĩa	xã	832
28885	xa_long_thoi	Xã Long Thới	xã	832
28888	xa_phu_son	Xã Phú Sơn	xã	832
28891	xa_tan_thieng	Xã Tân Thiềng	xã	832
28894	xa_vinh_thanh	Xã Vĩnh Thành	xã	832
28897	xa_vinh_hoa	Xã Vĩnh Hòa	xã	832
28900	xa_hung_khanh_trung_b	Xã Hưng Khánh Trung B	xã	832
28903	thi_tran_mo_cay	Thị trấn Mỏ Cày	thị trấn	833
28930	xa_dinh_thuy	Xã Định Thủy	xã	833
28939	xa_da_phuoc_hoi	Xã Đa Phước Hội	xã	833
28940	xa_tan_hoi	Xã Tân Hội	xã	833
28942	xa_phuoc_hiep	Xã Phước Hiệp	xã	833
28945	xa_binh_khanh	Xã Bình Khánh	xã	833
28951	xa_an_thanh	Xã An Thạnh	xã	833
28957	xa_an_dinh	Xã An Định	xã	833
28960	xa_thanh_thoi_b	Xã Thành Thới B	xã	833
28963	xa_tan_trung	Xã Tân Trung	xã	833
28966	xa_an_thoi	Xã An Thới	xã	833
28969	xa_thanh_thoi_a	Xã Thành Thới A	xã	833
28972	xa_minh_duc	Xã Minh Đức	xã	833
28975	xa_ngai_dang	Xã Ngãi Đăng	xã	833
28978	xa_cam_son	Xã Cẩm Sơn	xã	833
28981	xa_huong_my	Xã Hương Mỹ	xã	833
28984	thi_tran_giong_trom	Thị trấn Giồng Trôm	thị trấn	834
28987	xa_phong_nam	Xã Phong Nẫm	xã	834
28993	xa_my_thanh	Xã Mỹ Thạnh	xã	834
28996	xa_chau_hoa	Xã Châu Hòa	xã	834
28999	xa_luong_hoa	Xã Lương Hòa	xã	834
29002	xa_luong_quoi	Xã Lương Quới	xã	834
29005	xa_luong_phu	Xã Lương Phú	xã	834
29008	xa_chau_binh	Xã Châu Bình	xã	834
29011	xa_thuan_dien	Xã Thuận Điền	xã	834
29014	xa_son_phu	Xã Sơn Phú	xã	834
29017	xa_binh_hoa	Xã Bình Hoà	xã	834
29020	xa_phuoc_long	Xã Phước Long	xã	834
29023	xa_hung_phong	Xã Hưng Phong	xã	834
29026	xa_long_my	Xã Long Mỹ	xã	834
29029	xa_tan_hao	Xã Tân Hào	xã	834
29032	xa_binh_thanh	Xã Bình Thành	xã	834
29035	xa_tan_thanh	Xã Tân Thanh	xã	834
29038	xa_tan_loi_thanh	Xã Tân Lợi Thạnh	xã	834
29041	xa_thanh_phu_dong	Xã Thạnh Phú Đông	xã	834
29044	xa_hung_nhuong	Xã Hưng Nhượng	xã	834
29047	xa_hung_le	Xã Hưng Lễ	xã	834
29050	thi_tran_binh_dai	Thị trấn Bình Đại	thị trấn	835
29053	xa_tam_hiep	Xã Tam Hiệp	xã	835
29056	xa_long_dinh	Xã Long Định	xã	835
29059	xa_long_hoa	Xã Long Hòa	xã	835
29062	xa_phu_thuan	Xã Phú Thuận	xã	835
29065	xa_vang_quoi_tay	Xã Vang Quới Tây	xã	835
29068	xa_vang_quoi_dong	Xã Vang Quới Đông	xã	835
29071	xa_chau_hung	Xã Châu Hưng	xã	835
29074	xa_phu_vang	Xã Phú Vang	xã	835
29077	xa_loc_thuan	Xã Lộc Thuận	xã	835
29080	xa_dinh_trung	Xã Định Trung	xã	835
29083	xa_thoi_lai	Xã Thới Lai	xã	835
29086	xa_binh_thoi	Xã Bình Thới	xã	835
29089	xa_phu_long	Xã Phú Long	xã	835
29092	xa_binh_thang	Xã Bình Thắng	xã	835
29095	xa_thanh_tri	Xã Thạnh Trị	xã	835
29098	xa_dai_hoa_loc	Xã Đại Hòa Lộc	xã	835
29101	xa_thua_duc	Xã Thừa Đức	xã	835
29104	xa_thanh_phuoc	Xã Thạnh Phước	xã	835
29107	xa_thoi_thuan	Xã Thới Thuận	xã	835
29110	thi_tran_ba_tri	Thị trấn Ba Tri	thị trấn	836
29113	xa_tan_my	Xã Tân Mỹ	xã	836
29116	xa_my_hoa	Xã Mỹ Hòa	xã	836
29119	xa_tan_xuan	Xã Tân Xuân	xã	836
29122	xa_my_chanh	Xã Mỹ Chánh	xã	836
29125	xa_bao_thanh	Xã Bảo Thạnh	xã	836
29128	xa_an_phu_trung	Xã An Phú Trung	xã	836
29131	xa_my_thanh	Xã Mỹ Thạnh	xã	836
29134	xa_my_nhon	Xã Mỹ Nhơn	xã	836
29137	xa_phuoc_ngai	Xã Phước Ngãi	xã	836
29143	xa_an_ngai_trung	Xã An Ngãi Trung	xã	836
29146	xa_phu_le	Xã Phú Lễ	xã	836
29149	xa_an_binh_tay	Xã An Bình Tây	xã	836
29152	xa_bao_thuan	Xã Bảo Thuận	xã	836
29155	xa_tan_hung	Xã Tân Hưng	xã	836
29158	xa_an_ngai_tay	Xã An Ngãi Tây	xã	836
29161	xa_an_hiep	Xã An Hiệp	xã	836
29164	xa_vinh_hoa	Xã Vĩnh Hòa	xã	836
29167	xa_tan_thuy	Xã Tân Thủy	xã	836
29170	xa_vinh_an	Xã Vĩnh An	xã	836
29173	xa_an_duc	Xã An Đức	xã	836
29176	xa_an_hoa_tay	Xã An Hòa Tây	xã	836
29179	xa_an_thuy	Xã An Thủy	xã	836
29182	thi_tran_thanh_phu	Thị trấn Thạnh Phú	thị trấn	837
29185	xa_phu_khanh	Xã Phú Khánh	xã	837
29188	xa_dai_dien	Xã Đại Điền	xã	837
29191	xa_quoi_dien	Xã Quới Điền	xã	837
29194	xa_tan_phong	Xã Tân Phong	xã	837
29197	xa_my_hung	Xã Mỹ Hưng	xã	837
29200	xa_an_thanh	Xã An Thạnh	xã	837
29203	xa_thoi_thanh	Xã Thới Thạnh	xã	837
29206	xa_hoa_loi	Xã Hòa Lợi	xã	837
29209	xa_an_dien	Xã An Điền	xã	837
29212	xa_binh_thanh	Xã Bình Thạnh	xã	837
29215	xa_an_thuan	Xã An Thuận	xã	837
29218	xa_an_quy	Xã An Quy	xã	837
29221	xa_thanh_hai	Xã Thạnh Hải	xã	837
29224	xa_an_nhon	Xã An Nhơn	xã	837
29227	xa_giao_thanh	Xã Giao Thạnh	xã	837
29230	xa_thanh_phong	Xã Thạnh Phong	xã	837
29233	xa_my_an	Xã Mỹ An	xã	837
28889	xa_phu_my	Xã Phú Mỹ	xã	838
28901	xa_hung_khanh_trung_a	Xã Hưng Khánh Trung A	xã	838
28906	xa_thanh_tan	Xã Thanh Tân	xã	838
28909	xa_thanh_ngai	Xã Thạnh Ngãi	xã	838
28912	xa_tan_phu_tay	Xã Tân Phú Tây	xã	838
28915	xa_phuoc_my_trung	Xã Phước Mỹ Trung	xã	838
28918	xa_tan_thanh_binh	Xã Tân Thành Bình	xã	838
28921	xa_thanh_an	Xã Thành An	xã	838
28924	xa_hoa_loc	Xã Hòa Lộc	xã	838
28927	xa_tan_thanh_tay	Xã Tân Thanh Tây	xã	838
28933	xa_tan_binh	Xã Tân Bình	xã	838
28936	xa_nhuan_phu_tan	Xã Nhuận Phú Tân	xã	838
28948	xa_khanh_thanh_tan	Xã Khánh Thạnh Tân	xã	838
29236	phuong_4	Phường 4	phường	842
29239	phuong_1	Phường 1	phường	842
29242	phuong_3	Phường 3	phường	842
29245	phuong_2	Phường 2	phường	842
29248	phuong_5	Phường 5	phường	842
29251	phuong_6	Phường 6	phường	842
29254	phuong_7	Phường 7	phường	842
29257	phuong_8	Phường 8	phường	842
29260	phuong_9	Phường 9	phường	842
29263	xa_long_duc	Xã Long Đức	xã	842
29266	thi_tran_cang_long	Thị trấn Càng Long	thị trấn	844
29269	xa_my_cam	Xã Mỹ Cẩm	xã	844
29272	xa_an_truong_a	Xã An Trường A	xã	844
29275	xa_an_truong	Xã An Trường	xã	844
29278	xa_huyen_hoi	Xã Huyền Hội	xã	844
29281	xa_tan_an	Xã Tân An	xã	844
29284	xa_tan_binh	Xã Tân Bình	xã	844
29287	xa_binh_phu	Xã Bình Phú	xã	844
29290	xa_phuong_thanh	Xã Phương Thạnh	xã	844
29293	xa_dai_phuc	Xã Đại Phúc	xã	844
29296	xa_dai_phuoc	Xã Đại Phước	xã	844
29299	xa_nhi_long_phu	Xã Nhị Long Phú	xã	844
29302	xa_nhi_long	Xã Nhị Long	xã	844
29305	xa_duc_my	Xã Đức Mỹ	xã	844
29308	thi_tran_cau_ke	Thị trấn Cầu Kè	thị trấn	845
29311	xa_hoa_an	Xã Hòa Ân	xã	845
29314	xa_chau_dien	Xã Châu Điền	xã	845
29317	xa_an_phu_tan	Xã An Phú Tân	xã	845
29320	xa_hoa_tan	Xã Hoà Tân	xã	845
29323	xa_ninh_thoi	Xã Ninh Thới	xã	845
29326	xa_phong_phu	Xã Phong Phú	xã	845
29329	xa_phong_thanh	Xã Phong Thạnh	xã	845
29332	xa_tam_ngai	Xã Tam Ngãi	xã	845
29335	xa_thong_hoa	Xã Thông Hòa	xã	845
29338	xa_thanh_phu	Xã Thạnh Phú	xã	845
29341	thi_tran_tieu_can	Thị trấn Tiểu Cần	thị trấn	846
29344	thi_tran_cau_quan	Thị trấn Cầu Quan	thị trấn	846
29347	xa_phu_can	Xã Phú Cần	xã	846
29350	xa_hieu_tu	Xã Hiếu Tử	xã	846
29353	xa_hieu_trung	Xã Hiếu Trung	xã	846
29356	xa_long_thoi	Xã Long Thới	xã	846
29359	xa_hung_hoa	Xã Hùng Hòa	xã	846
29362	xa_tan_hung	Xã Tân Hùng	xã	846
29365	xa_tap_ngai	Xã Tập Ngãi	xã	846
29368	xa_ngai_hung	Xã Ngãi Hùng	xã	846
29371	xa_tan_hoa	Xã Tân Hòa	xã	846
29374	thi_tran_chau_thanh	Thị trấn Châu Thành	thị trấn	847
29377	xa_da_loc	Xã Đa Lộc	xã	847
29380	xa_my_chanh	Xã Mỹ Chánh	xã	847
29383	xa_thanh_my	Xã Thanh Mỹ	xã	847
29386	xa_luong_hoa_a	Xã Lương Hoà A	xã	847
29389	xa_luong_hoa	Xã Lương Hòa	xã	847
29392	xa_song_loc	Xã Song Lộc	xã	847
29395	xa_nguyet_hoa	Xã Nguyệt Hóa	xã	847
29398	xa_hoa_thuan	Xã Hòa Thuận	xã	847
29401	xa_hoa_loi	Xã Hòa Lợi	xã	847
29404	xa_phuoc_hao	Xã Phước Hảo	xã	847
29407	xa_hung_my	Xã Hưng Mỹ	xã	847
29410	xa_hoa_minh	Xã Hòa Minh	xã	847
29413	xa_long_hoa	Xã Long Hòa	xã	847
29416	thi_tran_cau_ngang	Thị trấn Cầu Ngang	thị trấn	848
29419	thi_tran_my_long	Thị trấn Mỹ Long	thị trấn	848
29422	xa_my_long_bac	Xã Mỹ Long Bắc	xã	848
29425	xa_my_long_nam	Xã Mỹ Long Nam	xã	848
29428	xa_my_hoa	Xã Mỹ Hòa	xã	848
29431	xa_vinh_kim	Xã Vĩnh Kim	xã	848
29434	xa_kim_hoa	Xã Kim Hòa	xã	848
29437	xa_hiep_hoa	Xã Hiệp Hòa	xã	848
29440	xa_thuan_hoa	Xã Thuận Hòa	xã	848
29443	xa_long_son	Xã Long Sơn	xã	848
29446	xa_nhi_truong	Xã Nhị Trường	xã	848
29449	xa_truong_tho	Xã Trường Thọ	xã	848
29452	xa_hiep_my_dong	Xã Hiệp Mỹ Đông	xã	848
29455	xa_hiep_my_tay	Xã Hiệp Mỹ Tây	xã	848
29458	xa_thanh_hoa_son	Xã Thạnh Hòa Sơn	xã	848
29461	thi_tran_tra_cu	Thị trấn Trà Cú	thị trấn	849
29462	thi_tran_dinh_an	Thị trấn Định An	thị trấn	849
29464	xa_phuoc_hung	Xã Phước Hưng	xã	849
29467	xa_tap_son	Xã Tập Sơn	xã	849
29470	xa_tan_son	Xã Tân Sơn	xã	849
29473	xa_an_quang_huu	Xã An Quảng Hữu	xã	849
29476	xa_luu_nghiep_anh	Xã Lưu Nghiệp Anh	xã	849
29479	xa_ngai_xuyen	Xã Ngãi Xuyên	xã	849
29482	xa_kim_son	Xã Kim Sơn	xã	849
29485	xa_thanh_son	Xã Thanh Sơn	xã	849
29488	xa_ham_giang	Xã Hàm Giang	xã	849
29489	xa_ham_tan	Xã Hàm Tân	xã	849
29491	xa_dai_an	Xã Đại An	xã	849
29494	xa_dinh_an	Xã Định An	xã	849
29503	xa_ngoc_bien	Xã Ngọc Biên	xã	849
29506	xa_long_hiep	Xã Long Hiệp	xã	849
29509	xa_tan_hiep	Xã Tân Hiệp	xã	849
29497	xa_don_xuan	Xã Đôn Xuân	xã	850
29500	xa_don_chau	Xã Đôn Châu	xã	850
29513	thi_tran_long_thanh	Thị trấn Long Thành	thị trấn	850
29521	xa_long_khanh	Xã Long Khánh	xã	850
29530	xa_ngu_lac	Xã Ngũ Lạc	xã	850
29533	xa_long_vinh	Xã Long Vĩnh	xã	850
29536	xa_dong_hai	Xã Đông Hải	xã	850
29512	phuong_1	Phường 1	phường	851
29515	xa_long_toan	Xã Long Toàn	xã	851
29516	phuong_2	Phường 2	phường	851
29518	xa_long_huu	Xã Long Hữu	xã	851
29524	xa_dan_thanh	Xã Dân Thành	xã	851
29527	xa_truong_long_hoa	Xã Trường Long Hòa	xã	851
29539	xa_hiep_thanh	Xã Hiệp Thạnh	xã	851
29542	phuong_9	Phường 9	phường	855
29545	phuong_5	Phường 5	phường	855
29548	phuong_1	Phường 1	phường	855
29551	phuong_2	Phường 2	phường	855
29554	phuong_4	Phường 4	phường	855
29557	phuong_3	Phường 3	phường	855
29560	phuong_8	Phường 8	phường	855
29563	phuong_tan_ngai	Phường Tân Ngãi	phường	855
29566	phuong_tan_hoa	Phường Tân Hòa	phường	855
29569	phuong_tan_hoi	Phường Tân Hội	phường	855
29572	phuong_truong_an	Phường Trường An	phường	855
29575	thi_tran_long_ho	Thị trấn Long Hồ	thị trấn	857
29578	xa_dong_phu	Xã Đồng Phú	xã	857
29581	xa_binh_hoa_phuoc	Xã Bình Hòa Phước	xã	857
29584	xa_hoa_ninh	Xã Hòa Ninh	xã	857
29587	xa_an_binh	Xã An Bình	xã	857
29590	xa_thanh_duc	Xã Thanh Đức	xã	857
29593	xa_tan_hanh	Xã Tân Hạnh	xã	857
29596	xa_phuoc_hau	Xã Phước Hậu	xã	857
29599	xa_long_phuoc	Xã Long Phước	xã	857
29602	xa_phu_duc	Xã Phú Đức	xã	857
29605	xa_loc_hoa	Xã Lộc Hòa	xã	857
29608	xa_long_an	Xã Long An	xã	857
29611	xa_phu_quoi	Xã Phú Quới	xã	857
29614	xa_thanh_quoi	Xã Thạnh Quới	xã	857
29617	xa_hoa_phu	Xã Hòa Phú	xã	857
29623	xa_my_an	Xã Mỹ An	xã	858
29626	xa_my_phuoc	Xã Mỹ Phước	xã	858
29629	xa_an_phuoc	Xã An Phước	xã	858
29632	xa_nhon_phu	Xã Nhơn Phú	xã	858
29635	xa_long_my	Xã Long Mỹ	xã	858
29638	xa_hoa_tinh	Xã Hòa Tịnh	xã	858
29641	thi_tran_cai_nhum	Thị trấn Cái Nhum	thị trấn	858
29644	xa_binh_phuoc	Xã Bình Phước	xã	858
29647	xa_chanh_an	Xã Chánh An	xã	858
29650	xa_tan_an_hoi	Xã Tân An Hội	xã	858
29653	xa_tan_long	Xã Tân Long	xã	858
29656	xa_tan_long_hoi	Xã Tân Long Hội	xã	858
29659	thi_tran_vung_liem	Thị trấn Vũng Liêm	thị trấn	859
29662	xa_tan_quoi_trung	Xã Tân Quới Trung	xã	859
29665	xa_quoi_thien	Xã Quới Thiện	xã	859
29668	xa_quoi_an	Xã Quới An	xã	859
29671	xa_trung_chanh	Xã Trung Chánh	xã	859
29674	xa_tan_an_luong	Xã Tân An Luông	xã	859
29677	xa_thanh_binh	Xã Thanh Bình	xã	859
29680	xa_trung_thanh_tay	Xã Trung Thành Tây	xã	859
29683	xa_trung_hiep	Xã Trung Hiệp	xã	859
29686	xa_hieu_phung	Xã Hiếu Phụng	xã	859
29689	xa_trung_thanh_dong	Xã Trung Thành Đông	xã	859
29692	xa_trung_thanh	Xã Trung Thành	xã	859
29695	xa_trung_hieu	Xã Trung Hiếu	xã	859
29698	xa_trung_ngai	Xã Trung Ngãi	xã	859
29701	xa_hieu_thuan	Xã Hiếu Thuận	xã	859
29704	xa_trung_nghia	Xã Trung Nghĩa	xã	859
29707	xa_trung_an	Xã Trung An	xã	859
29710	xa_hieu_nhon	Xã Hiếu Nhơn	xã	859
29713	xa_hieu_thanh	Xã Hiếu Thành	xã	859
29716	xa_hieu_nghia	Xã Hiếu Nghĩa	xã	859
29719	thi_tran_tam_binh	Thị trấn Tam Bình	thị trấn	860
29722	xa_tan_loc	Xã Tân Lộc	xã	860
29725	xa_phu_thinh	Xã Phú Thịnh	xã	860
29728	xa_hau_loc	Xã Hậu Lộc	xã	860
29731	xa_hoa_thanh	Xã Hòa Thạnh	xã	860
29734	xa_hoa_loc	Xã Hoà Lộc	xã	860
29737	xa_phu_loc	Xã Phú Lộc	xã	860
29740	xa_song_phu	Xã Song Phú	xã	860
29743	xa_hoa_hiep	Xã Hòa Hiệp	xã	860
29746	xa_my_loc	Xã Mỹ Lộc	xã	860
29749	xa_tan_phu	Xã Tân Phú	xã	860
29752	xa_long_phu	Xã Long Phú	xã	860
29755	xa_my_thanh_trung	Xã Mỹ Thạnh Trung	xã	860
29758	xa_tuong_loc	Xã Tường Lộc	xã	860
29761	xa_loan_my	Xã Loan Mỹ	xã	860
29764	xa_ngai_tu	Xã Ngãi Tứ	xã	860
29767	xa_binh_ninh	Xã Bình Ninh	xã	860
29770	phuong_cai_von	Phường Cái Vồn	phường	861
29771	phuong_thanh_phuoc	Phường Thành Phước	phường	861
29806	xa_thuan_an	Xã Thuận An	xã	861
29809	xa_dong_thanh	Xã Đông Thạnh	xã	861
29812	xa_dong_binh	Xã Đông Bình	xã	861
29813	phuong_dong_thuan	Phường Đông Thuận	phường	861
29815	xa_my_hoa	Xã Mỹ Hòa	xã	861
29818	xa_dong_thanh	Xã Đông Thành	xã	861
29821	thi_tran_tra_on	Thị trấn Trà Ôn	thị trấn	862
29824	xa_xuan_hiep	Xã Xuân Hiệp	xã	862
29827	xa_nhon_binh	Xã Nhơn Bình	xã	862
29830	xa_hoa_binh	Xã Hòa Bình	xã	862
29833	xa_thoi_hoa	Xã Thới Hòa	xã	862
29836	xa_tra_con	Xã Trà Côn	xã	862
29839	xa_tan_my	Xã Tân Mỹ	xã	862
29842	xa_huu_thanh	Xã Hựu Thành	xã	862
29845	xa_vinh_xuan	Xã Vĩnh Xuân	xã	862
29848	xa_thuan_thoi	Xã Thuận Thới	xã	862
29851	xa_phu_thanh	Xã Phú Thành	xã	862
29854	xa_thien_my	Xã Thiện Mỹ	xã	862
29857	xa_luc_sy_thanh	Xã Lục Sỹ Thành	xã	862
29860	xa_tich_thien	Xã Tích Thiện	xã	862
29773	xa_tan_hung	Xã Tân Hưng	xã	863
29776	xa_tan_thanh	Xã Tân Thành	xã	863
29779	xa_thanh_trung	Xã Thành Trung	xã	863
29782	xa_tan_an_thanh	Xã Tân An Thạnh	xã	863
29785	xa_tan_luoc	Xã Tân Lược	xã	863
29788	xa_nguyen_van_thanh	Xã Nguyễn Văn Thảnh	xã	863
29791	xa_thanh_loi	Xã Thành Lợi	xã	863
29794	xa_my_thuan	Xã Mỹ Thuận	xã	863
29797	xa_tan_binh	Xã Tân Bình	xã	863
29800	thi_tran_tan_quoi	Thị trấn Tân Quới	thị trấn	863
29863	phuong_11	Phường 11	phường	866
29866	phuong_1	Phường 1	phường	866
29869	phuong_2	Phường 2	phường	866
29872	phuong_4	Phường 4	phường	866
29875	phuong_3	Phường 3	phường	866
29878	phuong_6	Phường 6	phường	866
29881	xa_my_ngai	Xã Mỹ Ngãi	xã	866
29884	xa_my_tan	Xã Mỹ Tân	xã	866
29887	xa_my_tra	Xã Mỹ Trà	xã	866
29888	phuong_my_phu	Phường Mỹ Phú	phường	866
29890	xa_tan_thuan_tay	Xã Tân Thuận Tây	xã	866
29892	phuong_hoa_thuan	Phường Hoà Thuận	phường	866
29893	xa_hoa_an	Xã Hòa An	xã	866
29896	xa_tan_thuan_dong	Xã Tân Thuận Đông	xã	866
29899	xa_tinh_thoi	Xã Tịnh Thới	xã	866
29902	phuong_3	Phường 3	phường	867
29905	phuong_1	Phường 1	phường	867
29908	phuong_4	Phường 4	phường	867
29911	phuong_2	Phường 2	phường	867
29914	xa_tan_khanh_dong	Xã Tân Khánh Đông	xã	867
29917	phuong_tan_quy_dong	Phường Tân Quy Đông	phường	867
29919	phuong_an_hoa	Phường An Hoà	phường	867
29920	xa_tan_quy_tay	Xã Tân Quy Tây	xã	867
29923	xa_tan_phu_dong	Xã Tân Phú Đông	xã	867
29954	phuong_an_loc	Phường An Lộc	phường	868
29955	phuong_an_thanh	Phường An Thạnh	phường	868
29959	xa_binh_thanh	Xã Bình Thạnh	xã	868
29965	xa_tan_hoi	Xã Tân Hội	xã	868
29978	phuong_an_lac	Phường An Lạc	phường	868
29986	phuong_an_binh_b	Phường An Bình B	phường	868
29989	phuong_an_binh_a	Phường An Bình A	phường	868
29926	thi_tran_sa_rai	Thị trấn Sa Rài	thị trấn	869
29929	xa_tan_ho_co	Xã Tân Hộ Cơ	xã	869
29932	xa_thong_binh	Xã Thông Bình	xã	869
29935	xa_binh_phu	Xã Bình Phú	xã	869
29938	xa_tan_thanh_a	Xã Tân Thành A	xã	869
29941	xa_tan_thanh_b	Xã Tân Thành B	xã	869
29944	xa_tan_phuoc	Xã Tân Phước	xã	869
29947	xa_tan_cong_chi	Xã Tân Công Chí	xã	869
29950	xa_an_phuoc	Xã An Phước	xã	869
29956	xa_thuong_phuoc_1	Xã Thường Phước 1	xã	870
29962	xa_thuong_thoi_hau_a	Xã Thường Thới Hậu A	xã	870
29971	thi_tran_thuong_thoi_tien	Thị trấn Thường Thới Tiền	thị trấn	870
29974	xa_thuong_phuoc_2	Xã Thường Phước 2	xã	870
29977	xa_thuong_lac	Xã Thường Lạc	xã	870
29980	xa_long_khanh_a	Xã Long Khánh A	xã	870
29983	xa_long_khanh_b	Xã Long Khánh B	xã	870
29992	xa_long_thuan	Xã Long Thuận	xã	870
29995	xa_phu_thuan_b	Xã Phú Thuận B	xã	870
29998	xa_phu_thuan_a	Xã Phú Thuận A	xã	870
30001	thi_tran_tram_chim	Thị trấn Tràm Chim	thị trấn	871
30004	xa_hoa_binh	Xã Hoà Bình	xã	871
30007	xa_tan_cong_sinh	Xã Tân Công Sính	xã	871
30010	xa_phu_hiep	Xã Phú Hiệp	xã	871
30013	xa_phu_duc	Xã Phú Đức	xã	871
30016	xa_phu_thanh_b	Xã Phú Thành B	xã	871
30019	xa_an_hoa	Xã An Hòa	xã	871
30022	xa_an_long	Xã An Long	xã	871
30025	xa_phu_cuong	Xã Phú Cường	xã	871
30028	xa_phu_ninh	Xã Phú Ninh	xã	871
30031	xa_phu_tho	Xã Phú Thọ	xã	871
30034	xa_phu_thanh_a	Xã Phú Thành A	xã	871
30037	thi_tran_my_an	Thị trấn Mỹ An	thị trấn	872
30040	xa_thanh_loi	Xã Thạnh Lợi	xã	872
30043	xa_hung_thanh	Xã Hưng Thạnh	xã	872
30046	xa_truong_xuan	Xã Trường Xuân	xã	872
30049	xa_tan_kieu	Xã Tân Kiều	xã	872
30052	xa_my_hoa	Xã Mỹ Hòa	xã	872
30055	xa_my_quy	Xã Mỹ Quý	xã	872
30058	xa_my_dong	Xã Mỹ Đông	xã	872
30061	xa_doc_binh_kieu	Xã Đốc Binh Kiều	xã	872
30064	xa_my_an	Xã Mỹ An	xã	872
30067	xa_phu_dien	Xã Phú Điền	xã	872
30070	xa_lang_bien	Xã Láng Biển	xã	872
30073	xa_thanh_my	Xã Thanh Mỹ	xã	872
30076	thi_tran_my_tho	Thị trấn Mỹ Thọ	thị trấn	873
30079	xa_gao_giong	Xã Gáo Giồng	xã	873
30082	xa_phuong_thinh	Xã Phương Thịnh	xã	873
30085	xa_ba_sao	Xã Ba Sao	xã	873
30088	xa_phong_my	Xã Phong Mỹ	xã	873
30091	xa_tan_nghia	Xã Tân Nghĩa	xã	873
30094	xa_phuong_tra	Xã Phương Trà	xã	873
30097	xa_nhi_my	Xã Nhị Mỹ	xã	873
30100	xa_my_tho	Xã Mỹ Thọ	xã	873
30103	xa_tan_hoi_trung	Xã Tân Hội Trung	xã	873
30106	xa_an_binh	Xã An Bình	xã	873
30109	xa_my_hoi	Xã Mỹ Hội	xã	873
30112	xa_my_hiep	Xã Mỹ Hiệp	xã	873
30115	xa_my_long	Xã Mỹ Long	xã	873
30118	xa_binh_hang_trung	Xã Bình Hàng Trung	xã	873
30121	xa_my_xuong	Xã Mỹ Xương	xã	873
30124	xa_binh_hang_tay	Xã Bình Hàng Tây	xã	873
30127	xa_binh_thanh	Xã Bình Thạnh	xã	873
30130	thi_tran_thanh_binh	Thị trấn Thanh Bình	thị trấn	874
30133	xa_tan_quoi	Xã Tân Quới	xã	874
30136	xa_tan_hoa	Xã Tân Hòa	xã	874
30139	xa_an_phong	Xã An Phong	xã	874
30142	xa_phu_loi	Xã Phú Lợi	xã	874
30145	xa_tan_my	Xã Tân Mỹ	xã	874
30148	xa_binh_tan	Xã Bình Tấn	xã	874
30151	xa_tan_hue	Xã Tân Huề	xã	874
30154	xa_tan_binh	Xã Tân Bình	xã	874
30157	xa_tan_thanh	Xã Tân Thạnh	xã	874
30160	xa_tan_phu	Xã Tân Phú	xã	874
30163	xa_binh_thanh	Xã Bình Thành	xã	874
30166	xa_tan_long	Xã Tân Long	xã	874
30169	thi_tran_lap_vo	Thị trấn Lấp Vò	thị trấn	875
30172	xa_my_an_hung_a	Xã Mỹ An Hưng A	xã	875
30175	xa_tan_my	Xã Tân Mỹ	xã	875
30178	xa_my_an_hung_b	Xã Mỹ An Hưng B	xã	875
30181	xa_tan_khanh_trung	Xã Tân Khánh Trung	xã	875
30184	xa_long_hung_a	Xã Long Hưng A	xã	875
30187	xa_vinh_thanh	Xã Vĩnh Thạnh	xã	875
30190	xa_long_hung_b	Xã Long Hưng B	xã	875
30193	xa_binh_thanh	Xã Bình Thành	xã	875
30196	xa_dinh_an	Xã Định An	xã	875
30199	xa_dinh_yen	Xã Định Yên	xã	875
30202	xa_hoi_an_dong	Xã Hội An Đông	xã	875
30205	xa_binh_thanh_trung	Xã Bình Thạnh Trung	xã	875
30208	thi_tran_lai_vung	Thị trấn Lai Vung	thị trấn	876
30211	xa_tan_duong	Xã Tân Dương	xã	876
30214	xa_hoa_thanh	Xã Hòa Thành	xã	876
30217	xa_long_hau	Xã Long Hậu	xã	876
30220	xa_tan_phuoc	Xã Tân Phước	xã	876
30223	xa_hoa_long	Xã Hòa Long	xã	876
30226	xa_tan_thanh	Xã Tân Thành	xã	876
30229	xa_long_thang	Xã Long Thắng	xã	876
30232	xa_vinh_thoi	Xã Vĩnh Thới	xã	876
30235	xa_tan_hoa	Xã Tân Hòa	xã	876
30238	xa_dinh_hoa	Xã Định Hòa	xã	876
30241	xa_phong_hoa	Xã Phong Hòa	xã	876
30244	thi_tran_cai_tau_ha	Thị trấn Cái Tàu Hạ	thị trấn	877
30247	xa_an_hiep	Xã An Hiệp	xã	877
30250	xa_an_nhon	Xã An Nhơn	xã	877
30253	xa_tan_nhuan_dong	Xã Tân Nhuận Đông	xã	877
30256	xa_tan_binh	Xã Tân Bình	xã	877
30259	xa_tan_phu_trung	Xã Tân Phú Trung	xã	877
30262	xa_phu_long	Xã Phú Long	xã	877
30265	xa_an_phu_thuan	Xã An Phú Thuận	xã	877
30268	xa_phu_huu	Xã Phú Hựu	xã	877
30271	xa_an_khanh	Xã An Khánh	xã	877
30274	xa_tan_phu	Xã Tân Phú	xã	877
30277	xa_hoa_tan	Xã Hòa Tân	xã	877
30280	phuong_my_binh	Phường Mỹ Bình	phường	883
30283	phuong_my_long	Phường Mỹ Long	phường	883
30285	phuong_dong_xuyen	Phường Đông Xuyên	phường	883
30286	phuong_my_xuyen	Phường Mỹ Xuyên	phường	883
30289	phuong_binh_duc	Phường Bình Đức	phường	883
30292	phuong_binh_khanh	Phường Bình Khánh	phường	883
30295	phuong_my_phuoc	Phường Mỹ Phước	phường	883
30298	phuong_my_quy	Phường Mỹ Quý	phường	883
30301	phuong_my_thoi	Phường Mỹ Thới	phường	883
30304	phuong_my_thanh	Phường Mỹ Thạnh	phường	883
30307	phuong_my_hoa	Phường Mỹ Hòa	phường	883
30310	xa_my_khanh	Xã Mỹ Khánh	xã	883
30313	xa_my_hoa_hung	Xã Mỹ Hoà Hưng	xã	883
30316	phuong_chau_phu_b	Phường Châu Phú B	phường	884
30319	phuong_chau_phu_a	Phường Châu Phú A	phường	884
30322	phuong_vinh_my	Phường Vĩnh Mỹ	phường	884
30325	phuong_nui_sam	Phường Núi Sam	phường	884
30328	phuong_vinh_nguon	Phường Vĩnh Ngươn	phường	884
30331	xa_vinh_te	Xã Vĩnh Tế	xã	884
30334	xa_vinh_chau	Xã Vĩnh Châu	xã	884
30337	thi_tran_an_phu	Thị trấn An Phú	thị trấn	886
30340	xa_khanh_an	Xã Khánh An	xã	886
30341	thi_tran_long_binh	Thị trấn Long Bình	thị trấn	886
30343	xa_khanh_binh	Xã Khánh Bình	xã	886
30346	xa_quoc_thai	Xã Quốc Thái	xã	886
30349	xa_nhon_hoi	Xã Nhơn Hội	xã	886
30352	xa_phu_huu	Xã Phú Hữu	xã	886
30355	xa_phu_hoi	Xã Phú Hội	xã	886
30358	xa_phuoc_hung	Xã Phước Hưng	xã	886
30361	xa_vinh_loc	Xã Vĩnh Lộc	xã	886
30364	xa_vinh_hau	Xã Vĩnh Hậu	xã	886
30367	xa_vinh_truong	Xã Vĩnh Trường	xã	886
30370	xa_vinh_hoi_dong	Xã Vĩnh Hội Đông	xã	886
30373	xa_da_phuoc	Xã Đa Phước	xã	886
30376	phuong_long_thanh	Phường Long Thạnh	phường	887
30377	phuong_long_hung	Phường Long Hưng	phường	887
30378	phuong_long_chau	Phường Long Châu	phường	887
30379	xa_phu_loc	Xã Phú Lộc	xã	887
30382	xa_vinh_xuong	Xã Vĩnh Xương	xã	887
30385	xa_vinh_hoa	Xã Vĩnh Hòa	xã	887
30387	xa_tan_thanh	Xã Tân Thạnh	xã	887
30388	xa_tan_an	Xã Tân An	xã	887
30391	xa_long_an	Xã Long An	xã	887
30394	phuong_long_phu	Phường Long Phú	phường	887
30397	xa_chau_phong	Xã Châu Phong	xã	887
30400	xa_phu_vinh	Xã Phú Vĩnh	xã	887
30403	xa_le_chanh	Xã Lê Chánh	xã	887
30412	phuong_long_son	Phường Long Sơn	phường	887
30406	thi_tran_phu_my	Thị trấn Phú Mỹ	thị trấn	888
30409	thi_tran_cho_vam	Thị trấn Chợ Vàm	thị trấn	888
30415	xa_long_hoa	Xã Long Hoà	xã	888
30418	xa_phu_long	Xã Phú Long	xã	888
30421	xa_phu_lam	Xã Phú Lâm	xã	888
30424	xa_phu_hiep	Xã Phú Hiệp	xã	888
30427	xa_phu_thanh	Xã Phú Thạnh	xã	888
30430	xa_hoa_lac	Xã Hoà Lạc	xã	888
30433	xa_phu_thanh	Xã Phú Thành	xã	888
30436	xa_phu_an	Xã Phú An	xã	888
30439	xa_phu_xuan	Xã Phú Xuân	xã	888
30442	xa_hiep_xuong	Xã Hiệp Xương	xã	888
30445	xa_phu_binh	Xã Phú Bình	xã	888
30448	xa_phu_tho	Xã Phú Thọ	xã	888
30451	xa_phu_hung	Xã Phú Hưng	xã	888
30454	xa_binh_thanh_dong	Xã Bình Thạnh Đông	xã	888
30457	xa_tan_hoa	Xã Tân Hòa	xã	888
30460	xa_tan_trung	Xã Tân Trung	xã	888
30463	thi_tran_cai_dau	Thị trấn Cái Dầu	thị trấn	889
30466	xa_khanh_hoa	Xã Khánh Hòa	xã	889
30469	xa_my_duc	Xã Mỹ Đức	xã	889
30472	xa_my_phu	Xã Mỹ Phú	xã	889
30475	xa_o_long_vy	Xã Ô Long Vỹ	xã	889
30478	thi_tran_vinh_thanh_trung	Thị trấn Vĩnh Thạnh Trung	thị trấn	889
30481	xa_thanh_my_tay	Xã Thạnh Mỹ Tây	xã	889
30484	xa_binh_long	Xã Bình Long	xã	889
30487	xa_binh_my	Xã Bình Mỹ	xã	889
30490	xa_binh_thuy	Xã Bình Thủy	xã	889
30493	xa_dao_huu_canh	Xã Đào Hữu Cảnh	xã	889
30496	xa_binh_phu	Xã Bình Phú	xã	889
30499	xa_binh_chanh	Xã Bình Chánh	xã	889
30502	thi_tran_nha_bang	Thị trấn Nhà Bàng	thị trấn	890
30505	thi_tran_chi_lang	Thị trấn Chi Lăng	thị trấn	890
30508	xa_nui_voi	Xã Núi Voi	xã	890
30511	xa_nhon_hung	Xã Nhơn Hưng	xã	890
30514	xa_an_phu	Xã An Phú	xã	890
30517	xa_thoi_son	Xã Thới Sơn	xã	890
30520	thi_tran_tinh_bien	Thị trấn Tịnh Biên	thị trấn	890
30523	xa_van_giao	Xã Văn Giáo	xã	890
30526	xa_an_cu	Xã An Cư	xã	890
30529	xa_an_nong	Xã An Nông	xã	890
30532	xa_vinh_trung	Xã Vĩnh Trung	xã	890
30535	xa_tan_loi	Xã Tân Lợi	xã	890
30538	xa_an_hao	Xã An Hảo	xã	890
30541	xa_tan_lap	Xã Tân Lập	xã	890
30544	thi_tran_tri_ton	Thị trấn Tri Tôn	thị trấn	891
30547	thi_tran_ba_chuc	Thị trấn Ba Chúc	thị trấn	891
30550	xa_lac_quoi	Xã Lạc Quới	xã	891
30553	xa_le_tri	Xã Lê Trì	xã	891
30556	xa_vinh_gia	Xã Vĩnh Gia	xã	891
30559	xa_vinh_phuoc	Xã Vĩnh Phước	xã	891
30562	xa_chau_lang	Xã Châu Lăng	xã	891
30565	xa_luong_phi	Xã Lương Phi	xã	891
30568	xa_luong_an_tra	Xã Lương An Trà	xã	891
30571	xa_ta_danh	Xã Tà Đảnh	xã	891
30574	xa_nui_to	Xã Núi Tô	xã	891
30577	xa_an_tuc	Xã An Tức	xã	891
30580	thi_tran_co_to	Thị trấn Cô Tô	thị trấn	891
30583	xa_tan_tuyen	Xã Tân Tuyến	xã	891
30586	xa_o_lam	Xã Ô Lâm	xã	891
30589	thi_tran_an_chau	Thị trấn An Châu	thị trấn	892
30592	xa_an_hoa	Xã An Hòa	xã	892
30595	xa_can_dang	Xã Cần Đăng	xã	892
30598	xa_vinh_hanh	Xã Vĩnh Hanh	xã	892
30601	xa_binh_thanh	Xã Bình Thạnh	xã	892
30604	thi_tran_vinh_binh	Thị trấn Vĩnh Bình	thị trấn	892
30607	xa_binh_hoa	Xã Bình Hòa	xã	892
30610	xa_vinh_an	Xã Vĩnh An	xã	892
30613	xa_hoa_binh_thanh	Xã Hòa Bình Thạnh	xã	892
30616	xa_vinh_loi	Xã Vĩnh Lợi	xã	892
30619	xa_vinh_nhuan	Xã Vĩnh Nhuận	xã	892
30622	xa_tan_phu	Xã Tân Phú	xã	892
30625	xa_vinh_thanh	Xã Vĩnh Thành	xã	892
30628	thi_tran_cho_moi	Thị trấn Chợ Mới	thị trấn	893
30631	thi_tran_my_luong	Thị trấn Mỹ Luông	thị trấn	893
30634	xa_kien_an	Xã Kiến An	xã	893
30637	xa_my_hoi_dong	Xã Mỹ Hội Đông	xã	893
30640	xa_long_dien_a	Xã Long Điền A	xã	893
30643	xa_tan_my	Xã Tấn Mỹ	xã	893
30646	xa_long_dien_b	Xã Long Điền B	xã	893
30649	xa_kien_thanh	Xã Kiến Thành	xã	893
30652	xa_my_hiep	Xã Mỹ Hiệp	xã	893
30655	xa_my_an	Xã Mỹ An	xã	893
30658	xa_nhon_my	Xã Nhơn Mỹ	xã	893
30661	xa_long_giang	Xã Long Giang	xã	893
30664	xa_long_kien	Xã Long Kiến	xã	893
30667	xa_binh_phuoc_xuan	Xã Bình Phước Xuân	xã	893
30670	xa_an_thanh_trung	Xã An Thạnh Trung	xã	893
30673	xa_hoi_an	Xã Hội An	xã	893
30676	xa_hoa_binh	Xã Hòa Bình	xã	893
30679	xa_hoa_an	Xã Hòa An	xã	893
30682	thi_tran_nui_sap	Thị trấn Núi Sập	thị trấn	894
30685	thi_tran_phu_hoa	Thị trấn Phú Hoà	thị trấn	894
30688	thi_tran_oc_eo	Thị trấn Óc Eo	thị trấn	894
30691	xa_tay_phu	Xã Tây Phú	xã	894
30692	xa_an_binh	Xã An Bình	xã	894
30694	xa_vinh_phu	Xã Vĩnh Phú	xã	894
30697	xa_vinh_trach	Xã Vĩnh Trạch	xã	894
30700	xa_phu_thuan	Xã Phú Thuận	xã	894
30703	xa_vinh_chanh	Xã Vĩnh Chánh	xã	894
30706	xa_dinh_my	Xã Định Mỹ	xã	894
30709	xa_dinh_thanh	Xã Định Thành	xã	894
30712	xa_my_phu_dong	Xã Mỹ Phú Đông	xã	894
30715	xa_vong_dong	Xã Vọng Đông	xã	894
30718	xa_vinh_khanh	Xã Vĩnh Khánh	xã	894
30721	xa_thoai_giang	Xã Thoại Giang	xã	894
30724	xa_binh_thanh	Xã Bình Thành	xã	894
30727	xa_vong_the	Xã Vọng Thê	xã	894
30730	phuong_vinh_thanh_van	Phường Vĩnh Thanh Vân	phường	899
30733	phuong_vinh_thanh	Phường Vĩnh Thanh	phường	899
30736	phuong_vinh_quang	Phường Vĩnh Quang	phường	899
30739	phuong_vinh_hiep	Phường Vĩnh Hiệp	phường	899
30742	phuong_vinh_bao	Phường Vĩnh Bảo	phường	899
30745	phuong_vinh_lac	Phường Vĩnh Lạc	phường	899
30748	phuong_an_hoa	Phường An Hòa	phường	899
30751	phuong_an_binh	Phường An Bình	phường	899
30754	phuong_rach_soi	Phường Rạch Sỏi	phường	899
30757	phuong_vinh_loi	Phường Vĩnh Lợi	phường	899
30760	phuong_vinh_thong	Phường Vĩnh Thông	phường	899
30763	xa_phi_thong	Xã Phi Thông	xã	899
30766	phuong_to_chau	Phường Tô Châu	phường	900
30769	phuong_dong_ho	Phường Đông Hồ	phường	900
30772	phuong_binh_san	Phường Bình San	phường	900
30775	phuong_phao_dai	Phường Pháo Đài	phường	900
30778	phuong_my_duc	Phường Mỹ Đức	phường	900
30781	xa_tien_hai	Xã Tiên Hải	xã	900
30784	xa_thuan_yen	Xã Thuận Yên	xã	900
30787	thi_tran_kien_luong	Thị trấn Kiên Lương	thị trấn	902
30790	xa_kien_binh	Xã Kiên Bình	xã	902
30802	xa_hoa_dien	Xã Hòa Điền	xã	902
30805	xa_duong_hoa	Xã Dương Hòa	xã	902
30808	xa_binh_an	Xã Bình An	xã	902
30809	xa_binh_tri	Xã Bình Trị	xã	902
30811	xa_son_hai	Xã Sơn Hải	xã	902
30814	xa_hon_nghe	Xã Hòn Nghệ	xã	902
30817	thi_tran_hon_dat	Thị trấn Hòn Đất	thị trấn	903
30820	thi_tran_soc_son	Thị trấn Sóc Sơn	thị trấn	903
30823	xa_binh_son	Xã Bình Sơn	xã	903
30826	xa_binh_giang	Xã Bình Giang	xã	903
30828	xa_my_thai	Xã Mỹ Thái	xã	903
30829	xa_nam_thai_son	Xã Nam Thái Sơn	xã	903
30832	xa_my_hiep_son	Xã Mỹ Hiệp Sơn	xã	903
30835	xa_son_kien	Xã Sơn Kiên	xã	903
30836	xa_son_binh	Xã Sơn Bình	xã	903
30838	xa_my_thuan	Xã Mỹ Thuận	xã	903
30840	xa_linh_huynh	Xã Lình Huỳnh	xã	903
30841	xa_tho_son	Xã Thổ Sơn	xã	903
30844	xa_my_lam	Xã Mỹ Lâm	xã	903
30847	xa_my_phuoc	Xã Mỹ Phước	xã	903
30850	thi_tran_tan_hiep	Thị trấn Tân Hiệp	thị trấn	904
30853	xa_tan_hoi	Xã Tân Hội	xã	904
30856	xa_tan_thanh	Xã Tân Thành	xã	904
30859	xa_tan_hiep_b	Xã Tân Hiệp B	xã	904
30860	xa_tan_hoa	Xã Tân Hoà	xã	904
30862	xa_thanh_dong_b	Xã Thạnh Đông B	xã	904
30865	xa_thanh_dong	Xã Thạnh Đông	xã	904
30868	xa_tan_hiep_a	Xã Tân Hiệp A	xã	904
30871	xa_tan_an	Xã Tân An	xã	904
30874	xa_thanh_dong_a	Xã Thạnh Đông A	xã	904
30877	xa_thanh_tri	Xã Thạnh Trị	xã	904
30880	thi_tran_minh_luong	Thị trấn Minh Lương	thị trấn	905
30883	xa_mong_tho_a	Xã Mong Thọ A	xã	905
30886	xa_mong_tho_b	Xã Mong Thọ B	xã	905
30887	xa_mong_tho	Xã Mong Thọ	xã	905
30889	xa_giuc_tuong	Xã Giục Tượng	xã	905
30892	xa_vinh_hoa_hiep	Xã Vĩnh Hòa Hiệp	xã	905
30893	xa_vinh_hoa_phu	Xã Vĩnh Hoà Phú	xã	905
30895	xa_minh_hoa	Xã Minh Hòa	xã	905
30898	xa_binh_an	Xã Bình An	xã	905
30901	xa_thanh_loc	Xã Thạnh Lộc	xã	905
30904	thi_tran_giong_rieng	Thị trấn Giồng Riềng	thị trấn	906
30907	xa_thanh_hung	Xã Thạnh Hưng	xã	906
30910	xa_thanh_phuoc	Xã Thạnh Phước	xã	906
30913	xa_thanh_loc	Xã Thạnh Lộc	xã	906
30916	xa_thanh_hoa	Xã Thạnh Hòa	xã	906
30917	xa_thanh_binh	Xã Thạnh Bình	xã	906
30919	xa_ban_thach	Xã Bàn Thạch	xã	906
30922	xa_ban_tan_dinh	Xã Bàn Tân Định	xã	906
30925	xa_ngoc_thanh	Xã Ngọc Thành	xã	906
30928	xa_ngoc_chuc	Xã Ngọc Chúc	xã	906
30931	xa_ngoc_thuan	Xã Ngọc Thuận	xã	906
30934	xa_hoa_hung	Xã Hòa Hưng	xã	906
30937	xa_hoa_loi	Xã Hoà Lợi	xã	906
30940	xa_hoa_an	Xã Hoà An	xã	906
30943	xa_long_thanh	Xã Long Thạnh	xã	906
30946	xa_vinh_thanh	Xã Vĩnh Thạnh	xã	906
30947	xa_vinh_phu	Xã Vĩnh Phú	xã	906
30949	xa_hoa_thuan	Xã Hòa Thuận	xã	906
30950	xa_ngoc_hoa	Xã Ngọc Hoà	xã	906
30952	thi_tran_go_quao	Thị trấn Gò Quao	thị trấn	907
30955	xa_vinh_hoa_hung_bac	Xã Vĩnh Hòa Hưng Bắc	xã	907
30958	xa_dinh_hoa	Xã Định Hòa	xã	907
30961	xa_thoi_quan	Xã Thới Quản	xã	907
30964	xa_dinh_an	Xã Định An	xã	907
30967	xa_thuy_lieu	Xã Thủy Liễu	xã	907
30970	xa_vinh_hoa_hung_nam	Xã Vĩnh Hòa Hưng Nam	xã	907
30973	xa_vinh_phuoc_a	Xã Vĩnh Phước A	xã	907
30976	xa_vinh_phuoc_b	Xã Vĩnh Phước B	xã	907
30979	xa_vinh_tuy	Xã Vĩnh Tuy	xã	907
30982	xa_vinh_thang	Xã Vĩnh Thắng	xã	907
30985	thi_tran_thu_ba	Thị trấn Thứ Ba	thị trấn	908
30988	xa_tay_yen	Xã Tây Yên	xã	908
30991	xa_tay_yen_a	Xã Tây Yên A	xã	908
30994	xa_nam_yen	Xã Nam Yên	xã	908
30997	xa_hung_yen	Xã Hưng Yên	xã	908
31000	xa_nam_thai	Xã Nam Thái	xã	908
31003	xa_nam_thai_a	Xã Nam Thái A	xã	908
31006	xa_dong_thai	Xã Đông Thái	xã	908
31009	xa_dong_yen	Xã Đông Yên	xã	908
31018	thi_tran_thu_muoi_mot	Thị trấn Thứ Mười Một	thị trấn	909
31021	xa_thuan_hoa	Xã Thuận Hoà	xã	909
31024	xa_dong_hoa	Xã Đông Hòa	xã	909
31030	xa_dong_thanh	Xã Đông Thạnh	xã	909
31031	xa_tan_thanh	Xã Tân Thạnh	xã	909
31033	xa_dong_hung	Xã Đông Hưng	xã	909
31036	xa_dong_hung_a	Xã Đông Hưng A	xã	909
31039	xa_dong_hung_b	Xã Đông Hưng B	xã	909
31042	xa_van_khanh	Xã Vân Khánh	xã	909
31045	xa_van_khanh_dong	Xã Vân Khánh Đông	xã	909
31048	xa_van_khanh_tay	Xã Vân Khánh Tây	xã	909
31051	thi_tran_vinh_thuan	Thị trấn Vĩnh Thuận	thị trấn	910
31060	xa_vinh_binh_bac	Xã Vĩnh Bình Bắc	xã	910
31063	xa_vinh_binh_nam	Xã Vĩnh Bình Nam	xã	910
31064	xa_binh_minh	Xã Bình Minh	xã	910
31069	xa_vinh_thuan	Xã Vĩnh Thuận	xã	910
31072	xa_tan_thuan	Xã Tân Thuận	xã	910
31074	xa_phong_dong	Xã Phong Đông	xã	910
31075	xa_vinh_phong	Xã Vĩnh Phong	xã	910
31078	phuong_duong_dong	Phường Dương Đông	phường	911
31081	phuong_an_thoi	Phường An Thới	phường	911
31084	xa_cua_can	Xã Cửa Cạn	xã	911
31087	xa_ganh_dau	Xã Gành Dầu	xã	911
31090	xa_cua_duong	Xã Cửa Dương	xã	911
31093	xa_ham_ninh	Xã Hàm Ninh	xã	911
31096	xa_duong_to	Xã Dương Tơ	xã	911
31102	xa_bai_thom	Xã Bãi Thơm	xã	911
31105	xa_tho_chau	Xã Thổ Châu	xã	911
31108	xa_hon_tre	Xã Hòn Tre	xã	912
31111	xa_lai_son	Xã Lại Sơn	xã	912
31114	xa_an_son	Xã An Sơn	xã	912
31115	xa_nam_du	Xã Nam Du	xã	912
31012	xa_thanh_yen	Xã Thạnh Yên	xã	913
31015	xa_thanh_yen_a	Xã Thạnh Yên A	xã	913
31027	xa_an_minh_bac	Xã An Minh Bắc	xã	913
31054	xa_vinh_hoa	Xã Vĩnh Hòa	xã	913
31057	xa_hoa_chanh	Xã Hoà Chánh	xã	913
31066	xa_minh_thuan	Xã Minh Thuận	xã	913
30791	xa_vinh_phu	Xã Vĩnh Phú	xã	914
30793	xa_vinh_dieu	Xã Vĩnh Điều	xã	914
30796	xa_tan_khanh_hoa	Xã Tân Khánh Hòa	xã	914
30797	xa_phu_loi	Xã Phú Lợi	xã	914
30799	xa_phu_my	Xã Phú Mỹ	xã	914
31117	phuong_cai_khe	Phường Cái Khế	phường	916
31120	phuong_an_hoa	Phường An Hòa	phường	916
31123	phuong_thoi_binh	Phường Thới Bình	phường	916
31126	phuong_an_nghiep	Phường An Nghiệp	phường	916
31129	phuong_an_cu	Phường An Cư	phường	916
31135	phuong_tan_an	Phường Tân An	phường	916
31141	phuong_an_phu	Phường An Phú	phường	916
31144	phuong_xuan_khanh	Phường Xuân Khánh	phường	916
31147	phuong_hung_loi	Phường Hưng Lợi	phường	916
31149	phuong_an_khanh	Phường An Khánh	phường	916
31150	phuong_an_binh	Phường An Bình	phường	916
31153	phuong_chau_van_liem	Phường Châu Văn Liêm	phường	917
31154	phuong_thoi_hoa	Phường Thới Hòa	phường	917
31156	phuong_thoi_long	Phường Thới Long	phường	917
31157	phuong_long_hung	Phường Long Hưng	phường	917
31159	phuong_thoi_an	Phường Thới An	phường	917
31162	phuong_phuoc_thoi	Phường Phước Thới	phường	917
31165	phuong_truong_lac	Phường Trường Lạc	phường	917
31168	phuong_binh_thuy	Phường Bình Thủy	phường	918
31169	phuong_tra_an	Phường Trà An	phường	918
31171	phuong_tra_noc	Phường Trà Nóc	phường	918
31174	phuong_thoi_an_dong	Phường Thới An Đông	phường	918
31177	phuong_an_thoi	Phường An Thới	phường	918
31178	phuong_bui_huu_nghia	Phường Bùi Hữu Nghĩa	phường	918
31180	phuong_long_hoa	Phường Long Hòa	phường	918
31183	phuong_long_tuyen	Phường Long Tuyền	phường	918
31186	phuong_le_binh	Phường Lê Bình	phường	919
31189	phuong_hung_phu	Phường Hưng Phú	phường	919
31192	phuong_hung_thanh	Phường Hưng Thạnh	phường	919
31195	phuong_ba_lang	Phường Ba Láng	phường	919
31198	phuong_thuong_thanh	Phường Thường Thạnh	phường	919
31201	phuong_phu_thu	Phường Phú Thứ	phường	919
31204	phuong_tan_phu	Phường Tân Phú	phường	919
31207	phuong_thot_not	Phường Thốt Nốt	phường	923
31210	phuong_thoi_thuan	Phường Thới Thuận	phường	923
31212	phuong_thuan_an	Phường Thuận An	phường	923
31213	phuong_tan_loc	Phường Tân Lộc	phường	923
31216	phuong_trung_nhut	Phường Trung Nhứt	phường	923
31217	phuong_thanh_hoa	Phường Thạnh Hoà	phường	923
31219	phuong_trung_kien	Phường Trung Kiên	phường	923
31227	phuong_tan_hung	Phường Tân Hưng	phường	923
31228	phuong_thuan_hung	Phường Thuận Hưng	phường	923
31211	xa_vinh_binh	Xã Vĩnh Bình	xã	924
31231	thi_tran_thanh_an	Thị trấn Thanh An	thị trấn	924
31232	thi_tran_vinh_thanh	Thị trấn Vĩnh Thạnh	thị trấn	924
31234	xa_thanh_my	Xã Thạnh Mỹ	xã	924
31237	xa_vinh_trinh	Xã Vĩnh Trinh	xã	924
31240	xa_thanh_an	Xã Thạnh An	xã	924
31241	xa_thanh_tien	Xã Thạnh Tiến	xã	924
31243	xa_thanh_thang	Xã Thạnh Thắng	xã	924
31244	xa_thanh_loi	Xã Thạnh Lợi	xã	924
31246	xa_thanh_quoi	Xã Thạnh Qưới	xã	924
31252	xa_thanh_loc	Xã Thạnh Lộc	xã	924
31222	xa_trung_an	Xã Trung An	xã	925
31225	xa_trung_thanh	Xã Trung Thạnh	xã	925
31249	xa_thanh_phu	Xã Thạnh Phú	xã	925
31255	xa_trung_hung	Xã Trung Hưng	xã	925
31261	thi_tran_co_do	Thị trấn Cờ Đỏ	thị trấn	925
31264	xa_thoi_hung	Xã Thới Hưng	xã	925
31273	xa_dong_hiep	Xã Đông Hiệp	xã	925
31274	xa_dong_thang	Xã Đông Thắng	xã	925
31276	xa_thoi_dong	Xã Thới Đông	xã	925
31277	xa_thoi_xuan	Xã Thới Xuân	xã	925
31299	thi_tran_phong_dien	Thị trấn Phong Điền	thị trấn	926
31300	xa_nhon_ai	Xã Nhơn Ái	xã	926
31303	xa_giai_xuan	Xã Giai Xuân	xã	926
31306	xa_tan_thoi	Xã Tân Thới	xã	926
31309	xa_truong_long	Xã Trường Long	xã	926
31312	xa_my_khanh	Xã Mỹ Khánh	xã	926
31315	xa_nhon_nghia	Xã Nhơn Nghĩa	xã	926
31258	thi_tran_thoi_lai	Thị trấn Thới Lai	thị trấn	927
31267	xa_thoi_thanh	Xã Thới Thạnh	xã	927
31268	xa_tan_thanh	Xã Tân Thạnh	xã	927
31270	xa_xuan_thang	Xã Xuân Thắng	xã	927
31279	xa_dong_binh	Xã Đông Bình	xã	927
31282	xa_dong_thuan	Xã Đông Thuận	xã	927
31285	xa_thoi_tan	Xã Thới Tân	xã	927
31286	xa_truong_thang	Xã Trường Thắng	xã	927
31288	xa_dinh_mon	Xã Định Môn	xã	927
31291	xa_truong_thanh	Xã Trường Thành	xã	927
31294	xa_truong_xuan	Xã Trường Xuân	xã	927
31297	xa_truong_xuan_a	Xã Trường Xuân A	xã	927
31298	xa_truong_xuan_b	Xã Trường Xuân B	xã	927
31318	phuong_i	Phường I	phường	930
31321	phuong_iii	Phường III	phường	930
31324	phuong_iv	Phường IV	phường	930
31327	phuong_v	Phường V	phường	930
31330	phuong_vii	Phường VII	phường	930
31333	xa_vi_tan	Xã Vị Tân	xã	930
31336	xa_hoa_luu	Xã Hoả Lựu	xã	930
31338	xa_tan_tien	Xã Tân Tiến	xã	930
31339	xa_hoa_tien	Xã Hoả Tiến	xã	930
31340	phuong_nga_bay	Phường Ngã Bảy	phường	931
31341	phuong_lai_hieu	Phường Lái Hiếu	phường	931
31343	phuong_hiep_thanh	Phường Hiệp Thành	phường	931
31344	phuong_hiep_loi	Phường Hiệp Lợi	phường	931
31411	xa_dai_thanh	Xã Đại Thành	xã	931
31414	xa_tan_thanh	Xã Tân Thành	xã	931
31342	thi_tran_mot_ngan	Thị trấn Một Ngàn	thị trấn	932
31345	xa_tan_hoa	Xã Tân Hoà	xã	932
31346	thi_tran_bay_ngan	Thị trấn Bảy Ngàn	thị trấn	932
31348	xa_truong_long_tay	Xã Trường Long Tây	xã	932
31351	xa_truong_long_a	Xã Trường Long A	xã	932
31357	xa_nhon_nghia_a	Xã Nhơn Nghĩa A	xã	932
31359	thi_tran_rach_goi	Thị trấn Rạch Gòi	thị trấn	932
31360	xa_thanh_xuan	Xã Thạnh Xuân	xã	932
31362	thi_tran_cai_tac	Thị trấn Cái Tắc	thị trấn	932
31363	xa_tan_phu_thanh	Xã Tân Phú Thạnh	xã	932
31366	thi_tran_nga_sau	Thị trấn Ngã Sáu	thị trấn	933
31369	xa_dong_thanh	Xã Đông Thạnh	xã	933
31375	xa_dong_phu	Xã Đông Phú	xã	933
31378	xa_phu_huu	Xã Phú Hữu	xã	933
31379	xa_phu_tan	Xã Phú Tân	xã	933
31381	thi_tran_mai_dam	Thị trấn Mái Dầm	thị trấn	933
31384	xa_dong_phuoc	Xã Đông Phước	xã	933
31387	xa_dong_phuoc_a	Xã Đông Phước A	xã	933
31393	thi_tran_kinh_cung	Thị trấn Kinh Cùng	thị trấn	934
31396	thi_tran_cay_duong	Thị trấn Cây Dương	thị trấn	934
31399	xa_tan_binh	Xã Tân Bình	xã	934
31402	xa_binh_thanh	Xã Bình Thành	xã	934
31405	xa_thanh_hoa	Xã Thạnh Hòa	xã	934
31408	xa_long_thanh	Xã Long Thạnh	xã	934
31417	xa_phung_hiep	Xã Phụng Hiệp	xã	934
31420	xa_hoa_my	Xã Hòa Mỹ	xã	934
31423	xa_hoa_an	Xã Hòa An	xã	934
31426	xa_phuong_binh	Xã Phương Bình	xã	934
31429	xa_hiep_hung	Xã Hiệp Hưng	xã	934
31432	xa_tan_phuoc_hung	Xã Tân Phước Hưng	xã	934
31433	thi_tran_bung_tau	Thị trấn Búng Tàu	thị trấn	934
31435	xa_phuong_phu	Xã Phương Phú	xã	934
31438	xa_tan_long	Xã Tân Long	xã	934
31441	thi_tran_nang_mau	Thị trấn Nàng Mau	thị trấn	935
31444	xa_vi_trung	Xã Vị Trung	xã	935
31447	xa_vi_thuy	Xã Vị Thuỷ	xã	935
31450	xa_vi_thang	Xã Vị Thắng	xã	935
31453	xa_vinh_thuan_tay	Xã Vĩnh Thuận Tây	xã	935
31456	xa_vinh_trung	Xã Vĩnh Trung	xã	935
31459	xa_vinh_tuong	Xã Vĩnh Tường	xã	935
31462	xa_vi_dong	Xã Vị Đông	xã	935
31465	xa_vi_thanh	Xã Vị Thanh	xã	935
31468	xa_vi_binh	Xã Vị Bình	xã	935
31483	xa_thuan_hung	Xã Thuận Hưng	xã	936
31484	xa_thuan_hoa	Xã Thuận Hòa	xã	936
31486	xa_vinh_thuan_dong	Xã Vĩnh Thuận Đông	xã	936
31489	thi_tran_vinh_vien	Thị trấn Vĩnh Viễn	thị trấn	936
31490	xa_vinh_vien_a	Xã Vĩnh Viễn A	xã	936
31492	xa_luong_tam	Xã Lương Tâm	xã	936
31493	xa_luong_nghia	Xã Lương Nghĩa	xã	936
31495	xa_xa_phien	Xã Xà Phiên	xã	936
31471	phuong_thuan_an	Phường Thuận An	phường	937
31472	phuong_tra_long	Phường Trà Lồng	phường	937
31473	phuong_binh_thanh	Phường Bình Thạnh	phường	937
31474	xa_long_binh	Xã Long Bình	xã	937
31475	phuong_vinh_tuong	Phường Vĩnh Tường	phường	937
31477	xa_long_tri	Xã Long Trị	xã	937
31478	xa_long_tri_a	Xã Long Trị A	xã	937
31480	xa_long_phu	Xã Long Phú	xã	937
31481	xa_tan_phu	Xã Tân Phú	xã	937
31498	phuong_5	Phường 5	phường	941
31501	phuong_7	Phường 7	phường	941
31504	phuong_8	Phường 8	phường	941
31507	phuong_6	Phường 6	phường	941
31510	phuong_2	Phường 2	phường	941
31513	phuong_1	Phường 1	phường	941
31516	phuong_4	Phường 4	phường	941
31519	phuong_3	Phường 3	phường	941
31522	phuong_9	Phường 9	phường	941
31525	phuong_10	Phường 10	phường	941
31569	thi_tran_chau_thanh	Thị trấn Châu Thành	thị trấn	942
31570	xa_ho_dac_kien	Xã Hồ Đắc Kiện	xã	942
31573	xa_phu_tam	Xã Phú Tâm	xã	942
31576	xa_thuan_hoa	Xã Thuận Hòa	xã	942
31582	xa_phu_tan	Xã Phú Tân	xã	942
31585	xa_thien_my	Xã Thiện Mỹ	xã	942
31594	xa_an_hiep	Xã An Hiệp	xã	942
31600	xa_an_ninh	Xã An Ninh	xã	942
31528	thi_tran_ke_sach	Thị trấn Kế Sách	thị trấn	943
31531	thi_tran_an_lac_thon	Thị trấn An Lạc Thôn	thị trấn	943
31534	xa_xuan_hoa	Xã Xuân Hòa	xã	943
31537	xa_phong_nam	Xã Phong Nẫm	xã	943
31540	xa_an_lac_tay	Xã An Lạc Tây	xã	943
31543	xa_trinh_phu	Xã Trinh Phú	xã	943
31546	xa_ba_trinh	Xã Ba Trinh	xã	943
31549	xa_thoi_an_hoi	Xã Thới An Hội	xã	943
31552	xa_nhon_my	Xã Nhơn Mỹ	xã	943
31555	xa_ke_thanh	Xã Kế Thành	xã	943
31558	xa_ke_an	Xã Kế An	xã	943
31561	xa_dai_hai	Xã Đại Hải	xã	943
31564	xa_an_my	Xã An Mỹ	xã	943
31567	thi_tran_huynh_huu_nghia	Thị trấn Huỳnh Hữu Nghĩa	thị trấn	944
31579	xa_long_hung	Xã Long Hưng	xã	944
31588	xa_hung_phu	Xã Hưng Phú	xã	944
31591	xa_my_huong	Xã Mỹ Hương	xã	944
31597	xa_my_tu	Xã Mỹ Tú	xã	944
31603	xa_my_phuoc	Xã Mỹ Phước	xã	944
31606	xa_thuan_hung	Xã Thuận Hưng	xã	944
31609	xa_my_thuan	Xã Mỹ Thuận	xã	944
31612	xa_phu_my	Xã Phú Mỹ	xã	944
31615	thi_tran_cu_lao_dung	Thị trấn Cù Lao Dung	thị trấn	945
31618	xa_an_thanh_1	Xã An Thạnh 1	xã	945
31621	xa_an_thanh_tay	Xã An Thạnh Tây	xã	945
31624	xa_an_thanh_dong	Xã An Thạnh Đông	xã	945
31627	xa_dai_an_1	Xã Đại Ân 1	xã	945
31630	xa_an_thanh_2	Xã An Thạnh 2	xã	945
31633	xa_an_thanh_3	Xã An Thạnh 3	xã	945
31636	xa_an_thanh_nam	Xã An Thạnh Nam	xã	945
31639	thi_tran_long_phu	Thị trấn Long Phú	thị trấn	946
31642	xa_song_phung	Xã Song Phụng	xã	946
31645	thi_tran_dai_ngai	Thị trấn Đại Ngãi	thị trấn	946
31648	xa_hau_thanh	Xã Hậu Thạnh	xã	946
31651	xa_long_duc	Xã Long Đức	xã	946
31654	xa_truong_khanh	Xã Trường Khánh	xã	946
31657	xa_phu_huu	Xã Phú Hữu	xã	946
31660	xa_tan_hung	Xã Tân Hưng	xã	946
31663	xa_chau_khanh	Xã Châu Khánh	xã	946
31666	xa_tan_thanh	Xã Tân Thạnh	xã	946
31669	xa_long_phu	Xã Long Phú	xã	946
31684	thi_tran_my_xuyen	Thị trấn Mỹ Xuyên	thị trấn	947
31690	xa_dai_tam	Xã Đại Tâm	xã	947
31693	xa_tham_don	Xã Tham Đôn	xã	947
31708	xa_thanh_phu	Xã Thạnh Phú	xã	947
31711	xa_ngoc_dong	Xã Ngọc Đông	xã	947
31714	xa_thanh_quoi	Xã Thạnh Quới	xã	947
31717	xa_hoa_tu_1	Xã Hòa Tú 1	xã	947
31720	xa_gia_hoa_1	Xã Gia Hòa 1	xã	947
31723	xa_ngoc_to	Xã Ngọc Tố	xã	947
31726	xa_gia_hoa_2	Xã Gia Hòa 2	xã	947
31729	xa_hoa_tu_ii	Xã Hòa Tú II	xã	947
31732	phuong_1	Phường 1	phường	948
31735	phuong_2	Phường 2	phường	948
31738	xa_vinh_quoi	Xã Vĩnh Quới	xã	948
31741	xa_tan_long	Xã Tân Long	xã	948
31744	xa_long_binh	Xã Long Bình	xã	948
31747	phuong_3	Phường 3	phường	948
31750	xa_my_binh	Xã Mỹ Bình	xã	948
31753	xa_my_quoi	Xã Mỹ Quới	xã	948
31756	thi_tran_phu_loc	Thị trấn Phú Lộc	thị trấn	949
31757	thi_tran_hung_loi	Thị trấn Hưng Lợi	thị trấn	949
31759	xa_lam_tan	Xã Lâm Tân	xã	949
31762	xa_thanh_tan	Xã Thạnh Tân	xã	949
31765	xa_lam_kiet	Xã Lâm Kiết	xã	949
31768	xa_tuan_tuc	Xã Tuân Tức	xã	949
31771	xa_vinh_thanh	Xã Vĩnh Thành	xã	949
31774	xa_thanh_tri	Xã Thạnh Trị	xã	949
31777	xa_vinh_loi	Xã Vĩnh Lợi	xã	949
31780	xa_chau_hung	Xã Châu Hưng	xã	949
31783	phuong_1	Phường 1	phường	950
31786	xa_hoa_dong	Xã Hòa Đông	xã	950
31789	phuong_khanh_hoa	Phường Khánh Hòa	phường	950
31792	xa_vinh_hiep	Xã Vĩnh Hiệp	xã	950
31795	xa_vinh_hai	Xã Vĩnh Hải	xã	950
31798	xa_lac_hoa	Xã Lạc Hòa	xã	950
31801	phuong_2	Phường 2	phường	950
31804	phuong_vinh_phuoc	Phường Vĩnh Phước	phường	950
31807	xa_vinh_tan	Xã Vĩnh Tân	xã	950
31810	xa_lai_hoa	Xã Lai Hòa	xã	950
31672	xa_dai_an_2	Xã Đại Ân 2	xã	951
31673	thi_tran_tran_de	Thị trấn Trần Đề	thị trấn	951
31675	xa_lieu_tu	Xã Liêu Tú	xã	951
31678	xa_lich_hoi_thuong	Xã Lịch Hội Thượng	xã	951
31679	thi_tran_lich_hoi_thuong	Thị trấn Lịch Hội Thượng	thị trấn	951
31681	xa_trung_binh	Xã Trung Bình	xã	951
31687	xa_tai_van	Xã Tài Văn	xã	951
31696	xa_vien_an	Xã Viên An	xã	951
31699	xa_thanh_thoi_an	Xã Thạnh Thới An	xã	951
31702	xa_thanh_thoi_thuan	Xã Thạnh Thới Thuận	xã	951
31705	xa_vien_binh	Xã Viên Bình	xã	951
31813	phuong_2	Phường 2	phường	954
31816	phuong_3	Phường 3	phường	954
31819	phuong_5	Phường 5	phường	954
31822	phuong_7	Phường 7	phường	954
31825	phuong_1	Phường 1	phường	954
31828	phuong_8	Phường 8	phường	954
31831	phuong_nha_mat	Phường Nhà Mát	phường	954
31834	xa_vinh_trach	Xã Vĩnh Trạch	xã	954
31837	xa_vinh_trach_dong	Xã Vĩnh Trạch Đông	xã	954
31840	xa_hiep_thanh	Xã Hiệp Thành	xã	954
31843	thi_tran_ngan_dua	Thị trấn Ngan Dừa	thị trấn	956
31846	xa_ninh_quoi	Xã Ninh Quới	xã	956
31849	xa_ninh_quoi_a	Xã Ninh Quới A	xã	956
31852	xa_ninh_hoa	Xã Ninh Hòa	xã	956
31855	xa_loc_ninh	Xã Lộc Ninh	xã	956
31858	xa_vinh_loc	Xã Vĩnh Lộc	xã	956
31861	xa_vinh_loc_a	Xã Vĩnh Lộc A	xã	956
31863	xa_ninh_thanh_loi_a	Xã Ninh Thạnh Lợi A	xã	956
31864	xa_ninh_thanh_loi	Xã Ninh Thạnh Lợi	xã	956
31867	thi_tran_phuoc_long	Thị trấn Phước Long	thị trấn	957
31870	xa_vinh_phu_dong	Xã Vĩnh Phú Đông	xã	957
31873	xa_vinh_phu_tay	Xã Vĩnh Phú Tây	xã	957
31876	xa_phuoc_long	Xã Phước Long	xã	957
31879	xa_hung_phu	Xã Hưng Phú	xã	957
31882	xa_vinh_thanh	Xã Vĩnh Thanh	xã	957
31885	xa_phong_thanh_tay_a	Xã Phong Thạnh Tây A	xã	957
31888	xa_phong_thanh_tay_b	Xã Phong Thạnh Tây B	xã	957
31894	xa_vinh_hung	Xã Vĩnh Hưng	xã	958
31897	xa_vinh_hung_a	Xã Vĩnh Hưng A	xã	958
31900	thi_tran_chau_hung	Thị trấn Châu Hưng	thị trấn	958
31903	xa_chau_hung_a	Xã Châu Hưng A	xã	958
31906	xa_hung_thanh	Xã Hưng Thành	xã	958
31909	xa_hung_hoi	Xã Hưng Hội	xã	958
31912	xa_chau_thoi	Xã Châu Thới	xã	958
31921	xa_long_thanh	Xã Long Thạnh	xã	958
31942	phuong_1	Phường 1	phường	959
31945	phuong_ho_phong	Phường Hộ Phòng	phường	959
31948	xa_phong_thanh_dong	Xã Phong Thạnh Đông	xã	959
31951	phuong_lang_tron	Phường Láng Tròn	phường	959
31954	xa_phong_tan	Xã Phong Tân	xã	959
31957	xa_tan_phong	Xã Tân Phong	xã	959
31960	xa_phong_thanh	Xã Phong Thạnh	xã	959
31963	xa_phong_thanh_a	Xã Phong Thạnh A	xã	959
31966	xa_phong_thanh_tay	Xã Phong Thạnh Tây	xã	959
31969	xa_tan_thanh	Xã Tân Thạnh	xã	959
31972	thi_tran_ganh_hao	Thị trấn Gành Hào	thị trấn	960
31975	xa_long_dien_dong	Xã Long Điền Đông	xã	960
31978	xa_long_dien_dong_a	Xã Long Điền Đông A	xã	960
31981	xa_long_dien	Xã Long Điền	xã	960
31984	xa_long_dien_tay	Xã Long Điền Tây	xã	960
31985	xa_dien_hai	Xã Điền Hải	xã	960
31987	xa_an_trach	Xã An Trạch	xã	960
31988	xa_an_trach_a	Xã An Trạch A	xã	960
31990	xa_an_phuc	Xã An Phúc	xã	960
31993	xa_dinh_thanh	Xã Định Thành	xã	960
31996	xa_dinh_thanh_a	Xã Định Thành A	xã	960
31891	thi_tran_hoa_binh	Thị trấn Hòa Bình	thị trấn	961
31915	xa_minh_dieu	Xã Minh Diệu	xã	961
31918	xa_vinh_binh	Xã Vĩnh Bình	xã	961
31924	xa_vinh_my_b	Xã Vĩnh Mỹ B	xã	961
31927	xa_vinh_hau	Xã Vĩnh Hậu	xã	961
31930	xa_vinh_hau_a	Xã Vĩnh Hậu A	xã	961
31933	xa_vinh_my_a	Xã Vĩnh Mỹ A	xã	961
31936	xa_vinh_thinh	Xã Vĩnh Thịnh	xã	961
31999	phuong_9	Phường 9	phường	964
32002	phuong_4	Phường 4	phường	964
32005	phuong_1	Phường 1	phường	964
32008	phuong_5	Phường 5	phường	964
32011	phuong_2	Phường 2	phường	964
32014	phuong_8	Phường 8	phường	964
32017	phuong_6	Phường 6	phường	964
32020	phuong_7	Phường 7	phường	964
32022	phuong_tan_xuyen	Phường Tân Xuyên	phường	964
32023	xa_an_xuyen	Xã An Xuyên	xã	964
32025	phuong_tan_thanh	Phường Tân Thành	phường	964
32026	xa_tan_thanh	Xã Tân Thành	xã	964
32029	xa_tac_van	Xã Tắc Vân	xã	964
32032	xa_ly_van_lam	Xã Lý Văn Lâm	xã	964
32035	xa_dinh_binh	Xã Định Bình	xã	964
32038	xa_hoa_thanh	Xã Hòa Thành	xã	964
32041	xa_hoa_tan	Xã Hòa Tân	xã	964
32044	thi_tran_u_minh	Thị trấn U Minh	thị trấn	966
32047	xa_khanh_hoa	Xã Khánh Hòa	xã	966
32048	xa_khanh_thuan	Xã Khánh Thuận	xã	966
32050	xa_khanh_tien	Xã Khánh Tiến	xã	966
32053	xa_nguyen_phich	Xã Nguyễn Phích	xã	966
32056	xa_khanh_lam	Xã Khánh Lâm	xã	966
32059	xa_khanh_an	Xã Khánh An	xã	966
32062	xa_khanh_hoi	Xã Khánh Hội	xã	966
32065	thi_tran_thoi_binh	Thị trấn Thới Bình	thị trấn	967
32068	xa_bien_bach	Xã Biển Bạch	xã	967
32069	xa_tan_bang	Xã Tân Bằng	xã	967
32071	xa_tri_phai	Xã Trí Phải	xã	967
32072	xa_tri_luc	Xã Trí Lực	xã	967
32074	xa_bien_bach_dong	Xã Biển Bạch Đông	xã	967
32077	xa_thoi_binh	Xã Thới Bình	xã	967
32080	xa_tan_phu	Xã Tân Phú	xã	967
32083	xa_tan_loc_bac	Xã Tân Lộc Bắc	xã	967
32086	xa_tan_loc	Xã Tân Lộc	xã	967
32089	xa_tan_loc_dong	Xã Tân Lộc Đông	xã	967
32092	xa_ho_thi_ky	Xã Hồ Thị Kỷ	xã	967
32095	thi_tran_tran_van_thoi	Thị trấn Trần Văn Thời	thị trấn	968
32098	thi_tran_song_doc	Thị trấn Sông Đốc	thị trấn	968
32101	xa_khanh_binh_tay_bac	Xã Khánh Bình Tây Bắc	xã	968
32104	xa_khanh_binh_tay	Xã Khánh Bình Tây	xã	968
32107	xa_tran_hoi	Xã Trần Hợi	xã	968
32108	xa_khanh_loc	Xã Khánh Lộc	xã	968
32110	xa_khanh_binh	Xã Khánh Bình	xã	968
32113	xa_khanh_hung	Xã Khánh Hưng	xã	968
32116	xa_khanh_binh_dong	Xã Khánh Bình Đông	xã	968
32119	xa_khanh_hai	Xã Khánh Hải	xã	968
32122	xa_loi_an	Xã Lợi An	xã	968
32124	xa_phong_dien	Xã Phong Điền	xã	968
32125	xa_phong_lac	Xã Phong Lạc	xã	968
32128	thi_tran_cai_nuoc	Thị trấn Cái Nước	thị trấn	969
32130	xa_thanh_phu	Xã Thạnh Phú	xã	969
32131	xa_luong_the_tran	Xã Lương Thế Trân	xã	969
32134	xa_phu_hung	Xã Phú Hưng	xã	969
32137	xa_tan_hung	Xã Tân Hưng	xã	969
32140	xa_hung_my	Xã Hưng Mỹ	xã	969
32141	xa_hoa_my	Xã Hoà Mỹ	xã	969
32142	xa_dong_hung	Xã Đông Hưng	xã	969
32143	xa_dong_thoi	Xã Đông Thới	xã	969
32146	xa_tan_hung_dong	Xã Tân Hưng Đông	xã	969
32149	xa_tran_thoi	Xã Trần Thới	xã	969
32152	thi_tran_dam_doi	Thị trấn Đầm Dơi	thị trấn	970
32155	xa_ta_an_khuong	Xã Tạ An Khương	xã	970
32158	xa_ta_an_khuong_dong	Xã Tạ An Khương Đông	xã	970
32161	xa_tran_phan	Xã Trần Phán	xã	970
32162	xa_tan_trung	Xã Tân Trung	xã	970
32164	xa_tan_duc	Xã Tân Đức	xã	970
32167	xa_tan_thuan	Xã Tân Thuận	xã	970
32170	xa_ta_an_khuong_nam	Xã Tạ An Khương Nam	xã	970
32173	xa_tan_duyet	Xã Tân Duyệt	xã	970
32174	xa_tan_dan	Xã Tân Dân	xã	970
32176	xa_tan_tien	Xã Tân Tiến	xã	970
32179	xa_quach_pham_bac	Xã Quách Phẩm Bắc	xã	970
32182	xa_quach_pham	Xã Quách Phẩm	xã	970
32185	xa_thanh_tung	Xã Thanh Tùng	xã	970
32186	xa_ngoc_chanh	Xã Ngọc Chánh	xã	970
32188	xa_nguyen_huan	Xã Nguyễn Huân	xã	970
32191	thi_tran_nam_can	Thị trấn Năm Căn	thị trấn	971
32194	xa_ham_rong	Xã Hàm Rồng	xã	971
32197	xa_hiep_tung	Xã Hiệp Tùng	xã	971
32200	xa_dat_moi	Xã Đất Mới	xã	971
32201	xa_lam_hai	Xã Lâm Hải	xã	971
32203	xa_hang_vinh	Xã Hàng Vịnh	xã	971
32206	xa_tam_giang	Xã Tam Giang	xã	971
32209	xa_tam_giang_dong	Xã Tam Giang Đông	xã	971
32212	thi_tran_cai_doi_vam	Thị trấn Cái Đôi Vàm	thị trấn	972
32214	xa_phu_thuan	Xã Phú Thuận	xã	972
32215	xa_phu_my	Xã Phú Mỹ	xã	972
32218	xa_phu_tan	Xã Phú Tân	xã	972
32221	xa_tan_hai	Xã Tân Hải	xã	972
32224	xa_viet_thang	Xã Việt Thắng	xã	972
32227	xa_tan_hung_tay	Xã Tân Hưng Tây	xã	972
32228	xa_rach_cheo	Xã Rạch Chèo	xã	972
32230	xa_nguyen_viet_khai	Xã Nguyễn Việt Khái	xã	972
32233	xa_tam_giang_tay	Xã Tam Giang Tây	xã	973
32236	xa_tan_an_tay	Xã Tân Ân Tây	xã	973
32239	xa_vien_an_dong	Xã Viên An Đông	xã	973
32242	xa_vien_an	Xã Viên An	xã	973
32244	thi_tran_rach_goc	Thị trấn Rạch Gốc	thị trấn	973
32245	xa_tan_an	Xã Tân Ân	xã	973
32248	xa_dat_mui	Xã Đất Mũi	xã	973
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 4, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colors_id_seq', 8, true);


--
-- Name: districts_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.districts_district_id_seq', 1, false);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 36, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 270, true);


--
-- Name: images_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_product_id_seq', 1, false);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturers_id_seq', 5, true);


--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 101, true);


--
-- Name: order_statuses_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_statuses_order_status_id_seq', 6, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 97, true);


--
-- Name: payment_methods_payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_payment_method_id_seq', 2, true);


--
-- Name: payment_statuses_payment_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_statuses_payment_status_id_seq', 1, false);


--
-- Name: product_categories_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_product_category_id_seq', 9, true);


--
-- Name: product_statuses_product_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_statuses_product_status_id_seq', 3, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 79, true);


--
-- Name: provinces_province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_province_id_seq', 1, false);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 3, true);


--
-- Name: size_types_size_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.size_types_size_type_id_seq', 2, true);


--
-- Name: sizes_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sizes_size_id_seq', 25, true);


--
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_stock_id_seq', 451, true);


--
-- Name: styles_style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.styles_style_id_seq', 4, true);


--
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_type_id_seq', 23, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 30, true);


--
-- Name: wards_ward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wards_ward_id_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (color_id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (district_id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (favorite_id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (image_id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (manufacturer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY (order_status_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id);


--
-- Name: payment_statuses payment_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_statuses
    ADD CONSTRAINT payment_statuses_pkey PRIMARY KEY (payment_status_id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (product_category_id);


--
-- Name: product_statuses product_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_statuses
    ADD CONSTRAINT product_statuses_pkey PRIMARY KEY (product_status_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (province_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: size_types size_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size_types
    ADD CONSTRAINT size_types_pkey PRIMARY KEY (size_type_id);


--
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (size_id);


--
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stock_id);


--
-- Name: styles styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (style_id);


--
-- Name: types type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: wards wards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_pkey PRIMARY KEY (ward_id);


--
-- Name: districts districts_province_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.provinces(province_id);


--
-- Name: favorites favorites_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.colors(color_id);


--
-- Name: favorites favorites_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: favorites favorites_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.sizes(size_id);


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: images fk_color_image; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fk_color_image FOREIGN KEY (product_color_id) REFERENCES public.colors(color_id);


--
-- Name: images images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: order_items order_items_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.colors(color_id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: order_items order_items_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.sizes(size_id);


--
-- Name: orders orders_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_statuses(order_status_id);


--
-- Name: orders orders_payment_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_statuses(payment_status_id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: product_categories product_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: product_categories product_categories_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products products_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(manufacturer_id);


--
-- Name: products products_product_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_status_id_fkey FOREIGN KEY (product_status_id) REFERENCES public.product_statuses(product_status_id);


--
-- Name: products products_size_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_size_type_id_fkey FOREIGN KEY (size_type_id) REFERENCES public.size_types(size_type_id);


--
-- Name: products products_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_style_id_fkey FOREIGN KEY (style_id) REFERENCES public.styles(style_id);


--
-- Name: products products_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: sizes sizes_size_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_size_type_id_fkey FOREIGN KEY (size_type_id) REFERENCES public.size_types(size_type_id);


--
-- Name: stock stock_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.colors(color_id);


--
-- Name: stock stock_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: stock stock_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.sizes(size_id);


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: wards wards_district_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.districts(district_id);


--
-- PostgreSQL database dump complete
--

