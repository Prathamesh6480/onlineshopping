 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.dao.OrderDao" %> 
 <%@ page import="com.entities.Order" %>
 <%@ page import="com.helper.ConnectionProvider" %>
  <%@ page import="java.util.*" %>
  <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Packed Stage</title>

<%@ include file="includes/head.jsp" %>
</head>
<body>

 <%@ include file="includes/header.jsp" %>
 <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>
 
 
 <div style="padding:10px">
 <br>
 <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
<br>
<h1>Customer Order Packed</h1>
<br>
 <table id="customers">
 <thead>
<tr>
<th>Order ID</th>
<th>User Id</th>
<th>Product Id</th>
<th>Qty</th>
<th>Price</th>
<th>Email</th>
<th>Address</th>
<th>City</th>
<th>Zip</th>
<th>Payment mode</th>
<th>Status</th>
<th>Date</th>
<th>Edit</th>
</tr>
</thead>
<tbody>
<%
OrderDao dao=new OrderDao(ConnectionProvider.getConnection());
List<Order> list=dao.getAllPacked();
for(Order order:list)
{
%>
<tr>
<td><%= order.getOrderid() %></td>
<td><%= order.getUserid() %></td>
<td><%= order.getProductid() %></td>
<td><%= order.getQuantity() %></td>
<td><%= order.getProductprice() %></td>
<td><%= order.getEmail() %></td>
<td><%= order.getAddress() %></td>
<td><%= order.getCity() %></td>
<td><%= order.getZip() %></td>
<td><%= order.getPaymentmode() %></td>
<td><%= order.getStatus() %></td>
<td><%= order.getDatetime2() %></td>
<td><a href="UpdateCustomerOrder.jsp?id=<%=order.getOrderid()%>">Update</a></td>
</tr>

<%} %>



</tbody>
</table>
</div>
 
</body>
</html>