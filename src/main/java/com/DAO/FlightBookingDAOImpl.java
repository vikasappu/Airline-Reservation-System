package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.FlightBooking;
import com.entity.FlightDetails;

public class FlightBookingDAOImpl implements FlightBookingDAO {

	private Connection conn;

	public FlightBookingDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean savebooking(List<FlightBooking> ilist) {
		boolean f = false;

		try {
			String sql = "INSERT INTO flight_booking (bookingId, flightNo, email, phoneNo, bookingDate, numofPerson, address, finalPrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (FlightBooking fb : ilist) {

				// Ensure numofPerson is not null or empty before parsing
				int numPersons = 1; // Default value if null or invalid
				if (fb.getNumofPerson() != null && !fb.getNumofPerson().trim().isEmpty()) {
					try {
						numPersons = Integer.parseInt(fb.getNumofPerson().trim());
					} catch (NumberFormatException e) {
						System.out.println("Invalid numofPerson value: " + fb.getNumofPerson());
					}
				}

				// Calculate final price
				double finalPrice = numPersons * getTicketPriceFromDB(fb.getFlightNo());
				fb.setFinalPrice(finalPrice); // Set the calculated price in the object

				// Set values in PreparedStatement
				ps.setString(1, fb.getBookingId());
				ps.setString(2, fb.getFlightNo());
				ps.setString(3, fb.getEmail());
				ps.setString(4, fb.getPhoneNo());
				ps.setString(5, fb.getBookingDate());
				ps.setString(6, fb.getNumofPerson());
				ps.setString(7, fb.getAddress());
				ps.setDouble(8, fb.getFinalPrice());

				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public FlightBooking getFlightDetailsByBookingId(String bookingId) {
		FlightBooking flight = null;
		try {
			String query = "SELECT * FROM flight_booking WHERE bookingId=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookingId);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				flight = new FlightBooking();
				flight.setBookingId(rs.getString("bookingId"));
				flight.setFlightNo(rs.getString("flightNo"));
				flight.setEmail(rs.getString("email"));
				flight.setPhoneNo(rs.getString("phoneNo"));
				flight.setBookingDate(rs.getString("bookingDate"));
				flight.setNumofPerson(rs.getString("numofPerson"));
				flight.setAddress(rs.getString("address"));
				flight.setFinalPrice(rs.getDouble("finalPrice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flight;
	}

	public double getTicketPriceFromDB(String flightNo) {
		double ticketPrice = 0.0;
		try {
			// Fixed table name typo from fight_details to flight_details
			String sql = "SELECT ticketPrice FROM fight_details WHERE flightNo=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, flightNo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ticketPrice = rs.getDouble("ticketPrice");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ticketPrice;
	}

	public boolean updateBookingStatus(String bookingId, String paymentStatus) {
		boolean updated = false;
		PreparedStatement ps = null;

		try {
			String sql = "UPDATE flight_booking SET paymentStatus = ? WHERE bookingId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, paymentStatus);
			ps.setString(2, bookingId);

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				updated = true;
				System.out.println("✅ Booking status updated to: " + paymentStatus);
			} else {
				System.out.println("❌ Booking status update failed!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return updated;
	}

	// Fix: Ensure this method returns a List<FlightBooking>
	public List<FlightBooking> getDetailsbyUser(String email) {
		List<FlightBooking> list = new ArrayList<FlightBooking>();
		try {
			String query = "SELECT * FROM flight_booking WHERE email=? AND paymentStatus IS NOT NULL";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				FlightBooking fb = new FlightBooking();
				fb.setFlightNo(rs.getString("flightNo"));
				fb.setEmail(rs.getString("email"));
				fb.setPhoneNo(rs.getString("phoneNo"));
				fb.setNumofPerson(rs.getString("numofPerson"));
				fb.setFinalPrice(rs.getDouble("finalPrice"));
				list.add(fb); // Add each booking to the list
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<FlightBooking> getALLBookingDetails() {
		List<FlightBooking> list = new ArrayList<FlightBooking>();

		try {
			String sql = "SELECT bookingId, flightNo, bookingDate, email, phoneNo, numofPerson, finalPrice FROM flight_booking";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				FlightBooking fl = new FlightBooking();
				fl.setBookingId(rs.getString("bookingId"));
				fl.setFlightNo(rs.getString("flightNo"));
				fl.setBookingDate(rs.getString("bookingDate"));
				fl.setEmail(rs.getString("email"));
				fl.setPhoneNo(rs.getString("phoneNo"));
				fl.setNumofPerson(rs.getString("numofPerson"));
				fl.setFinalPrice(rs.getDouble("finalPrice"));

				list.add(fl);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<FlightBooking> getDeatialsBySearch(String ch) {
		List<FlightBooking> list = new ArrayList<FlightBooking>();

		FlightBooking fl = null;

		try {
			String sql = "select * from  flight_booking where flightNo like ? or bookingId like ? or bookingDate like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				fl = new FlightBooking();
				fl.setFlightId(rs.getInt(1));
				fl.setBookingId(rs.getString(2));
				fl.setFlightNo(rs.getString(3));
				fl.setEmail(rs.getString(4));
				fl.setPhoneNo(rs.getString(5));
				fl.setBookingDate(rs.getString(6));
				fl.setNumofPerson(rs.getString(7));
				fl.setAddress(rs.getString(8));
				fl.setFinalPrice(rs.getDouble(9));
				list.add(fl);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
