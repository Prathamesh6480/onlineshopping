<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page import="com.dao.ProductDao" %> 
 <%@ page import="com.entities.AddProduct" %>
 <%@ page import="com.helper.ConnectionProvider" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="includes/head.jsp" %>
<title>Product Information</title>
   <style type="text/css">  table
        {
            width:100%;
  margin-left: auto;
  margin-right: auto;
        }
        th,td
        {
             padding:10px;
             width:10%;
             text-align:left;
            
        }
            .inp{
width: 240px;
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
           
        
    </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
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
   
<h1>Product Information</h1>



<%
int id=Integer.parseInt(request.getParameter("id"));
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
AddProduct ap=dao.getProductEditById(id);
%>

<form method="post" action="../EditProductServlet">
<input type="hidden"name="id"  value="<%= ap.getProduct_id() %>">
<table>
<tr>
<th>Product Name</th><td><%= ap.getProudct_name() %></td>
<th>Company</th><td><%= ap.getProduct_category() %></td>

</tr>

<tr>
<th>product Category</th><td><%= ap.getProduct_subcat() %></td>
<th>product type</th><td><%= ap.getProduct_type() %></td>
</tr>
<tr>
<th>Product Color</th><td><%= ap.getProduct_color() %></td>
<th>Product Size</th><td><%= ap.getProduct_size() %></td>
</tr>

<tr>
<th>Product Stock</th><td><%= ap.getProduct_stock() %></td>
<th>Product MRP</th><td>&#8377 <%= ap.getProduct_mrp() %></td>
</tr>
<tr>
<th>Purchase Price</th><td>&#8377 <%= ap.getPurchase_price() %></td>
<th>Sales Price</th><td>&#8377 <%= ap.getSales_price() %></td>
</tr>
<tr>
<th>Product GST</th><td><%= ap.getProduct_gst() %> %</td>
<th>GST Price</th><td>&#8377 <%= ap.getGst_price() %> </td>
</tr>

<tr>
<th>Discount Price</th><td>&#8377 <%= ap.getDiscount_price() %></td>
<th>Product Discount</th><td><%= ap.getProduct_discount() %> %</td>
</tr>

<tr>
<th>Product Price</th><td>&#8377 <%= ap.getProduct_price() %></td>
<th>Status</th><td><%= ap.getStatus() %></td>
</tr>

<tr>
<th >Product Specification</th>
<td colspan="3"><%= ap.getProduct_specification() %></td>
</tr>


</table>
</form>

</body>
</html>