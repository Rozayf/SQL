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

select inventory_id, film_id, store_id from inventory
where film_id = 1; ##inventory_id 9

INSERT INTO rental(inventory_id, customer_id, staff_id) 
VALUES
(9, 130, 1 );

SELECT * FROM RENTAL;


##IMPROVEMENTS TO SAKILA


##1. Delete some tables that have no connection to other tables 
##2. We could also delete some of the columns that have duplicated information and join them instead. 
### For example the city, country, district information could all be joined in onto the address table. 
### The same goes for the many tables that were created to store information about the films and the actors. 
##3. Some data formats could be re-formatted in order to make the extraction of information easier. 
##4. There could be a optimised procedure for checking if movies are on stock, if one has not been implemented within the stores themselves. 




