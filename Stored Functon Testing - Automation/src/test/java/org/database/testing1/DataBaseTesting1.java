package org.database.testing1;

import org.apache.commons.lang3.StringUtils;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.sql.*;

public class DataBaseTesting1 {
    Connection con=null;
    ResultSet rs=null;
    ResultSet rs1=null;

    CallableStatement ctmt;


    @BeforeClass
    void setUp() throws SQLException {
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/classicmodels","root","Sumit@123");
    }

    @AfterClass
    void tearDown()throws SQLException {
        con.close();
    }

    @Test(priority=1)
      void storedFunctionExists() throws SQLException{
        rs=con.createStatement().executeQuery("show function status where db='classicmodels'");
        rs.next();
        Assert.assertEquals(rs.getString(1),"classicmodels");
      }

      //each and every value we cannot check so we use teh automation
      @Test(priority=2)
    void testCustomerLevelWithSQLStatement() throws SQLException {
        rs=con.createStatement().executeQuery("select customerName,customerLevel(creditLimit) from customers");
        rs1=con.createStatement().executeQuery("select customerName,\n" +
                "case\n" +
                " when  (creditLimit >= 50000) then 'PLATINUM'\n" +
                " when  (creditLimit < 50000 and  creditLimit >=10000) then 'GOLD'\n" +
                " when  (creditLimit <10000) then 'SILVER'\n" +
                "end AS CustomerLevel\n" +
                " from customers;");

        Assert.assertEquals(compareResultSets(rs,rs1),true);


      }


      @Test(priority=3)
    void testCustomerLevelWithStoredProcedure()throws SQLException{
       ctmt =con.prepareCall("{call GetCustomerLevel(?,?)}");
       ctmt.setInt(1,131);
       ctmt.registerOutParameter(2,Types.VARCHAR);
       ctmt.executeQuery();

       String customerLevel=ctmt.getString(2);

          System.out.println(customerLevel);
      rs1= con.createStatement().executeQuery(" select\n" +
               " case\n" +
               " when  (creditLimit >= 50000) then 'PLATINUM'\n" +
               " when  (creditLimit < 50000 and  creditLimit >=10000) then 'GOLD'\n" +
               " when  (creditLimit <10000) then 'SILVER'\n" +
               " end AS CustomerLevel\n" +
               " from customers where customerNumber=131;");
;
                  rs1.next();

                  //getString take integer(column number moving in the row) and columnname(if avaiable)
          System.out.println(rs1.getString(1));
            Assert.assertEquals(customerLevel,rs1.getString(1));

      }




      public boolean compareResultSets(ResultSet rs,ResultSet rs1) throws SQLException{

          int count=rs.getMetaData().getColumnCount();
          while(rs.next()){
              rs1.next();
               for(int i=1;i<=count;i++){

                   if(!StringUtils.equals(rs.getString(i),rs1.getString(i)))
                       return false;
               }

          }

          return true;


      }


}
