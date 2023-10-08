drop table  if exists sales;

create table sales(
id int auto_increment,
product varchar(100) not null,
quantity int not null default 0,
fiscalYear smallint not null,
fiscalMonth tinyint not null,
check(fiscalYear between 2000 and 2050),
check(quantity>=0),
unique(product,fiscalYear,fiscalMonth),
primary key(id)
);

insert into sales(product,quantity,fiscalYear,fiscalMonth) values 
('2003 Harley Davidson Eagle Drag',120,2020,1),
('1969 Corvair Monza',150,2020,1),
('1970 Plymouth Hemi Coda',200,2020,1);

select * from sales;