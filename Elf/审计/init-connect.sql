-- 创建新用户
CREATE USER 'guest'@'%' IDENTIFIED BY '123456';
-- 查询用户
SELECT HOST,USER AUTHENTICATION_STRING FROM mysql.user;

-- 授予权限
GRANT SELECT,INSERT,DELETE
ON netmusicshop.Albums
TO guest;
-- 刷新
flush privileges;

-- 查询用户权限是否符合要求
SHOW GRANTS FOR guest;

-- 创建审计数据库和审计日志表
CREATE DATABASE auditlog;
use auditlog;
create table audit(
 id int not null auto_increment,
 thread_id int not null,
 login_time timestamp,
 localname varchar(50) default null,
 matchname varchar(50) default null, 
 primary key (id)
);

-- 授予guest用户插入audit表权限
GRANT INSERT
ON audit
TO guest;

-- 查询是否开启
SHOW VARIABLES LIKE 'log_%';

set global init_connect='insert into auditlog.audit(id,thread_id,login_time,localname,matchname) values(null,connection_id(),now(),user(),current_user());';
show variables like 'init_connect%';

-- 【登录guest后】insert&delete操作
USE NetMusicshop;
INSERT INTO Albums(AlbumName, AlbumIssueCompany, AlbumIssueDate, AlbumType, AlbumIntroduce, AlbumImageUrl, AlbumSinger, AlbumLanguage, AlbumMarketPrice, AlbumMemberPrice, AlbumIsRecommend)
VALUES('重拾快乐','JFJ Productions','2023-04-21',8,'暂无 ','无','无','汉语普通话',79.00,66.00,1);
DELETE FROM Albums
WHERE AlbumName='三十而立';

SHOW MASTER STATUS;

UPDATE mysql.user 
SET mysql.user.host="222.31.67.72"
WHERE mysql.user.user="guest";




