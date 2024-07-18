CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
    pizzeria.name AS pizzeria_name
FROM
    person_visits pv
    INNER JOIN person p ON pv.person_id = p.id
    INNER JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    INNER JOIN menu m ON pizzeria.id = m.pizzeria_id
WHERE
    p.name = 'Dmitriy'
    AND m.price < 800
    AND pv.visit_date = '2022-01-08'
