<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="admincss/navbar.css">
	 <link rel="stylesheet" type="text/css"
	href="admincss/addFlight.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
    <h2>Flight</h2>
    
    <c:if test="${not empty succMsg}">
    <p style="text-align: center; color: green">${succMsg}</p>
    <c:remove var="succMsg" scope="session"/>
    </c:if>
    
        <c:if test="${not empty failedMsg}">
    <p style="text-align: center; color: red">${failedMsg}</p>
    <c:remove var="failedMsg" scope="session"/>
    </c:if>
    
    
    <form action="../addFlight" method="post">
        <div class="form-group">
            <label>Flight No.*</label>
            <input type="text" name="flightno" placeholder="Enter Flight No." required>
        </div>
        <div class="form-group">
            <label>Flight Name*</label>
            <input type="text" name="flightname" placeholder="Enter Flight name" required>
        </div>
        <div class="form-group">
            <label>From City*</label>
            <input type="text" name="fromcity" placeholder="Enter From City" required>
        </div>
        <div class="form-group">
            <label>To City*</label>
            <input type="text" name="tocity" placeholder="Enter To City" required>
        </div>
        <div class="form-group">
            <label>Date*</label>
            <input type="date" name="date" required>
        </div>
        <div class="form-group">
            <label>Time*</label>
            <input type="time" name="time" required>
        </div>
        <div class="form-group">
            <label>Travel Duration*</label>
            <input type="text" name="travelduration" placeholder="Enter Travel Duration" required>
        </div>
        <div class="form-group">
            <label>Airport Name*</label>
            <input type="text" name="airportname" placeholder="Enter Airport Name" required>
        </div>
        <div class="form-group">
            <label>Ticket Price*</label>
            <input type="text" name="ticketprice" placeholder="Enter Ticket Price" required>
        </div>
     
        <div class="buttons">
            <button type="submit" class="save">Save</button>
            <button type="reset" class="reset">Reset</button>
        </div>
    </form>
</div>
</body>
</html>