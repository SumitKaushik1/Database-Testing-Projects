use classicmodels;

#############################################################
#procedure 1

drop procedure SelectAllCustomers;
Delimiter //
create procedure SelectAllCustomers()
begin
 select * from customers;
end//


call SelectAllCustomers();


#########################################################

#procedure 2

drop procedure if exists SelectAllCustomersByCity;
Delimiter //
create procedure SelectAllCustomersByCity(In myCity varchar(50))
begin 
select * from customers where city=myCity;
end//

call SelectAllCustomersByCity("Nantes");

Test Query
##############################################################
#procedure 3

drop procedure if exists selectAllCustomersByCityAndPin;
Delimiter //
create procedure  selectAllCustomersByCityAndPin(IN myCity varchar(50),IN pCode varchar(15))
begin
 select * from customers where city=myCity and postalCode=pCode;
end//
call selectAllCustomersByCityAndPin("Singapore","079903");

########################################################
#procedure 4

DROP PROCEDURE IF EXISTS get_order_by_cust;
Delimiter //
CREATE PROCEDURE get_order_by_cust(
    IN cust_no INT,
    OUT shipped INT, 
    OUT canceled INT, 
    OUT resolved INT,
    OUT disputed INT
)
BEGIN
  -- shipped 
  SELECT COUNT(*) INTO shipped FROM orders WHERE customerNumber = cust_no AND status = 'shipped';
  
  -- canceled
  SELECT COUNT(*) INTO canceled FROM orders WHERE customerNumber = cust_no AND status = 'canceled';
  
  -- resolved 
  SELECT COUNT(*) INTO resolved FROM orders WHERE customerNumber = cust_no AND status = 'Resolved';
  
  -- disputed 
  SELECT COUNT(*) INTO disputed FROM orders WHERE customerNumber = cust_no AND status = 'disputed';
END //



#@ -> means session variable 
call get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);

select @shipped,@canceled,@resolved,@disputed;

###########################################################################
# procedure 5

drop procedure if exists GetCustomerShipping;
delimiter //
create procedure GetCustomerShipping(
In pCustomeNumber int,
Out pShipping varchar(50)
)
begin
Declare customerCountry varchar(100) ;
 select country into customerCountry from customers where customerNumber=pCustomeNumber;
 case 
 when customerCountry = "USA" then  set   pShipping="2-day shipping";
 when customerCountry ="Canada" then set pShipping="3-day shipping";
 else set pShipping ="5-day shipping";
 
 end case;
end //

call GetCustomerShipping(112,@shipping);
select @shipping;

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


#################################################################
 # table making this table was not there earlier
drop table if exists  supplierProducts;
create table supplierProducts(supplierid int,productId int,
primary key(supplierid,productId)
);
insert into supplierProducts(supplierid,productId)values (1,1);
insert into supplierProducts(supplierid,productId)values (1,2);
insert into supplierProducts(supplierid,productId)values (1,3);


# 6. procedure

drop procedure if exists InsertSupplierProduct;
delimiter //
create procedure InsertSupplierProduct(IN inSupplierId int,in inProductId int)
begin
# note sqlstate is for ansi specific and the error code is mysql specific
# sqlexception is for all type exception, all sql state code are strings; 
declare exit handler for 1062 select "duplicate keys error encountered" as  message;
declare exit handler for  sqlexception select "sqlexception encountered" as message;
declare exit handler for sqlstate '23000' select 'sqlstate 23000' as errorcode;
insert into supplierProducts(supplierid,productId) values(inSupplierId,inProductId);
select count(*) from supplierProducts where supplierId=inSupplierId;
end//

call InsertSupplierProduct(1,1);
call InsertSupplierProduct(1,2);
call InsertSupplierProduct(1,3);

select * from supplierProducts;

