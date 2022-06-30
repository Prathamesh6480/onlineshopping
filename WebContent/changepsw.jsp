<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
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
<div style="overflow:auto;">


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
      <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
        <h1 style="color:navy;">Change Password </h1>
        <form action="ChangePasswordServlet" method="post" id="changepassword_form">
         <input type="hidden" class="inp" value="${currentUser.id}" name="userid" >
       <table>
        
       <tr>
       <th>Old Password</th>
       <td><input type="password" name="oldpassword" class="inp" id="form_old_password" required></td>
       </tr>
      
       <tr>
       <th>New Password</th>
       <td><input type="password" name="newpassword"  id="form_password" class="inp" required></td>
       </tr>
       
        <tr>
       <th>Confirm Password</th>
       <td><input type="password" name="cpassword" id="form_retype_password" class="inp" required></td>
       </tr>
     <tr>
     <th></th>
     <td><input type="submit" value="Update" class="bt"></td>
     </tr>
      
       </table>
       </form>
       <span class="error_form" id="oldpassword_error_message"></span>
       <span class="error_form" id="password_error_message"></span>
       <span class="error_form" id="retype_password_error_message"></span>
    </div>

   	<script type="text/javascript">
    $(function() {


        $("#oldpassword_error_message").hide();
        $("#password_error_message").hide();
        $("#retype_password_error_message").hide();

       
        var error_oldpassword = false;
        var error_password = false;
        var error_retype_password = false;

        $("#form_old_password").focusout(function() {
            old_password();
         });
        
        $("#form_password").focusout(function() {
           check_password();
        });
        
        $("#form_retype_password").focusout(function() {
           check_retype_password();
        });

        function old_password() {
            var password_length = $("#form_old_password").val().length;
            if (password_length < 8) {
               $("#oldpassword_error_message").html("Atleast 8 Characters");
               $("#oldpassword_error_message").show();
               $("#form_old_password").css("border-bottom","2px solid #F90A0A");
               error_password = true;
            } else {
               $("#oldpassword_error_message").hide();
               $("#form_old_password").css("border-bottom","2px solid #34F458");
            }
         }
        
        function check_password() {
           var password_length = $("#form_password").val().length;
           if (password_length < 8) {
              $("#password_error_message").html("Atleast 8 Characters");
              $("#password_error_message").show();
              $("#form_password").css("border-bottom","2px solid #F90A0A");
              error_password = true;
           } else {
              $("#password_error_message").hide();
              $("#form_password").css("border-bottom","2px solid #34F458");
           }
        }

        function check_retype_password() {
           var password = $("#form_password").val();
           var retype_password = $("#form_retype_password").val();
           if (password !== retype_password) {
              $("#retype_password_error_message").html("Passwords Did not Matched");
              $("#retype_password_error_message").show();
              $("#form_retype_password").css("border-bottom","2px solid #F90A0A");
              error_retype_password = true;
           } else {
              $("#retype_password_error_message").hide();
              $("#form_retype_password").css("border-bottom","2px solid #34F458");
           }
        }

  

        $("#changepassword_form").submit(function() {
           
           error_oldpassword = false;
           error_password = false;
           error_retype_password = false;

          old_password();
           check_password();
           check_retype_password();
          
           //validating checkbox
           
           if (error_oldpassword === false  && error_password === false && error_retype_password === false)
           {
              alert("Change Your Password");
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
</div>
   <%@include file="includes/footer.jsp" %>
</body>
</html>