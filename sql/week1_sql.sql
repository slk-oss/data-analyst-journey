-- Week 1 SQL Practice — dvdrental database
-- Topics: SELECT, WHERE, GROUP BY, JOIN,
--         Subqueries, CTE, Window Functions,
--         Advanced SQL: Cohort, Retention, Funnel
-- Author: Suleyman


-- BLOCK 1: SELECT, WHERE, ORDER BY, LIMIT


-- All films sorted by rental rate
SELECT title, rental_rate, rating
FROM film
ORDER BY rental_rate DESC;

-- Films with rating 'R' longer than 100 minutes
SELECT title, rating, length
FROM film
WHERE rating = 'R' AND length > 100
ORDER BY length DESC;

-- Films containing 'Dragon' in title
SELECT title, rating
FROM film
WHERE title LIKE '%Dragon%';

-- Films with rental rate 0.99-2.99 and length > 120 min
SELECT title, rental_rate, length
FROM film
WHERE rental_rate BETWEEN 0.99 AND 2.99
  AND length > 120
ORDER BY rental_rate DESC;

-- Customers with no email (IS NULL)
SELECT first_name, last_name, email
FROM customer
WHERE email IS NULL;


-- BLOCK 2: GROUP BY, HAVING, Aggregates


-- Count of films per rating
SELECT rating, COUNT(*) AS count
FROM film
GROUP BY rating
ORDER BY count DESC;

-- Average rental rate per rating (only > 3.00)
SELECT rating, AVG(rental_rate) AS avg_rate
FROM film
GROUP BY rating
HAVING AVG(rental_rate) > 3.00
ORDER BY avg_rate DESC;

-- Number of payments per customer
SELECT customer_id, COUNT(*) AS total_payments
FROM payment
GROUP BY customer_id;

-- Total amount per customer
SELECT customer_id, SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id;

-- Average payment per customer
SELECT customer_id, AVG(amount) AS avg_amount
FROM payment
GROUP BY customer_id;

-- Customers with total payments > 100
SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- Customers with average payment > 4
SELECT customer_id, AVG(amount) AS avg_payment
FROM payment
GROUP BY customer_id
HAVING AVG(amount) > 4;

-- Customers with more than 35 payments
SELECT customer_id, COUNT(*) AS payment_count
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 35;

-- Customers: total > 150 AND average > 5
SELECT customer_id, SUM(amount) AS total, AVG(amount) AS avg_payment
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150 AND AVG(amount) > 5;

-- Customers: min payment < 1 AND max payment > 8
SELECT customer_id, MIN(amount) AS min_pay, MAX(amount) AS max_pay
FROM payment
GROUP BY customer_id
HAVING MIN(amount) < 1 AND MAX(amount) > 8;

-- Sum of payments > 7 per customer
SELECT customer_id, SUM(amount) AS total
FROM payment
WHERE amount > 7
GROUP BY customer_id;


-- BLOCK 3: JOIN


-- Customer name + rental date (INNER JOIN)
SELECT c.first_name, c.last_name, r.rental_date
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
LIMIT 10;

-- Total rentals count
SELECT COUNT(*)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

-- Top 10 payments with customer name
SELECT c.first_name, c.last_name, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
ORDER BY p.amount DESC
LIMIT 10;

-- Top 10 most rented films (3 tables)
SELECT f.title, COUNT(*) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f      ON i.film_id      = f.film_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

-- Customers with total payments > 15
SELECT c.first_name, c.last_name, SUM(p.amount) AS total
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
HAVING SUM(p.amount) > 15;

-- Films never rented (LEFT JOIN + IS NULL)
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id      = i.film_id
LEFT JOIN rental r    ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;


-- BLOCK 4: Subqueries


-- Films with rental rate above average
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- Customers with total payments above average
SELECT c.first_name, c.last_name, SUM(p.amount) AS total
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
HAVING SUM(p.amount) > (SELECT AVG(amount) FROM payment);

-- Films never rented (NOT IN — more accurate)
SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
);


-- BLOCK 5: CTE (WITH)


-- Customers with total payments above average (CTE version)
WITH customer_totals AS (
    SELECT c.first_name, c.last_name, SUM(p.amount) AS total
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.first_name, c.last_name
)
SELECT first_name, last_name, total
FROM customer_totals
WHERE total > (SELECT AVG(amount) FROM payment);


-- BLOCK 6: Window Functions


-- Number each payment per customer by date
SELECT customer_id, amount, payment_date,
       ROW_NUMBER() OVER (
           PARTITION BY customer_id
           ORDER BY payment_date
       ) AS payment_number
FROM payment;

-- Most expensive payment per customer (CTE + ROW_NUMBER)
WITH ranked_payments AS (
    SELECT
        c.first_name,
        c.last_name,
        p.amount,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY p.amount DESC
        ) AS rn
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
)
SELECT first_name, last_name, amount
FROM ranked_payments
WHERE rn = 1;

-- Difference from previous payment per customer (LAG)
SELECT customer_id, payment_date, amount,
       LAG(amount) OVER (
           PARTITION BY customer_id
           ORDER BY payment_date
       ) AS prev_payment,
       amount - LAG(amount) OVER (
           PARTITION BY customer_id
           ORDER BY payment_date
       ) AS difference
FROM payment;



-- BLOCK 7: Advanced SQL — Cohort, Retention, Funnel


-- First rental month per customer (cohort base)
SELECT
    customer_id,
    MIN(rental_date)                        AS first_rental,
    DATE_TRUNC('month', MIN(rental_date))   AS cohort_month
FROM rental
GROUP BY customer_id;

-- Full cohort analysis: how many customers returned each month
WITH cohorts AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(rental_date)) AS cohort_month
    FROM rental
    GROUP BY customer_id
),
rentals_with_cohort AS (
    SELECT
        r.customer_id,
        c.cohort_month,
        DATE_TRUNC('month', r.rental_date) AS rental_month
    FROM rental r
    JOIN cohorts c ON r.customer_id = c.customer_id
),
cohort_data AS (
    SELECT
        cohort_month,
        rental_month,
        COUNT(DISTINCT customer_id)                           AS customers,
        EXTRACT(YEAR  FROM AGE(rental_month, cohort_month)) * 12 +
        EXTRACT(MONTH FROM AGE(rental_month, cohort_month))  AS period_number
    FROM rentals_with_cohort
    GROUP BY cohort_month, rental_month
)
SELECT cohort_month, period_number, customers
FROM cohort_data
ORDER BY cohort_month, period_number;

-- Retention: customers who rented in May AND returned in June (single rental)
SELECT COUNT(DISTINCT customer_id)
FROM rental
WHERE rental_date >= '2005-05-01' AND rental_date < '2005-06-01'
  AND return_date >= '2005-06-01' AND return_date < '2005-07-01';

-- Retention: customers who made a separate rental in June (true retention)
SELECT COUNT(DISTINCT customer_id)
FROM rental
WHERE customer_id IN (
    SELECT customer_id FROM rental
    WHERE rental_date >= '2005-05-01'
      AND rental_date <  '2005-06-01'
)
AND rental_date >= '2005-06-01'
AND rental_date <  '2005-07-01';

-- Funnel: customers by rental activity level
SELECT
    COUNT(CASE WHEN rental_count >= 1 THEN 1 END) AS count_1_plus,
    COUNT(CASE WHEN rental_count >= 2 THEN 1 END) AS count_2_plus,
    COUNT(CASE WHEN rental_count >= 5 THEN 1 END) AS count_5_plus
FROM (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
) AS customer_rentals;
