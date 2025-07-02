<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Expense</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font Awesome -->
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
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      color: var(--text-color);
      min-height: 100vh;
      padding: 0;
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

    form {
      background-color: #1e293b;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
      width: 90%;
      max-width: 450px;
      margin: 50px auto;
      transition: all 0.3s ease-in-out;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #38bdf8;
    }

    label {
      display: block;
      margin-top: 15px;
      margin-bottom: 8px;
      color: #cbd5e1;
      font-weight: 600;
    }

    input[type="text"],
    input[type="number"],
    input[type="date"],
    select {
      width: 100%;
      padding: 12px;
      background-color: #334155;
      border: 1px solid #475569;
      border-radius: 8px;
      color: #f1f5f9;
      font-size: 15px;
      transition: border-color 0.2s, box-shadow 0.2s;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="date"]:focus,
    select:focus {
      outline: none;
      border-color: #38bdf8;
      box-shadow: 0 0 6px #38bdf8;
    }

    input[type="submit"] {
      margin-top: 25px;
      width: 100%;
      padding: 14px;
      background-color: #0ea5e9;
      border: none;
      color: white;
      font-size: 18px;
      font-weight: 700;
      border-radius: 10px;
      cursor: pointer;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      box-shadow: 0 0 10px rgba(14, 165, 233, 0.6);
    }

    input[type="submit"]:hover {
      background-color: #0284c7;
      box-shadow: 0 0 15px rgba(2, 132, 199, 0.8);
    }

    p {
      text-align: center;
      margin-top: 15px;
      font-weight: 600;
    }

    p.error {
      color: #f87171;
    }

    p.success {
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

<header>
  <h2><i class="fas fa-wallet"></i> ExpenseTracker</h2>
  <nav>
    <a href="/">Home</a>
    <a href="about_us">About Us</a>
    <a href="ClientLogin">Login</a>
    <a href="clientSignUp">Sign Up</a>
  </nav>
</header>

<form action="update-expense" method="post">
  <h2>Edit Expense</h2>

  <input type="hidden" name="id" value="${expense.id}" />

  <label for="title">Title:</label>
  <input type="text" id="title" name="title" value="${expense.title}" required>

  <label for="vendor">Vendor:</label>
  <input type="text" id="vendor" name="vendor" value="${expense.vendor}" required>

  <label for="category">Category:</label>
  <select id="category" name="category" required>
    <option value="Food" ${expense.category == 'Food' ? 'selected' : ''}>Food</option>
    <option value="Travel" ${expense.category == 'Travel' ? 'selected' : ''}>Travel</option>
    <option value="Entertainment" ${expense.category == 'Entertainment' ? 'selected' : ''}>Entertainment</option>
    <option value="Shopping" ${expense.category == 'Shopping' ? 'selected' : ''}>Shopping</option>
    <option value="Utilities" ${expense.category == 'Utilities' ? 'selected' : ''}>Utilities</option>
    <option value="Others" ${expense.category == 'Others' ? 'selected' : ''}>Others</option>
  </select>

  <label for="amount">Amount (₹):</label>
  <input type="number" id="amount" name="amount" value="${expense.amount}" required>

  <label for="paymentMode">Payment Mode:</label>
  <select id="paymentMode" name="paymentMode" required>
    <option value="CASH" ${expense.paymentMode == 'CASH' ? 'selected' : ''}>CASH</option>
    <option value="CARD" ${expense.paymentMode == 'CARD' ? 'selected' : ''}>CARD</option>
    <option value="UPI" ${expense.paymentMode == 'UPI' ? 'selected' : ''}>UPI</option>
    <option value="NET BANKING" ${expense.paymentMode == 'NET BANKING' ? 'selected' : ''}>NET BANKING</option>
  </select>

  <label for="expenseDate">Expense Date:</label>
  <input type="date" id="expenseDate" name="expenseDate" value="${expense.expenseDate}" required>

  <input type="submit" value="Update Expense">

  <c:if test="${not empty errorMessage}">
    <p class="error">${errorMessage}</p>
  </c:if>

  <c:if test="${not empty successMessage}">
    <p class="success">${successMessage}</p>
  </c:if>
</form>

</body>
</html>
