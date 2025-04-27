<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<h2>Login</h2>

<form action="loginpost" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <label for="pass">Password:</label><br>
    <input type="password" id="pass" name="pass" required><br><br>

    <input type="submit" value="Login">
</form>


<p>Don't have an account? <a href="clientSignUp">Sign up here</a></p>

</body>
</html>
