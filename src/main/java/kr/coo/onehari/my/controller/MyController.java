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
	
	//내 정보  화면
	@RequestMapping("myInfo.hari")
	public String Myinfo() {
		return "1hariMy.myInfo";
	}
	

}
