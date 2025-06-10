<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Expense</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            animation: fadeIn 0.7s ease-in;
        }

        form {
            background-color: #1e293b;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
            width: 100%;
            max-width: 450px;
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

<form action="add-expense" method="post">
    <h2>Add New Expense</h2>

    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required>

    <label for="vendor">Vendor:</label>
    <input type="text" id="vendor" name="vendor" required>

    <label for="category">Category:</label>
    <select id="category" name="category" required>
        <option value="">Select</option>
        <option value="Food">Food</option>
        <option value="Travel">Travel</option>
        <option value="Entertainment">Entertainment</option>
        <option value="Shopping">Shopping</option>
        <option value="Utilities">Utilities</option>
        <option value="Others">Others</option>
    </select>

    <label for="amount">Amount (₹):</label>
    <input type="number" id="amount" name="amount" required>

    <label for="paymentMode">Payment Mode:</label>
    <select id="paymentMode" name="paymentMode" required>
        <option value="">Select</option>
        <option value="CASH">CASH</option>
        <option value="CARD">CARD</option>
        <option value="UPI">UPI</option>
        <option value="NET BANKING">NET BANKING</option>
    </select>

    <label for="expenseDate">Expense Date:</label>
    <input type="date" id="expenseDate" name="expenseDate" required>

    <input type="hidden" name="client.id" value="${client.id}" />

    <input type="submit" value="Add Expense">

    <c:if test="${not empty errorMessage}">
        <p class="error">${errorMessage}</p>
    </c:if>

    <c:if test="${not empty successMessage}">
        <p class="success">${successMessage}</p>
    </c:if>
</form>

</body>
</html>
