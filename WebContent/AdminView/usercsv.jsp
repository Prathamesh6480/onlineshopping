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
	<th>User ID</th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Email</th>
	<th>Mobile no</th>
	<th>Password</th>
	<th>Date</th>
	</tr>
<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition","inline; filename=customer.xls");
Connection con = ConnectionProvider.getConnection();
Statement stmt;
try
{
int sno=0;	
String query = "select * from userregistertb";
stmt = con.createStatement();
ResultSet res = stmt.executeQuery(query);
while(res.next())
{
	++sno;
	%>
	
	<tr>
	<td><%= sno %></td>
	<td><%= res.getString("userid")  %> </td>
	<td><%=res.getString("firstname")  %></td>
	<td><%= res.getString("lastname") %></td>
	<td><%= res.getString("email")  %></td>
	<td><%= res.getString("mobileno") %></td>
	<td><%= res.getString("password") %></td>
	<td><%= res.getString("r_date") %></td>
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