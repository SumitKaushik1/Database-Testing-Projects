use information_schema;
#describe can be used only with table
describe information_schema.columns ;
select * from information_schema.columns;

###############################################
#TC_001 ->pass
use classicmodels;
show tables;
######################################
#TC_002 ->pass,no spaces or special characters
#bw the names of tables names
use classicmodels;
show tables;
######################################
#TC_003 to TC_010
# in "columns" table of "inforamtion_schema" ,"table_name" is the column name in this table ,suppose there is the customer
# record is repeating in this b/z there is "column_name" is also the column name which contains the columns names of that table
select count(*) as `number_of_columns` from information_schema.columns where table_name="customers";
select count(*) as `number_of_columns` from information_schema.columns where table_name="productlines";
select count(*) as `number_of_columns` from information_schema.columns where table_name="employees";
select count(*) as `number_of_columns` from information_schema.columns where table_name="offices";
select count(*) as `number_of_columns` from information_schema.columns where table_name="products";
select count(*)as `number_of_columns` from information_schema.columns where table_name="orderdetails";
select count(*) as `number_of_columns` from information_schema.columns where table_name="order";
select count(*) as `number_of_columns` from information_schema.columns where table_name="payments";
######################################
#TC_011 to TC_018
select column_name from information_schema.columns where table_name="customers";
select column_name from information_schema.columns where table_name="productlines";
select column_name from information_schema.columns where table_name="employees";
select column_name from information_schema.columns where table_name="offices";
select column_name from information_schema.columns where table_name="products";
select column_name from information_schema.columns where table_name="orderdetails";
select column_name from information_schema.columns where table_name="orders";
select column_name from information_schema.columns where table_name="payments";
###################################################################################
#TC 19 to 26
#data_type is the column in the "columns" table which contain the type of data each column of table 
select column_name,data_type from information_schema.columns where table_name="customers";
select column_name,data_type from information_schema.columns where table_name="productlines";
select column_name,data_type from information_schema.columns where table_name="employees";
select column_name,data_type from information_schema.columns where table_name="offices";
select column_name,data_type from information_schema.columns where table_name="products";
select column_name,data_type from information_schema.columns where table_name="orderdetails";
select column_name,data_type from information_schema.columns where table_name="orders";
select column_name,data_type from information_schema.columns where table_name="payments";

####################################################################
#TC_27 to TC_34
select column_name,column_type from information_schema.columns where table_name="customers";
select column_name,column_type from information_schema.columns where table_name="productlines";
select column_name,column_type from information_schema.columns where table_name="employees";
select column_name,column_type from information_schema.columns where table_name="offices";
select column_name,column_type from information_schema.columns where table_name="products";
select column_name,column_type from information_schema.columns where table_name="orderdetails";
select column_name,column_type from information_schema.columns where table_name="orders";
select column_name,column_type from information_schema.columns where table_name="payments";

###############################################################
#TC_34 to 42
select column_name,is_nullable from information_schema.columns where table_name="customer";
select column_name,is_nullable from information_schema.columns where table_name="productlines";
select column_name,is_nullable from information_schema.columns where table_name="employees";
select column_name,is_nullable from information_schema.columns where table_name="offices";
select column_name,is_nullable from information_schema.columns where table_name="products";
select column_name,is_nullable from information_schema.columns where table_name="orderdetails";
select column_name,is_nullable from information_schema.columns where table_name="orders";
select column_name,is_nullable from information_schema.columns where table_name="payment";
##############################################################################################
#TC_43 to 50, pri= primary key,mul-foreign key(multiple values allowed) ,uni-unique key 
select column_name,column_key from information_schema.columns where table_name ="customer";
select column_name,column_key from  information_schema.columns where table_name ="productlines";
select column_name,column_key from  information_schema.columns where table_name ="employees";
select column_name,column_key from  information_schema.columns where table_name ="offices";
select column_name,column_key from  information_schema.columns where table_name ="products";
select column_name,column_key from  information_schema.columns where table_name ="orderdetails";
select column_name,column_key from  information_schema.columns where table_name ="orders";
select column_name,column_key from  information_schema.columns where table_name ="payment";







