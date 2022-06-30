<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="Style/userpanel.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<%@ include file="includes/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<style>
th
     {
         padding:5px;
         color:orange;
         border-color:black;
     }
     td
    {
    padding:10px
    }
       .inp{
width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

         .bt {
  width: 100%;
  background-color:tomato;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
}
</style>
</head>
<body>   <%@ include file="includes/header.jsp" %>



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
        <h1 style="color:navy;">Manage Profile </h1>
        <form action="EditUserServlet" method="post" id="updateuser_form">
         <input type="hidden" class="inp" value="${currentUser.id}" name="userid" >
       <table>
        
       <tr>
       <th>First Name </th>
       <td>
       <input type="text" class="inp" id="form_fname" value="${currentUser.fname}" name="fname">
       <span class="error_form" id="fname_error_message"></span>
       </td>
       </tr>
       <tr>
       <th>Last Name </th><td><input type="text" id="form_sname"  class="inp" value="${currentUser.lname}" name="lname">	<span class="error_form" id="sname_error_message"></span></td>
       </tr>
       <tr>
       <th>Your Email</th><td>  <input type="text" class="inp" id="form_email" value="${currentUser.email}" name="email"><span class="error_form" id="email_error_message"></span></td>
       </tr>
       <tr>
       <th>Mobile</th><td>  <input type="text" class="inp" id="form_uname" value="${currentUser.mobileno}" name="mobileno"><span class="error_form" id="uname_error_message"></span></td>
       </tr>
       <tr>
       <th>Password</th>
       <td><input type="password" name="password" class="inp"></td>
       </tr>
      
     <tr>
     <th></th>
     <td><input type="submit" value="Update" class="bt"></td>
     </tr>
      
       </table>
       </form>
    </div>

   	<script type="text/javascript">
      $(function() {

         $("#fname_error_message").hide();
         $("#sname_error_message").hide();
         $("#email_error_message").hide();
         $("#mobile_error_message").hide();

         var error_fname = false;
         var error_sname = false;
         var error_email = false;
         var error_mobile = false;

         $("#form_fname").focusout(function(){
            check_fname();
         });
         $("#form_sname").focusout(function() {
            check_sname();
         });
         $("#form_email").focusout(function() {
            check_email();
         });
         $("#form_mobile").focusout(function() {
             check_mobile();
          });
       

         function check_fname() {
            var pattern = /^[a-zA-Z]*$/;
            var fname = $("#form_fname").val();
            if (pattern.test(fname) && fname !== '') {
               $("#fname_error_message").hide();
               $("#form_fname").css("border-bottom","2px solid #34F458");
            } else {
               $("#fname_error_message").html("Should contain only Characters");
               $("#fname_error_message").show();
               $("#form_fname").css("border-bottom","2px solid #F90A0A");
               error_fname = true;
            }
         }

         function check_sname() {
            var pattern = /^[a-zA-Z]*$/;
            var sname = $("#form_sname").val()
            if (pattern.test(sname) && sname !== '') {
               $("#sname_error_message").hide();
               $("#form_sname").css("border-bottom","2px solid #34F458");
            } else {
               $("#sname_error_message").html("Should contain only Characters");
               $("#sname_error_message").show();
               $("#form_sname").css("border-bottom","2px solid #F90A0A");
               error_fname = true;
            }
         }
         function check_mobile() {
             var pattern = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
             var mobile = $("#form_mobile").val()
             if (pattern.test(mobile) && mobile !== '') {
                $("#mobile_error_message").hide();
                $("#form_mobile").css("border-bottom","2px solid #34F458");
             } else {
                $("#mobile_error_message").html("Mobile contain write  Abc123");
                $("#mobile_error_message").show();
                $("#form_mobile").css("border-bottom","2px solid #F90A0A");
                error_mobile = true;
             }
          }

         function check_email() {
            var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            var email = $("#form_email").val();
            if (pattern.test(email) && email !== '') {
               $("#email_error_message").hide();
               $("#form_email").css("border-bottom","2px solid #34F458");
            } else {
               $("#email_error_message").html("Invalid Email");
               $("#email_error_message").show();
               $("#form_email").css("border-bottom","2px solid #F90A0A");
               error_email = true;
            }
         }

         $("#userupdate_form").submit(function() {
            error_fname = false;
            error_sname = false;
            error_email = false;
            error_mobile = false;

            check_fname();
            check_sname();
            check_email();
            check_mobile();
           
            
            if (error_fname === false && error_sname === false && error_email === false && error_mobile === false)
            {
               alert("Update User Successfull");
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
   <%@include file="includes/footer.jsp" %>
</body>
</html>