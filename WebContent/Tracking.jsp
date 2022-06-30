 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dao.UserRegisterDao" %> 
<%@ page import="com.entities.UserRegister" %>
<%@ page import="com.helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>
<head>
<style type="text/css">
ol.progtrckr {
    margin: 0;
    padding: 0;
    list-style-type none;
}

ol.progtrckr li {
    display: inline-block;
    text-align: center;
    line-height: 3.5em;
}

ol.progtrckr[data-progtrckr-steps="2"] li { width: 49%; }
ol.progtrckr[data-progtrckr-steps="3"] li { width: 33%; }
ol.progtrckr[data-progtrckr-steps="4"] li { width: 24%; }
ol.progtrckr[data-progtrckr-steps="5"] li { width: 19%; }
ol.progtrckr[data-progtrckr-steps="6"] li { width: 16%; }
ol.progtrckr[data-progtrckr-steps="7"] li { width: 14%; }
ol.progtrckr[data-progtrckr-steps="8"] li { width: 12%; }
ol.progtrckr[data-progtrckr-steps="9"] li { width: 11%; }

ol.progtrckr li.progtrckr-done {
    color: black;
    border-bottom: 4px solid yellowgreen;
}
ol.progtrckr li.progtrckr-todo {
    color: silver; 
    border-bottom: 4px solid silver;
}

ol.progtrckr li:after {
    content: "\00a0\00a0";
}
ol.progtrckr li:before {
    position: relative;
    bottom: -2.5em;
    float: left;
    left: 50%;
    line-height: 1em;
}
ol.progtrckr li.progtrckr-done:before {
    content: "\2713";
    color: white;
    background-color: yellowgreen;
    height: 2.2em;
    width: 2.2em;
    line-height: 2.2em;
    border: none;
    border-radius: 2.2em;
}
ol.progtrckr li.progtrckr-todo:before {
    content: "\039F";
    color: silver;
    background-color: white;
    font-size: 2.2em;
    bottom: -1.2em;
}


       .inp{
width: 100px;
  padding: 4px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
</style>
   <title>Tracking Order</title>
   <link rel="stylesheet" type="text/css" href="css/menu.css" />
<%@ include file="includes/head.jsp" %>
</head>
<body>
 <%@ include file="includes/header.jsp" %>


 <c:if test="${empty currentUser.fname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>

 <div class="track">
 
 <h1>My Order Tracking</h1>

<table >
<tr>
<th align="right"><form action="" method="get">
<input type="text" name="user" placeholder="Search here.." class="inp">
<input type="submit" value="search">

</form></th>
</tr>
</table>
    <br> 
 <div class="track1">
        
       </div>

  <div class="track2">
           
           
<%
UserRegister user1=(UserRegister)session.getAttribute("currentUser");
Connection con = ConnectionProvider.getConnection();
try
{
	Statement stat=null;
	ResultSet res=null;
	stat =con.createStatement();
	String user=request.getParameter("user");
	int users=user1.getId();
	String sqlStr="select * from orders where userid='"+users+"' and orderid='"+user+"' "	;
	
	res = stat.executeQuery(sqlStr);
	if(res.next())
	{
		%>
<h4><span style="color:red">Order Id : </span><%= res.getInt("orderid")  %> <br></h4>
<h3> <%= res.getString("product_name") %></h3>
<h3 style="color:orange"><%=res.getString("productprice") %>&#8377;</h3><br>
Your Order is <%= res.getString("status") %> <br> 
Date : <%= res.getString("completedate") %>


<ol class="progtrckr" data-progtrckr-steps="4">
<% if("Ordered".equals(res.getString("status")))
{%>
  <li class="progtrckr-done">Ordered</li><!--
 --><li class="progtrckr-todo">Packed</li><!--
 --><li class="progtrckr-todo">Shipped</li><!--
 --><li class="progtrckr-todo">Delivered</li>
<%} %>

<%  if("Packed".equals(res.getString("status")))
{%>
  <li class="progtrckr-done">Ordered</li><!--
 --><li class="progtrckr-done">Packed</li><!--
 --><li class="progtrckr-todo">Shipped</li><!--
 --><li class="progtrckr-todo">Delivered</li>
<%} %>
<% if("Shipped".equals(res.getString("status")))
{%>
  <li class="progtrckr-done">Ordered</li><!--
 --><li class="progtrckr-done">Packed</li><!--
 --><li class="progtrckr-done">Shipped</li><!--
 --><li class="progtrckr-todo">Delivered</li>
<%} %>

<% if("Delivery".equals(res.getString("status")))
{%>
  <li class="progtrckr-done">Ordered</li><!--
 --><li class="progtrckr-done">Packed</li><!--
 --><li class="progtrckr-done">Shipped</li><!--
 --><li class="progtrckr-done">Delivered</li>
<%} 
%>

</ol>

		<% }
	
	else
	{%>
	<img src="image/no_order.png" width="500px" height="250px">
		<%
	}
	
	}

catch(Exception e)
{
	e.printStackTrace();
}

%>
</div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
</html>