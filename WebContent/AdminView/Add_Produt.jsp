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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="includes/head.jsp" %>
 <style>
        table
        {
            width:80%;
  margin-left: auto;
  margin-right: auto;
        }
        th,td
        {
             padding:10px;
             width:16%;
             text-align:left;
        }
            .inp{
width: 250px;
  padding: 8px;
  border: 1px solid orange;
  border-radius: 4px;
  resize: vertical;
}
            
         .bt {
  width: 250px;
  background-color:tomato;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
}
           
         td
         {
             padding:5px;
         }
    </style><script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script type="text/javascript">


    $(document).ready(function()
    {
    	$("#mrp,#sellprice,#gst").keyup(function()
    			{
    		var gstprices=0;
    		var a=Number($("#mrp").val());
    		var x=Number($("#sellprice").val());
    		
    		
    		var y=Number($("#gst").val());
    		var gstprices=(x/100)*y;
    		$("#gstprice").val(gstprices);
    		
    		if(gstprices!==0)
    			{
    			
    			gstprices += parseFloat(x);
    			}
    		
    		$("#productprices").val(gstprices);
    		
    		var add=a-gstprices;
    		$("#dprice").val(add);
    		
    		if(add!==0)
    		{
    			var discount = (add/a)*100;
    			
    		}
    		$("#dicount").val(discount);
    		});
    	
    });
 
    </script>
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
<br>
<h1 align="center">Add Product</h1>

<form method="post" action="../ProductServlet" enctype="multipart/form-data">
<table>
<tr>
<td>Product Name</td>
<td><input type="text" class="inp" name="productname" ></td>
<td>Company Name</td>
<td>
<select class="inp" name="productcategory" id="productcategory">
            <option value="0">-------Select Company--------</option>
            <% try {
            	
            	String query="select * from supplier";
            	Connection con = ConnectionProvider.getConnection();
            	Statement stmt =con.createStatement();
            	ResultSet res = stmt.executeQuery(query);
            	while(res.next())
            	{
            		%>
             <option value="<%=res.getString("company")%>"><%=res.getString("company") %></option>	
            		<% 
            	}
            }
            catch(Exception e)
            {
            	e.printStackTrace();
            	
            } %>
            
            </select>
</td>
</tr>

<tr>
<td>product Category</td>
<td>
<select class="inp" name="productsubcat"  >
            <option selected disabled>-------Select Category--------</option>
            <%
         
            CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
            HashSet<ProductCategory>set=dao.getOneCategory();

            for(ProductCategory pc:set)
            	
            { 
            	
            		%>
            		<option value="<%= pc.getCategoryname() %>"><%= pc.getCategoryname() %></option>
            		<%
            }%>
            </select>
</td>
<td>Product Type</td>
<td><input type="text"  class="inp"  name="producttype" ></td>
</tr>
<tr>
<td>Product Photo</td>
<td><input type="file"  class="inp"  name="productphoto" ></td>
<td>Product Color</td>
<td><input type="text"  class="inp"  name="productcolor" ></td>
</tr>

<tr>
<td>Product Size</td>
<td><input type="text"  class="inp"  name="productsize" ></td>
<td>Product Specification</td>
<td><textarea rows="4" class="inp"  name="productspecification" ></textarea></td>
</tr>
<tr>
<td>Product Stock</td>
<td><input type="text"  class="inp"  name="productstock" ></td>
<td>Product MRP</td>
<td><input type="text"  class="inp"  id="mrp" name="productmrp" ></td>
</tr>

<tr>
<td>Purchase Price</td>
<td><input type="text" id="purchaseprice"  class="inp"  name="purchaseprice"  ></td>
<td>Sales Price</td>
<td><input type="text" id="sellprice"  class="inp"  name="sellingprice"  ></td>
</tr>

<tr>
<td>Product GST %</td>
<td><input type="text" id="gst"  class="inp"  name="productgst" ></td>
<td>GST Price</td>
<td><input type="text" id="gstprice"  class="inp"  name="gstprice" ></td>
</tr>

<tr>
<td>Discount Price</td>
<td><input type="text" id="dprice"  class="inp"  name="discountprice" ></td>
<td>Product Discount %</td>
<td><input type="text" id="dicount"  class="inp" maxlength="4"  name="productdiscount" ></td>
</tr> 

<tr>
<td>Product Price</td>
<td><input type="text" id="productprices"  class="inp"  name="productprice" ></td>
<td>Status</td>
<td>
<select class="inp" name="status">
<option value="Active">Active</option>
<option value="Inctive">InActive</option>
</select></td>
</tr>
<tr>
<td></td>
<td><input type="submit" class="bt" value="Add" ></td>
</tr>
</table>
</form>


</body>
</html>