drop trigger  if exists after_sales_update; 
delimiter //
create trigger after_sales_update after update on sales for each row 
begin 
if old.quantity<> new.quantity then insert into SalesChanges(salesId,beforeQuantity,afterQuantity) values(old.Id,old.quantity,new.quantity);
end if;
end//

show triggers;

select * from sales;

update sales set quantity=350 where id =1;

select * from saleschanges;

update Sales set quantity=cast( quantity *1.1 as unsigned);
#The CAST() function in MySQL is used to convert a 
#value from one data type to another data type 
#specified in the expression. It is mostly used with
# WHERE, HAVING, and JOIN clauses. This function is
# similar to the CONVERT() function in MySQL.
#
#SELECT CAST("2018-11-30" AS DATE);  

#The “unsigned” in MySQL is a data type. 
#Whenever we write an unsigned to any column 
#that means you cannot insert negative numbers.
# Suppose, for a very large number you can use
# unsigned type. The maximum range with unsigned 
#int is 4294967295.