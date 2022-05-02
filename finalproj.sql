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
album_id INT PRIMARY KEY,
album_name VARCHAR(50),
cover_url VARCHAR(100),
artist_id INT,
FOREIGN KEY (artist_id) REFERENCES ARTISTS(artist_id),
duration INT,
releasedate VARCHAR(20),
rating INT
);

CREATE TABLE SONGS (
song_id INT PRIMARY KEY NOT NULL,
song_name VARCHAR(50) NOT NULL,
rating INT NOT NULL,
duration INT NOT NULL,
releasedate VARCHAR(20) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES ARTISTS(artist_id),
album_id INT NOT NULL,
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
album_id INT NOT NULL,
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
INSERT INTO `finalproj`.`artists` (`artist_id`, `artist_name`) VALUES ('1', 'Olivia Rodrigo');
INSERT INTO `finalproj`.`albums` (`album_id`, `album_name`, `cover_url`, `artist_id`, `duration`, `releasedate`) VALUES ('1', 'Sour', 'https://upload.wikimedia.org/wikipedia/en/b/b2/Olivia_Rodrigo_-_SOUR.png', '1', '2081', '05/21/21');
