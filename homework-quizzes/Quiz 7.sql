select amount
from payment
where amount >= 9.99;
--Q2
select amount, title
from payment
left join rental
on payment.rental_id=rental.rental_id
left join inventory
on rental.inventory_id=inventory.inventory_id
left join film
on inventory.film_id=film.film_id
where amount = 11.99;
--Q3
select first_name,last_name,email,address,city,country
from staff as s --aliasiing
left join address as a
on s.address_id=a.address_id
left join city as c
on a.city_id=c.city_id
left join country as ctry
on c.country_id = ctry.country_id
--I am currently majoring in data science so any field
--revolving around data anayltics would be interesting
--and helpful for me. In more narrowed down fields my 
-- interests include space exploration and aircrafts, finance, banking, 
--computer chips, and cybersecurity. my top 3 would be aircrafts and space,
-- finance, and cybersecurity.
-- the crows foot notation shows how the different categories and their
-- variables are connected for example if you follow the line from payment
--to customer here is one value in customer that is connected to payment
-- but if you follow payment to customer there are one or many.
