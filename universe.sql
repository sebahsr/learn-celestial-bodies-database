--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    discovered boolean NOT NULL,
    orbital_period numeric NOT NULL,
    diameter integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    number_of_stars integer,
    discovered boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    type character varying(50),
    radius numeric,
    has_atmosphere boolean NOT NULL,
    distance_from_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    type character varying(50),
    radius numeric,
    has_life boolean NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    mass numeric,
    discovered boolean NOT NULL,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Periodic', true, 75.3, 11, 'Famous periodic comet visible to the naked eye');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Long-period', true, 2533, 60, 'One of the brightest comets seen in the 20th century');
INSERT INTO public.comet VALUES (3, 'Hyakutake', 'Long-period', true, 30000, 4, 'Known for its close approach to Earth in 1996');
INSERT INTO public.comet VALUES (4, 'Borrelly', 'Periodic', true, 6.8, 5, 'Studied by the Deep Space 1 probe');
INSERT INTO public.comet VALUES (5, 'Encke', 'Periodic', true, 3.3, 5, 'Comet with the shortest known orbital period');
INSERT INTO public.comet VALUES (6, 'Tempel 1', 'Periodic', true, 5.5, 8, 'Target of the Deep Impact mission');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 250000000, true, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000000, true, 'Closest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000000, true, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 300000000, true, 'Famous for its spiral structure');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 800000000, true, 'Galaxy with a bright core');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', 500000000, true, 'Known for its dark band of absorbing dust');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 'Moon', 1, 'Satellite', 1737, false, 384400);
INSERT INTO public.moon VALUES (17, 'Phobos', 2, 'Satellite', 11.267, false, 9376);
INSERT INTO public.moon VALUES (18, 'Deimos', 2, 'Satellite', 6.2, false, 23460);
INSERT INTO public.moon VALUES (19, 'Io', 3, 'Satellite', 1821.6, false, 421700);
INSERT INTO public.moon VALUES (20, 'Europa', 3, 'Satellite', 1560.8, true, 670900);
INSERT INTO public.moon VALUES (21, 'Ganymede', 3, 'Satellite', 2634.1, true, 1070400);
INSERT INTO public.moon VALUES (22, 'Callisto', 3, 'Satellite', 2410.3, true, 1882700);
INSERT INTO public.moon VALUES (23, 'Titan', 4, 'Satellite', 2574.73, true, 1221870);
INSERT INTO public.moon VALUES (24, 'Enceladus', 4, 'Satellite', 252.1, true, 237948);
INSERT INTO public.moon VALUES (25, 'Mimas', 4, 'Satellite', 198.2, false, 185539);
INSERT INTO public.moon VALUES (26, 'Tethys', 4, 'Satellite', 531.1, false, 294619);
INSERT INTO public.moon VALUES (27, 'Dione', 4, 'Satellite', 561.4, false, 377396);
INSERT INTO public.moon VALUES (28, 'Rhea', 4, 'Satellite', 764.5, false, 527108);
INSERT INTO public.moon VALUES (29, 'Iapetus', 4, 'Satellite', 735.6, false, 3560820);
INSERT INTO public.moon VALUES (30, 'Miranda', 7, 'Satellite', 235.8, false, 129390);
INSERT INTO public.moon VALUES (31, 'Oberon', 8, 'Satellite', 761.4, false, 583520);
INSERT INTO public.moon VALUES (32, 'Titania', 9, 'Satellite', 788.4, false, 435910);
INSERT INTO public.moon VALUES (33, 'Ariel', 10, 'Satellite', 578.9, false, 191020);
INSERT INTO public.moon VALUES (34, 'Umbriel', 11, 'Satellite', 584.7, false, 266000);
INSERT INTO public.moon VALUES (35, 'Nereid', 12, 'Satellite', 170, false, 5513819);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 6371, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 3389, false, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 69911, false, 79);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 58232, false, 83);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 'Terrestrial', 6052, false, 0);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 'Terrestrial', 2440, false, 0);
INSERT INTO public.planet VALUES (7, 'Proxima b', 2, 'Terrestrial', 7100, false, 0);
INSERT INTO public.planet VALUES (8, 'Proxima c', 2, 'Gas Giant', 125000, false, 0);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 3, 'Terrestrial', 4800, false, 0);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bc', 4, 'Terrestrial', 7100, false, 0);
INSERT INTO public.planet VALUES (11, 'Sirius b', 5, 'White Dwarf', 11800, false, 0);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 6, 'Gas Giant', 150000, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 1.0, true, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M-Type', 0.12, true, 4);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G-Type', 1.1, true, 4);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 1, 'K-Type', 0.9, true, 4);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 'A-Type', 2.1, true, 9);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 'M-Type', 20.0, true, 643);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

