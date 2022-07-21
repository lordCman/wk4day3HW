-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';




-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;




-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount)>175;


SELECT first_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount)>175
);
   






-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, city
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
WHERE city = 'Nepal';






-- 5. Which staff member had the most transactions
-- 

-- JON
SELECT first_name, COUNT(rental_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name
ORDER BY COUNT(rental_id) DESC;







-- 6. How many movies of each rating are
-- there?

SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;



-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT amount
FROM payment
WHERE amount > 6.99;

SELECT first_name
FROM customer
WHERE customer_id IN (
    SELECT amount
    FROM payment
    WHERE amount > 6.99
);



-- 8 How many free rentals did our stores give away?

SELECT store.store_id, COUNT(amount)
FROM store
INNER JOIN staff
ON store.store_id = staff.store_id
INNER JOIN payment
ON staff.staff_id = payment.staff_id
WHERE amount = 0
GROUP BY store.store_id;


SELECT amount
FROM payment


 