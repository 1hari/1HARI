package kr.coo.onehari.sign.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		map.put("pg", pg); //page 에 보여줄 갯수
		map.put("cp", Integer.toString(offset)); //보여줄 페이지
		map.put("code", code); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서
		List<SignDto> signList = signService.selectSignList(map);
		
		return signList;
	}
	
	//내문서함 페이징 김정하 / 2020. 1. 15
	@RequestMapping("signPage.hari")
	public int signPage(String code, Principal principal) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		//System.out.println(code);
		
		String draftEmp = principal.getName();
		
		map.put("draftEmp", draftEmp); //현재 로그인한 사번
		map.put("code", code); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서
		int count = signService.signPage(map);
		return count;
	}
	
	//결재하기 김정하 / 2020. 1. 16
	@RequestMapping("approval.hari")
	public Map<String, String> signApproval(String isSign1, String empSign1, String isSign2, String empSign2, String signNum, Principal principal) {
		//System.out.println(signNum);
		//System.out.println(isSign1);
		//System.out.println(isSign2);
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		
		String isOk = "false";
		String msg = "";
		String empNum = principal.getName();
		
		if((isSign1.equals("0") && empSign1.equals(empNum)) || (isSign2.equals("0") && empSign2.equals(empNum))) {
			int result = 0;
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("isSign1", isSign1);
			map.put("isSign2", isSign2);
			map.put("signNum", signNum);
			
			result = signService.signApproval(map);
			
			if(result > 0 ) {
				isOk = "true";
				msg = "결재되었습니다.";
			}else {
				msg = "결재처리되지 않았습니다. 다시 확인 바랍니다.";
			}
		}else {
			msg = "결재정보가 일치하지 않습니다. 다시 확인 바랍니다.";
		}
		
		resultMap.put("isOk", isOk);
		resultMap.put("msg", msg);
		
		return resultMap;
	}
}
