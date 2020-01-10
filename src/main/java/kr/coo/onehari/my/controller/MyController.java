package kr.coo.onehari.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.my.service.MyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariMy/")
public class MyController {	
	/*
	작성자: 김수연
	시작: 2020. 1. 7. 19:44
	완료: 
	내용: MyController
	*/
	
	@Autowired
	private MyService myService;
	
	//내 정보  화면
	@RequestMapping("myInfo.hari")
	public String Myinfo() {
		return "1hariMy.myInfo";
	}
	
	//형남 0110 비밀번호 초기화, 변경
	@RequestMapping("chagePassword.hari")
	public String updatePassword(@RequestParam("empNum") String empNum, @RequestParam("newPassword") String password) {
		try {
			myService.updatePassword(empNum, password);
		} catch (Exception e) {
			System.out.println("empNumEmail 예외발생: " + e.getMessage());
			log.debug("empNumEmail 예외발생: " + e.getMessage());
		}
		return "redirect:../index.hari";
	}

}
