show databases;
create database insurance;
use insurance;

create table person (
driverid varchar(10),
name varchar(20),create database lab1;
use lab1;

create table person(
driver_id varchar(20),
name varchar(20),
address varchar(30),
primary key(driver_id)
);

insert into person values ('A01', 'Richard', 'Srinivas Nagar');
insert into person values ('A02', 'Pradeep', 'Rajaji Nagar');
insert into person values ('A03', 'Smith', 'Ashok Nagar');
insert into person values ('A04', 'Venu', 'NR Colony');
insert into person values ('A05', 'Jhon', 'Hanumanth Nagar');

select * from person;

create table car(
reg_num varchar(20),
model varchar(10),
year int,
primary key(reg_num)
);

insert into car values ('KAO52250', 'Indica', 1990);
insert into car values ('KAO52232', 'Lancer', 1957);
insert into car values ('KAO52794', 'Toyota', 1998);
insert into car values ('KAO52468', 'Honda', 2008);
insert into car values ('KAO52542', 'Audi', 2005);

create table accident(
report_num int,
accident_date date,
location varchar(20),
primary key(report_num)
);

insert into accident values (11, '03-01-01', 'Mysore Road');
insert into accident values (12, '04-02-02', 'South End Circle');
insert into accident values (13, '03-01-21', 'Bull Temple Road');
insert into accident values (14, '08-02-17', 'Mysore Road');
insert into accident values (15, '05-03-04', 'Kanakpura Road');

create table owns(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id, reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);

insert into owns values ('A01', 'KAO52250');
insert into owns values ('A02', 'KAO52232');
insert into owns values ('A03', 'KAO52794');
insert into owns values ('A04', 'KAO52468');
insert into owns values ('A05', 'KAO52542');

create table participated(
driver_id varchar(20),
reg_num varchar(20),
report_num int, 
damage_amount int,
primary key(driver_id, reg_num, report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);

insert into participated values ('A01', 'KAO52250', 11, 10000);
insert into participated values ('A02', 'KAO52232', 12, 50000);
insert into participated values ('A03', 'KAO52794', 13, 25000);
insert into participated values ('A04', 'KAO52468', 14, 33000);
insert into participated values ('A05', 'KAO52542', 15, 12400);

update participated 
set damage_amount = 25000
where report_num = 12;

insert into accident values (16, '04-02-02', 'MG Road');

select count(driver_id) 
from participated, accident
where participated.report_num = accident.report_num
and accident_date like '%08%';

select count(participated.reg_num)
from participated, car, accident
where participated.reg_num = car.reg_num
and participated.report_num = accident.report_num
and car.model = 'Lancer';

SELECT * FROM PARTICIPATED ORDER BY DAMAGE_AMOUNT DESC;

SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED;

SET SQL_SAFE_UPDATES = 0;

set @averagedam = (SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);
DELETE FROM PARTICIPATED WHERE 
DAMAGE_AMOUNT<@averagedam;

SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID AND DAMAGE_AMOUNT>(SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);

SELECT MAX(DAMAGE_AMOUNT) FROM PARTICIPATED;


address varchar(50),
primary key(driverid)
);

create table car (
regno varchar(10),
model varchar(10),
year int,
primary key(regno)
);

create table accident (
reportno varchar(10),
accidentdate int,
location varchar(100),
primary key(reportno)
);

create table owns (
driverid varchar(10),
regno varchar(10),
primary key(driverid,regno),
foreign key(driverid) references person (driverid)
);

create table participated (
driverid varchar(10),
regno varchar(10),
reportno varchar(10),
damageamount int, 
primary key (driverid,regno,reportno),
foreign key(driverid) references person (driverid),
foreign key(regno) references car (regno),
foreign key(reportno) references accident (reportno)
);

insert into person values ("001","abc","Blore North");
insert into person values ("002","wxy","Blore South");
insert into person values ("003","pqr","Blore Urban");
insert into person values ("004","mno","Blore Rural");
insert into person values ("005","hij","Blore Central");

insert into car values ("KA0001","abc",2011);
insert into car values ("KA0002","lexus",2005);
insert into car values ("KA0003","mazda",2009);
insert into car values ("KA0004","dc",2016);
insert into car values ("KA0005","lotus",2019);

insert into owns values ("001","KA0001");
insert into owns values ("002","KA0002");
insert into owns values ("003","KA0003");
insert into owns values ("004","KA0004");
insert into owns values ("005","KA0005");

insert into accident values ("11",01-11-00,"kh road");
insert into accident values ("22",02-04-10,"kr road");
insert into accident values ("33",03-08-12,"mysore road");
insert into accident values ("44",04-03-16,"magadi road");
insert into accident values ("55",05-10-19,"kolar road");

insert into participated values ("001","KA0001","11",10000);
insert into participated values ("002","KA0002","22",25000);
insert into participated values ("003","KA0003","33",30000);
insert into participated values ("004","KA0004","44",40000);
insert into participated values ("005","KA0005","55",50000);

select * from person;
select * from car;
select * from owns;
select * from accident;
select * from participated;

update participated set damageamount = 25000 where regno = "KA0001" and reportno = "11";
insert into accident values ("15",22-03-2000,"CR road");
select count(distinct driverid) from participated,accident where participated.reportno = accident.reportno and accidentdate like '%00';
select count(participated.reportno) as count from participated,car where participated.regno = car.regno and car.model = 'mazda'; 

select driverid from participated where damageamount > (select avg(damageamount) from participated);
