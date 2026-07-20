USE sakila;
SELECT *
FROM actor;

SELECT first_name, last_name
FROM actor;
SELECT *
FROM actor
WHERE first_name = 'JOHN';

SELECT title, rental_duration
FROM film
WHERE rating = 'PG' 
AND rental_duration = 5;

SELECT first_name, last_name, store_id
FROM customer
WHERE store_id = 1 
OR store_id = 2;

SELECT title, rating
FROM film
WHERE NOT rating = 'PG';

SELECT title, rental_duration
FROM film
WHERE rental_duration BETWEEN 3 AND 6;

SELECT first_name, last_name, store_id
FROM customer
WHERE store_id IN (1,2);

SELECT *
FROM actor
WHERE first_name LIKE 'A%';

SELECT *
FROM actor
WHERE first_name LIKE '_A%';

SELECT *
FROM address
WHERE address2 IS NULL;

SELECT *
FROM address
WHERE address2 IS NOT NULL;

SELECT title
FROM film
ORDER BY title ASC;

SELECT title
FROM film
ORDER BY title DESC;

SELECT DISTINCT rating
FROM film;

SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

SELECT rating, COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;

SELECT *
FROM film
LIMIT 10;
--------------------------------
# Built infunctions
-- 1. Display customer full name in uppercase
SELECT CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS Full_Name
FROM customer
ORDER BY first_name;

-- Find customers whose first name has more than 6 characters
SELECT customer_id, first_name,
       LENGTH(first_name) AS Name_Length
FROM customer
WHERE LENGTH(first_name) > 6;

-- Display first 5 characters of every film title
SELECT film_id, title, SUBSTRING(title,1,5) AS Short_Title
FROM film
ORDER BY title;

-- Display first and last 3 letters of every actor's name
SELECT actor_id,
       LEFT(first_name,3) AS First_Part,
       RIGHT(last_name,3) AS Last_Part
FROM actor;

-- Replace spaces in film titles with hyphens
SELECT film_id, title, REPLACE(title,' ','-') AS Modified_Title
FROM film;

-- Find films whose title starts with 'A'
SELECT film_id, title, LENGTH(title) AS Title_Length
FROM film
WHERE title LIKE 'A%';

-- Display customer initials
SELECT customer_id,
       CONCAT(LEFT(first_name,1),LEFT(last_name,1)) AS Initials,
       email
FROM customer;

-- Display film title, title length and title in uppercase
SELECT title,
       UPPER(title) AS Upper_Title,
       LENGTH(title) AS Title_Length
FROM film
WHERE LENGTH(title) > 10
ORDER BY Title_Length DESC;
 -- Math functions
 
-- Round the replacement cost to the nearest whole number
SELECT film_id, title, replacement_cost,
       ROUND(replacement_cost,0) AS Rounded_Cost
FROM film;

-- Display rental rate rounded to 1 decimal place
SELECT film_id, title, rental_rate,
       ROUND(rental_rate,1) AS Rounded_Rate
FROM film;

-- Find the absolute difference between replacement cost and rental rate
SELECT title, replacement_cost, rental_rate,
       ABS(replacement_cost - rental_rate) AS Difference
FROM film;

-- Find films whose film_id is even
SELECT film_id, title, rental_rate
FROM film
WHERE MOD(film_id,2) = 0;

-- Display the square of the rental duration
SELECT film_id, title, rental_duration,
       POWER(rental_duration,2) AS Square
FROM film;

-- Find the greater value between rental rate and replacement cost
SELECT title, rental_rate, replacement_cost,
       GREATEST(rental_rate,replacement_cost) AS Highest_Value
FROM film;

-- Display rental duration, its square, and its square root
SELECT title, rental_duration,
       POWER(rental_duration,2) AS Duration_Square,
       ROUND(SQRT(rental_duration),2) AS Duration_Sqrt
FROM film;

-- DATE FUNCTIONS

SELECT CURRENT_DATE() AS Today_Date;

-- Extract year from rental date
SELECT rental_id,
       rental_date,
       YEAR(rental_date) AS Rental_Year
FROM rental;

-- Find rentals made in the year 2005
SELECT rental_id,
       customer_id,
       rental_date
FROM rental
WHERE YEAR(rental_date) = 2005;

-- Find rentals returned after 5 days 
SELECT rental_id, rental_date, return_date
FROM rental
WHERE DATEDIFF(return_date,rental_date) > 5;

-- Add 7 days to rental date
SELECT rental_id, rental_date,
       DATE_ADD(rental_date,INTERVAL 7 DAY) AS Due_Date
FROM rental;

-- Subtract 10 days from rental date
SELECT rental_id,
       rental_date,
       DATE_SUB(rental_date,INTERVAL 10 DAY) AS Previous_Date
FROM rental;

-- Count rentals by year and month
SELECT YEAR(rental_date) AS Year,
       MONTH(rental_date) AS Month,
       COUNT(*) AS Total_Rentals
