# 报告一

## 创建电影数据库
#### 代码如下：
```SQL
create table Artist(
ID int auto_increment not null primary key ,
name varchar(50) NULL ,
birthday date null ,
sex varchar(10) null,
imdbnumber int null,
introduction text null
);

create table Movie(
ID int auto_increment not null primary key ,
name varchar(50) null ,
releasedate date null ,
duration varchar(50) null ,
language varchar(20) null ,
introduction text null
);

create table participation
(
ID int auto_increment not null primary key,
artistid int not null,
foreign key (artistid) references Artist (ID)
on update cascade on delete cascade,
movieid int not null,
foreign key (movieid) references Movie (ID)
on update cascade on delete cascade,
rolename varchar(50) null
);
```

## 录入数据
#### 代码如下：

```
insert into artist(name, birthday, sex, imdbnumber, introduction) values ('钟晨瑶','1998-6-17','female',null,'钟晨瑶，1998年出生于福建省三明市，就读于中央戏剧学院，中国内地影视女演员.2021年，主演古装爱情轻喜剧《谢公子的酒》，从而进入演艺圈。2022年，主演剧情短片《离校日 。2023年，主演的真人恋爱影视游戏《完蛋！我被美女包围了！》上线，凭借郑梓妍一角为人所熟知；同年，出演的剧情电影《热搜》上映。');
insert into movie(name, releasedate, duration, language, introduction) values ('完蛋我被美女包围了','2023-10-27',null,'Chinese','是由中国游戏开发商intiny制作发售的电影交互式游戏，在2023年10月18日上线Steam和Epic游戏商城。在游戏中，玩家扮演男主人公顾易，与多位由真人演员扮演的女主人公开展恋爱关系。');


insert into artist(name, birthday, sex, imdbnumber, introduction) values ('陈都灵','1993-10-18','female','nm8151982','陈都灵，1993年10月18日出生于福建省厦门市，毕业于南京航空航天大学，中国内地影视女演员。2013年，陈都灵因获得Facejoking“女神排行榜”冠军而获得关注。2015年，其主演的电影处女作 《左耳》上映，她也因此获得第24届上海影评人奖最佳新人女演员提名。此后，陈都灵还相继主演了悬疑片《双生》、科幻动作冒险片《破梦游戏》、爱情剧《求婚大作战》等影视作品。2019年，在现代剧《七月与安生》');
insert into movie(name, releasedate, duration, language, introduction)  values ('左耳','2015-4-24','117min','Chinese','《左耳》是由苏有朋执导的首部电影，饶雪漫担任编剧，陈都灵、欧豪、杨洋、马思纯、段博文、胡夏、关晓彤等主演。该片改编自饶雪漫同名小说《左耳》，主要讲述了李珥、张漾、许弋、黎吧啦等一群拥有不同性格的年轻人的青春疼痛故事。');


insert into artist(name, birthday, sex, imdbnumber, introduction) VALUES ('李雪健','1954-2-20','male','nm0508554','李雪健，1954年2月20日出生于山东省菏泽市巨野县 [1] ，中国影视男演员，中国文学艺术界联合会副主席 [2] ，第九届中国电影家协会主席、名誉主席 [3-4]，中国国家话剧院一级演员.');
insert into movie(name, releasedate, duration, language, introduction) VALUES ('荆轲刺秦王','1999-3-1','163min','Chinese','《荆轲刺秦王》是1999年上映的一部影片。该片由陈凯歌导演，巩俐、张丰毅、李雪健、孙周等主演。该片讲述了公元前三世纪的中国，雄心壮志的嬴政如何统一天下，而不惜铲除一切阻碍，最后建立空前帝国的经过。');


insert into artist(name, birthday, sex, imdbnumber, introduction) VALUES ('张译','1978-2-17','male','nm3589263','张译，中国著名男演员。主演《红海行动》《悬崖之上》《一秒钟》《万里归途》《山河故人》《追凶者也》《亲爱的》《满江红》《鸡毛飞上天》《狂飙》《士兵突击》《我的团长我的团》《好家伙》等诸多优秀影视作品。曾获中国电影金鸡奖、大众电影百花奖、上海电视节白玉兰奖最佳男主角奖，中国电视金鹰奖观众喜爱的男演员奖，戏剧表演最高奖金狮奖等。此外，其著有散文集《不靠谱的演员都爱说如果》.');
insert into movie(name, releasedate, duration, language, introduction) VALUES ('满江红','2023-1-22','159min','Chinese','南宋绍兴年间，一代忠良岳鹏举物故，引无数良臣赤子扼腕叹息。四年后，奸相秦桧（雷佳音 饰）率兵与金国相约会谈。谁知会谈前夜，金国使者在秦桧驻地为人所害。事态紧急，亲兵营副统领孙均（易烊千玺 饰）得知不成器的老舅——小兵张大（沈腾 饰）了解线索，遂将其带到秦桧处。秦桧命二人一个时辰内找出真凶，否则一律处死。时间飞速流逝，舞姬瑶琴（王佳怡 饰）、更夫丁三旺（潘斌龙 饰）、马夫刘喜（余皑磊 饰）接连卷入其中，而宰相府总管何立（张译 饰）与副总管武义淳（岳云鹏 饰）相继入场，又将这场波谲云诡的调查涂满血腥。');


insert into artist(name, birthday, sex, imdbnumber, introduction) VALUES ('沈腾','1979-10-23','male','nm7613067','沈腾，中国内地男演员、影视导演、编剧，开心麻花舞台剧签约艺人，开心麻花功勋演员，毕业于解放军艺术学院戏剧表演系。');
insert into movie(name, releasedate, duration, language, introduction) VALUES ('夏洛特烦恼','2015-9-30','104min','Chinese','在学生时代的初恋秋雅（王智 饰）的婚礼上，毕业后吃软饭靠老婆养的夏洛（沈腾 饰）假充大款，出尽其丑，中间还被老婆马冬梅（马丽 饰）戳穿暴捶。混乱之中，夏洛意外穿越时空，回到了1997年的学生时代的课堂里。他懵懵懂懂，以为是场真实感极强的梦，于是痛揍王老师，强吻秋雅，还尝试跳楼让自己醒来。当受伤的他从病床上苏醒时，他意识到自己真的穿越了时空。既然有机会重新来过，那不如好好折腾一回。他勇敢追求秋雅、奚落优等生袁华（尹正 饰）、拒绝马冬梅的死缠烂打。后来夏洛凭借“创作”朴树、窦唯等人的成名曲而进入娱乐圈。
　　他的人生发生翻天覆地的巨变，但是内心某个地方却越来越感到空虚');


insert into participation(artistid, movieid, rolename) values (1,1,'郑梓妍');
insert into participation(artistid, movieid, rolename) values (2,2,'李珥');
insert into participation(artistid, movieid, rolename) values (3,3,'嬴政');
insert into participation(artistid, movieid, rolename) value (4,4,'何立');
insert into participation(artistid, movieid, rolename) value (5,5,'夏洛');

```

## 修改表格更新数据

#### 代码如下：
```
alter table Movie add rating int null;
alter table Movie modify rating decimal(4,1);


update movie
set rating = 100 where name = '完蛋我被美女包围了';

update movie
set rating = 5.7 where name = '左耳';

update movie
set rating = 8.2 where name = '荆轲刺秦王';

update movie
set rating = 7.0 where name = '满江红';

update movie
set rating = 7.8 where name = '夏洛特烦恼';
```

## 最后各表格如下：
![artist](1.png)
![2.png](2.png)
![3.png](3.png)