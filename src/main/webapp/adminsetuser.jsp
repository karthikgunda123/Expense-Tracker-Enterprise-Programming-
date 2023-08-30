<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.klef.ep.services.UserService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.User"%>
<%@page import="java.net.URLEncoder"%>
<%

InitialContext context = new InitialContext();
UserService userService = (UserService) context.lookup("java:global/EPProject/UserServiceImpl!com.klef.ep.services.UserService");

String name = request.getParameter("name");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

User us = new User();
us.setName(name);
us.setEmail(email);
us.setPassword(pwd);

userService.addUser(us);

String text="Added User Succesfull";
String redirectURL="adminadduser.jsp?text="+URLEncoder.encode(text,"UTF-8");
response.sendRedirect(redirectURL);


%>