#1
#test case 1 check stored procedure exist or not 
show function status where db='classicmodels';


-- ----------------------------------------------
#2  test case 2 ie customerLevel function return
# cusomter level or not
#select * from customers; 
# for all customerscustomerlevel
#steps
select customerName,customerLevel(creditLimit) from customers;

#reverify 
select customerName,
case
 when  (creditLimit >= 50000) then 'PLATINUM'
 when  (creditLimit < 50000 and  creditLimit >=10000) then 'GOLD'
 when  (creditLimit <10000) then 'SILVER'
end AS CustomerLevel
 from customers;
 
 -- ---------------------------------------------------------
 #test case 3 
 # it is for particular person customer level
 call GetCustomerLevel(131,@session1);
 select @session1;
 
 
 #reverify
 select
 case
 when  (creditLimit >= 50000) then 'PLATINUM'
 when  (creditLimit < 50000 and  creditLimit >=10000) then 'GOLD'
 when  (creditLimit <10000) then 'SILVER'
 end AS CustomerLevel
 from customers where customerNumber=131;
 
 describe customers;
