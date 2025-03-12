package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.DB.DBConnect;
import com.entity.FlightDetails;

public class FlightDAOImpl implements FlightDAO {

	private Connection conn;

	public FlightDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addFlights(FlightDetails fl) {
		boolean f = false;
		try {

			String sql = "insert into fight_details(flightNo,flightName,fromCity,toCity,date,time,travelDuration,airportName,ticketPrice,email) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, fl.getFlightNo());
			ps.setString(2, fl.getFlightName());
			ps.setString(3, fl.getFromCity());
			ps.setString(4, fl.getToCity());
			ps.setString(5, fl.getDate());
			ps.setString(6, fl.getTime());
			ps.setString(7, fl.getTravelDuration());
			ps.setString(8, fl.getAirportName());
			ps.setString(9, fl.getTicketPrice());
			ps.setString(10, fl.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<FlightDetails> getAllFLights() {

		List<FlightDetails> list = new ArrayList<FlightDetails>();

		FlightDetails fl = null;

		try {

			String sql = "SELECT * FROM fight_details";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				fl = new FlightDetails();
				fl.setFlightNo(rs.getString(1));
				fl.setFlightName(rs.getString(2));
				fl.setFromCity(rs.getString(3));
				fl.setToCity(rs.getString(4));
				fl.setDate(rs.getString(5));
				fl.setTime(rs.getString(6));
				fl.setTravelDuration(rs.getString(7));
				fl.setAirportName(rs.getString(8));
				fl.setTicketPrice(rs.getString(9));
				fl.setEmail(rs.getString(10));
				list.add(fl);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public FlightDetails getFlightDetails(String flightNo) {

		FlightDetails fl = null;

		try {

			String sql = "select * from fight_details where flightNo= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, flightNo);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				fl = new FlightDetails();
				fl.setFlightNo(rs.getString(1));
				fl.setFlightName(rs.getString(2));
				fl.setFromCity(rs.getString(3));
				fl.setToCity(rs.getString(4));
				fl.setDate(rs.getString(5));
				fl.setTime(rs.getString(6));
				fl.setTravelDuration(rs.getString(7));
				fl.setAirportName(rs.getString(8));
				fl.setTicketPrice(rs.getString(9));
				fl.setEmail(rs.getString(10));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fl;

	}

	public boolean updateEditFlightDetails(FlightDetails fl) {
		boolean f = false;
		try {

			String sql = "UPDATE fight_details SET  date=?, time=?, travelDuration=?,ticketPrice=? WHERE flightNo=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, fl.getDate());
			ps.setString(2, fl.getTime());
			ps.setString(3, fl.getTravelDuration());
			ps.setString(4, fl.getTicketPrice());
			ps.setString(5, fl.getFlightNo());

			int i = ps.executeUpdate();
			if (i == 1) {

				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteflight(String flightNo) {
		boolean f = false;

		try {
			String sql = "DELETE FROM fight_details WHERE flightNo=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, flightNo);
			int j = ps.executeUpdate();

			if (j == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<FlightDetails> getAllFlightDetails() {
		List<FlightDetails> list = new ArrayList<FlightDetails>();

		FlightDetails af = null;

		try {
			String sql = "select * from fight_details";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				af = new FlightDetails();
				af.setFlightNo(rs.getString(1));
				af.setFlightName(rs.getString(2));
				af.setFromCity(rs.getString(3));
				af.setToCity(rs.getString(4));
				af.setDate(rs.getString(5));
				af.setTime(rs.getString(6));
				af.setTravelDuration(rs.getString(7));
				af.setAirportName(rs.getString(8));
				af.setTicketPrice(rs.getString(9));
				list.add(af);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<FlightDetails> getBySearch(String fromCity, String toCity, String travelDate) {
		List<FlightDetails> list = new ArrayList<FlightDetails>();
		FlightDetails fl = null;
		try {
			String sql = "SELECT * FROM fight_details WHERE fromCity LIKE ? AND toCity LIKE ? AND date LIKE ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + fromCity + "%");
			ps.setString(2, "%" + toCity + "%");
			ps.setString(3, "%" + travelDate + "%");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				fl = new FlightDetails();
				fl.setFlightNo(rs.getString(1));
				fl.setFlightName(rs.getString(2));
				fl.setFromCity(rs.getString(3));
				fl.setToCity(rs.getString(4));
				fl.setDate(rs.getString(5));
				fl.setTime(rs.getString(6));
				fl.setTravelDuration(rs.getString(7));
				fl.setAirportName(rs.getString(8));
				fl.setTicketPrice(rs.getString(9));
				fl.setEmail(rs.getString(10));
				list.add(fl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
