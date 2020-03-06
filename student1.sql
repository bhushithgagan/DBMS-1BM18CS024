create database stud1;
use stud1;

create table student(
snum int,
sname varchar(10),
major varchar(10),
lvl varchar(10),
age int,
primary key (snum));

create table class (
cname varchar(10),
meettime time,
room varchar(10),
fid int,
primary key (cname),
foreign key (fid) references faculty (fid));


create table enrolled (
snum int,
cname varchar(10),
foreign key (snum) references student (snum),
foreign key (cname) references class (cname));

create table faculty (
fid int,
fname varchar(10),
deptid int,
primary key(fid));


insert into student values (101,"ABC","CSE","JR",20);
insert into student values (102,"EFG","CSE","SR",20);
insert into student values (103,"XYZ","CSE","JR",20);
insert into student values (104,"PQR","ISE","JR",20);
insert into student values (105,"LMN","CSE","SR",20);

insert into class values ("A",'08:55:00',"R128",1001);
insert into class values ("B",'08:55:00',"R129",1002);
insert into class values ("C",'09:50:00',"R130",1003);

insert into faculty values (1001,"AAA",001);
insert into faculty values (1002,"BBB",002);
insert into faculty values (1003,"CCC",001);

insert into enrolled values (101,"A");
insert into enrolled values (102,"A");
insert into enrolled values (103,"C");
insert into enrolled values (104,"B");
insert into enrolled values (105,"C");

 