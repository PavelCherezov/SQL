WITH
dominos_id AS (
    SELECT
        id
    FROM
        pizzeria
    WHERE
        name = 'Dominos'
    ),
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
max_id AS (
    SELECT
        MAX(id)
    FROM
        person_visits
)

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES
    ((SELECT * FROM max_id) + 1, (SELECT * FROM denis_id), (SELECT * FROM dominos_id), '2022-02-24'),
    ((SELECT * FROM max_id) + 2, (SELECT * FROM irina_id), (SELECT * FROM dominos_id), '2022-02-24')