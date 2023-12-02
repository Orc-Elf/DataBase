select '%','guest',authentication_string from mysql.user;


GRANT SELECT, INSERT, DELETE ON MusicShop.Albums TO 'guest'@'%';
FLUSH PRIVILEGES;

show grants for 'guest'@'%';


create table audit(
                      id int not null auto_increment,
                      thread_id int not null,
                      login_time timestamp,
                      localname varchar(50) default null,
                      matchname varchar(50) default null,
                      primary key (id)
);

grant insert
on auditlog.audit
to 'guest'@'%';
FLUSH PRIVILEGES;

set global init_connect='insert into auditlog.audit(id,thread_id,login_time,localname,matchname) values(null,connection_id(),now(),user(),current_user());'

UPDATE mysql.user
SET Host = '222.31.67.72'
WHERE User = 'guest';
FLUSH PRIVILEGES;