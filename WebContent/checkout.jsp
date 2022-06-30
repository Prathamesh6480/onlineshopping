<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.dao.CartDao" %> 
  <%@ page import="com.entities.Cart" %> 
 <%@ page import="com.helper.ConnectionProvider" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkoutpage</title>
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<style>

textarea:focus{
        outline: none;
       
    }

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-45 {
  -ms-flex: 45%; /* IE10 */
  flex: 45%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-55 {
  -ms-flex: 55%; /* IE10 */
  flex: 55%;
}

.col-45,
.col-50,
.col-55 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}
select
{
 width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type=tel] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.lbl {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}


@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-45 {
    margin-bottom: 20px;
  }
}

th,td
{
padding:5px;
}
</style>
<script>
var stateObject = {
"Satara": { "wai": ["412803"],"Satara": ["415001"],"Khandala": ["410312"]},
"Pune City": {"Hadapsar": ["451021"],"Shivajinagar": ["4510020"],"swarget":["4510023"]},
"Pimpari chinchwad": {"pimpari": ["451202"],"Aakurdi": ["451201"]
},
}
window.onload = function () {
var countySel = document.getElementById("countySel"),
stateSel = document.getElementById("stateSel"),
districtSel = document.getElementById("districtSel");
for (var country in stateObject) {
countySel.options[countySel.options.length] = new Option(country, country);
}
countySel.onchange = function () {
stateSel.length = 1; // remove all options bar first
districtSel.length = 1; // remove all options bar first
if (this.selectedIndex < 1) return; // done 
for (var state in stateObject[this.value]) {
stateSel.options[stateSel.options.length] = new Option(state, state);
}
}
countySel.onchange(); // reset in case page is reloaded
stateSel.onchange = function () {
districtSel.length = 1; // remove all options bar first
if (this.selectedIndex < 1) return; // done 
var district = stateObject[countySel.value][this.value];
for (var i = 0; i < district.length; i++) {
districtSel.options[districtSel.options.length] = new Option(district[i], district[i]);
}
}
}
</script>
<%@ include file="includes/head.jsp" %>
</head>
<body>
 <c:if test="${empty currentUser.fname}">
<c:redirect url="login.jsp"></c:redirect>
 </c:if>


 <%@ include file="includes/header.jsp" %>
 
<form action="OrderServ" method="post">

<%UserRegister user=(UserRegister)session.getAttribute("currentUser"); 
CartDao dao=new CartDao(ConnectionProvider.getConnection());
List<Cart> list=dao.getProductByUser(user.getId());
               
Double total_price=0.00;
%>

<div style="width:100%;overflow:auto;padding:5px;">

<h2>Checkout Form</h2>
<div class="row">
  <div class="col-45">
    <div class="container">
    <table>
                		
      
         
                		<tr>
                		<th colspan="2"></th>
<th colspan="4" style="color:green;"><h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart" style="color:green;"></i> <b>

     <c:if test="${not empty currentUser}">  <%
           UserRegister user11=(UserRegister)session.getAttribute("currentUser");
           CartDao dao11=new CartDao(ConnectionProvider.getConnection());
           List<Cart> list11=dao11.getProductByUser(user11.getId());
          

    %>
        <a style="color:green;"><%= list11.size() %></a>
        
        </c:if>

</b></span></h4></th>
</tr>
      
      <tr>
      <th></th>
      <th style="color:blue;">Product Name</th>
      <th style="color:blue;">Sales Price</th>
      <th style="color:blue;">Qty</th>
      <th style="color:blue;">Total Price</th>
      </tr>
  <%


 
      for(Cart c:list)
{ total_price= total_price+(c.getSelling_price()*Integer.parseInt(c.getProduct_qty()));

%>

<tr>
<td><input type="hidden" value="<%= c.getProduct_id() %>"> <input type="hidden" value="<%= c.getUserid() %>"> </td>
<td><a href="#"><%= c.getProduct_name() %></a></td>
<td><span class="price">&#8377 <%= c.getSelling_price() %></span></td>
<td><span class="price"><%= c.getProduct_qty() %></span></td>
<td><span class="price"><%= c.getTotal_price() %></span></td>

</tr>
   
      
      <%}

%>
<tr>
<th colspan="2"></th><th colspan="4" style="color:red;"> <p>Grand Total <span class="price" style="color:black"><b>&#8377 <%= total_price %></b></span></p></th>
</tr>

    
    
    </table>
    
    </div>
  </div>

  <div class="col-55">
    <div class="container">
      
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <input type="hidden" name="id" value="<%=user.getId() %>">
            <label for="fname"><i class="fa fa-user" class="lbl"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" value="<%= user.getFname() %> <%= user.getLname() %>" disabled>
            
            <label for="email"><i class="fa fa-envelope" class="lbl"></i> Email</label>
            <input type="text" id="email" name="email" value="<%= user.getEmail() %>" disabled>
            
             <label for="mobile"><i class="fa fa-envelope" class="lbl"></i> Mobile Number</label>
            <input type="tel" id="mobile" name="mobileno" maxlength="10" placeholder="9876-654-321" pattern="[0-9]{4}[0-9]{3}[0-9]{3}" required >
            
            <label for="adr"><i class="fa fa-address-card-o" class="lbl"></i> Address</label>
            <input type="text" id="adr" name="address"  value="<%= user.getAddress() %>">
           
           
         
 <div class="row">
              <div class="col-50">
                <label for="district" class="lbl">District</label>
               <select name="district" id="countySel" size="1">
<option value="" selected="selected">Please select district</option>
</select>
              </div>
              <div class="col-50">
                 <label ><i class="fa fa-institution" class="lbl"></i> City</label>
                <select name="city" id="stateSel" size="1">
<option value="" selected="selected">Please select city</option>
</select>
              </div>
            </div>

            <div class="row">
              <div class="col-50">
                <label for="state" class="lbl">State</label>
                <input type="text" id="state" name="state" value="<%= user.getState() %>">
              </div>
              <div class="col-50">
                <label for="zip" class="lbl">Zip</label>
               <select name="zip" id="districtSel" size="1">
<option value="" selected="selected">select city zip</option>
</select>
              </div>
            </div>
            
             <div class="row">
              <div class="col-50">
               
                <input type="radio" name="check" value="cashondelivery"> Cash On Delivery
              </div>
              <div class="col-50">
                <input type="radio" name="check" value="onlinepayment"> Online Payment
              
              </div>
            </div>
                   </div>

  
          
        </div>
        <label>
        </label>
          <input type="hidden" name="total_price" value="<%= total_price%>">
        <input type="submit" value="Continue to checkout" class="btn">
     
    </div>
  </div>

</div>
</div>
</form>
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
</body>
</html>