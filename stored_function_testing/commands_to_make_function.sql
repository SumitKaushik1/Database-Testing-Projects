use classicmodels;

drop function if exists  customerLevel;

delimiter //
create function customerLevel(credit decimal(10,2)) returns varchar(20)
deterministic
begin 
declare customerLevel varchar(20);
if (credit > 50000) then set customerLevel='PLATINUM';
elseif(credit >=10000 and credit<=50000) then set customerLevel='GOLD';
elseif(credit <10000) then set customerLevel='SILVER'; 
end if;

return customerLevel;
end //

show function status where db='classicmodels';

-- ---------------------------------------------------------------
# use of function in query
select customerName,customerLevel(creditLimit)  from customers;
-- -------------------------------------------------------------
#use of functions in procedure
drop procedure if exists GetCustomerLevel;
delimiter //
create procedure GetCustomerLevel(in customerNo int,out customerLevel varchar(20))
begin 
declare credit decimal(10,2) default 0;
select creditLimit into credit from customers where customerNumber=customerNo;
set customerLevel=customerLevel(credit);
end//

call GetCustomerLevel(131,@session1);
select @session1;