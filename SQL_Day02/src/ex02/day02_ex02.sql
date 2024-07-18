WITH
visits AS (
    SELECT
        person_id,
        pizzeria_id,
        visit_date
    FROM
        person_visits
    WHERE
        visit_date BETWEEN '2022-01-01'::DATE AND '2022-01-03'::DATE
)

SELECT
    COALESCE(person.name, '-') AS person_name,
    visits.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM
    person
    FULL JOIN visits ON person.id = visits.person_id
    FULL JOIN pizzeria ON visits.pizzeria_id = pizzeria.id
ORDER BY
    person_name,
    visit_date,
    pizzeria_name