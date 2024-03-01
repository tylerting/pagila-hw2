/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT film.title as title
join film
join inventory using (film_id)
left join rental using (inventory_id)
left join customer using (customer_id)
left join address using (address_id)
left join city using (city_id)
group by film.title
having count(case when country = 'United States' then 1 end) = 0
order by title;
