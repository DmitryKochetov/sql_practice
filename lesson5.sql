-- Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]

CREATE VIEW communitiesUsers AS
SELECT communities.name, users_communities.community_id, count(users_communities.user_id)
FROM users_communities
JOIN communities ON communities.id = users_communities.community_id
GROUP BY users_communities.community_id;

-- Выведите данные, используя написанное представление [SELECT]

SELECT * 
FROM communitiesusers; 


-- Удалите представление [DROP VIEW]

DROP VIEW communitiesusers;

-- * Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей), 
-- user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.