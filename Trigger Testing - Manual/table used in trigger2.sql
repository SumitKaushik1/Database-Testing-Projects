
drop table if exists members;
drop table if exists reminders;

create table members(
id int auto_increment ,
name varchar(100) not null,
email varchar(255),
birthdate date,
primary key(id)
);

create table reminders(
id int auto_increment,
memberId int,
message varchar(255) not null,
primary key(id,memberId)
);