#---------------------------------------------基本语法--------------------------------------------------
# 创建规则: create database 库名;
# 在创建库时 ,希望指定编码语法: create database 库名 [character set 编码名]
#create database newsql;
# 删除指定的数据库: drop database 库名;
#drop database newsql;
create database newsql character set utf8;
drop database dt55_account; 
drop database dt55_mysql;
#--------------------------------------------创建表(table)-------------------------------------
#创建表语法：
#create table 表名(字段1 数据类型,字段2 数据类型,...)
#由于先有库(database),然后在库中创建表(table)
#选中一个数据库: use 库名;
use newsql;
create table java成绩表(
          姓名 varchar(40),
          班级 varchar(20),
          java成绩 float
);
#删除指定的表:
#drop table 表名;
#drop table java成绩表;
#---------------------------------往表中添加、删除、修改、查询数据(CRUD)---------------------------------------
#往指定表中添加数据: insert into 表名(字段1,字段2....) values(值1,值2...)
insert into java成绩表(姓名,班级,java成绩) values('刘词波','信安172',90.5);
insert into java成绩表(姓名) values('谢志豪');
#values中的varchar用单引号引用'';
#向表中插入数据第二种方式: insert into 表名 set 字段名1=值段值,字段名2=字段值2...
#如果"="是放在set关键字后面,表示"赋值运算符"
insert into java成绩表 set 姓名='陈锦锋',班级='xa172',java成绩=96.5;

#在插入时。可以省略掉表后面的字段名,前提是:values关键字后面的字段值数量必须与表字段数量一样(就是表字段每个都一一对应赋值时,可以省略)
insert into `java成绩表`values('谢志豪','信安172',88.5);
insert into java成绩表 values('cxj',null,100);

#同时插入多条数据:
insert into java成绩表(姓名,班级,java成绩)
values('abc','信安172',88),('cjf','信安172',88),('zrl','信安172',89);

#删除数据语句: delete from 表名 where 条件;(where关键字,相当if)
#如果"="是放在where关键字后面是表示"关系运算符"
delete from `java成绩表` WHERE 姓名='谢志豪';

#--------------------------------关系运算符-------------------------------------------------
#在mysql中常用关系运算符有: =(等于)、>、>=、 <、<=、!=(不等于);

#在mysql中关系运算符需要放置在where关键字之后;
#----------------------------------------查询-------------------------------------------------
#查询的语法规则: select 字段1,字段2...from 表名 [where 条件];
 select 姓名,班级,Java成绩 from java成绩表;
 select 姓名,Java成绩 from java成绩表;
 select 姓名 from java成绩表;
 #查看一张完整的表,显示所有数据: select *from 表名;
 select *from java成绩表;
 #查询表中Java成绩>=90学生的姓名;
 select 姓名 from java成绩表 where java成绩>=90;
 #在查询数据的时候,可以通过as来给某个字段取别名;
 select 姓名 as 名字 from java成绩表 where java成绩>=89;
 select 姓名 username from java成绩表 where java成绩>=90;

#------------------------------------------------逻辑运算符-------------------------------
#在mysql中常见的逻辑运算符有: 与(and),或(or),非(not);
 select *from java成绩表 where 班级='信安172' and java成绩>=88;
 select *from java成绩表 where 班级='信安172' or java成绩>=88;
 
 
 
 
 
 #---------------------------------------------作业---------------------------------------------------
 create database dt55_mysql character set utf8;
 use dt55_mysql;
 create table students(
 id int,
 stuName varchar(20),
 age int,
 weight float
 );
 insert into students(id,stuName,age,weight)
 values(3690,'lcb',20,60.5),(3666,'cjf',20,65.5),(3677,'xzh',20,50);
 select id 主键 ,stuName as 学生名字,age 年龄,weight as 体重 from students;
 #------给表取别名------
 select *from students;
 select *from students s;
 select s.id,s.stuName from students s;

 #---------------修改表中数据---------------------------------------------------------
 #修改语法:update 表名 set 字段名1=值1,字段名2=值2.....where 条件;
update students set stuName='yh',age=23 where id=3690;
#--update students set age=30 where 1=1;-- 当where语句一直为真时,则表中的所有age都将改成30,此语句相当于update students set age=30;

#删除students表中所有数据;
#-----delete from students where 1=1;-------------

#-------------------------------------------sql语言分类--------------------------------------------
#数据库查询语句(DQL,database query language):对表的查询语句,select(对表数据使用的语句)
#数据库定义语言(DDL,database defined language):create database\drop database\修改库\create table\drop table(对表到数据库之间使用的语句)
#数据库操作语言(DML，database manage language):update,insert,delete(对表数据使用的语句)

