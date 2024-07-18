INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
    SELECT
        ROW_NUMBER( ) OVER ( ) AS id,
        person_id,
        pizzeria_id,
        CASE
        WHEN count = 1 THEN 10.5
        WHEN count = 2 THEN 22
        ELSE 30
        END AS discount
    FROM
        (SELECT
            po.person_id AS person_id,
            m.pizzeria_id AS pizzeria_id,
            COUNT(*) AS count
        FROM
            person_order po
            INNER JOIN menu m ON po.menu_id = m.id
        GROUP BY
            po.person_id,
            m.pizzeria_id) order_count