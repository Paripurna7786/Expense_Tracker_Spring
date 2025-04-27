<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>

<h2>Sign Up</h2>

<form action="clientsignuppost" method="post">
    <label for="fname">First Name:</label><br>
    <input type="text" id="fname" name="fname" required><br><br>

    <label for="lname">Last Name:</label><br>
    <input type="text" id="lname" name="lname" required><br><br>

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <label for="pass">Password:</label><br>
    <input type="password" id="pass" name="pass" required><br><br>

    <label for="gender">Gender:</label><br>
    <select id="gender" name="gender" required>
        <option value="">Select</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select><br><br>

    <input type="submit" value="Sign Up">
</form>

<!-- Display Messages -->
<c:if test="${not empty errorMessage}">
    <p style="color:red;">${errorMessage}</p>
</c:if>

<c:if test="${not empty successMessage}">
    <p style="color:green;">${successMessage}</p>
</c:if>


<p>Already have an account? <a href="Clientogin">Login here</a></p>

</body>
</html>
