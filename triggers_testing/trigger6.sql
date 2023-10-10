
drop trigger if exists after_salaries_delete;
delimiter //
create trigger after_salaries_delete after delete on salaries for each row
begin 
update SalaryBudgets set total =total- old.salary;
end //
show triggers;