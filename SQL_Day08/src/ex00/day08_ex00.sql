--Сессия №1. Включаем изоляцию.
-- Вносим изменения в таблицу и проверяем.
-- commit изменений
BEGIN;

UPDATE
    pizzeria
SET
    rating = 5
WHERE
    name = 'Pizza Hut';


SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

COMMIT;

--Сессия № 2 Включаем изоляцию.
-- Выводим таблицу на проверку

BEGIN;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut'


