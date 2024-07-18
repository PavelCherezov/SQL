CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    min_value NUMERIC;
BEGIN
    SELECT 
        MIN(i) INTO min_value
    FROM 
        unnest(arr) g(i);
    RETURN min_value; 
END;
$$;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);