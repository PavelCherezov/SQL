--Сессия №1
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Выводим значение до комит 2 консоли
--Вывод значения после комит 2 консоли
--commit
--Выводим
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

SELECT
    *
FROM
    pizzeria
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
--Обновляем значение
--commit изменений
--Выводим обнавленные значения
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE
    pizzeria
SET
    rating = 3.0
WHERE
    name = 'Pizza Hut';

COMMIT;

SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';