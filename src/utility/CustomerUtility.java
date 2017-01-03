package utility;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Customer;

public class CustomerUtility extends ConnectionUtility{
	ObjectMapper mapper = new ObjectMapper();
	public Customer getAllCustomers() throws Exception {
		Customer customer = null;
		connection = openConnection("http://localhost:6080/TM_Service/customer/read", "GET", null);
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
	
	public List<Customer> findCustomer(String name, String secondaryName) throws Exception {
		String query = "?name="+URLEncoder.encode(name,"UTF-8")+"&secondaryName="+ URLEncoder.encode(secondaryName,"UTF-8");
		connection = openConnection("http://localhost:6080/TM_Service/customer/find", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		List<Customer> customerList = mapper.readValue(response.toString(), ArrayList.class);
		return customerList;
	}

	public List<String> customerName(String nameQuery) throws Exception {
		connection = openConnection("http://localhost:6080/TM_Service/customer/nameList", "GET",
				"?query="+URLEncoder.encode(nameQuery,"UTF-8"));
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		List<String> customerNameList = mapper.readValue(response.toString(), ArrayList.class);
		return customerNameList;
	}

	public String addCustomer(Customer customer) throws Exception {
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
		return response.toString();
	}
}