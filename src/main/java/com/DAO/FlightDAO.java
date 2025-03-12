package com.DAO;

import java.util.List;

import com.entity.FlightDetails;

public interface FlightDAO {

	public boolean addFlights(FlightDetails fl);

	public List<FlightDetails> getAllFLights();

	public FlightDetails getFlightDetails(String flightNo);

	public boolean updateEditFlightDetails(FlightDetails fl);

	public boolean deleteflight(String flightNo);

	public List<FlightDetails> getAllFlightDetails();

	public List<FlightDetails> getBySearch(String fromCity, String toCity, String travelDate);

}
