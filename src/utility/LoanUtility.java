package utility;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.core.Loan;
import model.core.Outstanding;

public class LoanUtility extends ConnectionUtility{
	ObjectMapper mapper = new ObjectMapper();
	public String addLoan(Loan loan) throws Exception {
		String jsonLoad = mapper.writeValueAsString(loan);
		System.out.println(jsonLoad);
		byte[] postData = jsonLoad.getBytes();
		connection = openConnection("http://localhost:6080/TM_Service/loan/add", "POST",
				mapper.writeValueAsString(loan));
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestProperty("Content-Length", Integer.toString(postData.length));
		try (DataOutputStream wr = new DataOutputStream(connection.getOutputStream())) {
			wr.write(postData);
		}
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		return response.toString();
	}
	public Loan getLoan(String loanId) throws Exception {
		String query = "?loanId="+loanId;
		connection = openConnection("http://localhost:6080/TM_Service/loan/get", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		Loan loan = mapper.readValue(response.toString(), Loan.class);
		loan.setCustomer(new CustomerUtility().getCustomerByLoan(loanId));
		return loan;
	}
	public String updateLoan(Loan loan) throws Exception {
		String jsonLoad = mapper.writeValueAsString(loan);
		byte[] postData = jsonLoad.getBytes();
		System.out.println(jsonLoad);
		connection = openConnection("http://localhost:6080/TM_Service/loan/update", "POST",
				mapper.writeValueAsString(loan));
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestProperty("Content-Length", Integer.toString(postData.length));
		try (DataOutputStream wr = new DataOutputStream(connection.getOutputStream())) {
			wr.write(postData);
		}
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		return response.toString();
	}
	public Outstanding getOutstanding(String loanId) throws Exception {
		String query = "?loanId="+loanId;
		connection = openConnection("http://localhost:6080/TM_Service/loan/getOutstanding", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		Outstanding outstanding = mapper.readValue(response.toString(), Outstanding.class);
		return outstanding;
	}
	public List<Loan> getLoan(Date date) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String formattedDate= formatter.format(date);  
		String query = "?date="+formattedDate;
		connection = openConnection("http://localhost:6080/TM_Service/loan/getLoansByDate", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		List<Loan> loans= mapper.readValue(response.toString(), new TypeReference<ArrayList<Loan>>() {});
		return loans;
	}
	public List<Loan> getLoan(Date fromDate, Date toDate) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String formattedFromDate= formatter.format(fromDate);  
	    String formattedToDate= formatter.format(toDate);  
		String query = "?fromDate="+formattedFromDate+"&toDate="+ formattedToDate;
		connection = openConnection("http://localhost:6080/TM_Service/loan/getOpenLoans", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		List<Loan> loans= mapper.readValue(new InputStreamReader(connection.getInputStream()), new TypeReference<ArrayList<Loan>>() {});
		for (Loan loan : loans) {
			System.out.println(loan.getLoanId());
		}
		return loans;
	}
	public String deleteLoan(String loanId) throws Exception {
		String query = "?loanId="+loanId;
		connection = openConnection("http://localhost:6080/TM_Service/loan/delete", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		return response.toString();
	}
}