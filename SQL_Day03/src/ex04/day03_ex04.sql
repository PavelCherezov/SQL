WITH
woman_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        gender = 'female'
),
man_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        gender = 'male'
),
onli_woman_order AS (
    SELECT
        p.name AS pizzeria_name
    FROM
        person_order po
        LEFT JOIN menu m ON po.menu_id = m.id
        LEFT JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY
        p.name
    HAVING
        COUNT(person_id) FILTER (WHERE person_id IN (SELECT * FROM man_id)) = 0),
onli_man_order AS (
    SELECT
        p.name AS pizzeria_name
    FROM
        person_order po
        LEFT JOIN menu m ON po.menu_id = m.id
        LEFT JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY
        p.name
    HAVING
        COUNT(person_id) FILTER (WHERE person_id IN (SELECT * FROM woman_id)) = 0)

(SELECT
    *
FROM
    onli_woman_order)
UNION
(SELECT
     *
 FROM
     onli_man_order)