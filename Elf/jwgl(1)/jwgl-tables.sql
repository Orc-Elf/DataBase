create table Student(
	Sno char(10) not null primary key,
	Sname char(20) NULL,
	Ssex char(2) NULL,
	Sage tinyint NULL,
	Sdept char(20) NULL
)

create table Course(
	Cno char(10) NOT NULL primary key,
	Cname varchar(32) NOT NULL,
	Cpno char(10) NULL,
	Ccredit tinyint NOT NULL
)

create table SC(
	Sno char(10) NOT NULL,
	Cno char(10) NOT NULL,
	Grade tinyint NULL,
	primary key(Sno, Cno),
	foreign key(Sno) references Student(Sno),
	foreign key(Cno) references Course(Cno)
)