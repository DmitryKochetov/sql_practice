-- Подсчитать количество групп, в которые вступил каждый пользователь.

SELECT users.id, users.firstname, users.lastname, count(users_communities.community_id) 
FROM users
JOIN users_communities ON users.id = users_communities.user_id
GROUP BY users.id
ORDER BY users.id;

-- Подсчитать количество пользователей в каждом сообществе.

SELECT communities.name, users_communities.community_id, count(users_communities.user_id)
FROM users_communities
JOIN communities ON communities.id = users_communities.community_id
GROUP BY users_communities.community_id;


-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT messages.from_user_id, count(*) AS messagesCount, users.firstname, users.lastname  
FROM messages
JOIN users ON messages.from_user_id = users.id
WHERE to_user_id = 1
GROUP BY messages.from_user_id
ORDER BY messagesCount DESC
LIMIT 1;

-- * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..

SELECT user_id FROM profiles WHERE (birthday + INTERVAL 18 YEAR) > NOW();
-- GROUP BY user_id;

-- * Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT profiles.gender, count(likes.user_id) -- users.firstname, users.lastname  
FROM profiles
JOIN likes ON profiles.user_id = likes.user_id 
-- JOIN users ON profiles.user_id = users.id
GROUP BY gender;

