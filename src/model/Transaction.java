package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Transaction{
	public static final String PRINCIPAL = "principal";
	public static final String RETURN_ON_INTEREST="returnOnInterest";
	public static final String RETURN_ON_PRINCIPAL="returnOnPrincipal";
	public static final String RETURN_EXCESS_INTEREST="returnExcessInterest";
	public static final String RETURN_AMOUNT="returnAmount";
	long transactionId;
	Loan loan;
	@DateTimeFormat
	Date date;
	String category;
	double amount;
	public Transaction() {		super();	}
	public long getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}
	public Loan getLoan() {
		return loan;
	}
	public void setLoan(Loan loan) {
		this.loan = loan;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
}