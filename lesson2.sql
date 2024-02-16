USE vk;

DROP TABLE IF EXISTS towns;
CREATE TABLE towns(
	id SERIAL,
    town_name VARCHAR(255) NOT NULL
   
);

ALTER TABLE profiles ADD COLUMN town_id BIGINT UNSIGNED;
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_town_id
    FOREIGN KEY (town_id) REFERENCES towns(id);

DROP TABLE IF EXISTS univercities;
CREATE TABLE univercities(
	id SERIAL,
    univercity_name VARCHAR(255),
    user_id BIGINT UNSIGNED NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES profiles(user_id)
);

DROP TABLE IF EXISTS songs;
CREATE TABLE songs(
	id SERIAL,
    media_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (media_id) REFERENCES media(id)
);

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES
('1', 'Leo', 'Bronstein', 'founder@rkka.su', '1'),
('2', 'Pancho', 'Vilia', 'general@mexico.mx', '12'),
('3', 'Pieree-Augustin', 'Beaumarchais', 'author@litres.ru', '123'),
('4', 'George', 'Washington', 'Iamfirst@state.gov', '1234'),
('5', 'Nelson', 'Mandela', 'famousprisoner@uar.com', '12345'),
('6', 'Fidel', 'Castro', 'seo@cuba.cu', '123456'),
('7', 'Vladimir', 'Ulianov', 'seo@ussr.su', '1234567'),
('8', 'Ernesto', 'Guevara', 'comandante@cuba.cu', '12345678'),
('9', 'Mahatma', 'Gandi', 'seo@india.in', '123456789'),
('10', 'Carl', 'Marx', 'founder@capital.com', '10');

INSERT INTO towns (`id`, `town_name`) VALUES
('1','Saint-Petersburg'),
('2','Moscow'),
('3','Tokyo'),
('4','New-York'),
('5','Amsterdam'),
('6','Berlin'),
('7','Paris'),
('8','London'),
('9','Dublin'),
('10','Helsinki');


ALTER TABLE vk.profiles ADD COLUMN is_active BIT default 1;

UPDATE  profiles SET is_active = 0 WHERE (birthday + INTERVAL 18 YEAR) > NOW();






