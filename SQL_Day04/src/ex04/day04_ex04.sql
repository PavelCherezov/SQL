CREATE VIEW v_symmetric_union AS
WITH
R_minus_S AS (
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-02'
    EXCEPT
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-06'
),
S_minus_R AS (
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-06'
    EXCEPT
    SELECT
        person_id
    FROM
        person_visits
    WHERE
        visit_date = '2022-01-02'
)
SELECT
    *
FROM
    R_minus_S
UNION
SELECT
    *
FROM
    S_minus_R
ORDER BY
    person_id