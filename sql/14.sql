/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */
select
    EXTRACT (YEAR FROM rental_date) AS "Year",
    EXTRACT (MONTH FROM rental_date) AS "Month",
    SUM(amount) "Total Revenue"
from
    rental
    JOIN payment USING (rental_id)
group by
    ROLLUP (
    EXTRACT (YEAR FROM rental_date),
    EXTRACT (MONTH FROM rental_date))
order by "Year", "Month";
