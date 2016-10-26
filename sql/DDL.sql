select * from tab;

select * from dba_users;

create table stu(
  name varchar(30),
  age int
  );

alter table stu
  add id int;
  
select * from tab;

select * from stu;

create table car(
  id int,
  name varchar2(30)
  );

alter table car
  add price integer;
  
desc car;

alter table car
  modify price numeric(10,2);

alter table car
  add colors varchar(30);

alter table car
  rename column colors to color;

alter table car
  drop column color;

