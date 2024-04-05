drop trigger if exists after_members_insert;

delimiter //
create trigger after_members_insert after insert on members for each row
begin 
if new.birthDate is null then insert into reminders(memberId,message) values(new.id,concat("hi",new.`name`,"please update your date of birth"));
end if;
end //

insert into members(`name`,email,birthdate) values('John','john@example.com',null);
insert into members(`name`,email,birthdate) values('kim','kin@example.com','2013-05-03');
insert into members(`name`,email,birthdate) values('scott','scott@example.com',null);

select * from members;
select * from reminders;


