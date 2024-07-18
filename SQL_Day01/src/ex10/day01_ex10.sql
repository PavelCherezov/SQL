SELECT
    person_name,
    pizza_name,
    pizzeria_name
FROM
    (SELECT
         person_id,
         menu_id,
         name AS person_name
    FROM
        person_order JOIN person
        ON person.id = person_order.person_id
    ) AS person
    JOIN
    (SELECT
        menu.id AS menu_id,
        name AS pizzeria_name,
        pizza_name
    FROM
        pizzeria JOIN menu
        ON pizzeria.id = menu.pizzeria_id
    ) AS pizza
    ON person.menu_id = pizza.menu_id
ORDER BY
    person_name,
    pizza_name,
    pizzeria_name
