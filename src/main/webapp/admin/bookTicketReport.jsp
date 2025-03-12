<%@page import="com.entity.FlightBooking"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.FlightBookingDAOImpl"%>
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
	href="admincss/bookTicketReport.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
  <h2>Book Ticket List</h2>
  <form action="search2.jsp" method="post"> 
  <div class="search-box">
    
    <input type="text" placeholder="Search By Flight No or Booking Id" name="ch">
    <button>Search</button>
  </div>
  </form>
  <%
FlightBookingDAOImpl dao = new FlightBookingDAOImpl(DBConnect.getConn());
List<FlightBooking> list = dao.getALLBookingDetails();
if (list.isEmpty()) {
    out.println("<h3 style='color:red;'>❌ No Booking Data Found!</h3>");
} else {
%>
    <table>
        <tr>
            <th>Booking Id</th>
            <th>Flight No </th>
            <th>Booking Date</th>
            <th>Email Id</th>
            <th>Phone No</th>
            <th>No Of Person</th>
            <th>Amount Paid</th>
        </tr>
        <% for(FlightBooking fl : list) { %>
            <tr>
                <td><%=fl.getBookingId() %></td>
                <td><%=fl.getFlightNo() %></td>
                <td><%=fl.getBookingDate() %></td>
                <td><%=fl.getEmail() %></td>
                <td><%=fl.getPhoneNo() %></td>
                <td><%=fl.getNumofPerson() %></td>
                <td><%=fl.getFinalPrice()%></td>
            </tr>
        <% } %>
    </table>
<% } %>
  <div class="action-buttons">
    <button>Previous</button>

    <button>Next</button>
  </div>
</div>

</body>
</html>