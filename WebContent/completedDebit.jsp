<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="database.dropdown"%>
<%@ page import="database.db"%>
<%
int id = 0;
String accno = "", naration = "";
String date = "";
double amt = 0, bal = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw</title>
<link rel="stylesheet" type="text/css" href="css/savingsaccount.css">
</head>
<body>
	<form action = "homepage.jsp">
		<table height="400px" width="600px">
			<tr>
				<th class="top" colspan="2" height="100px"><h1>Withdraw
						Successful</h1></th>
			</tr>
			<%
			String trn = "select * from transaction";
			db.select(trn);
			while (db.rs.next()) {
				id = db.rs.getInt("id");
				accno = db.rs.getString("account_no");
				date = db.rs.getString("trn_date");
				amt = db.rs.getDouble("amount");
				naration = db.rs.getString("naration");
				bal = db.rs.getDouble("balance");
			}
			%>
			<tr>
				<br>
			</tr>
			<tr>
				<th>Transaction Id:</th>
				<td><%=id%></td>
			</tr>
			<tr>
				<th>Account No:</th>
				<td><%=accno%></td>
			</tr>
			<tr>
				<th>Transaction Date:</th>
				<td><%=date%></td>
			</tr>
			<tr>
				<th>Transaction Type:</th>
				<td>Withdraw</td>
			</tr>
			<tr>
				<th>Transaction Mode:</th>
				<td>Cashier</td>
			</tr>
			<tr>
				<th>Amount:</th>
				<td><%=amt%></td>
			</tr>
			<tr>
				<th>Naration:</th>
				<td><%=naration%></td>
			</tr>
			<tr>
				<th>Balance:</th>
				<td><%=bal%></td>
			</tr>
			<tr>
				<th class="bottom" colspan="2" height="80px">
				<input type="submit" value="Close" style="margin-right: 30px"></th>
			</tr>

		</table>
	</form>
</body>
</html>