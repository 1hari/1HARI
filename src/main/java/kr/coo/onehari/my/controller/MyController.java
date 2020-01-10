package kr.coo.onehari.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("1hariMy/")
//전자결재 controller
public class MyController {	
	/*
	작성자: 김수연
	시작: 2020. 1. 7. 19:44
	완료: 
	내용: MyController
	*/
	//내 정보  화면
	@RequestMapping("myInfo.hari")
	public String Myinfo() {
		return "1hariMy.myInfo";
	}
	
	//비밀번호 초기화, 변경
	@RequestMapping("chaagePassword.hari")
	public String chaagePassword(@RequestParam("email") String email, @RequestParam("newPassword") String password) {
		
		return "1hari.main";
	}

}
