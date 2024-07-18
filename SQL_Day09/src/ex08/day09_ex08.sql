CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(num INTEGER)
LANGUAGE SQL
AS $$
    WITH RECURSIVE fibonacci(a, b) AS (
        SELECT
            0 AS a,
            1 AS b
        UNION
        SELECT
            b,
            a + b
        FROM
            fibonacci
        WHERE
            b < pstop
    )
    SELECT
        a
    FROM
        fibonacci
$$;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();