<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.entities.Adminlogin" %>
<%@ page import="com.dao.UserRegisterDao" %> 
<%@ page import="com.entities.UserRegister" %>
<%@ page import="com.dao.ProductDao" %> 
<%@ page import="com.entities.AddProduct" %>
<%@ page import="com.dao.OrderDao" %> 
<%@ page import="com.entities.Order" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashbord</title>
  <%@ include file="includes/head.jsp" %>
  <link rel="stylesheet" type="text/css" href="../Style/productpg.css" />
</head>
<body>
  <%@ include file="includes/header.jsp" %>

 <div style="width:100%;overflow:auto">

<div class="listing-section">
<h1 class="price">Admin Dashboard</h1>

  <div class="product" style="background-color:maroon">
   
    <div class="text-box">
      <h2 class="description" style="color:white">Customer </h2>
       <%
            UserRegisterDao dao=new UserRegisterDao(ConnectionProvider.getConnection());
    List<UserRegister> list=dao.getAllUser();
    %>
      <h3 class="description" style="font-size:60px;color:white;"><i class="fas fa-users"></i><%= list.size() %> </h3>

     <p class="description"><button class="bt1" ><i class="fa fa-download" aria-hidden="true"></i> <a href="usercsv.jsp" style="color:black;">Export Data</a></button></p>
    </div>
  </div>
  
    <div class="product" style="background-color:#800080">
    <div class="text-box">
      <h2 class="description" style="color:white">Product Stock</h2>
       <%
    try
       {
    	int Count;
       Connection con = ConnectionProvider.getConnection();
       Statement stmt;
       stmt = con.createStatement();
       String query = "SELECT SUM(product_stock) FROM producttb1";
       
       ResultSet res = stmt.executeQuery(query);
       
       while(res.next())
       {
    	   Count = res.getInt(1);
    	   
    	   %>
    	         <h3 class="description" style="font-size:50px;color:white;"><%= Count %> </h3>
    	   <%
       }
       }
       catch (Exception e){
    	   e.printStackTrace();
    	   }
    %>


     <p class="description"><button class="bt1" ><i class="fa fa-download" aria-hidden="true"></i> <a href="productcsv.jsp" style="color:black;">Export Data</a></button></p>
    </div>
  </div>


 <div class="product" style="background-color:#00FF00">
    <div class="text-box">
      
       <%
    try
       {
    	int Count;
    	int total;
    	int year;
       Connection con = ConnectionProvider.getConnection();
       Statement stmt;
       stmt = con.createStatement();
       String query = "SELECT SUM(quantity),SUM(total_price),year(completedate) FROM orders WHERE status='Delivery' ";
       
       ResultSet res = stmt.executeQuery(query);
       
       while(res.next())
       {
    	   Count = res.getInt(1);
    	   total= res.getInt(2);
    	   year= res.getInt(3);
    	   
    	   %>
    	   <h2 class="description" style="color:#800000"><b>Sales Records (<%= year %>)</b> </h2>
    	   <p class="description" style="color:#800000;font-size:30px;"><i class="fas fa-hand-holding-usd"></i></p>
    	         <p class="description" style="color:#800000;">Sold Product Qty: <%= Count %> </p>
    	          <p class="description" style="color:#800000;">Sold Total: &#8377 <%= total %> </p>
    	          <p class="description"><button class="bt1" ><i class="fa fa-download" aria-hidden="true"></i> <a href="ordercsv.jsp?year=<%=year %>" style="color:black;">Export Data</a></button></p>
    	   <%
       }
       }
       catch (Exception e){
    	   e.printStackTrace();
    	   }
    %>


     
    </div>
  </div>


 <div class="product" style="background-color:#00008B">
    <div class="text-box">
      <h2 class="description" style="color:white"><b>Supplier </b> </h2>
       <%
    try
       {
    	int Count;
    	Double total;
       Connection con = ConnectionProvider.getConnection();
       Statement stmt;
       stmt = con.createStatement();
       String query = "SELECT COUNT(supplier_id) FROM supplier";
       
       ResultSet res = stmt.executeQuery(query);
       
       while(res.next())
       {
    	   Count = res.getInt(1);
    	   %>
    	  
    	         <p class="description" style="color:white;font-size:50px"><i class="fas fa-user-friends"></i> <%= Count %> </p>
    	   <%
       }
       }
       catch (Exception e){
    	   e.printStackTrace();
    	   }
    %>


     <p class="description"><button class="bt1" ><i class="fa fa-download" aria-hidden="true"></i> <a href="suppliercsv.jsp" style="color:black;">Export Data</a></button></p>
    </div>
  </div>

</div>
</div>
 
</body>
</html>