# Урок 6. SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы

2. Выведите только чётные числа от 1 до 10.

`Пример: 2,4,6,8,10`


`-- Создание процедуры для вывода четных чисел:`
```sh
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
```

`-- Вызов процедуры для проверки:`
```sh
CALL get_even_numbers();
```

