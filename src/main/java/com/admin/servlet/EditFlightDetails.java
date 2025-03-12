package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.FlightDAOImpl;
import com.DB.DBConnect;
import com.entity.FlightDetails;

@WebServlet("/editflightdetails")
public class EditFlightDetails extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String flightNo = req.getParameter("flightno");
			 String date = req.getParameter("date");
			 String time = req.getParameter("time");
		     String travelDuration = req.getParameter("travelduration");
		     String ticketPrice = req.getParameter("ticketprice");
		     
		     FlightDetails fl = new FlightDetails();
		     fl.setFlightNo(flightNo);
		     fl.setDate(date);
		     fl.setTime(time);
		     fl.setTravelDuration(travelDuration);
		     fl.setTicketPrice(ticketPrice);
		     
		     FlightDAOImpl dao = new FlightDAOImpl(DBConnect.getConn());
		     boolean f = dao.updateEditFlightDetails(fl);
		     HttpSession session = req.getSession();
		     if(f) {
		    	 
		    	 session.setAttribute("succMsg", "Flight Updated Successfully..");
		    	 resp.sendRedirect("admin/flightReport.jsp");
		    	 
		     }else {
		    	 session.setAttribute("failedMsg", "Something Wrong on Server..");
		    	 resp.sendRedirect("admin/flightReport.jsp");
		     }
		     
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
