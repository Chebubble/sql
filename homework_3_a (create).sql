CREATE IF NOT EXISTS genre(
id SERIAL primary key,
genre_name VARCHAR(60) NOT null unique
);

CREATE TABLE IF NOT EXISTS singer(
id SERIAL primary key,
singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_singer(
genre_id INTEGER REFERENCES genre(id),
singer_id INTEGER REFERENCES singer(id),
CONSTRAINT genre_singer_pk primary key (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS album(
id SERIAL primary key,
album_name VARCHAR(60) NOT NULL,
release date NOT NULL
);

CREATE TABLE IF NOT EXISTS singer_album(
singer_id INTEGER REFERENCES singer(id),
album_id INTEGER REFERENCES album(id),
CONSTRAINT singer_album_pk primary key (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS track(
id SERIAL primary key,
track_name VARCHAR(60) NOT null unique,
time INTEGER NOT NULL,
album_id INTEGER REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection(
id SERIAL primary key,
collection_name VARCHAR(60) NOT null unique,
release date NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_track(
collection_id INTEGER REFERENCES collection(id),
track_id INTEGER REFERENCES track(id),
CONSTRAINT collection_track_pk primary key (collection_id, track_id)
);