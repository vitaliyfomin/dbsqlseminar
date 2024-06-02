# Создание внешнего ключа

Имеется таблица (сущность) с мобильными телефонами `mobile_phones`.

У сущности имеются следующие поля(атрибуты):

`product_name` – название;

`manufacturer` – производитель;

`product_count` – количество;

`price` – цена.

Сущность `mobile_phones` имеет следующие записи:

|id|	product_name|	manufacturer|	product_count|	price|
|:-:|:-:|:-:|:-:|:-:|
|1|	iPhone X|	Apple|	156|	76000|
|2|	iPhone 8|	Apple|	180|	51000|
|3|	Galaxy S9|	Samsung|	21|	56000|
|4	Galaxy S8|	Samsung|	124|	41000|
|5	P20 Pro|	Huawei|	341|	36000|

Имеется таблица-справочник (сущность) производителей `manufacturer`.

У сущности имеются следующие поля(атрибуты):

`id` – идентификатор;

`name` – название.

Сущность manufacturer имеет следующие записи:

|id|	name|
|:-:|:-:|
|1|	Apple|
|2|	Samsung|
|3|	Huawei|

Создайте для сущности `mobile_phones` внешний ключ `manufacturer_id` (идентификатор производителя), направленный на атрибут `id` сущности `manufacturer`. Установите каскадное обновление - CASCADE, а при удалении записи из сущности `manufacturer` – SET NULL.

Используя CRUD-операцию UPDATE обновите данные в атрибуте `manufacturer_id` сущности `mobile_phones` согласно значений, имеющихся в атрибуте `manufacturer`.

Удалите атрибут `manufacturer` из сущности `mobile_phones`.

Выведите идентификатор, название и идентификатор производителя сущности `mobile_phones`.


-- Вы работаете с `PostgreSQL`

-- Введите свой код ниже

-- 1. Добавить столбец `manufacturer_id` в таблицу `itresume6149918.mobile_phones`
```sh
ALTER TABLE itresume6149918.mobile_phones
ADD COLUMN manufacturer_id INT;
```
-- 2. Обновить данные в атрибуте `manufacturer_id` на основе данных из атрибута `manufacturer`
```sh
UPDATE itresume6149918.mobile_phones mp
SET manufacturer_id = m.id
FROM itresume6149918.manufacturer m
WHERE mp.manufacturer = m.name;
```
-- 3. Установить внешние ключи с каскадным обновлением и установкой `NULL` при удалении
```sh
ALTER TABLE itresume6149918.mobile_phones
ADD CONSTRAINT fk_manufacturer
FOREIGN KEY (manufacturer_id) REFERENCES itresume6149918.manufacturer(id)
ON UPDATE CASCADE
ON DELETE SET NULL;
```
-- 4. Удалить столбец `manufacturer` из таблицы `itresume6149918.mobile_phones`
```sh
ALTER TABLE itresume6149918.mobile_phones
DROP COLUMN manufacturer;
```
-- 5. Вывести идентификатор, название и идентификатор производителя сущности `itresume6149918.mobile_phones`
```sh
SELECT id, product_name, manufacturer_id
FROM itresume6149918.mobile_phones;
```