FROM rental
GROUP BY YEAR(rental_date), MONTH(rental_date);

--------------------------------------------------------------

-- inner join 
SELECT*FROM customer;
SELECT*FROM address;
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.address
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id;

-- Left outer join
SELECT*FROM film; 
SELECT *FROM inventory;
SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id;

SELECT
    c.name AS category,
    COUNT(fc.film_id) AS total_films
FROM category c
LEFT OUTER JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY
    c.category_id,
    c.name
ORDER BY total_films DESC;

-- right join
SELECT
    s.store_id,
    COUNT(c.customer_id) AS total_customers
FROM customer c
RIGHT JOIN store s
ON c.store_id = s.store_id
GROUP BY s.store_id;

-- full join
SELECT
    f.film_id,
    f.title,
    i.inventory_id,
    i.store_id
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id

UNION

SELECT
    f.film_id,
    f.title,
    i.inventory_id,
    i.store_id
FROM film f
RIGHT JOIN inventory i
ON f.film_id = i.film_id;

SELECT *
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id

UNION

SELECT *
FROM film f
RIGHT JOIN inventory i
ON f.film_id = i.film_id;
-- cross join 
SELECT
    s.store_id,
    c.category_id
FROM store s
CROSS JOIN category c;

SELECT
    s.store_id,
    l.name AS language
FROM store s
CROSS JOIN language l;

-- self join

SELECT
    a1.first_name,
    a1.last_name AS Actor1,
    a2.last_name AS Actor2
FROM actor a1
JOIN actor a2
ON a1.first_name = a2.first_name
WHERE a1.actor_id <> a2.actor_id;

SELECT
    f1.title AS Film1,
    f2.title AS Film2,
    f1.rental_duration
FROM film f1
JOIN film f2
ON f1.rental_duration = f2.rental_duration
WHERE f1.film_id <> f2.film_id;
-- join with null conditions
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;

SELECT
    f.film_id,
    f.title
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL;
   
------------- subqueries------------
SELECT title, rental_rate
FROM film
WHERE rental_rate >
(
    SELECT AVG(rental_rate)
    FROM film
);

-- correlated subquery-----
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
WHERE
(
    SELECT SUM(p.amount)
    FROM payment p
    WHERE p.customer_id = c.customer_id
) > 100;

SELECT *
FROM
(
    SELECT
        customer_id,
        SUM(amount) AS total_payment
    FROM payment
    GROUP BY customer_id
) p
WHERE total_payment > 150;
-------------------------- CTE---------------------------
SELECT*FROM film;
SELECT*FROM film_category;
SELECT*FROM category;
-- 1. Create a CTE that displays all Action movies. Then display:film_id, title, rental_rate

WITH ACTIONMOVIES AS (
      SELECT film.film_id, title, rental_rate
      FROM film
      JOIN film_category
           ON film.film_id = film_category.film_id
	  JOIN category
           ON film_category.category_id = category.category_id
	  WHERE category.name = 'ACTION'
	  )
      
SELECT*
FROM ACTIONMOVIES;

-- 2. Create a CTE that stores customers who have made more than 20 rentals. Then display:Customer ID, First Name,Last Name, Total Rentals
SELECT*FROM customer;
SELECT*FROM rental;

 WITH customer_rentals AS (
		SELECT c.customer_id,c.first_name, c.last_name,COUNT(r.rental_id) AS total_rentals
        FROM customer c
        JOIN rental r
        ON c.customer_id = r.customer_id
        GROUP BY c.customer_id,c.first_name,c.last_name
        HAVING COUNT(r.rental_id)>20
)
SELECT*
FROM customer_rentals;
--------- Recursive CTE--------- CTE that repeatedly calls itself to generate or process data untill a condition is met
WITH Recursive NUMBERS AS (
     SELECT 1 as n
     UNION ALL
     SELECT n+1
     FROM NUMBERS
     WHERE n<40
)
SELECT *
FROM NUMBERS;

WITH recursive dates AS (
  SELECT curdate() AS date_value
  UNION ALL
  SELECT date_value - Interval 1 day
  FROM dates
  WHERE date_value>curdate() - Interval 9 day
)
SELECT*
FROM dates;

--- Temporary tables--- table created temporarily during a database session. 
---- It stores data temporarily and is automatically removed when the session ends or explictly dropped.
---- Create a temporary table that stores customers who have made more than 20 rentals.
SELECT*FROM customer;
SELECT * FROM rental;

CREATE TEMPORARY TABLE customer_rentals AS
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS Total_Rentals
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 20;
SELECT*
FROM customer_rentals;

-- VIEWS-----view look similar to CTE and a temporary table. The main difference is scope and lifetime 

CREATE VIEW customer_rentals AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(r.rental_id) > 20;

SELECT *
FROM customer_rentals;
----------------- Stored Procedures------------
-- displays all films

