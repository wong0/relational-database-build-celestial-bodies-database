--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

--
-- Requirements
--

--    You should create a database named universe

--    Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon

--    Each table should have a primary key

--    Each primary key should automatically increment

--    Each table should have a name column

--    You should use the INT data type for at least two columns that are not a primary or foreign key

--    You should use the NUMERIC data type at least once

--    You should use the TEXT data type at least once

--    You should use the BOOLEAN data type on at least two columns

--    Each "star" should have a foreign key that references one of the rows in galaxy

--    Each "planet" should have a foreign key that references one of the rows in star

--    Each "moon" should have a foreign key that references one of the rows in planet

--    Your database should have at least five tables

--    Each table should have at least three rows

--    The galaxy and star tables should each have at least six rows

--    The planet table should have at least 12 rows

--    The moon table should have at least 20 rows

--    Each table should have at least three columns

--    The galaxy, star, planet, and moon tables should each have at least five columns

--    At least two columns per table should not accept NULL values

--    At least one column from each table should be required to be UNIQUE

--    All columns named name should be of type VARCHAR

--    Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id

--    Each foreign key column should have the same name as the column it is referencing

--


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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    family character varying(30),
    hemisphere character varying(20),
    stars_with_planets integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type text NOT NULL,
    size_ly numeric,
    is_satellite boolean,
    size integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    type text NOT NULL,
    size_ly numeric,
    is_satellite boolean,
    size integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    type text NOT NULL,
    size_ly numeric,
    size integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    magnitude numeric(3,2) NOT NULL,
    spectral_class character varying(20),
    constellation_id integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'c1', 'family1', 'hemisphere1', 7);
INSERT INTO public.constellation VALUES (2, 'c2', 'family2', 'hemisphere2', 7000);
INSERT INTO public.constellation VALUES (3, 'c3', 'family3', 'hemisphere3', 8900);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 1, 'spiral', 87400, false, NULL);
INSERT INTO public.galaxy VALUES ('canis major', 2, 'irregular', 10000, true, NULL);
INSERT INTO public.galaxy VALUES ('sagdeg', 4, 'elliptical', 5000, true, NULL);
INSERT INTO public.galaxy VALUES ('LMC', 5, 'irregular', 7000, false, NULL);
INSERT INTO public.galaxy VALUES ('ANDROMEDA', 6, 'spiral', 110000, false, NULL);
INSERT INTO public.galaxy VALUES ('Trirangulum galaxy', 7, 'spiral', 30000, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', 1, '3476', 384400, true, 3, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, '22000', 9380, true, 4, NULL);
INSERT INTO public.moon VALUES ('Deimos', 3, '12', 23460, true, 4, NULL);
INSERT INTO public.moon VALUES ('Europa', 4, '3122', 671100, true, 5, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 5, '5262', 1070400, true, 5, NULL);
INSERT INTO public.moon VALUES ('Io', 6, '3643', 421800, true, 5, NULL);
INSERT INTO public.moon VALUES ('Callisto', 7, '4821', 1882700, true, 5, NULL);
INSERT INTO public.moon VALUES ('Mimas', 8, '397', 185520, true, 6, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 9, '503', 238020, true, 6, NULL);
INSERT INTO public.moon VALUES ('Tethys', 10, '1066', 294660, true, 6, NULL);
INSERT INTO public.moon VALUES ('Dione', 11, '1123', 377400, true, 6, NULL);
INSERT INTO public.moon VALUES ('Rhea', 12, '1529', 527040, true, 6, NULL);
INSERT INTO public.moon VALUES ('Titan', 13, '5151', 1221850, true, 6, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 14, '1472', 3561300, true, 6, NULL);
INSERT INTO public.moon VALUES ('Miranda', 15, '471', 129780, true, 7, NULL);
INSERT INTO public.moon VALUES ('Ariel', 16, '1158', 191240, true, 7, NULL);
INSERT INTO public.moon VALUES ('Umbriel', 17, '1170', 265970, true, 7, NULL);
INSERT INTO public.moon VALUES ('Titania', 18, '1578', 435840, true, 7, NULL);
INSERT INTO public.moon VALUES ('Oberon', 19, '1523', 582600, true, 7, NULL);
INSERT INTO public.moon VALUES ('Triton', 20, '2700', 354800, false, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, '1', 4880, 4880);
INSERT INTO public.planet VALUES ('Venus', 2, '2', 12103, 12103);
INSERT INTO public.planet VALUES ('Earth', 3, '1', 12756, 12756);
INSERT INTO public.planet VALUES ('Mars', 4, '3', 6794, 6794);
INSERT INTO public.planet VALUES ('Jupiter', 5, '1', 142984, 142984);
INSERT INTO public.planet VALUES ('Saturn', 6, '1', 120536, 120536);
INSERT INTO public.planet VALUES ('Uranus', 7, '1', 51118, 51118);
INSERT INTO public.planet VALUES ('Neptune', 8, '1', 49492, 49492);
INSERT INTO public.planet VALUES ('kepler-90c', 9, '3', 23088, 23088);
INSERT INTO public.planet VALUES ('kepler-90i', 11, '3', 16800, 16800);
INSERT INTO public.planet VALUES ('kepler-90b', 12, '3', 16710, 16710);
INSERT INTO public.planet VALUES ('kepler-90z', 13, '4', 16710, 16710);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1.00, '1', 1, 1);
INSERT INTO public.star VALUES (2, 'Nu2 Cn', 2.00, '2', 2, 2);
INSERT INTO public.star VALUES (3, 'kepler-90', 3.00, '3', 3, 2);
INSERT INTO public.star VALUES (4, 'proxima centaury', 4.00, '4', 4, 2);
INSERT INTO public.star VALUES (5, 'trappist-1', 5.00, '5', 5, 1);
INSERT INTO public.star VALUES (6, 'tau ceti', 6.00, '6', 6, 1);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

