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
	public String newLoan(Model model) throws Exception {
		model.addAttribute("loanForm", new Loan());
		return "addLoan";
	}
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addLoan(@ModelAttribute("loanForm") Loan loan, @ModelAttribute("customerForm") Customer customer, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("loan", loan);
		String loanId = loanUtility.addLoan(loan);
		redirectAttributes.addFlashAttribute("loanId",loanId);
		redirectAttributes.addFlashAttribute("message","Loan added successfully"+loanId);
		return "redirect:getLoanStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getLoanStatus")
	public String getLoanStatus(@ModelAttribute("message") String status){
		return status;
	}
}