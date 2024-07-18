WITH
id_name AS(
    SELECT
        id
    FROM
        person
    WHERE
        name IN ('Anna', 'Denis')
    ),
menu_id_and_date AS(
    SELECT
        person_id,
        menu_id,
        order_date
    FROM
        person_order
    WHERE
        person_id IN (SELECT * FROM id_name)),
id_pizzeria_pizza AS (
    SELECT
        menu_id_and_date.menu_id,
        person_visits.pizzeria_id
    FROM
        person_visits
        RIGHT JOIN menu_id_and_date ON
        person_visits.visit_date = menu_id_and_date.order_date AND person_visits.person_id = menu_id_and_date.person_id)

SELECT
    menu.pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    id_pizzeria_pizza
    LEFT JOIN menu ON id_pizzeria_pizza.menu_id = menu.id
    LEFT JOIN pizzeria ON id_pizzeria_pizza.pizzeria_id = pizzeria.id
ORDER BY
    menu.pizza_name,
    pizza_name