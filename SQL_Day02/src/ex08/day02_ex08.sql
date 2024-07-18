WITH
pizza_ids AS (
    SELECT
        id
    FROM
        menu
    WHERE
        pizza_name IN ('pepperoni pizza', 'mushroom pizza')),
person_ids AS (
    SELECT
        person_id
    FROM
            person_order
    WHERE
        menu_id IN (SELECT * FROM pizza_ids))

SELECT
    name
FROM
    person
WHERE
    id IN (SELECT * FROM pizza_ids)
    AND gender = 'male'
    AND address IN ('Moscow', 'Samara')
ORDER BY
    name DESC