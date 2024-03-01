/*
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select actor.last_name, actor.first_name
from actor
left join customer on actor.first_name||actor.last_name = customer.first_name||customer.last_name
where customer.first_name is null
order by last_name, first_name;
