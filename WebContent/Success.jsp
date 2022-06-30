<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/head.jsp" %>
<style>
.container2 { 
  height: 500px;
  position: relative;
  float:left;
  width:100%;
  margin-right :5px;
}

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
</style>
</head>
<body>
<div class="container2">

 <div class="center">
<i class="fas fa-check" style="background-color:green;border-radius:50px;width:38px;height:38px;font-size:30px;"></i>
 <h3>Thank You</h3>
 <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

  <h4>Your Order successfully </h4>
  <h5>with & Days Your Product will be Delivered in your address</h5>
   <button class="bt12"><a href="home.jsp"> Home Page</a></button>
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
</body>
</html>