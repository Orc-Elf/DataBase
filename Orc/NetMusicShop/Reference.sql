SELECT UserName, COUNT(SongID) AS NumberOfSongs
FROM Collections
GROUP BY UserName
HAVING COUNT(SongID) >= 2;


SELECT Albums.AlbumName, COUNT(Songs.SongID) AS NumberOfSongs
FROM Songs
         INNER JOIN Albums ON Songs.AlbumID = Albums.AlbumID
GROUP BY Albums.AlbumName
HAVING COUNT(Songs.SongID) >= 10;


SELECT Albums.AlbumID, Albums.AlbumName, SUM(Sales.TotalPrice) AS TotalSales
FROM Albums
         INNER JOIN Sales ON Albums.AlbumID = Sales.AlbumID
         INNER JOIN Orders ON Sales.OrderID = Orders.OrderID
WHERE Orders.OrderDate >= DATE_SUB(NOW(), INTERVAL 10 YEAR)
GROUP BY Albums.AlbumID, Albums.AlbumName
ORDER BY TotalSales DESC;


select sales.AlbumID, albums.AlbumName, sales.TotalPrice
from albums,sales
where sales.AlbumID = albums.AlbumID
order by TotalPrice desc ;

SELECT *
FROM Songs
WHERE SongID NOT IN (SELECT SongID FROM Collections);


SELECT s.SongID, s.SongTitle
FROM Songs s
WHERE NOT EXISTS (
    SELECT u.UserName
    FROM Users u
    WHERE NOT EXISTS (
        SELECT c.SongID
        FROM Collections c
        WHERE c.UserName = u.UserName AND c.SongID = s.SongID
    )
);

SELECT s.SongID, s.SongTitle
FROM Songs s
         JOIN Collections c ON s.SongID = c.SongID
GROUP BY s.SongID, s.SongTitle
HAVING COUNT(DISTINCT c.UserName) = (SELECT COUNT(*) FROM Users);


SELECT u.UserName
FROM Users u
WHERE NOT EXISTS (
    SELECT c.UserName
    FROM Collections c
    WHERE c.UserName = u.UserName
);

SELECT u.UserName
FROM Users u
         LEFT JOIN Collections c ON u.UserName = c.UserName
WHERE c.SongID IS NULL;