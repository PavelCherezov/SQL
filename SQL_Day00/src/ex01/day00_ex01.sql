SELECT
    name,
    age
FROM
    person
WHERE
    LOWER(address) = 'kazan'
    AND gender = 'female'
ORDER BY
    name