create table tbl_area(
parentid    varchar2(10) not null,
areaid      varchar2(10) not null,
areaname    varchar2 (60) not null,
primary key(parentid,areaid)
);
