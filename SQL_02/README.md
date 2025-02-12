Проект состоит из двух SQL-файлов (`ex00.sql` и `ex01.sql`), предназначенных для обучения и развития навыков работы с SQL. Эти файлы содержат примеры запросов, демонстрирующие различные аспекты работы с базами данных, включая использование оконных функций, объединение данных, агрегацию и работу с временными таблицами.

### ex00.sql

Файл `ex00.sql` фокусируется на анализе данных пользователей и их финансовых операций. Он включает в себя следующие ключевые элементы:

- **Агрегация данных**: Использование функций агрегации для подсчета суммы денег, связанной с пользователями и их валютами.
- **Объединение данных**: Полное соединение таблиц `"user"` и `balance` для получения полной картины финансового состояния пользователей.
- **Выборка данных**: Выборка уникальных значений валют и их соответствующих названий через использование `COALESCE` и `DISTINCT`.
- **Работа с временными таблицами**: Создание CTE (Common Table Expressions) для упрощения запросов и улучшения читаемости кода.

### ex01.sql

Файл `ex01.sql` продолжает развитие тем, начатых в `ex00.sql`, но сосредоточен на анализе изменений курсов валют и их влияния на балансы пользователей. Основные моменты включают:

- **Использование оконных функций**: Для вычисления разницы во времени между последними обновлениями курсов валют и балансов пользователей.
- **Сравнение данных**: Полное соединение результатов двух запросов, использующих оконные функции, для выявления различий в обновлениях.
- **Выборка и обработка данных**: Применение `COALESCE` для обработки отсутствующих значений и `FULL JOIN` для объединения результатов двух запросов.
- **Формирование итогового представления**: Создание итогового представления, которое включает информацию о валюте, сумме денег, курсе валюты к USD и другие данные, полученные в результате анализа.

В целом, эти два файла предоставляют комплексный подход к анализу данных о пользователях и их финансовых операциях, используя современные возможности SQL для обработки и анализа больших объемов информации. Проект идеально подходит для начинающих, желающих глубже понять SQL и его возможности в реальных задачах анализа данных.