package model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DailyReport implements Serializable{
	private static final long serialVersionUID = 1L;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date date;
	private double principal;
	private double roi;
	private double rop;
	private double firstMonthInterest;
	private double appraisalCharges;
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
	public void setFirstMonthInterest(double firstMonthInterest) {
		this.firstMonthInterest = firstMonthInterest;
	}
	public double getAppraisalCharges() {
		return appraisalCharges;
	}
	public void setAppraisalCharges(double appraisalCharges) {
		this.appraisalCharges = appraisalCharges;
	}
}