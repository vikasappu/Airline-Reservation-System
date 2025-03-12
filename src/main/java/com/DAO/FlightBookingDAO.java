package com.DAO;

import java.util.List;

import com.entity.FlightBooking;

public interface FlightBookingDAO {

	public boolean savebooking(List<FlightBooking> ilist);

	public FlightBooking getFlightDetailsByBookingId(String bookingId);

	public double getTicketPriceFromDB(String flightNo);

	public boolean updateBookingStatus(String bookingId, String status);

	public List<FlightBooking> getDetailsbyUser(String email);

	public List<FlightBooking> getALLBookingDetails();

	public List<FlightBooking> getDeatialsBySearch(String ch);
	

	
	
	
	
	

	

}
