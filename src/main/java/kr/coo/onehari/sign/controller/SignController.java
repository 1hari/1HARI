package kr.coo.onehari.sign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dao.CorpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Team;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;

@Controller
@RequestMapping("1hariSign/")
//전자결재 controller
public class SignController {

	//부서명 가져오는 service
	@Autowired
	private CorpService corpService;
	
	//양식 가져오는 service;
	@Autowired
	private SignFormService signFormService;
	
	//사원 가져오는 service;
	@Autowired
	private EmpService empService;

	//홈 화면 김정하 / 2020. 1. 7
	@RequestMapping("signForm.hari")
	public String signForm() {
		return "1hariSign.signForm";
	}	
	
	//문서기안 화면 김정하 / 2020. 1. 8~
	@RequestMapping(value="docuDraft.hari", method = RequestMethod.GET)
	public String formDraft(String signFormCode, Model model) {
		System.out.println(signFormCode);
		
		//폼가져오기
		SignFormDto form = signFormService.selectForm(signFormCode);
		model.addAttribute("form", form);
		
		//부서명 가져오기
		List<Team> teamList = corpService.getTeamCodes();
		model.addAttribute("teamList", teamList);
		
		//사원 가져오기
		List<EmpDto> empList = empService.empDefaultList();
		model.addAttribute("empList", empList);
		return "1hariSign.docuDraft";
	}
		
	//내 문서함 화면 김정하 / 2020. 1. 7~
	@RequestMapping("myDocu.hari")
	public String myDocu() {
		return "1hariSign.myDocu";
	}
}
