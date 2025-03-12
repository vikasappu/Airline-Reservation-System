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
@WebServlet("/delete")

public class DeleteFlight extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String flightNo = req.getParameter("flightNo");

			   
			   FlightDAOImpl dao = new FlightDAOImpl(DBConnect.getConn());
			   
			   boolean f= dao.deleteflight(flightNo);
			   
			   HttpSession session=req.getSession();
				if(f) {
					session.setAttribute("succMsg", "Flight Delete Successfully..");
					resp.sendRedirect("admin/flightReport.jsp");
				} else
				{
					session.setAttribute("failedMsg", "Something Wrong on Server");
					resp.sendRedirect("admin/flightReport.jsp");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
