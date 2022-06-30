<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page import="com.dao.ProductDao" %> 
 <%@ page import="com.entities.AddProduct" %>
 <%@ page import="com.helper.ConnectionProvider" %>
 <%@ page import="com.entities.UserRegister" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Information</title>
<style type="text/css">
table
{
width:100%;
}
table,td,th
{
border:1px solid black;
border-collapse:collapse;
}
.td1
{
width:40%;
border:1px solid black;
border-collapse:collapse;
}

.image-box {
  width: 400px;
  overflow: hidden;
  border-radius: 2% 2% 0 0;
}

.images {
  height: 15em;
  background-size: cover; 
  background-position: center center; 
  background-repeat: no-repeat;
  border-radius: 2% 2% 0 0;
  transition: all 1s ease;
  -moz-transition: all 1s ease;
  -ms-transition: all 1s ease;
  -webkit-transition: all 1s ease;
  -o-transition: all 1s ease;
}

.images:hover {
  transform: scale(1.2);
  overflow: hidden;
  border-radius: 2%;
}


  .btn1 {
  width: 300px;;
  background-color:orange;
  color: white;
  padding: 8px 13px;
  margin: 7px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
  text-align: center;
}    

@media only screen and (max-width:600px) {


table
{
width:100%;
}
table,td,th
{
border:1px solid black;
border-collapse:collapse;
font-size:8px;
}
.td1
{
width:40%;
border:1px solid black;
border-collapse:collapse;
font-size:8px;
}

.image-box {
  width: 200px;
  overflow: hidden;
  border-radius: 2% 2% 0 0;
}

.images {
  height: 15em;
  background-size: cover; 
  background-position: center center; 
  background-repeat: no-repeat;
  border-radius: 2% 2% 0 0;
  transition: all 1s ease;
  -moz-transition: all 1s ease;
  -ms-transition: all 1s ease;
  -webkit-transition: all 1s ease;
  -o-transition: all 1s ease;
}

.images:hover {
  transform: scale(1.2);
  overflow: hidden;
  border-radius: 2%;
}



  .btn1 {
  width: 150px;;
  background-color:orange;
  color: white;
  padding: 8px 13px;
  margin: 7px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
  text-align: center;
} 
}

</style>
<%@ include file="includes/head.jsp" %>
<link rel="stylesheet" type="text/css" href="css/menu.css" />
</head>
<body>

<%@include file="includes/header.jsp" %>
<h1>Product Information</h1>

<%
UserRegister user=(UserRegister)session.getAttribute("currentUser");
int id=Integer.parseInt(request.getParameter("id"));
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
AddProduct ap=dao.getProductEditById(id);
%>
<table>
<tr>
<th rowspan="9" class="td1">
<div class="image-box" style="padding:15px;">
      <div ><img src="product/<%= ap.getProduct_photo() %>" class="images" width="100%" /></div>
    </div>
</th>
<th class="td2">Product Name</th><td ><%= ap.getProudct_name() %></td>
</tr>
<tr>
<th>Company</th><td><%= ap.getProduct_category() %></td>
</tr>
<tr>
<th>product Category</th><td><%= ap.getProduct_subcat() %></td>
</tr>
<tr>
<th>product type</th><td><%= ap.getProduct_type() %></td>
</tr>
<tr>
<th>Product Color</th><td><%= ap.getProduct_color() %></td>
</tr>
<tr>
<th>Product Size</th><td><%= ap.getProduct_size() %></td>
</tr>
<tr>
<th>Product Stock</th><td><%= ap.getProduct_stock() %></td>
</tr>
<tr>
<th>Product MRP</th><td>&#8377 <del> <%= ap.getProduct_mrp() %></del> &#8377  <%= ap.getProduct_price() %> ( <%= ap.getProduct_discount() %> % off  save &#8377 <%= ap.getDiscount_price() %> )</td>
</tr>
<tr>   
     <th >Product Specification :</th>
 <td></td>
</tr>

<tr>
<th>
     <%if(user==null)
      {%>
        <a href="login.jsp">
      <button class="btn1" ><i class="fas fa-shopping-cart"></i> Add to cart</button></a>
     
    	
       <%  
      }else{%>
     
     <a href="CartServlet?pid=<%=ap.getProduct_id()%>&&uid=<%=user.getId() %>&&txtqty=1">
      	<button class="btn1" >Add to cart</button>
    </a>
      <%} %>
</th>
<td colspan="3"><%= ap.getProduct_specification() %></td>
</tr>
</table>
  <%@include file="includes/footer.jsp" %>
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
</body>
</html>