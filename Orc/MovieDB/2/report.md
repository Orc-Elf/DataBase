# 报告二

## 创建引索
#### 代码如下：
```
SQL
```
```create unique index Artimdb on artist(imdbnumber);```

## 导入country表
#### 导入结果如下：
![1.png](1.png)

## 修改演员表：

#### 修改演员表，增加出生地（birthplace），类型与country表的code列一致，并建立外键关联
```
alter table artist modify birthplace char(3) NOT NULL DEFAULT '';

ALTER TABLE artist ADD CONSTRAINT place FOREIGN KEY(birthplace) REFERENCES country(Code);
```

#### 使用update语句为已有演员添加相应的出生地
```
update artist
set birthplace = '福建' where name = '钟晨瑶';

update artist
set artist.birthplace = '福建' where name = '陈都灵';

update artist
set artist.birthplace = '山东' where name = '李雪健';

update artist
set artist.birthplace = '黑龙江' where name ='张译';

update artist
set artist.birthplace = '黑龙江' where name = '沈腾';
```

## 查询实现：
#### 查询代码如下：
```
select distinct name, releasedate, duration
from movie;

select name, age
from artist where age >= 30 and sex = 'female';

select distinct movie.ID, participation.rolename
from movie,participation where movie.ID = participation.ID;

select distinct country.Continent
from country;

select country.Name
from country where Population < 10000000 and Region = 'South America'
order by Population desc ;

select count(name)
from country where Continent = 'Europe';

select name, Population from country
where(Population =(
select max(Population)
from country));

select distinct artist.birthplace
from artist;
```
#### 查询结果：
![1.png](1.png)
![2.png](2.png)
![3.png](3.png)
![4.png](4.png)
![5.png](5.png)
![6.png](6.png)
![7.png](7.png)
![8.png](8.png)
![9.png](9.png)
## 遇到的问题：
#### 1.为artist添加新的有外键约束的属性：
##### 使用如下语句：
```
alter table artist add constraint <外键名> foreign key <被约束键> reference <表名>（键名）
``` 

#### 2. 排序时的顺序：
```
正序：desc
倒序：aesc
```