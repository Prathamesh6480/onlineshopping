<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page import="com.dao.UserRegisterDao" %> 
<%@ page import="com.entities.UserRegister" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Data</title>
<style type="text/css">
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {

  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}

       .inp{
width: 300px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
</style>
<%@ include file="includes/head.jsp" %>
</head>
<body>   
<%@ include file="includes/header.jsp" %>
<div style="padding:30px;">


 <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
<div >
<table style="width:100%;">
<tr>
<th align="left"><Span style="font-size:35px;">Customer Data</Span></th>
<th align="right"><form action="" method="get"><input type="text" name="search" placeholder="Search here.." class="inp"></form></th>
</tr>
</table>
</div>



<br>
 <table id="customers">
                            <thead>
<tr>
<th>User ID</th>
<th>First Name</th>
<th>Last Name</th>
<th>Email</th>
<th>Mobile No</th>
<th>Password</th>
<th>Date</th>
</tr>
</thead>
<tbody>
<%
Connection con = ConnectionProvider.getConnection();

Statement stat=null;
ResultSet res=null;
stat =con.createStatement();
String query=request.getParameter("search");
String data;
if(query!=null)
{
	data="select * from userregistertb where firstname like '%"+query+"%' or email like '%"+query+"%' or mobileno like '%"+query+"%'  ";
}
else
{
	data="select * from userregistertb order by userid desc"	;
	
}
res = stat.executeQuery(data);

while(res.next())
{
%>

<tr>
<td><%= res.getString("userid")  %> </td>
<td><%=res.getString("firstname")  %></td>
<td><%= res.getString("lastname") %></td>
<td><%= res.getString("email")  %></td>
<td><%= res.getString("mobileno") %></td>
<td><%= res.getString("password") %></td>
<td><%= res.getString("r_date") %></td>
</tr>

<%} %>

</tbody>
</table>
</div>

</body>
</html>