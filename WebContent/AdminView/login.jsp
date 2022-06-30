<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>One india Shopping</title>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join Us</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="Style/style1.css" rel="stylesheet" type="text/css"/>
        
        <style>
        .regbox1{
    width: 380px;
    height: 350px;
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
        </style>
  
</head>
<body>
            <div class="regbox1 box">
                <h1>Admin Login Account</h1>
<form action="../AdminLoginServlet" method="post">
                    <p>
Username</p>
<input type="text" placeholder="Username" name="email" required>
                    <p>
Password</p>
<input type="password" placeholder="Password" name="password" required>
<p>
 <input type="submit" value="Login">
  </p>      
 <c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
</form>
</div>
</body>
</html>