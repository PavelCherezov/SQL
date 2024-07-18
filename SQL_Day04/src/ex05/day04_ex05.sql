CREATE VIEW v_price_with_discount AS
SELECT
    p.name AS name,
    m.pizza_name AS pizza_name,
    m.price AS price,
    (m.price - m.price * 0.1)::INTEGER AS discount_price
FROM
    person_order po
    LEFT JOIN person p ON po.person_id = p.id
    LEFT JOIN menu m ON po.menu_id = m.id
ORDER BY
    p.name,
    m.pizza_name