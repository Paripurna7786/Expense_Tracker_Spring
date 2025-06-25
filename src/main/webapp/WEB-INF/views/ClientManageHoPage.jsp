<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Client Manage Home Page</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #0f172a;
            color: #e2e8f0;
            margin: 0;
            padding: 30px;
            animation: fadeIn 0.7s ease-in;
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
            background-color: #2563eb33; /* light blue with transparency */
        }

        tbody td {
            padding: 12px 20px;
            color: #e2e8f0;
            font-size: 14px;
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

        /* Responsive */
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
<c:set var="client" value="${sessionScope.loggedClient}" />

<div style="display: flex; align-items: center; justify-content: center; margin-bottom: 30px; gap: 20px;">
    <img src="${client.profilepicpath}" alt="Profile Picture"
         style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; box-shadow: 0 0 10px #38bdf8;">
    <h2 style="color: #38bdf8; font-weight: 600;">Welcome, ${client.fname} ${client.lname}!</h2>
</div>

<h3>All Expenses</h3>
<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Vendor</th>
            <th>Category</th>
            <th>Amount</th>
            <th>Payment Mode</th>
            <th>Expense Date</th>
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
            </tr>
        </c:forEach>
    </tbody>
</table>

<form action="addexpense" method="get">
    <button type="submit">Add Expense</button>
</form>

</body>
</html>
