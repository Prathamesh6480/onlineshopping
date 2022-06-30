 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.dao.OrderDao" %> 
 <%@ page import="com.entities.Order" %>
 <%@ page import="com.helper.ConnectionProvider" %>
  <%@ page import="java.util.*" %>
  <%@ page import="java.sql.*" %>
   <%@ page import="java.util.Date" %>
  <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Order Details</title>

<%@ include file="includes/head.jsp" %>
<style>
    .inp{
width: 170px;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
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
   .bt1{
  width: 120px;
  background-color:tomato;
  color: white;
  padding: 10px 15px;
  margin: 8px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
  text-align: center;

} 
.bt1:hover {
  background-color: #555;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function(){
	$("#datepicker") .datepicker({changeMonth:true, changeYear:true});
	$("#datepicker").datepicker("option", "dateFormat", "yyyy-MM");
	});
</script>

</head>
<body>   
<%@ include file="includes/header.jsp" %>
 <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>
 <%String form_date = request.getParameter("month");
 OrderDao dao=new OrderDao(ConnectionProvider.getConnection()); %>
<table style="width:100%;">
<tr>
<th align="left"><Span style="font-size:35px;">Search Monthly Records</Span>
<%
if(form_date!=null)
{
%>
<button class="bt1" ><i class="fa fa-download" aria-hidden="true"></i> <a href="monthordercsv.jsp?month=<%= form_date %>" style="color:black;">Export Data</a></button>

<%
}
%>
</th>
<th align="right"><form action="" method="get">
Month:<input type="month" name="month" id="datepicker"  class="inp">
<input type="submit" class="bt1" value="search">
</form></th>
</tr>
</table>
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

List<Order> list=dao.getAllOrderMonthwise(form_date);
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