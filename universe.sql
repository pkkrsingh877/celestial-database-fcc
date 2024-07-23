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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    discovery_year integer,
    diameter_km numeric,
    orbital_period_days numeric,
    discovered_by text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    constellation text,
    origin_of_name text,
    names text
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
    year_discovered integer,
    is_habitable boolean,
    planet_id integer
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
    is_habitable boolean,
    distance_from_sun_in_million_kilometers numeric,
    year_of_discovery integer,
    number_of_moons integer,
    star_id integer
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
    description text,
    year_of_discovery integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1801, 939.4, 1680, 'Giuseppe Piazzi');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 1802, 512.6, 1682, 'Heinrich Wilhelm Olbers');
INSERT INTO public.asteroid VALUES (3, 'Juno', 1804, 234.4, 1518, 'Karl Ludwig Harding');
INSERT INTO public.asteroid VALUES (4, 'Vesta', 1807, 525.4, 1325, 'Heinrich Wilhelm Olbers');
INSERT INTO public.asteroid VALUES (5, 'Eros', 1898, 16.8, 1.76, 'Gustav Witt');
INSERT INTO public.asteroid VALUES (6, 'Hebe', 1847, 186.0, 1450, 'Karl Ludwig Hencke');
INSERT INTO public.asteroid VALUES (7, 'Hygiea', 1849, 434.0, 2200, 'Karl Ludwig Hencke');
INSERT INTO public.asteroid VALUES (8, 'Icarus', 1949, 1.1, 1.12, 'Raymond J. McNaught');
INSERT INTO public.asteroid VALUES (9, 'Apollo', 1932, 1.2, 0.93, 'Mikhail F. Lev');
INSERT INTO public.asteroid VALUES (10, 'Bennu', 1999, 500, 436, 'David J. Tholen');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'Milky appearance due to the stars seen from Earth', 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'Named after the princess Andromeda from Greek mythology', 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Triangulum', 'Named after the constellation Triangulum', 'Triangulum Galaxy, M33');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Canes Venatici', 'Named for its appearance resembling a whirlpool', 'Whirlpool Galaxy, M51');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Virgo', 'Named for its appearance resembling a sombrero hat', 'Sombrero Galaxy, M104');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Canes Venatici', 'Named for its appearance resembling a whirlpool', 'Messier 51');
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'Ursa Major', 'Named for its spiral shape resembling a pinwheel', 'Messier 101');
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Doradus', 'Named after Ferdinand Magellan who observed it', 'LMC');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1671, false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 1684, false, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 1789, false, 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 1948, false, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 1851, false, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1851, false, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 1787, false, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 1787, false, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 1846, false, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 1983, false, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 1989, false, 8);
INSERT INTO public.moon VALUES (21, 'Charon', 1978, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 57.91, 0, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 108.2, 0, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 149.6, 0, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 227.9, 0, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 778.6, 0, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1433.5, 0, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 2872.5, 0, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4495.1, 0, 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 5913.0, 0, 5, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', false, 413.0, 1801, 0, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', true, 4830, 2009, 0, 1);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', false, 1550, 1999, 0, 2);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', true, 4.24, 2016, 0, 3);
INSERT INTO public.planet VALUES (14, 'GJ 1214 b', false, 40, 2009, 0, 1);
INSERT INTO public.planet VALUES (15, '55 Cancri e', false, 41, 2004, 0, 2);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1d', true, 40, 2015, 0, 3);
INSERT INTO public.planet VALUES (17, 'HD 189733 b', false, 63, 2005, 0, 1);
INSERT INTO public.planet VALUES (18, 'WASP-12b', false, 1400, 2008, 0, 2);
INSERT INTO public.planet VALUES (19, 'Kepler-22b', true, 620, 2009, 0, 3);
INSERT INTO public.planet VALUES (20, 'LHS 1140 b', true, 200, 2017, 0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our Solar System. It is a G-type main-sequence star (G dwarf).', NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'The closest sun-like star to Earth, part of the Alpha Centauri star system.', NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 'A red dwarf star in the Alpha Centauri star system, the closest star system to Earth.', NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'The closest known star to the Sun, part of the Alpha Centauri star system.', NULL);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'A red supergiant star in the constellation Orion, one of the largest stars known.', NULL);
INSERT INTO public.star VALUES (6, 'Sirius A', 1, 'The brightest star in the night sky, part of the Sirius star system.', NULL);
INSERT INTO public.star VALUES (7, 'Sirius B', 1, 'A white dwarf star that was once a main-sequence star, part of the Sirius star system.', NULL);
INSERT INTO public.star VALUES (8, 'Vega', 1, 'A blue-white main-sequence star in the constellation Lyra, one of the most luminous stars in the Sun’s neighborhood.', NULL);
INSERT INTO public.star VALUES (9, 'Altair', 1, 'A bright star in the constellation Aquila, known for its rapid rotation.', NULL);
INSERT INTO public.star VALUES (10, 'Rigel', 1, 'A blue supergiant star in the constellation Orion, one of the most luminous stars in the night sky.', NULL);
INSERT INTO public.star VALUES (11, 'Deneb', 1, 'A blue-white supergiant star in the constellation Cygnus, one of the farthest stars visible to the naked eye.', NULL);
INSERT INTO public.star VALUES (12, 'Antares', 1, 'A red supergiant star in the constellation Scorpius, one of the largest and most luminous stars known.', NULL);
INSERT INTO public.star VALUES (13, 'Spica', 1, 'A binary star system in the constellation Virgo, consisting of a blue giant and a blue main-sequence star.', NULL);
INSERT INTO public.star VALUES (14, 'Aldebaran', 1, 'A red giant star in the constellation Taurus, often referred to as the "Eye of the Bull".', NULL);
INSERT INTO public.star VALUES (15, 'Pollux', 1, 'An orange giant star in the constellation Gemini, the brightest star in Gemini.', NULL);
INSERT INTO public.star VALUES (16, 'Arcturus', 1, 'A red giant star in the constellation Boötes, one of the brightest stars in the night sky.', NULL);
INSERT INTO public.star VALUES (17, 'Capella', 1, 'A multiple star system in the constellation Auriga, with two bright giant stars as the primary components.', NULL);
INSERT INTO public.star VALUES (18, 'Fomalhaut', 1, 'A bright star in the constellation Piscis Austrinus, known for its surrounding planetary system.', NULL);
INSERT INTO public.star VALUES (19, 'Achernar', 1, 'A blue star in the constellation Eridanus, known for its fast rotation and oblate shape.', NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