#------------DDL之操作数据库:-----------------------------------------------------------------------
#添加数据库:create database 库名 [character set utf8/gbk]
#删除指定数据库: drop database 库名
#查询
#(1)查看指定库的详细信息(可以指定数据库的编码方式):show create database 库名;
show create database dt55_mysql;
#(2)查看所有的库:show databases;
show databases;
#(3)查看当前用户链接的是哪个数据库:select database();
select database();
#(4)查看指定的数据库下有哪些表:show tables;
show tables;
use dt55_account;
update bank set money=money-200 where bankNo='119';
update bank set money=money+200 where bankNo='911';
select * from bank;
#修改指定数据库的编码方式: alter database 库名 character set 编码方式;
show create database dt55_account;

#----------DDL之表的操作:-----------------------------------------------
#创建一张表:create table 表名(字段1 数据类型，字段名2 数据类型......)
#删除一张表:drop table 表名;
#查询:
#(1)查询一张表的结构(查看表中字段,数据类型):desc 表名;
desc bank;
#(2)打印一张表的创建信息显示相关表的属性:show create table 表名;
show create table bank;
#修改表:
#(1)对已经存在的表进行重命名:rename table 旧表名 to 新表名;
rename table bank to aaa;
rename table aaa to bank;
#(2)往已经存在的表中添加字段信息: alter table 表名 add 字段名 数据类型;
alter table bank add gender varchar(3);
update bank set gender='女' where usename='ml';
#(3)删除某一张表中的字段: alter table 表名 drop 被删除的字段名;
alter table bank drop gender;
#(4)对已存在的表中的字段进行重命名:alter table 表名 change 旧字段名 新字段名 数据类型;
alter table bank change usename aaa varchar(20);
alter table bank change aaa usename varchar(20);
#(5)修改表中的某一字段的数据类型长度:alter table 表名 change 字段名 字段名 新数据类型;
alter table bank change usename usename varchar(30);

#----------往bank表中添加一个字段名birthday----
#alter table 表名 add 字段名 数据类型;(date 指年月日;datetime年月日时分秒);
alter table bank add birthday date;
select *from bank;
update bank set birthday='2018-02-16';



#-------------------------对某一数据库的备份与备份-------------------------------------
#第一张命令行:mysqldump -u root -p 密码 需要备份的数据库名>备份后的sql脚本名
#cmd:mysqldump -u root -p dt55_account>c:\dt55_account_back.sql;

#还原数据库:首先需要进入到mysql环境--->创建一个库--->在库下还原数据---->source 备份的数据库脚本;




#-----------------------------------------------作业二---------------------------------------
create database homework character set utf8;
use homework;
drop table shu;
#给表中的某一字段添加注释,使用comment 关键字跟在字段的最后面
create table book(
B_id bigint(20) auto_increment primary key comment '图书编号',
B_name varchar(20) comment '图书名称',
P_id int comment '出版社编号',
B_author varchar(20) comment '图书作者',
B_price float comment '图书价格'
);
#对B_id,B_name进行重命名
alter table book change B_id id int;
alter table book change B_name bookname varchar(20);
#删除指定的表字段
alter table book drop P_id;
#修改字段类型的长度
alter table book change bookname bookname varchar(40);
rename table book to shu;
desc shu;
drop table book;
drop table shu;
#添加3条数据
insert into shu values(1,'java从入门到放弃','lcb',1111),(2,'mysql从删库到跑路','cjf',111); 
insert into book values(null,'java从入门到放弃',2,'lcb',1111),(null,'mysql从删库到跑路',44,'cjf',111);


#-------------------------数据类型的属性------------------------------------
#mysql中常见的数据类型: varchar(n),float,int(n),bigint(n),date,datetime,text;
#注释: comment 
#默认值:default '默认值'
#非空:not NULL;如果某一字段被not null修饰后,添加数据时,此字段必须填写
#自动增长:auto_increment,尽量作用在int类型字段上
#主键:primary key,数据不能重复,一张表中只有一个字段可以作为主键
#唯一键:unique 被unique修饰的数据不能重复,表中可以多个字段被unique修饰
#注释放在所有属性的最后面,其他属性前后没有关系;
drop table students;
create table students(
id bigint(20) auto_increment primary key comment '学生编号',
stuname varchar(20) comment '学生姓名',
gender varchar(2) default '男' comment '性别',
classname varchar(20) not null comment '班级',
phone varchar(20) unique comment '手机号码'
);
delete from students where id=2;
#此处的detele可以删除整张表,但是删除的数据后,自增的字段不会重新计数,而是接着之前的数据继续增长
delete from students where 1=1;
#删除整个表数据:truncate table 表名 ,使用truncate删除数据后,如果字段是自增的,则重新计数;
truncate table students;
desc students;
show  create table students;

