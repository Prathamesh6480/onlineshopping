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
	<th>Supplier ID</th>
	<th>Supplier Name</th>
	<th>Company</th>
	<th>Type of Firm</th>
	<th>Status Of Company</th>
	<th>Email</th>
	<th>Country</th>
	<th>state</th>
	<th>Address 1</th>
	<th>Address 2</th>
	<th>contact</th>
	<th>Zip</th>
	<th>Pan no</th>
	</tr>
<%
int sno=0;
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition","inline; filename=supplierdata.xls");
Connection con = ConnectionProvider.getConnection();
Statement stmt;
try
{
	
String query = "select * from supplier";
stmt = con.createStatement();
ResultSet res = stmt.executeQuery(query);
while(res.next())
{
	++sno;
	%>
	
	<tr>
	<td><%= sno %></td>
	<td><%= res.getString("supplier_id")  %> </td>
	<td><%=res.getString("supplier_name")  %></td>
	<td><%= res.getString("company") %></td>
	<td><%= res.getString("typeoffirm")  %></td>
	<td><%= res.getString("statusofcompany") %></td>
	<td><%= res.getString("email") %></td>
	<td><%= res.getString("country") %></td>
	<td><%= res.getString("state")  %> </td>
	<td><%=res.getString("address1")  %></td>
	<td><%= res.getString("address2") %></td>
	<td><%= res.getString("contact")  %></td>
	<td><%= res.getString("zip") %></td>
	<td><%= res.getString("panno") %></td>
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