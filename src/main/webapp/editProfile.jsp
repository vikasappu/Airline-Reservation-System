<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/navbar.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>


	<%@ include file="css/navbar.jsp"%>
	<%
User u = (User) session.getAttribute("userobj");

if (u == null) {
%>
	<script>
        alert("Please log in to access this page.");
        window.location.href = "login.jsp";
    </script>
	<%
    return;
}
%>

	<div class="container">
		<h2>Edit Profile</h2>

		<c:if test="${not empty succMsg}">
			<p style="text-align: center; color: lawngreen;">${succMsg}</p>
		</c:if>
		<c:remove var="succMsg" scope="session" />

		<c:if test="${not empty failedMsg}">
			<p style="text-align: center; color: red;">${failedMsg}</p>
		</c:if>
		<c:remove var="failedMsg" scope="session" />

		<form action="editprofile" method="post">
			<input type="hidden" value="${userobj.id}" name="id">
			<div class="input-group">
				<label for="username">UserName</label> <input type="text"
					id="username" name="username" required value="${userobj.name}">
			</div>
			<div class="input-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required value="${userobj.email}">
			</div>
			<div class="input-group">
				<label for="password">Enter Password</label> <div class="password-container">
				<input type="password" class="input-box" id="password"
					name="password"  required> <i
					class="fa fa-eye-slash toggle-password" id="togglePassword"></i>
			</div>
			</div>

			<span id="error-message" class="error-message"></span>

			<!-- Button Container for centering -->
			<div class="btn-container">
				<button type="submit" class="btn">Update</button>
			</div>

		</form>
	</div>

	<script>
    document.getElementById("register-form").addEventListener("submit", function(event) {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm-password").value;
        var errorMessage = document.getElementById("error-message");

        if (password !== confirmPassword) {
            event.preventDefault();
            errorMessage.textContent = "Passwords do not match!";
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