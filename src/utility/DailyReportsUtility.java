package utility;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.jmx.snmp.Timestamp;

import model.DailyReport;

public class DailyReportsUtility extends ConnectionUtility {
//		public DailyReport calculateDailyReport(Date date) {
//			String query = "?"
//		}
	public static void main(String[] args) {
		Date date = new Date();
		date.setDate(12);
		date.setMonth(6);
		date.setYear(2017);
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		System.out.println(date.getTime());
		System.out.println(new Timestamp(date.getTime()));
	}
}
