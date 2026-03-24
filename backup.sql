--
-- PostgreSQL database dump
--

\restrict AYkYmBk0j4AaUTHNQqix7FTXlP6sbbdT3cTMfddHZbMB3fmOPufzfAquic2W7zJ

-- Dumped from database version 17.2
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    password_hash character varying(128) NOT NULL,
    role character varying(20) DEFAULT 'user'::character varying,
    is_blocked boolean DEFAULT false,
    failed_attempts integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: § Є §; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."§ Є §" (
    "Є®¤_§ Є § " integer NOT NULL,
    "¤ в " date DEFAULT CURRENT_DATE NOT NULL,
    "Є®¤_Ї®ЄгЇ вҐ«п" character varying(20) NOT NULL,
    "Є®¤_Їа®¤ ўж " character varying(20) NOT NULL
);


ALTER TABLE public."§ Є §" OWNER TO postgres;

--
-- Name: § Є §_Є®¤_§ Є § _seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."§ Є §_Є®¤_§ Є § _seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."§ Є §_Є®¤_§ Є § _seq" OWNER TO postgres;

--
-- Name: § Є §_Є®¤_§ Є § _seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."§ Є §_Є®¤_§ Є § _seq" OWNED BY public."§ Є §"."Є®¤_§ Є § ";


--
-- Name: ¬ вҐаЁ «л; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."¬ вҐаЁ «л" (
    "Є®¤_¬ вҐаЁ « " character varying(20) NOT NULL,
    "­ Ё¬Ґ­®ў ­ЁҐ_¬ вҐаЁ « " character varying(200) NOT NULL,
    "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" integer NOT NULL,
    "Є®¤_жҐ­л_¬ вҐаЁ « " integer
);


ALTER TABLE public."¬ вҐаЁ «л" OWNER TO postgres;

--
-- Name: Є®­ва ЈҐ­в ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Є®­ва ЈҐ­в " (
    "Є®¤_Є®­ва ЈҐ­в " character varying(20) NOT NULL,
    "Ё¬п" character varying(200) NOT NULL,
    "Ё­­" character varying(20),
    " ¤аҐб" text,
    "вҐ«Ґд®­" character varying(20),
    "Їа®¤ ўҐж" boolean DEFAULT false,
    "Ї®ЄгЇ вҐ«м" boolean DEFAULT false
);


ALTER TABLE public."Є®­ва ЈҐ­в " OWNER TO postgres;

--
-- Name: Їа®¤гЄжЁп; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Їа®¤гЄжЁп" (
    "Є®¤_Їа®¤гЄжЁЁ" character varying(20) NOT NULL,
    "­ Ё¬Ґ­®ў ­ЁҐ_Їа®¤гЄжЁЁ" character varying(200) NOT NULL,
    "Є®¤_жҐ­л_Їа®¤гЄжЁЁ" integer NOT NULL,
    "Є®¤_бЇҐжЁдЁЄ жЁЁ" integer NOT NULL,
    "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" integer NOT NULL
);


ALTER TABLE public."Їа®¤гЄжЁп" OWNER TO postgres;

--
-- Name: б®бв ў_§ Є § ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."б®бв ў_§ Є § " (
    "Є®¤_б®бв ў _§ Є § " integer NOT NULL,
    "Є®¤_§ Є § " integer NOT NULL,
    "Є®¤_Їа®¤гЄжЁЁ" character varying(20) NOT NULL,
    "Є®«ЁзҐбвў®" numeric(10,3) NOT NULL,
    "жҐ­ " numeric(10,2) NOT NULL,
    "бг¬¬ " numeric(10,2) GENERATED ALWAYS AS (("Є®«ЁзҐбвў®" * "жҐ­ ")) STORED,
    "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" integer NOT NULL,
    CONSTRAINT "б®бв ў_§ Є § _Є®«ЁзҐбвў®_check" CHECK (("Є®«ЁзҐбвў®" > (0)::numeric)),
    CONSTRAINT "б®бв ў_§ Є § _жҐ­ _check" CHECK (("жҐ­ " >= (0)::numeric))
);


ALTER TABLE public."б®бв ў_§ Є § " OWNER TO postgres;

--
-- Name: б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq" OWNER TO postgres;

--
-- Name: б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq" OWNED BY public."б®бв ў_§ Є § "."Є®¤_б®бв ў _§ Є § ";


