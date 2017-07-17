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

import model.core.MiscTransaction;

public class MiscTransactionUtility extends ConnectionUtility {
	ObjectMapper mapper = new ObjectMapper();
	public List<MiscTransaction> getMiscTransaction(Date date) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String formattedDate= formatter.format(date);  
		String query = "?date="+formattedDate;
		connection = openConnection("http://localhost:6080/TM_Service/miscTransaction/getByDate", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		List<MiscTransaction> miscTransactions = mapper.readValue(response.toString(), new TypeReference<ArrayList<MiscTransaction>>() {});
		return miscTransactions;
	}
	public MiscTransaction getMiscTransaction(long transactionId) throws Exception { 
		String query = "?transactionId="+transactionId;
		connection = openConnection("http://localhost:6080/TM_Service/miscTransaction/getByTransactionId", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		MiscTransaction miscTransaction = mapper.readValue(response.toString(), MiscTransaction.class);
		return miscTransaction;
	}
	public String updateMiscTransaction(MiscTransaction miscTransaction) throws Exception {
		String jsonLoad = mapper.writeValueAsString(miscTransaction);
		byte[] postData = jsonLoad.getBytes();
		System.out.println(jsonLoad);
		connection = openConnection("http://localhost:6080/TM_Service/miscTransaction/update", "POST",
				mapper.writeValueAsString(miscTransaction));
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
	public String deleteMiscTransaction(String transactionId) throws Exception {
		String query = "?transactionId="+transactionId;
		connection = openConnection("http://localhost:6080/TM_Service/miscTransaction/delete", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		return response.toString();
	}
	public long addMiscTransaction(MiscTransaction miscTransaction) throws Exception {
		String jsonLoad = mapper.writeValueAsString(miscTransaction);
		byte[] postData = jsonLoad.getBytes();
		connection = openConnection("http://localhost:6080/TM_Service/miscTransaction/add", "POST",
				mapper.writeValueAsString(miscTransaction));
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
		return Long.parseLong(response.toString());
	}
}