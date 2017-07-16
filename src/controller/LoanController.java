package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.core.Loan;
import model.core.Outstanding;
import utility.LoanUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/loan")
public class LoanController {
	//private Logger logger = Logger.getLogger(LoanController.class);
	private LoanUtility loanUtility = new LoanUtility();
	@RequestMapping(method=RequestMethod.GET, value="/add")
	public String addLoan(Model model) throws Exception {
		model.addAttribute("addLoanForm", new Loan());
		return "addLoan";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addLoan(@ModelAttribute("addLoanForm") Loan loan, final RedirectAttributes redirectAttributes) throws Exception {
		if (null != loan.getLoanId() && loan.getLoanId() != "") 			
			loan.setLoanId(loan.getLoanId().toUpperCase());
		redirectAttributes.addFlashAttribute("loan", loan);
		String loanId = loanUtility.addLoan(loan);
		redirectAttributes.addFlashAttribute("loanId",loanId);
		String message= "";
		if (null != loanId && loanId != "")			message = "Loan added successfully. Loan ID: "+loanId;
		else			message = "Loan addition failure";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getLoanAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getLoanAdditionStatus")
	public String getLoanStatus(@ModelAttribute("message") String status){
		return status;
	}
	@RequestMapping(method=RequestMethod.GET, value="/select")
	public String editLoan(Model model) throws Exception {
		model.addAttribute("viewLoanForm", new Loan());
		return "selectLoan";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String editLoan(Model model, @RequestParam("loanId") String loanId) throws Exception {
		Loan loan = loanUtility.getLoan(loanId);
		Outstanding outstanding = loanUtility.getOutstanding(loanId);
		model.addAttribute("editLoanForm", loan);
		model.addAttribute("loan", loan);
		model.addAttribute("outstanding", outstanding);
		return "editLoan";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/update")
	public String updateLoan(Model model, @ModelAttribute("editLoanForm") Loan loan, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("loan", loan);
		loanUtility.updateLoan(loan);
//		for (Transaction transaction:loan.getTransactions()) {
//			System.out.println(transaction.getDate());
//		}
		String message= "Updated successfully";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getLoanAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/delete")
	public String deleteLoan(Model model, @RequestParam("loanId") String loanId) throws Exception {
		String deletionStatus = loanUtility.deleteLoan(loanId);
		return deletionStatus;
	}
	
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST, value="/calculateInitialInterest")
	public List<Double> calculateInitialInterest(@ModelAttribute("principal") double principal){
		List<Double> interestRates= new ArrayList<Double>();
		if(principal > 0 &&principal < 5000) 
			interestRates.add((double)((principal*0.03)));
		else if (principal >= 5000 && principal < 10000)
			interestRates.add((double)((principal*0.025)));
		else if (principal >= 10000)
			interestRates.add((double)((principal*0.02)));
		else
			interestRates.add((double)((principal*0)));
		interestRates.add((double)5);
		return interestRates;
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST, value="/getInterestRates")
	public List<Double> getInterestRates(@ModelAttribute("principal") double principal){
		List<Double> interestRates= new ArrayList<Double>();
		if(principal > 0 &&principal < 5000) 
			interestRates.add(.03);
		else if (principal >= 5000 && principal < 10000)
			interestRates.add(.025);
		else if (principal >= 10000)
			interestRates.add(.02);
		else
			return null;
		interestRates.add((double)5);
		return interestRates;
	}
	@RequestMapping(method=RequestMethod.GET, value="/selectDate")
	public String viewOpenLoan(Model model) throws Exception {
		return "selectDatesForLoan";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getOpenLoans")
	public List<Loan> viewOpenLoan(Model model, @RequestParam("fromDate") Date fromDate, @RequestParam("toDate") Date toDate) throws Exception {
		return loanUtility.getLoan(fromDate,toDate);
	}
}