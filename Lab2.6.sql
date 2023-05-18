USE sakila;

SELECT DISTINCT last_name
FROM actor
ORDER by last_name ASC;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1

SELECT COUNT(rental_id)
FROM rental
WHERE staff_id = 1;

SELECT COUNT(rental_id)
FROM rental
WHERE staff_id = 2;

SELECT  staff_id, COUNT(rental_id) AS Count_id  FROM rental
GROUP BY staff_id;

SELECT COUNT(title) as title_count, release_year FROM film
GROUP BY release_year;


SELECT COUNT(title) as title_count, rating FROM film
GROUP BY rating;

SELECT COUNT(title) as title_count, round(AVG(length),2) AS avergage_length, rating FROM film
GROUP BY rating;

SELECT COUNT(title) as title_count, concat(floor(AVG(length)/60),'h', round(AVG(length)%60,0),'m')AS average_duration, rating FROM film
GROUP BY rating;

SELECT title, length from film
ORDER BY length ASC;
