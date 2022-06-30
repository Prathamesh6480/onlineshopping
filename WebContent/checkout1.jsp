<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
 
</head>

<body>

                <h1>
Register Account</h1>
<form action="OrderServ" method="post">
 name<input type="text" name="nm"><br>
 email<input type="text" name="email"><br>
address<input type="text" name="address"><br>
<input type="radio"  name="check" value="cod" > cash on delivery
<input type="radio"  name="check" value="od" > online delviery
                 <br>  <input type="submit" value="Register">
                </form>

</body>
</html>