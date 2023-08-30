<%@page import="com.klef.ep.services.AdminService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.User"%>
<%@page import="com.klef.ep.models.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
    
<%

InitialContext context = new InitialContext();
AdminService adminService = (AdminService) context.lookup("java:global/EPProject/AdminServiceImpl!com.klef.ep.services.AdminService");

String eid = request.getParameter("eid");
int id = Integer.parseInt(eid);

adminService.deleteUser(id);

response.sendRedirect("viewallusers.jsp");


%>