package kr.coo.onehari.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Position;
import kr.coo.onehari.hr.dto.Rank;
import kr.coo.onehari.hr.dto.Team;
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
	private CorpService corpservice;
	
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
	@RequestMapping(value = "personnel/empJoin.hari", method = RequestMethod.GET)
	public String empJoin() {
		
		return "1hariHr.empJoin";
	}
	
	@RequestMapping(value = "personnel/empJoin.hari", method = RequestMethod.POST)
	public String empJoin(EmpDto empdto, Model model) {
		String view = "";
		int result = empservice.empJoin(empdto);
		System.out.println("HrController empJoin result: " + result);
		System.out.println("empdto: " + empdto);
		if (result > 0) {
			view = "redirect:../empList.hari";
			model.addAttribute("empdto", empdto);
		} else {
			view = "redirect:1hariHr.empList";
			model.addAttribute("사원등록실패");
		}
		return view;
	}

	//사원수정(디테일)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.GET)
	public String empModify1(int empNum, Model model) {
		EmpDto emp = null;
		List<Team> teamlist = null;
		
		try {
			emp = empservice.empModify(empNum);
			model.addAttribute("emp", emp);
			teamlist = corpservice.getTeamCodes();
			model.addAttribute("teamlist", teamlist); 
			log.info("emp: " + emp);
			log.info("teamlist: " + teamlist);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.debug("사원수정1 예외발생: " + e.getMessage());
		}
		return "1hariHr.empModify";
	}

	//사원수정(정보수정)
	@RequestMapping(value = "personnel/empModify1.hari")
	public String empModify2(EmpDto emp) {
		
		try {
			empservice.empUpdate(emp);
			log.info("emp: " + emp);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.debug("사원수정2 예외발생: " + e.getMessage());
		}
		return "redirect:empList.hari";
		/* return "redirect:empList.hari"; */
		/* return "redirect:personnel/empList.hari"; */
	}
}
