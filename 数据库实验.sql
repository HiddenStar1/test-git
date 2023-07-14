#-----------------------实验一---------------------------
create database stu charset gbk;
show create database stu;
use stu;
show variables like '%datadir%';
drop table Student;
create table Student(
Son varchar(20) primary key comment '学号',
Sname varchar(40) unique comment'姓名',
Ssex varchar(2) comment '性别',
Sage bigint(20) comment'年龄',
Sdept varchar(10) comment '所在系'
);
insert into Student values('201215121','李勇','男',20,'CS'),('201215122','刘晨','女',19,'CS'),
('201215123','王敏','女',18,'MA'),('201215124','张立','男',19,'IS');

drop table Course;
create table Course(
Con varchar(20) primary key comment '课程号',
Cname varchar(20) not null comment '课程号',
Cpno varchar(20) default null comment '先修课',
Ccredit bigint(20) comment'学分',
foreign key (Cpno) references Course(Con)
);
insert into Course(Con,Cname,Ccredit)values('1','数据库',4),('2','数学',2),('3','信息系统',4),
('4','操作系统',3),('5','数据结构',4),('6','数据处理',2),('7','PASCAL语言',4);

update Course set Cpno='5' where Con='1';
update Course set Cpno='1' where Con='3';
update Course set Cpno='6' where Con='4';
update Course set Cpno='7' where Con='5';
update Course set Cpno='6' where Con='7';
create table SC(
Son varchar(20),
Con varchar(10),
Grade bigint(20),
primary key(Son,Con),
foreign key(Son) references Student(Son),
foreign key(Con) references Course(Con)
);
drop table SC;
insert into SC values('201215121','1',92);
insert into SC values('201215121','2',85);
insert into SC values('201215121','3',88);
insert into SC values('201215122','2',90);
insert into SC values('201215122','3',80);

create table sbak like Student;
create table sss select * from Student;
drop table sss;
insert into sbak select * from Student;
delete from sbak where Sage in(20,19,18);
alter table sbak change Sage Syear datetime;
desc sbak;
show create table sbak;
create index dp on sbak(Sdept);
show index from sbak;

#---------------------------实验二---------------------------------------
#查询李勇没有选修的课程编号,和课程名
select sc.Con from student ,sc where student.Son=sc.Son and student.Sname='李勇';

select * from course c,(select sc.Con as ck from student ,sc where student.Son=sc.Son and student.Sname='李勇') u where c.Con=u.ck;


select c.Con,c.Cname from course c where c.Con not in(select sc.Con from student ,sc where student.Son=sc.Son and student.Sname='李勇');
#查询80分以上的学生学号和姓名
select student.Son,student.Sname from sc,student where sc.Son=student.Son and sc.Grade>80;
#查询每门课程的课程号，选修人数和平均成绩
select Con,avg(Grade),count(Con) from sc group by Con;
#查询选课学生的学号，姓名，课程名和成绩
select s.Son,stud.Sname,co.Cname,s.Grade from course co,sc s,student stud where co.Con=s.Con and s.Son=stud.Son;
#查询选修了数学课程的学号和成绩，按成绩降序排列
select sc.Son,sc.Grade from sc,course where sc.Con=course.Con and course.Cname='数学'order by sc.Grade DESC;
#查询85分以上超过2人的课程号
select u.Con,count(u.Con) as num from (select Son,Grade,Con from sc where Grade>=85) u group by u.Con having num>=2; 
#查询3号课程的最高分
select max(u.Grade) as 最高分 from (select Grade from sc where Con=3) u;
#查询每门课程的最高分
select Con,max(Grade) from sc group by Con; 
#查询所有课程的课程号，课程名和成绩，没有被选的课程也需要显示
select c.Con,c.Cname,s.Grade from course c left join sc s on c.Con=s.Con; 
#查询其他系比IS系所有学生年龄都小的学生名单
select s.* from student s,(select min(student.Sage) as Sage from student where Sdept='IS') u
where s.Sage<u.Sage and s.Sdept!='IS';

#------------------------------------------------------实验三------------------------------
use stu;
#1.参照S,C,SC表分别建立新表Sbak,Cbak,SCbak
drop table if exists sbak;
create table Sbak like student;
create table Cbak like course;
create table SCbak like sc;
insert into scbak select * from sc;
select * from sbak;
#2.试在SC表中插入一条记录,说明全外连接,左外连接,右外连接的区别.
show create table sc;
insert into sc set son='201215122',con='1';
#查找出所以学生的选修课成绩:
select s.Son,sc.Grade from student s left join sc on s.Son=sc.Son;
select s.Son,sc.Grade from sc right join student s on s.Son=sc.Son;
#3.将学生表中的CS修改为计算机系,MA修改为数学系,IS修改为信管系.
update student set Sdept ='计算机系' where Sdept='CS';
update student set Sdept='数学系' where Sdept='MA';
update student set Sdept='信管系' where Sdept='IS';
#4.删除未选课学生的所有信息.
delete from student where Son not in(select distinct Son from sc);
#5.试恢复S,SC表的表结构及数据(方法不限).
drop table student;
select * from student;
insert into Student values('201215123','王敏','女',18,'MA'),('201215124','张立','男',19,'IS');
update student set Sdept ='CS' where Sdept='计算机系';
select * from sc;
delete from sc where Son='201215122' and Con='1';


#----------------实验四--------------------------
 select sc.Son,s.Sname,c.Cname,sc.Grade from student s,sc,course c where s.Son=sc.Son and s.Sname='李勇' and sc.Con=c.Con;
delimiter //
create procedure sel(namem varchar(20))
begin
     select sc.Son,s.Sname,c.Cname,sc.Grade from student s,sc,course c where s.Son=sc.Son and s.Sname=namem and sc.Con=c.Con;
end//
delimiter ;
call sel('李勇');
call sel('刘晨');
SELECT @@FOREIGN_KEY_CHECKS;
show create table sc;
alter table sc drop foreign key sc_ibfk_2;
insert into sc values('201215121',8,53);
insert into sc values('201215121',6,53);
delete from sc where Con=8;
delimiter //
create trigger before_c before insert on sc for each row
begin
	 if new.Con not in (select Con from course) then
	 insert into xxx values(xxx);
     end if;
end //
delimiter ;