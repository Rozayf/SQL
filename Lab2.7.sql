USE sakila;

SELECT *
FROM sakila.category;

SELECT *
FROM sakila.film_category;

SELECT f.category_id, COUNT(*) as number_of_movies 
FROM sakila.film_category f
JOIN sakila.category as c
ON f.category_id = c.category_id
GROUP BY c.category_id;

SELECT * FROM RENTAL;

SELECT staff_id, count(rental_date) as rentalnumber
FROM rental 
WHERE rental_date LIKE '2005-08%'
GROUP BY staff_id;


SELECT actor_id, count(film_id) as numberoffilms
FROM film_actor
GROUP BY actor_id
ORDER BY numberoffilms DESC;


SELECT * FROM customer;


SELECT c.customer_id, first_name, last_name , COUNT(*) as number_of_movies 
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY number_of_movies DESC;


SELECT a.address_id, address , s.last_name, s.first_name
FROM address a
JOIN staff s
ON a.address_id = s.address_id;



SELECT f.title, count(actor_id) as actornumber
FROM film f
LEFT JOIN film_actor a
ON a.film_id = f.film_id
GROUP BY f.title
ORDER BY actornumber DESC;


SELECT * from customer;
SELECT * from payment;


SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT c.first_name, c.last_name, sum(p.amount) 
FROM customer c
JOIN payment p 
using (customer_id)
GROUP BY c.customer_id
ORDER BY c.last_name;