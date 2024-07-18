WITH
pizzeria_peperoni AS (
    SELECT
        pizzeria_id,
        pizza_name,
        price
    FROM
        menu
    WHERE
        pizza_name = 'mushroom pizza'
        OR pizza_name = 'pepperoni pizza'
)

SELECT
    pizzeria_peperoni.pizza_name,
    pizzeria.name AS pizzeria_name,
    pizzeria_peperoni.price
FROM
    pizzeria
    RIGHT JOIN pizzeria_peperoni ON pizzeria.id = pizzeria_peperoni.pizzeria_id
ORDER BY
    pizzeria_peperoni.pizza_name,
    pizzeria_name