<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(120deg, #1c92d2, #f2fcfe);
    }

    .transfer-box {
        background: white;
        padding: 40px 45px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        width: 340px;
        text-align: center;
        animation: fadeIn 0.8s ease;
    }

    h2 {
        margin-bottom: 25px;
        color: #1c92d2;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 12px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #1c92d2;
        outline: none;
        box-shadow: 0 0 5px rgba(28,146,210,0.5);
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 15px;
        border: none;
        border-radius: 6px;
        background: linear-gradient(to right, #1c92d2, #0575e6);
        color: white;
        font-size: 15px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        opacity: 0.9;
        transform: translateY(-2px);
    }

    a {
        display: inline-block;
        margin-top: 15px;
        text-decoration: none;
        color: #0575e6;
        font-size: 14px;
    }

    a:hover {
        text-decoration: underline;
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

<div class="transfer-box">
    <h2>Transfer Money</h2>

    <form action="transfer" method="post">
        <input type="text" name="fromAcc" placeholder="From Account" required>
        <input type="text" name="toAcc" placeholder="To Account" required>
        <input type="number" name="amount" placeholder="Enter Amount" required>
        <button type="submit">Transfer</button>
    </form>

    <a href="dashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
