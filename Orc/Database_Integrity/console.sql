alter table users
drop primary key ;

alter table users
add primary key (UserName);


-- 创建FOREIGN KEY（外键约束），将Songs表的AlbumID列设置为外键FK_Songs_Album，该外键参照Album表中的主键AlbumID，且违约时采用“级联更新”和“级联删除”的策略。
-- 建立好外键约束后，请通过删除数据验证级联更新、级联删除等约束是否有效

-- 创建外键约束
alter table songs
add foreign key FK_Songs_Album (AlbumID) references albums(AlbumID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE ;
-- 删除Albums表中的一条数据
delete from albums where AlbumID = 1;
-- 更新Albums表中的一条数据
update albums set AlbumID = 2
where AlbumID = 1 ;


alter table songs
add constraint IX_SongTitle unique (SongTitle);


alter table albums
add constraint CK_Language check(AlbumLanguage in ('汉语普通话','粤语','英语','日语','韩语','多国','其他'));

update albums set AlbumLanguage = '法语'
where AlbumID = 1 ;
-- MySQL实际上并不支持CHECK约束，上述代码在MySQL中并不会产生预期的效果


-- 创建教室表
create table Teacher(
    tno int auto_increment primary key,
    t_name varchar(20),
    job varchar(10),
    salary double
);

delimiter &&
create trigger before_Sal_insert before insert on Teacher FOR EACH ROW
BEGIN
    if new.Job = '教授' and new.Salary < 4000
    THEN
        set new.Salary = 4000;
    end if;
END&&
delimiter ;

-- test
insert into teacher(t_name, job, salary) VALUES ('Test', '教授', 3000);


delimiter $$
create trigger before_Sal_update before update on Teacher for each row
begin
    if new.job = 'joker' and new.salary > 0
    then
        set new.salary = 0;
    end if;
end $$
delimiter ;

-- test
update teacher
set job = 'joker'
where tno = 1;


-- 创建表sal_log
create table sal_log(
    id int auto_increment primary key ,
    tno int ,
    salary double ,
    updateDate datetime,
    foreign key fk(tno) references teacher(tno)
);

delimiter &&
create trigger after_Sal_insert after insert on teacher for each row
begin
    insert into sal_log(tno, salary, updateDate) VALUES (new.tno, new.salary, current_time);
end &&
delimiter ;

insert into teacher(t_name, job, salary) VALUES ('Test', '教授', 3000);

delimiter &&
create trigger after_Sal_update after update on teacher for each row
begin
    if (new.salary <> OLD.salary)
        then insert into sal_log(tno, salary, updateDate) VALUES (new.tno, new.salary, current_time);
    end if;
end &&
delimiter ;

update teacher
set salary = 10000
where tno = 2;


