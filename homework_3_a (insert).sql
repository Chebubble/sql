INSERT INTO singer(singer_name) 
VALUES('Oxxxymiron'), ('Нойз МС'), ('Драгни'), ('AC/DC'), ('Lady Gaga'), ('Bob Marley'), ('Louis Armstrong'), ('David Bowie');

INSERT INTO genre(name)
VALUES('Rap'), ('Rock'), ('Pop'), ('Jazz'), ('Heavy metal');

INSERT INTO album(album_name, release)
VALUES('Красота и Уродство', '2021-01-01'), ('Царь горы', '2016-01-01'), ('Не валяй дурака', '2018-01-01'), ('Rock and Soul: Interview Transmissions', '1997-01-01'), ('The Fame',  '2008-01-01'), ('Soul Rebels', '1970-01-01'), ('Satchmo', '1958-01-01'), ('Hunky Dory', '1971-01-01');

delete from genre 

INSERT INTO genre_singer(genre_id, singer_id)
VALUES(63,1), (63,2), (63,3), (64,8), (65,5), (66,6), (66,7), (67,4);

INSERT INTO singer_album(singer_id, album_id)
VALUES(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8);

INSERT INTO track(track_name, time, album_id)
VALUES('Ойда', '02:23:50', 1), ('НЛО', '03:35:01', 1), ('Не валяй дурака', '03:25:11', 2), ('Эмпайер', '01:24:22', 2), ('The Fatalist', '03:33:33', 4), 
      ('Riffs and Tunes', '02:00:00', 4), ('Just dance', '04:02:02', 5), ('Paparazzi', '03:28:11', 5), ('My Cup', '03:39:11', 6), ('try Me', '02:47:11', 6), 
      ('Kiss Of Fire', '02:17:22', 7), ('Because Of You', '02:11:12', 7), ('Changes', '03:33:32', 8), ('Kooks', '02:49:01', 8);
INSERT INTO collection(collection_name, release)
VALUES('Сборник1', '2021-01-01'), ('Сборник2', '2026-01-01'), ('Сборник3', '2008-01-01'),('Сборник4', '2011-01-01'), ('Сборник5', '1970-01-01'), ('Сборник6', '1994-01-01'), ('Сборник7', '2000-01-01'), ('Сборник8', '1960-01-01');

INSERT INTO collection_track(track_id, collection_id)
VALUES(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (7, 3), (8, 4), (9, 4), (10, 5), (11, 5), (12, 6), (13, 7), (14, 8);


