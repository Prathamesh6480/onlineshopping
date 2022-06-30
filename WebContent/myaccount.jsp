<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.entities.UserRegister"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="Style/userpanel.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<%@ include file="includes/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<style type="text/css">
th,td
{
padding:10px;
}
</style>
</head>
<body>   
<%@ include file="includes/header.jsp" %>


<% UserRegister user =(UserRegister) session.getAttribute("currentUser");%>
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
        <h1 style="color:navy;text-align:center;">My Profile </h1>
        <br>
        <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
         <div style="float:right;"> <Button><i class="fas fa-user-edit"></i><a href="updateaccount.jsp">Update Profile</a></Button></div>
   
   
   
       
           <div class="card">
  
  <h1><%= user.getFname() %> <%= user.getLname() %></h1>
  <p class="title"><%= user.getEmail() %> </p>
 
  <div style="margin: 24px 0;">
       <table>
        
       <tr>
       <th>Mobile</th><td><%= user.getMobileno() %></td>
       </tr>
       <tr>
       <th>Password</th><td><%= user.getPassword() %></td>
       </tr>
     
      
       </table>
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