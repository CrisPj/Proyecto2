--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudad (
    id_ciudad integer NOT NULL,
    ciudad character varying(500) NOT NULL
);


ALTER TABLE ciudad OWNER TO postgres;

--
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudad_id_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudad_id_ciudad_seq OWNER TO postgres;

--
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudad_id_ciudad_seq OWNED BY ciudad.id_ciudad;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    id integer NOT NULL,
    nombre character varying(200),
    apellido_paterno character varying(100),
    apellido_materno character varying(100),
    direccion character varying(300),
    direccion_facturacion character varying(300),
    metodo_pago integer,
    username character varying(180) NOT NULL,
    username_canonical character varying(180) NOT NULL,
    email character varying(180) NOT NULL,
    email_canonical character varying(180) NOT NULL,
    enabled boolean NOT NULL,
    salt character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    locked boolean NOT NULL,
    expired boolean NOT NULL,
    expires_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    confirmation_token character varying(180) DEFAULT NULL::character varying,
    password_requested_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    roles text NOT NULL,
    credentials_expired boolean NOT NULL,
    credentials_expire_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE cliente OWNER TO postgres;

--
-- Name: COLUMN cliente.roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cliente.roles IS '(DC2Type:array)';


--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO postgres;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- Name: cupones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cupones (
    id_cupon integer NOT NULL,
    cupon character varying(15) NOT NULL,
    estado boolean,
    porcentaje integer
);


ALTER TABLE cupones OWNER TO postgres;

--
-- Name: cupones_id_cupon_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cupones_id_cupon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cupones_id_cupon_seq OWNER TO postgres;

--
-- Name: cupones_id_cupon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cupones_id_cupon_seq OWNED BY cupones.id_cupon;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hotel (
    id_hotel integer NOT NULL,
    hotel character varying(200),
    costo integer,
    capacidad integer,
    id_ciudad integer
);


ALTER TABLE hotel OWNER TO postgres;

--
-- Name: hotel_id_hotel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hotel_id_hotel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_id_hotel_seq OWNER TO postgres;

--
-- Name: hotel_id_hotel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hotel_id_hotel_seq OWNED BY hotel.id_hotel;


--
-- Name: metodo_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE metodo_pago (
    id_metodo_pago integer NOT NULL,
    metodo_pago character varying(100)
);


ALTER TABLE metodo_pago OWNER TO postgres;

--
-- Name: metodo_pago_id_metodo_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metodo_pago_id_metodo_pago_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metodo_pago_id_metodo_pago_seq OWNER TO postgres;

--
-- Name: metodo_pago_id_metodo_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE metodo_pago_id_metodo_pago_seq OWNED BY metodo_pago.id_metodo_pago;


--
-- Name: reservacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reservacion (
    id_reservacion integer NOT NULL,
    id_cliente integer NOT NULL,
    id_vuelo integer NOT NULL,
    id_hotel integer,
    total integer
);


ALTER TABLE reservacion OWNER TO postgres;

--
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reservacion_id_reservacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservacion_id_reservacion_seq OWNER TO postgres;

--
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reservacion_id_reservacion_seq OWNED BY reservacion.id_reservacion;


--
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo (
    id_tipo integer NOT NULL,
    tipo character varying(200) NOT NULL
);


ALTER TABLE tipo OWNER TO postgres;

--
-- Name: tipo_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_id_tipo_seq OWNER TO postgres;

--
-- Name: tipo_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_id_tipo_seq OWNED BY tipo.id_tipo;


--
-- Name: vuelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vuelo (
    id_vuelo integer NOT NULL,
    fecha date,
    origen integer,
    destino integer,
    id_tipo integer,
    precio numeric,
    hora timestamp without time zone
);


ALTER TABLE vuelo OWNER TO postgres;

--
-- Name: vuelo_id_vuelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vuelo_id_vuelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vuelo_id_vuelo_seq OWNER TO postgres;

--
-- Name: vuelo_id_vuelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vuelo_id_vuelo_seq OWNED BY vuelo.id_vuelo;


--
-- Name: id_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad ALTER COLUMN id_ciudad SET DEFAULT nextval('ciudad_id_ciudad_seq'::regclass);


--
-- Name: id_cupon; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cupones ALTER COLUMN id_cupon SET DEFAULT nextval('cupones_id_cupon_seq'::regclass);


--
-- Name: id_hotel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hotel ALTER COLUMN id_hotel SET DEFAULT nextval('hotel_id_hotel_seq'::regclass);


--
-- Name: id_metodo_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metodo_pago ALTER COLUMN id_metodo_pago SET DEFAULT nextval('metodo_pago_id_metodo_pago_seq'::regclass);


--
-- Name: id_reservacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservacion ALTER COLUMN id_reservacion SET DEFAULT nextval('reservacion_id_reservacion_seq'::regclass);


--
-- Name: id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo ALTER COLUMN id_tipo SET DEFAULT nextval('tipo_id_tipo_seq'::regclass);


