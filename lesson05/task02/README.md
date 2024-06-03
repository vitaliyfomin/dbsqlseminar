# Нахождение разности соседних дат

Имеется база данных – социальная сеть.

База данных содержит сущности:

`users` – пользователи;

`messages` – сообщения;

`friend_requests` – заявки на дружбу;

`communities` – сообщества;

`users_communities` – пользователи сообществ;

`media_types` – типы медиа;

`media` – медиа;

`likes` – лайки;

`profiles` – профили пользователя.

У сущности «сообщения» имеются следующие поля(атрибуты):

`id` – идентификатор;

`from_user_id` – отправитель;

`to_user_id` – получатель;

`body` - содержимое;

`created_at` - дата отправки.

Получите список сообщений, отсортированных по возрастанию даты отправки.
Вычислите разность между соседними значениями дат отправки. Разности выразите в минутах.

Выведите идентификатор сообщения, дату отправки, дату отправки следующего сообщения и разницу даты отправки соседних сообщений.


-- Вы работаете с `MySQL`

-- Введите свой код ниже
```sh
SELECT 
    m1.id AS message_id,
    m1.created_at AS message_date,
    LEAD(m1.created_at) OVER (ORDER BY m1.created_at) AS next_message_date,
    TIMESTAMPDIFF(MINUTE, m1.created_at, LEAD(m1.created_at) OVER (ORDER BY m1.created_at)) AS time_difference_in_minutes
FROM 
    messages m1
LEFT JOIN 
    messages m2 ON m1.id = m2.id - 1
ORDER BY 
    m1.created_at;
```
