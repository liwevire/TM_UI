package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@Controller
@RequestMapping(value="/reports")
public class ReportsController {
	@RequestMapping(method=RequestMethod.GET, value="/calculateDaily")
	public String addLoan(Model model) {
		
		model.addAttribute("reportsForm", loan);
		ModelAndView mav = new ModelAndView();
		
	}
}
