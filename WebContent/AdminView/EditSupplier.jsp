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
<body>
<%@ include file="includes/header.jsp" %>
    <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>


 
<div style="overflow:auto;width: 100%;padding:10px;">

            <h2 style="text-align:center;color:red;">Update Supplier Details</h2>
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
             <th>Supplier name</th>
             <th>Company</th>
             <th>Type of firm</th>
             <th>Status of company</th>
             <th>Email</th>
               <th>Country name</th>
               
             </tr>
             <tr>
           <td><input type="text" name="suppliername" class="inp" value="<%= supplier.getSupplier_name() %>"></td>
           <td><input type="text" name="company" maxlength="15"class="inp" value="<%= supplier.getCompany() %>"></td>
            <td>
            <input type="text" name="typeoffirm" class="inp" value="<%= supplier.getTypeoffirm() %>">
            </td>
             
           <td>
           
          <input type="text"  name="statusofcompany"  class="inp" value="<%= supplier.getStatusofcompany() %>">
           </td>
           
            <td><input type="text" name="email" class="inp" value="<%= supplier.getEmail() %>"></td>
            <td><input type="text" name="country" class="inp" value="<%= supplier.getCountry() %>"></td>
        
           
             </tr>
             <tr>
           
             <th>State name</th>
             <th>Address 1</th>
              <th>Address 2</th>
              <th>Contact number</th>
              <th>Zip code</th>
              <th>Pan No</th>
              </tr>
              <tr>
                <td><input type="text" id="state" name="state" class="inp" value="<%= supplier.getState() %>"></td>
           <td><textarea rows="4" name="address1" class="inp"><%= supplier.getAddress1() %></textarea> </td>
           <td><textarea rows="4" name="address2" class="inp" ><%= supplier.getAddress2() %></textarea></td>
             <td><input type="text" name="contact" maxlength="15" class="inp" value="<%= supplier.getContact() %>"></td>
            <td><input type="text" name="zip" maxlength="6"class="inp" value="<%= supplier.getZip() %>"></td>
            <td><input type="text" name="panno" maxlength="10" class="inp" value="<%= supplier.getPanno() %>"></td>
            
            
             </tr>
              <tr>
              
              </tr>
              <tr>
            </tr>
             <tr>
             <td></td>
             <td> <input type="submit" value="Update" class="bt" /></td>
                </tr>
            </table>
           </form>
        </div>
</body>
</html>