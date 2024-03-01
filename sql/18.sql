/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
select
    rank,
    title,
    revenue,
    "total revenue",
    to_char(100 * "total revenue" / (
            select SUM(amount)
            from film
            left join inventory using (film_id)
            left join rental using (inventory_id)
            left join payment using (rental_id)
        ), 'FM900.00') AS "percent revenue"
    from (
        select
            rank,
            title,
            revenue,
            SUM(revenue) OVER (order by revenue desc) as "total revenue"
        from (
            select
                RANK() OVER (
                    order by SUM(CASE WHEN amount IS NULL THEN 0.00 ELSE amount END) desc
                ) as rank,
                title,
                SUM(CASE WHEN amount IS NULL THEN 0.00 ELSE amount END) AS revenue
            from film
            left join inventory using (film_id)
            left join rental using (inventory_id)
            left join payment using (rental_id)
            group by title
            order by revenue DESC
        ) as ranking
        group by rank, title, revenue
        order by rank, title
) as percent
group by rank, title, revenue, "total revenue"
order by rank, title, revenue;
