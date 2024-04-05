drop table  if exists SalaryBudgets;
create table SalaryBudgets(total decimal(15,2) not null);


insert into salaries (employeeNumber,validFrom,salary) values
(1002,'2000-01-01',50000),
(1056,'2000-01-01',60000),
(1076,'2000-01-01',70000);

# value doesnot come when come in the select statement 
insert into SalaryBudgets(total)  
Select sum(salary) from Salaries;

select * from salaryBudgets;



