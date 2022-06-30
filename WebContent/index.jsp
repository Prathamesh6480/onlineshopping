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
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="Style/userpanel.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<%@ include file="includes/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>   <%@ include file="includes/header.jsp" %>


<% UserRegister user =(UserRegister) session.getAttribute("currentUser");

if(user==null)
{
	response.sendRedirect("login.jsp");
}
%>

<div class="sidebar">
<a href="#"><label style="color:red;">${currentUser.fname}</label></a>
  <a href="myaccount.jsp"><i class="fa fa-user" aria-hidden="true"></i> My Profile</a>
   <a href="address.jsp"><i class="fas fa-address-card"></i> Address </a>
  <a href="myorder.jsp"><i class="fas fa-shopping-basket"></i> My Order</a>
  <a href="changepsw.jsp"><i class="fas fa-key"></i> Change Password</a>
  <a><i class="fas fa-sign-out-alt"></i> Logout</a> 
</div>

<div class="content">
 <div class="address1">
    
    
    <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>


        <h1 style="color:navy;">Your Address </h1>
        <form action="UserAddressServlet" method="post" id="useraddress_form">
       <table>
       
        <tr>
       <th>Address </th>
       <td>
       <input type="text" class="inp" id="form_address"  name="address" required="">
       </td>
       </tr>
       <tr>
       <th>City </th><td><input type="text" class="inp" id="form_city" name="city" required=""></td>
       </tr>
       <tr>
       <th>State</th><td>  
       <select  class="inp" id="form_state"  name="state" required="">
       <option selected disabled>---select state--</option>
       <option value="Maharashtra" >Maharashtra</option>
       </select>
       </tr>
       <tr>
       <th>Zip</th><td>  <input type="text" class="inp" id="form_zip" name="zip" required=""></td>
       </tr>
      
     <tr>
     <th></th>
     <td><input type="submit" value="Add" class="bt"></td>
     </tr>
      
       </table>
       <br>
       <span class="error_form" id="address_error_message"></span><br>
       <span class="error_form" id="city_error_message"></span><br>
       <span class="error_form" id="state_error_message"></span><br>
       <span class="error_form" id="zip_error_message"></span><br>
       </form>
    </div>
     <div class="address2">
     <h3>Address Details</h3>
   <table>
      <tr>
       <th>Your User ID</th><td> <%= user.getId() %></td>
       </tr>
   <tr>
   <th>Address :</th><td> <%= user.getAddress() %></td>
   </tr>
   <tr>
   <th>City :</th><td> <%= user.getCity() %></td>
   </tr>
   <tr>
   <th>State :</th><td> <%= user.getState() %></td>
   </tr>
   <tr>
   <th>Zip</th><td> <%= user.getZip() %></td>
   </tr>
   </table>
    </div>
</div>
	<script type="text/javascript">
      $(function() {

         $("#address_error_message").hide();
         $("#city_error_message").hide();
         $("#state_error_message").hide();
         $("#zip_error_message").hide();

         var error_address = false;
         var error_city = false;
         var error_state = false;
         var error_zip = false;

         $("#form_address").focusout(function(){
            check_address();
         });
         $("#form_city").focusout(function() {
            check_city();
         });
         $("#form_state").focusout(function() {
            check_state();
         });
         $("#form_zip").focusout(function() {
             check_zip();
          });
       

         function check_address() {
            var pattern = /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/;
            var address = $("#form_address").val();
            if (pattern.test(address) && address !== '') {
               $("#address_error_message").hide();
               $("#form_address").css("border-bottom","2px solid #34F458");
            } else {
               $("#address_error_message").html("Empty address");
               $("#address_error_message").show();
               $("#form_address").css("border-bottom","2px solid #F90A0A");
               error_address = true;
            }
         }

         function check_city() {
             var pattern = /^[a-zA-Z]*$/;
             var city = $("#form_city").val()
             if (pattern.test(city) && city !== '') {
                $("#city_error_message").hide();
                $("#form_city").css("border-bottom","2px solid #34F458");
             } else {
                $("#city_error_message").html("Should contain only Characters");
                $("#city_error_message").show();
                $("#form_city").css("border-bottom","2px solid #F90A0A");
                error_city = true;
             }
          }
         
         function check_state() {
            var pattern = /^[a-zA-Z]*$/;
            var state = $("#form_state").val()
            if (pattern.test(state) && state !== '') {
               $("#state_error_message").hide();
               $("#form_state").css("border-bottom","2px solid #34F458");
            } else {
               $("#state_error_message").html("Should contain only Characters");
               $("#state_error_message").show();
               $("#form_state").css("border-bottom","2px solid #F90A0A");
               error_state = true;
            }
         }
         
         
         function check_zip() {
            var pattern = /^\d{6}(?:[-\s]\d{5})?$/;
            var zip = $("#form_zip").val();
            if (pattern.test(zip) && zip !== '') {
               $("#zip_error_message").hide();
               $("#form_zip").css("border-bottom","2px solid #34F458");
            } else {
               $("#zip_error_message").html("Invalid zip");
               $("#zip_error_message").show();
               $("#form_zip").css("border-bottom","2px solid #F90A0A");
               error_zip = true;
            }
         }

         $("#useraddress_form").submit(function() {
            error_address = false;
            error_city = false;
            error_state = false;
            error_zip = false;

            check_address();
            check_city();
            check_state();
            check_zip();
           
            
            if (error_address === false && error_city === false && error_state === false && error_zip === false)
            {
               alert("Update Loacation Successfull");
               return true;
            } else {
               alert("Please Fill the form Correctly");
               return false;
            }

         });
      });
   </script>
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
