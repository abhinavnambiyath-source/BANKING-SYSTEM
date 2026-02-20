<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banking System</title>

<style>
    /* Page background */
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    }

    /* Center card */
    .container {
        background: rgba(255, 255, 255, 0.1);
        padding: 50px 60px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        text-align: center;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        animation: fadeIn 1s ease-in-out;
    }

    /* Heading */
    h1 {
        color: #ffffff;
        margin-bottom: 40px;
        letter-spacing: 1px;
    }

    /* Links as buttons */
    .btn {
        display: inline-block;
        text-decoration: none;
        padding: 12px 30px;
        margin: 10px;
        border-radius: 30px;
        font-size: 16px;
        font-weight: bold;
        transition: 0.3s;
        color: white;
    }

    .login {
        background: #00c6ff;
        background: linear-gradient(to right, #00c6ff, #0072ff);
    }

    .register {
        background: #f7971e;
        background: linear-gradient(to right, #f7971e, #ffd200);
        color: #333;
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.3);
    }

    /* Animation */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

</head>
<body>

    <div class="container">
        <h1>Welcome to Banking System</h1>

        <a href="login.jsp" class="btn login">Login</a>
        <a href="register.jsp" class="btn register">Register</a>
    </div>

</body>
</html>
