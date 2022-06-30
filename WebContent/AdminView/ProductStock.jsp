<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page import="com.dao.ProductDao" %> 
<%@ page import="com.entities.AddProduct" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product</title>
<style type="text/css">
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#customers td, #customers th {
  border: 1px solid #ddd;

}
#customers tr:nth-child(even){background-color: #f2f2f2;}
#customers tr:hover {background-color: #ddd;}
#customers th {
  padding-top: 2px;
  padding-bottom: 2px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
  .inp{
width: 300px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
</style>
<%@ include file="includes/head.jsp" %>

</head>
<body>
 <%@ include file="includes/header.jsp" %>
  <div style="padding:20px;Width:100%">
  <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
<table style="width:100%;">
<tr>
<th align="left"><Span style="font-size:35px;">View Product Stock</Span></th>
<th align="right"><form action="" method="post">product id : <input type="text" name="search" placeholder="Search here.." class="inp"></form></th>
</tr>
</table>
<br>
 <table id="customers">
<thead>
<tr>
<th>Product ID</th>
<th>Product Stock</th>
<th>Product MRP</th>
<th>Purchase Price</th>
<th>Sales Price</th>
<th>Product GST</th>
<th>GST Price</th>
<th>Discount Price</th>
<th>Product Discount</th>
<th>Product Price</th>
</tr>
</thead>
<tbody>
<%
String category=request.getParameter("search");
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
List<AddProduct> list=dao.getStockProduct(category);
for(AddProduct ap:list)
{
%>
<tr>
<td><%= ap.getProduct_id() %></td>
<td><%= ap.getProduct_stock() %></td>
<td>&#8377 <%= ap.getProduct_mrp() %></td>
<td>&#8377 <%= ap.getPurchase_price() %></td>
<td>&#8377 <%= ap.getSales_price() %></td>
<td><%= ap.getProduct_gst() %>%</td>
<td>&#8377 <%= ap.getGst_price() %></td>
<td>&#8377 <%= ap.getDiscount_price() %></td>
<td><%= ap.getProduct_discount() %>%</td>
<td>&#8377 <%= ap.getProduct_price() %></td>
</tr>
<%} %>

</tbody>
</table>
</div>
</body>

</html>