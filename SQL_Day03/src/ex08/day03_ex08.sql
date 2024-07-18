WITH
max_pizza_id AS (
    SELECT
        MAX(id)
    FROM
        menu
),
dominos_id AS (
    SELECT
        id
    FROM
        pizzeria
    WHERE
        name = 'Dominos'
)

INSERT INTO menu(id, pizzeria_id, pizza_name, price)
VALUES ((SELECT * FROM max_pizza_id) + 1, (SELECT * FROM dominos_id), 'sicilian pizza', 900)