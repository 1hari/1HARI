package kr.coo.onehari.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariHr/")
public class HrController {
	
	@Autowired
	private EmpService empservice;
	
	@Autowired
	private CorpService teamservice;
	
	//근태관리 화면
	@RequestMapping("attendance.hari")
	public String attendance() {
		return "1hariHr.attendance";
	}
	
	//연차관리 화면
	@RequestMapping("annual.hari")
	public String annual() {
		return "1hariHr.annual";
	}
	
	//사원목록 김진호 200107
	@RequestMapping(value = "personnel/empList.hari", method = RequestMethod.GET)
	public String empList(Model model) {
		List<EmpDto> emplist = null;
		
		try {
			emplist = empservice.empList();
			model.addAttribute("emplist", emplist);
			log.info("emplist: " + emplist);
		} catch (Exception e) {
			System.out.println("사원목록 예외발생: " + e.getMessage());
			log.debug("사원목록 예외발생: " + e.getMessage());
		}
		return "1hariHr.empList";
	}
	
	//사원등록
	@RequestMapping("personnel/empJoin.hari")
	public String empJoin() {
		
		return "1hariHr.empJoin";
	}
		
	//사원수정
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.GET)
	public String empModify1(int empNum, Model model) {
		EmpDto emp = null;
		List<Integer> team = null;
		
		try {
			emp = empservice.empModify(empNum);
			model.addAttribute("emp", emp);
			
			team = teamservice.getTeamCodes();
			model.addAttribute("team", team); 
			
			log.info("emp: " + emp);
			log.info("team: " + team);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.debug("사원수정 예외발생: " + e.getMessage());
		}
		return "1hariHr.empModify";
	}
}
