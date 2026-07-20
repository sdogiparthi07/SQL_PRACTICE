### SUBQUERIES, CTEs, VIEWS, TEMP.TABLE, STORED PROCEDURES

##SUBQUERIES
-- 1. display all customer details who have made more than 5 payments.
SELECT* FROM customer;
SELECT* FROM payment;
SELECT *
FROM customer
WHERE customer_id IN
(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(payment_id) > 5
);

-- 2.Find the names of actors who have acted in more than 10 films.
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
    SELECT actor_id
    FROM film_actor
    GROUP BY actor_id
    HAVING COUNT(film_id) > 10
);

-- 3. Find the names of customers who never made a payment.
SELECT first_name, last_name
FROM customer
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM payment
);

-- 4. List all films whose rental rate is higher than the average rental rate of all films.
SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate >
(
    SELECT AVG(rental_rate)
    FROM film
);
-- 5.List the titles of films that were never rented.
SELECT title
FROM film
WHERE film_id NOT IN
(
    SELECT i.film_id
    FROM inventory i
    JOIN rental r
        ON i.inventory_id = r.inventory_id
);
## CTEs
-- 6.Display the customers who rented films in the same month as customer with ID 5.

WITH customer5_months AS
(
    SELECT DISTINCT MONTH(rental_date) AS rental_month
    FROM rental
    WHERE customer_id = 5
)

SELECT DISTINCT
       c.customer_id,
       c.first_name,
       c.last_name
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
WHERE MONTH(r.rental_date) IN
(
    SELECT rental_month
    FROM customer5_months
);
-- 7.Find all staff members who handled a payment greater than the average payment amount.
SELECT staff_id, first_name, last_name
FROM staff
WHERE staff_id IN
(
    SELECT staff_id
    FROM payment
    WHERE amount >
    (
        SELECT AVG(amount)
        FROM payment
    )
);
##VIEWS

-- 8.Show the title and rental duration of films whose rental duration is greater than the average.
CREATE VIEW film_rental_details AS
SELECT 
    film_id,
    title,
    rental_duration
FROM film;
SELECT 
    title,
    rental_duration
FROM film_rental_details
WHERE rental_duration >
(
    SELECT AVG(rental_duration)
    FROM film_rental_details
);

-- 9. Find all customers who have the same address as customer with ID 1.
SELECT 
    customer_id,
    first_name,
    last_name,
    address_id
FROM customer
WHERE address_id =
(
    SELECT address_id
    FROM customer
    WHERE customer_id = 1
);
##TEMPT.TABLE
-- 10.List all payments that are greater than the average of all payments.
CREATE TEMPORARY TABLE avg_payment AS
SELECT AVG(amount) AS average_amount
FROM payment;

SELECT 
    payment_id,
    customer_id,
    amount,
    payment_date
FROM payment
WHERE amount >
(
    SELECT average_amount
    FROM avg_payment
);

##STORED PROCEDURES
-- 1.List all films whose rental rate is higher than the average rental rate of all films.

DELIMITER //

CREATE PROCEDURE GetAboveAverageRentalFilms()
BEGIN

    SELECT 
        film_id,
        title,
        rental_rate
    FROM film
    WHERE rental_rate >
    (
        SELECT AVG(rental_rate)
        FROM film
    );

END //

DELIMITER ;

-- 2.Find all staff members who handled a payment greater than the average payment amount.
DELIMITER //

CREATE PROCEDURE GetStaffAboveAveragePayments()
BEGIN

    SELECT DISTINCT
        s.staff_id,
        s.first_name,
        s.last_name
    FROM staff s
    JOIN payment p
        ON s.staff_id = p.staff_id
    WHERE p.amount >
    (
        SELECT AVG(amount)
        FROM payment
    );

END //

-- 3.Find all customers who have the same address as customer with ID 1.
DELIMITER //

CREATE PROCEDURE GetCustomersSameAddress()
BEGIN

    SELECT 
        customer_id,
        first_name,
        last_name,
        address_id
    FROM customer
    WHERE address_id =
    (
        SELECT address_id
        FROM customer
        WHERE customer_id = 1
    );

END //

DELIMITER ;
-- 4. Find the names of actors who have acted in more than 10 films.
DELIMITER //

CREATE PROCEDURE GetActorsMoreThan10Films()
BEGIN

    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name
    FROM actor a
    WHERE a.actor_id IN
    (
        SELECT actor_id
        FROM film_actor
        GROUP BY actor_id
        HAVING COUNT(film_id) > 10
    );

END //

DELIMITER ;

-- 5.List the titles of films that were never rented.
DELIMITER //

CREATE PROCEDURE GetNeverRentedFilms()
BEGIN

    SELECT 
        f.film_id,
        f.title
    FROM film f
    WHERE f.film_id NOT IN
    (
        SELECT i.film_id
        FROM inventory i
        JOIN rental r
            ON i.inventory_id = r.inventory_id
    );

END //

DELIMITER ;

 





