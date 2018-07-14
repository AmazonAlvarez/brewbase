--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Batch; Type: TABLE; Schema: public; Owner: e
--

CREATE TABLE "Batch" (
    id integer NOT NULL,
    brand_id integer
);


ALTER TABLE "Batch" OWNER TO e;

--
-- Name: Batch_id_seq; Type: SEQUENCE; Schema: public; Owner: e
--

CREATE SEQUENCE "Batch_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Batch_id_seq" OWNER TO e;

--
-- Name: Batch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e
--

ALTER SEQUENCE "Batch_id_seq" OWNED BY "Batch".id;


--
-- Name: Brand; Type: TABLE; Schema: public; Owner: e
--

CREATE TABLE "Brand" (
    id integer NOT NULL,
    "brand-name" text NOT NULL,
    description text
);


ALTER TABLE "Brand" OWNER TO e;

--
-- Name: Brand_id_seq; Type: SEQUENCE; Schema: public; Owner: e
--

CREATE SEQUENCE "Brand_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Brand_id_seq" OWNER TO e;

--
-- Name: Brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e
--

ALTER SEQUENCE "Brand_id_seq" OWNED BY "Brand".id;


--
-- Name: Brew; Type: TABLE; Schema: public; Owner: e
--

CREATE TABLE "Brew" (
    id integer NOT NULL,
    batch_id integer
);


ALTER TABLE "Brew" OWNER TO e;

--
-- Name: User; Type: TABLE; Schema: public; Owner: e
--

CREATE TABLE "User" (
    id integer NOT NULL,
    first_name text,
    last_name text,
    email text,
    password_hash text
);


ALTER TABLE "User" OWNER TO e;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: e
--

CREATE SEQUENCE "User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO e;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: churn_id_seq; Type: SEQUENCE; Schema: public; Owner: e
--

CREATE SEQUENCE churn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE churn_id_seq OWNER TO e;

--
-- Name: churn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e
--

ALTER SEQUENCE churn_id_seq OWNED BY "Brew".id;


--
-- Name: Batch id; Type: DEFAULT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Batch" ALTER COLUMN id SET DEFAULT nextval('"Batch_id_seq"'::regclass);


--
-- Name: Brand id; Type: DEFAULT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Brand" ALTER COLUMN id SET DEFAULT nextval('"Brand_id_seq"'::regclass);


--
-- Name: Brew id; Type: DEFAULT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Brew" ALTER COLUMN id SET DEFAULT nextval('churn_id_seq'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: e
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Name: Batch Batch_pkey; Type: CONSTRAINT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Batch"
    ADD CONSTRAINT "Batch_pkey" PRIMARY KEY (id);


--
-- Name: Brand Brand_pkey; Type: CONSTRAINT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: e
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Brew churn_pkey; Type: CONSTRAINT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Brew"
    ADD CONSTRAINT churn_pkey PRIMARY KEY (id);


--
-- Name: Brew batch_id; Type: FK CONSTRAINT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Brew"
    ADD CONSTRAINT batch_id FOREIGN KEY (batch_id) REFERENCES "Batch"(id);


--
-- Name: Batch brand_id; Type: FK CONSTRAINT; Schema: public; Owner: e
--

ALTER TABLE ONLY "Batch"
    ADD CONSTRAINT brand_id FOREIGN KEY (brand_id) REFERENCES "Brand"(id);


--
-- PostgreSQL database dump complete
--

