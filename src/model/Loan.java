package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Loan{
	long loanId;
	Customer customer;
	@DateTimeFormat
	Date date;
	double principal;
	double returnAmount;
	String loanStatus;
	List<Item> items = new ArrayList<Item>();
	public Loan() {		super();	}
	public Loan(Customer customer, Date date, double principal, double returnAmount, String loanStatus) {
		super();
		this.customer = customer;
		this.date = date;
		this.principal = principal;
		this.returnAmount = returnAmount;
		this.loanStatus = loanStatus;
	}
	public Loan(Customer customer, Date date, double principal, double returnAmount, String loanStatus,
			List<Item> items) {
		super();
		this.customer = customer;
		this.date = date;
		this.principal = principal;
		this.returnAmount = returnAmount;
		this.loanStatus = loanStatus;
		this.items = items;
	}
	public long getLoanId() {
		return loanId;
	}
	public void setLoanId(long loanId) {
		this.loanId= loanId;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getPrincipal() {
		return principal;
	}
	public void setPrincipal(double principal) {
		this.principal = principal;
	}
	public double getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(double returnAmount) {
		this.returnAmount = returnAmount;
	}
	public String getLoanStatus() {
		return loanStatus;
	}
	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
}