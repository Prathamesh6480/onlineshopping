<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.ProductDao" %>
<%@ page import="com.dao.SupplierDao" %> 
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
 th,td
 {
 padding:7px;
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
      <link href="ppstylesheet/mystyle.css" rel="stylesheet"/>
</head>
<body>
   <%@ include file="includes/header.jsp" %>
   
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
 
        <div class="category2">
                <h2 style="color:red;">Supplier Details</h2>
            <br />
           <table id="customers">
           <tr>
           <th>supplier id</th>
           <th>supplier name</th>
           <th>Company</th>
           <th>Type of firm</th>
           <th>Status of company</th>
           <th>email</th>
           <th>contact</th>
          
           
           <th colspan="3">Action</th>
           </tr>
           
           <%
                      SupplierDao dao= new SupplierDao(ConnectionProvider.getConnection());
                                                       List<Supplier> list=dao.getAllSupplier();
                                                       for(Supplier supplier : list)
                                                       {
                                                    	   
                      %>
        	  <tr>
          
             <td><%= supplier.getSupplier_id() %></td>
           <td><%= supplier.getSupplier_name() %></td>
          <td><%= supplier.getCompany() %></td>
           <td><%= supplier.getTypeoffirm() %></td>
              <td><%= supplier.getStatusofcompany() %></td>
           <td><%=  supplier.getEmail() %></td>
           
              <td><%= supplier.getContact() %></td>
         <td><a href="ViewSupplier.jsp?id=<%=supplier.getSupplier_id()%>">View</a></td>
         <td><a href="EditSupplier.jsp?id=<%=supplier.getSupplier_id()%>">Edit</a></td>
<td><a href="../DeleteSupplierServlet?id=<%= supplier.getSupplier_id()%>">Delete</a></td>
           </tr>
        	<%    
           }
			
           %>
         
           </table>
        </div>
</body>
</html>