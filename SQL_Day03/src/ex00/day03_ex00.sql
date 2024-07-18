WITH
kate_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        name = 'Kate'
)

SELECT
    m.pizza_name,
    m.price,
    p.name AS pizzeria_name,
    pv.visit_date
FROM
    person_visits pv
    FULL JOIN pizzeria p ON pv.pizzeria_id = p.id
    FULL JOIN menu m ON p.id = m.pizzeria_id
WHERE
    pv.person_id IN (SELECT * FROM kate_id)
    AND m.price BETWEEN 800 AND 1000
ORDER BY
    m.pizza_name,
    m.price,
    pizzeria_name
