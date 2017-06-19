package model.core;

import java.io.Serializable;
import java.util.Date;

public class MiscTransaction implements Serializable{
	private static final long serialVersionUID = 1L;
	long transactionId;
	Date date;
	double amount;
	String description;
	boolean transactionType;
	public MiscTransaction() {		super();	}
	public long getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isTransactionType() {
		return transactionType;
	}
	public void setTransactionType(boolean transactionType) {
		this.transactionType = transactionType;
	}
}