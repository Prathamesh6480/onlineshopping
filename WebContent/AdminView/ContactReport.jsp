<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page import="com.dao.EnquiryDao" %> 
<%@ page import="com.entities.UserEnquiry" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
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
<div style="padding:10px;">


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
</div>

<div style="padding:10px;Width:100%">
<table style="width:100%;">
<tr>
<th align="left"><Span style="font-size:35px;">View User Enquiry</Span></th>
<th align="right"><form action="" method="get">Enquiry id: <input type="text" name="search" placeholder="Search here.." class="inp"></form></th>
</tr>
</table>
<br>
 <table id="customers">
<thead>
<tr>
<th>Enquiry ID</th>
<th>Full Name</th>
<th>Contact no</th>
<th>email</th>
<th>Subject</th>
<th>Message</th>
<th>Date</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
String category=request.getParameter("search");
EnquiryDao dao=new EnquiryDao(ConnectionProvider.getConnection());
List<UserEnquiry> list =dao.getAllEnquiry();
//List<AddProduct> list=dao.getAllProduct(category);
for(UserEnquiry enquiry:list)
{
%>
<tr>
<td><%= enquiry.getEnquiry_id() %></td>
<td><%= enquiry.getFullname() %></td>
<td><%= enquiry.getContact() %></td>
<td><%= enquiry.getEmail() %></td>
<td><%= enquiry.getSubject() %></td>
<td><%= enquiry.getMessage() %></td>
<td><%= enquiry.getDatetime() %></td>
<td><a href="email.jsp?id=<%=enquiry.getEnquiry_id() %>">Send Mail</a></td>
</tr>
<%} %>

</tbody>
</table>
</div>
</body>
</html>