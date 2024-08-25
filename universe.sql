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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(40) NOT NULL,
    distance_mil_ly double precision NOT NULL,
    diameter_ly integer NOT NULL,
    mass_billion_solar integer,
    stars_num_bil integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter double precision NOT NULL,
    orbital_period double precision NOT NULL,
    semi_major_axis integer NOT NULL,
    orbital_eccenticity double precision NOT NULL,
    atmoshere character varying(250) NOT NULL
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
    name character varying(50) NOT NULL,
    diameter integer,
    earth_mass real NOT NULL,
    distance_for_star real NOT NULL,
    star_id integer NOT NULL,
    moons integer,
    atmosphere_detailes character varying(250),
    surface_conditions character varying(250)
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
-- Name: resource; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.resource (
    resource_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type text NOT NULL,
    uses character varying(150) NOT NULL,
    extraction_methods character varying(250) NOT NULL,
    renewable boolean NOT NULL
);


ALTER TABLE public.resource OWNER TO freecodecamp;

--
-- Name: recource_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.recource_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recource_resource_id_seq OWNER TO freecodecamp;

--
-- Name: recource_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.recource_resource_id_seq OWNED BY public.resource.resource_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50) NOT NULL,
    declination double precision NOT NULL,
    absolute_magnitude double precision NOT NULL,
    spectral_type character varying(50) NOT NULL,
    distance double precision NOT NULL,
    radius double precision NOT NULL,
    mass double precision NOT NULL,
    luminosity double precision,
    temperature integer NOT NULL,
    million_age integer,
    galaxy_id integer NOT NULL
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
-- Name: resource resource_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource ALTER COLUMN resource_id SET DEFAULT nextval('public.recource_resource_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'TheMilkWay', 'Barred Spiral', 0, 150000, 1500, 250);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 220000, 1230, 1000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 23, 76000, 160, 100);
INSERT INTO public.galaxy VALUES (4, 'Trinagulum', 'Spiral', 3, 60000, 50, 40);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29.3, 50000, 800, 100);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21, 170000, 100, 100);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Elliptical', 12, 60000, 1000, 100);
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'Elliptical', 53.5, 240000, 2400, 1000);
INSERT INTO public.galaxy VALUES (9, 'Large Magellanic Cloud', 'Dwarf Irregular', 0.163, 14000, 10, 30);
INSERT INTO public.galaxy VALUES (10, 'Small Magellanic Cloud', 'Dwarf Irregular', 0.2, 7000, 7, 3);
INSERT INTO public.galaxy VALUES (11, 'NGC 1300', 'Barred Spiral', 61, 110000, NULL, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2, 3474, 27.3, 384400, 0.0549, 'Helium,Neon,Hydrogen');
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 22.4, 0.31891, 9378, 0.0151, 'None');
INSERT INTO public.moon VALUES (3, 'Deimos', 3, 12.4, 1.263, 23460, 0.00033, 'None');
INSERT INTO public.moon VALUES (4, 'Io', 4, 3643.2, 1.769, 421700, 0.00411, 'Sulfur,Dioxide');
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3121.6, 3.551, 671100, 0.009, 'Oxygen');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5268.2, 7154, 1070400, 0.0013, 'Oxygen,Ozone');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4820.6, 16.689, 1882700, 0.0074, 'Carbon, Dioxide');
INSERT INTO public.moon VALUES (8, 'Amalthea', 4, 167, 0.498, 181400, 0.003, 'None');
INSERT INTO public.moon VALUES (9, 'Himalia', 4, 170, 250.566, 11461000, 0.158, 'None');
INSERT INTO public.moon VALUES (10, 'Titan', 9, 5151.8, 15945, 1222000, 0.0288, 'Nitrogen,Methane');
INSERT INTO public.moon VALUES (11, 'Enceladus', 9, 504.2, 1.37, 237948, 0.0047, 'Water,Vapor,Nitrogen,Carbon,Dioxide');
INSERT INTO public.moon VALUES (12, 'Mimas', 9, 396, 0.942, 185539, 0.0196, 'None');
INSERT INTO public.moon VALUES (13, 'Tethys', 9, 1062, 1.888, 294619, 0.0001, 'None');
INSERT INTO public.moon VALUES (14, 'Dione', 9, 1122.8, 2.737, 377396, 0.0022, 'Trace,Oxygen');
INSERT INTO public.moon VALUES (15, 'Rhea', 9, 1527.6, 4.518, 527, 0.001, 'Oxygen,Carbon,Dioxide');
INSERT INTO public.moon VALUES (16, 'Iapetus', 9, 1471.2, 79.321, 3561300, 0.0283, 'None');
INSERT INTO public.moon VALUES (17, 'Hyperion', 9, 270, 21.276, 1481100, 0.123, 'None');
INSERT INTO public.moon VALUES (18, 'Phoebe', 9, 213, 550.35, 12952000, 0.156, 'None');
INSERT INTO public.moon VALUES (19, 'Janus', 9, 179, 0.694, 151472, 0.0068, 'None');
INSERT INTO public.moon VALUES (20, 'Epimetheus', 9, 116, 0.694, 151422, 0.0098, 'None');
INSERT INTO public.moon VALUES (21, 'Prometheus', 9, 86.2, 0.613, 139380, 0.0022, 'None');
INSERT INTO public.moon VALUES (22, 'Miranda', 5, 471.6, 1.413, 129390, 0.0013, 'None');
INSERT INTO public.moon VALUES (23, 'Ariel', 5, 1158.8, 2.52, 190900, 0.0012, 'None');
INSERT INTO public.moon VALUES (24, 'Umbriel', 5, 1169.4, 4.144, 266300, 0.0039, 'None');
INSERT INTO public.moon VALUES (25, 'Triton', 10, 2706.8, 5.877, 354759, 1.6e-05, 'Nitrogen,Methane,Carbon,Monoxide');
INSERT INTO public.moon VALUES (26, 'Proteus', 10, 420, 1.122, 117646, 0.00053, 'None');
INSERT INTO public.moon VALUES (27, 'Neireid', 10, 340, 360.136, 5513400, 0.7507, 'None');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Venus', 6052, 0.815, 108, 1, 0, 'Thick and Toxic', 'Rocky');
INSERT INTO public.planet VALUES (2, 'Earth', 6371, 1, 149.7, 1, 1, 'Nitrogen and Oxygen', 'Diverse');
INSERT INTO public.planet VALUES (3, 'Mars', 3390, 0.11, 227.9, 1, 2, 'Thin', 'Rocky');
INSERT INTO public.planet VALUES (4, 'Jupiter', 69911, 318, 778, 1, 79, 'Thick', 'Gas');
INSERT INTO public.planet VALUES (5, 'Uranus', 15759, 14.5, 2900, 1, 27, 'Thick', 'Gas');
INSERT INTO public.planet VALUES (6, 'Pluto', 2376, 0.002, 5900, 1, 5, 'Thin', 'Rocky');
INSERT INTO public.planet VALUES (7, 'Eris', 2326, 0.0025, 10000, 1, 1, 'Very Thin', 'Rocky');
INSERT INTO public.planet VALUES (8, 'Mercury', 4878, 0.055, 4.88, 1, 0, 'Very Thin', 'Rocky');
INSERT INTO public.planet VALUES (9, 'Neptune', 48682, 17.1, 4500, 1, 14, 'Thick', 'Gas');
INSERT INTO public.planet VALUES (10, 'Saturn', 58232, 95, 1400, 1, 83, 'Thick', 'Gas');
INSERT INTO public.planet VALUES (11, 'LHS 1678 d', NULL, 0.907, 6, 2, 0, NULL, 'Rocky');
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 15000, 1.1, 59.5, 11, 0, 'Nitrogen and Oxygen', 'Rocky');


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Center', 0, 4.83, 'G2V', 0, 1, 1, 1, 5778, 4600, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'Ursa Minor', 89.15, -3.64, 'F7lb', 433, 37.5, 5.4, 2500, 6015, 70, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Canis Major', -16.42, 1.42, 'A1V', 8.6, 1.71, 2.02, 25.4, 9940, 250, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'Centaurus', -60.5, 4.38, 'G2V', 4.37, 1.22, 1.1, 1.5, 5790, 5000, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Orion', 7.24, -5.85, 'M1-2la-lab', 642.5, 764, 18, 126000, 3500, 9, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'Orion', -8.12, -6.7, 'B8la', 860, 79, 21, 120000, 11500, 8, 1);
INSERT INTO public.star VALUES (7, 'Vega', 'Lyra', 38.47, 0.58, 'A0V', 25.04, 2.362, 2.1, 40.12, 9602, 455, 1);
INSERT INTO public.star VALUES (8, 'Canopus', 'Carina', -52.42, -5.53, 'A9ll', 310, 71, 8, 10700, 7350, 10, 1);
INSERT INTO public.star VALUES (9, 'Gliese784', 'Telescopium', -23.5, 9.42, 'MOV', 19.28, 0.56, 0.58, 0.08, 3880, NULL, 1);
INSERT INTO public.star VALUES (10, 'Nembus', 'Andromeda', 42.34, -0.2, 'K3ll', 173, 21.3, 1.8, 142, 4300, NULL, 2);
INSERT INTO public.star VALUES (11, 'Kepler-186', 'Cygnus', 50.3, 8.5, 'K1V (K-dwarf)', 500, 0.6, 0.55, 0.18, 4800, 4500, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: recource_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.recource_resource_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: resource recource_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT recource_name_key UNIQUE (name);


--
-- Name: resource recource_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT recource_pkey PRIMARY KEY (resource_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

