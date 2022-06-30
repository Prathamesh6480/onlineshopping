<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.ProductDao" %> 
<%@ page import="com.entities.AddProduct" %>
<%@ page import="com.entities.UserRegister" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Product</title>
   <link rel="stylesheet" type="text/css" href="Style/productpg.css" />
<%@ include file="includes/head.jsp" %>

<link rel="stylesheet" type="text/css" href="css/menu.css" />
</head>
<body>

<%@include file="includes/header.jsp" %>
<div style="width:100%;overflow:auto">

<div class="listing-section">
<h1 class="price">Search Products</h1>
<%
UserRegister user=(UserRegister)session.getAttribute("currentUser");
%>
<%
String ch=request.getParameter("ch");
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
List<AddProduct>list=dao.getProductBySearch(ch);

for(AddProduct ap:list)
{ %>


  <div class="product">
    <div class="image-box" style="padding:15px;">
      <div ><img src="product/<%= ap.getProduct_photo() %>" class="images" width="100%" /></div>
    </div>
    <div class="text-box">
      <h2 class="dots"><%= ap.getProudct_name() %></h2>
     
      <p class="description">Available : <%= ap.getProduct_stock() %></p>
      <label for="item-1-quantity"></label>
      <input type="hidden" name=""  value="<%= ap.getProduct_id() %>">
 <h3 class="price"><span style="color:LightSlateGray">&#8377 <b><%= ap.getProduct_price() %></b></span> <span style="color:red"> <del>&#8377 <%= ap.getProduct_mrp() %></del></span>
<span style="color:Lime"><%= ap.getProduct_discount() %></span> <span style="color:Lime">% off</span>  </h3>
   <p class="description"><span style="color:red" >save &#8377 <%= ap.getDiscount_price() %></span></p>
      
    <p >  <%if(user==null)
      {%>
        <a href="login.jsp" class="btn1" ><i class="fas fa-shopping-cart"></i><label> Add to cart</label></a>
     
    	
       <%  
      }else{%>
      <% 
      if("0".equals(ap.getProduct_stock()))
      {%>
      <a href="#" class="btn1" >Out of Stock</a>
     
     
   <% } else
   {%>
       
   <a href="CartServlet?pid=<%=ap.getProduct_id()%>&&uid=<%=user.getId() %>&&txtqty=1" class="btn1" ><i class="fas fa-shopping-cart"></i><label>Add to cart</label></a>
  <%} %> 
      <%} %>
      <a class="btn2" href="ViewDetails.jsp?id=<%=ap.getProduct_id()%>"><i class="fas fa-eye"></i> <label>View</label></a></p>
    </div>
  </div>

<%}%>
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