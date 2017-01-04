package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Loan{
	long loanId;
	Customer customer;
	Date date;
	double amount;
	List<Item> items = new ArrayList<Item>();
	public Loan() {		super();	}
	public Loan(Customer customer, Date date, double amount) {
		super();
		this.customer = customer;
		this.date = date;
		this.amount = amount;
	}
	public Loan(Customer customer, Date date, double amount, List<Item> items) {
		super();
		this.customer = customer;
		this.date = date;
		this.amount = amount;
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
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
}