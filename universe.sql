--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    description text,
    type character varying(30),
    distance_in_million_light_years numeric(10,2)
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
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
    name character varying(30) NOT NULL,
    description text,
    distance_in_million_kilometers numeric(10,2),
    age_in_million_of_years integer,
    is_spherical boolean,
    has_life boolean,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_in_light_years numeric(10,2),
    age_in_million_of_years integer,
    num_planets integer,
    galaxy_id integer
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
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_types_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_types_id_seq OWNED BY public.star_types.star_types_id;


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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_types_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'This is the galaxy containing the Sun and its Solar System, and therefore Earth', 'Barred spiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda', 'Barred spiral', 2.53);
INSERT INTO public.galaxy VALUES (3, 'Barnard''s Galaxy', 'NGC 6822 (also known as Barnard''s Galaxy, IC 4895, or Caldwell 57) is a barred irregular galaxy approximately 1.6 million light-years away in the constellation Sagittarius. Part of the Local Group of galaxies, it was discovered by E. E. Barnard in 1884, with a six-inch refractor telescope. It is the closest non-satellite galaxy to the Milky Way, but lies just outside its virial radius.', 'Barred irregular', 1.60);
INSERT INTO public.galaxy VALUES (4, 'Bode''s Galaxy', 'Messier 81 (also known as NGC 3031 or Bode''s Galaxy) is a grand design spiral galaxy about 12 million light-years away in the constellation Ursa Major. It has a D25 isophotal diameter of 29.44 kiloparsecs (96,000 light-years). Because of its relative proximity to the Milky Way galaxy, large size, and active galactic nucleus (which harbors a 70 million M. supermassive black hole), Messier 81 has been studied extensively by professional astronomers. The galaxy''s large size and relatively high brightness also makes it a popular target for amateur astronomers.', 'Spiral', 12.00);
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 'NGC 4567 and NGC 4568 (nicknamed the Butterfly Galaxies or Siamese Twins) are a set of unbarred spiral galaxies about 60 million light-years away in the constellation Virgo. They were both discovered by William Herschel in 1784. They are part of the Virgo Cluster of galaxies.', 'Unbarred spiral', 60.00);
INSERT INTO public.galaxy VALUES (6, 'Eye of Sauron', 'NGC 4151 is an intermediate spiral Seyfert galaxy with weak inner ring structure located 15.8 megaparsecs (52 million light-years) from Earth in the constellation Canes Venatici. The galaxy was first mentioned by William Herschel on March 17, 1787; it was one of the six Seyfert galaxies described in the paper which defined the term. It is one of the nearest galaxies to Earth to contain an actively growing supermassive black hole. The black hole would have a mass on the order of 2.5 million to 30 million solar masses.', 'Seyfert', 52.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earth''s only natural satellite. It orbits around Earth at an average distance of 384399 km (238854 mi; about 30 times Earth''s diameter). Its orbital period (lunar month) and its rotation period (lunar day) are synchronized at 29.5 days by Earth''s gravity pulling on the Moon. This makes the Moon tidally locked to Earth, always facing it with the same side. Conversely, the Moon''s gravitational pull produces tidal forces on Earth, which are the main driver of Earth''s tides.', true, false, 1);
INSERT INTO public.moon VALUES (2, 'Proteus', 'Proteus, also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune''s largest inner satellite. Discovered by Voyager 2 in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology. Proteus orbits Neptune in a nearly equatorial orbit at a distance of about 4.75 times the radius of Neptune''s equator.', false, false, 2);
INSERT INTO public.moon VALUES (3, 'Triton', 'Triton is the largest natural satellite of the planet Neptune. It is the only moon of Neptune massive enough to be rounded under its own gravity and hosts a thin, hazy atmosphere. Triton orbits Neptune in a retrograde orbit—revolving in the opposite direction to the parent planet''s rotation—the only large moon in the Solar System to do so. Triton is thought to have once been a dwarf planet from the Kuiper belt, captured into Neptune''s orbit by the latter''s gravity.', true, false, 2);
INSERT INTO public.moon VALUES (4, 'Nereid', 'Nereid, or Neptune II, is the third-largest moon of Neptune. It has the most eccentric orbit of all known moons in the Solar System. It was the second moon of Neptune to be discovered, by Gerard Kuiper in 1949.', false, false, 2);
INSERT INTO public.moon VALUES (5, 'Phobos', 'Phobos is the innermost and larger of the two natural satellites of Mars, the other being Deimos. The two moons were discovered in 1877 by American astronomer Asaph Hall. Phobos is named after the Greek god of fear and panic, who is the son of Ares (Mars) and twin brother of Deimos.', false, false, 10);
INSERT INTO public.moon VALUES (6, 'Deimos', 'Deimos is the smaller and outer of the two natural satellites of Mars, the other being Phobos. Deimos has a mean radius of 6.2 km (3.9 mi) and takes 30.3 hours to orbit Mars. Deimos is 23,460 km (14,580 mi) from Mars, much farther than Mars''s other moon, Phobos. It is named after Deimos, the Ancient Greek god and personification of dread and terror.', false, false, 10);
INSERT INTO public.moon VALUES (7, 'Metis', 'Metis, also known as Jupiter XVI, is the innermost known moon of Jupiter. It was discovered in 1979 in images taken by Voyager 1, and was named in 1983 after the Titaness Metis, the first wife of Zeus and the mother of Athena. Additional observations made between early 1996 and September 2003 by the Galileo spacecraft allowed its surface to be imaged.', false, false, 11);
INSERT INTO public.moon VALUES (8, 'Adrastea', 'Adrastea, also known as Jupiter XV, is the second by distance, and the smallest of the four inner moons of Jupiter. It was discovered in photographs taken by Voyager 2 in 1979, making it the first natural satellite to be discovered from images taken by an interplanetary spacecraft, rather than through a telescope. It was officially named after the mythological Adrasteia, foster mother of the Greek god Zeus—the equivalent of the Roman god Jupiter.', false, false, 11);
INSERT INTO public.moon VALUES (9, 'Amalthea', 'Amalthea is a moon of Jupiter. It has the third-closest orbit around Jupiter among known moons and was the fifth moon of Jupiter to be discovered, so it is also known as Jupiter V. It is also the fifth-largest moon of Jupiter, after the four Galilean moons.', false, false, 11);
INSERT INTO public.moon VALUES (10, 'Thebe', 'Thebe, also known as Jupiter XIV, is the fourth of Jupiter''s moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Jupiter. In 1983, it was officially named after the mythological nymph Thebe.', false, false, 11);
INSERT INTO public.moon VALUES (11, 'Io', 'Io is the innermost and second-smallest of the four Galilean moons of the planet Jupiter. Slightly larger than Earth''s Moon, Io is the fourth-largest natural satellite in the Solar System, has the highest density of any natural satellite, the strongest surface gravity of any natural satellite, and the lowest amount of water by atomic ratio of any known astronomical object in the Solar System.', true, false, 11);
INSERT INTO public.moon VALUES (12, 'Europa', 'Europa is a natural satellite of Jupiter. Being observable from Earth with common binoculars, it is one of the four Galilean moons. As such it is a planetary-mass moon; the smallest and least massive orbiting Jupiter, and slightly smaller and less massive than Earth''s. Europa is an icy moon, and, of the three icy Galilean moons, the closest orbiting Jupiter. As a result, it exhibits a relatively young surface, driven by tidal heating.', true, false, 11);
INSERT INTO public.moon VALUES (13, 'Ganymede', 'Ganymede is a natural satellite of Jupiter and the largest and most massive in the Solar System. Like Saturn''s largest moon Titan, it is larger than the planet Mercury, but has somewhat less surface gravity than Mercury, Io, or the Moon due to its lower density compared to the three. Ganymede orbits Jupiter in roughly seven days and is in a 1:2:4 orbital resonance with the moons Europa and Io, respectively.', true, false, 11);
INSERT INTO public.moon VALUES (14, 'Callisto', 'Callisto is the second-largest moon of Jupiter, after Ganymede. In the Solar System it is the third-largest moon after Ganymede and Saturn''s largest moon Titan, and nearly as large as the smallest planet Mercury. Callisto is, with a diameter of 4,821 km, roughly a third larger than Earth''s Moon and orbits Jupiter on average at a distance of 1,883,000 km, which is about five times further out than the Moon orbiting Earth. It is the outermost of the four large Galilean moons of Jupiter, which were discovered in 1610 with one of the first telescopes, and is today visible from Earth with common binoculars.', true, false, 11);
INSERT INTO public.moon VALUES (15, 'Enceladus', 'Enceladus is the sixth-largest moon of Saturn and the 18th-largest in the Solar System. It is about 500 kilometers (310 miles) in diameter, about a tenth of that of Saturn''s largest moon, Titan. It is covered by clean, freshly deposited snow hundreds of meters thick, making it one of the most reflective bodies of the Solar System. Consequently, its surface temperature at noon reaches only −198 °C (75.1 K; −324.4 °F), far colder than a light-absorbing body would be. Despite its small size, Enceladus has a wide variety of surface features, ranging from old, heavily cratered regions to young, tectonically deformed terrain.', true, false, 12);
INSERT INTO public.moon VALUES (16, 'Tethys', 'Tethys or Saturn III is the fifth-largest moon of Saturn, measuring about 1,060 km (660 mi) across. It was discovered by Giovanni Domenico Cassini in 1684, and is named after the titan Tethys of Greek mythology.', true, false, 12);
INSERT INTO public.moon VALUES (17, 'Dione', 'Dione, also designated Saturn IV, is the fourth-largest moon of Saturn. With a mean diameter of 1,123 km and a density of about 1.48 g/cm3, Dione is composed of an icy mantle and crust overlying a silicate rocky core, with rock and water ice roughly equal in mass. Its trailing hemisphere is marked by large cliffs and scarps called chasmata; the trailing hemisphere is also significantly darker compared to the leading hemisphere.', true, false, 12);
INSERT INTO public.moon VALUES (18, 'Rhea', 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System, with a surface area that is comparable to the area of Australia. It is the smallest body in the Solar System for which precise measurements have confirmed a shape consistent with hydrostatic equilibrium. Rhea has a nearly circular orbit around Saturn, but it is also tidally locked, like Saturn''s other major moons; that is, it rotates with the same period it revolves (orbits), so one hemisphere always faces towards the planet.', true, false, 12);
INSERT INTO public.moon VALUES (19, 'Titan', 'Titan is the largest moon of Saturn and the second-largest in the Solar System. It is the only moon known to have an atmosphere denser than the Earth''s and is the only known object in space—other than Earth—on which there is clear evidence that stable bodies of liquid exist. Titan is one of seven gravitationally rounded moons of Saturn and the second-most distant among them. Frequently described as a planet-like moon, Titan is 50% larger in diameter than Earth''s Moon and 80% more massive. It is the second-largest moon in the Solar System after Jupiter''s Ganymede and is larger than Mercury; yet Titan is only 40% as massive as Mercury, because Mercury is mainly iron and rock while much of Titan is ice, which is less dense.', true, false, 12);
INSERT INTO public.moon VALUES (20, 'Iapetus', 'Iapetus is the outermost of Saturn''s large moons. With an estimated diameter of 1,469 km (913 mi), it is the third-largest moon of Saturn and the eleventh-largest in the Solar System. Named after the Titan Iapetus, the moon was discovered in 1671 by Giovanni Domenico Cassini.', true, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal.', 0.00, 4, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Neptune', 'Dark, cold, and whipped by supersonic winds, ice giant Neptune is more than 30 times as far from the Sun as Earth. Neptune is the only planet in our solar system not visible to the naked eye. In 2011 Neptune completed its first 165-year orbit since its discovery in 1846.', 4500.00, 4, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri d', 'Proxima Centauri d (also called Proxima d) is a candidate exoplanet orbiting the red dwarf star Proxima Centauri, the closest star to the Sun and part of the Alpha Centauri triple star system. Together with two other planets in the Proxima Centauri system, it is the closest known exoplanet to the Solar System, located approximately 4.2 light-years (1.3 parsecs; 40 trillion kilometres; 25 trillion miles) away in the constellation of Centaurus. The first signs of the exoplanet emerged as a weak 5.15-day signal in radial velocity data taken from the Very Large Telescope during a 2020 study on Proxima b''s mass. This signal was formally proposed to be a candidate exoplanet by Faria et al. in a follow-up paper published in February 2022.', NULL, 4850, true, false, 2);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri b', 'Proxima Centauri b is an exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri in the constellation Centaurus. It can also be referred to as Proxima b or Alpha Centauri Cb. The host star is the closest star to the Sun, at a distance of about 4.2 light-years (1.3 parsecs) from Earth, and is part of the larger triple star system Alpha Centauri. Proxima b and Proxima d, along with the currently disputed Proxima c, are the closest known exoplanets to the Solar System.', NULL, 4850, true, false, 2);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri c', 'Proxima Centauri c (also called Proxima c or Alpha Centauri Cc) is a controversial exoplanet candidate, claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system.', NULL, 4850, true, false, 2);
INSERT INTO public.planet VALUES (6, 'Barnard''s Star b', 'Barnard''s Star b, or Barnard b, is a sub-Earth-mass exoplanet closely orbiting Barnard''s Star, a nearby red dwarf star six light-years from Earth. The planet was discovered using radial velocity observations from the ESPRESSO spectrograph on the Very Large Telescope, and was announced on 1 October 2024. It is the second from its star of four known planets in its system.', NULL, 10000, true, false, 3);
INSERT INTO public.planet VALUES (7, 'Epsilon Eridani b', 'Epsilon Eridani b, formally named AEgir, is an exoplanet approximately 10.5 light-years away orbiting the star Epsilon Eridani, in the constellation of Eridanus (the River). The planet was discovered in 2000, and as of 2024 remains the only confirmed planet in its planetary system. It is a remarkably close analog to Jupiter, with similar mass and orbit.', NULL, 500, true, false, 4);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Mercury is the smallest planet in our solar system and nearest to the Sun. It is only slightly larger than Earth''s Moon. From the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter.', 58.00, 4, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Venus', 'Venus is the second planet from the Sun, and our closest planetary neighbor. It is the hottest planet in our solar system, and is sometimes called Earth''s twin.', 38.00, 4, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Mars', 'Mars – the fourth planet from the Sun – is a dusty, cold, desert world with a very thin atmosphere. This dynamic planet has seasons, polar ice caps, extinct volcanoes, canyons and weather.', 225.00, 4, true, false, 1);
INSERT INTO public.planet VALUES (11, 'Jupiter', 'Jupiter is a world of extremes. It is the largest planet in our solar system – if it were a hollow shell, 1,000 Earths could fit inside. It is also the oldest planet, forming from the dust and gases left over from the Sun''s formation 4.6 billion years ago. But it has the shortest day in the solar system, taking about 9.9 hours to spin around once on its axis.', 778.00, 5, true, false, 1);
INSERT INTO public.planet VALUES (12, 'Saturn', 'Like fellow gas giant Jupiter, Saturn is a massive ball made mostly of hydrogen and helium. Saturn is not the only planet to have rings, but none are as spectacular or as complex as Saturn''s. Saturn also has dozens of moons.', 1400.00, 4, true, false, 1);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestial', 1);
INSERT INTO public.planet_types VALUES (2, 'Ice giant', 2);
INSERT INTO public.planet_types VALUES (3, 'Terrestial', 3);
INSERT INTO public.planet_types VALUES (4, 'Terrestial', 4);
INSERT INTO public.planet_types VALUES (5, 'Terrestial', 5);
INSERT INTO public.planet_types VALUES (6, 'Terrestial', 6);
INSERT INTO public.planet_types VALUES (7, 'Gas giant', 7);
INSERT INTO public.planet_types VALUES (8, 'Terrestial', 8);
INSERT INTO public.planet_types VALUES (9, 'Terrestial', 9);
INSERT INTO public.planet_types VALUES (10, 'Terrestial', 10);
INSERT INTO public.planet_types VALUES (11, 'Gas giant', 11);
INSERT INTO public.planet_types VALUES (12, 'Gas giant', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the centre of the Solar System. It is a massive, nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies. It is by far the most important source of energy for life on Earth. ', 0.00, 5, 8, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Proxima Centauri is the nearest star to Earth after the Sun, located 4.25 light-years away in the southern constellation of Centaurus. This object was discovered in 1915 by Robert Innes. It is a small, low-mass star, too faint to be seen with the naked eye, with an apparent magnitude of 11.13. Its Latin name means the ''nearest of Centaurus''.', 4.25, 4853, 3, 1);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 'Barnard''s Star is a small red dwarf star in the constellation of Ophiuchus. At a distance of 5.96 light-years (1.83 pc) from Earth, it is the fourth-nearest-known individual star to the Sun after the three components of the Alpha Centauri system, and is the closest star in the northern celestial hemisphere. Its stellar mass is about 16% of the Sun''s, and it has 19% of the Sun''s diameter. Despite its proximity, the star has a dim apparent visual magnitude of +9.5 and is invisible to the unaided eye; it is much brighter in the infrared than in visible light.', 5.96, 10, 4, 1);
INSERT INTO public.star VALUES (4, 'Epsilon Eridani', 'Epsilon Eridani is a star in the southern constellation of Eridanus. At a declination of −9.46°, it is visible from most of Earth''s surface. Located at a distance 10.5 light-years (3.2 parsecs) from the Sun, it has an apparent magnitude of 3.73, making it the third-closest individual star (or star system) visible to the naked eye.', 10.50, 500, 1, 1);
INSERT INTO public.star VALUES (5, 'Tau Ceti', 'Tau Ceti is a single star in the constellation Cetus that is spectrally similar to the Sun, although it has only about 78% of the Sun''s mass. At a distance of just under 12 light-years (3.7 parsecs) from the Solar System, it is a relatively nearby star and the closest solitary G-class star. The star appears stable, with little stellar variation, and is metal-deficient (low in elements other than hydrogen and helium) relative to the Sun.', 12.00, 10000, 4, 1);
INSERT INTO public.star VALUES (6, 'UGPS J072227.51−054031.2', 'UGPS J072227.51−054031.2 (designation often abbreviated to UGPS 0722−05) is a sub-brown dwarf or rogue planet of late T type, located approximately 4.1 parsecs (13 light-years) from Earth.', 13.00, 2500, 0, 1);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'Yellow dwarf', 1);
INSERT INTO public.star_types VALUES (2, 'Red dwarf', 2);
INSERT INTO public.star_types VALUES (3, 'Red dwarf', 3);
INSERT INTO public.star_types VALUES (4, 'Spectral class K2', 4);
INSERT INTO public.star_types VALUES (5, 'Spectral class G8', 5);
INSERT INTO public.star_types VALUES (6, 'Brown dwarf', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_types_star_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_types_id_seq', 6, true);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_id_key UNIQUE (planet_id);


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
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: star_types star_types_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_star_id_key UNIQUE (star_id);


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
-- Name: planet_types planet_types_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_types star_types_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

