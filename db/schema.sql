CREATE DATABASE game_rental_db;
\c game_rental_db

CREATE TABLE games(
    id SERIAL PRIMARY KEY, 
    name TEXT,
    year_released INTEGER 
);

INSERT INTO games(name, year_released)
VALUES
('The Witcher 3', 2015),
('God of War: RAGNACOCK', 2022);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,E
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE wishlist(
    id SERIAL PRIMARY KEY,
    user_id INTEGER ,
    game_id INTEGER
);








