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
<title>Insert title here</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(120deg, #1e3c72, #2a5298);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: white;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        width: 80%;
        max-width: 800px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #1e3c72;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
        overflow: hidden;
        border-radius: 8px;
    }

    th {
        background: linear-gradient(to right, #1e3c72, #2a5298);
        color: white;
        padding: 12px;
        text-align: center;
        font-size: 14px;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
    }

    tr:nth-child(even) {
        background-color: #f4f7fb;
    }

    tr:hover {
        background-color: #e9f0ff;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        padding: 10px 20px;
        background: linear-gradient(to right, #1e3c72, #2a5298);
        color: white;
        border-radius: 6px;
        font-size: 14px;
        transition: 0.3s;
    }

    a:hover {
        opacity: 0.9;
        transform: translateY(-2px);
    }
</style>
</head>
<body>
	<div class="container">
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
	
	Connection con = DBConnection.getConnection();
	PreparedStatement ps = con.prepareStatement(
	    "SELECT t.* FROM transactions t " +
	    "JOIN accounts a ON t.account_id = a.account_id " +
	    "WHERE a.user_id=?"
	);
	ps.setInt(1, user.getUserId());
	ResultSet rs = ps.executeQuery();
	%>
	
	<h2>Transaction History</h2>
	
	<table>
	<tr>
	    <th>ID</th>
	    <th>Type</th>
	    <th>Amount</th>
	    <th>Date</th>
	</tr>
	
	<%
	while (rs.next()) {
	%>
	<tr>
	    <td><%= rs.getInt("txn_id") %></td>
	    <td><%= rs.getString("type") %></td>
	    <td>₹<%= rs.getDouble("amount") %></td>
	    <td><%= rs.getTimestamp("txn_date") %></td>
	</tr>
	<%
	}
	%>
	</table>
	
	<a href="dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>