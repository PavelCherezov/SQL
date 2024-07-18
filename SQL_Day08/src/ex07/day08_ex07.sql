--Сессия №1
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Изменение id 1
--Изменение id 2
--commit
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;

UPDATE
    pizzeria
SET
    rating = 3.5
WHERE
    id = 1;

UPDATE
    pizzeria
SET
    rating = 3
WHERE
    id = 2;

COMMIT;

--Сессия №2
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Изменение id 2
--Изменение id 1
--commit изменений
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN;

UPDATE
    pizzeria
SET
    rating = 4
WHERE
    id = 2;

UPDATE
    pizzeria
SET
    rating = 3.4
WHERE
    id = 1;

COMMIT;