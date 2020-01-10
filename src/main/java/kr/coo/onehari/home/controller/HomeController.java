package kr.coo.onehari.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("index.hari")
	public String index() {
		return "home.index";
	}
	
	@RequestMapping("main.hari")
	public String main() {
		return "1hari.main";
	}
	
}

