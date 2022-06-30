<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.dao.CartDao" %> 
  <%@ page import="com.entities.Cart" %> 
    <%@ page import="com.entities.UserRegister" %> 
 <%@ page import="com.helper.ConnectionProvider" %>
 <%@ page import="java.util.*" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Cart</title>

<%@ include file="includes/head.jsp" %>
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<link rel="stylesheet" type="text/css" href="Style/cart.css" />
</head>
<body>

 <%@ include file="includes/header.jsp" %>
<div style="width:100%;overflow:auto;">
 <c:if test="${empty currentUser.fname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

<%
String msg=request.getParameter("msg");
if("notPossible" .equals(msg))
{
%>
<h3>There is only one Quantity ! so click on remove</h3>	
 <%}%>
 <% 
 if("notQty" .equals(msg))
 {
 %>
 <h3>Product not availabele</h3>	
  <%}%>
  
   <% 
 if("dec" .equals(msg))
 {
 %>
 <h3>Quantity decreased successfully</h3>	
  <%}%>
  
<br>

 <h1 align="center">Shopping Cart <i class="fas fa-shopping-cart"></i></h1>
<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
 
<%
UserRegister user=(UserRegister)session.getAttribute("currentUser");

CartDao dao=new CartDao(ConnectionProvider.getConnection());
List<Cart> list=dao.getProductByUser(user.getId());
Double total_price=0.00;
if(list.size()>0)
{%>
 <table id="customers">
  <thead>
<tr>
<th>ID</th>
<th>product Name</th>
<th>Image</th>
<th>Quantity</th>
<th>MRP Price</th>
<th>Sales price</th>
<th>GST</th>
<th>Discount</th>
<th>Selling Price</th>
<th>total Price</th>
<th >Action</th>
</tr>
</thead>
<tbody>
<% 

for(Cart c:list)
{ 
	total_price= total_price+(c.getSelling_price()*Integer.parseInt(c.getProduct_qty()));
%>
	<tr>
	<td><%= c.getProduct_id() %></td>
	<td><%= c.getProduct_name() %></td>
	<td><img style="height:100px;width:100px;" src="product/<%= c.getProduct_image() %>"></td>
	<td>
	<a  class="bt" href="QuantityServlet?pid=<%= c.getProduct_id() %>&&uid=<%=c.getUserid() %>&&quantity=inc"><i class="fas fa-plus"></i></a>
	<label><%= c.getProduct_qty() %></label>
	 <a  class="bt" href="QuantityServlet?pid=<%= c.getProduct_id() %>&&uid=<%=c.getUserid() %>&&quantity=dec"><i class="fa fa-minus" aria-hidden="true"></i></a>
	 </td>
	<td>&#8377 <%= c.getProduct_mrp() %></td>
	<td>&#8377 <%= c.getSales_price() %></td>
	<td><%= c.getGst() %>%</td>
	<td><%= c.getProduct_discount() %>%</td>
		<td>&#8377 <%= c.getSelling_price() %></td>
		<td>&#8377 <%= c.getTotal_price() %></td>
	<td><a href="RemoveCartServlet?pid=<%= c.getCart_id()%>" class="bt1"><i class="fas fa-trash-alt"></i></a></td>
	</tr>
<%}


%>
</tbody>
<tfoot>

<tr><th colspan="6" style="background:DodgerBlue"></th>
<th colspan="3">Grand Total Price:</th>
<th>&#8377 <%= total_price %></th>
<th ></th>
</tr>
</tfoot>
</table>
<br>
<div style="float:right;padding:20px;oveflow:auto;">
<a href="ShowProduct.jsp"  class="btn3" style="color:white;text-decoration:none">Go to Shopping Page</a>
<a href="checkout.jsp" style="color:white;text-decoration:none" class="btn2">Checkout</a>
</div>

<% }
else
{
	%>
	<div style="padding:40px;width:100%;">
	<img src="image/Empty_Shopping_Cart_blog.jpg" width="400px" height="300px" class="center">
	<br>
	<a class="center1" href="ShowProduct.jsp">Go to Shopping </a>
	</div>
	

<% 
}%>
<br>
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