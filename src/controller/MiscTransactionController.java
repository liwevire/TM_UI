package controller;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


import model.core.Loan;
import model.core.MiscTransaction;
import model.core.Outstanding;
import model.reports.Daily;
import utility.DailyReportsUtility;
import utility.MiscTransactionUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/miscTransaction")
public class MiscTransactionController {
	private Logger logger = Logger.getLogger(MiscTransactionController.class);
	MiscTransactionUtility miscTransactionUtility= new MiscTransactionUtility();
	
	@RequestMapping(method=RequestMethod.GET, value="/select")
	public String viewMiscTransaction(Model model) {
		model.addAttribute("miscTransactionForm", new MiscTransaction());
		return "selectMiscTransactionDate";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewMiscTransaction(Model model, @ModelAttribute("miscTransactionForm") MiscTransaction miscTransaction) throws Exception {
		List<MiscTransaction> miscTransactions = null;
		miscTransactions = miscTransactionUtility.getMiscTransaction(miscTransaction.getDate());
		model.addAttribute("miscTransaction", miscTransactions);
		return "viewMiscTransaction";
	}
}