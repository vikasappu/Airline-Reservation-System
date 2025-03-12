<%@page import="com.DAO.FlightBookingDAOImpl"%>
<%@page import="com.entity.FlightBooking"%>
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
<title>Confirmation</title>
<link rel="stylesheet" type="text/css" href="css/confirmation.css">
</head>
<body>


	<%
	
	
	// Ensure user session exists
	User u = (User) session.getAttribute("userobj");
	

	// Fetch Flight Details
	String flightNo = request.getParameter("flightNo");
	FlightDetails flight = null;
	if (flightNo != null && !flightNo.trim().isEmpty()) {
		FlightDAOImpl flightDao = new FlightDAOImpl(DBConnect.getConn());
		flight = flightDao.getFlightDetails(flightNo);
	}

	// Fetch Flight Booking Details
	String bookingId = request.getParameter("bookingId");
	FlightBooking fl = null;

	if (bookingId != null && !bookingId.trim().isEmpty()) {
		FlightBookingDAOImpl flightDao1 = new FlightBookingDAOImpl(DBConnect.getConn());
		fl = flightDao1.getFlightDetailsByBookingId(bookingId);
		session.setAttribute("fl", flightDao1);
	}
	%>




	<div class="container">
		<c:if test="${not empty succMsg }">
			<div class="alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedMsg}">
			<div class="alert-danger" role="alert">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<div class="left">
			<div class="header">Confirm Detail</div>

			<%
			if (flight != null) {
			%>
			<div class="row">
				<div class="label">Flight No.:</div>
				<div class="value"><%=flight.getFlightNo()%></div>
			</div>
			<div class="row">
				<div class="label">Flight Name:</div>
				<div class="value"><%=flight.getFlightName()%></div>
			</div>
			<div class="row">
				<div class="label">Travel:</div>
				<div class="value"><%=flight.getFromCity()%>
					to
					<%=flight.getToCity()%></div>
			</div>
			<div class="row">
				<div class="label">Departure:</div>
				<div class="value"><%=flight.getDate()%></div>
			</div>
			<div class="row">
				<div class="label">Time:</div>
				<div class="value"><%=flight.getTime()%></div>
			</div>
			<div class="row">
				<div class="label">Travel Duration:</div>
				<div class="value"><%=flight.getTravelDuration()%></div>
			</div>
			<div class="row">
				<div class="label">Airport Name:</div>
				<div class="value"><%=flight.getAirportName()%></div>
			</div>
			<div class="row">
				<div class="label">Ticket Price:</div>
				<div class="value">
					$<%=flight.getTicketPrice()%></div>
			</div>
			<%
			} else {
			%>
			<div class="error" style="color: red;">Flight details not
				found. Please try again.</div>
			<%
			}
			%>

			<div class="header">Your Details</div>

			<%
			if (fl != null) {
			%>
			<input type="hidden" name="bookingId" value="<%=fl.getBookingId()%>">
			<div class="row">
				<div class="label">Name:</div>
				<div class="value"><%=u.getName()%></div>
			</div>
			<div class="row">
				<div class="label">Contact No.:</div>
				<div class="value"><%=fl.getPhoneNo()%></div>
			</div>
			<div class="row">
				<div class="label">Email ID:</div>
				<div class="value"><%=fl.getEmail()%></div>
			</div>
			<div class="row">
				<div class="label">Booking Date:</div>
				<div class="value"><%=fl.getBookingDate()%></div>
			</div>
			<div class="row">
				<div class="label">No of Persons:</div>
				<div class="value"><%=fl.getNumofPerson()%></div>
			</div>
			<div class="row">
				<div class="label">Address:</div>
				<div class="value"><%=fl.getAddress()%></div>
			</div>
			<div class="row">
				<div class="label">Final price:</div>
				<div class="value">
					$<%=Integer.parseInt(fl.getNumofPerson()) * Double.parseDouble(flight.getTicketPrice())%></div>
			</div>
			<%
			} else {
			%>
			<div class="error" style="color: red;">Booking details not
				found. Please try again.</div>
			<%
			}
			%>

		</div>

		<c:if test="${not empty succMsg }">
			<div class="alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedMsg}">
			<div class="alert-danger" role="alert">${failedMsg}</div>
			<c:remove var="failedMsg" scope="session" />
		</c:if>


		<div class="right">
			<div class="header">Payment</div>
			<form action="Payment" method="post">
				<input type="hidden" name="bookingId"
					value="<%=request.getParameter("bookingId")%>">
				<div class="form-group">
					<label>Card No. *</label> <input type="text" name="cardNumber"
						placeholder="Enter Card Number" required>
				</div>
				<div class="form-group">
					<label>Card Holder Name *</label> <input type="text"
						name="cardHolder" placeholder="Enter Card Holder Name" required>
				</div>
				<div class="form-group">
    <label>Month *</label>
    <input type="text" id="expiryMonth" name="expiryMonth" placeholder="MM" maxlength="2" required>
    <span id="month-error" style="color: red;"></span>
</div>

<div class="form-group">
    <label>Year *</label>
    <input type="text" id="expiryYear" name="expiryYear" placeholder="YYYY" maxlength="4" required>
    <span id="year-error" style="color: red;"></span>
</div>
				<div class="form-group">
					<label>CVV No. *</label> <input type="text" name="cvv"
						placeholder="Enter CVV" maxlength="3" required>
				</div>
				<div class="form-group">
					<label>Amount:</label> <input type="text" name="amount"
						value="<%=fl.getFinalPrice()%>" readonly>
				</div>
				<div class="form-buttons">
					<button type="submit" class="btn btn-primary">Payment and
						Book</button>
					<button type="reset" class="btn btn-secondary">Cancel</button>
				</div>
			</form>
		</div>
	</div>
<script>
    document.getElementById("expiryMonth").addEventListener("input", function () {
        var month = this.value;
        var errorMessage = document.getElementById("month-error");

        // Allow only numbers
        this.value = month.replace(/\D/g, '');

        // Validate month range
        if (this.value.length === 2) {
            var monthNum = parseInt(this.value, 10);
            if (monthNum < 1 || monthNum > 12) {
                errorMessage.textContent = "Invalid month (01 - 12)!";
            } else {
                errorMessage.textContent = "";
            }
        } else {
            errorMessage.textContent = "";
        }
    });

    document.getElementById("expiryYear").addEventListener("input", function () {
        var year = this.value;
        var errorMessage = document.getElementById("year-error");

        // Allow only numbers
        this.value = year.replace(/\D/g, '');

        var currentYear = new Date().getFullYear();
        var maxYear = 2040;

        // Validate year range
        if (this.value.length === 4) {
            var yearNum = parseInt(this.value, 10);
            if (yearNum < currentYear || yearNum > maxYear) {
                errorMessage.textContent = "Year must be between " + currentYear + " and " + maxYear + "!";
            } else {
                errorMessage.textContent = "";
            }
        } else {
            errorMessage.textContent = "";
        }
    });
</script>
</body>
</html>
