<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	String username = request.getParameter("username");
	String password = request.getParameter("pwd");
	
	if(username.equals("admin") && password.equals("admin"))
	{
		session.setAttribute("admin", username);
		response.sendRedirect("adminhome.jsp");
	}
	else
	{
		response.sendRedirect("adminloginfail.jsp");
	}
%>