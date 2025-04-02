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
-- Name: aliens; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.aliens (
    name character varying(30) NOT NULL,
    aliens_id integer NOT NULL,
    planet_of_origin character varying,
    planet_id integer,
    description text,
    height numeric(3,1)
);


ALTER TABLE public.aliens OWNER TO freecodecamp;

--
-- Name: aliens_aliens_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.aliens_aliens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aliens_aliens_id_seq OWNER TO freecodecamp;

--
-- Name: aliens_aliens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.aliens_aliens_id_seq OWNED BY public.aliens.aliens_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    distance_from_earth numeric(6,1),
    has_life boolean,
    is_spherical boolean,
    galaxy_type character varying(200),
    travel_days_estimate integer,
    no_of_stars_estimate character varying(300),
    name character varying(300) NOT NULL
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    description text,
    distance_from_earth numeric(6,1),
    has_life boolean,
    is_spherical boolean,
    travel_days_estimate integer,
    galaxy_id integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    description text,
    distance_from_earth numeric(6,1),
    has_life boolean,
    is_spherical boolean,
    travel_days_estimate integer,
    known_no_of_moons integer
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
    galaxy_id integer,
    description text,
    distance_from_earth numeric(6,1),
    has_life boolean,
    is_spherical boolean,
    travel_days_estimate integer,
    name character varying(300) NOT NULL
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
-- Name: aliens aliens_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliens ALTER COLUMN aliens_id SET DEFAULT nextval('public.aliens_aliens_id_seq'::regclass);


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
-- Data for Name: aliens; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.aliens VALUES ('Jovarix', 1, 'Jupiter', 5, NULL, NULL);
INSERT INTO public.aliens VALUES ('Morvian', 2, 'Mars', 4, NULL, NULL);
INSERT INTO public.aliens VALUES ('Uzarion', 3, 'Uranus', 7, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, '', NULL, true, NULL, 'Barred Spiral (SBbc)', NULL, '100–400 billion', 'Milky Way (Our Galaxy)');
INSERT INTO public.galaxy VALUES (2, '', NULL, false, NULL, 'Spiral (SA(s)b', NULL, '1 trillion', 'Andromeda Galaxy (M31)');
INSERT INTO public.galaxy VALUES (3, '', NULL, false, NULL, 'Spiral (SA(s)cd)', NULL, '40 billion', 'Triangulum Galaxy (M33)');
INSERT INTO public.galaxy VALUES (4, '', NULL, false, NULL, 'Irregular (SBm)', NULL, '30 billion', 'Large Magellanic Cloud (LMC)');
INSERT INTO public.galaxy VALUES (5, '', NULL, false, NULL, 'Irregular (SBm', NULL, '3 billion', 'Small Magellanic Cloud (SMC)');
INSERT INTO public.galaxy VALUES (6, '', NULL, false, NULL, 'Spiral (Sa)', NULL, '800 billion', 'Sombrero Galaxy (M104)');
INSERT INTO public.galaxy VALUES (7, '', NULL, false, NULL, 'Spiral (SA(s)bc)', NULL, '100 billion', 'Whirlpool Galaxy (M51)');
INSERT INTO public.galaxy VALUES (8, '', NULL, false, NULL, 'Spiral (SAB(rs)cd', NULL, '1 trillion', 'Pinwheel Galaxy (M101)');
INSERT INTO public.galaxy VALUES (9, '', NULL, false, NULL, 'Giant Elliptical (E0)', NULL, '2.7 trillion', 'Messier 87 (M87, Virgo A)');
INSERT INTO public.galaxy VALUES (10, '', NULL, false, NULL, 'Supergiant Elliptical', NULL, '100 trillion', 'IC 1101 (One of the Largest Known Galaxies)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3, 'Orbits Earth (Our only natural satellite)', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 'Orbits Mars', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 'Orbits Mars', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Io', 4, 5, 'Volcanic world, orbits Jupiter', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 'Icy world with a subsurface ocean, orbits Jupiter', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5, 'Largest moon in the Solar System, orbits Jupiter', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 'Heavily cratered, orbits Jupiter', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 'Largest Saturnian moon, has a thick atmosphere', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Enceladus', 9, 6, 'Ice-covered moon with water geysers', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Mimas', 10, 6, ' "Death Star" look-alike', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Rhea', 11, 6, 'Second-largest moon of Saturn', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Iapetus', 12, 6, 'Has two-tone coloration', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Titania', 13, 7, 'Largest Uranian moon', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Oberon', 14, 7, 'Second-largest moon of Uranus', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Ariel', 15, 7, 'One of the brightest moons of Uranus', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Umbriel', 16, 7, 'Dark, cratered moon', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Miranda', 17, 7, 'Has extreme surface features', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Triton', 18, 8, 'Largest moon of Neptune, retrograde orbit', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Proteus', 19, 8, 'Irregular-shaped moon', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Charon', 20, 9, 'Largest moon of Pluto', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Styx, Nix, Kerberos, Hydra', 21, 9, 'NO', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Dysnomia', 22, 10, 'Orbits the dwarf planet Eris', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES ('Hi’iaka & Namaka', 23, 11, 'Orbit Haumea', NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, NULL, NULL, false, NULL, NULL, 0);
INSERT INTO public.planet VALUES ('Venus', 2, 1, NULL, NULL, false, NULL, NULL, 0);
INSERT INTO public.planet VALUES ('Earth', 3, 1, NULL, NULL, true, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Mars ', 4, 1, NULL, NULL, false, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, NULL, NULL, false, NULL, NULL, 95);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, NULL, NULL, false, NULL, NULL, 146);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, NULL, NULL, false, NULL, NULL, 28);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, NULL, NULL, false, NULL, NULL, 16);
INSERT INTO public.planet VALUES ('Pluto', 9, 1, NULL, NULL, false, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('Eris', 10, 1, NULL, NULL, false, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Haumea', 11, 1, NULL, NULL, false, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Makemake', 12, 1, NULL, NULL, false, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Ceres', 13, 1, NULL, NULL, false, NULL, NULL, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Our closest star. The center of our Solar System.', NULL, NULL, NULL, NULL, 'The Sun');
INSERT INTO public.star VALUES (2, 1, 'Brightest star in the night sky', NULL, NULL, NULL, NULL, 'Sirius (Alpha Canis Majoris)');
INSERT INTO public.star VALUES (3, 1, 'Second brightest star', NULL, NULL, NULL, NULL, 'Canopus (Alpha Carinae)');
INSERT INTO public.star VALUES (4, 1, 'Closest star system to Earth (~4.37 light-years)', NULL, NULL, NULL, NULL, 'Alpha Centauri (Rigil Kentaurus)');
INSERT INTO public.star VALUES (5, 1, 'The current North Star', NULL, NULL, NULL, NULL, 'Polaris (North Star, Alpha Ursae Minoris)');
INSERT INTO public.star VALUES (6, 1, 'The closest known exoplanet host (~4.24 light-years away)', NULL, NULL, NULL, NULL, 'Proxima Centauri ');
INSERT INTO public.star VALUES (7, 2, 'A possible Wolf-Rayet star in Andromeda', NULL, NULL, NULL, NULL, 'Pa 30');
INSERT INTO public.star VALUES (8, 4, 'The star that exploded in a supernova in 1987', NULL, NULL, NULL, NULL, 'SN 1987A Progenitor Star');
INSERT INTO public.star VALUES (9, 4, 'The most massive known star (~200-300 times the Sun’s mass)', NULL, NULL, NULL, NULL, 'R136a1)');
INSERT INTO public.star VALUES (10, 5, 'Contains young, hot stars', NULL, NULL, NULL, NULL, 'NGC 346 Star Cluster');


--
-- Name: aliens_aliens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.aliens_aliens_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: aliens aliens_aliens_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliens
    ADD CONSTRAINT aliens_aliens_id_key UNIQUE (aliens_id);


--
-- Name: aliens aliens_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliens
    ADD CONSTRAINT aliens_pkey PRIMARY KEY (aliens_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: aliens aliens_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.aliens
    ADD CONSTRAINT aliens_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