#---------------------------------------数据类型属性练习-----------------------------------------
#(1)创建一张表:users
#(2)id(用户编号,bigint(20))、username(用户名,varchar(40))、gender(性别,varchar(2))
#       idcard(身份证号,varchar(20))、javasorce(java成绩,float);
#(3)给每个字段都添加一个注释,括号中的分别是注释;
#(4)id为主键,自增,不能为空,usename不能为空,gender默认值是女 idcard唯一，不能为空,javasorce 默认值为0
create table users(
id bigint(20) not null auto_increment primary key comment '用户编号',
username varchar(40) not null comment '用户名',
gender varchar(2) default '女' comment '性别',
idcard varchar(20) unique not null comment '身份证号',
javasorce float default 0 comment 'java成绩'
);
show create table users;
insert into users set username='lcb',gender='男',idcard='110212',javasorce=90.1;
insert into users set username='lb',gender='男',idcard='11',javasorce=90.1;
insert into users set username='lc',gender='男',idcard='1102',javasorce=90.1;
update users set javasorce=88 where id=1;
update users set javasorce=88.5 where id=2; 
insert into users set username='l',gender='男',idcard='112',javasorce=19.8;


#--------------------------------------------------排序-------------------------------------------
#按照某字段(order by 字段 升序/降序)
#排序时字段类型可以是数字类型(int,float),也可以是varchar类型
#如果varchar类型对应的字段存放的是中文,则不能排序,但如果varchar字段值全为英文,那么可以排序(按照字典序)
#降序降序查询(DESC)
select * from users order by javasorce DESC;
#升序查询(ASC)
select * from users order by javasorce ASC;
select * from users;


#在mysql中函数使用select关键字调用:select 函数名(字段名)[from 表名];
select database();
#-----------------------------------聚合函数------------------------------------------
#(1)找出最大值:select max(字段名) from 表名;
#找出users表中javasorce的最高分
select max(javasorce) as 最高分 from users;
#(2)找出最小值:select min(字段名) from 表名;
select min(javasorce) as 最低分 from users;
#(3)求平均值:select avg(字段名) from 表名;
select avg(javasorce) as 平均分 from users;
#(4)求和:select sum(字段名) from 表名;
select sum(javasorce) from users;
#(5)统计记录有多少条数据:select count(字段名) from 表名;
#count(字段名):此字段的数据为null时,那此字段对应的数据条数不在统计之内
#为了解决上述问题,在统计某张表有多少条数据时,最好使用count(*);
alter table users add phone varchar(11);
select count(IDcard) as 总条数 from users;
select count(phone) as 总条数 from users;
select count(*) as 总条数 from users;

#---------------------------------------------常用函数------------------------------------
#时间函数:
#(1)获取当前系统时间,时间格式年月日时分秒:select now();
select now() as 当前系统时间;
#(2)只获取系统的时分秒:select curtime();
select curtime();
#(3)只获取系统的年月日:select curdate();
select curdate();
#数学函数:
#(1)向下取整函数:select floor(数值);
select floor(3.5);
#(2)向上取整函数:select ceil(数值);
select ceil(3.3);
#(3)随机生成一个0~1的小数:select rand();
select rand();
#获取一个随机的四位数字,不包含小数
select floor(rand()*10000) as 随机数;

#----------------------------------------同时查询多条数据----------------------------
select username 名字 from users where id=1;
#同时获取id=2,id=3或者id=4的数据
select * from users where id !=1;
select * from users where id=2 or id=3 or id=4;

#in(数据1,数据2,数据3...):判断表中某一个字段是否在in后面的参数列表之中
select * from users where id in (2,3,4);

select * from users where id not in(2,3) order by javasorce ASC;

#-----------------------------分组查询---------------------------------
create table godds(
 id bigint(20) not null auto_increment primary key comment '主键',
 gname varchar(40) comment '商品名称',
 gory varchar(20) comment '商品种类'
);
drop table godds;
rename table godds to goods;
show create table goods;
alter table goods change gory gory varchar(20) comment '商品类型';
#查询goods表中商品的类型(根据商品类型分类):select 想要显示的字段名 from 表名 group by 字段名(根据此字段分组);
select gory from goods group by gory;
select * from goods;
select gname,gory from goods group by gory;
#查询goods表中是否有类型为衣服的类型
#注意:如果一个查询语句中使用了group by,则后面的条件需要使用having关键字
select gory from goods group by gory having gory='玩具';


create table groupby(
id bigint(20) primary key not null auto_increment,
num bigint(20)
);
alter table groupby add leixing varchar(20);
alter table groupby change leixing 类型 varchar(20);
insert into groupby values(null,10,'A'),(null,11,'A'),(null,12,'A'),(null,13,'A'),(null,14,'A'),(null,15,'A'),(null,15,'A'),
(null,10,'B'),(null,12,'B'),(null,12,'B'),(null,13,'C'),(null,14,'C'),(null,13,'C'),(null,15,'C'),(null,20,'D'),(null,10,'E'),
(null,15,'E'),(null,25,'E');
#查询groupby表中的类型有哪些;
select * from groupby group by 类型;
#查询groupby表中各种类型的数量:
select 类型,count(类型) from groupby group by 类型;
#查询groupby表中各个类型的最大值:
select 类型,max(num) from groupby group by 类型;
#查询groupby表中各个类型的和:
select 类型,sum(num) from groupby group by 类型;
#查询groupby表中各个类型的平均值:
select 类型,avg(num) from groupby group by 类型;
#查询groupby表中各种类型的数量,各个类型的最大值,各个类型的最小值,各个类型的和,各个类型的平均值:
select 类型,count(类型),max(num),min(num),sum(num),avg(num) from groupby group by 类型;

