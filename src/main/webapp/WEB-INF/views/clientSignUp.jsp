<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

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
      scroll-behavior: smooth;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      animation: fadeIn 0.7s ease-in;
      padding: 1rem;
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
      position: fixed;
      top: 0;
      width: 100%;
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

    form {
      background-color: #1e293b;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
      width: 100%;
      max-width: 400px;
      margin-top: 120px;
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

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="file"],
    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      background-color: #334155;
      border: 1px solid #475569;
      border-radius: 8px;
      color: #f1f5f9;
      transition: all 0.2s;
    }

    input:focus, select:focus {
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
      from { opacity: 0; transform: scale(0.95); }
      to { opacity: 1; transform: scale(1); }
    }
  </style>
</head>
<body>

<header>
  <h2><i class="fas fa-wallet"></i> ExpenseTracker</h2>
  <nav>
    <a href="/">Home</a>
    <a href="about_us">About Us</a>
    <a href="ClientLogin">Login</a>
    <a href="clientSignUp">Sign Up</a>
  </nav>
</header>

<form action="clientsignuppost" method="post" enctype="multipart/form-data">
  <h2>Sign Up</h2>

  <label for="fname">First Name:</label>
  <input type="text" id="fname" name="fname" required>

  <label for="lname">Last Name:</label>
  <input type="text" id="lname" name="lname" required>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>

  <label for="pass">Password:</label>
  <input type="password" id="pass" name="pass" required>

  <label for="gender">Gender:</label>
  <select id="gender" name="gender" required>
    <option value="">Select</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
  </select>

  <label for="image">Upload image</label>
  <input type="file" id="image" name="image" required>

  <input type="submit" value="Sign Up">

  <c:if test="${not empty errorMessage}">
    <p class="message error">${errorMessage}</p>
  </c:if>

  <c:if test="${not empty successMessage}">
    <p class="message success">${successMessage}</p>
  </c:if>

  <p>Already have an account? <a href="ClientLogin">Login here</a></p>
</form>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
