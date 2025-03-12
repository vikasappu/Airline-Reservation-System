<%@page import="com.entity.FlightBooking"%>
<%@page import="com.DAO.FlightBookingDAOImpl"%>
<%@page import="com.entity.FlightDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.FlightDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/navbar.css">
<link rel="stylesheet" type="text/css" href="css/searchFlight.css">
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>


	<%@include file="css/navbar.jsp"%>
	<div class="container">
		<h2>Flight List</h2>

		<c:if test="${not empty succMsg }">
			<div class="alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedMsg}">
			<div class="alert-danger" role="alert">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<form action="search.jsp" method="post">
			<input type="text" placeholder="Search by From City" name="fromCity"> <input
				type="text" name="toCity" placeholder="Search by To City"> <input
				type="date" name="travelDate" id="travelDate">
			<button>Search</button>
		</form>

		<table>
			<tr>
				<th>Flight No.</th>
				<th>Flight Name</th>
				<th>From City</th>
				<th>To City</th>
				<th>Date</th>
				<th>Time</th>
				<th>Travel Duration</th>
				<th>Airport Name</th>
				<th>Ticket Price</th>
				<th>Book</th>
			</tr>

			<%
			FlightDAOImpl dao = new FlightDAOImpl(DBConnect.getConn());
			List<FlightDetails> ilist = dao.getAllFlightDetails();
			for (FlightDetails i : ilist)

			{
			%>
			<tr>
				<td><%=i.getFlightNo()%></td>
				<td><%=i.getFlightName()%></td>
				<td><%=i.getFromCity()%></td>
				<td><%=i.getToCity()%></td>
				<td><%=i.getDate()%></td>
				<td><%=i.getTime()%></td>
				<td><%=i.getTravelDuration()%></td>
				<td><%=i.getAirportName()%></td>
				<td><%=i.getTicketPrice()%></td>



				<%
				if (u == null) {
				%>
				<td><a href="login.jsp"
					onclick="alert('Please log in to book a flight!');">
						<button class="book-btn">Book</button>
				</a></td>
				<%
				} else {
				%>
				<td><a href="bookTicket.jsp?flightNo=<%=i.getFlightNo()%>">
						<button class="book-btn">Book</button>
				</a></td>
				<%
				}
				%>


			</tr>
			<%
			}
			%>
		</table>
		<div class="pagination">
			<button>Previous</button>
			<button>Next</button>
		</div>
	</div>
	<script>
    // Get today's date in YYYY-MM-DD format
    let today = new Date().toISOString().split("T")[0];
    // Set the minimum date in the input field
    document.getElementById("travelDate").setAttribute("min", today);
</script>
</body>
</html>