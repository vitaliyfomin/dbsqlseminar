# Выборка мобильных телефонов производителя «Samsung»

Имеется таблица (сущность) с мобильными телефонами `mobile_phones.`

У сущности имеются следующие поля(атрибуты):

`id` – идентификатор;

`product_name` – название;

`manufacturer` – производитель;

`product_count` – количество;

`price` – цена.

Необходимо вывести идентификатор, название, производителя, количество и цену для мобильных телефонов, у которых производитель «Samsung».

-- Вы работаете MySQL

-- Введите свой код ниже
```sh
SELECT id, product_name, manufacturer, product_count, price 
FROM mobile_phones 
WHERE manufacturer = 'Samsung';
```