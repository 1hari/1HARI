package kr.coo.onehari.sign.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.sign.dto.SignDto;
import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;
import kr.coo.onehari.sign.service.SignService;

@RestController
@RequestMapping("ajax/")
public class SignRestController {
	//전자결재 폼 서비스
	@Autowired
	private SignFormService formService;
	
	//전자결재 서비스 
	@Autowired
	private SignService signService;
	
	//품의서 리스트 김정하 / 2020. 1. 8~ 2020. 1. 9 완료
	@RequestMapping("selectAllForm.hari")
	public List<SignFormDto> selectAllForm() {
	    List<SignFormDto> formList = formService.selectAllForm();
	    return formList;
	}
	
	//내문서함 리스트 김정하 / 2020. 1. 14~
	@RequestMapping("selectSign.hari")
	public List<SignDto> selectSign(String code, String cp, String pg, Principal principal){
		HashMap<String, String> map = new HashMap<String, String>();
		String draftEmp = principal.getName();
		int offset = Integer.parseInt(cp);
		
		if(offset == 1) {
			offset = 0;
		}else {
			offset = (offset-1)*Integer.parseInt(pg);
		}
		
		map.put("draftEmp", draftEmp); //현재 로그인한 사번
		map.put("pg", "3"); //page 에 보여줄 갯수
		map.put("cp", Integer.toString(offset)); //보여줄 페이지
		map.put("code", code); //결재분류 : 1.기안 / 2.완료 / 3.반려 / 4.결재대기
		List<SignDto> signList = signService.selectSignList(map);
		
		return signList;
	}
	
}
