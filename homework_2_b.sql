create table if not exists genre(
id SERIAL primary key,
genre_name VARCHAR(60) NOT NULL
);

create table if not exists singer(
id SERIAL primary key,
singer_name VARCHAR(60) NOT NULL
);

create table if not exists genre_singer(
genre_id INTEGER REFERENCES genre(id),
singer_id INTEGER REFERENCES singer(id),
constraint genre_singer_pk primary key (genre_id, singer_id)
);

create table if not exists album(
id SERIAL primary key,
album_name VARCHAR(60) NOT NULL,
release date NOT NULL
);

create table if not exists singer_album(
singer_id INTEGER REFERENCES singer(id),
album_id INTEGER REFERENCES album(id),
constraint singer_album_pk primary key (singer_id, album_id)
);

create table if not exists track(
id SERIAL primary key,
track_name VARCHAR(60) NOT NULL,
time INTEGER NOT NULL,
album_id INTEGER REFERENCES album(id)
);

create table if not exists collection(
id SERIAL primary key,
collection_name VARCHAR(60) NOT NULL,
release date NOT NULL
);

create table if not exists collection_track(
collection_id INTEGER REFERENCES collection(id),
track_id INTEGER REFERENCES track(id),
constraint collection_track_pk primary key (collection_id, track_id)
);
