WITH
max_id AS (
    SELECT
        MAX(id)
    FROM
        person_visits
),
dmitriy_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        name = 'Dmitriy'
),
low_price_pizzeria AS (
    SELECT
        p.id
    FROM
        pizzeria p
        LEFT JOIN menu m ON p.id = m.pizzeria_id
    WHERE
        m.price < 800
        AND p.name != 'Papa Johns'
    ORDER BY
        RANDOM()
    LIMIT
        1
)
INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES(1 + (SELECT * FROM max_id), (SELECT * FROM dmitriy_id), (SELECT * FROM low_price_pizzeria), '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats