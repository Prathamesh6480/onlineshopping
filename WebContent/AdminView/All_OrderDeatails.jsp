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
<title>All Order Details</title>

<%@ include file="includes/head.jsp" %>
<style>
  .dots
{
 clear: left;
white-space:nowrap;
width:270px;
overflow:hidden;
text-overflow: ellipsis;
}
.dots :hover
{
overflow:visible;
}
</style>
</head>
<body>   
<%@ include file="includes/header.jsp" %>
 <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>
<br>
<h1>All Order Reports</h1>
<br>
 <table id="customers">
 <thead>
<tr>
<th>Order ID</th>
<th>User Id</th>
<th>Product Id</th>
<th>Product name</th>
<th>Qty</th>
<th>Price</th>
<th>Email</th>

<th>Payment mode</th>
<th>Status</th>
<th>Date</th>
<th>print</th>
</tr>
</thead>
<tbody>
<%
OrderDao dao=new OrderDao(ConnectionProvider.getConnection());
List<Order> list=dao.getAllOrder();
for(Order order:list)
{
%>
<tr>
<td><%= order.getOrderid() %></td>
<td><%= order.getUserid() %></td>
<td><%= order.getProductid() %></td>
<td><p class="dots"><%= order.getProductname()%></p></td>
<td><%= order.getQuantity() %></td>
<td><%= order.getProductprice() %></td>
<td><%= order.getEmail() %></td>

<td><%= order.getPaymentmode() %></td>
<td><%= order.getStatus() %></td>
<td><%= order.getDatetime2() %></td>
<td><a href="print.jsp?id=<%=order.getOrderid()%>">Print</a></td>
</tr>

<%} %>



</tbody>
</table>
</body>
</html>