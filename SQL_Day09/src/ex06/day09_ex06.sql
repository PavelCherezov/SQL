CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date (
                            pperson VARCHAR DEFAULT 'Dmitriy',
                            pprice INTEGER DEFAULT 500,
                            pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (
    pizzeria_name VARCHAR
)
AS
$$
    BEGIN
    RETURN QUERY
        SELECT
            pz.name
        FROM
            menu m
            INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
            INNER JOIN person_visits pv ON pz.id = pv.pizzeria_id
            INNER JOIN person p ON pv.person_id = p.id
        WHERE
            p.name = pperson
            AND m.price < pprice
            AND pv.visit_date = pdate;
    END;
$$
LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');