--
-- Name: id_vuelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vuelo ALTER COLUMN id_vuelo SET DEFAULT nextval('vuelo_id_vuelo_seq'::regclass);


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id_ciudad, ciudad) FROM stdin;
1	Mexico
2	USA
3	Canada
4	España
5	Japon
6	Rusia
\.


--
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudad_id_ciudad_seq', 6, true);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (id, nombre, apellido_paterno, apellido_materno, direccion, direccion_facturacion, metodo_pago, username, username_canonical, email, email_canonical, enabled, salt, password, last_login, locked, expired, expires_at, confirmation_token, password_requested_at, roles, credentials_expired, credentials_expire_at) FROM stdin;
2	Apolo	lopez	lopez	apolo123	apolonio123	3	asd	asd	a@a.com	a@a.com	t	sfx7z5hvomosswkkocccsws48004kc0	$2y$13$KecETxP/t77FoPM6/BMDFuTFxeLKpP.S8BEU.gau3fYcni7Q8zv5C	2016-11-13 21:48:21	f	f	\N	\N	\N	a:0:{}	f	\N
1	Cristian	Perez	Juarez	Por ahi 123	Por ahi 321	1	123	123	admin@admin.com	admin@admin.com	t	qjigc043sxwgg8k88wwwg8c8c8gscc4	$2y$13$e541ANK0Cj4zSibN5ayV7.EvHXe86X4pMzCRNL7c/OFmJf7fKMlRe	2016-11-14 13:23:04	f	f	\N	\N	\N	a:0:{}	f	\N
\.


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 2, true);


--
-- Data for Name: cupones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cupones (id_cupon, cupon, estado, porcentaje) FROM stdin;
1	ABC123	f	20
\.


--
-- Name: cupones_id_cupon_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cupones_id_cupon_seq', 1, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hotel (id_hotel, hotel, costo, capacidad, id_ciudad) FROM stdin;
1	Hotel A	123	100	1
2	Hotel B	123	100	2
3	Hotel C	123	100	3
4	Hotelazo	123	100	1
5	F.Trump	123	100	2
6	Gotel	123	100	1
\.


--
-- Name: hotel_id_hotel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hotel_id_hotel_seq', 6, true);


--
-- Data for Name: metodo_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY metodo_pago (id_metodo_pago, metodo_pago) FROM stdin;
1	Tarjeta
2	Efectivo
3	Paypal
4	OXXO
\.


--
-- Name: metodo_pago_id_metodo_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metodo_pago_id_metodo_pago_seq', 4, true);


--
-- Data for Name: reservacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reservacion (id_reservacion, id_cliente, id_vuelo, id_hotel, total) FROM stdin;
1	1	1	\N	1
1	1	2	\N	1
1	1	3	\N	1
\.


--
-- Name: reservacion_id_reservacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reservacion_id_reservacion_seq', 1, false);


--
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo (id_tipo, tipo) FROM stdin;
1	Primera Clase
2	Turista
3	Negocios
\.


--
-- Name: tipo_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_id_tipo_seq', 3, true);


--
-- Data for Name: vuelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vuelo (id_vuelo, fecha, origen, destino, id_tipo, precio, hora) FROM stdin;
1	2015-05-03	4	1	2	120	2014-01-02 06:06:00
2	2015-05-03	4	1	2	120	2014-01-02 06:06:00
3	2015-05-03	4	1	2	120	2014-01-02 06:06:00
\.


--
-- Name: vuelo_id_vuelo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vuelo_id_vuelo_seq', 3, true);


--
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: cupon_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cupones
    ADD CONSTRAINT cupon_unique UNIQUE (cupon);


--
-- Name: cupones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cupones
    ADD CONSTRAINT cupones_pkey PRIMARY KEY (id_cupon);


--
-- Name: hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id_hotel);


--
-- Name: metodo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id_metodo_pago);


--
-- Name: reservacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservacion
    ADD CONSTRAINT reservacion_pkey PRIMARY KEY (id_reservacion, id_cliente, id_vuelo);


--
-- Name: tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id_tipo);


--
-- Name: vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vuelo
    ADD CONSTRAINT vuelo_pkey PRIMARY KEY (id_vuelo);


--
-- Name: uniq_f41c9b2592fc23a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_f41c9b2592fc23a8 ON cliente USING btree (username_canonical);


--
-- Name: uniq_f41c9b25a0d96fbf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_f41c9b25a0d96fbf ON cliente USING btree (email_canonical);


--
-- Name: uniq_f41c9b25c05fb297; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_f41c9b25c05fb297 ON cliente USING btree (confirmation_token);


--
-- Name: cliente_metodo_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_metodo_pago_fkey FOREIGN KEY (metodo_pago) REFERENCES metodo_pago(id_metodo_pago);


--
-- Name: hotel_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);


--
-- Name: reservacion_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservacion
    ADD CONSTRAINT reservacion_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- Name: reservacion_id_hotel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservacion
    ADD CONSTRAINT reservacion_id_hotel_fkey FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel);


