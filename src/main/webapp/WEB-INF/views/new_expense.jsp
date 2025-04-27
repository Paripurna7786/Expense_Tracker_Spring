<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Expense</title>
</head>
<body>

<h2>Add New Expense</h2>

<form action="add-expense" method="post">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" required><br><br>

    <label for="vendor">Vendor:</label><br>
    <input type="text" id="vendor" name="vendor" required><br><br>

    <label for="category">Category:</label><br>
    <select id="category" name="category" required>
        <option value="">Select</option>
        <option value="Food">Food</option>
        <option value="Travel">Travel</option>
        <option value="Entertainment">Entertainment</option>
        <option value="Shopping">Shopping</option>
        <option value="Utilities">Utilities</option>
        <option value="Others">Others</option>
    </select><br><br>

    <label for="amount">Amount (₹):</label><br>
    <input type="number" id="amount" name="amount" required><br><br>

    <label for="paymentMode">Payment Mode:</label><br>
    <select id="paymentMode" name="paymentMode" required>
        <option value="">Select</option>
        <option value="CASH">CASH</option>
        <option value="CARD">CARD</option>
        <option value="UPI">UPI</option>
        <option value="NET BANKING">NET BANKING</option>
    </select><br><br>

    <label for="expenseDate">Expense Date:</label><br>
    <input type="date" id="expenseDate" name="expenseDate" required><br><br>
    
    <input type="hidden" name="client.id" value="${client.id}" />

    <input type="submit" value="Add Expense">
</form>

<c:if test="${not empty errorMessage}">
    <p style="color:red;">${errorMessage}</p>
</c:if>

<c:if test="${not empty successMessage}">
    <p style="color:green;">${successMessage}</p>
</c:if>

</body>
</html>
