#List the number of films per category.

SELECT * FROM film_category;
SELECT * FROM FILM;
SELECT * FROM category;

SELECT FC.category_id , count(FC.film_id), MC.name FROM film_category as FC 
inner join category as MC
on FC.category_id = MC.category_id
group by category_id;



#Display the first and the last names, as well as the address, of each staff member.

SELECT name, address FROM staff_list;

#Display the total amount rung up by each staff member in August 2005.

SELECT staff.name, sum(payment.amount)
FROM payment
LEFT JOIN staff_list as staff
ON payment.staff_id = staff.id
WHERE year(payment_date) = 2005 and month(payment_date) = 8
GROUP BY staff_id;


SELECT rental.staff_id, sum(payment.amount) 
FROM rental as rental
LEFT JOIN (SELECT rental_id, sum(amount) as amount FROM payment GROUP BY rental_id) as payment
ON payment.rental_id = rental.rental_id
WHERE year(rental_date) = 2005 and month(rental_date) = 8 
GROUP BY staff_id
;




#List all films and the number of actors who are listed for each film.

SELECT * from film
SELECT * from film_actor
SELECT * from actor;

SELECT * FROM  film, FILM_ACTOR, ACTOR;
LEFT JOIN (SELECT actor_id, film_id from film_actor) as film
ON film.title = actor.first_name, actor.second_name
GROUP BY actor_id;


#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

	select concat(c.first_name,' ',c.last_name) as 'Customer Name', sum(p.amount) as 'Total Paid'
	from payment as p
	join customer as c
	on p.customer_id = c.customer_id
	group by p.customer_id;
    
    