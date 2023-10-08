#in update two keyword used new keyword holds the new value old keyword hold the old value 
#sqlstate for the ansi provided 
drop trigger  if exists before_sales_update;
Delimiter //
create trigger before_sales_update before update on sales for each row
begin 
declare errorMessage varchar(200);

set errorMessage =concat('The new quantity ',new.quantity,'cannot be 3 times greater than the current quantity ',old.quantity);

if new.quantity > old.quantity *3 then signal sqlstate '45000' set message_text=errorMessage;
end if;
end//

show triggers;