#查询groupby表中类型最大值超过13的类型名,及其最大值:
select 类型,max(num) from groupby group by 类型 having max(num)>13;

#查询groupby表中值大于13的个数超过2个的类型名,及其类型数量:
select * from groupby where num>13;
select u.类型,count(u.类型) from (select * from groupby where num>13) u group by u.类型 having count(u.类型)>1;
select 类型,count(类型) from groupby group by 类型 having 类型 in (select u.类型 as 类型 from (select * from groupby where num>13) u group by u.类型 having count(u.类型)>1);
#--------------------------------------------分页--------------------------------------
#将goods表中有7条数据,每页显示三条,可以分为3页;
# limit 起始下标,每页显示的数据量;
#起始下标=每页显示的数据量*(页数-1)
#获取第一页数据
select * from goods limit 0,3;
#获取第二页数据
select * from goods limit 3,3;
#获取第三页数据
 select * from goods limit 6,3;
 
 
 #--------------------------------------------作业-----------------------------------------
 drop table Publisher;
 create table Publisher(
 P_id integer primary key auto_increment comment '出版社编号',
 P_name varchar(20) unique not null comment '出版社名称',
 P_lin varchar(20) not null comment '出版社联系人',
 P_tle varchar(20) comment '出版社联系电话',
 P_add varchar(50) comment '出版社详细地址'
 );
show create table publisher;
#往指定表中添加一个字段
alter table Publisher add price float comment '价格';
alter table publisher change P_id id integer auto_increment comment '出版社编号';
alter table publisher change P_name nam varchar(20) not null comment'出版社名称';
alter table publisher change P_lin lin  varchar(20) comment '出版社联系人';
alter table publisher change lin P_lin  varchar(20) not null comment '出版社联系人';
alter table publisher change P_lin lin  varchar(20) not null comment '出版社联系人';
alter table publisher change P_tle tel varchar(20) comment '出版社联系电话';
alter table publisher change P_add ade varchar(50) comment '出版社详细地址';
show create table publisher;
 
insert into Publisher values(1,'abc','abc1','112','abc3',21.1),
(2,'def','def1','111','def3',17.1),(3,'min','min1','117','min3',20.1),
(4,'kkk','kkk1','115','kkk3',11.1),(5,'aaa','aaa1','114','aaa3',31.1),
(null,'ccc','ccc1','119','ccc3',14.1);
select max(price) from publisher ;
select min(price) as 最低价 from publisher;
select * from publisher order by price DESC;

select *from publisher limit 0,3;
#分页后降序输出
select * from publisher order by price DESC limit 0 ,3;

#--------------------------------复制一张表-----------------------
#复制一张表的表结构及表数据
create table publisheraaa(
select * from Publisher 
);
insert into Publisheraaa select * from publisher where id=3;
#复制一张表的结构:create table 新表名 like 旧表名;
create table Publisherbbb like publisher;
#给复制处来的Publisherbbb赋值
insert into Publisherbbb select * from publisher;

#-----------------时间格式函数------------------------------------
create table per(
id bigint(20) primary key auto_increment not null comment '主键',
pername varchar(40) comment '人名',
birthday datetime
);
select * from per;
insert into per values(null,'lcb',now());

#-----------------------------子查询--------------------
#求出user表中的最高分;
select max(javasorce) as top from users;#虚表作为tep表(其中最高分值只有一个)
select username from users where javasorce=90;#作为u表(最大分数的人数有一个或多个)
#求出user表中的最高分且输出对应的名字(对应的u表中的最高分的名字,对应tep中的最高分)
#同时查询多张表:select * from 表1,表2...表n where 条件;
select u.username,tep.top from users u,(select max(javasorce) as top from users) tep
where u.javasorce=tep.top;

#------------------------------------------多表查询------------------------------------------
#部门表
create table dept(
id bigint(20) primary key not null auto_increment comment '部门编号',
deptName varchar(20)  comment '部门名'
);
#员工表
create table emp(
id bigint(20) not null primary key auto_increment comment '员工编号',
empName varchar(20) comment '员工名字',
salary float comment '薪水',
deptid bigint(20) comment '部门编号'
);
insert into dept values(1,'开发部'),(2,'测试部'),(3,'UI部'),(4,'财务部');
#(1)查询部门编号=1部门下有多少员工
select * from emp where deptid=1; 
#(2)查询所有部门中的所有员工
select d.deptName,p.empName from dept d,emp p where d.id=p.deptid;

#(3)找出开发部中的所有员工名,薪水,部门名
select p.empName,p.salary,d.deptName from emp p,dept d
where P.deptid=d.id and d.deptName='开发部';

#(4)找出测试部中的所有员工名,薪水,部门名
select p.empName,p.salary,d.deptName from emp p,dept d
where P.deptid=d.id and d.deptName='测试部';

