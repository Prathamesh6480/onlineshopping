<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.dao.CategoryDao" %> 
 <%@ page import="com.entities.ProductCategory" %>
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
     </style><link href="ppstylesheet/mystyle.css" rel="stylesheet"/>
</head>
<body>

 <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

   <%@ include file="includes/header.jsp" %>
   
<div style="overflow:auto;width:100%;padding:10px;">
	<div class="subcategory1">
	<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
            <h2 style="color:red;">Add Categories</h2>
            <form action="../CategoryServlet" method="post">
            <table>
            <tr>
            <td><label style="color:#990033;font-size:15px;">Supplier ID:</label></td>
            <td>
               <select class="inp" name="supplierid">
            <option selected disabled>-------Select Supplier id--------</option>
            <%
            SupplierDao d= new SupplierDao(ConnectionProvider.getConnection());
                                                            List<Supplier> list=d.getAllSupplier();
                                                            for(Supplier supplier : list)
                                                            {
            %>
            	 <option value="<%=supplier.getSupplier_id() %>"><%=supplier.getSupplier_id() %> <%=supplier.getSupplier_name()%></option>	
        
              <%
	                      }
	                      %>
            </select>
            </td>
            </tr>
            <tr>
            
            <td><label style="color:#990033;font-size:15px;">Supplier Name:</label></td>
            <td>
            <select class="inp" name="suppliername">
            <option selected disabled>-------Select Company name--------</option>
            <%
             for(Supplier supplier : list)
                                                            {
            %>
            	 <option value="<%=supplier.getCompany()%>"><%=supplier.getCompany()%></option>	
        
              <%
	                      }
	                      %>
            </select>
            </td>
             </tr>
             <tr>
            <td><label style="color:#990033;font-size:15px;">Category name:</label></td>
            <td><input type="text" name="categoryname" class="inp"  placeholder="add category type.." >
           </td>
             </tr>
             <tr><td></td>
             <td> <input type="submit" name="categoryadd" value="Add" class="bt" /></td>
                </tr>
            </table>
            </form>
        </div>
        <div class="subcategory2">
                <h2 style="color:red;">Manage Category</h2>
            <br />
           <table>
           <tr>
               <td>Category ID</td>
           <td>Supplier ID</td>
           <td>Supplier Name</td>
           <td>Category Name</td>
           <td>Action</td>
           </tr>
               <%
               CategoryDao dao= new CategoryDao(ConnectionProvider.getConnection());
                                             List<ProductCategory> list1=dao.getAllCategory();
                                         for(ProductCategory cc : list1)
                                         {
               %>
        	  <tr>
           <td><%= cc.getCategoryid() %></td>
           <td><%= cc.getSupplierid() %></td>
             <td><%= cc.getSuppliername() %></td>
               <td><%= cc.getCategoryname() %></td>
<td><a href="../DeleteCategoryServlet?id=<%= cc.getCategoryid() %>">Delete</a></td>
           </tr>
        	<%    
           }
			
           %>
           </table>
        </div>
        </div>
</body>
</html>