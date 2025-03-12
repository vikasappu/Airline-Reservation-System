package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.FlightBookingDAOImpl;
import com.DB.DBConnect;
import com.entity.FlightBooking;
import com.entity.User;

@WebServlet("/flightbooking")
public class FlightBookingServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();

			String flightNo = req.getParameter("flightNo");
			String email = req.getParameter("email");
			String phoneNo = req.getParameter("phone");
			String bookingDate = req.getParameter("date");
			String numofPersons = req.getParameter("noofpersons");
			String address = req.getParameter("address");

			System.out.println("Booking Details:");
			System.out.println("Flight No: " + flightNo);
			System.out.println("Email: " + email);
			System.out.println("Phone: " + phoneNo);
			System.out.println("Booking Date: " + bookingDate);
			System.out.println("No of Persons: " + numofPersons);
			System.out.println("Address: " + address);

			FlightBooking booking = new FlightBooking();
			Random r = new Random();
			String bookingId = "FB-ORD-00" + r.nextInt(10000);
			booking.setBookingId(bookingId);
			booking.setFlightNo(flightNo);
			booking.setEmail(email);
			booking.setPhoneNo(phoneNo);
			booking.setBookingDate(bookingDate);
			booking.setNumofPerson(numofPersons);
			booking.setAddress(address);

			List<FlightBooking> bookingList = new ArrayList<FlightBooking>();
			bookingList.add(booking);

			Connection conn = DBConnect.getConn();
			FlightBookingDAOImpl dao = new FlightBookingDAOImpl(conn);
			boolean success = dao.savebooking(bookingList);

			User u = (User) session.getAttribute("userobj");

			if (success) {
				// ✅ Store flight and booking details in session
				session.setAttribute("flightNo", flightNo);
				session.setAttribute("bookingId", bookingId);

				// ✅ Redirect with parameters
				resp.sendRedirect("confirmation.jsp?flightNo=" + flightNo + "&bookingId=" + bookingId);
			} else {
				resp.sendRedirect("bookTicket.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
