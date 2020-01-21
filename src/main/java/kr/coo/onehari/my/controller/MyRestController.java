package kr.coo.onehari.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.hr.dto.Theme;
import kr.coo.onehari.my.service.MyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class MyRestController {
	@Autowired
	private MyService myService;
	
	@RequestMapping("myTheme.hari")
	public String myTheme(Theme theme) {
		int result = myService.myTheme(theme);
		String resultString = "false";
		
		if(result > 0) {
			resultString = "true";
		}
		
		return resultString;
	}
	
}
