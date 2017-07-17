package utility;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.reports.Daily;

public class DailyReportsUtility extends ConnectionUtility {
	ObjectMapper mapper = new ObjectMapper();
	public Daily getDailyReport(Date date) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String formattedDate= formatter.format(date);  
		String query = "?calculationDate="+formattedDate;
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
//	public Daily recalculateDailyReport(Date date) throws Exception {
//		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
//	    String formattedDate= formatter.format(date);  
//		String query = "?calculationDate="+formattedDate;
//		connection = openConnection("http://localhost:6080/TM_Service/reports/recalculateDaily", "GET", query);
//		String output;
//		StringBuffer response = new StringBuffer();
//		try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
//			while ((output = in.readLine()) != null) {
//				response.append(output);
//			}
//		}
//		Daily dailyReport = mapper.readValue(response.toString(), Daily.class);
//		return dailyReport;
//	}
}