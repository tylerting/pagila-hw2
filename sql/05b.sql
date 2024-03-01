/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select actor.first_name first_name, actor.last_name last_name
from actor
left join customer on actor.first_name = customer.first_name and actor.last_name = customer.last_name
where customer.customer_id is NULL
order by first_name, last_name

