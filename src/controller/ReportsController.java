package controller;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import model.DailyReport;
import model.Loan;
import model.Outstanding;
import utility.DailyReportsUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/reports")
public class ReportsController {
	private Logger logger = Logger.getLogger(ReportsController.class);
	DailyReportsUtility dailyReportUtility = new DailyReportsUtility();
	
	@RequestMapping(method=RequestMethod.GET, value="/daily")
	public String viewDailyReport(Model model) {
		DailyReportsUtility reportsUtility = new DailyReportsUtility();
//		reportsUtility.
		model.addAttribute("dailyReportForm", new DailyReport());
		return "selectReportDate";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewDailyReport(Model model, @ModelAttribute("dailyReportForm") DailyReport dailyReport) throws Exception {
		System.out.println(dailyReport.getDate());
		dailyReport = dailyReportUtility.getDailyReport(dailyReport.getDate());
		model.addAttribute("dailyReportForm", dailyReport);
		return "viewDailyReport";
	}
}