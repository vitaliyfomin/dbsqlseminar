# Ранжированный список пользователей

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

У сущности «пользователи» имеются следующие поля(атрибуты):

`id` – идентификатор;

`firstname` – имя;

`lastname` - фамилия;

`email` - адрес электронной почты.

У сущности «сообщения» имеются следующие поля(атрибуты):

`id` – идентификатор;

`from_user_id` – отправитель;

`to_user_id` – получатель;

`body` - содержимое;

`created_at` - дата отправки.

Найти количество сообщений, отправленных каждым пользователей.
В зависимости от количества отправленных сообщений рассчитать ранг пользователей, первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.

Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. Выводимый список необходимо отсортировать в порядке возрастания ранга.


-- Вы работаете с `MySQL`

-- Введите свой код ниже
```sh
SELECT 
    dense_rank() OVER (ORDER BY message_count DESC) AS rank_message,
    firstname,
    lastname,
    COALESCE(message_count, 0) AS cnt
FROM 
    users
LEFT JOIN (
    SELECT 
        from_user_id,
        COUNT(*) AS message_count
    FROM 
        messages
    GROUP BY 
        from_user_id
) AS user_message_counts
ON 
    users.id = user_message_counts.from_user_id
ORDER BY 
    rank_message;
```