#(5)找出开发部和测试部中的所有员工,薪水,部门名
#第一种方式
select p.empName,P.salary, d.deptName from emp p,dept d 
where p.deptid=d.id and d.deptName in('开发部','测试部');
#第二种方式
select p.empName,P.salary, d.deptName from emp p,dept d 
where p.deptid=d.id and (d.deptName='开发部' or d.deptName='测试部');
#第三种方式
# union:可以将两个查询语句的结果合并,合并前提是两个查询语句中的字段相同,并且会将合并后的表中相同的数据会去重
# union all:可以将两个查询语句的结果合并,合并前提是两个查询语句中的字段相同,并且会将合并后的表中相同的数据不会去重
select p.empName,p.salary,d.deptName from emp p,dept d
where P.deptid=d.id and d.deptName='开发部'
union all
select p.empName,p.salary,d.deptName from emp p,dept d
where P.deptid=d.id and d.deptName='测试部';

#-------------------------------------
#多表查询方式1: select * from 表1,表2,表3....表n where 条件
#多表查询方式2: 通过连接关键字

#内连接(表1 和 表2 同时满足条件才会输出):表1 inner join 表2 on 条件(多个表有关联的条件) where 条件(单表条件)
#查询所有部门中的所有员工
select * from dept d inner join emp e on d.id=e.deptid;
#找出开发部中的所有员工名,薪水,部门名
select e.empName,e.salary,d.deptName from dept d inner join emp e on d.id=e.deptid where d.deptName='开发部';
#找出开发部和测试部中的所有员工,薪水,部门名
select e.empName,e.salary,d.deptName from dept d inner join emp e on d.id=e.deptid
where d.deptName in('开发部','测试部');
select e.empName,e.salary,d.deptName from dept d inner join emp e on d.id=e.deptid
where d.deptName ='开发部' or d.deptName='测试部';
select e.empName,e.salary,d.deptName from dept d inner join emp e on d.id=e.deptid
where d.deptName ='开发部' union all
 select e.empName,e.salary,d.deptName from dept d inner join emp e on d.id=e.deptid
where d.deptName='测试部';

#-------------------------作业-------------------------------
use newsql;
create table Publisher(
P_id bigint(20) primary key auto_increment comment '出版社编号',
P_name varchar(20) unique not null comment '出版社名称',
P_link varchar(20) not null comment '出版社联系人',
P_tel varchar(20) comment '出版社联系电话',
P_address varchar(50) comment '出版社详细地址'
);
create table book(
B_id bigint(20) primary key auto_increment comment '图书编号',
B_name varchar(20) comment '图书名称',
P_id bigint(20) comment '出版社编号',
B_aut varchar(20) comment '图书作者',
B_price float comment '图书定价'
);
insert into publisher values(null,'武汉大学出版社','lcb','111111','武汉'),
(null,'长江出版社','xzh','222222','武汉'),(null,'北京出版社','cjf','333333','北京'),
(null,'青鸟出版社','zrl','444444','武汉'),(null,'黄河出版社','yh','555555','上海');

#查询出版社的所有信息:
select * from publisher;

insert into book values(1,'java编程思想',1,'神奇',99.9),(2,'sp入门思想',1,'赵六',69.9),
(3,'java入门到放弃',4,'习近',154545),(4,'mysql',2,'阮吧',2),(null,'计算机基础',2,'王十',66);

#查询所有的图书信息:
select * from book;

#查询'计算机与基础'的所有信息,包括出版社信息:
select b.*, p.P_name from book b inner join publisher p on b.P_id=p.P_id where
b.B_name='计算机基础';

#查询'长江出版社'出版的所有图书信息
select b.*, p.P_name from book b inner join publisher p on b.P_id=p.P_id where
p.P_name='长江出版社';

#查询'黄河出版社'出版的所有图书信息
select b.*, p.P_name from book b inner join publisher p on b.P_id=p.P_id where
p.P_name='黄河出版社';
#(结果发现全空) 内连接:只有表1 和 表2 两者都满足on后面的条件才会输出
#将出版社的link='xzh'的手机号改为'1520173690';
update publisher set P_tel='1520173690' where P_link='xzh';

#----------------模糊查询--------------------
#查询book表中B_aut以'王'开头的所有书籍:
select * from book where B_aut like '王%';#'%'是占位符

#查询book表中B_aut以'近'结尾的所有书籍:
select * from book where B_aut like '%近';#'%'是占位符

#查询book表中B_aut中包含'奇'的所有书籍:
select * from book where B_aut like '%奇%'

#-----------------------------外连接-----------------------------------

#join 左边的表为左表,右边的表为右表:
#右外连接:right join(当条件不满足时,以右边的表为主,查询右边的表中的字段一定会输出,其他字段输出null)

select b.*, p.P_name,p.P_link from book b right join publisher p on b.P_id=p.P_id where
p.P_name='黄河出版社';


#左外连接:left join(当条件不满足时,以左边的表为主,查询左边的表中的字段一定会输出,其他字段输出null)
select b.*, p.P_name,p.P_link from publisher p left join book b on b.P_id=p.P_id;

