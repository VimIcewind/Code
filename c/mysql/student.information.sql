create database student default charset utf8mb4;

create table information (
	id int(11) unsigned not null auto_increment,
	name varchar(50) not null default '',
	serial varchar(50) not null default '',
	address varchar(50) default '',
	primary key (id)
)
engine = InnoDB
default charset = utf8mb4;
