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
woman_pizzerias AS (
    (SELECT
        p.name AS pizzeria_name
    FROM
        person_visits pv
        INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
    WHERE
        pv.person_id IN (SELECT * FROM woman_id))
    EXCEPT ALL
    (SELECT
        p.name AS pizzeria_name
    FROM
        person_visits pv
        INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
    WHERE
        pv.person_id IN (SELECT * FROM man_id))
),
man_pizzerias AS (
    (SELECT
        p.name AS pizzeria_name
    FROM
        person_visits pv
        INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
    WHERE
        pv.person_id IN (SELECT * FROM man_id))
    EXCEPT ALL
    (SELECT
        p.name AS pizzeria_name
    FROM
        person_visits pv
        INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
    WHERE
        pv.person_id IN (SELECT * FROM woman_id))
)

(SELECT
    *
FROM
    woman_pizzerias)
UNION ALL
(SELECT
     *
 FROM
     man_pizzerias)
ORDER BY
    pizzeria_name