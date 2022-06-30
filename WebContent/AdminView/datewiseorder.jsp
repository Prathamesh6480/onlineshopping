<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*"%>
    <%@ page import="com.helper.ConnectionProvider" %>
<!DOCTYPE html>

<html>
<body>
<table>
<tr>
	<th>Order ID</th>
	<th>User ID </th>
	<th>Product ID</th>
	<th>Order Name</th>
	<th>Quantity</th>
	<th>MRP</th>
	<th>Sales Price</th>
	<th>GST</th>
	<th>Discount</th>
	<th>Price</th>
	<th>Total Price</th>
	<th>Name</th>
	<th>Email</th>
	<th>Mobile</th>
	<th>Address</th>
	<th>District</th>
	<th>City</th>
	<th>State</th>
	<th>Zip</th>
	<th>Payment Mode</th>
	<th>Status</th>
	<th>Complete Date</th>
	</tr>
<%
String form_date = request.getParameter("form_date"); 
String to_date = request.getParameter("to_date"); 
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition","inline; filename="+form_date+" To "+to_date+"orders.xls");
Connection con = ConnectionProvider.getConnection();
Statement stmt;
try
{

String query = "SELECT * FROM orders WHERE completedate BETWEEN '"+form_date+"' and '"+to_date+"' ";
stmt = con.createStatement();
ResultSet res = stmt.executeQuery(query);
while(res.next())
{
	%>
	
	<tr>
	<td><%= res.getString("orderid")  %> </td>
	<td><%=res.getString("userid")  %></td>
	<td><%= res.getString("productid") %></td>
	<td><%= res.getString("product_name")  %></td>
	<td><%= res.getString("quantity") %></td>
	<td><%= res.getString("product_mrp") %></td>
	<td><%= res.getString("sales_price") %></td>
	<td><%= res.getString("gst") %></td>
	<td><%= res.getString("product_discount")  %> </td>
	<td><%= res.getString("productprice") %></td>
	<td><%= res.getString("total_price") %></td>
	<td><%= res.getString("firstname")  %> <%= res.getString("lastname")  %></td>
	<td><%=res.getString("email")  %></td>
	<td><%= res.getString("mobile") %></td>
	<td><%= res.getString("address")  %></td>
	<td><%= res.getString("district") %></td>
	<td><%= res.getString("city") %></td>
	<td><%= res.getString("state") %></td>
	<td><%= res.getString("zip") %></td>
	<td><%= res.getString("paymentmode") %></td>
	<td><%= res.getString("status") %></td>
	<td><%= res.getString("completedate") %></td>
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