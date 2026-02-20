<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bank.util.DBConnection"%>
<%@page import="com.bank.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(120deg, #0f2027, #203a43, #2c5364);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .dashboard {
        background: white;
        padding: 40px 50px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        text-align: center;
        width: 380px;
        animation: fadeIn 0.8s ease;
    }

    h2 {
        color: #2c5364;
        margin-bottom: 10px;
    }

    h3 {
        background: linear-gradient(to right, #0f2027, #2c5364);
        color: white;
        padding: 12px;
        border-radius: 8px;
        margin: 20px 0;
    }

    ul {
        list-style: none;
        padding: 0;
        margin: 20px 0;
    }

    li {
        margin: 10px 0;
    }

    a {
        display: block;
        text-decoration: none;
        padding: 10px;
        border-radius: 6px;
        background: linear-gradient(to right, #203a43, #2c5364);
        color: white;
        font-weight: bold;
        transition: 0.3s;
    }

    a:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .logout {
        margin-top: 15px;
        background: #e74c3c;
    }

    .logout:hover {
        background: #c0392b;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>

<div class="dashboard">
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<h2>Welcome, <%= user.getName() %></h2>

<%
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT balance FROM accounts WHERE user_id=?"
);
ps.setInt(1, user.getUserId());
ResultSet rs = ps.executeQuery();

double balance = 0;
if (rs.next()) {
    balance = rs.getDouble("balance");
}
%>

<h3>Balance: ₹ <%= balance %></h3>

<ul>
    <li><a href="deposit.jsp">Deposit</a></li>
    <li><a href="withdraw.jsp">Withdraw</a></li>
    <li><a href="transfer.jsp">Transfer</a></li>
    <li><a href="transaction.jsp">Transactions</a></li>
    <li><a href="profile.jsp">View Profile</a></li>
</ul>

<a href="logout" class="logout">Logout</a>
</div>

</body>
</html>
