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

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Customer;
import utility.CustomerUtility;

@EnableWebMvc
@Controller
@RequestMapping("/customer")
public class CustomerController {
	CustomerUtility customerUtility = new CustomerUtility();
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String getAllCustomer() throws Exception {
		System.out.println(customerUtility.getAllCustomers());
		return "readCustomer";
	}
	@ResponseBody
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String getCustomer(@RequestParam("name") String name,@RequestParam("secondaryName") String secondaryName, Model model) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(customerUtility.findCustomer(name, secondaryName));
	}
	@ResponseBody
	@RequestMapping(value = "/getNameList", method = RequestMethod.GET)
	public String getCustomerNames(@RequestParam("term") String name) throws Exception {
		List<Customer> customers = customerUtility.customerName(name);
		String jsonLoad = new ObjectMapper().writeValueAsString(customers);
		return jsonLoad;
	}
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addCustomer(Model model) throws Exception {
		model.addAttribute("customerForm", new Customer());
		return "addCustomer";
	}
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCustomer(@ModelAttribute("customerForm") Customer newCustomer, Model model) throws Exception {
		model.addAttribute("status", customerUtility.addCustomer(newCustomer));
		return "Customer addition status to be shown here";
	}
}