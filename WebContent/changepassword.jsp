<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
        <link href="Style/style1.css" rel="stylesheet" type="text/css"/>
        
        <style>
        .regbox1{
    width: 390px;
    height: 340px;
    background: #2f3542;
    margin: 0;
    padding: 30px;
    top: 55%;
    left: 50%;
    color: #fff;
    border-radius: 15px;
    position: absolute;
    transform: translate(-50%, -50%);
    box-sizing: border-box;
}
.error_form
{
	top: 12px;
	color: rgb(216, 15, 15);
    font-size: 15px;
    font-family: Helvetica;
}
        </style>
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <link rel="stylesheet" type="text/css" href="css/menu.css" />
</head>
<body>
        <div class="container">
            <div class="regbox1 box">
             <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
                <h1>Forget Password</h1>
<form action="ForgetPassMailServlet" id="forget_form" method="get">
                    <p>
Email Address</p>
<input type="text" placeholder="123anc@gmail.com" id="form_email" name="email" required>
 <span class="error_form" id="email_error_message"></span>
                    <input type="submit" value="send mail">
                    <a href="login.jsp">Go to login page</a><br>
                    <a href="registration.jsp">Create New Account</a>
                </form>
</div>
</div>

<script type="text/javascript">
      $(function() {

         $("#email_error_message").hide();
         $("#form_email").focusout(function() {
            check_email();
         });
       
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

         $("#forget_form").submit(function() {
            error_email = false;
            check_email();
           
           if (error_email === false)
            {
               alert("Check for Email Authentication ");
               return true;
            } else {
               alert("Please Fill the form Correctly");
               return false;
            }
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