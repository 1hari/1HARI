package kr.coo.onehari.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("1hariSign/")
//전자결재 controller
public class SignController {	
	
	//홈 화면
	@RequestMapping("signForm.hari")
	public String signForm() {
		return "1hariSign.signForm";
	}
	
	//양식등록 화면
	@RequestMapping("admin/formInsert.hari")
	public String formInsert() {
		return "1hariSign.formInsert";
	}
	
	//내 문서함 화면
	@RequestMapping("myDocu.hari")
	public String myDocu() {
		return "1hariSign.myDocu";
	}
}
