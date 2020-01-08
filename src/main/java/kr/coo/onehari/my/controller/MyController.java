package kr.coo.onehari.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




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

}
