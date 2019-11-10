

DROP TABLE IF EXISTS 'Movie';
CREATE TABLE 'Movie'(
    VARCHAR(255) film_title PRIMARY KEY,
    VARCHAR(255) genre,
    INT box_office,
    VARCHAR(255) director,
    VARCHAR(255) actor,
    INT year
);

DROP TABLE IF EXISTS 'Award_Movie';
CREATE TABLE 'Award_Movie'(
    VARCHAR(255) film_title PRIMARY KEY
);

DROP TABLE IF EXISTS 'Award';
CREATE TABLE 'Award'(
    VARCHAR(255) film_title PRIMARY KEY
);

DROP TABLE IF EXISTS 'Actor';
CREATE TABLE 'Actor'(
    VARCHAR(255) film_title PRIMARY KEY,
    VARCHAR(255) actor_name,
    INT age,
    VARCHAR gender
);

DROP TABLE IF EXISTS 'Award_Actor';
CREATE TABLE 'Award_Actor'(
    VARCHAR(255) film_title PRIMARY KEY,
    INT year
);

DROP TABLE IF EXISTS 'Award_Actress';
CREATE TABLE 'Award_Actress'(
    VARCHAR(255) film_title PRIMARY KEY,
    INT year
);

DROP TABLE IF EXISTS 'Director';
CREATE TABLE 'Director'(
    VARCHAR(255) director_name PRIMARY KEY,
    INT age,
    VARCHAR gender
);

DROP TABLE IF EXISTS 'Award_Director';
CREATE TABLE 'Award_Director'(
    VARCHAR(255) film_title PRIMARY KEY,
    INT year,
    VARCHAR(255) director_name FOREIGN KEY
);

