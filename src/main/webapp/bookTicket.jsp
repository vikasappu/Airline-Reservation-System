<%@page import="com.entity.FlightBooking"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.FlightBookingDAOImpl"%>
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
<link rel="stylesheet" type="text/css" href="css/bookTicket.css">
</head>
<body>
	<%@include file="css/navbar.jsp"%>
	<%
User u =(User)session.getAttribute("userobj");
%>



	<div class="container">
		<h2>Book Ticket</h2>
		<form action="flightbooking" method="post">

			<input type="hidden" name="flightNo"
				value="<%= request.getParameter("flightNo") %>">

			<div class="form-group">
				<label>Email Id *</label> <input type="email" name="email"
					value="${userobj.email}" readonly="readonly" required>
			</div>
			<div class="form-group">
    <label>Mobile No. *</label>
    <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}" maxlength="10">
    <span id="phone-error" style="color: red;"></span>
</div>
			<div class="form-group">
				<label>Date *</label> <input type="date" name="date" id="date"
					readonly required>

			</div>
			<div class="form-group">
				<label>No Of Person *</label> <input type="number" value="1" min="1"
					name="noofpersons" required>
			</div>
			<div class="form-group">
				<label>Address *</label>
				<textarea name="address" required></textarea>
			</div>
			<div class="buttons">
				<button type="submit" class="btn btn-primary">Process To
					PayMent</button>
				<button type="reset" class="btn btn-secondary">Cancel</button>

			</div>
		</form>
	</div>

	<script>
    document.addEventListener("DOMContentLoaded", function () {
        let today = new Date().toISOString().split('T')[0];
        document.getElementById('date').value = today;
    });
</script>
<script>
    document.getElementById("phone").addEventListener("input", function () {
        var phone = this.value;
        var errorMessage = document.getElementById("phone-error");

        // Remove non-numeric characters
        this.value = phone.replace(/\D/g, '');

        if (this.value.length !== 10) {
            errorMessage.textContent = "Mobile number must be exactly 10 digits!";
        } else {
            errorMessage.textContent = "";
        }
    });
</script>

</body>
</html>