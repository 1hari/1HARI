package kr.coo.onehari.my.controller;

import java.security.Principal;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.coo.onehari.hr.dao.EmpDao;
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
	
	@Autowired
	private SqlSession sqlsession;
	
	//내 정보  화면
	@RequestMapping(value = "myInfo.hari", method = RequestMethod.GET)
	public String Myinfo(Model model, Principal principal) {
		EmpDto emp = null;
		
		try {
			emp = empServcie.empModify(Integer.parseInt(principal.getName()));
			model.addAttribute("emp", emp);
		} catch (Exception e) {
			log.debug("MyController Myinfo 예외발생: " + e.getMessage());
		}
		return "1hariMy.myInfo";
	}
	
	@RequestMapping(value = "myInfo.hari", method = RequestMethod.POST)
	public EmpDto Myinfo(EmpDto empdto, Principal principal) {
		
		return null;
	}
}
