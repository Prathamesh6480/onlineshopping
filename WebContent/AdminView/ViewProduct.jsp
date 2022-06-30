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

.dots
{
 clear: left;
white-space:nowrap;
width:280px;
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

<%@ include file="includes/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
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
<%
String category=request.getParameter("search");
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
%>
<table style="width:100%;">
<tr>
<th align="left"><Span style="font-size:35px;">View Product Data</Span>
<%
if(category!=null)
{
%>
<button class="bt1" ><i class="fa fa-download" aria-hidden="true"></i> <a href="productstockcsv.jsp?category=<%= category %>" style="color:black;">Export Data</a></button>

<%
}
%>
</th>
<th align="right"><form action="" method="get">Category/Sub Category : <input type="text" name="search" placeholder="Search here.." class="inp"></form></th>

</tr>
</table>
<br>
 <table id="customers">
<thead>
<tr>
<th>ID</th>
<th>product Name</th>
<th>Image</th>
<th>Brand</th>
<th>type</th>
<th>Color</th>
<th>Size</th>
<th>Price</th>
<th>Status</th>
<th colspan="3">Action</th>
</tr>
</thead>
<tbody>
<%
List<AddProduct> list=dao.getAllProduct(category);
for(AddProduct ap:list)
{
%>
<tr>
<td><%= ap.getProduct_id() %></td>
<td><p class="dots"><%= ap.getProudct_name() %></p></td>
<td><img alt="" src="../product/<%= ap.getProduct_photo()%>" style="height:70px;width:50px;"></td>
<td><%= ap.getProduct_category() %></td>
<td><%= ap.getProduct_type() %></td>
<td><%= ap.getProduct_color() %></td>
<td><%= ap.getProduct_size() %></td>
<td>&#8377 <%= ap.getProduct_price() %></td>
<td><%= ap.getStatus() %></td>
<td><a href="Viewproduct12.jsp?id=<%=ap.getProduct_id()%>">View</a></td>
<td><a href="editproduct.jsp?id=<%=ap.getProduct_id()%>">Edit</a></td>
<td><a href="../ProudctDeleteServlet?id=<%=ap.getProduct_id()%>">Delete</a></td>
</tr>
<%} %>

</tbody>
</table>
<script>
$(document).ready(function() {
    $('#customers').dataTable( {
    	  columnDefs: [ {
    	            targets: [ 0 ],
    	            orderData: [ 0, 1 ]
    	        }, {
    	            targets: [ 1 ],
    	            orderData: [ 1, 0 ]
    	        }, {
    	            targets: [ 4 ],
    	            orderData: [ 4, 0 ]
    	        } ]
    	    } );
    	} );
</script>
</div>
</body>
</html>