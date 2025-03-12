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
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
 <%@ include file="css/navbar.jsp"%>

    <div class="container">
        <h2>Register</h2>

        <c:if test="${not empty succMsg}">
            <p style="text-align: center; color: lawngreen;">${succMsg}</p>
        </c:if>
        <c:remove var="succMsg" scope="session" />

        <c:if test="${not empty failedMsg}">
            <p style="text-align: center; color: red;">${failedMsg}</p>
        </c:if>
        <c:remove var="failedMsg" scope="session" />

        <form id="register-form" action="register" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
               <div class="password-container">
				<input type="password" class="input-box" id="password"
					name="password"  required> <i
					class="fa fa-eye-slash toggle-password" id="togglePassword"></i>
			</div>
            </div>
            <div class="input-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirmpassword" required>
            </div>
            <span id="error-message" class="error-message" style="color: red;"></span>

            <!-- Button Container for centering -->
            <div class="btn-container">
                <button type="submit" class="btn">Register</button>
            </div>
            <a href="login.jsp" class="signin-link">Already have an account? Sign-in</a>
        </form>
    </div>

    <script>
        document.getElementById("register-form").addEventListener("submit", function(event) {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm-password").value;
            var errorMessage = document.getElementById("error-message");

            // Regular expression for at least one letter, one number, and min length 8
            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d).{8,}$/;

            if (password !== confirmPassword) {
                event.preventDefault();
                errorMessage.textContent = "Passwords do not match!";
            } else if (!passwordPattern.test(password)) {
                event.preventDefault();
                errorMessage.textContent = "Password must be at least 8 characters long and contain at least one letter and one number!";
            } else {
                errorMessage.textContent = "";
            }
        });
    </script>
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