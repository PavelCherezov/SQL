WITH
t_1 AS (
    SELECT
        *
    FROM
        pizzeria p
        INNER JOIN menu m ON p.id = m.pizzeria_id)
SELECT
    n.pizza_name AS pizza_name,
    n.name AS pizzeria_name_1,
    m.name AS pizzeria_name_2,
    n.price AS price
FROM
    t_1 n
    INNER JOIN t_1 m ON n.pizza_name = m.pizza_name AND n.name < m.name AND n.price = m.price
ORDER BY
    n.pizza_name