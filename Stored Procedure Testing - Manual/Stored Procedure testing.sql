#TC->01 to TC-06
use classicmodels;
show procedure status where name="selectAllCustomers";
# or  check procedure exist or not 
show procedure status where db="classicmodels";

show procedure status where name="SelectAllCustomersByCity";
#or 
show procedure status where db="classicmodels";

# use show procedure status where db="classicmodels"; it will show all procedures 


#################################################################

#TC_007
#steps
call SelectAllCustomers();

#Test query
select * from customers;
##########################################################
#TC_008
#steps
call  SelectAllCustomersByCity("Nantes");

#test Query
select * from customers where city="Nantes";

#################################################################

#TC_09
call selectAllCustomersByCityAndPin("Singapore","079903");

#Test Query
select * from customers where city ="Singapore" and postalcode="079903";
############################################################
#TC_10
call get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
select @shipped,@canceled,@resolved,@disputed;  

SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'shipped';
SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'canceled';
SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'Resolved';
SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'disputed'; 
#########################################################
#TC_11
call GetCustomerShipping(112,@shipping);
select @shipping;
call GetCustomerShipping(260,@shipping);
select @shipping;
call GetCustomerShipping(353,@shipping);
select @shipping;


#Test Query
select customerNumber,
case
when country = "USA" then  "2-day shipping" 
when Country = "Canada" then "3-day shipping"
else  '5 day shipping' 
end as country
from customers where customerNumber=112 or customerNumber=260 or customerNumber=353;

select * from customers;
-- in procedure 

-- case 
-- when thne 
-- end case 


-- noramlly 

-- you have to use 

-- case 
-- when then 
-- end

-- only
###########################################################
#TC 12
call InsertSupplierProduct(1,1);
call InsertSupplierProduct(1,2);
call InsertSupplierProduct(1,3);	
#Test Query
select * from supplierProducts;

