WITH
andrey_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        name = 'Andrey'
)

SELECT
    p.name AS pizzeria_name
FROM
    person_visits pv
    LEFT JOIN person_order po ON pv.person_id = po.person_id AND pv.visit_date = po.order_date
    LEFT JOIN pizzeria p ON pv.pizzeria_id = p.id
WHERE
    pv.person_id IN (SELECT * FROM andrey_id)
GROUP BY
    p.name
HAVING
    COUNT(po.order_date) = 0