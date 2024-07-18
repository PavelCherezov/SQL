SELECT
    p.address AS address,
    pz.name AS name,
    COUNT(*) AS count_of_orders
FROM
    person_order po
    INNER JOIN menu m ON po.menu_id = m.id
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
    INNER JOIN person p ON po.person_id = p.id
GROUP BY
    address,
    pz.name
ORDER BY
    address,
    pz.name