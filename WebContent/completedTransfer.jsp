<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="database.dropdown"%>
<%@ page import="database.db"%>
<!DOCTYPE html>
<html>
<head>
<style>
th,td
{
	padding-left:7px;
	text-align:center;
	border:0.5px solid black;
}
</style>

<meta charset="ISO-8859-1">
<title>Transfer</title>
<%
int idFrom = 0, idTo = 0, maxNoId = 0;
String accnoFrom = "", accnoTo = "", narationFrom = "", narationTo = "";
String dateFrom = "", dateTo = "";
double amt = 0, balTo = 0, balFrom = 0;
%>
<link rel="stylesheet" type="text/css" href="css/savingsaccount.css">
</head>
<body>
	<form action="homepage.jsp">
		<table height="600px" width="800px">
			<tr>
				<th class="top" colspan="3" height="100px"><h1>Transfer
						Successful</h1></th>
			</tr>
			<%
			String maxId = "select max(id) from transaction";
			db.select(maxId);
			while (db.rs.next()) {
				maxNoId = db.rs.getInt(1);
			}

			String trnTo = "select * from transaction where id = " + maxNoId;
			db.select(trnTo);
			while (db.rs.next()) {
				idTo = db.rs.getInt("id");
				accnoTo = db.rs.getString("account_no");
				dateTo = db.rs.getString("trn_date");
				amt = db.rs.getDouble("amount");
				narationTo = db.rs.getString("naration");
				balTo = db.rs.getDouble("balance");
			}

			String trnFrom = "select * from transaction where id = " + (maxNoId - 1);
			db.select(trnFrom);
			while (db.rs.next()) {
				idFrom = db.rs.getInt("id");
				accnoFrom = db.rs.getString("account_no");
				dateFrom = db.rs.getString("trn_date");
				amt = db.rs.getDouble("amount");
				narationFrom = db.rs.getString("naration");
				balFrom = db.rs.getDouble("balance");
			}
			%>
			<tr>
				<th>Feilds</th>
				<th>From</th>
				<th>To</th>
			</tr>
			<tr>
				<th>Transaction Id:</th>
				<td><%=idFrom%></td>
				<td><%=idTo%></td>
			</tr>
			<tr>
				<th>Account No:</th>
				<td><%=accnoFrom%></td>
				<td><%=accnoTo%>
			</tr>
			<tr>
				<th>Transaction Date:</th>
				<td><%=dateFrom%></td>
				<td><%=dateTo%></td>
			</tr>
			<tr>
				<th>Transaction Type:</th>
				<td>Withdraw</td>
				<td>Deposit</td>
			</tr>
			<tr>
				<th>Transaction Mode:</th>
				<td>Transfer</td>
				<td>Transfer</td>
			</tr>
			<tr>
				<th>Amount:</th>
				<td><%=amt%></td>
				<td><%=amt%></td>
			</tr>
			<tr>
				<th>Naration:</th>
				<td><%=narationFrom%></td>
				<td><%=narationTo%></td>
			</tr>
			<tr>
				<th>Balance:</th>
				<td><%=balFrom%></td>
				<td><%=balTo%>
			</tr>
			<tr>
				<th class="bottom" colspan="3" height="80px"><input
					type="submit" value="Close" style="margin-right: 30px"></th>
			</tr>
		</table>
	</form>
</body>
</html>