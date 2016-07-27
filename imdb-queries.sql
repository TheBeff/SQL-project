SELECT * FROM movies WHERE name LIKE "Car %";

SELECT * FROM movies WHERE year=1986;

SELECT COUNT(*) FROM movies WHERE year=1982;

SELECT * FROM actors WHERE last_name LIKE "%stack%";

SELECT last_name, COUNT(*) famous FROM actors GROUP BY last_name ORDER BY famous DESC LIMIT 10;

SELECT first_name, COUNT(*) famous FROM actors GROUP BY first_name ORDER BY famous DESC LIMIT 10;

SELECT actors.first_name, actors.last_name, COUNT(*) role_count 
FROM actors
JOIN roles
ON actors.id=roles.actor_id
GROUP BY actor_id
ORDER BY role_count DESC
LIMIT 100;

SELECT COUNT(*) num_movies, genre
FROM movies_genres
GROUP BY genre
ORDER BY num_movies;

SELECT first_name, last_name 
FROM actors 
JOIN roles
ON actors.id=roles.actor_id
JOIN movies
ON movies.id=roles.movie_id
WHERE movies.name="Braveheart" AND movies.year=1995
ORDER BY last_name;

SELECT directors.first_name, directors.last_name, movies.name, movies.year
FROM movies_directors
JOIN movies_genres
ON movies_directors.movie_id=movies_genres.movie_id
JOIN movies
ON movies_directors.movie_id=movies.id
JOIN directors
ON movies_directors.director_id=directors.id
WHERE movies.year%4=0 AND movies_genres.genre="Film-Noir"
ORDER BY movies.name;
