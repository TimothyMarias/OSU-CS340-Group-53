-- In final product all variables will have $ in front of them

--- Insert --- 
  -- Film Info - the actual blockbuster movie
INSERT INTO `film_movie` (`film_id`, `title`, `box_office`, `genre`, `release_year`) VALUES (NULL, 'Citizen Kane', '839727', 'drama', '1941');

  -- People - actors, actresses and directors
INSERT INTO `people_film` (`people_id`, `name`, `role`, `movie`) VALUES (NULL, 'Charlie Chaplin', 'actor', 'The Tramp');

--- Update --- 
UPDATE `film_movie` SET `title` = 'The Matrix', `box_office` = '465327069' WHERE `film_movie`.`film_id` = 1; 

UPDATE `people_film` SET `role` = 'director', `movie` = 'The Matrix' WHERE `order`.`people_id` = 3; 

-- Search
SELECT * FROM `film_movie` WHERE `title` LIKE 'The Wizard of Oz' 
SELECT * FROM `people_film` WHERE `name` LIKE 'Meryl Streep' 
SELECT * FROM `film_movie` WHERE `film_id` = 3;


-- DELETE --
DELETE FROM `film_movie` WHERE `film_movie`.`box_office` = '$box_offic';
DELETE FROM `people_film` WHERE `people_film`.`people_id` = 2;
DELETE FROM `academy_award_film` WHERE `aaid` = 2;
