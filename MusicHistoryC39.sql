-- 1. Query all of the entries in the Genre table

    SELECT * FROM Genre;

-- 2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

    SELECT  Id, 
            ArtistName, 
            YearEstablished  
    FROM Artist 
    ORDER BY (ArtistName) ASC

-- 3. Write a SELECT query that lists all the songs in the Song table and include the Artist name

    SELECT
        song.Id,
        song.Title,
        song.ArtistId,
        artist.ArtistName
    FROM Song song
    JOIN Artist artist ON song.ArtistId = artist.Id;

-- 4. Write a SELECT query that lists all the Artists that have a Pop Album

    SELECT Artist.ArtistName, Genre.Label
    FROM Album album
    LEFT JOIN Artist artist ON artist.Id = Album.ArtistId
    LEFT JOIN Genre genre ON Genre.Id = Album.GenreId
    WHERE Album.GenreId = 7

-- 5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

    SELECT Album.Id, Album.Title, Artist.ArtistName, Genre.Label
    FROM Album album
    LEFT JOIN Artist artist ON artist.Id = Album.ArtistId
    LEFT JOIN Genre genre ON Genre.Id = Album.GenreId
    WHERE Album.GenreId = 2 OR Album.GenreId = 4;

-- 6. Write a SELECT statement that lists the Albums with no songs

    SELECT Album.Title
    FROM Album album
    LEFT JOIN Song song ON album.Id = song.AlbumId
    WHERE Song.AlbumId IS NULL;
    
-- 7. Using the INSERT statement, add one of your favorite artists to the Artist table.

    INSERT INTO Artist(ArtistName, YearEstablished)VALUES('Maro', 2017);

-- 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

    INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId )VALUES('Maro vol 3', 2018, 148, 'Quincy Jones Records', 32, 4);

-- 9. Using the INSERT statement, add some songs that are on that album to the Song table.

    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Deixa', 347, 3/6/18, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Não Faz Sentido', 264, 3/6/18, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('O que Será de Ti', 478, 3/6/18, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Porquê', 256, 3/6/18, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Avião de Papel', 344, 3/6/18, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Conversas Com a Lua (Ft. Tó Brandileone)', 335, 3/6/18, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Quando Foste Embora', 156, 3/6/18, 4, 32, 34);

    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Páro Quando Oiço o Teu Nome', 343, 3/6/19, 4, 32, 35);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Águas Passadas', 262, 4/6/19, 4, 32, 35);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('All Over Again', 454, 4/6/19, 4, 32, 34);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('You Shouldve Stayed', 224, 4/6/19, 4, 32, 35);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('One World by MARO ft Zaid Tabani', 354, 4/6/19, 4, 32, 35);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Conversas Com a Lua (Ft. Tó Brandileone)', 312, 4/6/19, 4, 32, 35);
    INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId  )VALUES('Flying to L.A (Ft. Lisa Odour-Noah & Xenia Manasseh)', 156, 3/6/18, 4, 32, 35);

    -- 10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
   
    SELECT Song.Title, Album.Title, Artist.ArtistName  
    FROM Album album
    LEFT JOIN Song song ON album.Id = Song.AlbumId
    LEFT JOIN Artist artist ON artist.Id = album.ArtistId
    WHERE Album.Id = 34;

-- 11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

    SELECT Album.Title, COUNT(song.Id) AS 'Song Count' 
    FROM Album album
    INNER JOIN Song song ON song.AlbumId = album.Id
    GROUP BY (album.Title)
    ORDER BY COUNT(song.Id) ASC

-- 12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

    SELECT Artist.ArtistName, COUNT(song.Id) AS 'Song Count' 
    FROM Artist artist
    INNER JOIN Song song ON song.ArtistId = artist.Id
    GROUP BY (artist.ArtistName)
    ORDER BY COUNT(song.Id) ASC

-- 13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

    SELECT genre.Label, COUNT(song.Id) AS 'Song Count' 
    FROM Genre genre
    INNER JOIN Song song ON song.GenreId = genre.Id
    GROUP BY (genre.Label)
    ORDER BY COUNT(song.Id) ASC

-- 14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
    
    SELECT artist.ArtistName, COUNT(album.Label) 'LabelCount'
    FROM Artist artist
    LEFT JOIN Album album ON album.ArtistId = artist.Id
    GROUP BY (artist.ArtistName)
    HAVING COUNT(Album.Label) > 1;

-- 15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

    SELECT Album.Title, Album.AlbumLength
    FROM Album 
    WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

-- 16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

    SELECT Song.Title, Song.SongLength
    FROM Song 
    WHERE SongLength = (SELECT MAX(SongLength) FROM Song)

-- 17. Modify the previous query to also display the title of the album.

    SELECT Song.Title, Song.SongLength, Album.Title
    FROM Song 
    LEFT JOIN Album album ON album.Id = Song.AlbumId
    WHERE SongLength = (SELECT MAX(SongLength) FROM Song)
