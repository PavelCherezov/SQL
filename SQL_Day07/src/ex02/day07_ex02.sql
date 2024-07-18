(SELECT
    p.name AS name,
    COUNT(*) AS count,
    'visit' AS action_type
FROM
    person_visits pv
    LEFT JOIN pizzeria p ON pv.pizzeria_id = p.id
GROUP BY
    p.name
ORDER BY
    count DESC
LIMIT
    3)
UNION
(SELECT
    p.name AS name,
    COUNT(*) AS count,
    'order' AS action_type
FROM
    person_order po
    LEFT JOIN menu m ON po.menu_id = m.id
    LEFT JOIN pizzeria p ON m.pizzeria_id = p.id
GROUP BY
    p.name
ORDER BY
    count DESC
LIMIT
    3)
ORDER BY
    action_type,
    count DESC