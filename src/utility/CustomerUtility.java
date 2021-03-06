package utility;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.core.Customer;

public class CustomerUtility extends ConnectionUtility{
	ObjectMapper mapper = new ObjectMapper();
//	public List<Customer> findCustomer(String name, String secondaryName) throws Exception {
//		String query = "?name="+URLEncoder.encode(name,"UTF-8")+"&secondaryName="+ URLEncoder.encode(secondaryName,"UTF-8");
//		connection = openConnection("http://localhost:6080/TM_Service/customer/find", "GET", query);
//		String output;
//		StringBuffer response = new StringBuffer();
//		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
//			while ((output = in.readLine()) != null) {
//				response.append(output);
//			}
//		}
//		List<Customer> customerList = mapper.readValue(response.toString(), ArrayList.class);
//		return customerList;
//	}

	public List<Customer> searchCustomerByName(String name) throws Exception {
		connection = openConnection("http://localhost:6080/TM_Service/customer/read", "GET",
				"?name="+URLEncoder.encode(name,"UTF-8"));
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		List<Customer> customers = mapper.readValue(response.toString(), new TypeReference<ArrayList<Customer>>() {});
		return customers;
	}
	public Customer getCustomerByLoan(String loanId) throws Exception {
		Customer customer = null;
		connection = openConnection("http://localhost:6080/TM_Service/customer/getByLoanId", "GET", 
				"?loanId="+loanId);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		customer = mapper.readValue(response.toString(), Customer.class);
		return customer;
	}
	
	public long addCustomer(Customer customer) throws Exception {
		String jsonLoad = mapper.writeValueAsString(customer);
		byte[] postData = jsonLoad.getBytes();
		connection = openConnection("http://localhost:6080/TM_Service/customer/add", "POST",
				mapper.writeValueAsString(customer));
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
	public Customer getCustomer(String customerId) throws Exception {
		String query = "?customerId="+customerId;
		connection = openConnection("http://localhost:6080/TM_Service/customer/getByCustomerId", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		Customer customer = mapper.readValue(response.toString(), Customer.class);
		return customer;
	}
	public String updateCustomer(Customer customer) throws Exception {
		String jsonLoad = mapper.writeValueAsString(customer);
		byte[] postData = jsonLoad.getBytes();
		System.out.println(jsonLoad);
		connection = openConnection("http://localhost:6080/TM_Service/customer/update", "POST",
				mapper.writeValueAsString(customer));
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
	public String deleteCustomer(String customerId) throws Exception {
		String query = "?customerId="+customerId;
		connection = openConnection("http://localhost:6080/TM_Service/customer/delete", "GET", query);
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