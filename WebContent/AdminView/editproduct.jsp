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
<title>Edit Proudct</title>
   <style type="text/css">  table
        {
            width:80%;
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
   
<h1>Edit Product</h1>



<%
int id=Integer.parseInt(request.getParameter("id"));
ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
AddProduct ap=dao.getProductEditById(id);
%>

<form method="post" action="../EditProductServlet">
<input type="hidden"name="id"  value="<%= ap.getProduct_id() %>">
<table>
<tr>
<th>Product Name</th>
<th>Product Category</th>
<th>product subCategory</th>
<th>product type</th>
<th>Product Color</th>


</tr>
<tr>
<td><input type="text" class="inp" name="productname"  value="<%= ap.getProudct_name() %>"></td>
<td><input type="text"  class="inp"  name="productcategory" value="<%= ap.getProduct_category() %>" ></td>
<td><input type="text"  class="inp"  name="productsubcat" value="<%= ap.getProduct_subcat() %>"></td>
<td><input type="text"  class="inp"  name="producttype" value="<%= ap.getProduct_type() %>"></td>
<td><input type="text"  class="inp"  name="productcolor" value="<%= ap.getProduct_color() %>"></td>

</tr>
<tr>
<th>Product Size</th>
<th>Product Specification</th>
<th>Product Stock</th>
<th>Product MRP</th>
<th>Purchase Price</th>


</tr>

<tr>
<td><input type="text"  class="inp"  name="productsize" value="<%= ap.getProduct_size() %>" ></td>
<td><textarea rows="5" class="inp"  name="productspecification"><%= ap.getProduct_specification() %></textarea></td>
<td><input type="text"  class="inp"  name="productstock" value="<%= ap.getProduct_stock() %>" ></td>
<td><input type="text" id="mrp"  class="inp" name="productmrp" value="<%= ap.getProduct_mrp() %>" ></td>
<td><input type="text" id="purchaseprice"  class="inp" name="purchaseprice"  value="<%= ap.getPurchase_price() %>" ></td>

</tr>

<tr>
<th>Sales Price</th>
<th>Product GST</th>
<th>GST Price</th>
<th>Discount Price</th>
<th>Product Discount</th>


</tr>

<tr>
<td><input type="text" id="sellprice"  class="inp" name="sellingprice" value="<%= ap.getSales_price() %>" ></td>
<td><input type="text"  id="gst" class="inp"  name="productgst" value="<%= ap.getProduct_gst() %>" ></td>
<td><input type="text" id="gstprice" class="inp"  name="gstprice" value="<%= ap.getGst_price() %>" ></td>

<td><input type="text" id="dprice" class="inp"  name="discountprice" value="<%= ap.getDiscount_price() %>" ></td>
<td><input type="text" id="dicount"  class="inp"  name="productdiscount" value="<%= ap.getProduct_discount() %>" ></td>


</tr>
<tr>
<th>Product Price</th>
<th>Status</th>
</tr>
<tr></tr>

<tr>
<td><input type="text"  id="productprices"  class="inp"  name="productprice" value="<%= ap.getProduct_price() %>" ></td>
<td><select name="status" class="inp" >
<% if("Active".equals(ap.getStatus()))
{%>
<option value="Active">Active</option>
<option value="Inctive">InActive</option>
<%
}else{%>
<option value="Active">Active</option>
<option value="Inctive">InActive</option>
<%}
%>
</select></td>
</tr>
<tr>
<td><input type="submit" class="bt" value="Update" ></td>
</tr>
</table>
</form>

</body>
</html>