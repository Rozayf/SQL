USE sakila;

SELECT * FROM sakila.actor  
WHERE first_name = 'Scarlett';

SELECT COUNT(DISTINCT inventory_id) FROM sakila.inventory;

SELECT COUNT(DISTINCT film_id) FROM sakila.inventory;

SELECT MIN(length) AS Min_duration
FROM film;

SELECT MAX(length) AS Max_duration
FROM film;


SELECT concat(floor(AVG(length)/60),'h', round(AVG(length)%60,0),'m')AS average_duration FROM film;


SELECT COUNT(DISTINCT last_name) FROM actor;

SELECT *, CONVERT(left(rental_date,10),date) AS rentaldate FROM rental;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS datediff FROM rental;

SELECT *, WEEKDAY(rental_date) as weekdays FROM rental
LIMIT 20; 

SELECT *, MONTH(rental_date) as month FROM rental
LIMIT 20;

SELECT *,
CASE
WHEN WEEKDAY(rental_date) >= 6 then 'weekend'
WHEN WEEKDAY(rental_date) < 6 then 'weekday'
END AS 'day_type', WEEKDAY(rental_date) 'weekday'
FROM rental;

SELECT release_year FROM film;

SELECT title FROM film
WHERE title LIKE 'ARMAGEDDON %';

SELECT title FROM film
WHERE RIGHT (title,6) = 'APOLLO';

SELECT title, length FROM film
ORDER BY length DESC;


SELECT COUNT(DISTINCT special_features = 'Behind the Scenes') FROM film;