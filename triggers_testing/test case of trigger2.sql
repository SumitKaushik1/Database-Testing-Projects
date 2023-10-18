#Test case 1
insert into members(`name`,email,birthdate) values('John','john@example.com',null);
insert into members(`name`,email,birthdate) values('kim','kin@example.com','2013-05-03');
insert into members(`name`,email,birthdate) values('scott','scott@example.com',null);

#Test Query 1
select * from members;
select * from reminders;