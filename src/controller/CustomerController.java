package controller;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import model.core.Customer;
import utility.CustomerUtility;

@EnableWebMvc
@Controller
@RequestMapping("/customer")
public class CustomerController {
	CustomerUtility customerUtility = new CustomerUtility();
	@ResponseBody
	@RequestMapping(value = "/getNameList", method = RequestMethod.GET)
	public String getCustomerNames(@RequestParam("term") String name) throws Exception {
		List<Customer> customers = customerUtility.searchCustomerByName(name);
		String jsonLoad = new ObjectMapper().writeValueAsString(customers);
		return jsonLoad;
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="/add")
	public String addCustomer(Model model) throws Exception {
		model.addAttribute("addCustomerForm", new Customer());
		return "addCustomer";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/add")
	public String addCustomer(@ModelAttribute("addCustomerForm") Customer customer, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("Customer", customer);
		long customerId = customerUtility.addCustomer(customer);
		redirectAttributes.addFlashAttribute("customerId",customerId);
		String message= "";
		if (customerId > 0 )			message = "Customer added successfully. Customer ID: "+customerId;
		else			message = "Customer addition failure";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getCustomerAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/getCustomerAdditionStatus")
	public String getCustomerStatus(@ModelAttribute("message") String status){
		return status;
	}
	@RequestMapping(method=RequestMethod.GET, value="/select")
	public String selectCustomer(Model model) throws Exception {
		model.addAttribute("viewCustomerForm", new Customer());
		return "selectCustomer";
	}
	@RequestMapping(method=RequestMethod.GET, value="/view")
	public String viewCustomer(Model model, @RequestParam("customerId") String customerId) throws Exception {
		Customer customer= customerUtility.getCustomer(customerId);
		model.addAttribute("editCustomerForm", customer); 
		model.addAttribute("customer", customer);  //?!
		return "editCustomer";
	}
	@RequestMapping(method=RequestMethod.POST, value="/update")
	public String updateCustomer(Model model, @ModelAttribute("editForm") Customer customer, final RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("customer", customer);
		customerUtility.updateCustomer(customer);
		String message= "Updated successfully";
		redirectAttributes.addFlashAttribute("message",message);
		return "redirect:getCustomerAdditionStatus";
	}
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="/delete")
	public String deleteCustomer(Model model, @RequestParam("customerId") String customerId) throws Exception {
		String deletionStatus = customerUtility.deleteCustomer(customerId);
		return deletionStatus;
	}
}