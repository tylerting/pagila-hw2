/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT title
from film
where rating = 'G'
and 'Trailers' in (
    select unnest(special_features)
    from film f
    where f.film_id = film.film_id)
order by title;
