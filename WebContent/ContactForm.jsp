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
	<title>Enquiry Page</title>
	<link rel="stylesheet" type="text/css" href="css/menu.css" />
	<link rel="stylesheet" type="text/css" href="Style/contact.css">
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<%@ include file="includes/head.jsp" %>
</head>
<body>   <%@ include file="includes/header.jsp" %>

<div style="width:100%;padding:20px;overflow:auto;">
	<div class="container">
	<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
		<h1 style="color:orange">Enquiry Form</h1>
		<form id="contact_form" action="EnquiryServlet" method="post">
			<div >
				<input type="text"  class="inp" id="form_fullname" name="userfullname" required="">
				<span class="error_form" id="fullname_error_message"></span>
				<label>
					Full Name
				</label>	
			</div>
			<div>
				<input type="text"  class="inp" id="form_contact" name="usercontact" required="" >
				<span class="error_form" id="contact_error_message"></span>
				<label>
					Contact Number
				</label>	
			</div>
			<div>
				<input type="email"  class="inp" id="form_email"  name="useremail" required="" >
				<span class="error_form" id="email_error_message"></span>
				<label>Email id</label>	
			</div>
			<div>
				<input type="text"  class="inp" id="form_subject" name="subject" required="">
				<span class="error_form" id="subject_error_message"></span>
				<label>
					 Subject
				</label>	
			</div>
			<div>
			<p>Message</p>
				<textarea rows="4"  class="inp" id="form_message" name="usermessage" required=""></textarea>
				<span class="error_form" id="message_error_message"></span>
					
			</div>
			<br>
			<input type="submit"  class="inp" value="Enquiry" >
			
			
		</form>
	</div></div>
	<script type="text/javascript">
      $(function() {

         $("#fullname_error_message").hide();
         $("#contact_error_message").hide();
         $("#email_error_message").hide();
         $("#subject_error_message").hide();
         $("#message_error_message").hide();

         var error_fullname = false;
         var error_contact = false;
         var error_email = false;
         var error_subject = false;
         var error_message = false;

         $("#form_fullname").focusout(function(){
            check_fullname();
         });
         $("#form_contact").focusout(function() {
            check_contact();
         });
         $("#form_email").focusout(function() {
            check_email();
         });
         $("#form_subject").focusout(function() {
             check_subject();
          });
         $("#form_message").focusout(function() {
            check_message();
         });
        

         function check_fullname() {
            var pattern = /^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$/;
            var fullname = $("#form_fullname").val();
            if (pattern.test(fullname) && fullname !== '') {
               $("#fullname_error_message").hide();
               $("#form_fullname").css("border-bottom","2px solid #34F458");
            } else {
               $("#fullname_error_message").html("Should contain only Characters");
               $("#fullname_error_message").show();
               $("#form_fullname").css("border-bottom","2px solid #F90A0A");
               error_fullname = true;
            }
         }
       
         function check_contact() {
             var pattern = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
             var contact = $("#form_contact").val();
             if (pattern.test(contact) && contact !== '') {
                $("#contact_error_message").hide();
                $("#form_contact").css("border-bottom","2px solid #34F458");
             } else {
                $("#contact_error_message").html("Invalid contact");
                $("#contact_error_message").show();
                $("#form_contact").css("border-bottom","2px solid #F90A0A");
                error_contact = true;
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
         
         
         function check_subject() {
             var pattern = /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/;
             var subject = $("#form_subject").val();
             if (pattern.test(subject) && subject !== '') {
                $("#subject_error_message").hide();
                $("#form_subject").css("border-bottom","2px solid #34F458");
             } else {
                $("#subject_error_message").html("Invalid subject");
                $("#subject_error_message").show();
                $("#form_subject").css("border-bottom","2px solid #F90A0A");
                error_subject = true;
             }
          }
         
         function check_message() {
             var pattern = /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/;
             var message = $("#form_message").val();
             if (pattern.test(message) && message !== '') {
                $("#message_error_message").hide();
                $("#form_message").css("border-bottom","2px solid #34F458");
             } else {
                $("#message_error_message").html("Invalid subject");
                $("#message_error_message").show();
                $("#form_message").css("border-bottom","2px solid #F90A0A");
                error_message = true;
             }
          }
         

         $("#contact_form").submit(function() {
            error_fullname = false;
            error_contact = false;
            error_email = false;
            error_subject = false;
            error_message = false;

            check_fullname();
            check_contact();
            check_email();
            check_subject();
            check_message();
           
            //validating checkbox
            
            if (error_fullname === false && error_contact === false && error_email === false && error_subject === false  && error_messagee === false)
            {
               alert("Registration Successfull");
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
