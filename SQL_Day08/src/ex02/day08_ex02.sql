--Сессия №1
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Выводим значение
--Обновляем значение
--commit изменений
--Выводим обнавленные значения
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

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
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Выводим значение
--Обновляем значение
--commit изменений
--Выводим обнавленные значения
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

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