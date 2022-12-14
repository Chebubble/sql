SELECT album_name, release FROM album    
	WHERE release = '2018-01-01';

SELECT track_name, time FROM track    
	ORDER BY time DESC
	LIMIT 1;

SELECT track_name, time FROM track    
	WHERE time >= '03:30:00';

SELECT collection_name, release FROM collection    
	WHERE release BETWEEN '2018-01-01' and  '2020-01-01';

SELECT singer_name FROM singer    
	WHERE singer_name NOT LIKE '%% %%';

SELECT track_name FROM track    
	WHERE track_name LIKE '%%My%%';


