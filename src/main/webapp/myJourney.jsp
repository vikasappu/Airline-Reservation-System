<%@page import="com.DAO.FlightBookingDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.FlightDAOImpl"%>
<%@page import="com.entity.FlightDetails"%>
<%@page import="com.entity.FlightBooking"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Bookings</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/myJourney.css">
<link rel="stylesheet" type="text/css" href="css/navbar.css">
</head>
<body>

	<%@include file="css/navbar.jsp"%>

	<%
User u = (User) session.getAttribute("userobj");

if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}

// Initialize DAO
FlightBookingDAOImpl flightDao = new FlightBookingDAOImpl(DBConnect.getConn());
FlightDAOImpl fDao = new FlightDAOImpl(DBConnect.getConn());

// Fetch bookings for the logged-in user
List<FlightBooking> bookingList = flightDao.getDetailsbyUser(u.getEmail());

%>

	<table border="1" align="center">
		<!-- Success and Error Messages -->
		<c:if test="${not empty failedMsg}">
			<div class="error-message">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<c:if test="${not empty succMsg}">
			<div class="success-message">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<tr>
			<th>Flight Number</th>
			<th>Flight Name</th>
			<th>From City</th>
			<th>To City</th>
			<th>Date</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>Number of Persons</th>
			<th>Amount Paid</th>
		</tr>

		<%
    if (bookingList != null && !bookingList.isEmpty()) {
        for (FlightBooking booking : bookingList) {
            // Fetch flight details dynamically for each booking
            FlightDetails flightDetails = fDao.getFlightDetails(booking.getFlightNo());

            if (flightDetails != null) {
    %>
		<tr>
			<td><%= booking.getFlightNo() %></td>
			<td><%= flightDetails.getFlightName() %></td>
			<td><%= flightDetails.getFromCity() %></td>
			<td><%= flightDetails.getToCity() %></td>
			<td><%= flightDetails.getDate() %></td>
			<td><%= booking.getEmail() %></td>
			<td><%= booking.getPhoneNo() %></td>
			<td><%= booking.getNumofPerson() %></td>
			<td><%= booking.getFinalPrice() %></td>
		</tr>
		<%
            } else { // If flight details are missing
    %>
		<tr>
			<td colspan="9" align="center">Flight details not found for
				Flight No: <%= booking.getFlightNo() %></td>
		</tr>
		<%
            }
        }
    } else {
    %>
		<tr>
			<td colspan="9" align="center">No flight bookings found.</td>
		</tr>
		<%
    }
    %>
	</table>

</body>
</html>
