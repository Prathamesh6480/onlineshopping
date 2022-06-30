<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="Style/userpanel.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<%@ include file="includes/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>My Order</title>
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
table
{
  border-spacing: 0;
  width: 100%;
}
table, td, th
{
border:1px solid orange;
border-collapse:collapse;
}
th,td
{
padding:5px;
text-align:center;
}

@media only screen and (max-width:600px) {
  .dots
{
 clear: left;
white-space:nowrap;
width:240px;
font-size:10px;
overflow:hidden;
text-overflow: ellipsis;
}
.dots :hover
{
overflow:visible;
}
table
{
  border-spacing: 0;
  width: 100%;
}
table, td, th
{
border:1px solid orange;
border-collapse:collapse;
}
th,td
{
padding:5px;
text-align:center;
font-size:10px;
}

}
</style>
</head>
<body>   <%@ include file="includes/header.jsp" %>

 <c:if test="${empty currentUser.fname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

 <div class="sidebar">
<a href="#"><label style="color:red;">${currentUser.fname}</label></a>
  <a href="myaccount.jsp"><i class="fa fa-user" aria-hidden="true"></i> My Profile</a>
   <a href="address.jsp"><i class="fas fa-address-card"></i> Address </a>
  <a href="myorder.jsp"><i class="fas fa-shopping-basket"></i> My Order</a>
  <a href="changepsw.jsp"><i class="fas fa-key"></i> Change Password</a>
  <a><i class="fas fa-sign-out-alt"></i> Logout</a> 
</div>
<div class="content">
   
    <br>
      <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
        <h1 style="color:navy;">My Orders </h1>
      <br />
      <div style="overflow-x:auto;">
      <table >
      <thead>
      <tr>
      <th>Order id</th>
      <th>Product id</th>
      <th>Product name</th>
      <th>Qty</th>
      <th>Price</th>
      <th>Total</th>
      <th>Payment mode</th>
      <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <%
      UserRegister user =(UserRegister) session.getAttribute("currentUser");
OrderDao dao=new OrderDao(ConnectionProvider.getConnection());
List<Order> list=dao.getAllOrderedUser(user.getId());
for(Order order:list)
{
%>
        <tr>
     <td><%= order.getOrderid() %></td>
<td><%= order.getProductid() %></td>
<td><p class="dots"><%= order.getProductname() %></p></td>
<td><%= order.getQuantity() %></td>
<td><%= order.getProductprice() %></td>
<td><%= order.getTotalprice() %></td>
<td><%= order.getPaymentmode() %></td>
<td>


<% if("Ordered".equals(order.getStatus()))
{%>
<a href="DeleteOrder?oid=<%= order.getOrderid() %>&&pid=<%=order.getProductid() %>&&pqty=<%=order.getQuantity() %>" style="color:red;">Cancel Order</a>
<%
}else{%>
<%= order.getStatus() %>
<%}
%>
</td>
<td>


<% if("Delivery".equals(order.getStatus()))
{%>
<a href="print.jsp?id=<%=order.getOrderid()%>&&uid=<%=user.getId() %>" style="color:green;">Invoice</a>
<%
}else{%>
not available
<%}
%>
</td>
      </tr>
      <%} %>
      </tbody>
    
      
      </table>
      </div>
    </div>
  
   <script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
<%@include file="includes/footer.jsp" %>

</body>
</html>