use classicmodels;
create table courses(
courseid int(3) primary key,
coursename varchar(20) unique,
duration integer(2),
fee integer(3) check(fee between 100 and 500)
);

select * from courses;

-- -------------------------

create table students
(
sid integer(5) primary key,
sname varchar(20) not null,
age integer(2) check(age between 15 and 30),
doj datetime default now(),
doc datetime,
courseid integer(3),
foreign key(courseid) references courses(courseid) on delete cascade
# on delete cascade means if the primary key conntent is deleted then 
# the foreign key content will be deleted automatically which is referencing to it
);

describe table courses;
describe table students;