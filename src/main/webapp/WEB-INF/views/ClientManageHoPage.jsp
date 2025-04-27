<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Client Manage Home Page</title>
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>



<h3>All Expenses</h3>
<table class="table table-striped">
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
                <td>${expense.title}</td>
                <td>${expense.vendor}</td>
                <td>${expense.category}</td>
                <td>${expense.amount}</td>
                <td>${expense.paymentMode}</td>
                <td>${expense.expenseDate}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<form action="addexpense" method="get">
    <button type="submit" class="btn btn-primary">Add Expense</button>
</form>

</body>
</html>
