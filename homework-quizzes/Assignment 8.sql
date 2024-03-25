SELECT *,
	CASE

--ALTER TABLE rental
--ADD status varchar(20)

UPDATE rental
SET status = CASE
    WHEN return_date > rental_date THEN 'Late'
    WHEN return_date < rental_date THEN 'Early'
    ELSE 'On Time'
    END
SELECT status 
FROM rental;
-- Q2
SELECT customer.customer_id, SUM(payment.amount), city.city
FROM customer
LEFT JOIN payment 
ON customer.customer_id = payment.customer_id
LEFT JOIN  address 
ON customer.address_id = address.address_id
LEFT JOIN city 
ON address.city_id = city.city_id
WHERE  city.city IN ('Kansas City', 'Saint Louis')
GROUP BY customer.customer_id, city.city;
--Q3
SELECT category.name, SUM(film_category.film_id)
FROM category
LEFT JOIN film_category
ON category.category_id=film_category.film_id
GROUP BY category.name
--Q4
-- The separation of these tables is done to stop
--merginf relationships between different tables
-- to get in the way of preforming operations
-- It also allows the data to be normalized
--leaving category and film to have their own elements
--Q5
EXPLAIN SELECT film.film_id, title, film.length 
FROM film
LEFT JOIN inventory 
ON film.film_id = inventory.film_id
LEFT JOIN rental
ON inventory.inventory_id=rental.inventory_id
WHERE rental.return_date >= '2005-05-15' AND rental.return_date <= '2005-05-31';
--Q6
SELECT rental_rate, title
FROM film
WHERE rental_rate < (SELECT AVG(rental_rate)FROM film)
GROUP BY title, rental_rate;
--Q7
SELECT status, COUNT(status)
FROM rental
GROUP BY status
-- I did not do the equation right for calculating
-- when returns were on time , late, or early,
-- SO this is why my data is so skewed,
-- but I am unsure of how to do so.
--Q8
EXPLAIN SELECT title, film.length, PERCENT_RANK() OVER (ORDER BY lENGTH DESC) 
FROM film;
--Q9
-- So first I ran an explain select on the window
--function because it was something new to me. According to the explain function it
-- seems as if the window function start like every other function by selecting the 
-- columns I selected. Then it sorts the films by the percent rank operation which organizes
-- the movies based on link and what percentage they fall into. Then it orders by the length
-- descending and finaling scans for the columns in film. I then used the explain select on
-- question 5 and it basically choose the selections first but then pulled them from film
-- right away. After this is ran a few hash joins to connect the tables. Then the where
--operations scanned the tables for return dates that fit into the quota that was set. 
--Then returned the table. The main difference I am noticing is that five I hand picked
-- the requirments for the table where in Q8 I simply used a operation to find the relationship
--between the dataset.
--Extra Credit
-- Set Based Programing or SQL seems to be more oriented on manipulation of predetermined
--datasets and how to manipulate them to find relationships between them and access information
-- in the data sets. Where as procedural programming focuses more on programming your 
-- computer on how to do really any task you can think of not just analysis of data.










