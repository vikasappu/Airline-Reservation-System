package com.entity;

public class FlightBooking {

	private int flightId;
	private String bookingId;
	private String flightNo;
	private String email;
	private String phoneNo;
	private String bookingDate;
	private String numofPerson;
	private String address;
	private double finalPrice;

	public FlightBooking() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public String getFlightNo() {
		return flightNo;
	}

	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getNumofPerson() {
		return numofPerson;
	}

	public void setNumofPerson(String numofPerson) {
		this.numofPerson = numofPerson;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(double finalPrice) {
		this.finalPrice = finalPrice;
	}

	@Override
	public String toString() {
		return "FlightBooking [flightId=" + flightId + ", bookingId=" + bookingId + ", flightNo=" + flightNo
				+ ", email=" + email + ", phoneNo=" + phoneNo + ", bookingDate=" + bookingDate + ", numofPerson="
				+ numofPerson + ", address=" + address + ", finalPrice=" + finalPrice + "]";
	}

}
