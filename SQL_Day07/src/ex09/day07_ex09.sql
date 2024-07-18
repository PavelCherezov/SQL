SELECT
    address,
    ROUND(MAX(age) - (MIN(age)/MAX(age)::DECIMAL), 2) AS formula,
    ROUND(AVG(age), 2) AS average,
    (MAX(age) - (MIN(age)/MAX(age)::DECIMAL)) > AVG(age) AS comparison
FROM
    person
GROUP BY
    address
ORDER BY
    address