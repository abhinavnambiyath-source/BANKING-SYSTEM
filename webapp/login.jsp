<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(120deg, #1d4350, #a43931);
    }

    .login-box {
        background:#F08080;
        padding: 40px 45px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        width: 320px;
        text-align: center;
        animation: slideIn 0.8s ease;
    }

    h2 {
        margin-bottom: 25px;
        color: #333;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #1d4350;
        outline: none;
        box-shadow: 0 0 5px rgba(29,67,80,0.5);
    }

    button {
        width: 100%;
        padding: 10px;
        margin-top: 15px;
        border: none;
        border-radius: 6px;
        background: linear-gradient(to right, #1d4350, #a43931);
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
        display: block;
        margin-top: 15px;
        text-decoration: none;
        color: #1d4350;
        font-size: 14px;
    }

    a:hover {
        text-decoration: underline;
    }

    @keyframes slideIn {
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

<div class="login-box">
    <h2>Login</h2>
    <form action="login" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
    </form>
    <a href="register.jsp">Create an account</a>
</div>

</body>
</html>
