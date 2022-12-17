SELECT genre.name, COUNT(genre_singer.singer_id) FROM genre 
JOIN genre_singer ON genre.id = genre_singer.genre_id
GROUP BY genre.name;

SELECT album.album_name, album.release, COUNT(track.id) FROM album 
JOIN track ON album.id = track.album_id
WHERE release BETWEEN '2019-01-01' AND '2020-01-01'
GROUP BY album.album_name, release;

SELECT album.album_name, AVG(track.time) FROM album 
JOIN track ON album.id = track.album_id
GROUP BY album.album_name;

SELECT s.singer_name FROM singer s
JOIN singer_album sa ON s.id = sa.singer_id
JOIN album a ON a.id = sa.album_id
WHERE release <'2020-01-01';

SELECT c.collection_name FROM collection c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN track t ON t.id = ct.track_id
JOIN album a ON a.id = t.album_id
JOIN singer_album sa ON a.id = sa.album_id
JOIN singer s ON s.id = sa.singer_id
WHERE s.singer_name like '%%Oxxxymiron%%';

SELECT a.album_name FROM album a
JOIN singer_album sa ON a.id = sa.album_id
JOIN singer s ON s.id = sa.singer_id
JOIN genre_singer gs ON gs.singer_id = s.id
JOIN genre g ON g.id = gs.genre_id
GROUP BY s.singer_name, a.album_name
HAVING COUNT(gs.genre_id) > 1;

SELECT t.track_name FROM track t
LEFT JOIN collection_track ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

SELECT s.singer_name FROM singer s
JOIN singer_album sa ON s.id = sa.singer_id
JOIN album a ON a.id = sa.album_id
JOIN track t ON t.album_id = a.id
WHERE time = (SELECT MIN(time) FROM track);

SELECT a.album_name, COUNT(t.id) FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY a.album_name
HAVING COUNT(t.id) in (
SELECT COUNT(t.id) FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY a.album_name
ORDER BY count(t.id) 
LIMIT 1);