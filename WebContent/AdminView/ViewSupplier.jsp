<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.SupplierDao" %> 
<%@ page import="com.dao.ProductDao" %> 
 <%@ page import="com.entities.Supplier" %>
 <%@ page import="com.helper.ConnectionProvider" %>
  <%@ page import="java.util.*" %>
  <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <%@ include file="includes/head.jsp" %>
  
 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>  
     th
     {
         padding:5px;
         color:maroon;
         font-size:20px;
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
<body>
<%@ include file="includes/header.jsp" %>
    <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>


 
<div style="overflow:auto;width: 100%;padding:10px;">

            <h2 style="text-align:center;color:red;">view Supplier Details</h2>
            <br>
            <form action="../EditSupplierServlet" method="post">
            
             <%
 int id=Integer.parseInt(request.getParameter("id"));
  SupplierDao dao=new SupplierDao(ConnectionProvider.getConnection());
  Supplier supplier=dao.getSupplierEditById(id);
 %>
            <input type="hidden"name="id"  value="<%= supplier.getSupplier_id() %>">
            
             <table>
             <tr>
             <th>Supplier name:</th><td><%= supplier.getSupplier_name() %></td>
             <th>Company:</th>
              <td><%= supplier.getCompany() %>s</td>
             <th>Type of firm: </th>
            <td> <%= supplier.getTypeoffirm() %></td>
             </tr>
             <tr>
             <th>Status of company</th>    <td><%= supplier.getStatusofcompany() %></td>
             <th>Email</th><td><%= supplier.getEmail() %></td>
               <th>Country name</th><td><%= supplier.getCountry() %></td>
             </tr>
             <tr>
             <th>State name</th>    <td><%= supplier.getState() %></td>
             <th>Address 1</th><td><%= supplier.getAddress1() %></td>
              <th>Address 2</th><td><%= supplier.getAddress2() %></td>
             </tr>
             
             <tr>
              <th>Contact number</th> <td><%= supplier.getContact() %></td>
              <th>Zip code</th> <td><%= supplier.getZip() %></td>
              <th>Pan No</th><td><%= supplier.getPanno() %></td>
              </tr>
            
            
            </table>
           </form>
        </div>
</body>
</html>