#----------------------------------3表查询-----------------------------------
create table qu(
q_id bigint(20) primary key auto_increment comment '问题编号',
q_title varchar(20) comment '问题标题'
);
create table tea(
t_id bigint(20) primary key auto_increment comment '老师编号',
t_name varchar(20) comment '老师名字'
);
create table tea_qu(
id bigint(20) primary key auto_increment comment '学生编号',
q_id bigint(20) comment '问题编号',
tea_id bigint(20) comment '老师编号',
sorce float comment '分数' 
);
#-------------------------
#查询tea_id=4的平均得分:
#得到tea_id=4的总分数:
select sum(sorce) as ans from tea_qu where tea_id=4;


#总记录数
select count( * ) from tea_qu;

#人数:
select count(*) as num from tea_qu where q_id=4 and tea_id=4;

select tem1.ans/tem2.num as 平均分 from (select sum(sorce) as ans from tea_qu where tea_id=4) tem1,
(select count(*) as num from tea_qu where q_id=4 and tea_id=4) tem2;

#查询王二买了的具体商品名,价格,客户名,客户地址,客户手机号
select g.goodname,g.goodprice,c.coname,c.coaddr,c.cophone from goods g inner join good_co gc inner join coustmer c on g.id=gc.goodid and gc.coid=c.id
where c.coname='王二';

#-----------------------------------------视图-----------------------
use homework;
#视图:在真实表上面构建一张虚表
#查询dept,emp要求查看所有的员工信息,还有部门信息;
select * from dept d inner join emp e on  d.id=e.deptid;

#创建视图:create view 视图名 as 查询语句(虚表);
create view view_all as 
select e.id as empid,e.empName,e.salary,e.phone,d.deptName from dept d inner join emp e 
on  d.id=e.deptid;
#查询视图的语法与查询表的语法一样:
select * from view_all;

#其中视图删除,修改,增加时,真实的表也在对应的改变.所以要对视图设置权限;
#删除视图:drop view 视图名;
drop view view_all;

#删除视图中的某一条数据:
create view view_emp as select * from emp;
delete from view_emp where id=1;
#往视图中添加数据:
insert into view_emp set empName='lcb',id=1;

#修改某条数据:
update view_emp set empName='ccc' where id=7;
#-------------------------------------------------------------
#数据库模型(powerDesinger):
#---------------------------------------------事务-------------------------------
use newsql;
#多组修改:中途修改失败,比如第一条成功，第二条失败整个事务失败.
#于是将事务中的语句装入一个箱子(结构体)
update accounts_bank set money = money -200 where bankNo='110';
update accounts_bank set money = money +200 where bankNo='119';

update accounts_bank set money = money -300 where bankNo='120';
update accounts_bank set money = money +300 where bankNo='119';
#事务:
#什么是事务?多组操作要么全部成功要么全部失败.
#多组查询时失败了不会影响表中数据,多组修改,多组删除,多组添加的时候中途失败会影响表中的数据,
#所以在多组修改,删除和添加时要考虑到事务性
#事务的4大特性:
   #原子性(automic):同一个事务中的操作不能分割,必须是一个整体,整个事务相当于一条sql语句
   #start transaction(开启事务)
   #rollback(回滚),(如果结束事务后不能回滚,回滚只能在事务中回滚)
   #commit(结束事务)
   #只有commit之后才会执行此条语句;
   #start transaction 与 commit 成对出现.
   
   #一致性(consistent):比如:两者相互转账,两者前后的金额总量相等
   
   #隔离性(isolation):不同事务两者互不干扰
   #mysql四种隔离级别:read uncommitted(脏读),read committed(不可重复读),repeatable read,serializable(隔离级别同时只能用一种)(由低到高)(隔离级别越高数据库的性能越差)
    #查询mysql软件的隔离级别:select @@transaction_isolation;
   select @@transaction_isolation;
   #修改mysql软件默认的隔离级别: set global transaction isolation level 隔离级别;
   #不同的隔离级别会引发不同的问题:
        #当mysql事务的隔离级别为:read uncommitted时,会引发脏读:
        #脏读:一个事务可以读取另 一个事务未提交的数据
        #如何解决脏读问题:可以将数据库事务的隔离级别改为:read committed;
        #read committed只能读取提交事务成功后的数据.
        #当mysql事务的隔离级别为:read committed时,会引发不可重复读:在同一事务中多次读取的数据不一致(不可重复读是因为表中数据改变了)
        #如何解决不可重复读问题:可以将数据库事务的隔离级别改为:repeatable read;
        #当mysql事务的隔离级别为:repeatable read时会引发虚读(幻读)(虚读是因为表中的数据条数添加了)
   
   #持久性(durable):事务一旦执行就不能回滚了.


