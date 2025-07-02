<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Set New Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font Awesome (optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        :root {
            --primary: #4e54c8;
            --secondary: #8f94fb;
            --text-color: #fff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: var(--text-color);
            animation: fadeIn 0.7s ease-in;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(8px);
            border-radius: 0 0 20px 20px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        nav a {
            margin: 0 1rem;
            color: white;
            text-decoration: none;
            font-weight: 500;
            letter-spacing: 0.05rem;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #f0f0f0;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            min-height: calc(100vh - 80px);
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

        input[type="password"] {
            width: 100%;
            padding: 12px;
            background-color: #334155;
            border: 1px solid #475569;
            border-radius: 8px;
            color: #f1f5f9;
            font-size: 15px;
            transition: all 0.2s;
        }

        input:focus {
            outline: none;
            border-color: #38bdf8;
            box-shadow: 0 0 5px #38bdf8;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: #0ea5e9;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 700;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(14, 165, 233, 0.6);
        }

        input[type="submit"]:hover {
            background: #0284c7;
            box-shadow: 0 0 15px rgba(2, 132, 199, 0.8);
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

<header>
    <h2><i class="fas fa-key"></i> Password Reset</h2>
    <nav>
        <a href="/">Home</a>
        <a href="about_us">About Us</a>
        <a href="ClientLogin">Login</a>
        <a href="clientSignUp">Sign Up</a>
    </nav>
</header>

<main>
    <form action="updatePassword" method="post">
        <h2>Set New Password</h2>

        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <input type="submit" value="Update Password">
    </form>
</main>

</body>
</html>