--
-- Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."б®бв ў_бЇҐжЁдЁЄ жЁЁ" (
    "Є®¤_б®бв ў _бЇҐжЁдЁЄ жЁЁ" integer NOT NULL,
    "Є®¤_бЇҐжЁдЁЄ жЁЁ" integer NOT NULL,
    "Є®¤_¬ вҐаЁ « " character varying(20) NOT NULL,
    "Є®«ЁзҐбвў®" numeric(10,3) NOT NULL,
    "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" integer NOT NULL,
    CONSTRAINT "б®бв ў_бЇҐжЁдЁЄ жЁ_Є®«ЁзҐбвў®_check" CHECK (("Є®«ЁзҐбвў®" > (0)::numeric))
);


ALTER TABLE public."б®бв ў_бЇҐжЁдЁЄ жЁЁ" OWNER TO postgres;

--
-- Name: б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq" OWNER TO postgres;

--
-- Name: б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq" OWNED BY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ"."Є®¤_б®бв ў _бЇҐжЁдЁЄ жЁЁ";


--
-- Name: бЇҐжЁдЁЄ жЁп; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."бЇҐжЁдЁЄ жЁп" (
    "Є®¤_бЇҐжЁдЁЄ жЁЁ" integer NOT NULL,
    "Ё¬п_бЇҐжЁдЁЄ жЁЁ" character varying(200) NOT NULL,
    "Є®«ЁзҐбвў®" numeric(10,3) DEFAULT 1 NOT NULL,
    "Ё§Ј®в®ўЁвҐ«м" character varying(20) NOT NULL,
    "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" integer NOT NULL
);


ALTER TABLE public."бЇҐжЁдЁЄ жЁп" OWNER TO postgres;

--
-- Name: бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq" OWNER TO postgres;

--
-- Name: бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq" OWNED BY public."бЇҐжЁдЁЄ жЁп"."Є®¤_бЇҐжЁдЁЄ жЁЁ";


--
-- Name: жҐ­ _¬ вҐаЁ « ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."жҐ­ _¬ вҐаЁ « " (
    "Є®¤_жҐ­л_¬ вҐаЁ « " integer NOT NULL,
    "¤ в " date DEFAULT CURRENT_DATE NOT NULL,
    "жҐ­ " numeric(10,2) NOT NULL,
    CONSTRAINT "жҐ­ _¬ вҐаЁ « _жҐ­ _check" CHECK (("жҐ­ " > (0)::numeric))
);


ALTER TABLE public."жҐ­ _¬ вҐаЁ « " OWNER TO postgres;

--
-- Name: жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq" OWNER TO postgres;

--
-- Name: жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq" OWNED BY public."жҐ­ _¬ вҐаЁ « "."Є®¤_жҐ­л_¬ вҐаЁ « ";


--
-- Name: жҐ­ _Їа®¤гЄжЁЁ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."жҐ­ _Їа®¤гЄжЁЁ" (
    "Є®¤_жҐ­л_Їа®¤гЄжЁЁ" integer NOT NULL,
    "¤ в " date DEFAULT CURRENT_DATE NOT NULL,
    "жҐ­ " numeric(10,2) NOT NULL,
    CONSTRAINT "жҐ­ _Їа®¤гЄжЁЁ_жҐ­ _check" CHECK (("жҐ­ " > (0)::numeric))
);


ALTER TABLE public."жҐ­ _Їа®¤гЄжЁЁ" OWNER TO postgres;

--
-- Name: жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq" OWNER TO postgres;

--
-- Name: жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq" OWNED BY public."жҐ­ _Їа®¤гЄжЁЁ"."Є®¤_жҐ­л_Їа®¤гЄжЁЁ";


--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" (
    "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" integer NOT NULL,
    "­ Ё¬Ґ­®ў ­ЁҐ_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" character varying(20) NOT NULL
);


ALTER TABLE public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" OWNER TO postgres;

--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq" OWNER TO postgres;

--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq" OWNED BY public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"."Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп";


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: § Є § Є®¤_§ Є § ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."§ Є §" ALTER COLUMN "Є®¤_§ Є § " SET DEFAULT nextval('public."§ Є §_Є®¤_§ Є § _seq"'::regclass);


--
-- Name: б®бв ў_§ Є §  Є®¤_б®бв ў _§ Є § ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_§ Є § " ALTER COLUMN "Є®¤_б®бв ў _§ Є § " SET DEFAULT nextval('public."б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq"'::regclass);


--
-- Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ Є®¤_б®бв ў _бЇҐжЁдЁЄ жЁЁ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ" ALTER COLUMN "Є®¤_б®бв ў _бЇҐжЁдЁЄ жЁЁ" SET DEFAULT nextval('public."б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq"'::regclass);