#-------------------------------------存储过程--------------------------------------------------
use homework;
update emp set salary=salary+1000 where id=1;
#存储过程相当于一个调用的函数
#创建一个存储过程语法: create procedure 存储过程名(参数名1 参数1的数据类型,参数名2 参数2的类型,....)#参数可分为两种:(输入参数(in 参数名 参数类型,in 参数名 参数类型),输出参数(out 参数名 参数类型,out 参数名 参数类型))
#              begin
#                      代码块;
#              end
#书写一个加薪的存储过程:
#delmiter 符号:是将语句分割符改为后面的符号
delimiter $$
create procedure addsalary(money float,idd bigint)
begin
      update emp set salary=salary+money where id=idd;
end $$
delimiter ;
#调用存储过程函数:call 存储过程名(参数1,参数2,...)
call addsalary(-1000,1);
drop procedure addsalary;
#删除存储过程(调用函数):drop procedure 存储过程名;

#带返回值的存储过程(调用函数带有返回值)
#赋值的时候要有关键字set
delimiter //
create procedure ans(i float,j float,out num float)#(in i float,in j float,out num float)
begin
	  set num=i+j;
end //
delimiter ;
call ans(10,20,@res);
select @res;

#--------------------存储过程的语法规则--------------------
#存储过程的语法规则:
#delmiter 符号:是将语句分割符改为后面的符号
#创建一个存储过程语法: create procedure 存储过程名(参数名1 参数1的数据类型,参数名2 参数2的类型,....)#参数可分为两种:(输入参数(in 参数名 参数类型,in 参数名 参数类型),输出参数(out 参数名 参数类型,out 参数名 参数类型))
#              begin
#                      代码块;
#              end
#书写一个加薪的存储过程:
#delmiter 符号
#delmiter ;
#删除存储过程:
#drop procedure [if exists] 存储过程名(调用函数名);

#调用存储过程(调用函数):
#call 存储过程名(参数1,参数2...);
#带if语句发存储过程:
#加薪的函数调用,传递两个参数:id,money (只能传递正数)
delimiter //
create procedure adds(idd bigint,money float)
begin
     if(money>0) then
     update emp set salary=salary+money where id=idd;
     end if;
end//
delimiter ;
call adds(1,-500);
drop procedure adds;
#带if...else 的存储过程:
delimiter //
create procedure addelse(idd bigint,money float)
begin
     if money>0 then
         update emp set salary=salary+money where id=idd;
     else
     select '嘿嘿,不能扣薪哦!' as '温馨提示';
     end if;
end//
delimiter ;
call addelse(1,5123);
drop procedure if exists addelse;
drop procedure if exists ans;
#带if...elseif...else 语句的存储过程:
delimiter //
create procedure buy(money float)
begin
     if money>500 then
         select '买A' as '类型';
	 elseif money>300 then
         select '买B' as '类型';
	 elseif money>100 then
         select '买C' as '类型';
     else
     select '买D' as '类型';
     end if;
end//
delimiter ;
call buy(400);

#case 选择分支结构:
delimiter //
create procedure days(i int)
begin
     case i
     when 1 then
     select '星期一' as '日期';
     when 2 then
     select '星期二' as '日期';
     else
      select '不是星期一也不是星期二' as '日期';
      end case;
end//
delimiter ;
call days(5);
drop procedure days;
#-----while循环-------------:
#想表中插入多条数据;
#在存储过程中申明一个变量:declre 变量名 变量数据类型;
delimiter //
create procedure empwhile(i int)
begin
     declare a int;
     set a=0;
     while a<i do
          insert into  emp set empName='xxx',salary=100;
          set a=a+1;
     end while;
end//
delimiter ;
call empwhile(10);
drop procedure empwhile;
#创建一个求和的函数调用:
delimiter //
create procedure ans(in i int,out sum int)
begin 
       declare a int;
       set a=1,sum=0;
       while(a<=i) do
       set sum=sum+a;
       set a=a+1;
       end while;
       
end //
delimiter ;
call ans(100,@res);
select @res as '和';
#-------------------loop循环--------------:
#delimiter //
#create procedure 存储过程名(参数1 参数1数据类型,参数2 参数2数据类型,...)
#begin
#      loop循环别名:loop
#				循环体;
#                
#                leave loop循环别名
#      end loop;
#end;
#delimiter //;
#向emp表中添加100条数据
delimiter //
create procedure adda()
begin
     declare i int;
     set i=0;
   loop_add:loop
     insert into emp set empName='aaa',salary='11000';
     set i=i+1;
     if(i=100) then
     leave loop_add;
     end if;
     end loop;
end //
delimiter ;
truncate table emp;
call adda();
drop procedure ans;
drop procedure buy;
drop procedure adda;
#-----查找1~n之间的3的倍数之和------
delimiter //
create procedure ans(in n int,out s int)
begin
     declare i int default 1;
     set s=0;
     loop_add:loop
     if(i mod 3=0) then
     set s=s+i;
     elseif(i=n) then
     leave loop_add;
     end if;
     set i=i+1;
     end loop;
end//
delimiter ;
call ans(10,@res);
select @res;
#select sum(salary) into tatal from emp;(将查询的总和传给变量total)


