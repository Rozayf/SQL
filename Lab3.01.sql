##deleting picture column

use sakila;

SELECT * from staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT * from staff;


##new staff member

select * from customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username) 
VALUES
(3, 'Tammy','Sanders',79, 'tammy.sanders@sakilacustomer.org',2,1,0 );

select * from staff;


##new rental 

select * from rental;

select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; ##customerID 130

select film_id from film
where title = 'Academy Dinosaur'; ##film ID 1

select inventory_id, film_id from inventory
where film_id = 1; ##inventory_id 9

INSERT INTO rental(inventory_id, customer_id, staff_id) 
VALUES
(9, 130, 1 );

SELECT * FROM RENTAL;


##IMPROVEMENTS TO SAKILA



