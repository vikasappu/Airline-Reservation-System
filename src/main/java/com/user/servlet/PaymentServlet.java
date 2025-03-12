package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PaymentDAO;
import com.DAO.PaymentDAOImpl;
import com.DB.DBConnect;
import com.entity.Payment;
import com.entity.FlightBooking;
import com.DAO.FlightBookingDAO;
import com.DAO.FlightBookingDAOImpl;

@WebServlet("/Payment")
public class PaymentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			// Retrieve form parameters
			String bookingId = request.getParameter("bookingId");
			String cardNumber = request.getParameter("cardNumber");
			String cardHolder = request.getParameter("cardHolder");
			String expiryMonthStr = request.getParameter("expiryMonth");
			String expiryYearStr = request.getParameter("expiryYear");
			String amountStr = request.getParameter("amount");
			String cvv = request.getParameter("cvv");

			// Log received parameters for debugging
			System.out.println("Booking ID: " + bookingId);
			System.out.println("Card Number: " + cardNumber);
			System.out.println("Card Holder: " + cardHolder);
			System.out.println("Expiry Month: " + expiryMonthStr);
			System.out.println("Expiry Year: " + expiryYearStr);
			System.out.println("Amount: " + amountStr);

			// Validate required fields
			if (bookingId == null || bookingId.isEmpty() || expiryMonthStr == null || expiryYearStr == null
					|| amountStr == null || expiryMonthStr.isEmpty() || expiryYearStr.isEmpty() || amountStr.isEmpty()
					|| cvv == null) {

				session.setAttribute("failedMsg", "Missing required payment details!");
				response.sendRedirect("error.jsp");
				return;
			}

			// Convert string inputs to required data types
			int expiryMonth = Integer.parseInt(expiryMonthStr);
			int expiryYear = Integer.parseInt(expiryYearStr);
			double amount = Double.parseDouble(amountStr);

			// Create Payment object
			Payment payment = new Payment(bookingId, cardNumber, cardHolder, expiryMonth, expiryYear, cvv, amount);

			// Save payment details in the database
			PaymentDAOImpl paymentDAO = new PaymentDAOImpl(DBConnect.getConn());
			boolean paymentSuccess = paymentDAO.savePaymentDetails(payment);

			if (paymentSuccess) {
				// Fetch FlightBooking details using bookingId
				FlightBookingDAO flightBookingDAO = new FlightBookingDAOImpl(DBConnect.getConn());
				FlightBooking fl = flightBookingDAO.getFlightDetailsByBookingId(bookingId);

				if (fl != null) {
					session.setAttribute("flightBooking", fl);
					session.setAttribute("succMsg", "Flight booked successfully!");
				} else {
					session.setAttribute("failedMsg", "Flight booking details not found!");
				}

				response.sendRedirect("myJourney.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong. Please try again.");
				response.sendRedirect("myJourney.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
