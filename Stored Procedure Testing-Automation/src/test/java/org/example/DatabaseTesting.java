package org.example;

import org.apache.commons.lang3.StringUtils;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.sql.*;
import java.util.List;

public class DatabaseTesting {

    //mostly you can automate the statments which is select in nature
    Connection con=null;
    Statement stmt=null;

    ResultSet rs=null;
    ResultSet rs1=null;

    CallableStatement call=null;

   

//note use createStatment() only b/z you need fix query donot use preapreStatement();


    //annotation to provide additional informtaiton or metadata compiler
    //heiarchy suit and then class annotated  method
    @BeforeClass
    //throws keyword it caller has to handle exception if comes here
    void setUp() throws SQLException{
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/classicmodels","root","Sumit@123");
    }

    @AfterClass
    void tearDown() throws SQLException{
        con.close();
    }

    @Test(priority = 1)
    void testStoredProcedureExists() throws SQLException {

        stmt =con.createStatement();
        //createStatement  is used where the statement is fixed ;
        rs=stmt.executeQuery("show procedure status where db='classicmodels'");
        List<String> l=List.of("GetCustomerLevel","GetCustomerShipping","get_order_by_cust","InsertSupplierProduct","SelectAllCustomers","SelectAllCustomersByCity","selectAllCustomersByCityAndPin");

        int count=0;
        while(rs.next()){

            //Assert.assertEquals(rs.getString("Name"),l.get(count));
         //   System.out.println(rs.getString("Name"));
            if(!l.contains(rs.getString("Name")))
                Assert.fail();
                //count++;
        }
        //cursor move



    }


    @Test(priority = 2)
    void selectAllCustomer() throws SQLException{
        stmt=con.createStatement();
         rs=stmt.executeQuery("select * from customers");

         call= con.prepareCall("{call SelectAllCustomers()}");
         rs1=call.executeQuery();

        Assert.assertEquals(compareCustomerDetails(rs,rs1),true);


    }


    @Test(priority=3)
    void selectAllCustomersByCity()  throws SQLException{
        stmt=con.createStatement();
        rs=stmt.executeQuery("select * from customers where city='Nantes'");
        /* call= con.prepareCall("{call SelectAllCustomersByCity('Nantes')}");
         rs1=call.executeQuery();*/ //you can do by this but it is not the good practice  always set the string when
        //when parameter is passed
        call= con.prepareCall("{call SelectAllCustomersByCity(?)}");
        call.setString(1,"Nantes");
        rs1=call.executeQuery();

     Assert.assertEquals(compareCustomerDetails(rs,rs1),true);
    }


    @Test(priority=4)
    void selectAllCustomersByCityAndPin()  throws SQLException{
        stmt=con.createStatement();
        rs=stmt.executeQuery("select * from customers where city ='Singapore' and postalcode='079903'");
        /* call= con.prepareCall("{call SelectAllCustomersByCity('Nantes')}");
         rs1=call.executeQuery();*/ //you can do by this but it is not the good practice  always set the string when
        //when parameter is passed
        call= con.prepareCall("{call selectAllCustomersByCityAndPin(?,?)}");
        call.setString(1,"Singapore");
        call.setString(2,"079903");
        rs1=call.executeQuery();

        Assert.assertEquals(compareCustomerDetails(rs,rs1),true);
    }


    boolean compareCustomerDetails(ResultSet rs,ResultSet rs1) throws SQLException{
        int count=rs1.getMetaData().getColumnCount();
        while(rs1.next()){
            rs.next();

            for(int i=1;i<=count;i++){
                // System.out.println("rs1"+rs1.getString(i)+"rs"+rs.getString(i));
                //it will compare each record by  field  to each record by field
                if(!StringUtils.equals(rs1.getString(i),rs.getString(i))){
                    return false;
                }
            }

        }
        return true;
    }




    @Test(priority = 5)
    void test_get_order_by_cust() throws SQLException
    {
       call= con.prepareCall("{call get_order_by_cust(?,?,?,?,?)}");
       call.setInt(1,141);
       call.registerOutParameter(2,Types.INTEGER);
       call.registerOutParameter(3,Types.INTEGER);
       call.registerOutParameter(4,Types.INTEGER);
       call.registerOutParameter(5,Types.INTEGER);


       rs1=call.executeQuery();


       int shipped=call.getInt(2);
       int canceled=call.getInt(3);
       int resolved=call.getInt(4);
       int disputed=call.getInt(5);

       System.out.println(shipped+" "+canceled+" "+resolved+" "+disputed);

       stmt=con.createStatement();
       rs1=stmt.executeQuery(" Select" +
               "(SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'shipped') as shipped " +
               ",(SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'canceled') as canceled " +
               ",(SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'Resolved') as resolved" +
               ",(SELECT COUNT(*)  FROM orders WHERE customerNumber = 141 AND status = 'disputed') as disputed; ");

       rs1.next();
       //there is the getInt(String(column name)/Int(column number));
     int expShipped= rs1.getInt("shipped");
     int expCancelled=rs1.getInt("canceled");
     int expResolved=rs1.getInt("resolved");
     int expDisputed=rs1.getInt("disputed");

     if(shipped == expShipped && canceled == expCancelled && expResolved == resolved && expDisputed == disputed  )
         //TestNg
         Assert.assertTrue(true);//Assert.assertTrue(condition)
     //there are two method which ara famous first is Assert.assertEquals(,)
        else
              Assert.assertTrue(false);

    }


    @Test(priority=6)
    void testGetCustomerShipping() throws SQLException{

        call=con.prepareCall("{call GetCustomerShipping(?,?)}");
        call.setInt(1,112);
        call.registerOutParameter(2,Types.VARCHAR);
          rs1=call.executeQuery();



          //ie at the 2nd postion outpout will come
         String shippingTime= call.getString(2);
          stmt=con.createStatement();

          rs=stmt.executeQuery("select customerNumber,case when country = 'USA' then  '2-day shipping' " +
                  " when Country = 'Canada' then" +
                  " '3-day shipping' else  '5 day shipping' " +
                  " end as country from customers where customerNumber=112 " +
                  "or customerNumber=260 or customerNumber=353");

            rs.next();


           String expShippingTime= rs.getString("country");

           Assert.assertEquals(expShippingTime,shippingTime);

    }

}
