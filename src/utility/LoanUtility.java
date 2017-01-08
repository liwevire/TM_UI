package utility;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Loan;

public class LoanUtility extends ConnectionUtility{
	ObjectMapper mapper = new ObjectMapper();
	public String addLoan(Loan loan) throws Exception {
		String jsonLoad = mapper.writeValueAsString(loan);
		byte[] postData = jsonLoad.getBytes();
		System.out.println(jsonLoad);
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
}