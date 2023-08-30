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
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Budget App</title>
    <!-- Font Awesome Icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    />
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap"
      rel="stylesheet"
    />
    <!-- Stylesheet -->
    <style>
        * {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body {
  background-color: #f7f9fd;
}
.wrapper {
  width: 90%;
  font-size: 16px;
  max-width: 43.75em;
  margin: 1em auto;
}
.container {
  width: 100%;
}
.sub-container {
  width: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 3em;
}
.flex {
  display: flex;
  align-items: center;
}
.flex-space {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.wrapper h3 {
  color: #363d55;
  font-weight: 500;
  margin-bottom: 0.6em;
}
.container input {
  display: block;
  width: 100%;
  padding: 0.6em 0.3em;
  border: 1px solid #d0d0d0;
  border-radius: 0.3em;
  color: #414a67;
  outline: none;
  font-weight: 400;
  margin-bottom: 0.6em;
}
.container input:focus {
  border-color: #587ef4;
}
.total-amount-container,
.user-amount-container {
  background-color: #ffffff;
  padding: 1.25em 0.9em;
  border-radius: 0.3em;
  box-shadow: 0 0.6em 1.2em rgba(28, 0, 80, 0.06);
}
.output-container {
  background-color: #587ef4;
  color: #ffffff;
  border-radius: 0.3em;
  box-shadow: 0 0.6em 1.2em rgba(28, 0, 80, 0.06);
  margin: 2em 0;
  padding: 1.2em;
}
.output-container p {
  font-weight: 500;
  margin-bottom: 0.6em;
}
.output-container span {
  display: block;
  text-align: center;
  font-weight: 400;
  color: #e5e5e5;
}
.submit {
  font-size: 1em;
  margin-top: 0.8em;
  background-color: #587ef4;
  border: none;
  outline: none;
  color: #ffffff;
  padding: 0.6em 1.2em;
  border-radius: 0.3em;
  cursor: pointer;
}
.list {
  background-color: #ffffff;
  padding: 1.8em 1.2em;
  box-shadow: 0 0.6em 1.2em rgba(28, 0, 80, 0.06);
  border-radius: 0.6em;
}
.sublist-content {
  width: 100%;
  border-left: 0.3em solid #587ef4;
  margin-bottom: 0.6em;
  padding: 0.5em 1em;
  display: grid;
  grid-template-columns: 3fr 2fr 1fr 1fr;
}
.product {
  font-weight: 500;
  color: #363d55;
}
.amount {
  color: #414a67;
  margin-left: 20%;
}
.icons-container {
  width: 5em;
  margin: 1.2em;
  align-items: center;
}
.product-title {
  margin-bottom: 1em;
}
.hide {
  display: none;
}
.error {
  color: #ff465a;
}
.edit {
  margin-left: auto;
}
.edit,
.delete {
  background: transparent;
  cursor: pointer;
  margin-right: 1.5em;
  border: none;
  color: #587ef4;
}
@media screen and (max-width: 600px) {
  .wrapper {
    font-size: 14px;
  }
  .sub-container {
    grid-template-columns: 1fr;
    gap: 1em;
  }
}
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

    </style>
  </head>
  <body>
    <nav>
        <h1 class="navbar-heading">Employee Expense Tracker</h1>
        <ul>
          <li><a href="userhome.jsp" class="nav-item">Home</a></li>
          <li><a href="expense.jsp" class="nav-item">ExpenseTracker</a></li>
          <li><a href="budgetexpense.jsp" class="nav-item">BudgetExpenseTracker</a></li>
          <li><a href="userlogout.jsp" class="nav-item">Logout</a></li>
        </ul>
      </nav>
      <h1 align = "center">Budget Expense tracker</h1>
    <div class="wrapper">
      <div class="container">
        <div class="sub-container">
          <!-- Budget -->
          <div class="total-amount-container">
            <h3>Budget</h3>
            <p class="hide error" id="budget-error">
              Value cannot be empty or negative
            </p>
            <input
              type="number"
              id="total-amount"
              placeholder="Enter Total Amount"
            />
            <button class="submit" id="total-amount-button">Set Budget</button>
          </div>

          <!-- Expenditure -->
          <div class="user-amount-container">
            <h3>Expenses</h3>
            <p class="hide error" id="product-title-error">
              Values cannot be empty
            </p>
            <input
              type="text"
              class="product-title"
              id="product-title"
              placeholder="Enter Title of Product"
            />
            <input
              type="number"
              id="user-amount"
              placeholder="Enter Cost of Product"
            />
            <button class="submit" id="check-amount">Check Amount</button>
          </div>
        </div>
        <!-- Output -->
        <div class="output-container flex-space">
          <div>
            <p>Total Budget</p>
            <span id="amount">0</span>
          </div>
          <div>
            <p>Expenses</p>
            <span id="expenditure-value">0</span>
          </div>
          <div>
            <p>Balance</p>
            <span id="balance-amount">0</span>
          </div>
        </div>
      </div>
      <!-- List -->
      <div class="list">
        <h3>Expense List</h3>
        <div class="list-container" id="list"></div>
      </div>
    </div>
    <!-- Script -->
    <script src = "script2.js"></script>
  </body>
</html>