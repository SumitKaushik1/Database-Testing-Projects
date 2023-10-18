use classicmodels;

drop table if exists salaries;
create table salaries(
employeeNumber int ,
validFrom Date not null,
salary int not null default 0,
primary key(employeeNumber)
);

insert into salaries (employeeNumber,validFrom,salary) values
(1002,'2000-01-01',50000),
(1056,'2000-01-01',60000),
(1076,'2000-01-01',70000);

select * from salaries;

# whatever salary is inserted into salaries table 
# it is inserted inot salary archive


drop table if exists salaryArchives;
create table salaryArchives(
id int auto_increment,
employeeNumber int ,
validFrom Date not null,
salary decimal(12,2) not null default 0,
deleteAt timestamp default now(),
primary key(id)
);

#  हिन्दी में
# In English
# Besides the DECIMAL keyword, you can also use DEC , FIXED , or NUMERIC because they are synonyms for DECIMAL . Like the INT # data type, the DECIMAL type also has UNSIGNED and ZEROFILL attributes. If we use the UNSIGNED attribute, the column with 
#  DECIMAL UNSIGNED will not accept negative values.
#TIMESTAMP - format: YYYY-MM-DD HH:MI:SS.

select * from salaryArchives;