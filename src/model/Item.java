package model;

public class Item{
	long itemId;
	Loan loan;
	String name;
	double weight;
	public Item() {		super();	}
	public Item(String name, double weight) {
		super();
		this.name = name;
		this.weight = weight;
	}
	public Item(Loan loan, String name, double weight) {
		super();
		this.loan = loan;
		this.name = name;
		this.weight = weight;
	}
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
	}
	public Loan getLoan() {
		return loan;
	}
	public void setLoan(Loan loan) {
		this.loan = loan;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
}