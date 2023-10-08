select * from sales;
create table SalesChanges(
id int auto_increment primary key,
salesId int,
beforeQuantity int,
afterQuantity int,
changedAt timestamp not null default current_timestamp
);

#current date and time value ->current_timestamp
#timestamp->YYYY-MM-DD hh:mm:ss' or YYYYMMDDhhmmss format