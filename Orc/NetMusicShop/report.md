# MusicShop报告

## 查询
#### 1.查找收藏歌曲在2首及以上的用户及其收藏的歌曲数
![1.png](1.png)
#### 2.查找所包含的歌曲数大于等于10首的专辑，显示专辑名和所包含的歌曲数
![2.png](2.png)
#### 3.查找最近10年来（now（））的专辑销售情况，列出专辑ID、专辑名称、总销售额，按总销售从高到低排名。
![3.png](3.png)
#### 4.查询没有被收藏过的歌曲
![4.png](4.png)
#### 5.在购买了歌手刘欢专辑的客户中查询一次购买数量最多的客户的用户名
![5.png](5.png)
#### 6.查找被所有用户收藏的歌曲（两种实现方式：相关嵌套查询、不相关嵌套查询）
![6.png](6.png)
#### 7.查找一首歌曲都没有收藏的用户（两种实现方式：相关嵌套查询、连接查询）
![7.png](7.png)

## 实验中遇到的问题与解决方法
#### 查询中没有对应数据
##### 编入数据
```
-- 创造假数据
insert into albums(AlbumName, AlbumIssueCompany, AlbumIssueDate, AlbumType, AlbumIntroduce, AlbumImageUrl, AlbumSinger, AlbumLanguage, AlbumMarketPrice, AlbumMemberPrice, AlbumIsRecommend)
values ('好好好', '金大福', '2009-07-01', 8, '暂无', '无', '刘欢', '华语', 100, 80, true);
INSERT Sales (OrderID, AlbumID, Quantity, TotalPrice) VALUES (5, 19, 1, 80.00);

INSERT Orders (OrderDate, UserName, GoodsFee, DeliverFee, DeliverID, AreaID, PaymentID, ReceiverName, ReceiverAddress, ReceiverPostCode, ReceiverPhone, ReceiverEmail, OrderIsPayment, OrderIsConsignment, OrderIsConfirm, OrderIsPigeonhole)
VALUES ('2020-12-04', 'wyh', 80.00, 4.00, 1, 1, 1, '李晓', '北京市 朝阳区', '100024', '65758696', NULL, 1, 1, 1, 1);

INSERT Sales (OrderID, AlbumID, Quantity, TotalPrice) VALUES (6, 19, 10, 800.00);
INSERT Orders (OrderDate, UserName, GoodsFee, DeliverFee, DeliverID, AreaID, PaymentID, ReceiverName, ReceiverAddress, ReceiverPostCode, ReceiverPhone, ReceiverEmail, OrderIsPayment, OrderIsConsignment, OrderIsConfirm, OrderIsPigeonhole)
VALUES ('2021-12-04', 'wyh', 800.00, 4.00, 1, 1, 1, '李晓', '北京市 朝阳区', '100024', '65758696', NULL, 1, 1, 1, 1);

```

```
-- 继续编数据
INSERT INTO Collections VALUES(15,'wt','2014-05-01');
INSERT INTO Collections VALUES(15,'wyh','2016-05-01');
INSERT INTO Collections VALUES(15,'丫丫','2017-05-01');
INSERT INTO Collections VALUES(15,'小龙女','2018-05-01');
INSERT INTO Collections VALUES(15,'郭大侠','2019-05-01');
INSERT INTO Users(UserName,UserPassword,UserSex,UserRealName,UserAgeRange,UserAddress,UserPostCode,UserPhone,UserEmail)
VALUES('喆King','666','女','sj','无可奉告','北京市 朝阳区','100024','13600088855','woshinvtong@cuc.edu.cn');

```