<%@page import="com.entity.FlightDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.FlightDAOImpl"%>
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
    <h2>Edit Flight Details</h2>
      
    <%
    String flightNo = (request.getParameter("flightNo"));
    FlightDAOImpl dao = new FlightDAOImpl(DBConnect.getConn());
    FlightDetails fl = dao.getFlightDetails(flightNo);
    
    %>
    
    <form action="../editflightdetails" method="post">
       <input type="hidden" name="flightno" value="<%=fl.getFlightNo()%>">
       
        <div class="form-group">
            <label>Date*</label>
            <input type="date" name="date" required value="<%=fl.getDate()%>">
        </div>
        <div class="form-group">
            <label>Time*</label>
            <input type="time" name="time" required value="<%=fl.getTime()%>">
        </div>
        <div class="form-group">
            <label>Travel Duration*</label>
            <input type="text" name="travelduration" placeholder="Enter Travel Duration" required value="<%=fl.getTravelDuration()%>">
        </div>
        <div class="form-group">
            <label>Ticket Price*</label>
            <input type="text" name="ticketprice" placeholder="Enter Ticket Price" required value="<%=fl.getTicketPrice()%>" >
        </div>
     
        <div class="buttons">
            <button type="submit" class="save">Update</button>        
        </div>
    </form>
</div>
</body>
</html>