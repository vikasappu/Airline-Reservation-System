package com.entity;

public class Payment {

	private String bookingId;
	private String cardNumber;
	private String cardHolder;
	private int expiryMonth;
	private int expiryYear;
	private String cvv;
	private double amount;

	public Payment(String bookingId, String cardNumber, String cardHolder, int expiryMonth, int expiryYear, String cvv,
			double amount) {
		this.bookingId = bookingId;
		this.cardNumber = cardNumber;
		this.cardHolder = cardHolder;
		this.expiryMonth = expiryMonth;
		this.expiryYear = expiryYear;
		this.cvv = cvv;
		this.amount = amount;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardHolder() {
		return cardHolder;
	}

	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	public int getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(int expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	public int getExpiryYear() {
		return expiryYear;
	}

	public void setExpiryYear(int expiryYear) {
		this.expiryYear = expiryYear;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Payment [bookingId=" + bookingId + ", cardNumber=" + cardNumber + ", cardHolder=" + cardHolder
				+ ", expiryMonth=" + expiryMonth + ", expiryYear=" + expiryYear + ", cvv=" + cvv + ", amount=" + amount
				+ "]";
	}

}
