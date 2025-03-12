<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<li><a href="homepage.jsp">Home</a></li>
			<li><a href="searchFlight.jsp">Book Flights</a></li>
			<li><a href="myJourney.jsp">My Journey</a></li>
			<c:if test="${not empty userobj}">
				<li style="margin-right: auto;"><a href="login.jsp">Hi,${userobj.name}</a></li>
				<li><a onclick="document.getElementById('id01').style.display='block'">Logout</a></li>
			</c:if>
			<c:if test="${empty userobj}">
				<li ><a href="login.jsp">Login</a></li>
				<li ><a href="register.jsp">Sign-up</a></li>
			</c:if>
			<li><a href="editProfile.jsp"><i class="fa fa-cog" aria-hidden="true"></i></a></li>
		</ul>
	</div>
		<!-- logout modal -->
	<div id="id01" class="modal">
		<span onclick="document.getElementById('id01').style.display='none'"
			class="close" title="Close Modal">×</span>
		<form class="modal-content" action="/action_page.php">
			<div class="logout-container">
				<p>Are you sure you want to Logout</p>
				<hr>
				<div class="clearfix">
					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
					<a href="logout">
						<button type="button"
							onclick="document.getElementById('id01').style.display='none'"
							class="deletebtn">Logout</button>
					</a>
				</div>
			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<!-- end logout modal -->
</body>
</html>