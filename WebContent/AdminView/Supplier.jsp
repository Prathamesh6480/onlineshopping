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
<title>Supplier form</title>
<style>  
table
{
width:100%;
} 
 th,td
 {
 padding:10px;
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
	<div  style="width:100%;padding:15px">
	<c:if test="${not empty succMsg }">
<p style="color:green;">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failedMsg }">
<p style="color:red;">${failedMsg}</p>
<c:remove var="failedMsg" scope="session"/>
</c:if>
            <h2 style="text-align:center;color:red;">Supplier Form</h2>
            <form action="../SupplierServlet" method="post">
            <table>
             <tr>
             <th>Supplier name</th>
           <td><input type="text" name="suppliername" class="inp" placeholder="supplier name.." required></td>
           <th>Comapany name</th>
           <td><input type="text" name="company" maxlength="15"class="inp" placeholder="company name.." required></td>
           
             </tr>
            <tr>
            <th>Type of firm</th>
             <td>
           <select class="inp" name="typeoffirm" >
            <option selected disabled>-------Type of the firm--------</option>
            <option value="Public Limited Co">Public Limited Co</option>
            <option value="Partnership Co">Partnership Co</option>
            <option value="Proprietorship">PVT Limited</option>
            <option value="Govt Sector">Govt Sector</option>
            </select>
            </td>
           <th>Status of company</th>
           <td>
            <select class="inp" name="statusofcompany">
            <option selected disabled>-------Status of company--------</option>
            <option value="manufacturer">MANUFACTURER</option>
            <option value="authoriseddealer">AUTHORISED DEALER</option>
            <option value="stockist/trader">STOCKIST/TRADER</option>
            <option value="serviceprovider">SERVICE PROVIDER</option>
            </select>
           </td>
             </tr>
             <tr>
             <th>Email</th>
             <td><input type="text" name="email" class="inp" placeholder="supplier email.." required></td>
              <th>Country name</th>
            <td><input type="text" name="country" class="inp" value="India" placeholder="Country name.."></td>
             </tr>
              <tr>
                  
           <th>State name</th>
            <td>
            
            <select id="state" name="state" class="inp" required>
            <option selected disabled>---state name----</option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="Puducherry">Puducherry</option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telangana">Telangana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="West Bengal">West Bengal</option>
</select>
            </td>
            <th>Contact number</th>
            <td><input type="text" name="contact" maxlength="10" class="inp" placeholder="Contact no.." required></td>
              
             </tr>
              <tr>
              
              <th>Address 1</th>
            <td><textarea rows="4" name="address1" class="inp"  placeholder="Adress 1.." required></textarea> </td>
            <th>Address 2</th>
            <td><textarea rows="4" name="address2" class="inp"  placeholder="Address 2.."  required></textarea>
           </td>
            
             </tr>
               <tr>
               <th>Zip code</th>
            <td><input type="text" name="zip" maxlength="6"class="inp" placeholder="zip.." required></td>
               <th>Pan No</th>
            <td><input type="text" name="panno" maxlength="10" class="inp" placeholder="Pan no.." required></td>
             </tr>
             <tr>
             <td></td>
             <td> <input type="submit" name="categoryadd" value="Add" class="bt" /></td>
                </tr>
            </table>
            </form>
        </div>
       
</body>
</html>