<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page import="com.dao.EnquiryDao" %> 
 <%@ page import="com.entities.UserEnquiry" %>
 <%@ page import="com.helper.ConnectionProvider" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail</title>
<style>
          .inp{
width: 250px;
  padding: 8px;
  border: 1px solid orange;
  border-radius: 4px;
  resize: vertical;
}
            
         .bt {
  width: 250px;
  background-color:tomato;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
}
</style>
</head>
<body>


<%
int id=Integer.parseInt(request.getParameter("id"));
EnquiryDao dao=new EnquiryDao(ConnectionProvider.getConnection());
UserEnquiry enquiry=dao.getEnquiryByEmailId(id);
%>
    <form action="../SendMailServlet" method="get">
        <table border="0" width="35%" align="center">
            <caption><h2>Send New E-mail</h2></caption>
       <tr>
                <td width="50%">Name </td>
                <td><input type="text" name="username"  class="inp" value="<%= enquiry.getFullname() %>" /></td>
            </tr>
            <tr>
                <td width="50%">Recipient address </td>
                <td><input type="text" name="useremail"  class="inp" size="50" value="<%= enquiry.getEmail() %>" /></td>
            </tr>
            
            <tr>
                <td width="50%">Subject</td>
                <td><input type="text" name="usersubject"  class="inp"  value="<%= enquiry.getSubject() %>" /></td>
            </tr>
            
            <tr>
                <td>Content </td>
                <td><textarea rows="10" cols="39" name="content"  class="inp"></textarea> </td>
            </tr>
            <tr>
                <td></td><td colspan="2" align="center"><input type="submit" class="bt" value="Send"/></td>
            </tr>
            <tr>
            <td></td>
            <td><a href="ContactReport.jsp">return enuiry page</a></td>
            </tr>
        </table>
         
    </form>
</body>
</html>