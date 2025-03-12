package com.admin.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.FlightDAOImpl;
import com.DB.DBConnect;
import com.entity.FlightDetails;


@WebServlet("/addFlight")
public class AddFlight extends HttpServlet {
	


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
			 String flightNo = req.getParameter("flightno");
			 String flightName = req.getParameter("flightname");
			 String fromCity =  req.getParameter("fromcity");
			 String toCity = req.getParameter("tocity");
			 String date = req.getParameter("date");
			 String time = req.getParameter("time");
		     String travelDuration = req.getParameter("travelduration");
		     String airportName = req.getParameter("airportname");
		     String ticketPrice = req.getParameter("ticketprice");
		     
		     
		     
		     FlightDetails fl = new FlightDetails(flightNo,flightName,fromCity,toCity,date,time,travelDuration,airportName,ticketPrice,"admin");
		    
		     FlightDAOImpl dao = new FlightDAOImpl(DBConnect.getConn());
		     
		     boolean f = dao.addFlights(fl);
		     HttpSession session = req.getSession();
		     
		     if(f)
		     {
		    	 session.setAttribute("succMsg", "Flights add Successfully");
		    	 resp.sendRedirect("admin/addFlight.jsp");
		     }else {
		    	 session.setAttribute("failedMsg", "Something Wrong on Server");
		    	 resp.sendRedirect("admin/addFlight.jsp");
		     }
		    
		        
			 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
