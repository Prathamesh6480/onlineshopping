<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="stylecss.css">
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
	<div class="container">
	<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
		<h1 style="color:orange">LOGIN ACCOUNT</h1>
		<form id="login_form" action="LoginServlet" method="post">
			
			
			<div>
				<input type="email" id="form_email" class="inp"  name="email"  required="">
				<span class="error_form" id="email_error_message"></span>
				<label>Email id</label>	
			</div>
			<div>
				<input type="password" id="form_password" class="inp" name="password" required="">
				<span class="error_form" id="password_error_message"></span>
				<label>Password</label>	
			</div>
			
			<input type="submit" class="inp" value="Login" >
			<div>
			<br>
			 <a href="changepassword.jsp">Forget Password?</a> 
                    <a href="registration.jsp">Create New Account</a>
			</div>
			<div>
			
			               <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
			</div>
		</form>
	</div>
	<script type="text/javascript">
      $(function() {

       
         $("#email_error_message").hide();
         $("#password_error_message").hide();
 
         var error_email = false;
         var error_password = false;

         $("#form_email").focusout(function() {
            check_email();
         });
         $("#form_password").focusout(function() {
            check_password();
         });
       
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
        
        	 
        	

         $("#login_form").submit(function() {
         
            error_email = false;
            error_password = false;
            
     
            check_email();
            check_password();

          
            if (error_email === false   && error_password === false)
            {
               alert("Click to login here");
               return true;
            } else {
               alert("Please Fill the form Correctly");
               return false;
            }
          


         });
      });
   </script>
</body>
</html>