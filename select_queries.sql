-- Задание 2

-- Название и продолжительность самого длительного трека.

SELECT title, duration
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

-- Название треков, продолжительность которых не менее 3,5 минут.

SELECT title
FROM track
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT title 
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова. 

SELECT a.name AS artist
FROM artist AS a
WHERE a.name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my».

SELECT title 
FROM track 
WHERE LOWER(title) LIKE '%my%';

-- Задание 3

-- Количество исполнителей в каждом жанре.

SELECT g.name AS genre, COUNT(a.name) AS number_artists
FROM artist AS a
JOIN artist_genre AS a1 ON a.id=a1.artist_id
JOIN genre AS g ON a1.genre_id=g.id
GROUP BY g.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(*) AS number_tracks
FROM track
INNER JOIN album ON track.album_id=album.id
WHERE album.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому

SELECT a.title AS album, AVG(t.duration) AS avg_duration
FROM track AS t
INNER JOIN album AS a ON t.album_id=a.id
GROUP BY a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT a.name AS artist
FROM artist AS a
JOIN artist_album AS a1 ON a.id=a1.artist_id
JOIN album AS a2 ON a1.album_id=a2.id
WHERE NOT a2.release_year = 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

SELECT c.title AS collection
FROM collection AS c
JOIN track_collection AS c1 ON c.id=c1.collection_id 
JOIN track AS t ON c1.track_id=t.id
JOIN album AS a ON t.album_id=a.id
JOIN artist_album AS a1 ON a.id = a1.album_id 
JOIN artist AS a2 ON a1.artist_id=a2.id
WHERE a2.name='Twenty one Pilots';

-- Задание 4

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

SELECT a.title AS album
FROM album AS a
JOIN artist_album AS a1 ON a.id = a1.album_id
WHERE a1.artist_id =(
	SELECT artist_id
	FROM artist_genre
	GROUP BY artist_id
	HAVING COUNT(genre_id) > 1);

-- Наименования треков, которые не входят в сборники.

SELECT t.title AS track
FROM track AS t 
LEFT JOIN track_collection AS t1 ON  t1.track_id=t.id
WHERE  t1.collection_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

SELECT a.name AS artist
FROM artist AS a
JOIN artist_album AS a1 ON a.id = a1.artist_id
JOIN album AS a2 ON a1.album_id=a2.id
JOIN track AS t ON a2.id=t.album_id
WHERE t.duration=(SELECT MIN(duration) FROM track);



