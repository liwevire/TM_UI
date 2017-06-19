package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

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
}