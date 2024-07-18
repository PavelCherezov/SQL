CREATE TABLE  proezd (
    point1 VARCHAR NOT NULL ,
    point2 VARCHAR NOT NULL ,
    cost INTEGER NOT NULL
);

INSERT INTO proezd(point1, point2, cost)
VALUES
    ('a', 'b', 10),
    ('a', 'd', 20),
    ('a', 'c', 15),
    ('b', 'a', 10),
    ('d', 'a', 20),
    ('c', 'a', 15),
    ('d', 'b', 25),
    ('d', 'c', 30),
    ('b', 'd', 25),
    ('c', 'd', 30),
    ('b', 'c', 35),
    ('c', 'b', 35);

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
    cost - last_cost =
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
    AND tour[1] = tour[5]
    AND iter = 5
    AND 'a' = ANY(tour)
    AND 'b' = ANY(tour)
    AND 'c' = ANY(tour)
    AND 'd' = ANY(tour)
ORDER BY
    total_cost,
    tour