#Test case 1
delete from salaries where employeeNumber=1002;
#Test query 
select * from salaries;
select * from salaryArchives;

-- --------------------
#Test case 2
delete from salaries;

select * from salaries;
select * from salaryArchives;


#