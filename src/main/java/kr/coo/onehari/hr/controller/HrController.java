package kr.coo.onehari.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.EmpService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariHr/")
public class HrController {
	
	@Autowired
	private EmpService empservice;
	
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
	
	//사원목록 김진호 2020. 1. 7
	@RequestMapping(value = "personnel/empList.hari", method = RequestMethod.GET)
	public String empList(Model model) {
		List<EmpDto> emplist = null;
		
		try {
			emplist = empservice.empList();
			model.addAttribute("emplist", emplist);
		} catch (Exception e) {
			System.out.println("사원목록 예외발생: " + e.getMessage());
			log.debug("사원목록 예외발생: " + e.getMessage());
		}
		return "1hariHr.empList";
	}
	
	// 사원등록 김진호 시작 2020. 1. 7 <> 완성 2020. 1. 10
	@RequestMapping(value = "personnel/empJoin.hari", method = RequestMethod.GET)
	public String empJoin() {
		
		return "1hariHr.empJoin";
	}
	
	// 사원등록 김진호 시작 2020. 1. 7 <> 완성 2020. 1. 10
	@RequestMapping(value = "personnel/empJoin.hari", method = RequestMethod.POST)
	public String empJoin(EmpDto empdto, Model model) {
		String view = "";
		int result = empservice.empJoin(empdto);
		
//		empdto.setEmail(empdto.getEmail()+"@gmail.com"); // 이메일 형식붙여서 DB에 넣을 때
		
		if (result > 0) {
			view = "redirect:../personnel/empList.hari";
			model.addAttribute("empdto", empdto);
		} else {
			view = "redirect:1hariHr.empList";
			model.addAttribute("사원등록실패");
		}
		return view;
	}

	// 사원정보수정(화면)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.GET)
	public String empModify(int empNum, Model model) {
		EmpDto emp = null;
		
		try {
			emp = empservice.empModify(empNum);
			model.addAttribute("emp", emp);
		} catch (Exception e) {
			System.out.println("HrController empModify 예외발생: " + e.getMessage());
			log.debug("HrController empModify 예외발생: " + e.getMessage());
		}
		return "1hariHr.empModify";
	}

	// 사원정보수정(변경)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.POST)
	public String empUpdate(EmpDto emp) {
		
		try {
			empservice.empUpdate(emp);
		} catch (Exception e) {
			System.out.println("HrController empUpdate 예외발생: " + e.getMessage());
			log.debug("HrController empUpdate 예외발생: " + e.getMessage());
		}
		return "redirect:empList.hari";
		/* return "redirect:empList.hari"; */
		/* return "redirect:personnel/empList.hari"; */
	}
	
	//User - 사원리스트 김정하 / 2020. 1. 12
	@RequestMapping("teamList.hari")
	public String teamList() {
		return "1hariHr.teamList";
	}
}
