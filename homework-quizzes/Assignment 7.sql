select costumer
from customer 
where last_name like 'T%'
ORDER BY first_name ASC
-------
select rental
from rental
where rental_date >= '2005-05-28' AND return_date <= '2005-06-01';
-------
select title, COUNT(rental.inventory_id) as rental_num
from film
left join inventory
on film.film_id=inventory.film_id
left join rental
on inventory.inventory_id=rental.inventory_id
group by film.title
order by rental_num DESC
limit 10;
--------
Explain select customer.customer_id, sum(payment.amount) as total
from payment
left join customer
on payment.customer_id=customer.customer_id
group by customer.customer_id
order by total ASC;
--------
Explain select actor.actor_id, first_name, last_name, count(*) as movie_count
from actor
left join film_actor
on actor.actor_id=film_actor.actor_id
left join film
on film_actor.film_id=film.film_id
where release_year = 2006
group by actor.actor_id, first_name, last_name
order by movie_count desc;  -- the actor with the most movies
---- in 2006 is Gina Degeneres

-- The explain plan for 4 shows the
--merge between the customers and payment
--table through the customer_id column
--then is applies and aggregate opperation to the data
-- and finally sorts by sum paymet
-- For 5 it also proforms a join left between
-- actor and film_actor. It then applies the 
-- aggregate function to the 3 columns listed
-- and finally sorts the count of the 2006 movies
select avg(rental_rate), genres
from film
left join film_category as genre
on film.film_id=genre.film_id
left join category as genres
on genre.category_id=genres.category_id
group by genres;
-------
select ca.name, count(r.rental_id) as rental_count, sum(pa.amount) as total_spent
from category as ca
left join film_category as fm
on ca.category_id=fm.category_id
left join film as f
on fm.film_id=f.film_id
left join inventory as i
on f.film_id=i.film_id
left join rental as r
on i.inventory_id=r.inventory_id
left join payment as pa
on r.rental_id=pa.rental_id
group by ca.name
order by rental_count desc
limit 5;















