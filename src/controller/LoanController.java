package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.Customer;
import model.Loan;
import utility.LoanUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/loan")
public class LoanController {
	LoanUtility loanUtility = new LoanUtility();
	@RequestMapping(method=RequestMethod.GET, value="/add")
	public String addLoan(Model model) throws Exception {
		model.addAttribute("addLoanForm", new Loan());
		return "addLoan";
	}
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addLoan(@ModelAttribute("addLoanForm") Loan loan, @ModelAttribute("customerForm") Customer customer, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("loan", loan);
		String loanId = loanUtility.addLoan(loan);
		redirectAttributes.addFlashAttribute("loanId",loanId);
		redirectAttributes.addFlashAttribute("message","Loan added successfully"+loanId);
		return "redirect:getLoanAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getLoanAdditionStatus")
	public String getLoanStatus(@ModelAttribute("message") String status){
		return status;
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewLoan(Model model) throws Exception {
		model.addAttribute("editLoanForm", new Loan());
		return "viewLoan";
	}
	@RequestMapping(method=RequestMethod.POST, value="/view")
	public String viewLoan(Model model, @ModelAttribute("editLoanForm") Loan loan) throws Exception {
		loan = loanUtility.getLoan(loan.getLoanId());
		model.addAttribute("loan", loan);
		return "viewLoanLanding";
	}
}