package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;



@EnableWebMvc
@Controller
@RequestMapping(value="/home")
public class HomeController {
	@RequestMapping(method=RequestMethod.GET)
	public String home() {
		Logger logger = Logger.getLogger(HomeController.class);
		logger.info("info");
		logger.debug("debug");
		logger.error("error");
		logger.trace("trace");
		return "home";
	}
}
