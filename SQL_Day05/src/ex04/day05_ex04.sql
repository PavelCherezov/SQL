CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

EXPLAIN ANALYSE
SELECT
    *
FROM
    menu
WHERE
    pizzeria_id = 5
    AND pizza_name IN ('cheese pizza', 'pepperoni pizza')