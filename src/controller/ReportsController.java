package controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import model.core.MiscTransaction;
import model.reports.Daily;
import utility.DailyReportsUtility;
import utility.MiscTransactionUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/reports")
public class ReportsController {
	private Logger logger = Logger.getLogger(ReportsController.class);
	DailyReportsUtility dailyReportUtility = new DailyReportsUtility();
	MiscTransactionUtility miscTransactionUtility= new MiscTransactionUtility();
	
	@RequestMapping(method=RequestMethod.GET, value="/daily")
	public String viewDailyReport(Model model) {
		model.addAttribute("dailyReportForm", new Daily());
		return "selectReportDate";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewDailyReport(Model model, @ModelAttribute("dailyReportForm") Daily dailyReport) throws Exception {
		dailyReport = dailyReportUtility.getDailyReport(dailyReport.getDate());
		List<MiscTransaction> miscTransactions = miscTransactionUtility.getMiscTransaction(dailyReport.getDate());
		model.addAttribute("dailyReport", dailyReport);
		model.addAttribute("miscTransactions", dailyReport);
		return "viewDailyReport";
	}
}