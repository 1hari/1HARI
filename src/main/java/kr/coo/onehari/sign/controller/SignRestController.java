package kr.coo.onehari.sign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;

@RestController
@RequestMapping("ajax/")
public class SignRestController {
	@Autowired
	private SignFormService service;
	
	//품의서 리스트 김정하 / 2020. 1. 8~ 2020. 1. 9 완료
	@RequestMapping("selectAllForm.hari")
	public List<SignFormDto> selectAllForm() {
	    List<SignFormDto> list = service.selectAllForm();
	    return list;
	}
	
}
