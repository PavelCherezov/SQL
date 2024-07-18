--Сессия №1
--Устанавливаем ограничение
--Выводим значение
--Обновляем значение
--commit изменений
--Выводим обнавленные значения
BEGIN;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

UPDATE
    pizzeria
SET
    rating = 4
WHERE
    name = 'Pizza Hut';

COMMIT;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

--Сессия №2
--Устанавливаем ограничение
--Выводим значение
--Обновляем значение
--commit изменений
--Выводим обнавленные значения
BEGIN;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

UPDATE
    pizzeria
SET
    rating = 3.6
WHERE
    name = 'Pizza Hut';

COMMIT;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';