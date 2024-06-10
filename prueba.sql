--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: sakila; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sakila;


ALTER SCHEMA sakila OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial716 character(1)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_actor_id_seq OWNED BY public.actor.actor_id;


--
-- Name: actor_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor_info (
    actor_id integer DEFAULT 0 NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    film_info text,
    trial726 character(1)
);


ALTER TABLE public.actor_info OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id smallint NOT NULL,
    name character varying(25) NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial716 character(1)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id smallint NOT NULL,
    city character varying(50) NOT NULL,
    country_id integer NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial716 character(1)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_city_id_seq OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id smallint NOT NULL,
    country character varying(50) NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial716 character(1)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id smallint NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id integer NOT NULL,
    active smallint DEFAULT 1 NOT NULL,
    create_date timestamp without time zone NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    trial716 character(1)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: customer_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_list (
    id integer DEFAULT 0 NOT NULL,
    name character varying(91),
    address character varying(50) NOT NULL,
    "zip code" character varying(10),
    phone character varying(20) NOT NULL,
    city character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    notes character varying(6) DEFAULT ''::character varying NOT NULL,
    sid smallint NOT NULL,
    trial733 character(1)
);


ALTER TABLE public.customer_list OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    film_id smallint NOT NULL,
    title character varying(128) NOT NULL,
    description text,
    release_year smallint,
    language_id smallint NOT NULL,
    original_language_id smallint,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length integer,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating character varying(5) DEFAULT 'G'::character varying,
    special_features character varying(54),
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial720 character(1)
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actor (
    actor_id integer NOT NULL,
    film_id integer NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial720 character(1)
);


ALTER TABLE public.film_actor OWNER TO postgres;

--
-- Name: film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_category (
    film_id integer NOT NULL,
    category_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial720 character(1)
);


ALTER TABLE public.film_category OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_film_id_seq OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_film_id_seq OWNED BY public.film.film_id;


--
-- Name: film_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_list (
    fid integer DEFAULT 0 NOT NULL,
    title character varying(128) NOT NULL,
    description text,
    category character varying(25),
    price numeric(4,2) DEFAULT 4.99 NOT NULL,
    length integer,
    rating character varying(5) DEFAULT 'G'::character varying,
    actors text,
    trial733 character(1)
);


ALTER TABLE public.film_list OWNER TO postgres;

--
-- Name: film_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_text (
    film_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    trial720 character(1)
);


ALTER TABLE public.film_text OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    film_id integer NOT NULL,
    store_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial720 character(1)
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;


--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id smallint NOT NULL,
    name character(20) NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial720 character(1)
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.language_language_id_seq OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.language_language_id_seq OWNED BY public.language.language_id;


--
-- Name: nicer_but_slower_film_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nicer_but_slower_film_list (
    fid integer DEFAULT 0 NOT NULL,
    title character varying(128) NOT NULL,
    description text,
    category character varying(25),
    price numeric(4,2) DEFAULT 4.99 NOT NULL,
    length integer,
    rating character varying(5) DEFAULT 'G'::character varying,
    actors text,
    trial736 character(1)
);


ALTER TABLE public.nicer_but_slower_film_list OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id smallint NOT NULL,
    customer_id integer NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    trial723 character(1)
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    rental_id integer NOT NULL,
    rental_date timestamp without time zone NOT NULL,
    inventory_id numeric(8,0) NOT NULL,
    customer_id integer NOT NULL,
    return_date timestamp without time zone,
    staff_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial720 character(1)
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rental_rental_id_seq OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_rental_id_seq OWNED BY public.rental.rental_id;


--
-- Name: sales_by_film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_by_film_category (
    category character varying(25) NOT NULL,
    total_sales numeric(27,2),
    trial736 character(1)
);


ALTER TABLE public.sales_by_film_category OWNER TO postgres;

--
-- Name: sales_by_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_by_store (
    store character varying(101),
    manager character varying(91),
    total_sales numeric(27,2),
    trial736 character(1)
);


