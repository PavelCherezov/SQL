WITH
peperoni_id AS (
    SELECT
        id
    FROM
        menu
    WHERE
        pizza_name = 'pepperoni pizza'
),
cheese_id AS (
    SELECT
        id
    FROM
        menu
    WHERE
        pizza_name = 'cheese pizza'
),
peperoni_person AS (
    SELECT
        person_id
    FROM
        person_order
    WHERE
        menu_id IN (SELECT * FROM peperoni_id)
),
cheese_person AS (
    SELECT
        person_id
    FROM
        person_order
    WHERE
        menu_id IN (SELECT * FROM cheese_id)
)

SELECT
    person.name
FROM
    peperoni_person
    LEFT JOIN person ON person.id = peperoni_person.person_id
WHERE
    peperoni_person.person_id IN (SELECT * FROM cheese_person)
    AND person.gender = 'female'
ORDER BY
    person.name