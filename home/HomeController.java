package kr.or.project.main.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String welcome() {
		
		log.info("홈 화면입니다.");
		return "home";
		
	}
	
	
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String welcome2() {
		
		log.info("홈 화면입니다.");
		return "home";
		
	}
}
