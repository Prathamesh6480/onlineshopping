<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*"%>
    <%@ page import="com.helper.ConnectionProvider" %>
<!DOCTYPE html>

<html>
<body>
<table>
<tr>
    <th>S No</th>
	<th>Product ID</th>
	<th>Product</th>
	<th>Company</th>
	<th>Category</th>
	<th>Stock</th>
	<th>MRP</th>
	<th>Purchase Price</th>
	<th>Sales Price</th>
	<th>GST</th>
	<th>GST Price</th>
	<th>Discount</th>
	<th>Discount Price</th>
	<th>Price</th>
	</tr>
<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition","inline; filename=productdata.xls");
Connection con = ConnectionProvider.getConnection();
Statement stmt;
try
{
	int sno=0;
String query = "select * from producttb1";
stmt = con.createStatement();
ResultSet res = stmt.executeQuery(query);
while(res.next())
{
	++sno;
	%>
	
	<tr>
	<td><%= sno %></td>
	<td><%= res.getString("product_id")  %> </td>
	<td><%=res.getString("product_name")  %></td>
	<td><%= res.getString("product_category") %></td>
	<td><%= res.getString("product_type")  %></td>
	<td><%= res.getString("product_stock") %></td>
	<td><%= res.getString("product_mrp") %></td>
	<td><%= res.getString("purchase_price") %></td>
	<td><%= res.getString("sales_price")  %> </td>
	<td><%=res.getString("product_gst")  %></td>
	<td><%= res.getString("gst_price") %></td>
	<td><%= res.getString("discount_price")  %></td>
	<td><%= res.getString("product_discount") %></td>
	<td><%= res.getString("product_price") %></td>
	</tr>
	<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>