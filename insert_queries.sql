-- ADD NEW VALUES TO TABLES

INSERT INTO artist (name)
VALUES ('Twenty one Pilots'), ('Imagine Dragons'), ('Maroon5'), ('OneRepublic');

INSERT INTO genre (name)
VALUES ('alternative hip-hop'), ('pop-rock'), ('indie-pop');

INSERT INTO artist_genre (genre_id, artist_id)
VALUES (1, 1), (2, 3), (3, 2), (1, 4), (3, 1);

INSERT INTO album (title, release_year)
VALUES ('Evolve',2017), ('Trench', 2018), ('V', 2014),('Human', 2021);

INSERT INTO artist_album (artist_id, album_id)
VALUES (1, 2), (2, 1), (3, 3), (4, 4);

INSERT INTO track (title, duration, album_id)
VALUES ('Animals', 230, 3), 
	   ('Maps', 190, 3), 
	   ('Beliver', 204, 1),
	   ('Thunder', 187, 1),
	   ('The Hype', 265, 2),
	   ('Levitate', 146, 2),
	   ('Distance', 180, 4),
	   ('My Blood', 229, 2);

INSERT INTO collection (title, release_year)
VALUES ('Songs of year',2020), 
	   ('Love & Indi', 2021), 
	   ('Evening', 2019),
	   ('4 you', 2020);

INSERT INTO track_collection (track_id, collection_id)
VALUES (1, 1), (1, 4), 
	   (2, 3), (2, 4),
	   (3, 3), (4, 3),
	   (5, 4), (5, 2), 
	   (6, 1), (7, 2);
