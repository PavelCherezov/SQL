WITH
all_pos AS (
    (SELECT
        p.name AS name,
        visit_date AS date
    FROM
        person_visits pv
        LEFT JOIN pizzeria p ON pv.pizzeria_id = p.id)
    UNION ALL
    (SELECT
        p.name AS name,
        order_date AS date
    FROM
        person_order po
        LEFT JOIN menu m ON po.menu_id = m.id
        LEFT JOIN pizzeria p ON m.pizzeria_id = p.id)
)
SELECT
    name,
    COUNT(date) AS total_count
FROM
    all_pos
GROUP BY
    name
ORDER BY
    total_count DESC,
    name