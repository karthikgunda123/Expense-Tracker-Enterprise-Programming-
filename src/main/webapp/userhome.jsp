<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"     import="com.klef.ep.models.User" %>
    <%
    User us = (User)session.getAttribute("us");
    if(us == null)
    {
    	response.sendRedirect("sessionexpiry.html");
    }
    %>
<!DOCTYPE html>
<html>
<head>
  <title>Beautiful Navbar</title>
  <style>
    body {
  background-color: #f7f7f7;
}

/* Existing CSS code remains the same */

    nav {
  background-color: #f2f2f2;
  padding: 10px;
  overflow: hidden;
}

.navbar-heading {
  font-size: 24px;
  font-weight: bold;
  margin: 0;
  display: inline-block;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: inline-block;
  float: right;
}

li {
  display: inline-block;
  margin-left: 20px;
}

a {
  display: inline-block;
  color: #333;
  text-decoration: none;
  padding: 10px;
  font-size: 18px;
  font-weight: bold;
}

a:hover {
  background-color: #333;
  color: #f2f2f2;
}
/* Existing CSS code remains the same */

.card {
  display: flex;
  margin-top: 40px;
}

.card img {
  width: 300px;
  height: 200px;
  object-fit: cover;
  border-radius: 5px;
  margin-right: 20px;
}

.card-content {
  flex: 1;
}

.card-content h3 {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
}

.card-content p {
  font-size: 18px;
  line-height: 1.5;
}
/* Existing CSS code remains the same */

footer {
  background-color: #f2f2f2;
  padding: 20px;
}

.footer-content {
  max-width: 800px;
  margin: 0 auto;
}

.card {
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.card-content {
  padding: 10px;
  text-align: center;
}

p {
  font-size: 14px;
  color: #777;
  margin: 0;
}


  </style>
</head>
<body>
  <nav>
    <h1 class="navbar-heading">Employee Expense Tracker</h1>
    <ul>
      <li><a href="userhome.jsp" class="nav-item">Home</a></li>
      <li><a href="expense.jsp" class="nav-item">ExpenseTracker</a></li>
      <li><a href="budgetexpense.jsp" class="nav-item">BudgetExpenseTracker</a></li>
	<li><a href="" class="nav-item">Profile</a></li>
      <li><a href="userlogout.jsp" class="nav-item">Logout</a></li>
    </ul>
  </nav>
<h1 align="center">I am in User Home</h1>

<h1 align = "center">Welcome <%=us.getName()%></h1>

  <div class="content">
    <h1 align = "center">Welcome to the Expense Tracker</h1>
    <h3>
      The Expense Tracker helps you keep track of your business expenses
      efficiently. With our user-friendly interface and powerful features,
      managing your expenses has never been easier.
    </h3>
    <div class="card">
      <img src="https://www.bts.dot.gov/sites/bts.dot.gov/files/legacy/Figure%205-4_0.jpg" alt="Image 1">
      <div class="card-content">
        <h3>Expense Tracking</h3>
        <p>
          Track and manage your expenses efficiently with our Expense Tracking feature.
        </p>
	<a href="expense.html" class="card-link">Learn More</a>
      </div>
    </div>
    <div class="card">
      <img src="https://templatelab.com/wp-content/uploads/2016/08/expense-report-template-29.jpg" alt="Image 2">
      <div class="card-content">
        <h3>Budget Expense Tracking</h3>
        <p>
          Efficiently manage your budget and track your expenses with our Budget Expense Tracking feature.
        </p>
	<a href="budgetexpense.html" class="card-link">Learn More</a>
      </div>
    </div>
  </div>
  
  <footer>
    <div class="footer-content">
      <div class="card">
        <div class="card-content">
          <p>&copy; 2023 Expense Tracker. All rights reserved.</p>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
