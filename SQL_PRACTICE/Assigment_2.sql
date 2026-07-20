#1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
SELECT*FROM customer;
SELECT first_name, last_name, email, COUNT(*)
FROM customer
GROUP BY first_name, last_name,email
HAVING COUNT(*)>1;

#2. Number of times letter 'a' is repeated in film descriptions
SELECT description 
FROM film;

SELECT title,
       LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'a', '')) AS a_count
FROM film;

#3.Number of times each vowel is repeated in film descriptions 
SELECT 
    title,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'a', '')) AS a_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'e', '')) AS e_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'i', '')) AS i_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'o', '')) AS o_count,
    LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'u', '')) AS u_count
FROM film;

#4.Display the payments made by each customer
        #1. Month wise
        #2. Year wise
        #3. Week wise
        
SELECT customer_id, MONTH(payment_date) AS payment_month, SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id, MONTH(payment_date); 

SELECT customer_id, YEAR(payment_date) AS payment_year, SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id, YEAR(payment_date);

SELECT customer_id,WEEK(payment_date) AS payment_week, SUM(amount) AS total_payment
FROM payment
GROUP BY customer_id, WEEK(payment_date);

#5. Check if any given year is a leap year or not. You need not consider any table from sakila database. Write within the select query with hardcoded date

SELECT 
CASE 
    WHEN DAY(LAST_DAY('2024-02-01')) = 29 
    THEN 'Leap Year'
    ELSE 'Not a Leap Year'
END AS result;

#6. Display number of days remaining in the current year from today.
SELECT 
DATEDIFF(
    CONCAT(YEAR(CURDATE()), '-12-31'),
    CURDATE()
) AS days_remaining;

#7.Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table.
SELECT 
    payment_date,
    CASE
        WHEN MONTH(payment_date) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(payment_date) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN MONTH(payment_date) BETWEEN 7 AND 9 THEN 'Q3'
        WHEN MONTH(payment_date) BETWEEN 10 AND 12 THEN 'Q4'
    END AS quarter
FROM payment;