--
-- Name: бЇҐжЁдЁЄ жЁп Є®¤_бЇҐжЁдЁЄ жЁЁ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."бЇҐжЁдЁЄ жЁп" ALTER COLUMN "Є®¤_бЇҐжЁдЁЄ жЁЁ" SET DEFAULT nextval('public."бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq"'::regclass);


--
-- Name: жҐ­ _¬ вҐаЁ «  Є®¤_жҐ­л_¬ вҐаЁ « ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."жҐ­ _¬ вҐаЁ « " ALTER COLUMN "Є®¤_жҐ­л_¬ вҐаЁ « " SET DEFAULT nextval('public."жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq"'::regclass);


--
-- Name: жҐ­ _Їа®¤гЄжЁЁ Є®¤_жҐ­л_Їа®¤гЄжЁЁ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."жҐ­ _Їа®¤гЄжЁЁ" ALTER COLUMN "Є®¤_жҐ­л_Їа®¤гЄжЁЁ" SET DEFAULT nextval('public."жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq"'::regclass);


--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" ALTER COLUMN "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" SET DEFAULT nextval('public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq"'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, password_hash, role, is_blocked, failed_attempts) FROM stdin;
2	monako	ed227bb0d191d168545bec592e8b9c1199ef4ffa122a7395ededa0cf888dc09f	user	f	0
1	admin	2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b	admin	f	0
\.


--
-- Data for Name: § Є §; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."§ Є §" ("Є®¤_§ Є § ", "¤ в ", "Є®¤_Ї®ЄгЇ вҐ«п", "Є®¤_Їа®¤ ўж ") FROM stdin;
1	2025-06-06	000000010	000000001
\.


--
-- Data for Name: ¬ вҐаЁ «л; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."¬ вҐаЁ «л" ("Є®¤_¬ вҐаЁ « ", "­ Ё¬Ґ­®ў ­ЁҐ_¬ вҐаЁ « ", "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп", "Є®¤_жҐ­л_¬ вҐаЁ « ") FROM stdin;
Ќ”-00000004	Њ®«®Є® ­®а¬ «Ё§®ў ­­®Ґ	2	1
Ќ”-00000005	‡ Єў бЄ  б¬Ґв ­­ п	2	2
Ќ”-00000006	‘¬Ґв ­  Є« ббЁзҐбЄ п 15% 540Ј.	1	\N
\.


--
-- Data for Name: Є®­ва ЈҐ­в ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Є®­ва ЈҐ­в " ("Є®¤_Є®­ва ЈҐ­в ", "Ё¬п", "Ё­­", " ¤аҐб", "вҐ«Ґд®­", "Їа®¤ ўҐж", "Ї®ЄгЇ вҐ«м") FROM stdin;
000000001	ЋЋЋ "Џ®бв ўЄ "		Ј.ЏпвЁЈ®абЄ	+79198634592	t	t
000000002	ЋЋЋ "ЉЁ­®вҐ ва Љў ­в"	26320045123	Ј. †Ґ«Ґ§­®ў®¤бЄ, г«. ЊЁа , 123	+79884581555	t	f
000000008	ЋЋЋ "Ќ®ўл© JDTO"	26320045111	Ј. †Ґ«Ґ§­®ў®¤бг	+79884581555	t	f
000000003	ЋЋЋ "ђ®¬ иЄ "	4140784214	Ј. Ћ¬бЄ, г«. ‘ва®ЁвҐ«Ґ©, 294	+79882584546	f	t
000000009	ЋЋЋ "€ЇЇ®¤а®¬"	5874045632	Ј. “д , г«. Ќ ЎҐаҐ¦­ п,  37	+79627486389	t	t
000000010	ЋЋЋ "Ђбб®«м"	2629011278	Ј. Љ «гЈ , г«. ЏгиЄЁ­ , 94	+79184572398	f	t
\.


--
-- Data for Name: Їа®¤гЄжЁп; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Їа®¤гЄжЁп" ("Є®¤_Їа®¤гЄжЁЁ", "­ Ё¬Ґ­®ў ­ЁҐ_Їа®¤гЄжЁЁ", "Є®¤_жҐ­л_Їа®¤гЄжЁЁ", "Є®¤_бЇҐжЁдЁЄ жЁЁ", "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") FROM stdin;
Џђ-000001	‘¬Ґв ­  Є« ббЁзҐбЄ п 15% 540Ј.	1	1	1
\.


