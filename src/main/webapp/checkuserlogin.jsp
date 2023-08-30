<%@page import="com.klef.ep.services.UserService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
    
<%

InitialContext context = new InitialContext();
UserService userService = (UserService) context.lookup("java:global/EPProject/UserServiceImpl!com.klef.ep.services.UserService");

String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

User us = userService.CheckUserLogin(email, pwd);

if(us!=null)
{   
	  //session is an implicit object
	   session.setAttribute("us", us);  // emp is a session variable and emp is an object of type Employee class.
	   response.sendRedirect("userhome.jsp"); // will redirect to employee home
}
else
{
	  response.sendRedirect("loginfail.jsp");  // will redirect to login failed page
}



%>