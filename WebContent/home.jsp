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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<title>home page</title>
<%@include file="includes/head.jsp" %>
<link rel="stylesheet" type="text/css" href="style.css" />
<style>




.center {
     background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
  color: white; 
border: 3px solid #f1f1f1;

  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);

  z-index: 2;
  padding: 10px 15px;

  
  text-align: center;
  
  
}
.bt12
{
width: 120px;
  background-color:orange;
  color: white;
  padding: 10px 15px;
  margin: 8px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
  text-align: center;

}


</style>
  <link rel="stylesheet" type="text/css" href="Style/productpg.css" />
</head>
<body>

<%@include file="includes/header.jsp" %>
<section> 
    <div class="rt-container">
        <div class="col-rt-12">
    	
<!--slider-->
          <div id="slider">
            <div class="slides">
              <div class="slider">
                <div class="legend"></div>
                <div class="content">
                  <div class="content-txt">
                    <h2>One India Shopping Mart</h2>
                    <p>Wonder around the lines, pick everything you like.</p>
                  </div>
                </div>
                <div class="image"> <img src="image/homepage/1.jpg" Width="100%"> </div>
              </div>
              <div class="slider">
                <div class="legend"></div>
                <div class="content">
                  <div class="content-txt">
                    <h2>One India Shopping Mart</h2>
                    <p>Wonder around the lines, pick everything you like.</p>
                  </div>
                </div>
                <div class="image"><img src="image/homepage/2.jpeg" Width="100%" > </div>
              </div>
              <div class="slider">
                <div class="legend"></div>
                <div class="content">
                  <div class="content-txt">
                    <h2>One India Shopping Mart</h2>
                    <p>Wonder around the lines, pick everything you like.</p>
                  </div>
                </div>
                <div class="image"> <img src="image/homepage/3.png" Width="100%" >

                </div>
              </div>
              <div class="slider">
                <div class="legend"></div>
                <div class="content">
                  <div class="content-txt">
                    <h2>One India Shopping Mart</h2><br>
                    <p>Wonder around the lines, pick everything you like.</p>
                  </div>
                </div>
                <div class="image">  <img src="image/homepage/4.jpg" Width="100%" > </div>
              </div>
            </div>
            <div class="switch">
              <ul>
                <li>
                  <div class="on"></div>
                </li>
                <li></li>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
        </div>
	 </div> 
	 
	 
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
<div style="padding:10px;width:100%;">
 <h2 class="price" style="font-weight: bold;">Deals of the Day</h2>
</div>
<div style="overflow:auto;padding:20px;width:100%">

<div class="container2">
  <div class="center">
  <h3>Home Decors Plant Avalable here...</h3>
    <button class="bt12"><a href="HomePlant.jsp">Buy Now</a></button>
  </div>

</div>
<div class="container3">
  <div class="center">
   <h3>Home Decors Statue Avalable here...</h3>
    <button class="bt12"><a href="Homedecors.jsp">Buy Now</a></button>
  </div>

</div>
</div>

<div style="overflow:auto;width:100%">
<h2 style="font-weight: bold;" class="price">TRENDING PRODUCTS</h2>
<div class="listing-section">
<%
UserRegister user=(UserRegister)session.getAttribute("currentUser");
%>
<%
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
List<AddProduct>list=dao.getTopProduct();

for(AddProduct ap:list)
{ %>


  <div class="product">
    <div class="image-box" style="padding:15px;">
      <div ><img src="product/<%= ap.getProduct_photo() %>" class="images" width="100%" /></div>
    </div>
    <div class="text-box">
      <h2 class="dots"><%= ap.getProudct_name() %></h2>
       <label for="item-1-quantity">  <input type="hidden" name=""  value="<%= ap.getProduct_id() %>"></label>
    
   <p class="description"><span style="color:LightSlateGray">&#8377 <b><%= ap.getProduct_price() %></b></span> <span style="color:red"> <del>&#8377 <%= ap.getProduct_mrp() %></del></span> <span style="color:lime" >save &#8377 <%= ap.getDiscount_price() %></span></p>
      
   <p class="price"> <a href="ViewDetails.jsp?id=<%=ap.getProduct_id()%>" style="color:orange;text-decoration:none;"> View details</a></p>
    </div>
  </div>

<%}%>
</div>
</div>


		
</section>

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