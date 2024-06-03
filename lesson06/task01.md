# Урок 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы

1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.

`Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '`

`Создание базы данных и использование её:`

```sh
CREATE DATABASE IF NOT EXISTS lesson06;
USE lesson06;
```

`Создание таблицы:`

```sh
CREATE TABLE IF NOT EXISTS example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    example_column VARCHAR(255) NOT NULL
);
```

`Создание функции для форматирования секунд:`
```sh
DELIMITER //

CREATE FUNCTION format_seconds(seconds INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    DECLARE result VARCHAR(255);

    SET days = FLOOR(seconds / 86400);
    SET hours = FLOOR((seconds % 86400) / 3600);
    SET minutes = FLOOR((seconds % 3600) / 60);
    SET remaining_seconds = seconds % 60;

    SET result = CONCAT(
        days, ' days ',
        hours, ' hours ',
        minutes, ' minutes ',
        remaining_seconds, ' seconds'
    );

    RETURN result;
END//

DELIMITER ;
```

`Вызов функции для проверки:`
```sh
SELECT format_seconds(123456);
```

