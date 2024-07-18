SELECT
    p_1.name AS person_name1,
    p_2.name AS person_name2,
    p_1.address AS common_address
FROM
    person p_1
    INNER JOIN person p_2 ON p_1.address = p_2.address AND p_1.name > p_2.name
ORDER BY
    person_name1,
    person_name2,
    common_address