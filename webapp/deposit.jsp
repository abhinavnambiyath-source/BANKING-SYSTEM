<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit Money</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #1f4037, #99f2c8);
    }

    .deposit-box {
        background: white;
        padding: 40px 45px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        width: 320px;
        text-align: center;
        animation: fadeIn 0.8s ease;
    }

    h2 {
        margin-bottom: 25px;
        color: #1f4037;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 15px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #1f4037;
        outline: none;
        box-shadow: 0 0 5px rgba(31,64,55,0.5);
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        border: none;
        border-radius: 6px;
        background: linear-gradient(to right, #1f4037, #99f2c8);
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
        color: #1f4037;
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

<div class="deposit-box">
    <h2>Deposit Money</h2>

    <form action="deposit" method="post">
        <input type="number" name="amount" placeholder="Enter Amount" required>
        <button type="submit">Deposit</button>
    </form>

    <a href="dashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
