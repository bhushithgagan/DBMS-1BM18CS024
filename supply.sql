create database supply;
use supply;
create table supplier (
sid int,
sname varchar(20),
city varchar(20),
primary key(sid));

create table parts (
pid int,
pname varchar(20),
color varchar(20),
primary key(pid));

create table catalog (
sid int,
pid int,
cost int,
foreign key (sid) references supplier(sid),
foreign key (pid) references parts(pid));

insert into supplier values(101,"ABC","BLORE");
insert into supplier values(102,"XYZ","BLORE");
insert into supplier values(103,"PQR","BLORE");
insert into supplier values(104,"RST","CHENNAi");
insert into supplier values(105,"BCD","BLORE");
insert into supplier values(101,"ABC","BLORE");

insert into parts values(201,"PEN","BLUE");
insert into parts values(202,"BOOK","RED");
insert into parts values(203,"PEN","YELLOW");
insert into parts values(204,"PENCIL","GREEN");
insert into parts values(205,"ERASER","BLUE");

insert into catalog values(101,201,50);
insert into catalog values(101,202,50);
insert into catalog values(102,201,30);
insert into catalog values(102,202,30);
insert into catalog values(103,203,10);
 

select distinct catalog.sid from parts,catalog where catalog.pid = parts.pid and parts.color="red" or parts.color="green";

select distinct sid from supplier,parts where parts.color="red" or supplier.city="BLORE";

select c1.sid,c2.sid from catalog c1,catalog c2 where c1.pid = c2.pid and c1.sid <> c2.sid and c1.cost>c2.cost;