DELIMITER //

CREATE PROCEDURE get_all_films()
BEGIN

    SELECT *
    FROM film;

END //

DELIMITER ;

CALL get_all_films();

--- 2.Display rentals of a customer (IN parameter)
DELIMITER //

CREATE PROCEDURE get_customer_rentals(IN cust_id INT)
BEGIN

    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        r.rental_id,
        r.rental_date

    FROM customer c
    JOIN rental r
        ON c.customer_id = r.customer_id

    WHERE c.customer_id = cust_id;

END //

DELIMITER ;

CALL get_customer_rentals (8);

--3.Return total rentals (OUT parameter)
DELIMITER //

CREATE PROCEDURE total_customer_rentals
(
    IN cust_id INT,
    OUT total_rentals INT
)
BEGIN

    SELECT COUNT(*)
    INTO total_rentals

    FROM rental

    WHERE customer_id = cust_id;

END //

DELIMITER ;

CALL total_customer_rentals(8,@COUNT);
SELECT @COUNT

------------ INDEX------------------------
# Index is an databse object that improves the performance of data retrieval by creating an efficient look up structure on one or more columns. 

-- WHY DO WE USE INDEX?--
# by using index the database quickly match the row instead of checking every row.
# without using index, the database checks every row untill it matches a row 
# Types of Index:
          # CLUSTERED : stores the table rows in the same physical order as the index key
          # NON CLUSTERED : stores the indexed values in a separate structure along with pointers to the actual table rows.
                        ----- It does not change the physical order of the data, and a table can have multiple non-clustered indexes.
-- example on clustered---
SELECT *
FROM customer
WHERE customer_id = 7;
-- Non clustered---
CREATE INDEX idx_email
ON customer(email);

SELECT *
FROM customer
WHERE email='linda@mail.com';
# The PRIMARY KEY in a table acts as the clustered index.
# Indexes created with CREATE INDEX are secondary (non-clustered) indexes.

CREATE TABLE sakila.sales_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sakila.sales_data (customer_name, product_name, amount, sale_date)
VALUES 
('Alice', 'Laptop', 1200.00, '2024-12-01'),
('Bob', 'Keyboard', 150.00, '2025-01-10'),
('Charlie', 'Monitor', 300.00, '2025-02-05'),
('Alice', 'Mouse', 50.00, '2025-03-12'),
('David', 'Printer', 450.00, '2025-04-21'),
('Eve', 'Tablet', 700.00, '2025-05-03'),
('Frank', 'Laptop', 1300.00, '2025-06-15'),
('Grace', 'Keyboard', 120.00, '2025-06-18'),
('Heidi', 'Monitor', 310.00, '2025-06-19'),
('Ivan', 'Mouse', 55.00, '2025-06-20'),
('xhdckj', 'Laptop', 155.00, '2025-06-20'),
('joey', 'Laptop', 1555.00, '2025-06-21'),
('tribiani', 'Laptop', 1900.00, '2025-06-22'),
('phoebe', 'Laptop', 1300.00, '2025-06-27');
SELECT * FROM sakila.sales_data;

SELECT * FROM sakila.sales_data  where id = 2;
EXPLAIN SELECT * FROM sakila.sales_data where id = 2;
SELECT * FROM sakila.sales_data  where  product_name = 'Laptop' and amount = 1300;
EXPLAIN SELECT * FROM sakila.sales_data WHERE product_name = 'Laptop' and amount = 1300;
---  Add an index on the 'product_name' column
CREATE INDEX idx_product_name ON sakila.sales_data(product_name);
CREATE INDEX idx_Amount ON sakila.sales_data(amount);
---- Run the same SELECT again after indexing
EXPLAIN SELECT * FROM sakila.sales_data WHERE product_name = 'Laptop'  and amount = 1300;
DROP INDEX idx_product_name ON sakila.sales_data;
DROP INDEX idx_Amount ON sakila.sales_data;

---- Natural Key & Surrogate Key
-- natural key : a key that uses a real world attribute that already exists in the data and uniquely identifies a record.
-- surrogate key : an artificial key created by the database to uniquely identify records. It has no business meaning.
-- 1. Create Customer Table using Email as Natural Key
CREATE TABLE customer_natural (
    email VARCHAR(100) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20)
);
INSERT INTO customer_natural
(email, first_name, last_name, phone)
VALUES
('john@gmail.com','John','Smith','1234567890'),
('mary@gmail.com','Mary','Brown','9876543210');

SELECT *
FROM customer_natural
WHERE email='john@gmail.com';

-- surrogate key ----
CREATE TABLE customer_surrogate (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO customer_surrogate
(email, first_name, last_name)
VALUES
('john@gmail.com','John','Smith'),
('mary@gmail.com','Mary','Brown');

SELECT *
FROM customer_surrogate
WHERE customer_id=1;























  


    







      



 



