WITH
zakaz_in AS (
    SELECT
        DISTINCT menu_id
    FROM
        person_order
    ORDER BY
        menu_id
)

SELECT
    id AS menu_id
FROM
    menu
WHERE
    id NOT IN (SELECT * FROM zakaz_in)
ORDER BY
    menu_id