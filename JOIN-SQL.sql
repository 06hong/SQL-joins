-- 1.List all customers who live in Texas 
SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district='Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT last_name, first_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 7.99
ORDER BY amount DESC;


--3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount)>175
	ORDER BY SUM(amount) DESC
)

--4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM customer
JOIN address -- join address
ON customer.address_id = address.address_id
JOIN city -- now join city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

--5. Which staff member had the most transactions?-- come back later
SELECT first_name, last_name, staff.staff_id, COUNT(payment_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP by staff.staff_id

--6. How many movies of each rating are there? 
SELECT DISTINCT rating, COUNT(title)
FROM film
GROUP BY rating

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)-- come back later
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount> 6.99
	GROUP BY customer_id
	HAVING COUNT(amount)=1
);
	
--8. How many free rentals did our store give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;

	
	








