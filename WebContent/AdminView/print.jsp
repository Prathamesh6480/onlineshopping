<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
 <%@ page import="com.dao.CartDao" %> 
 <%@ page import="com.entities.Cart" %> 
 <%@ page import="com.entities.UserRegister" %> 
 <%@ page import="com.helper.ConnectionProvider" %>
 <%@ page import="java.util.*" %>
 <%@ page import="java.sql.*" %>
  <%@ page import="com.dao.OrderDao" %> 
 <%@ page import="com.entities.Order" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="utf-8">
		<title>Invoice</title>
		<link rel="stylesheet" href="style.css">
		<link rel="license" href="https://www.opensource.org/licenses/mit-license/">
		<script src="script.js"></script>
		<style>
		/* reset */

*
{
	border: 0;
	box-sizing: content-box;
	color: inherit;
	font-family: inherit;
	font-size: inherit;
	font-style: inherit;
	font-weight: inherit;
	line-height: inherit;
	list-style: none;
	margin: 0;
	padding: 0;
	text-decoration: none;
	vertical-align: top;
}

/* content editable */

*[contenteditable] { border-radius: 0.25em; min-width: 1em; outline: 0; }

*[contenteditable] { cursor: pointer; }

*[contenteditable]:hover, *[contenteditable]:focus, td:hover *[contenteditable], td:focus *[contenteditable], img.hover { background: #DEF; box-shadow: 0 0 1em 0.5em #DEF; }

span[contenteditable] { display: inline-block; }

/* heading */

h1 { font: bold 100% sans-serif; letter-spacing: 0.5em; text-align: center; text-transform: uppercase; }

/* table */

table { font-size: 75%; table-layout: fixed; width: 100%; }
table { border-collapse: separate; border-spacing: 2px; }
th, td { border-width: 1px; padding: 0.5em; position: relative; text-align: left; }
th, td { border-radius: 0.25em; border-style: solid; }
th { background: #EEE; border-color: #BBB; }
td { border-color: #DDD; }

/* page */

html { font: 16px/1 'Open Sans', sans-serif; overflow: auto; padding: 0.5in; }
html { background: #999; cursor: default; }

body { box-sizing: border-box; height: 11in; margin: 0 auto; overflow: hidden; padding: 0.5in; width: 8.5in; }
body { background: #FFF; border-radius: 1px; box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5); }

/* header */

header { margin: 0 0 3em; }
header:after { clear: both; content: ""; display: table; }

header h1 { background: #000; border-radius: 0.25em; color: #FFF; margin: 0 0 1em; padding: 0.5em 0; }
header address { float: left; font-size: 75%; font-style: normal; line-height: 1.25; margin: 0 1em 1em 0; }
header address p { margin: 0 0 0.25em; }
header span, header img { display: block; float: right; }
header span { margin: 0 0 1em 1em; max-height: 25%; max-width: 60%; position: relative; }
header img { max-height: 100%; max-width: 100%; }
header input { cursor: pointer; -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)"; height: 100%; left: 0; opacity: 0; position: absolute; top: 0; width: 100%; }

/* article */

article, article address, table.meta, table.inventory { margin: 0 0 3em; }
article:after { clear: both; content: ""; display: table; }
article h1 { clip: rect(0 0 0 0); position: absolute; }

article address { float: left; font-size: 125%; font-weight: bold; }

/* table meta & balance */

table.meta, table.balance { float: right; width: 36%; }
table.meta:after, table.balance:after { clear: both; content: ""; display: table; }

/* table meta */

table.meta th { width: 40%; }
table.meta td { width: 60%; }

/* table items */

table.inventory { clear: both; width: 100%; }
table.inventory th { font-weight: bold; text-align: center; }

table.inventory td:nth-child(1) { width: 26%; }
table.inventory td:nth-child(2) { width: 38%; }
table.inventory td:nth-child(3) { text-align: right; width: 12%; }
table.inventory td:nth-child(4) { text-align: right; width: 12%; }
table.inventory td:nth-child(5) { text-align: right; width: 12%; }

/* table balance */

table.balance th, table.balance td { width: 50%; }
table.balance td { text-align: right; }

/* aside */

aside h1 { border: none; border-width: 0 0 1px; margin: 0 0 1em; }
aside h1 { border-color: #999; border-bottom-style: solid; }

/* javascript */

.add, .cut
{
	border-width: 1px;
	display: block;
	font-size: .8rem;
	padding: 0.25em 0.5em;	
	float: left;
	text-align: center;
	width: 0.6em;
}

.add, .cut
{
	background: #9AF;
	box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	background-image: -moz-linear-gradient(#00ADEE 5%, #0078A5 100%);
	background-image: -webkit-linear-gradient(#00ADEE 5%, #0078A5 100%);
	border-radius: 0.5em;
	border-color: #0076A3;
	color: #FFF;
	cursor: pointer;
	font-weight: bold;
	text-shadow: 0 -1px 2px rgba(0,0,0,0.333);
}

.add { margin: -2.5em 0 0; }

.add:hover { background: #00ADEE; }

.cut { opacity: 0; position: absolute; top: 0; left: -1.5em; }
.cut { -webkit-transition: opacity 100ms ease-in; }

tr:hover .cut { opacity: 1; }

@media print {
	* { -webkit-print-color-adjust: exact; }
	html { background: none; padding: 0; }
	body { box-shadow: none; margin: 0; }
	span:empty { display: none; }
	.add, .cut { display: none; }
}

@page { margin: 0; }
		</style>
		
	</head>
	<body>
	 <c:if test="${empty currentUser.adminname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>


		<header>
			<h1>Invoice</h1>
			<address >
				<p>Oneindia Online Shopping,</p>
				<p>NH 4 National Highway Road,<br> varaje pune,<br>maharashtra.</p>
				<p>(+91) 85 222 44 55</p>
			</address>
			<span><img alt="" src="image/logo1.png" style="height:150px; width:200px;"></span>
		</header>
		<article>
			<h1>Recipient</h1>
			<address >
				<p> <br></p>

			</address>
			<table class="meta">
			<tr>
			<th>GST No</th>
			<td>07AAECR2971C1Z</td>
			</tr>
				<tr>
					
	<%
	
int id=Integer.parseInt(request.getParameter("id"));
OrderDao dao=new OrderDao(ConnectionProvider.getConnection());
Order order=dao.getOrderEditById(id);
%>
	
					
					<th><span >Invoice #</span></th>
					<td><span ><%=order.getOrderid() %></span></td>
				</tr>
				<tr>
					<th><span >Order Date</span></th>
					<td><span ><%= order.getDatetime1() %></span></td>
				</tr>
				<tr>
					<th><span >Complate Date</span></th>
					<td><span ><%= order.getDatetime2() %> </span></td>
				</tr>
				<tr>
				<th>Name</th>
				<td><%= order.getFirstname() %><%= order.getLastname() %></td>
				</tr>
				
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span >Product ID</span></th>
						<th><span >Product</span></th>
						<th><span >Qty</span></th>
						<th><span>MRP</span></th>
						<th><span >Sales price</span></th>
						<th><span >GST</span></th>
						<th><span >Discount</span></th>
						<th><span >Price</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span ><%= order.getProductid() %></span></td>
						<td><span ><%=order.getProductname() %> </span></td>
						<td><span ><%= order.getQuantity() %></span></td>
						<td><span >&#8377 <%= order.getProductmrp() %></span></td>
						<td><span >&#8377 <%= order.getSalesprice() %></span></td>
						<td><span ><%= order.getGst() %> %</span></td>
						<td><%= order.getDiscount() %> %</td>
						<td><span >&#8377 <%= order.getProductprice() %></span></td>
						
					</tr>
				
				</tbody>
			</table>
			
			<table class="balance">
			<tr>
					<th><span >Payment mode </span></th>
					<td><span ><%= order.getPaymentmode() %></span></td>
				</tr>
				<tr>
				<th>Status</th>
				<td><span><%= order.getStatus() %></span></td>
				</tr>
				<tr>
					<th><span >Total Amount</span></th>
					<td><span data-prefix>&#8377 <%= order.getTotalprice() %></span><span></span></td>
				</tr>
				
			
			</table>
		</article>
		<aside>
			<h1><span >Contact us</span></h1>
			<div >
			
				<p align="center">Email :- info@oneindia64.com || Web :- www.oneindiashopping.in || Phone :- +91 85 222 44 55 </p><br/>
			</div>
		</aside>
			<table>
					<tr><b><h2><p  align="center">This is served as your official receipt</p></tr>
					<tr><p  align="center">THANK YOU FOR CHOSING THE Oneindia Online shopping</p></b></h2></tr><br><br>		
					
			</table>
		<br>
		<br>
		<br/>
		<br/>
		
 <input id="printpagebutton" type="button" value="Print this page" onclick="printpage()"/>

<script type="text/javascript">
    function printpage() {
        //Get the print button and put it into a variable
        var printButton = document.getElementById("printpagebutton");
        //Set the print button visibility to 'hidden' 
        printButton.style.visibility = 'hidden';
        //Print the page content
        window.print()
        //Set the print button to 'visible' again 
        //[Delete this line if you want it to stay hidden after printing]
        printButton.style.visibility = 'visible';
    }
</script>


	</body>
</html>


