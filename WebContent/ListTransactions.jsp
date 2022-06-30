<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="database.dropdown"%>
<%@ page import="database.db"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
<link rel="stylesheet" type="text/css" href="css/savingsaccount.css">
</head>
<body>
	<%
HttpSession session1 = request.getSession();
int customer_id =1;
int id=0;
Date trn_date;
String account_no="";
int trn_mode=0;
String naration="";
int trn_type=0;
double amount=0;
double balance=0;

%>
	<input type=hidden name=id value=<%=id%>>
	<table width="700px">
		<tr>
			<th class="top" colspan="7">Transactions</th>
		</tr>
		<tr>
			<td>Date</td>
			<td>Account No</td>
			<td>Mode</td>
			<td>Naration</td>
			<td>Type</td>
			<td>Amount</td>
			<td>Balance</td>
		</tr>
		<% 
	try
	{
		db.select("select "
				+"transaction.id,"
				+"transaction.trn_date,"
				+"transaction.account_no,"
				+"transaction.trn_mode,"
				+"transaction.naration,"
				+"transaction.trn_type,"
				+"transaction.amount,"
				+"transaction.balance "
				+"from account,transaction "
				+"where transaction.account_id=account.id "
				+"and account.customer_id="+customer_id);
		if(db.rs!=null)
		while(db.rs.next()){
			id=db.rs.getInt("id");
			System.out.println("id="+id);
			trn_date=db.rs.getDate("trn_date");
			account_no=db.rs.getString("account_no");
			trn_mode=db.rs.getInt("trn_mode");
			naration=db.rs.getString("naration");
			trn_type=db.rs.getInt("trn_type");
			amount=db.rs.getDouble("amount");
			balance=db.rs.getDouble("balance");
		%>
		<tr>
			<td><%=trn_date%></td>
			<td><%=account_no%></td>
			<td><%=dropdown.getValue("Transaction Mode",trn_mode) %></td>
			<td><%=naration%></td>
			<td><%=dropdown.getValue("Transaction type",trn_type) %></td>
			<td><%=amount%></td>
			<td><%=balance%></td>
		</tr>
		<% 		}
	}
	catch(Exception e){
		System.out.println(e);	
	}
%>
	</table>


</body>
</html>