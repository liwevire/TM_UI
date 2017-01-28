package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewLoan(Model model) throws Exception {
		model.addAttribute("viewLoanForm", new Loan());
		return "viewLoan";
	}
	@RequestMapping(method=RequestMethod.POST, value="/view")
	public String viewLoan(Model model, @ModelAttribute("viewLoanForm") Loan loan) throws Exception {
		loan = loanUtility.getLoan(loan.getLoanId());
		System.out.println(loan.getItems());
		model.addAttribute("editLoanForm", loan);
		model.addAttribute("loan", loan);
		return "editLoan";
	}
	@RequestMapping(method=RequestMethod.POST, value="/update")
	public String updateLoan(Model model, @ModelAttribute("editLoanForm") Loan loan, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("loan", loan);
		loanUtility.updateLoan(loan);
		String message= "Update successflully";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getLoanAdditionStatus";
	}
}