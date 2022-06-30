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
  <%@ include file="includes/head.jsp" %>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
          .inp{
width: 250px;
  padding: 8px;
  border: 1px solid orange;
  border-radius: 4px;
  resize: vertical;
}
            
         .bt {
  width: 250px;
  background-color:tomato;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
}
</style>
</head>
<body>
  <%@ include file="includes/header.jsp" %>
   
    <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

<%
int id=Integer.parseInt(request.getParameter("id"));
OrderDao dao=new OrderDao(ConnectionProvider.getConnection());
Order order=dao.getOrderEditById(id);
%>
<form action="../UpdateOrderRecord" method="get">
<table>

<tr>
<th>Order Id</th>
<th>User Id</th>
<th>Product Id</th>
<th>Product Name</th>
<th>Quantity</th>

</tr>

<tr>
<td><input type="text" name="id" class="inp" value="<%= order.getOrderid() %>"></td>
<td><input type="text" class="inp" value="<%= order.getUserid() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getProductid() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getProductname() %>" disabled></td>
<td><input type="text" class="inp" value="<%=order.getQuantity() %>" disabled></td>
</tr>

<tr>
<th>Price</th>
<th>name</th>
<th>email</th>
<th>address</th>
<th>city</th>
</tr>

<tr>
<td><input type="text" class="inp" value="<%= order.getProductprice() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getFirstname() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getEmail() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getAddress() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getCity() %>" disabled></td>
</tr>
<tr>
<th>zip</th>
<th>payment mode</th>
<th>status</th>
</tr>
<tr>
<td><input type="text" class="inp" value="<%= order.getZip() %>" disabled></td>
<td><input type="text" class="inp" value="<%= order.getPaymentmode() %>" disabled></td>
<td>
<select name="status" class="inp">
<% if("Ordered".equals(order.getStatus()))
{%>
<option value="Orderd">Ordered</option>
<option value="Packed">Packed</option>
<option value="Shipped">Shipped</option>
<option value="Delivery">Delivery</option>

<%
}else if("Packed".equals(order.getStatus())){%>

<option value="Packed">Packed</option>
<option value="Shipped">Shipped</option>
<option value="Delivery">Delivery</option>
<%
}else if("Shipped".equals(order.getStatus())){%>

<option value="Shipped">Shipped</option>
<option value="Delivery">Delivery</option>
<%}%>

</select>
</td>
</tr>
<tr>
<th colspan="6" align="left"><input type="submit" class="bt" value="Update"></th>
</tr>


</table>
</form>

</body>
</html>