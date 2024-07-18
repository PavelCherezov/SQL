WITH
visit_day AS (
    SELECT
        visit_date,
        MIN(person_id) AS id
    FROM
        person_visits
    GROUP BY
        visit_date
    ORDER BY
        visit_date
)

SELECT
    DISTINCT vd.visit_date AS missing_date
FROM
    generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_date
    LEFT JOIN (SELECT visit_date FROM visit_day WHERE id > 2) vd
    ON vd.visit_date = missing_date
WHERE
    vd.visit_date IS NOT NULL
ORDER BY
    missing_date