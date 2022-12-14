CREATE DATABASE game_rental_db;
\c game_rental_db

CREATE TABLE games(
    id SERIAL PRIMARY KEY, 
    name TEXT,
    year_released INTEGER,
    image_url TEXT,
    genre TEXT,
    developer TEXT,
    platforms TEXT,
    description TEXT
);

INSERT INTO games(name, year_released, image_url, genre, developer, platforms, description)
VALUES
('The Witcher 3', 2015,  'https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Witcher_3_cover_art.jpg/220px-Witcher_3_cover_art.jpg', 'RPG', 'CD Projekt Red', 'PC, PS4/5, XBOX ONE, XBOX SERIES, NINTENDO SWITCH', ' The Witcher 3: Wild Hunt is an action role-playing game with a third-person perspective. Players control Geralt of Rivia, a monster slayer known as a Witcher. Geralt walks, runs, rolls and dodges, and (for the first time in the series) jumps, climbs and swims.'),
('God of War Ragnarök', 2022, 'https://apptrigger.com/files/2022/03/God-of-War-Ragnarok-2.jpg', 'Action-Adventure', 'Sony Santa Monica', 'PS4/5', 'Kratos and Atreus must journey to each of the Nine Realms in search of answers as Asgardian forces prepare for a prophesied battle that will end the world. "Along the way they will explore stunning, mythical landscapes, and face fearsome enemies in the form of Norse gods and monsters' ),
('The Legend of Zelda: Breath of the Wild', 2017, 'https://upload.wikimedia.org/wikipedia/en/c/c6/The_Legend_of_Zelda_Breath_of_the_Wild.jpg', 'Action-Adventure', 'Nintendo', 'NINTENDO WIIU/SWITCH', 'After a 100-year slumber, Link wakes up alone in a world he no longer remembers. Now the legendary hero must explore a vast and dangerous land and regain his memories before Hyrule is lost forever. Armed only with what he can scavenge, Link sets out to find answers and the resources needed to survive.' ),
('Bloodborne', 2015, 'https://assets1.ignimgs.com/2019/01/05/bloodborne---button-1546669457774.jpg', 'RPG', 'From Software', 'PS4', 'A hunter awakens in the plagued lands of Yharnam, where the denizens have succumb to beast hood, in an attempt to learn the truth and how to end the plague, unbeknownst of the true horror lurking within the city.'),
('Elden Ring', 2022, 'https://image.api.playstation.com/vulcan/ap/rnd/202108/0410/2odx6gpsgR6qQ16YZ7YkEt2B.png', 'RPG', 'From Software', 'PC, PS4/5, XBOX ONE, XBOX SERIES', 'The world of Elden Ring is one filled with magic, miracles, and demi-gods. The game is set in a place called the Lands Between, where demi-gods rule over different regions in the wake of wars and events that led to the shattering of the titular Elden Ring. The Elden Ring is a conduit of sorts that is at the centre of the power of the Erdtree, which blesses the Lands Between with immortality, as a result.');

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
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








