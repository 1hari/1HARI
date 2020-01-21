package kr.coo.onehari.my.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.my.service.MyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/1hariMy")
public class MyController {	
	/*
	작성자: 김수연
	시작: 2020. 1. 7. 19:44
	완료: 
	내용: MyController
	*/
	
	@Autowired
	private MyService myService;
	
	@Autowired
	private EmpService empServcie;
	
	// 개인정보 프로필 수정(화면) 김진호 2020. 1. 21
	@RequestMapping(value = "myInfo.hari", method = RequestMethod.GET)
	public String myInfo(Model model, Principal principal) {
		EmpDto emp = null;
		
		try {
			emp = empServcie.empModify(Integer.parseInt(principal.getName()));
			model.addAttribute("emp", emp);
		} catch (Exception e) {
			log.debug("MyController Myinfo 예외발생: " + e.getMessage());
		}
		return "1hariMy.myInfo";
	}
	
	// 개인정보 프로필 수정(변경) 김진호 2020. 1. 21
	@RequestMapping(value = "myInfo.hari", method = RequestMethod.POST)
	public String myInfo(EmpDto empdto) {
		try {
			myService.myInfo(empdto);
		} catch (Exception e) {
			log.debug("MyController myInfo 예외발생: " + e.getMessage());
		}
		return "redirect:myInfo.hari";
	}
}
