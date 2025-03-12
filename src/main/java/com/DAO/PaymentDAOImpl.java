package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Payment;

public class PaymentDAOImpl implements PaymentDAO {
	private Connection conn;
	private FlightBookingDAO flightBookingDAO;

	public PaymentDAOImpl(Connection conn) {
		super();
		this.conn = conn;
		this.flightBookingDAO = new FlightBookingDAOImpl(conn);
	}

	public boolean savePaymentDetails(Payment payment) {
		boolean f = false;

		try {
			String sql = "INSERT INTO payments(bookingId, cardNumber, cardHolder, expiryMonth, expiryYear, cvv, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, payment.getBookingId());
			ps.setString(2, payment.getCardNumber());
			ps.setString(3, payment.getCardHolder());
			ps.setInt(4, payment.getExpiryMonth());
			ps.setInt(5, payment.getExpiryYear());
			ps.setString(6, payment.getCvv());
			ps.setDouble(7, payment.getAmount());
			int paymentInserted = ps.executeUpdate();

			if (paymentInserted > 0) {
				// ✅ Update Flight Booking status using FlightBookingDAO
				if (flightBookingDAO.updateBookingStatus(payment.getBookingId(), "Paid")) {
					f = true;
					System.out.println("✅ Payment inserted & Booking marked as PAID!");
				} else {
					System.out.println("❌ Payment inserted but Booking update failed!");
				}
			} else {
				System.out.println("❌ Payment insertion failed!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
