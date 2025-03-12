<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css"
	href="admincss/navbar.css">
	 <link rel="stylesheet" type="text/css"
	href="admincss/homepage.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>
 <h1> Welcome to Fast Airline Service</h1>
 
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
					<a href="../logout">
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