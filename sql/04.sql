/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
select title
from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join customer on rental.customer_id = customer.customer_id
where customer_id = 1
group by title
having count(title) > 1;