--
-- Name: vuelo_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vuelo
    ADD CONSTRAINT vuelo_destino_fkey FOREIGN KEY (destino) REFERENCES ciudad(id_ciudad);


--
-- Name: vuelo_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vuelo
    ADD CONSTRAINT vuelo_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo);


--
-- Name: vuelo_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vuelo
    ADD CONSTRAINT vuelo_origen_fkey FOREIGN KEY (origen) REFERENCES ciudad(id_ciudad);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: ciudad; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE ciudad FROM PUBLIC;
REVOKE ALL ON TABLE ciudad FROM postgres;
GRANT ALL ON TABLE ciudad TO postgres;
GRANT ALL ON TABLE ciudad TO silver;


--
-- Name: ciudad_id_ciudad_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE ciudad_id_ciudad_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE ciudad_id_ciudad_seq FROM postgres;
GRANT ALL ON SEQUENCE ciudad_id_ciudad_seq TO postgres;
GRANT ALL ON SEQUENCE ciudad_id_ciudad_seq TO silver;


--
-- Name: cliente; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cliente FROM PUBLIC;
REVOKE ALL ON TABLE cliente FROM postgres;
GRANT ALL ON TABLE cliente TO postgres;
GRANT ALL ON TABLE cliente TO silver;


--
-- Name: cliente_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE cliente_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE cliente_id_seq FROM postgres;
GRANT ALL ON SEQUENCE cliente_id_seq TO postgres;
GRANT ALL ON SEQUENCE cliente_id_seq TO silver;


--
-- Name: cupones; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE cupones FROM PUBLIC;
REVOKE ALL ON TABLE cupones FROM postgres;
GRANT ALL ON TABLE cupones TO postgres;
GRANT ALL ON TABLE cupones TO silver;


--
-- Name: cupones_id_cupon_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE cupones_id_cupon_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE cupones_id_cupon_seq FROM postgres;
GRANT ALL ON SEQUENCE cupones_id_cupon_seq TO postgres;
GRANT ALL ON SEQUENCE cupones_id_cupon_seq TO silver;


--
-- Name: hotel; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE hotel FROM PUBLIC;
REVOKE ALL ON TABLE hotel FROM postgres;
GRANT ALL ON TABLE hotel TO postgres;
GRANT ALL ON TABLE hotel TO silver;


--
-- Name: hotel_id_hotel_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE hotel_id_hotel_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE hotel_id_hotel_seq FROM postgres;
GRANT ALL ON SEQUENCE hotel_id_hotel_seq TO postgres;
GRANT ALL ON SEQUENCE hotel_id_hotel_seq TO silver;


--
-- Name: metodo_pago; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE metodo_pago FROM PUBLIC;
REVOKE ALL ON TABLE metodo_pago FROM postgres;
GRANT ALL ON TABLE metodo_pago TO postgres;
GRANT ALL ON TABLE metodo_pago TO silver;


--
-- Name: metodo_pago_id_metodo_pago_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE metodo_pago_id_metodo_pago_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE metodo_pago_id_metodo_pago_seq FROM postgres;
GRANT ALL ON SEQUENCE metodo_pago_id_metodo_pago_seq TO postgres;
GRANT ALL ON SEQUENCE metodo_pago_id_metodo_pago_seq TO silver;


--
-- Name: reservacion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE reservacion FROM PUBLIC;
REVOKE ALL ON TABLE reservacion FROM postgres;
GRANT ALL ON TABLE reservacion TO postgres;
GRANT ALL ON TABLE reservacion TO silver;


--
-- Name: reservacion_id_reservacion_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE reservacion_id_reservacion_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE reservacion_id_reservacion_seq FROM postgres;
GRANT ALL ON SEQUENCE reservacion_id_reservacion_seq TO postgres;
GRANT ALL ON SEQUENCE reservacion_id_reservacion_seq TO silver;


--
-- Name: tipo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipo FROM PUBLIC;
REVOKE ALL ON TABLE tipo FROM postgres;
GRANT ALL ON TABLE tipo TO postgres;
GRANT ALL ON TABLE tipo TO silver;


--
-- Name: tipo_id_tipo_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE tipo_id_tipo_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tipo_id_tipo_seq FROM postgres;
GRANT ALL ON SEQUENCE tipo_id_tipo_seq TO postgres;
GRANT ALL ON SEQUENCE tipo_id_tipo_seq TO silver;


--
-- Name: vuelo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vuelo FROM PUBLIC;
REVOKE ALL ON TABLE vuelo FROM postgres;
GRANT ALL ON TABLE vuelo TO postgres;
GRANT ALL ON TABLE vuelo TO silver;


--
-- Name: vuelo_id_vuelo_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE vuelo_id_vuelo_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE vuelo_id_vuelo_seq FROM postgres;
GRANT ALL ON SEQUENCE vuelo_id_vuelo_seq TO postgres;
GRANT ALL ON SEQUENCE vuelo_id_vuelo_seq TO silver;


--
-- PostgreSQL database dump complete
--

