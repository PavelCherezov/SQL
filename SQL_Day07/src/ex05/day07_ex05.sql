SELECT
    DISTINCT p.name AS name
FROM
    person_order po
    LEFT JOIN person p ON po.person_id = p.id
ORDER BY
    p.name