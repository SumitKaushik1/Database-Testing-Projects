use classicmodels;

show tables;
-- ----------------------------------------------
#Check Data integrity on Courses
# Validate COURSEID
select * from  courses;

#Test Query1
insert into courses values(111,"Java",3,500);

#Test Query2
insert into courses values(111,"python",2,300);

#Test Query3
insert into courses values(null,"python",2,300);


--  -----------------------------------------------

# Validate COURSENAME
#test Query1 
insert into courses values(222,"python",2,300);

#Test Query2
insert into courses values(333,"python",2,300);
--  -----------------------------------------------

# Validate Fee

#Test Query1
insert into courses values(333,"Javascript",1,500);

#Test Query2
insert into courses values(444,"typescript",1,500);

#Test Query3
insert into courses values(555,"vbscript",1,50);

#Test Query4
insert into courses values(555,"vbscript",1,600);
-- --------------------------------------------------
#Check Data Integrity on Students Table

#Validate SID & SNAME 
#Test Query1
insert into students(sid,sname,age,doc,courseid)values(101,"john",20,null,111);

#Test Query2
insert into students(sid,sname,age,doc,coureeId)values(101,"x",20,null,111);

#Test Query3
insert into students(sid,sname,age,doc,courseid)values(102,null,20,null,111);
-- --------------------------------------------------
# validate age
# Test Query 1
insert into students(sid,sname,age,doc,courseid)values(102,"Smith",15,null,111);

# Test Query 2
insert into students(sid,sname,age,doc,courseid)values(103,"Kim",30,null,111);

#Test Query 3
insert into students(sid,sname,age,doc,courseid)values(104,"Mary",10,null,111);

#Test Query 4
insert into students(sid,sname,age,doc,courseid)values(104,"Mary",35,null,111);

-- -------------------------------------------------------------------------
#validate DOJ
select doj from students;

-- -------------------------------------------------------------------------
#Validate COURSEID Foreign key(References to  COURSEID of COURSES Table)

#Test Query 1
insert into students (sid,sname,age,doc,courseid)values(104,"Scott",30,null,222);

#Test Query 2
insert into students (sid,sname,age,doc,courseid)values(105,"David",20,null,555);
-- ----------------------------------------------------------------------------
#Delete record from parent table(Courses) and check child table(students)record 
#automatically deleted
#Test Query 1
delete from courses where courseid=222;

#Test Query 2
select * from students ;