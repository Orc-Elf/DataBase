-- 创建一个临时表来存储已经充值的用户
create temporary table if not exists temp_1(
    username varchar(50)
);

-- 找出购买专辑总价格在200元（含）以上的订单
insert into temp_1(username)
select distinct orders.UserName
from orders
where GoodsFee >= 200;

-- 为这些用户的会员卡充值100元
update users
set UserAdvancePayment = UserAdvancePayment + 100
where UserName in (select username from temp_1);

-- 删除临时表
drop table temp_1;



-- 创建“专辑销售统计表”Sales_Statis
CREATE TABLE Sales_Statis(
    AlbumName varchar(64),
    Quantity int,
    TotalPrice numeric(10, 2)
);

-- 存入数据
insert into Sales_Statis(albumname, quantity, totalprice)
select
    Albums.AlbumName,
    SUM(Sales.Quantity),
    SUM(Sales.Quantity * Albums.AlbumMemberPrice)
from
    sales
        JOIN
    Albums ON Sales.AlbumID = Albums.AlbumID
group by
    Albums.AlbumName;


CREATE VIEW SongsByAlbumName AS
SELECT
    Songs.*,
    Albums.AlbumName
FROM
    Songs
JOIN
    Albums ON Songs.AlbumID = Albums.AlbumID
WHERE
    Albums.AlbumName = 'F.ONE'
ORDER BY
    Songs.SongNumber;




update songsbyalbumname
set SongTitle = '我就想改改名字看能不能成功'
where SongID = 6;

update songsbyalbumname
set SongTitle = '我就想改改名字看能不能成功',
    AlbumName = '我还想改改专辑试试'
where SongID = 6;



-- 创建一个可更新的视图
CREATE VIEW UpdatableSongs AS
SELECT SongID, SongTitle
FROM Songs;

-- 尝试更新视图
UPDATE UpdatableSongs
SET SongTitle = '新的歌曲名称'
WHERE SongID = 1;

-- 查询视图来确认更改是否成功
SELECT * FROM UpdatableSongs WHERE SongID = 1;

-- 创建一个包含WITH CHECK OPTION的视图
CREATE VIEW SongsByAlbumNameWithCheck AS
SELECT Songs.SongID, Songs.SongTitle, Albums.AlbumName
FROM Songs
JOIN Albums ON Songs.AlbumID = Albums.AlbumID
WHERE Albums.AlbumName = 'Eye Fever演唱会09'
WITH CHECK OPTION;

-- 尝试更新视图
UPDATE SongsByAlbumNameWithCheck
SET SongTitle = '新的歌曲名称', AlbumName = '新的专辑名称'
WHERE SongID = 1;

-- 查询视图来确认更改是否成功
SELECT * FROM SongsByAlbumNameWithCheck WHERE SongID = 1;