-- Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id. 
-- Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.

SET @user_id = 50;

DELETE FROM likes 
WHERE user_id = @user_id;

DELETE FROM profiles 
WHERE user_id = @user_id;

DELETE FROM media 
WHERE user_id = @user_id;

DELETE FROM messages 
WHERE from_user_id = @user_id OR to_user_id = @user_id;

DELETE FROM friend_requests  
WHERE initiator_user_id = @user_id OR target_user_id = @user_id;

DELETE FROM users_communities  
WHERE user_id = @user_id;

DELETE FROM users 
WHERE id = @user_id;


-- Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.

DROP PROCEDURE IF EXISTS userDeleteOnID;

DELIMITER //

CREATE PROCEDURE userDeleteOnID(ident INT)
BEGIN

	START TRANSACTION;


	DELETE FROM likes 
	WHERE user_id = ident;

	DELETE FROM profiles 
	WHERE user_id = ident;

	DELETE FROM media 
	WHERE user_id = ident;

	DELETE FROM messages 
	WHERE from_user_id = ident OR to_user_id = ident;

	DELETE FROM friend_requests  
	WHERE initiator_user_id = ident OR target_user_id = ident;

	DELETE FROM users_communities  
	WHERE user_id = ident;

	DELETE FROM users 
	WHERE id = ident;

	COMMIT;
END//

DELIMITER ; 

CALL userDeleteOnID(15); 

-- * Написать триггер, который проверяет новое появляющееся сообщество. Длина названия сообщества (поле name) 
-- должна быть не менее 5 символов. Если требование не выполнено, то выбрасывать исключение с пояснением.


DROP TRIGGER IF EXISTS newCommunityNameLeghtOK;

DELIMITER //

CREATE TRIGGER newCommunityNameLeghtOK
	BEFORE INSERT  
	ON communities FOR EACH ROW 
	BEGIN
		IF LENGTH(NEW.name) < 4 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Длина имени сообщества должна быть не менее 5 символов';
		END IF;
	END//

DELIMITER ;


--INSERT INTO `communities` VALUES (15,'aq');





