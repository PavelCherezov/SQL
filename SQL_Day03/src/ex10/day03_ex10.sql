WITH
denis_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        name = 'Denis'
),
irina_id AS (
    SELECT
        id
    FROM
        person
    WHERE
        name = 'Irina'
),
sicilian_id AS (
    SELECT
            id
    FROM
        menu
    WHERE
        pizza_name = 'sicilian pizza'
),
max_id AS (
    SELECT
        MAX(id)
    FROM
        person_order
)

INSERT INTO person_order(id, person_id, menu_id, order_date)
VALUES
    ((SELECT * FROM max_id) + 1, (SELECT * FROM denis_id), (SELECT * FROM sicilian_id), '2022-02-24'),
    ((SELECT * FROM max_id) + 2, (SELECT * FROM irina_id), (SELECT * FROM sicilian_id), '2022-02-24')