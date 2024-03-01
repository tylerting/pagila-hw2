/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
select film.title title
from film
where 'Behind the Scenes' in (
    select unnest(special_features)
    from film f
    where f.film_id = film.film_id)
and 'Trailers' in (
	select unnest(special_features)
	from film f
	where f.film_id = film.film_id)
order by title;
~
