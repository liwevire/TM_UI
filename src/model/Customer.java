package model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Customer{
	long customerId;
	String name;
	String secondaryName;
	Date date;
	String address;
	String post;
	String pin;
	String phone;
	Set<Loan> loans = new HashSet<Loan>();
	public Customer() {		super();	}
	public Customer(String name, String secondaryName, Date date, String address, String post, String pin, String phone) {
		super();
		this.name = name;
		this.secondaryName = secondaryName;
		this.date = date;
		this.address = address;
		this.post = post;
		this.pin = pin;
		this.phone = phone;
	}
	public Customer(String name, String secondaryName, Date date, String address, String post, String pin, String phone,
			Set<Loan> loans) {
		super();
		this.name = name;
		this.secondaryName = secondaryName;
		this.date = date;
		this.address = address;
		this.post = post;
		this.pin = pin;
		this.phone = phone;
		this.loans = loans;
	}
	public long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSecondaryName() {
		return secondaryName;
	}
	public void setSecondaryName(String secondaryName) {
		this.secondaryName = secondaryName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Set<Loan> getLoans() {
		return loans;
	}
	public void setLoans(Set<Loan> loans) {
		this.loans = loans;
	}
}