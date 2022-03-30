Planets
--------
- id
- planet name
- orbital period in yrs
- stars_id

Stars
--------
- id
- star name
- star temp in kelvin

Moons
--------
- id
- moon name
- planets_id

CREATE DATABASE outer_space;

CREATE TABLE stars(
id SERIAL PRIMARY KEY,
Name TEXT NOT NULL,
Star_temp_kelvin TEXT NOT NULL
);


-- Could use Name as PRIMARY KEY
-- CREATE TABLE stars(
-- Name PRIMARY KEY,
-- Star_temp_kelvin TEXT NOT NULL
-- );


INSERT INTO stars (name,star_temp_kelvin)
VALUES ('The Sun','5800°K'),
('Proxima Centauri','3042°K'),
('Gliese 876','3192°K');


CREATE TABLE planets(
id SERIAL PRIMARY KEY,
Name TEXT NOT NULL,
Orbital_period_yrs FLOAT NOT NULL,
stars_id INT REFERENCES stars);

INSERT INTO planets(Name,Orbital_period_yrs,stars_id)
VALUES
('Earth',1.00,1),
('Mars',1.882,1),
('Venus',0.62,1),
('Proxima Centauri b',0.03,2),
('Gliese 876 b',0.236,3);

CREATE TABLE moons(
id SERIAL PRIMARY KEY,
Name TEXT NOT NULL,
planets_id INT REFERENCES planets);

INSERT INTO moons(Name,planets_id)
VALUES
('The Moon',1),
('Phobos',2),
('Deimos',2);



SELECT planets.name , stars.name, COUNT(moons.id) AS moon_count
FROM  planets
LEFT OUTER JOIN moons
ON moons.planets_id = planets.id
JOIN stars
ON planets.stars_id = stars.id
GROUP BY planets.name, stars.name
ORDER BY planets.name;