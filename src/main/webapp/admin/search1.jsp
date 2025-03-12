<%@page import="java.util.List"%>
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
	href="admincss/flightReport.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
    <h2>Flight List</h2>
    
       <c:if test="${not empty succMsg}">
    <p style="text-align: center; color: green; font-weight: bold;">${succMsg}</p>
    <c:remove var="succMsg" scope="session"/>
    </c:if>
    
        <c:if test="${not empty failedMsg}">
    <p style="text-align: center; color: red; font-weight: bold;">${failedMsg}</p>
    <c:remove var="failedMsg" scope="session"/>
    </c:if>
    <form action="search1.jsp" method="post">
   <div class="search-box">      
       <input type="text" placeholder="From City" name="fromCity">
<input type="text" placeholder="To City" name="toCity">
<input type="date" placeholder="Travel Date" name="travelDate">
 <button>Search</button>
    </div> 
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
            <th>Edit / Delete</th>
        </tr>
        
        
        <%
        String fromCity = request.getParameter("fromCity");
		String toCity = request.getParameter("toCity");
		String travelDate = request.getParameter("travelDate");
        FlightDAOImpl dao = new FlightDAOImpl(DBConnect.getConn());
        List<FlightDetails> list = dao.getBySearch(fromCity, toCity, travelDate);
        for(FlightDetails fl:list)
        {%>
        <tr>
           
            <td><%=fl.getFlightNo() %></td>
            <td><%=fl.getFlightName() %></td>
            <td><%=fl.getFromCity() %></td>
            <td><%=fl.getToCity() %></td>
            <td><%=fl.getDate() %></td>
            <td><%=fl.getTime() %></td>
            <td><%=fl.getTravelDuration() %></td>
            <td><%=fl.getAirportName() %></td>
            <td><%=fl.getTicketPrice()%></td>
            <td><button class="edit-btn"><a href="editFlightDetails.jsp?flightNo=<%= fl.getFlightNo() %>">Edit</a></button>
            <button class="edit-btn"><a href="../delete?flightNo=<%= fl.getFlightNo()%>">Delete</a></button>
            </td>
        </tr>	
        	
        <% 
        }
        
        %>
        
    </table>
    <div class="action-buttons">
        <button>Previous</button>
        <button><a href="addFlight.jsp">New</a></button>
        
        <button>Next</button>
    </div>
</div>
<script>
        function toggleSelectAll(source) {
            checkboxes = document.querySelectorAll('.row-checkbox');
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
        }
    </script>
</body>
</html>