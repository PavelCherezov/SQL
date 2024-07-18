WITH RECURSIVE put AS (
SELECT
    point1,
    point2,
    cost,
    ARRAY[point1] AS tour,
    1 AS iter,
    cost AS last_cost
FROM
    proezd
WHERE point1 = 'a'
UNION ALL
SELECT
    proezd.point1,
    proezd.point2,
    proezd.cost + put.cost AS cost,
    put.tour || proezd.point1 AS tour,
    put.iter + 1 as iter,
    proezd.cost AS last_cost
FROM
    proezd
    INNER JOIN  put ON put.point2 = proezd.point1
WHERE
    iter < 5
)
SELECT
    DISTINCT cost - last_cost AS total_cost,
    tour
FROM
    put
WHERE
    (cost - last_cost =
        (SELECT
            MIN(cost - last_cost)
        FROM
            put
        WHERE
            'a' = ANY(tour)
            AND 'b' = ANY(tour)
            AND 'c' = ANY(tour)
            AND 'd' = ANY(tour)
            AND iter = 5
            AND tour[1] = tour[5])
    OR cost - last_cost =
        (SELECT
            MAX(cost - last_cost)
        FROM
            put
        WHERE
            'a' = ANY(tour)
            AND 'b' = ANY(tour)
            AND 'c' = ANY(tour)
            AND 'd' = ANY(tour)
            AND iter = 5
            AND tour[1] = tour[5]))
    AND tour[1] = tour[5]
    AND iter = 5
    AND 'a' = ANY(tour)
    AND 'b' = ANY(tour)
    AND 'c' = ANY(tour)
    AND 'd' = ANY(tour)
ORDER BY
    total_cost,
    tour