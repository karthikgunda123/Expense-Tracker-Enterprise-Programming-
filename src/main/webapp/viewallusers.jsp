<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   import="java.sql.*,java.util.List"  %>
<%@page import="com.klef.ep.services.AdminService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.klef.ep.models.User"%>
<%@page import="com.klef.ep.models.Admin"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <style>
    body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

header {
  background-color: #333;
  color: #fff;
  padding: 10px;
}

.navbar {
  display: flex;
  justify-content: flex-start;
}

.navbar ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex; /* Display the list items horizontally */
}

.navbar li {
  margin-right: 20px;
}

.navbar a {
  text-decoration: none;
  color: #fff;
  font-size: 18px;
  padding: 5px 10px;
  border-radius: 5px;
}

.navbar a:hover {
  background-color: #555;
}

main {
  padding: 20px;
}

footer {
  background-color: #333;
  color: #fff;
  padding: 10px;
  position: absolute;
  bottom: 0;
  width: 100%;
}

.dashboard {
  text-align: center;
}

.dashboard h2 {
  font-size: 24px;
  margin-bottom: 30px;
}

.cards-container {
  display: flex;
  justify-content: center;
  gap: 20px;
}

.card {
  width: 300px;
  padding: 20px;
  background-color: #f5f5f5;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align: center;
}

.card h3 {
  font-size: 20px;
  margin-bottom: 15px;
}

.card p {
  font-size: 16px;
  color: #777;
}

  </style>
</head>

<body>
  <header>
    <nav class="navbar">
      <ul>
        <li><a href="adminhome.jsp">Dashboard</a></li>
        <li><a href="adminadduser.jsp">Add User</a></li>
        <li><a href="viewallusers.jsp">View User</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </nav>
  </header>
<br>
<h2 align="center"><u>View All User</u></h2>
<table class="table table-striped">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email Address</th>
<th>Delete User</th>
</tr>

<%
  InitialContext context = new InitialContext();
AdminService adminService = (AdminService) context.lookup("java:global/EPProject/AdminServiceImpl!com.klef.ep.services.AdminService");

List<User> userlist = adminService.ViewAllUsers();
for(User user : userlist)
{
	  %>
	  
	    <tr>
	    	  <td><%=user.getId()%></td>
	    	  <td><%=user.getName()%></td>
	    	  <td><%=user.getEmail()%></td>	   
	    	   <td><a href="deleteuser.jsp?eid=<%=user.getId()%>" class="btn btn-danger">Delete</a></td>	
	    </tr>
	  
	  <%
}

%>
</table>
</body>

</html>
