WITH
dmitriy_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        name = 'Dmitriy'
),
low_price_pizza AS (
    SELECT
        pizzeria_id
    FROM
        menu
    WHERE
        price < 800
)

SELECT
    pizzeria.name
FROM
    person_visits
    LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE
    person_visits.person_id in (SELECT * FROM dmitriy_id)
    AND person_visits.pizzeria_id IN (SELECT * FROM low_price_pizza)
    AND person_visits.visit_date = '2022-01-08'::DATE