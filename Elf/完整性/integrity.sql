USE netmusicshop;

-- 先删除原有主键
ALTER TABLE Users DROP primary key ;
-- 重新新建主键
ALTER TABLE Users ADD primary key(username);

ALTER TABLE Songs 
ADD FOREIGN KEY FK_Songs_Album(AlbumID) 
REFERENCES Albums(AlbumID)
ON UPDATE CASCADE
ON DELETE CASCADE;
-- 删除数据验证级联更新级联删除
DELETE FROM Albums WHERE AlbumID=1;
UPDATE Albums  SET AlbumID=22 WHERE AlbumID=2;

-- 删除原有约束
ALTER TABLE songs modify SongTitle varchar(256) NULL;
-- 创建unique约束
ALTER TABLE songs ADD CONSTRAINT IX_SongTitle UNIQUE(SongTitle);

-- 创建check约束
ALTER TABLE albums ADD CONSTRAINT CK_Language CHECK(albumlanguage IN('汉语普通话','粤语','英语','日语','韩语','多国','其他'));
-- 检验是否起作用
UPDATE albums SET albumlanguage='汉语' WHERE AlbumID=3;

CREATE DATABASE Teachers;
USE Teachers;
CREATE TABLE  Teacher
(tno INT PRIMARY KEY AUTO_INCREMENT,
 t_name VARCHAR(20),
 job VARCHAR(10),
 Salary DOUBLE
 );
 
 insert into teacher(t_name,job,Salary)
 VALUES('test1','教授',7777);
 
 -- 定义一个名为before_Sal_update的before update触发器
 delimiter &&
 CREATE TRIGGER before_Sal_update BEFORE UPDATE ON Teacher 
 FOR EACH ROW
 BEGIN
   IF NEW.Salary<0 
   THEN
   SET NEW.SalarY=0;
   END IF;
END &&
delimiter ;
-- 测试update命令测试是否成功
UPDATE teacher SET Salary=-100
WHERE  t_name='test1';

-- 增加工资变化日志表
CREATE TABLE sal_log(
id INT PRIMARY KEY AUTO_INCREMENT,
tno INT,
salary DOUBLE,
updateDate DATETIME,
FOREIGN KEY(tno) REFERENCES Teacher(tno)
)

-- 尝试写一个名为after_Sal_insert的after insert触发器，该触发器实现，
-- 当新增一个教师记录时，将该教师当时工资插入到工资变化日志表中
-- 尝试写一个名为after_Sal_update的after update触发器，该触发器实现，
-- 当修改教师工资时，将该教师修改后的工资插入到工资变化日志表中；

delimiter &&
CREATE TRIGGER after_Sal_insert AFTER INSERT ON teacher
FOR EACH ROW
BEGIN
   INSERT INTO sal_log(tno,salary,updateDate)
   VALUES(new.tno,current_salary,current_time);
END &&
delimiter ;
 
insert into teacher(t_name,job,Salary)
 VALUES('test2','教授',7777);

CREATE TRIGGER after_Sal_update AFTER INSERT ON teacher
FOR EACH ROW
BEGIN
   IF(new.sal<>old.sal) THEN
   INSERT INTO sal_log(tno,salary,updateDate)
   VALUES(new.tno,new.salary,current_time)
   END IF
END &&
delimiter ;