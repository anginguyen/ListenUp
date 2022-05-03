DROP DATABASE IF EXISTS finalproj;
CREATE DATABASE finalproj;
USE finalproj;
DROP TABLE IF EXISTS ARTISTS;
DROP TABLE IF EXISTS ALBUMS;
DROP TABLE IF EXISTS SONGS;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS ALBUM_REVIEWS;
DROP TABLE IF EXISTS SONG_REVIEWS;
 
CREATE TABLE ARTISTS (
 artist_id INT PRIMARY KEY,
 artist_name varchar(50)
);

CREATE TABLE ALBUMS (
album_id VARCHAR(35) PRIMARY KEY,
album_name VARCHAR(50),
cover_url VARCHAR(100),
artist_id INT,
FOREIGN KEY (artist_id) REFERENCES ARTISTS(artist_id),
duration INT,
releasedate VARCHAR(20),
rating FLOAT
);

CREATE TABLE SONGS (
song_id INT PRIMARY KEY NOT NULL,
song_name VARCHAR(50) NOT NULL,
rating INT,
duration INT NOT NULL,
position INT NOT NULL,
releasedate VARCHAR(20) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES ARTISTS(artist_id),
album_id VARCHAR(35) NOT NULL,
FOREIGN KEY (album_id) REFERENCES ALBUMS(album_id)
);

CREATE TABLE USERS (
user_id INT PRIMARY KEY NOT NULL,
username VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
pass VARCHAR(50) NOT NULL,
song_url VARCHAR(75)
);

CREATE TABLE ALBUM_REVIEWS (
album_reviewid INT PRIMARY KEY NOT NULL,
album_id VARCHAR(35) NOT NULL,
FOREIGN KEY (album_id) REFERENCES ALBUMS(album_id),
review VARCHAR(280) NOT NULL,
rating INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);

CREATE TABLE SONG_REVIEWS (
song_reviewid INT PRIMARY KEY NOT NULL,
song_id INT NOT NULL,
FOREIGN KEY (song_id) REFERENCES SONGS(song_id),
review VARCHAR(280) NOT NULL,
rating INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);

INSERT INTO `finalproj`.`users` (`user_id`, `username`, `email`, `pass`) VALUES ('1', 'guest', 'guest@mail.com', 'guest');
INSERT INTO `finalproj`.`users` (`user_id`, `username`, `email`, `pass`) VALUES ('2', 'jevtor', 'jevontor@usc.edu', 'test');
INSERT INTO `finalproj`.`users` (`user_id`, `username`, `email`, `pass`) VALUES ('3', 'srinidhi', 'srinidhi@usc.edu', 'test');

INSERT INTO `finalproj`.`artists` (`artist_id`, `artist_name`) VALUES ('1', 'Olivia Rodrigo');
INSERT INTO `finalproj`.`albums` (`album_id`, `album_name`, `cover_url`, `artist_id`, `duration`, `releasedate`) VALUES ('6s84u2TUpR3wdUv4NgKA2j', 'Sour', 'https://upload.wikimedia.org/wikipedia/en/b/b2/Olivia_Rodrigo_-_SOUR.png', '1', '2081', '05/21/21');
UPDATE `finalproj`.`albums` SET `rating` = '4.6' WHERE (`album_id` = '6s84u2TUpR3wdUv4NgKA2j');

INSERT INTO `finalproj`.`songs` (`song_id`, `song_name`, `duration`, `position`, `releasedate`, `artist_id`, `album_id`) VALUES ('1', 'brutal', '144', '1', '05/21/21', '1', '6s84u2TUpR3wdUv4NgKA2j');
INSERT INTO `finalproj`.`songs` (`song_id`, `song_name`, `duration`, `position`, `releasedate`, `artist_id`, `album_id`) VALUES ('2', 'traitor', '229', '2', '05/21/21', '1', '6s84u2TUpR3wdUv4NgKA2j');
INSERT INTO `finalproj`.`songs` (`song_id`, `song_name`, `duration`, `position`, `releasedate`, `artist_id`, `album_id`) VALUES ('3', 'driver\'s license', '242', '3', '05/21/21', '1', '6s84u2TUpR3wdUv4NgKA2j');

INSERT INTO `finalproj`.`album_reviews` (`album_reviewid`, `album_id`, `review`, `rating`, `user_id`) VALUES ('1', '6s84u2TUpR3wdUv4NgKA2j', 'this is such a touching album', '5', '2');
INSERT INTO `finalproj`.`album_reviews` (`album_reviewid`, `album_id`, `review`, `rating`, `user_id`) VALUES ('2', '6s84u2TUpR3wdUv4NgKA2j', 'i cried listening to this', '5', '3');

