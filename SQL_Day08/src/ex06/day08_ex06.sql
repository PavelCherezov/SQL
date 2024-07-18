--Сессия №1
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Выводим значение до комит 2 консоли
--Вывод значения после комит 2 консоли
--commit
--Выводим
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT
    SUM(rating)
FROM
    pizzeria;

SELECT
    SUM(rating)
FROM
    pizzeria;

COMMIT;

SELECT
    SUM(rating)
FROM
    pizzeria;

--Сессия №2
--Проверка уровня изоляции
--Устанавливаем уровня изоляции
--Вставляем новую строку в таблицу
--commit изменений
--Выводим обнавленные значения
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

INSERT INTO
    pizzeria(id, name, rating)
VALUES
    (11, 'Kazan Pizza 2', 4);

COMMIT;

SELECT
    SUM(rating)
FROM
    pizzeria;