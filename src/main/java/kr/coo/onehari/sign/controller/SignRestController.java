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
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public List<SignDto> selectSign(String signDate, String signNum, String signTitle, String draftEmp, String searchKey, String code, String cp, String pg, Principal principal){
		HashMap<String, String> map = new HashMap<String, String>();
		String loginUser = principal.getName();
		
		//System.out.println(signNum);
		
		int offset = Integer.parseInt(cp);
		
		if(offset == 1) {
			offset = 0;
		}else {
			offset = (offset-1)*Integer.parseInt(pg);
		}
		
		map.put("loginUser", loginUser); //현재 로그인한 사번
		map.put("pg", pg); //page 에 보여줄 갯수
		map.put("cp", Integer.toString(offset)); //보여줄 페이지
		map.put("code", code); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서 / 5. 결재한 문서
		
		map.put("signDate", signDate);
		map.put("signNum", signNum);
		map.put("signTitle", signTitle);
		map.put("draftEmp", draftEmp);
		map.put("searchKey", searchKey);
		
		List<SignDto> signList = signService.selectSignList(map);
		
		return signList;
	}
	
	//내문서함 페이징 김정하 / 2020. 1. 15
	@RequestMapping("signPage.hari")
	public int signPage(String signDate, String signNum, String signTitle, String draftEmp, String searchKey, String code, Principal principal) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		//System.out.println(code);
		
		String loginUser = principal.getName();
		
		map.put("loginUser", loginUser); //현재 로그인한 사번
		map.put("code", code); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서 / 5. 결재한 문서
		
		map.put("signDate", signDate);
		map.put("signNum", signNum);
		map.put("signTitle", signTitle);
		map.put("draftEmp", draftEmp);
		map.put("searchKey", searchKey);
		
		int count = signService.signPage(map);
		return count;
	}
	
	//결재하기 김정하 / 2020. 1. 16 String isSign1, String empSign1, String isSign2, String empSign2, String signNum, String signComment, String signCode
	@RequestMapping("approval.hari")
	public Map<String, String> signApproval(SignDto sign, Principal principal) {
		//System.out.println(signNum);
		//System.out.println(isSign1);
		//System.out.println(isSign2);
		System.out.println(sign);
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		
		String isOk = "false";
		String msg = "";
		String empNum = principal.getName();
		
		//결재1이 0이면서 결재자1이 로그인한 사람 또는 결재2가 0이면서 결재자2가 로그인한 사람
		if((sign.getIsSign1().equals("0") && sign.getEmpSign1().equals(empNum)) || (sign.getIsSign2().equals("0") && sign.getEmpSign2().equals(empNum))) {
			int result = 0;
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			if(sign.getSignCode().equals(null) || sign.getSignCode().equals("") || !sign.getSignCode().equals("4")) {
				map.put("isSign1", sign.getIsSign1());
				map.put("isSign2", sign.getIsSign2());
			}
			
			map.put("signNum", sign.getSignNum());
			map.put("signComment", sign.getSignComment());
			map.put("signCode", sign.getSignCode());
			
			//신청서가 연차신청서가 아니거나 (연차신청서이면서 결재자1이거나) 결재코드가 반려이면 일반결재
			if(!sign.getSignFormCode().equals("0") || (sign.getSignFormCode().equals("0") && sign.getIsSign1().equals("0")) || sign.getSignCode().equals("4")) {
				result = signService.signApproval(map);
			}else {
				try {
					result = signService.annSignApproval(map);
				} catch (Exception e) {
					log.debug("AnnSignTran : " + e.getMessage());
				}
			}
						
			if(result > 0 ) {
				isOk = "true";
				msg = "처리되었습니다.";
			}else {
				msg = "처리되지 않았습니다. 다시 확인 바랍니다.";
			}
		}else {
			msg = "정보가 일치하지 않습니다. 다시 확인 바랍니다.";
		}
		
		resultMap.put("isOk", isOk);
		resultMap.put("msg", msg);
		
		return resultMap;
	}
	//관리자 전자결제 문서함 리스트 김정하 / 2020. 1. 22~
	@RequestMapping("selectSignAdmin.hari")
	public List<SignDto> selectSignAdmin(String signDate, String signNum, String signTitle, String draftEmp, String searchKey, String code, String cp, String pg){
		HashMap<String, String> map = new HashMap<String, String>();
						
		int offset = Integer.parseInt(cp);
			
		if(offset == 1) {
			offset = 0;
		}else {
			offset = (offset-1)*Integer.parseInt(pg);
		}
				
		map.put("pg", pg); //page 에 보여줄 갯수
		map.put("cp", Integer.toString(offset)); //보여줄 페이지
		map.put("code", code); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려
		
		map.put("signDate", signDate);
		map.put("signNum", signNum);
		map.put("signTitle", signTitle);
		map.put("draftEmp", draftEmp);
		map.put("searchKey", searchKey);
		
		List<SignDto> signList = signService.selectSignAdminList(map);
			
		return signList;
	}
		
	//관리자 전자결재 문서함 페이징 김정하 / 2020. 1. 15
	@RequestMapping("signAdminPage.hari")
	public int signAdminPage(String signDate, String signNum, String signTitle, String draftEmp, String searchKey, String code) {
		HashMap<String, String> map = new HashMap<String, String>();
			
		//System.out.println(code);
		
		map.put("code", code); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려
			
		map.put("signDate", signDate);
		map.put("signNum", signNum);
		map.put("signTitle", signTitle);
		map.put("draftEmp", draftEmp);
		map.put("searchKey", searchKey);
			
		int count = signService.signAdminPage(map);
		return count;
	}
}
