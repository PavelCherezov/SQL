SELECT
    p.name AS name,
    COUNT(*) AS count_of_visits
FROM
    person_visits pv
    LEFT JOIN person p ON pv.person_id = p.id
GROUP BY
    p.name
ORDER BY
    count_of_visits DESC,
    name
LIMIT
    4