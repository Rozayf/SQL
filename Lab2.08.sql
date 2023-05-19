USE sakila;

SELECT * FROM store;
SELECT * FROM address;

SELECT s.store_id, c.city, ca.country  
FROM store s
JOIN address a
USING (address_id)
JOIN city c
USING (city_id)
JOIN country ca
USING (country_id);

SELECT * FROM payment;

SELECT  store_id, sum(p.amount) as total_amount
FROM store s
JOIN staff st
USING (store_id)
JOIN payment p
USING (staff_id)
GROUP by store_id;

SELECT * FROM category;
SELECT * FROM film_category;
SELECT * FROM film;

SELECT c.name, f.length
FROM category c
JOIN film_category fc
USING (category_id)
JOIN film f
USING (film_id)
group by category_id
order by length desc;


SELECT * FROM rental;
SELECT * FROM inventory;

SELECT f.title, count(rental_id) as rentalfreq
FROM rental r
JOIN inventory i
using (inventory_id)
join film f
using (film_id)
group by f.title
order by count(rental_id) desc
limit 10; 


SELECT * FROM category;


SELECT c.name, round(sum(p.rental_id*p.amount)) as rev
FROM category c
join film_category fc
using (category_id)
join inventory i
using (film_id)
join rental
using (inventory_id) 
join payment p
using (rental_id)
group by c.name
order by rev desc
limit 5;

SELECT * from inventory;

SELECT r.return_date, i.store_id, f.title
FROM rental r
join inventory i
using (inventory_id)
join film f
using (film_id)
GROUP BY f.title
HAVING f.title = "Academy Dinosaur";


SELECT * FROM film_actor as a
INNER JOIN film_actor as b
on  (a.actor_id > b.actor_id) AND (a.film_id = b.film_id);

