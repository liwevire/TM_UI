package model.core;

import java.util.ArrayList;
import java.util.List;

public class Loan{
	long loanId;
	Customer customer;
	String loanStatus;
	double weight;
	String comments;
	List<Item> items = new ArrayList<Item>();
	List<Transaction> transactions= new ArrayList<Transaction>();
	public Loan() {		super();	}
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
	public String getLoanStatus() {
		return loanStatus;
	}
	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public List<Item> getItems() {
		return items;
	}
	public List<Transaction> getTransactions() {
		return transactions;
	}
	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
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