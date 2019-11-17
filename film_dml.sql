-- In final product all variables will have $ in front of them

-- Insert --
  -- Film Info - the actual blockbuster movie
INSERT INTO film_movie (NULL, title, box_office, genre, release_year) 
VALUES (NULL, :title_input, :box_office_input, :genre_input, :year_input);

-- People - actors, actresses and directors
INSERT INTO people_film (people_id, name, role, movie) 
VALUES (NULL, :name_input, :role_input, :title_input);

-- Update --- 
UPDATE film_movie SET title = :title_input, box_office = :box_office_input 
WHERE film_movie.film_id = :film_id_input; 

UPDATE people_film SET role = :role_input, movie = :title_input
WHERE people_film.people_id = :people_id_input; 

-- Search ---
SELECT * FROM film_movie WHERE title LIKE :title_input;
SELECT * FROM people_film WHERE name LIKE :name_input; 
SELECT * FROM film_movie WHERE film_id = :film_id_input;

-- DELETE --
DELETE FROM film_movie WHERE film_movie.box_office = :box_office_input;
DELETE FROM people_film WHERE people_film.people_id = :people_film_id;
DELETE FROM academy_award_film WHERE aaid = :aaid_input;
