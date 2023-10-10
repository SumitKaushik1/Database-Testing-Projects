
drop trigger before_salaries_delete
delimiter //
create trigger before_salaries_delete before delete on salaries  for each row
begin 

insert into SalaryArchives(employeeNumber,validFrom,salary)
values(old.employeeNumber,old.validFrom,old.salary);

end //

show triggers

