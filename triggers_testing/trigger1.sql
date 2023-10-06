use classicmodels;
drop trigger if exists before_workcenters_insert;

#new key word is used in  the insert command b/z  in insert only new value is put 
# only new keyword will hold that value 
delimiter //
create trigger before_workcenters_insert before insert on workCenters for each row
begin 
declare rowCount int;
select count(*) into rowCount from workCenters;
if rowCount > 0 then update  workCenterStats set totalCapacity=totalCapacity+(new.capacity);
else 
insert into workCenterStats(totalCapacity) values(new.capacity);

end if;
end //
show triggers;


insert into workCenters(`name`,capacity) values('Mold Machine',100);
select * from workCenters;

select * from workCenters;
insert into workCenters(`name`,capacity) values('Packing',100);






