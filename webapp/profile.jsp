<%@ page import="java.sql.*" %>
<%@ page import="com.bank.util.DBConnection" %>
<%@ page import="com.bank.dto.User" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "SELECT a.account_number, a.balance " +
    "FROM accounts a WHERE a.user_id=?"
);
ps.setInt(1, user.getUserId());
ResultSet rs = ps.executeQuery();

String accNo = "";
double balance = 0;

if (rs.next()) {
    accNo = rs.getString("account_number");
    balance = rs.getDouble("balance");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(120deg, #283c86, #45a247);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .profile-box {
        background: white;
        padding: 40px 50px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        width: 360px;
        text-align: left;
        animation: fadeIn 0.8s ease;
    }

    h2 {
        text-align: center;
        color: #283c86;
        margin-bottom: 25px;
    }

    p {
        font-size: 15px;
        margin: 12px 0;
        color: #333;
    }

    strong {
        color: #283c86;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 25px;
        text-decoration: none;
        padding: 10px;
        border-radius: 6px;
        background: linear-gradient(to right, #283c86, #45a247);
        color: white;
        font-weight: bold;
        transition: 0.3s;
    }

    a:hover {
        opacity: 0.9;
        transform: translateY(-2px);
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

<div class="profile-box">
    <h2>User Profile</h2>

    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Account Number:</strong> <%= accNo %></p>
    <p><strong>Balance:</strong> ₹ <%= balance %></p>

    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
