SELECT
    p.name AS name,
    m.pizza_name AS pizza_name,
    m.price AS price,
    m.price * (100 - pd.discount)/100 AS discount_price,
    pz.name AS pizzeria_name
FROM
    person_order po
    LEFT JOIN menu m ON po.menu_id = m.id
    LEFT JOIN person_discounts pd ON po.person_id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
    LEFT JOIN person p ON po.person_id = p.id
    LEFT JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY
    name,
    pizza_name