  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page isELIgnored="false" %>
<%@ page import="com.entities.UserRegister" %>
<%@ page import="com.entities.Cart" %>
<%@ page import="com.dao.CartDao" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.*" %>

<!--########################Prathamesh Navigation bar -->
<div class="topnav" id="myTopnav">
<c:if test="${not empty currentUser}">
      <a style="color:white">Welcome user ${currentUser.fname}</a>
      </c:if>
     <div class="dropdown" >
    <button class="dropbtn" style=":white;"><i class="fa fa-home" aria-hidden="true"></i> All Category
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content" >
         <a href="ShowProduct.jsp" >All Products</a>
      <a href="Electronic.jsp">Electronic</a>
      <a href="Agri.jsp">Agriculture Tools</a>
      <a href="Homedecors.jsp">Home Decors</a>
           <a href="HomePlant.jsp">Home Plants</a>
           
    </div>
  </div> 
  <a href="home.jsp">Home</a>
 <a href="ContactForm.jsp">Contact us</a> 
 
 <div class="topnav-right">
   <c:if test="${not empty currentUser}">
     <a style="cursor:pointer;color:white;" href="LogoutServlet"> | <i class="fas fa-sign-out-alt"></i> Logout |</a>
    <a style="cursor:pointer;color:white;" href="myaccount.jsp" id="myaccount"> | <i class="fas fa-user-circle"></i> My Account</a>
   </c:if>
   
    <c:if test="${empty currentUser}">
   <a style="cursor:pointer;color:white;" id="login" href="login.jsp">  <i class="fas fa-user-lock" aria-hidden="true" style="color:white;"></i> Sign in | </a>
     <a style="cursor:pointer;color:white;" id="reg" href="registration.jsp"><i class="fas fa-sign-in-alt" aria-hidden="true" style=" color:white;"></i> Sign Up</a> 
   </c:if>  
  </div>

 
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>



<!-- ----######### Top Header #########3 -->
<div class="topheader">
 <div class="topheader1">
            <div class="topimg">
          
            </div></div>
        <div class="topheader2"><form action="Search.jsp" method="post"><input type="search" Class="sev" name="ch"></form></div>
        <div class="topheader3">  
       <div class="topnav1" > 
      
             <a style="color:#800000;text-decoration:none" href="AddtoCart.jsp"><i class="fa fa-cart-plus" style=" font-size: 22px;color:#800000"></i>&nbsp Cart 
         <c:if test="${not empty currentUser}">  
         <%
           UserRegister user11=(UserRegister)session.getAttribute("currentUser");
           CartDao dao11=new CartDao(ConnectionProvider.getConnection());
           List<Cart> list11=dao11.getProductByUser(user11.getId());
           %>
      <%= list11.size() %></a>
        </c:if>
            &nbsp&nbsp
            <a href="Tracking.jsp" style="text-decoration:none"><i class="fa fa-shipping-fast" aria-hidden="true" style=" font-size: 22px;color:#800000;"></i>&nbsp Track Order </a>
          </div>
        </div>  
</div>
       
<div class="navbar1" style="background-color:#F8F8FF;" >
  <div class="round1"><div class="circular--landscape">
     <img src="image/homepage/tab.jpg" >
   
</div>
  <a href="smartphone.jsp" class="centera" style="color:black;font-size:1.7vw;"><b>Smart phone</b></a>
 </div>
 <div class="round1"><div class="circular--landscape">
     <img src="image/homepage/tab2.png" />
</div>  <a href="laptop.jsp" class="centera" style="color:black;font-size:1.7vw;"><b>Laptop</b></a></div>

<div class="round1"><div class="circular--landscape">
    <img src="image/homepage/tab8.jpg" />
</div>  <a href="#" class="centera" style="color:black;font-size:1.7vw;"><b>Indoor plant</b></a></div>

  <div class="round1"><div class="circular--landscape">
     <img src="image/homepage/tab4.jpg" />
</div>  <a href="watch.jsp" class="centera" style="color:black;font-size:1.7vw;"><b>Watches</b></a></div>

<div class="round1"><div class="circular--landscape">
     <img src="image/homepage/tab5.png" >
</div>  <a href="Headphone.jsp" class="centera" style="color:black;font-size:1.7vw;"><b>Headphones</b></a></div>
     
</div>

