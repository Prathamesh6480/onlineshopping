<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Servlet.transfer"%>
<%@ page import="database.dropdown"%>
<%@ page import="database.db"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer</title>
<link rel="stylesheet" type="text/css" href="css/savingsaccount.css">
</head>
<body>

<!-- http://localhost:8080/OnlineShopping/transfer?account_id=1&accnoTo1=1&accnoTo2=1&transferAmt=1&naration=onlinepurchase&ifsc=SBID1015&first_name=1 -->
	
	<% 
	
	 String firstname =(String)session.getAttribute("firstname");
	db.select("select * from customer where first_name="+firstname);
	
	db.rs.next();
	int customer_id=db.rs.getInt("id");
	String s=db.rs.getString("first_name")+" "+db.rs.getString("middle_name")+" "+db.rs.getString("last_name");%>
	<form action="transfer" method="post">
		<table align="center" height="500px" width="700px">
			<tr>
				<th class="top" colspan="2" height="100px"><h1>Transfer
						Funds<br></h1></th>
			</tr>
			<tr>
				<th align="right">Select From Account :</th>
				<td>
					<%
					db.select("select account.id, account.account_no,CONCAT(account.account_no,'-',bank.bank_name,'-',branch.branch_name,'-',value) account_no1 from account,bank,branch,lookup where account.bank_id=bank.id and account.branch_id=branch.id and lookup.type='Account Type' and account.account_type=lookup.icode  and account.customer_id="+customer_id);
					%> <%=dropdown.getSelecttagTable("account_id", "account_no1", 0)%>
				</td>
			</tr>
			<tr>
				<th align="right">Account No of Beneficiary :</th>
				<td><input type="text" name="accnoTo1" required></td>
			</tr>
			<tr>
				<th align="right">Re-Enter Account No of Beneficiary :</th>
				<td><input type="text" name="accnoTo2" required></td>
			</tr>
			<tr>
				<th align="right">Amount to Transfer :</th>
				<td><input type="text" name="transferAmt" required></td>
			</tr>
			<tr>
				<th align="right">Narration :</th>
				<td><input type="text" name="naration" required></td>
			</tr>
			<tr>
				<th align="right">IFSC :</th>
				<td><input type="text" name="ifsc" required></td>
			</tr>
			<tr>
				<th align="right">Account Holder :</th>
				<td><input type="text" name="first_name" style="margin-right: 80px" required></td>
			</tr>
			<tr>
				<th class="bottom" colspan="2" height="65px"><input
					type="submit" value="Confirm" style="margin-right: 30px"> <input
					type="reset" value="Clear" style="margin-left: 30px"></th>
			</tr>
		</table>
	</form>
</body>
</html>