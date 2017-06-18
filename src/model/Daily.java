package model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Daily implements Serializable{
	private static final long serialVersionUID = 1L;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date date;
	private double principal;
	private double roi;
	private double rop;
	private double firstMonthInterest;
	private double appraisalCharges;
	private double closingBalance;
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
	public double getRoi() {
		return roi;
	}
	public void setRoi(double roi) {
		this.roi = roi;
	}
	public double getRop() {
		return rop;
	}
	public void setRop(double rop) {
		this.rop = rop;
	}
	public double getFirstMonthInterest() {
		return firstMonthInterest;
	}
	public double getClosingBalance() {
		return closingBalance;
	}
	public void setClosingBalance(double closingBalance) {
		this.closingBalance = closingBalance;
	}
	public void setFirstMonthInterest(double firstMonthInterest) {
		this.firstMonthInterest = firstMonthInterest;
	}
	public double getAppraisalCharges() {
		return appraisalCharges;
	}
	public void setAppraisalCharges(double appraisalCharges) {
		this.appraisalCharges = appraisalCharges;
	}
	public Daily() {
		super();
	}
	public Daily(Date date, double principal, double roi, double rop, double firstMonthInterest,
			double appraisalCharges, double closingBalance) {
		super();
		this.date = date;
		this.principal = principal;
		this.roi = roi;
		this.rop = rop;
		this.firstMonthInterest = firstMonthInterest;
		this.appraisalCharges = appraisalCharges;
		this.closingBalance = closingBalance;
	}
}