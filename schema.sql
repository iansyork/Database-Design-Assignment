CREATE DATABASE IF NOT EXISTS song_metadata;
USE song_metadata;

CREATE TABLE IF NOT EXISTS artist (
  artist_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  
  PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS song (
  song_id INT NOT NULL AUTO_INCREMENT,
  artist_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,  
  duration INT NOT NULL,
  explicit BOOLEAN NOT NULL,
  link VARCHAR(255) NOT NULL,
  
  PRIMARY KEY (song_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE IF NOT EXISTS user (
  user_id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  
  PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS genre (
  genre_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  
  PRIMARY KEY (genre_id)
);


CREATE TABLE IF NOT EXISTS playlist (
  playlist_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  
  PRIMARY KEY (playlist_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE IF NOT EXISTS playlist_songs (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  song_rank INT NOT NULL,
  
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
  FOREIGN KEY (song_id) REFERENCES song(song_id)
);

CREATE TABLE IF NOT EXISTS favorites (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (song_id) REFERENCES song(song_id)
);

CREATE TABLE IF NOT EXISTS song_genres (
  song_id INT NOT NULL,
  genre_id INT NOT NULL,
  
  PRIMARY KEY (song_id, genre_id),
  FOREIGN KEY (song_id) REFERENCES song(song_id),
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);