ALTER TABLE public.sales_by_store OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id integer NOT NULL,
    picture bytea,
    email character varying(50),
    store_id smallint NOT NULL,
    active smallint DEFAULT 1 NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial716 character(1)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_list (
    id smallint DEFAULT 0 NOT NULL,
    name character varying(91),
    address character varying(50) NOT NULL,
    "zip code" character varying(10),
    phone character varying(20) NOT NULL,
    city character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    sid smallint NOT NULL,
    trial739 character(1)
);


ALTER TABLE public.staff_list OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;


--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id smallint NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id integer NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    trial716 character(1)
);


ALTER TABLE public.store OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.store_store_id_seq OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_store_id_seq OWNED BY public.store.store_id;


--
-- Name: actor actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN actor_id SET DEFAULT nextval('public.actor_actor_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: city city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: film film_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN film_id SET DEFAULT nextval('public.film_film_id_seq'::regclass);


--
-- Name: inventory inventory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);


--
-- Name: language language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN language_id SET DEFAULT nextval('public.language_language_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: rental rental_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental ALTER COLUMN rental_id SET DEFAULT nextval('public.rental_rental_id_seq'::regclass);


--
-- Name: staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- Name: store store_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store ALTER COLUMN store_id SET DEFAULT nextval('public.store_store_id_seq'::regclass);


--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actor (actor_id, first_name, last_name, last_update, trial716) VALUES
(1, 'PENELOPE', 'GUINESS', '2006-02-15 04:34:33', 'T'),
(2, 'NICK', 'WAHLBERG', '2006-02-15 04:34:33', 'T'),
(3, 'ED', 'CHASE', '2006-02-15 04:34:33', 'T'),
(4, 'JENNIFER', 'DAVIS', '2006-02-15 04:34:33', 'T'),
(5, 'JOHNNY', 'LOLLOBRIGIDA', '2006-02-15 04:34:33', 'T'),
(6, 'BETTE', 'NICHOLSON', '2006-02-15 04:34:33', 'T'),
(7, 'GRACE', 'MOSTEL', '2006-02-15 04:34:33', 'T'),
(8, 'MATTHEW', 'JOHANSSON', '2006-02-15 04:34:33', 'T'),
(9, 'JOE', 'SWANK', '2006-02-15 04:34:33', 'T'),
(10, 'CHRISTIAN', 'GABLE', '2006-02-15 04:34:33', 'T'),
(11, 'ZERO', 'CAGE', '2006-02-15 04:34:33', 'T'),
(12, 'KARL', 'BERRY', '2006-02-15 04:34:33', 'T'),
(13, 'UMA', 'WOOD', '2006-02-15 04:34:33', 'T'),
(14, 'VIVIEN', 'BERGEN', '2006-02-15 04:34:33', 'T'),
(15, 'CUBA', 'OLIVIER', '2006-02-15 04:34:33', 'T'),
(16, 'FRED', 'COSTNER', '2006-02-15 04:34:33', 'T'),
(17, 'HELEN', 'VOIGHT', '2006-02-15 04:34:33', 'T'),
(18, 'DAN', 'TORN', '2006-02-15 04:34:33', 'T'),
(19, 'BOB', 'FAWCETT', '2006-02-15 04:34:33', 'T'),
(20, 'LUCILLE', 'TRACY', '2006-02-15 04:34:33', 'T'),
(21, 'KIRSTEN', 'PALTROW', '2006-02-15 04:34:33', 'T'),
(22, 'ELVIS', 'MARX', '2006-02-15 04:34:33', 'T'),
(23, 'SANDRA', 'KILMER', '2006-02-15 04:34:33', 'T'),
(24, 'CAMERON', 'STREEP', '2006-02-15 04:34:33', 'T'),
(25, 'KEVIN', 'BLOOM', '2006-02-15 04:34:33', 'T'),
(26, 'RIP', 'CRAWFORD', '2006-02-15 04:34:33', 'T'),
(27, 'JULIA', 'MCQUEEN', '2006-02-15 04:34:33', 'T'),
(28, 'WOODY', 'HOFFMAN', '2006-02-15 04:34:33', 'T'),
(29, 'ALEC', 'WAYNE', '2006-02-15 04:34:33', 'T'),
(30, 'SANDRA', 'PECK', '2006-02-15 04:34:33', 'T'),
(31, 'SISSY', 'SOBIESKI', '2006-02-15 04:34:33', 'T'),
(32, 'TIM', 'HACKMAN', '2006-02-15 04:34:33', 'T'),
(33, 'MILLA', 'PECK', '2006-02-15 04:34:33', 'T'),
(34, 'AUDREY', 'OLIVIER', '2006-02-15 04:34:33', 'T'),
(35, 'JUDY', 'DEAN', '2006-02-15 04:34:33', 'T'),
(36, 'BURT', 'DUKAKIS', '2006-02-15 04:34:33', 'T'),
(37, 'VAL', 'BOLGER', '2006-02-15 04:34:33', 'T'),
(38, 'TOM', 'MCKELLEN', '2006-02-15 04:34:33', 'T'),
(39, 'GOLDIE', 'BRODY', '2006-02-15 04:34:33', 'T'),
(40, 'JOHNNY', 'CAGE', '2006-02-15 04:34:33', 'T'),
(41, 'JODIE', 'DEGENERES', '2006-02-15 04:34:33', 'T'),
(42, 'TOM', 'MIRANDA', '2006-02-15 04:34:33', 'T'),
(43, 'KIRK', 'JOVOVICH', '2006-02-15 04:34:33', 'T'),
(44, 'NICK', 'STALLONE', '2006-02-15 04:34:33', 'T'),
(45, 'REESE', 'KILMER', '2006-02-15 04:34:33', 'T'),
(46, 'PARKER', 'GOLDBERG', '2006-02-15 04:34:33', 'T'),
(47, 'JULIA', 'BARRYMORE', '2006-02-15 04:34:33', 'T'),
(48, 'FRANCES', 'DAY-LEWIS', '2006-02-15 04:34:33', 'T'),
(49, 'ANNE', 'CRONYN', '2006-02-15 04:34:33', 'T'),
(50, 'NATALIE', 'HOPKINS', '2006-02-15 04:34:33', 'T'),
(51, 'GARY', 'PHOENIX', '2006-02-15 04:34:33', 'T'),
(52, 'CARMEN', 'HUNT', '2006-02-15 04:34:33', 'T'),
(53, 'MENA', 'TEMPLE', '2006-02-15 04:34:33', 'T'),
(54, 'PENELOPE', 'PINKETT', '2006-02-15 04:34:33', 'T'),
(55, 'FAY', 'KILMER', '2006-02-15 04:34:33', 'T'),
(56, 'DAN', 'HARRIS', '2006-02-15 04:34:33', 'T'),
(57, 'JUDE', 'CRUISE', '2006-02-15 04:34:33', 'T'),
(58, 'CHRISTIAN', 'AKROYD', '2006-02-15 04:34:33', 'T'),
(59, 'DUSTIN', 'TAUTOU', '2006-02-15 04:34:33', 'T'),
(60, 'HENRY', 'BERRY', '2006-02-15 04:34:33', 'T'),
(61, 'CHRISTIAN', 'NEESON', '2006-02-15 04:34:33', 'T'),
(62, 'JAYNE', 'NEESON', '2006-02-15 04:34:33', 'T'),
(63, 'CAMERON', 'WRAY', '2006-02-15 04:34:33', 'T'),
(64, 'RAY', 'JOHANSSON', '2006-02-15 04:34:33', 'T'),
(65, 'ANGELA', 'HUDSON', '2006-02-15 04:34:33', 'T'),
(66, 'MARY', 'TANDY', '2006-02-15 04:34:33', 'T'),
(67, 'JESSICA', 'BAILEY', '2006-02-15 04:34:33', 'T'),
(68,'RIP','WINSLET','2006-02-15 04:34:33','T'),
(69,'KENNETH','PALTROW','2006-02-15 04:34:33','T'),
(70,'MICHELLE','MCCONAUGHEY','2006-02-15 04:34:33','T'),
(71,'ADAM','GRANT','2006-02-15 04:34:33','T'),
(72,'SEAN','WILLIAMS','2006-02-15 04:34:33','T'),
(73,'GARY','PENN','2006-02-15 04:34:33','T'),
(74,'MILLA','KEITEL','2006-02-15 04:34:33','T'),
(75,'BURT','POSEY','2006-02-15 04:34:33','T'),
(76,'ANGELINA','ASTAIRE','2006-02-15 04:34:33','T'),
(77,'CARY','MCCONAUGHEY','2006-02-15 04:34:33','T'),
(78,'GROUCHO','SINATRA','2006-02-15 04:34:33','T'),
(79,'MAE','HOFFMAN','2006-02-15 04:34:33','T'),
(80,'RALPH','CRUZ','2006-02-15 04:34:33','T'),
(81,'SCARLETT','DAMON','2006-02-15 04:34:33','T'),
(82,'WOODY','JOLIE','2006-02-15 04:34:33','T'),
(83,'BEN','WILLIS','2006-02-15 04:34:33','T'),
(84,'JAMES','PITT','2006-02-15 04:34:33','T'),
(85,'MINNIE','ZELLWEGER','2006-02-15 04:34:33','T'),
(86,'GREG','CHAPLIN','2006-02-15 04:34:33','T'),
(87,'SPENCER','PECK','2006-02-15 04:34:33','T'),
(88,'KENNETH','PESCI','2006-02-15 04:34:33','T'),
(89,'CHARLIZE','DENCH','2006-02-15 04:34:33','T'),
(90,'SEAN','GUINESS','2006-02-15 04:34:33','T'),
(91,'CHRISTOPHER','BERRY','2006-02-15 04:34:33','T'),
(92,'KIRSTEN','AKROYD','2006-02-15 04:34:33','T'),
(93,'ELLEN','PRESLEY','2006-02-15 04:34:33','T'),
(94,'KENNETH','TORN','2006-02-15 04:34:33','T'),
(95,'DARYL','WAHLBERG','2006-02-15 04:34:33','T'),
(96,'GENE','WILLIS','2006-02-15 04:34:33','T'),
(97,'MEG','HAWKE','2006-02-15 04:34:33','T'),
(98,'CHRIS','BRIDGES','2006-02-15 04:34:33','T'),
(99,'JIM','MOSTEL','2006-02-15 04:34:33','T'),
(100,'SPENCER','DEPP','2006-02-15 04:34:33','T'),
(101,'SUSAN','DAVIS','2006-02-15 04:34:33','T'),
(102,'WALTER','TORN','2006-02-15 04:34:33','T'),
(103,'MATTHEW','LEIGH','2006-02-15 04:34:33','T'),
(104,'PENELOPE','CRONYN','2006-02-15 04:34:33','T'),
(105,'SIDNEY','CROWE','2006-02-15 04:34:33','T'),
(106,'GROUCHO','DUNST','2006-02-15 04:34:33','T'),
(107,'GINA','DEGENERES','2006-02-15 04:34:33','T'),
(108,'WARREN','NOLTE','2006-02-15 04:34:33','T'),
(109,'SYLVESTER','DERN','2006-02-15 04:34:33','T'),
(110,'SUSAN','DAVIS','2006-02-15 04:34:33','T'),
(111,'CAMERON','ZELLWEGER','2006-02-15 04:34:33','T'),
(112,'RUSSELL','BACALL','2006-02-15 04:34:33','T'),
(113,'MORGAN','HOPKINS','2006-02-15 04:34:33','T'),
(114,'MORGAN','MCDORMAND','2006-02-15 04:34:33','T'),
(115,'HARRISON','BALE','2006-02-15 04:34:33','T'),
(116,'DAN','STREEP','2006-02-15 04:34:33','T'),
(117,'RENEE','TRACY','2006-02-15 04:34:33','T'),
(118,'CUBA','ALLEN','2006-02-15 04:34:33','T'),
(119,'WARREN','JACKMAN','2006-02-15 04:34:33','T'),
(120,'PENELOPE','MONROE','2006-02-15 04:34:33','T'),
(121,'LIZA','BERGMAN','2006-02-15 04:34:33','T'),
(122,'SALMA','NOLTE','2006-02-15 04:34:33','T'),
(123,'JULIANNE','DENCH','2006-02-15 04:34:33','T'),
(124,'SCARLETT','BENING','2006-02-15 04:34:33','T'),
(125,'ALBERT','NOLTE','2006-02-15 04:34:33','T'),
(126,'FRANCES','TOMEI','2006-02-15 04:34:33','T'),
(127,'KEVIN','GARLAND','2006-02-15 04:34:33','T'),
(128,'CATE','MCQUEEN','2006-02-15 04:34:33','T');
