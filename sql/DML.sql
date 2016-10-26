desc car;

alter table car
  add color varchar(20);

insert into car(id,name,price) values(1,'Benz',43.12);

insert into car(id,name,price) values(2,'BMW',100.93);

insert into car(id,name,price) values(3,'QQ',3.34);

select * from car;

select * from car where price>40;

select * from car where price>40 and name='BMW';

update car set price=price+3;

update car set price=price+10 where id=1;

delete from car where id=3;

insert into car(id,name,price) values(4,'Buick',27.9);

desc car;

select * from car;

select * from car where name='QQ' or name='BMW' or name='Benz';

select * from car where name in ('QQ','BMW','Benz');

select * from car where name not in ('QQ','BMW','Benz');

select * from car where price>=20 and price<=40;

select * from car where price between 20 and 40;

update car set color='blue' where id=2;

select * from car where color is null;

select * from car where name like 'B%';

select * from car where name like '%e%';

select * from car where name like 'B__';

select * from car where name like '_B__';

select * from car where name like '%B__';