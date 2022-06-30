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
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Smartphone</title>
 <link rel="stylesheet" type="text/css" href="Style/productpg.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
    <style>
      
 #toast {
  min-width: 350px;
  position: fixed;
bottom: 30px;
left: 50%;
  margin-left: -125px;
  background: #333;
  color: white;
  padding: 16px;
  text-align: center;
  z-index: 1;
   font-size: 17px;
  visibility: hidden;
  
  box-shadow: 0px 0px 100px #000;
 
}

#toast.display {
  visibility: visible;
  
  animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadeOut {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
dl {
  display: block;
  margin-top: 1em;
  margin-bottom: 1em;
  margin-left: 0;
  margin-right: 0;
}

dt {
  padding: 10px;
}

dt a
{
color:#DAA520;
text-decoration:none;
}

dd {
  padding: 5px;
 
  
}

dd a
{
 color:maroon;
text-decoration:none;
}


</style>

 <%@ include file="includes/head.jsp" %>
</head>
<body>

<%@include file="includes/header.jsp" %>
<c:if test="${not empty addCart }">
<div id="toast">${addCart}</div>
   <script type="text/javascript">
  showToast();
function showToast(content) {	  
	  $('#toast').addClass("display");
	  $('#toast').html(content);
  setTimeout(()=>{
	  $("#toast").removeClass("display"); 
	  }, 2000);
}
</script>
<c:remove var="addCart" scope="session"/>
  </c:if> 
<div class="productframe">
<div class="productframe1">
<dl>
  <dt><a href="electronic.jsp">Electronic Product</a></dt>
  <dd>- <a href="smartphone.jsp">Smartphone</a></dd>
  <dd>- <a href="laptop.jsp">Laptop</a></dd>
  <dd>- <a href="watch.jsp">Smart watch</a></dd>
  <dd>- <a href="Headphone.jsp">Headphone</a></dd>

  <dt><a href="agri.jsp">Agriculture Tools</a></dt>
  
  <dt><a href="homeplant.jsp">Home Decors Plant</a> </dt>
  <dd>- <a href="indoor.jsp">Indoor Plant</a></dd>
  <dd>- <a href="outdoor.jsp">Outdoor Plant</a></dd>
 
  <dt><a href="homedecor">Home Decors Product</a> </dt>
  <dd>- <a href="vase.jsp">Vase</a></dd>
  <dd>- <a href="frame.jsp">Frame</a></dd>
  <dd>- <a href="statue.jsp">Statue</a></dd>
</dl>


</div>
<div class="productframe2">

<div class="listing-section">
<h1 class="price">Smartphone product</h1>
<%
UserRegister user=(UserRegister)session.getAttribute("currentUser");
%>
<%
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
List<AddProduct>list=dao.getSmartphoneProduct();

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
      
    
  <%if(user==null)
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