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
	Date returnDate;
	double returnAmount;
	String loanStatus;
	String comments;
	List<Item> items = new ArrayList<Item>();
	public Loan() {		super();	}
	public Loan(Customer customer, Date date, double principal, Date returnDate, double returnAmount, String loanStatus,
			String comments) {
		super();
		this.customer = customer;
		this.date = date;
		this.principal = principal;
		this.returnDate = returnDate;
		this.returnAmount = returnAmount;
		this.loanStatus = loanStatus;
		this.comments = comments;
	}
	public Loan(Customer customer, Date date, double principal, Date returnDate, double returnAmount, String loanStatus,
			String comments, List<Item> items) {
		super();
		this.customer = customer;
		this.date = date;
		this.principal = principal;
		this.returnDate = returnDate;
		this.returnAmount = returnAmount;
		this.loanStatus = loanStatus;
		this.comments = comments;
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
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
}