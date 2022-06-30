 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page isELIgnored="false" %>
<%@ page import="com.entities.UserRegister" %>
<%@ page import="com.entities.Cart" %>
<%@ page import="com.dao.CartDao" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.*" %>
<div class="topnav" id="myTopnav">
<c:if test="${not empty currentUser}">
      <a style="color:white">Welcome user ${currentUser.fname}</a>
      </c:if>
     <div class="dropdown" >
    <button class="dropbtn" style=" font-size: 16px;color:white;"><i class="fa fa-home" aria-hidden="true"></i> All Category
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
 <c:if test="${not empty currentUser}">
     <a style="cursor:pointer;color:white;font-size:12px;" href="LogoutServlet"> | <i class="fas fa-sign-out-alt"></i> Logout |</a>
    <a style="cursor:pointer;color:white;font-size:12px;" href="myaccount.jsp" id="myaccount"> | <i class="fas fa-user-circle"></i> My Account</a>
   </c:if>
   
    <c:if test="${empty currentUser}">
   <a style="cursor:pointer;color:white;font-size:12px;" id="login" href="login.jsp">  <i class="fas fa-user-lock" aria-hidden="true" style=" font-size: 1.1em;color:white;"></i> Sign in | </a>
     <a style="cursor:pointer;color:white;font-size:12px;" id="reg" href="registration.jsp"><i class="fas fa-sign-in-alt" aria-hidden="true" style=" font-size: 1.3em;color:white;"></i> Sign Up</a> 
   </c:if> 
 
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>