USE sakila;
SELECT *
FROM actor, film , customer;

SELECT title
FROM film;

SELECT name AS language
FROM language;

SELECT distinct name AS language
FROM language;

SELECT COUNT(store_ID)
FROM store;

SELECT COUNT(store_ID)
FROM staff;

SELECT first_name
FROM staff;


