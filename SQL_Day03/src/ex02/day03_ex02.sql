WITH
zakaz_in AS (
    SELECT
        DISTINCT menu_id
    FROM
        person_order
    ORDER BY
        menu_id
)

SELECT
    m.pizza_name,
    m.price,
    p.name AS pizzeria_name
FROM
    menu m
    LEFT JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE
    m.id NOT IN (SELECT * FROM zakaz_in)
ORDER BY
    m.pizza_name,
    m.price