package utility;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.jmx.snmp.Timestamp;

import model.Daily;
import model.Loan;

public class DailyReportsUtility extends ConnectionUtility {
	ObjectMapper mapper = new ObjectMapper();
	public static void main(String[] args) {
		Date date = new Date();
		date.setDate(12);
		date.setMonth(6);
		date.setYear(2017);
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		System.out.println(date.getTime());
		System.out.println(new Timestamp(date.getTime()));
	}
	public Daily getDailyReport(Date date) throws Exception {
		String query = "?calculationDate=05/27/2017";
		System.out.println("date captured at browser:"+ date.toString());
		connection = openConnection("http://localhost:6080/TM_Service/reports/calculateDaily", "GET", query);
		String output;
		StringBuffer response = new StringBuffer();
		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			while ((output = in.readLine()) != null) {
				response.append(output);
			}
		}
		Daily dailyReport = mapper.readValue(response.toString(), Daily.class);
		return dailyReport;
	}
}