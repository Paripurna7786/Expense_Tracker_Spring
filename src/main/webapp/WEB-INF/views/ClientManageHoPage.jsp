<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Client Manage Home Page</title>
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
      padding: 2rem 1rem;
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

    h3 {
      color: #38bdf8;
      text-align: center;
      margin-bottom: 30px;
      font-weight: 700;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #1e293b;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
      margin-bottom: 30px;
    }

    thead {
      background-color: #334155;
    }

    thead th {
      color: #cbd5e1;
      text-align: left;
      padding: 15px 20px;
      font-weight: 600;
      font-size: 14px;
    }

    tbody tr {
      border-bottom: 1px solid #475569;
      transition: background-color 0.3s ease;
    }

    tbody tr:hover {
      background-color: #2563eb33;
    }

    tbody td {
      padding: 12px 20px;
      color: #e2e8f0;
      font-size: 14px;
    }

    .actions a {
      text-decoration: none;
      margin-right: 10px;
      font-size: 1.1rem;
    }

    .actions a.delete {
      color: red;
    }

    .actions a.edit {
      color: #22c55e;
    }

    form {
      text-align: center;
    }

    button {
      background-color: #0ea5e9;
      border: none;
      color: white;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: 600;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      box-shadow: 0 0 10px rgba(14, 165, 233, 0.6);
    }

    button:hover {
      background-color: #0284c7;
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

    @media (max-width: 600px) {
      table, thead, tbody, th, td, tr {
        display: block;
      }

      thead tr {
        display: none;
      }

      tbody tr {
        margin-bottom: 20px;
        border-bottom: 2px solid #475569;
      }

      tbody td {
        padding-left: 50%;
        position: relative;
        text-align: left;
      }

      tbody td::before {
        content: attr(data-label);
        position: absolute;
        left: 20px;
        top: 12px;
        font-weight: 700;
        color: #38bdf8;
        white-space: nowrap;
      }
    }
  </style>
</head>
<body>
<%-- Get client object from session --%>
<c:set var="client" value="${sessionScope.loggedClient}" />

<header>
  <h2><i class="fas fa-wallet"></i> ExpenseTracker</h2>
  <nav>
    <a href="/">Home</a>
    <a href="about_us">About Us</a>
    <a href="ClientLogin">Login</a>
    <a href="clientSignUp">Sign Up</a>
  </nav>
</header>

<c:set var="client" value="${sessionScope.loggedClient}" />

<!-- Top Row: Search (Left) + Profile (Right) -->
<div style="display: flex; justify-content: space-between; align-items: center; padding: 20px 40px;">

    <!-- Search Form -->
    <form action="search-expense" method="get" style="display: flex; gap: 10px;">
        <input type="text" name="query" placeholder="Search by title, vendor, or category"
               style="padding: 15px 15px; border-radius: 8px; border: none; background-color: #1e293b; color: white; width: 240px;" />
        <button type="submit"
                style="background-color: #0ea5e9; color: white; padding: 10px 18px; border: none; border-radius: 8px; font-weight: bold; cursor: pointer;">
            🔍 Search
        </button>
    </form>

    <!-- Profile Picture Button -->
    <form action="clientProfile" method="get">
        <button type="submit"
                style="background: none; border: none; cursor: pointer;">
            <img src="${client.profilepicpath}" alt="Profile"
                 style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover; box-shadow: 0 0 8px #38bdf8;">
        </button>
    </form>
</div>

<!-- Centered Welcome Section -->
<div style="text-align: center; margin-top: -40px; margin-bottom: 40px;">
    <h2 style="color: #38bdf8; font-weight: 600; font-size: 28px;">Welcome</h2>
    <h3 style="color: #e2e8f0; font-weight: 500;">${client.fname} ${client.lname}</h3>
</div>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Vendor</th>
      <th>Category</th>
      <th>Amount</th>
      <th>Payment Mode</th>
      <th>Expense Date</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="expense" items="${expenses}">
      <tr>
        <td data-label="Title">${expense.title}</td>
        <td data-label="Vendor">${expense.vendor}</td>
        <td data-label="Category">${expense.category}</td>
        <td data-label="Amount">${expense.amount}</td>
        <td data-label="Payment Mode">${expense.paymentMode}</td>
        <td data-label="Expense Date">${expense.expenseDate}</td>
        <td data-label="Actions" class="actions">
          <a href="delete_expanse?id=${expense.id}" 
             class="delete" 
             onclick="return confirm('Delete this expense?');">
            <i class="fa-solid fa-trash"></i>
          </a>
          <a href="edit_expanse?id=${expense.id}" class="edit">
            <i class="fa-solid fa-pen-to-square"></i>
          </a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<form action="addexpense" method="get">
  <button type="submit">Add Expense</button>
</form>

</body>
</html>