--
-- Data for Name: б®бв ў_§ Є § ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."б®бв ў_§ Є § " ("Є®¤_б®бв ў _§ Є § ", "Є®¤_§ Є § ", "Є®¤_Їа®¤гЄжЁЁ", "Є®«ЁзҐбвў®", "жҐ­ ", "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") FROM stdin;
1	1	Џђ-000001	2.000	89.00	1
\.


--
-- Data for Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ" ("Є®¤_б®бв ў _бЇҐжЁдЁЄ жЁЁ", "Є®¤_бЇҐжЁдЁЄ жЁЁ", "Є®¤_¬ вҐаЁ « ", "Є®«ЁзҐбвў®", "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") FROM stdin;
1	1	Ќ”-00000004	0.900	2
2	1	Ќ”-00000005	0.070	2
\.


--
-- Data for Name: бЇҐжЁдЁЄ жЁп; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."бЇҐжЁдЁЄ жЁп" ("Є®¤_бЇҐжЁдЁЄ жЁЁ", "Ё¬п_бЇҐжЁдЁЄ жЁЁ", "Є®«ЁзҐбвў®", "Ё§Ј®в®ўЁвҐ«м", "Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") FROM stdin;
1	Ћб­®ў­ п ‘¬Ґв ­  15%	1.000	000000001	1
\.


--
-- Data for Name: жҐ­ _¬ вҐаЁ « ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."жҐ­ _¬ вҐаЁ « " ("Є®¤_жҐ­л_¬ вҐаЁ « ", "¤ в ", "жҐ­ ") FROM stdin;
1	2025-06-01	40.00
2	2025-06-01	10.00
3	2025-06-01	45.00
4	2025-06-01	34.00
\.


--
-- Data for Name: жҐ­ _Їа®¤гЄжЁЁ; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."жҐ­ _Їа®¤гЄжЁЁ" ("Є®¤_жҐ­л_Їа®¤гЄжЁЁ", "¤ в ", "жҐ­ ") FROM stdin;
1	2025-06-01	89.00
2	2025-06-01	80.00
3	2025-06-01	82.00
4	2025-06-01	70.00
\.


--
-- Data for Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп" ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп", "­ Ё¬Ґ­®ў ­ЁҐ_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") FROM stdin;
1	ив
2	ЄЈ
3	«
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: § Є §_Є®¤_§ Є § _seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."§ Є §_Є®¤_§ Є § _seq"', 1, true);


--
-- Name: б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."б®бв ў_§ Є § _Є®¤_б®бв ў _§ Є §_seq"', 1, true);


--
-- Name: б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."б®бв ў_бЇҐжЁдЁЄ_Є®¤_б®бв ў _бЇҐ_seq"', 2, true);


--
-- Name: бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."бЇҐжЁдЁЄ жЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_seq"', 1, true);


--
-- Name: жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."жҐ­ _¬ вҐаЁ « _Є®¤_жҐ­л_¬ вҐаЁ _seq"', 4, true);


--
-- Name: жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."жҐ­ _Їа®¤гЄжЁЁ_Є®¤_жҐ­л_Їа®¤гЄж_seq"', 4, true);


--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_seq"', 3, true);


--
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: § Є § § Є §_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."§ Є §"
    ADD CONSTRAINT "§ Є §_pkey" PRIMARY KEY ("Є®¤_§ Є § ");


--
-- Name: ¬ вҐаЁ «л ¬ вҐаЁ «л_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."¬ вҐаЁ «л"
    ADD CONSTRAINT "¬ вҐаЁ «л_pkey" PRIMARY KEY ("Є®¤_¬ вҐаЁ « ");


--
-- Name: Є®­ва ЈҐ­в  Є®­ва ЈҐ­в _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Є®­ва ЈҐ­в "
    ADD CONSTRAINT "Є®­ва ЈҐ­в _pkey" PRIMARY KEY ("Є®¤_Є®­ва ЈҐ­в ");


--
-- Name: Їа®¤гЄжЁп Їа®¤гЄжЁп_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Їа®¤гЄжЁп"
    ADD CONSTRAINT "Їа®¤гЄжЁп_pkey" PRIMARY KEY ("Є®¤_Їа®¤гЄжЁЁ");


--
-- Name: б®бв ў_§ Є §  б®бв ў_§ Є § _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_§ Є § "
    ADD CONSTRAINT "б®бв ў_§ Є § _pkey" PRIMARY KEY ("Є®¤_б®бв ў _§ Є § ");


