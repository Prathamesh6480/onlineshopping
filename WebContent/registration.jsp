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
	<title>Registration Page</title>
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
		<h1 style="color:orange">ONE INDIA REGISTER</h1>
		<form id="registration_form" action="RegServ" method="post">
			<div>
				<input type="text"  class="inp" id="form_fname" name="userfirstname" required="">
				<span class="error_form" id="fname_error_message"></span>
				<label>
					First Name
				</label>	
			</div>
			<div>
				<input type="text"  class="inp" id="form_sname" name="userlastname" required="">
				<span class="error_form" id="sname_error_message"></span>
				<label>
					Second Name
				</label>	
			</div>
			<div>
				<input type="email"  class="inp" id="form_email"  name="useremail" required="">
				<span class="error_form" id="email_error_message"></span>
				<label>Email id</label>	
			</div>
			<div>
				<input type="tel"  class="inp" id="form_mobile" name="mobileno" required="">
				<span class="error_form" id="mobile_error_message"></span>
				<label>
					Mobile No
				</label>	
			</div>
			<div>
				<input type="password"  class="inp" id="form_password" name="userpassword" required="">
				<span class="error_form" id="password_error_message"></span>
				<label>Password</label>	
			</div>
			<div>
				<input type="password"  class="inp" id="form_retype_password"  required="">
				<span class="error_form" id="retype_password_error_message"></span>
				<label>Re-Enter Password</label>	
			</div>
			
		<div><input type="checkbox" id="form_checkout" name="check" >I Agree Terms and Conditions</div>
			
			<input type="submit"  class="inp" value="Register" >
			<div><a href="login.jsp" >login here</a></div>
			
		</form>
	</div>
	<script type="text/javascript">
      $(function() {

         $("#fname_error_message").hide();
         $("#sname_error_message").hide();
         $("#email_error_message").hide();
         $("#mobile_error_message").hide();
         $("#password_error_message").hide();
         $("#retype_password_error_message").hide();

         var error_fname = false;
         var error_sname = false;
         var error_email = false;
         var error_mobile = false;
         var error_password = false;
         var error_retype_password = false;

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
         $("#form_password").focusout(function() {
            check_password();
         });
         $("#form_retype_password").focusout(function() {
            check_retype_password();
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

         $("#registration_form").submit(function() {
            error_fname = false;
            error_sname = false;
            error_email = false;
            error_mobile = false;
            error_password = false;
            error_retype_password = false;

            check_fname();
            check_sname();
            check_email();
            check_mobile();
            check_password();
            check_retype_password();
           
            //validating checkbox
            if ($('#form_checkout:checked').val() != null) {
            if (error_fname === false && error_sname === false && error_email === false && error_mobile === false  && error_password === false && error_retype_password === false)
            {
               alert("Registration Successfull");
               return true;
            } else {
               alert("Please Fill the form Correctly");
               return false;
            }
            
            
            }
                else
                	{
                	   alert('Please agree terms and conditions');
                       return false;
                	}


         });
      });
   </script>
</body>
