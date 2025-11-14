# Database-Testing-Projects

## Browser-Link-Test-Reports
   ### Data Integrity Testing - Manual
   https://docs.google.com/spreadsheets/d/1YXfifR0TVao2VTCfeJUVR1QlBZkkUxIG/edit?usp=sharing&ouid=106800653154918970030&rtpof=true&sd=true
   
   ### Stored Procedure Testing - Manual
  https://docs.google.com/spreadsheets/d/1BU7DGCq7osf_5TjTvrvhYrqMb6krAat0/edit?usp=sharing&ouid=106800653154918970030&rtpof=true&sd=true
  
  ### Structural Testing - Manual
https://docs.google.com/spreadsheets/d/1CDrrYAeaizG2dBEbngqF0syuvO8lurvt/edit?usp=sharing&ouid=106800653154918970030&rtpof=true&sd=true
  
 ## Structural Testing - Manual

 ### Test Cases
      
 Check table presence in database schema<br>
 Check table name convention<br>
 Check number of columns in a table<br>
 Check column names in a table<br>
 Check data type of columns in table<br>
 Check size of the columns in a table<br>
 Check nulls fields in a table<br>
 Check column keys in a table<br>



 ## Stored Procedure Testing - Manual

 ### Test Cases
      
 Check Stored procedure exist in database<br>
 Check stored procedure with valid input data<br>
 Check stored procedure handle exceptions with you pass invalid input data<br>
 Check stored procedure display results as expected<br>
 Check stored procedure inserting data in proper table<br>
 Check stored procedure updating data in proper table<br>
 Check stored procedure deleting data from proper table<br>
 Check  calling stored procedure from another stored procedure<br>

## Stored Procedure Testing - Automation

 ### Framework
 - TestNg<br>
 - Junit<br>
 ### Driver
 - MySQL Connector
### Report
 - Allure<br>
 - Reportng<br>

 ### Test Cases
      
 Check Stored procedure exist in database<br>
 Check stored procedure with valid input data<br>
 Check stored procedure handle exceptions with you pass invalid input data<br>
 Check stored procedure display results as expected<br>
 Check stored procedure inserting data in proper table<br>
 Check stored procedure updating data in proper table<br>
 Check stored procedure deleting data from proper table<br>
 Check  calling stored procedure from another stored procedure<br>

 ## Stored Function Testing - Manual

 ### Test Cases
      
 Check stored function exist in database<br>
 Check stored function with valid input data<br>
 Check stored function handle exceptions with you pass invalid input data<br>
 Check stored function display results as expected<br>
 Check stored function not used insert/update/delete operation<br>
 Check stored function used only select statements<br>
 Check calling stored function from stored procedure<br>


 ## Stored Function Testing - Automation

 ### Framework
 - TestNg<br>
 - Junit<br>
 ### Driver
 - MySQL Connector
### Report
 - Allure<br>
 - Reportng<br>

 ### Test Cases
      
 Check stored function exist in database<br>
 Check stored function with valid input data<br>
 Check stored function handle exceptions with you pass invalid input data<br>
 Check stored function display results as expected<br>
 Check stored function not used insert/update/delete operation<br>
 Check stored function used only select statements<br>
 Check calling stored function from stored procedure<br>


  ## Trigger Testing - Manual

 ### Test Cases
      
 Check  trigger event before insertion  of data in table <br>
 Check  trigger event after insertion of data in table<br>
 Check  trigger event before updaation  of data in table<br>
 Check  trigger event after updation of data in table<br>
 Check  trigger event before deletion of data in table<br>
 Check  trigger event after deletion of data in table<br>

 
 ## Data Mapping  Testing - Manual

```````````sh
https://www.opencart.com/
```````````
 ### Test Cases
 Check new account registration
  - Frontend Validation
  - Admin Validation
  - Data base Validation
    
  Check details of the new account(retrieve)
  - Frontend Validation
  - Admin Validation
  - Data base Validation

 Check account details updating in the database(update)
  - Frontend Validation
  - Admin Validation
  - Data base Validation

 Check account details deleted from the  database after deletion of account from application(delete)
  - Frontend Validation
  - Admin Validation
  - Data base Validation 

 
 ## Data Integrity  Testing - Manual

  ### Table
  - Courses
  ### Test Cases
  - Validate CourseId<br>
  - Validate coursename<br>
  - Validate fee<br>
  
   ### Table
  - Student
  ### Test Cases
  - Validate SID &SNAME <br>
  - Validate AGE<br>
  - Validate Date of Birth<br>
  - Validate courseid foreignkey(references to courseid of courses table)<br>
  - Delete record from parent table(courses) and check child table(students) record automatically deleted<br>
  <br>
