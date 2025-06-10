<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #0f172a;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #e2e8f0;
            animation: fadeIn 0.7s ease-in;
            flex-direction: column;
        }

        form {
            background-color: #1e293b;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
            width: 100%;
            max-width: 400px;
            transition: all 0.3s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #38bdf8;
        }

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            color: #cbd5e1;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #334155;
            border: 1px solid #475569;
            border-radius: 8px;
            color: #f1f5f9;
            transition: all 0.2s;
        }

        input:focus {
            outline: none;
            border-color: #38bdf8;
            box-shadow: 0 0 5px #38bdf8;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #0ea5e9;
            border: none;
            color: white;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: #0284c7;
        }

        a {
            color: #60a5fa;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            text-align: center;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }

        .message.error {
            color: #f87171;
        }

        .message.success {
            color: #34d399;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>

<h2>Login</h2>

<form action="loginpost" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br>

    <label for="pass">Password:</label><br>
    <input type="password" id="pass" name="pass" required><br>

    <input type="submit" value="Login">
</form>

<p>Don't have an account? <a href="clientSignUp">Sign up here</a></p>

</body>
</html>
