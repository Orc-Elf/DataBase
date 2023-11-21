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


SELECT *
FROM Songs
WHERE NOT EXISTS (
    SELECT 1
    FROM Collections
    WHERE Songs.SongID = Collections.SongID
);

SELECT *
FROM Songs
WHERE SongID NOT IN (SELECT SongID FROM Collections);


SELECT Users.UserName, SUM(Sales.Quantity) AS TotalQuantity
FROM Users
         INNER JOIN Orders ON Users.UserName = Orders.UserName
         INNER JOIN Sales ON Orders.OrderID = Sales.OrderID
         INNER JOIN Albums ON Sales.AlbumID = Albums.AlbumID
WHERE Albums.AlbumSinger = '刘欢'
GROUP BY Users.UserName
ORDER BY TotalQuantity DESC
LIMIT 1;