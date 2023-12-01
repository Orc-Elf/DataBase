USE NetMusicShop;

UPDATE Users SET UserAdvancePayMent=UserAdvancePayMent-200
WHERE UserName IN
(SELECT DISTINCT UserName
FROM Orders
WHERE OrderID IN
 (SELECT OrderID
 FROM Sales
 WHERE TotalPrice>=200
 )
);

CREATE TABLE Sales_Statis(
AlbumName varchar(64) not null,
Quantity  int null,
TotalPrice numeric(10, 2) null
);

INSERT INTO Sales_Statis(AlbumName,Quantity,TotalPrice)
SELECT  AlbumName,SUM(Quantity),SUM(TotalPrice)
FROM Sales,Albums
WHERE Albums.AlbumID=Sales.AlbumID
GROUP BY AlbumName;

CREATE VIEW SongByAlbumName
AS 
SELECT Songs.*,AlbumName
FROM Songs,Albums
WHERE AlbumName='F.ONE' AND Songs.AlbumID=Albums.AlbumID
ORDER BY SongNumber ASC;

UPDATE SongByAlbumName SET SongTitle='我就想改改名字看看能不能成功'
WHERE SongID=6;
UPDATE SongByAlbumName SET AlbumName='我还想改一下专辑试试'
WHERE SongID=6;


CREATE VIEW TEST1
AS
SELECT AlbumIssueCompany
FROM Albums;

UPDATE TEST1 SET AlbumIssueCompany='时代峰峻'
WHERE AlbumIssueCompany='倒闭';

CREATE VIEW TEST2
AS
SELECT MIN(Totalprice)
FROM SALES;

UPDATE TEST2 SET Totalprice='70';

CREATE VIEW TEST3
AS
SELECT AlbumID
FROM Sales
GROUP BY AlbumID;

UPDATE TEST3 SET AlbumID='000'
WHERE AlbumID='18';

DROP VIEW TEST1;
DROP VIEW TEST2;
DROP VIEW TEST3;