--
-- Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ б®бв ў_бЇҐжЁдЁЄ жЁЁ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ"
    ADD CONSTRAINT "б®бв ў_бЇҐжЁдЁЄ жЁЁ_pkey" PRIMARY KEY ("Є®¤_б®бв ў _бЇҐжЁдЁЄ жЁЁ");


--
-- Name: бЇҐжЁдЁЄ жЁп бЇҐжЁдЁЄ жЁп_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."бЇҐжЁдЁЄ жЁп"
    ADD CONSTRAINT "бЇҐжЁдЁЄ жЁп_pkey" PRIMARY KEY ("Є®¤_бЇҐжЁдЁЄ жЁЁ");


--
-- Name: жҐ­ _¬ вҐаЁ «  жҐ­ _¬ вҐаЁ « _pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."жҐ­ _¬ вҐаЁ « "
    ADD CONSTRAINT "жҐ­ _¬ вҐаЁ « _pkey" PRIMARY KEY ("Є®¤_жҐ­л_¬ вҐаЁ « ");


--
-- Name: жҐ­ _Їа®¤гЄжЁЁ жҐ­ _Їа®¤гЄжЁЁ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."жҐ­ _Їа®¤гЄжЁЁ"
    ADD CONSTRAINT "жҐ­ _Їа®¤гЄжЁЁ_pkey" PRIMARY KEY ("Є®¤_жҐ­л_Їа®¤гЄжЁЁ");