#-------------------------------------------触发器--------------------------------------
use homework;
#触发器:trigger,事先为某张表绑定好一段代码,当表中的某些内容发生改变的时候(增删改)系统会自动触发代码执行

#触发器触发属性:事件类型,触发时间,触发对象
#               事件类型：insert,delete,update
#               触发时间：前后(befor，after)
#               触发对象：表中的每一条记录(行)
#一张表中只能拥有一种触发时间的一种事件类型的(不能相同的触发时间和事件类型)触发器，最多一张表中有6个触发器。

#创建触发器:
/*
delimiter //
create trigger 触发器名称 触发时间 事件类型 on 表名(此表对应事件类型) for each row  /只有表的事件类型之后触发器启动(只有myorder表中插入一条数据之后,触发器启动)/
begin
      代码段;
end//
delimiter ;
*/
create table mygood(
gid bigint(20) primary key auto_increment comment '商品编号',
gname varchar(20) not null comment '商品名称',
gprice float comment '商品价格',
gnum bigint(20) comment '商品库存'
);
insert into mygood values(null,'5x',11000,100),(null,'6s',12000,10);
create table myorder(
oid bigint(20) primary key auto_increment comment '订单号',
gid bigint(20) not null comment '商品编号',
onum bigint(20) comment '商品数量'
);
delimiter //

create trigger after_order after insert on myorder for each row
begin
      update mygood set gnum=gnum-1 where gid=1;
end //
delimiter ;

#查看所有触发器:show triggers;
show triggers;
#查看触发器创建语句:show create trigger 触发器名字;
show create trigger after_order;
#所有触发器都会保存在一张系统表中:information_schema.triggers;
select * from information_schema.triggers;

#使用触发器:
/*触发器:不需要调用,而是当某种情况发生时自动触发(上面的触发器是myorder表中插入数据之后触发)
*/
select * from mygood;
select * from myorder;
insert into myorder values(null,1,3);#(查询发现触发器触发了,但是只改了id=1的数据,且库存只减少了1)
#触发器不能修改,于是要想修改触发器因先删除在创建;
#删除触发器:drop trigger 触发器名字;
drop trigger after_order;

#---------------------------------------触发器记录-----------------------------------
/*触发器记录:不管触发器是否触发了,只要当某种操作准备执行,系统就会将记录当前要操作的状态
和即将执行后可能产生的新状态保留下来,其中当前的状态保存在old中,操作后可能的状态保存在new中
old表示执行前的状态,new表示执行后产生的状态(删除操作没有new记录,插入的时候没有old记录)

old和new都代表的是记录本身,任何一条记录除了有数据,还有字段名 使用方式:old.字段名/new.字段名

new代表的是假设发生后的结果状态*/
delimiter //
create trigger after_order after insert on myorder for each row
begin
	  #触发器内容开始:新增一条订单:old 没有，new代表新的订单
      update mygood set gnum=gnum-new.onum where gid=new.gid;
end //
delimiter ;
insert into myorder values(null,2,6);

#-------触发器:订单生成前需要查看库存是否足够
delimiter //
create trigger before_order before insert on myorder for each row
begin
	 select gnum from mygood where gid=new.gid into @inv;#将查询到的库存数量存放到@inv这个变量中
     if @inv<new.onum then
     insert into xxx values(xxx);#暴力终结触发器
     end if;
end //
delimiter ;
insert into myorder values(null,2,1000);

#-------------------------对存在的表添加属性外键------------------------
#外键:指引用另外一个表中的一列或多列数据，被引用的列应该具有主键约束或者唯一性约束。外键用来建立和加强两个表数据之间的连接。
/*首先建立两张表，student和class，学生表中的cid是学生所在的班级id，是引入了班级表class中的主键cid。
那么cid就可以作为表student表的外键。被引用的表，即表class是主表，引用外键的表，即student，是从表。两个表是主从关系。表student用cid可以连接表grade中的信息，从而建立了两个表中的连接。
*/
#创建外键:alter table 表名 add constraint [外键别名] foreign key(外键字段名) references 外表表名(主键字段名);
#创建外键:alter table 表名 add foreign key[外键别名] (外键字段名) references 外表表名(主键字段名);
use newsql;
create table class(
cid bigint(20) not null primary key,
cname varchar(20)
);
drop table student;
create table student(
sid bigint(20) not null primary key,
sname varchar(20),
cid bigint(20) not null
);
show create table class;
show create table student;
desc class;
desc student;
alter table student add constraint FK_ID foreign key (cid) references class (cid);
insert into class values(1,'一班'),(2,'二班'),(10,'十班');
select * from class;
insert into student values(1,'lcb',1),(2,'cjf',1);
select * from student;
insert into student values(10,'xzz',5);
delete from class where cid=1;
#删除外键属性:alter table 表名 drop foreign key 外键名称;
#若没有外键名称(有一个系统默认名称)则需要查看show create table 表名;
alter table student drop foreign key FK_ID; 
alter table student add foreign key (cid) references class (cid);
#查看当前表中外键个数SELECT @@FOREIGN_KEY_CHECKS;