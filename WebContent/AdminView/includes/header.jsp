  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page isELIgnored="false" %>
  <%@ page import="com.entities.Adminlogin" %>
  <%@ page import="com.entities.Order" %>
  <%@ page import="com.dao.OrderDao" %>
  <%@ page import="com.helper.ConnectionProvider" %>
  <%@ page import="java.util.*" %>
  
   
 <div style="background-color:#2F4F4F;text-align:center;padding:10px;"></div>
    
        <div style="overflow:auto; width: 100%; padding:10px;" >
            <div class="headers1">
                <img style="margin-left:8px;"Height="120px" Width="280px" src="image/logo.jpg" >
                </div>
             <div class="headers2"><h1 style="font-size:70px;color:#696969;font-family:sans-serif;"><span style="color:orange;"> Ad</span>min <span style="color:#C0C0C0;">Panel</span></h1></div>
           <div class="headers3">
           
          
         </div>
             </div>
         
        <div class="navbar">
    <a href="Dashboard.jsp" ><i class="fas fa-tachometer-alt" style="color:#2F4F4F;"></i> Dashbord</a>
  
   <div class="dropdown">
    <button class="dropbtn"><i class="fas fa-th-large"></i>  Category
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Supplier.jsp">Supplier form</a>
       <a href="supplierreport.jsp">Manage Supplier</a>
      <a href="Category.jsp">Add SubCategory</a>
       
     
    </div>
  </div> 
  
   <div class="dropdown">
    <button class="dropbtn"><i class="fas fa-box"></i> Product
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Add_Produt.jsp">Add Product</a>
      <a href="ViewProduct.jsp">View Product</a>
      <a href="ProductStock.jsp">Stock Details</a>
    </div>
  </div> 
            <div class="dropdown">
 <button class="dropbtn"><i class="fas fa-gift"></i> Order Details
      <i class="fa fa-caret-down"></i>
    </button>
             
    <div class="dropdown-content">
        <a href="All_OrderDeatails.jsp">All Orders Report </a> 
      <a href="DatewiseAllOrder.jsp">Datewise Order Report</a>
      <a href="MonthlyOrder.jsp">Month Order Report</a>
        <a href="YearwiseOrder.jsp">Year Order Report</a>

    </div>
  </div> 
    
     <a href="ContactReport.jsp"><i class="fas fa-address-book"></i> Contact Report</a> 
     <a href="UserData.jsp"><i class="fas fa-users-cog"></i> User Report</a> 
           

                <div class="dropdown">
 <button class="dropbtn"><i class="fas fa-shipping-fast"></i> Delivery Details
      <i class="fa fa-caret-down"></i>
    </button>
             
    <div class="dropdown-content">
        <%

            OrderDao dao11=new OrderDao(ConnectionProvider.getConnection());
    List<Order> list11=dao11.getAllOrdered();

    %>
        <a href="Ordered.jsp">Order Pending <span>(<%= list11.size() %>)</span> </a> 
         
        <% 
        List<Order> list12=dao11.getAllPacked();
        %>
      <a href="Packed.jsp">Order Packed <span>(<%= list12.size() %>)</span></a>
      
       <% 
        List<Order> list13=dao11.getAllShipped();
        %>
        
      <a href="ShippingStage.jsp">Order Shipped <span>(<%= list13.size() %>)</span></a>
    </div>
    
  </div>
  <c:if test="${not empty currentUser}">
      <a>Welcome ${currentUser.adminname}</a>
     <a style="cursor:pointer;" href="../AdminLogoutServlet"> | <i class="fas fa-sign-out-alt"></i> Logout |</a>
    </c:if>
  
</div>