--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_­ Ё¬Ґ­®ў ­ЁҐ_Ґ¤_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"
    ADD CONSTRAINT "Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­_­ Ё¬Ґ­®ў ­ЁҐ_Ґ¤_key" UNIQUE ("­ Ё¬Ґ­®ў ­ЁҐ_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- Name: Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"
    ADD CONSTRAINT "Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп_pkey" PRIMARY KEY ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- Name: § Є § § Є §_Є®¤_Ї®ЄгЇ вҐ«п_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."§ Є §"
    ADD CONSTRAINT "§ Є §_Є®¤_Ї®ЄгЇ вҐ«п_fkey" FOREIGN KEY ("Є®¤_Ї®ЄгЇ вҐ«п") REFERENCES public."Є®­ва ЈҐ­в "("Є®¤_Є®­ва ЈҐ­в ");


--
-- Name: § Є § § Є §_Є®¤_Їа®¤ ўж _fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."§ Є §"
    ADD CONSTRAINT "§ Є §_Є®¤_Їа®¤ ўж _fkey" FOREIGN KEY ("Є®¤_Їа®¤ ўж ") REFERENCES public."Є®­ва ЈҐ­в "("Є®¤_Є®­ва ЈҐ­в ");


--
-- Name: ¬ вҐаЁ «л ¬ вҐаЁ «л_Є®¤_жҐ­л_¬ вҐаЁ « _fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."¬ вҐаЁ «л"
    ADD CONSTRAINT "¬ вҐаЁ «л_Є®¤_жҐ­л_¬ вҐаЁ « _fkey" FOREIGN KEY ("Є®¤_жҐ­л_¬ вҐаЁ « ") REFERENCES public."жҐ­ _¬ вҐаЁ « "("Є®¤_жҐ­л_¬ вҐаЁ « ");


--
-- Name: ¬ вҐаЁ «л ¬ вҐаЁ «л_Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ё_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."¬ вҐаЁ «л"
    ADD CONSTRAINT "¬ вҐаЁ «л_Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ё_fkey" FOREIGN KEY ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") REFERENCES public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- Name: Їа®¤гЄжЁп Їа®¤гЄжЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Їа®¤гЄжЁп"
    ADD CONSTRAINT "Їа®¤гЄжЁп_Є®¤_бЇҐжЁдЁЄ жЁЁ_fkey" FOREIGN KEY ("Є®¤_бЇҐжЁдЁЄ жЁЁ") REFERENCES public."бЇҐжЁдЁЄ жЁп"("Є®¤_бЇҐжЁдЁЄ жЁЁ");


--
-- Name: Їа®¤гЄжЁп Їа®¤гЄжЁп_Є®¤_жҐ­л_Їа®¤гЄжЁЁ_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Їа®¤гЄжЁп"
    ADD CONSTRAINT "Їа®¤гЄжЁп_Є®¤_жҐ­л_Їа®¤гЄжЁЁ_fkey" FOREIGN KEY ("Є®¤_жҐ­л_Їа®¤гЄжЁЁ") REFERENCES public."жҐ­ _Їа®¤гЄжЁЁ"("Є®¤_жҐ­л_Їа®¤гЄжЁЁ");


--
-- Name: Їа®¤гЄжЁп Їа®¤гЄжЁп_Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ё_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Їа®¤гЄжЁп"
    ADD CONSTRAINT "Їа®¤гЄжЁп_Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ё_fkey" FOREIGN KEY ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") REFERENCES public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- Name: б®бв ў_§ Є §  б®бв ў_§ Є § _Є®¤_§ Є § _fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_§ Є § "
    ADD CONSTRAINT "б®бв ў_§ Є § _Є®¤_§ Є § _fkey" FOREIGN KEY ("Є®¤_§ Є § ") REFERENCES public."§ Є §"("Є®¤_§ Є § ") ON DELETE CASCADE;


--
-- Name: б®бв ў_§ Є §  б®бв ў_§ Є § _Є®¤_Їа®¤гЄжЁЁ_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_§ Є § "
    ADD CONSTRAINT "б®бв ў_§ Є § _Є®¤_Їа®¤гЄжЁЁ_fkey" FOREIGN KEY ("Є®¤_Їа®¤гЄжЁЁ") REFERENCES public."Їа®¤гЄжЁп"("Є®¤_Їа®¤гЄжЁЁ");


--
-- Name: б®бв ў_§ Є §  б®бв ў_§ Є § _Є®¤_Ґ¤Ё­Ёжл_Ё§¬Ґа_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_§ Є § "
    ADD CONSTRAINT "б®бв ў_§ Є § _Є®¤_Ґ¤Ё­Ёжл_Ё§¬Ґа_fkey" FOREIGN KEY ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") REFERENCES public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ б®бв ў_бЇҐжЁдЁЄ_Є®¤_бЇҐжЁдЁЄ ж_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ"
    ADD CONSTRAINT "б®бв ў_бЇҐжЁдЁЄ_Є®¤_бЇҐжЁдЁЄ ж_fkey" FOREIGN KEY ("Є®¤_бЇҐжЁдЁЄ жЁЁ") REFERENCES public."бЇҐжЁдЁЄ жЁп"("Є®¤_бЇҐжЁдЁЄ жЁЁ") ON DELETE CASCADE;


--
-- Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ б®бв ў_бЇҐжЁдЁЄ_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ"
    ADD CONSTRAINT "б®бв ў_бЇҐжЁдЁЄ_Є®¤_Ґ¤Ё­Ёжл_Ё§¬_fkey" FOREIGN KEY ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") REFERENCES public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- Name: б®бв ў_бЇҐжЁдЁЄ жЁЁ б®бв ў_бЇҐжЁдЁЄ _Є®¤_¬ вҐаЁ « _fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."б®бв ў_бЇҐжЁдЁЄ жЁЁ"
    ADD CONSTRAINT "б®бв ў_бЇҐжЁдЁЄ _Є®¤_¬ вҐаЁ « _fkey" FOREIGN KEY ("Є®¤_¬ вҐаЁ « ") REFERENCES public."¬ вҐаЁ «л"("Є®¤_¬ вҐаЁ « ");


--
-- Name: бЇҐжЁдЁЄ жЁп бЇҐжЁдЁЄ жЁп_Ё§Ј®в®ўЁвҐ«м_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."бЇҐжЁдЁЄ жЁп"
    ADD CONSTRAINT "бЇҐжЁдЁЄ жЁп_Ё§Ј®в®ўЁвҐ«м_fkey" FOREIGN KEY ("Ё§Ј®в®ўЁвҐ«м") REFERENCES public."Є®­ва ЈҐ­в "("Є®¤_Є®­ва ЈҐ­в ");


--
-- Name: бЇҐжЁдЁЄ жЁп бЇҐжЁдЁЄ жЁп_Є®¤_Ґ¤Ё­Ёжл_Ё§¬Ґа_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."бЇҐжЁдЁЄ жЁп"
    ADD CONSTRAINT "бЇҐжЁдЁЄ жЁп_Є®¤_Ґ¤Ё­Ёжл_Ё§¬Ґа_fkey" FOREIGN KEY ("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп") REFERENCES public."Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп"("Є®¤_Ґ¤Ё­Ёжл_Ё§¬ҐаҐ­Ёп");


--
-- PostgreSQL database dump complete
--

\unrestrict AYkYmBk0j4AaUTHNQqix7FTXlP6sbbdT3cTMfddHZbMB3fmOPufzfAquic2W7zJ

