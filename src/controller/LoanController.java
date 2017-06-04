package controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.Loan;
import model.Outstanding;
import model.Transaction;
import utility.LoanUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/loan")
public class LoanController {
	private Logger logger = Logger.getLogger(LoanController.class);
	private LoanUtility loanUtility = new LoanUtility();
	@RequestMapping(method=RequestMethod.GET, value="/add")
	public String addLoan(Model model) throws Exception {
		model.addAttribute("addLoanForm", new Loan());
		return "addLoan";
	}
//	--duplicate to be removed. Created for UI comparison----------------------------------------
	@RequestMapping(method=RequestMethod.GET, value="/addDuplicate")
	public String addLoan1(Model model) throws Exception {
		model.addAttribute("addLoanForm", new Loan());
		return "addLoan2";
	}
//	--/duplicate to be removed. Created for UI comparison----------------------------------------
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addLoan(@ModelAttribute("addLoanForm") Loan loan, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("loan", loan);
		String loanId = loanUtility.addLoan(loan);
		redirectAttributes.addFlashAttribute("loanId",loanId);
		String message= "";
		if (null != loanId && Integer.parseInt(loanId)!=0) {
			message = "Loan added successfully. Loan ID: "+loanId;
		} else {
			message = "Loan addition failure";
		}
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getLoanAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getLoanAdditionStatus")
	public String getLoanStatus(@ModelAttribute("message") String status){
		return status;
	}
	@RequestMapping(method=RequestMethod.GET, value="/select")
	public String viewLoan(Model model) throws Exception {
		model.addAttribute("viewLoanForm", new Loan());
		return "selectLoan";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewLoan(Model model, @RequestParam("loanId") Long loanId) throws Exception {
		Loan loan = loanUtility.getLoan(loanId);
		Outstanding outstanding = loanUtility.getOutstanding(loanId);
		model.addAttribute("editLoanForm", loan);
		model.addAttribute("loan", loan);
		model.addAttribute("outstanding", outstanding);
		return "editLoan";
	}
//	--duplicate to be removed. Created for UI comparison----------------------------------------
	@RequestMapping(method=RequestMethod.GET, value="/viewDuplicate")
	public String viewLoan1(Model model, @RequestParam("loanId") Long loanId) throws Exception {
		Loan loan = loanUtility.getLoan(loanId);
		Outstanding outstanding = loanUtility.getOutstanding(loanId);
		model.addAttribute("editLoanForm", loan);
		model.addAttribute("loan", loan);
		model.addAttribute("outstanding", outstanding);
		return "editLoan-copy";
	}
//	--/duplicate to be removed. Created for UI comparison------------------------------------
	@RequestMapping(method=RequestMethod.POST, value="/update")
	public String updateLoan(Model model, @ModelAttribute("editLoanForm") Loan loan, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("loan", loan);
		loanUtility.updateLoan(loan);
		for (Transaction transaction:loan.getTransactions()) {
			System.out.println(transaction.getDate());
		}
		String message= "Updated successfully";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getLoanAdditionStatus";
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
}