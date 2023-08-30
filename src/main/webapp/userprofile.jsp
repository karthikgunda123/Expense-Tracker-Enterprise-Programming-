	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"     import="com.klef.ep.models.User" %>
    <%
    User us = (User)session.getAttribute("us"); // emp is session attribute
    if(us == null)
    {
    	response.sendRedirect("sessionexpiry.html");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EP Project</title>
<link type="text/css"  rel="stylesheet"  href="style.css"/>
</head>
<body>

 <h2 align="center">Enterprise Resource Planning (ERP) Project</h2>
  <hr color="black"/><hr color="black"/>
  <br/>

<a href="userhome.jsp">Home</a>&nbsp;&nbsp;&nbsp;
<a href="userprofile.jsp">Profile</a>&nbsp;&nbsp;&nbsp;
<a href="userlogout.jsp">Logout</a>&nbsp;&nbsp;&nbsp;

<br>

<h3 align="center">I am in User Profile</h3>

Name <%=us.getName()%><br>
Email <%=us.getEmail() %>

</body>
</html>