package controller;


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

import model.core.MiscTransaction;
import utility.MiscTransactionUtility;

@EnableWebMvc
@Controller
@RequestMapping(value="/miscTransaction")
public class MiscTransactionController {
	//private Logger logger = Logger.getLogger(MiscTransactionController.class);
	MiscTransactionUtility miscTransactionUtility= new MiscTransactionUtility();
	
	@RequestMapping(method=RequestMethod.GET, value="/add")
	public String addMiscTransaction(Model model) throws Exception {
		model.addAttribute("addMiscTransactionForm", new MiscTransaction());
		return "addMiscTransaction";
	}
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addMiscTransaction(@ModelAttribute("addMiscTransactionForm") MiscTransaction miscTransaction, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("MiscTransaction", miscTransaction);
		long transactionId = miscTransactionUtility.addMiscTransaction(miscTransaction);
		redirectAttributes.addFlashAttribute("transactionId",transactionId);
		String message= "";
		if (transactionId > 0 )			message = "Misc. Transaction added successfully. Transaction ID: "+transactionId;
		else			message = "Misc. transaction addition failure";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getMiscTransactionAdditionStatus";
	}
	@RequestMapping(method=RequestMethod.GET, value="/select")
	public String viewMiscTransaction(Model model) {
//		model.addAttribute("miscTransactionForm", new MiscTransaction());
		return "selectMiscTransaction";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewMiscTransaction(Model model, @RequestParam("transactionId") long transactionId) throws Exception {
		MiscTransaction miscTransaction = miscTransactionUtility.getMiscTransaction(transactionId);
		model.addAttribute("miscTransactionForm", miscTransaction);
		return "editMiscTransaction";
	}
	@RequestMapping(method=RequestMethod.POST, value="/update")
	public String updateMiscTransaction(Model model, @ModelAttribute("miscTransactionForm") MiscTransaction miscTransaction, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("miscTransaction", miscTransaction);
		miscTransactionUtility.updateMiscTransaction(miscTransaction);
		String message= "Updated successfully";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getMiscTransactionAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getMiscTransactionAdditionStatus")
	public String getMiscTransactionAdditionStatus(@ModelAttribute("message") String status){
		return status;
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/delete")
	public String deleteMiscTransaction(Model model, @RequestParam("transactionId") String transactionId) throws Exception {
		String deletionStatus = miscTransactionUtility.deleteMiscTransaction(transactionId);
		return deletionStatus;
	}
}