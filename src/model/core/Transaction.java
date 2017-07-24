package model.core;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

public class Transaction implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public static Map<String, String> TRANSACTIONTYPES = new HashMap<String, String>();
	static {
		TRANSACTIONTYPES.put("PRINCIPAL", "principal");
		TRANSACTIONTYPES.put("FIRST_MONTH_INTEREST", "first_month_interest");
		TRANSACTIONTYPES.put("RETURN_ON_INTEREST", "return_on_interest");
		TRANSACTIONTYPES.put("RETURN_ON_PRINCIPAL", "return_on_principal");
		TRANSACTIONTYPES.put("RETURN_EXCESS_INTEREST", "return_excess_interest");
		TRANSACTIONTYPES.put("RETURN_AMOUNT", "return_amount");
		TRANSACTIONTYPES.put("APPRAISAL_CHARGES", "appraisal_charges");
	}
	
	long transactionId;
	Loan loan;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
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