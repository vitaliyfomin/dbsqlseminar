-- Создание базы данных и использование её
CREATE DATABASE IF NOT EXISTS lesson06;
USE lesson06;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    example_column VARCHAR(255) NOT NULL
);

-- Создание функции для форматирования секунд
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

-- Вызов функции для проверки
USE lesson06;
SELECT format_seconds(123456) AS formatted_time;

-- Простой запрос для вывода четных чисел
SELECT num
FROM (
    SELECT 2 AS num UNION
    SELECT 4 UNION
    SELECT 6 UNION
    SELECT 8 UNION
    SELECT 10
) AS even_numbers;

-- Хранимая процедура для вывода четных чисел
DELIMITER //

CREATE PROCEDURE get_even_numbers()
BEGIN
    DECLARE i INT DEFAULT 2;

    WHILE i <= 10 DO
        SELECT i;
        SET i = i + 2;
    END WHILE;
END//

DELIMITER ;

-- Вызов процедуры
CALL get_even_numbers();
