##hunchback impossible inventory

USE sakila;

select film_id from film
where title = 'hunchback impossible'; ###439

Select COUNT(DISTINCT inventory_id) from inventory
where film_id = 439;

SELECT count (film_id) as count, film_id
FROM inventory 
WHERE film_id = (
	SELECT film_id
	FROM film
	WHERE title = 'Hunchback Impossible');
                


##longer than average of all films

SELECT title, length FROM film;

SELECT AVG(length) FROM film; ##115

SELECT title, length
FROM film
HAVING length > 115;

SELECT film_id, title, length
FROM film
WHERE length >
		(SELECT AVG(length)
        FROM film);


##Alone trip

select film_id from film
where title = 'alone trip'; ###17

SELECT a.first_name, a.last_name
FROM actor a, film f
WHERE f.film_id = 17;

SELECT actor_id
FROM film_actor
WHERE film_id IN (
					SELECT film_id 
                    FROM film
                    WHERE title = 'Alone Trip');
                    

##family films

SELECT * From category
WHERE name = 'family'; ##8

SELECT f.title
FROM film_category c, film f
WHERE category_id = 8
GROUP BY f.title;


##Canada

Select c.first_name, c.last_name, c.email
From customer as c
inner join address as a
on c.address_id = a.address_id
inner join city as cy
on cy.city_id = a.address_id
inner join country as ct
on ct.country_id = cy.country_id
where ct.country = "Canada";

SELECT first_name, last_name, email FROM customer 
WHERE address_id IN (
					SELECT address_id
                    FROM address
                    WHERE city_id IN (SELECT city_id
									FROM city
                                    WHERE country_id = (SELECT country_id
														FROM country
                                                        WHERE country = 'Canada')));
                                                        

##films with prolific actor 

SELECT title as Movies
FROM film
JOIN film_actor USING (film_id)
WHERE actor_id = 
				(SELECT actor_id
                FROM actor
                JOIN film_actor USING (actor_id)
                JOIN film USING (film_id)
                GROUP BY actor_id
                ORDER BY count(film_id) DESC
                LIMIT 1);



##most profitable customer

SELECT inventory.film_id, film.title, customer_id
FROM rental
LEFT JOIN inventory USING (inventory_id)
LEFT JOIN film USING (film_id)
WHERE customer_id IN (
						SELECT customer_id
                        FROM(
								SELECT customer_id, SUM(amount)
                                FROM payment 
                                GROUP BY customer_id
                                ORDER BY SUM(amount) DESC
                                LIMIT 1) sub1);


##more than average payments

SELECT customer_id, SUM(amount) AS totalamountspent
FROM payment
GROUP BY customer_id 
HAVING SUM(amount) > (SELECT AVG(sum) as average
						FROM (SELECT customer_id, SUM(amount) AS sum
                        FROM payment
                        GROUP BY customer_id) sub1);
                        
                        