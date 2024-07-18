Проект представляет собой сборник заданий на SQL, разработанных для начинающих, чтобы познакомить их с различными аспектами написания запросов. Задания охватывают широкий спектр тем, включая базовые операции выбора, объединение данных, условную логику, агрегацию и работу с подзапросами. Вот краткое описание каждого задания:

### day02_ex00.sql
- **Цель**: Найти пizzerias, которые не были посещены ни одним человеком.
- **Ключевые концепции**: `LEFT JOIN`, `WHERE`, `IS NULL`.

### day02_ex01.sql
- **Цель**: Определить даты, когда не было посещений, используя серию дат и подзапрос.
- **Ключевые концепции**: `WITH`, `generate_series`, `LEFT JOIN`, `DISTINCT`.

### day02_ex03.sql
- **Цель**: Аналогично заданию day02_ex01, но с использованием другого условия фильтрации.
- **Ключевые концепции**: `WITH`, `generate_series`, `LEFT JOIN`, `DISTINCT`.

### day02_ex02.sql
- **Цель**: Вывести список людей, посетивших определенные пиццерии за указанный период времени.
- **Ключевые концепции**: `WITH`, `FULL JOIN`, `COALESCE`.

### day02_ex04.sql
- **Цель**: Найти пиццы, доступные в определенных пиццериях, и отобразить информацию о них.
- **Ключевые концепции**: `WITH`, `RIGHT JOIN`.

### day02_ex05.sql
- **Цель**: Отфильтровать список людей по возрасту и полу.
- **Ключевые концепции**: `WHERE`, `AND`, `ORDER BY`.

### day02_ex06.sql
- **Цель**: Найти пиццы, заказанные определенными людьми в определенные даты.
- **Ключевые концепции**: `WITH`, `JOIN`, `LEFT JOIN`.

### day02_ex07.sql
- **Цель**: Найти посещения определенным пользователем в пиццерии с низкими ценами.
- **Ключевые концепции**: `WITH`, `LEFT JOIN`, `IN`.

### day02_ex08.sql
- **Цель**: Найти людей, которые заказывали определенные виды пиццы, и отфильтровать их по полу и адресу.
- **Ключевые концепции**: `WITH`, `JOIN`, `IN`, `AND`.

### day02_ex09.sql
- **Цель**: Найти женщин, которые заказывали как "пепперони", так и "сырую" пиццу.
- **Ключевые концепции**: `WITH`, `JOIN`, `LEFT JOIN`, `IN`.

### day02_ex10.sql
- **Цель**: Найти пары людей, проживающих по одному адресу, где имя первого человека идет после имени второго.
- **Ключевые концепции**: `INNER JOIN`, `ORDER BY`.

В целом, этот проект служит основой для изучения SQL-запросов, покрывая необходимые навыки для более продвинутых операций с базами данных.