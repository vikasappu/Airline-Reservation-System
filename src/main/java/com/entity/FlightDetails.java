package com.entity;

import java.time.LocalDate;
import java.time.LocalTime;

public class FlightDetails {

	private String flightNo;
	private String flightName;
	private String fromCity;
	private String toCity;
	private String date;
	private String time;
	private String travelDuration;
	private String airportName;
	private String ticketPrice;
	private String email;

	public FlightDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FlightDetails(String flightNo, String flightName, String fromCity, String toCity, String date, String time,
			String travelDuration, String airportName, String ticketPrice, String email) {
		super();
		this.flightNo = flightNo;
		this.flightName = flightName;
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.date = date;
		this.time = time;
		this.travelDuration = travelDuration;
		this.airportName = airportName;
		this.ticketPrice = ticketPrice;
		this.email = email;
	}

	public String getFlightNo() {
		return flightNo;
	}

	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	public String getFromCity() {
		return fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public String getToCity() {
		return toCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTravelDuration() {
		return travelDuration;
	}

	public void setTravelDuration(String travelDuration) {
		this.travelDuration = travelDuration;
	}

	public String getAirportName() {
		return airportName;
	}

	public void setAirportName(String airportName) {
		this.airportName = airportName;
	}

	public String getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(String ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String Email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "FlightDetails [flightNo=" + flightNo + ", flightName=" + flightName + ", fromCity=" + fromCity
				+ ", toCity=" + toCity + ", date=" + date + ", time=" + time + ", travelDuration=" + travelDuration
				+ ", airportName=" + airportName + ", ticketPrice=" + ticketPrice + ", email=" + email + "]";
	}

}
