drop table if exists workCenters;
drop table if exists workCenterStats;

create table workCenters(
id int auto_increment , 
`name` varchar(100) not null,
capacity int ,
primary key(id)
);

create table workCenterStats(
totalCapacity int not null
);