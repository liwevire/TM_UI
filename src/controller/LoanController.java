package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import model.Customer;
import model.Item;
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
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addLoan(@ModelAttribute("loanForm") Loan loan,@ModelAttribute("customerForm") Customer customer, Model model) throws Exception {
		//loan.setCustomer(selectedCustomer);
		System.out.println("Loan object received");
		System.out.println(loan.getCustomer().getName());
		List<Item>	items = loan.getItems();
		for (Item item : items) {
			System.out.println(item.getName());
		}
		return "Loan addition status have to be shown here";
	}
}