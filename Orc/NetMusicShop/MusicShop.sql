select UserName, count(SongID) as 收藏数
from collections
group by UserName
HAVING 收藏数 >= 2;


select AlbumName, count(SongNumber) as 歌曲数
from albums, songs
where albums.AlbumID = songs.AlbumID
group by  AlbumName
HAVING 歌曲数 >=10;


select sales.AlbumID, albums.AlbumName, sum(sales.TotalPrice) as total
from albums,sales
where sales.AlbumID = albums.AlbumID
group by albums.AlbumID
order by total desc ;


select *
from songs
where SongID not in (select SongID from collections);


-- 创造假数据
insert into albums(AlbumName, AlbumIssueCompany, AlbumIssueDate, AlbumType, AlbumIntroduce, AlbumImageUrl, AlbumSinger, AlbumLanguage, AlbumMarketPrice, AlbumMemberPrice, AlbumIsRecommend)
values ('好好好', '金大福', '2009-07-01', 8, '暂无', '无', '刘欢', '华语', 100, 80, true);

INSERT Sales (OrderID, AlbumID, Quantity, TotalPrice) VALUES (5, 19, 1, 80.00);
INSERT Orders (OrderDate, UserName, GoodsFee, DeliverFee, DeliverID, AreaID, PaymentID, ReceiverName, ReceiverAddress, ReceiverPostCode, ReceiverPhone, ReceiverEmail, OrderIsPayment, OrderIsConsignment, OrderIsConfirm, OrderIsPigeonhole)
VALUES ('2020-12-04', 'wyh', 80.00, 4.00, 1, 1, 1, '李晓', '北京市 朝阳区', '100024', '65758696', NULL, 1, 1, 1, 1);

INSERT Sales (OrderID, AlbumID, Quantity, TotalPrice) VALUES (6, 19, 10, 800.00);
INSERT Orders (OrderDate, UserName, GoodsFee, DeliverFee, DeliverID, AreaID, PaymentID, ReceiverName, ReceiverAddress, ReceiverPostCode, ReceiverPhone, ReceiverEmail, OrderIsPayment, OrderIsConsignment, OrderIsConfirm, OrderIsPigeonhole)
VALUES ('2021-12-04', 'wyh', 800.00, 4.00, 1, 1, 1, '李晓', '北京市 朝阳区', '100024', '65758696', NULL, 1, 1, 1, 1);


-- 继续查询

SELECT orders.username
FROM orders
WHERE OrderID IN (
    SELECT sales.OrderID
    FROM sales
    WHERE sales.AlbumID IN (
        SELECT albums.AlbumID
        FROM albums
        WHERE AlbumSinger = '刘欢'
    ) AND sales.Quantity IN (
        SELECT MAX(sales.Quantity)
        FROM sales
        WHERE sales.AlbumID IN (
            SELECT albums.AlbumID
            FROM albums
            WHERE AlbumSinger = '刘欢'
        )
    )
);


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