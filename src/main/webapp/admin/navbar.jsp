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
			<li><a class="active" href="home.jsp">Home</a></li>
			<li><a href="addFlight.jsp">Add Flights</a></li>
			<li><a href="flightReport.jsp">Flight Report</a></li>
			<li><a href="bookTicketReport.jsp">Book Ticket Report</a></li>
		    <c:if test="${not empty userobj}">
        <li class="admin">
            <c:choose>
                <c:when test="${userobj.name eq 'Admin'}">
                    <a href="#">Hi, Admin</a>
                </c:when>
                <c:otherwise>
                    <a href="#">${userobj.username}</a>
                </c:otherwise>
            </c:choose>
        </li>
        <li class="logout">
            <a onclick="document.getElementById('id01').style.display='block'">Logout</a>
        </li>
    </c:if>
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