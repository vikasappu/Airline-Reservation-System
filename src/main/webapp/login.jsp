<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/navbar.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

	<%@include file="css/navbar.jsp"%>

	<div class="login-container">
		<h2>Login</h2>
		<c:if test="${not empty failedMsg }">
			<p style="text-align: center; color: red; font-size: 20px">${failedMsg}</p>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<c:if test="${not empty succMsg }">
			<p style="text-align: center; color: lightgreen; font-size: 20px">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<form action="login" method="post">
			<input type="email" class="input-box" name="email"
				placeholder="Enter Email" required>
			<div class="password-container">
				<input type="password" class="input-box" id="password"
					name="password" placeholder="Enter Password" required> <i
					class="fa fa-eye-slash toggle-password" id="togglePassword"></i>
			</div>
			<button type="submit" class="login-btn">Login</button>
			
		</form>
		<a href="register.jsp" class="signup-link">Don't have an account?
			Sign up</a>
	</div>
	
	<script>
    document.getElementById("togglePassword").addEventListener("click", function() {
        let passwordInput = document.getElementById("password");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            this.classList.remove("fa-eye-slash");
            this.classList.add("fa-eye");
        } else {
            passwordInput.type = "password";
            this.classList.remove("fa-eye");
            this.classList.add("fa-eye-slash");
        }
    });
</script>
</body>
</html>