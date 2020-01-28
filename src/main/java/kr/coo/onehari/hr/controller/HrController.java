package kr.coo.onehari.hr.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dto.EmpAnn;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariHr/")
public class HrController {
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private CorpService corpService;
	
	//근태관리 화면
	@RequestMapping("attendance.hari")
	public String attendance() {
		return "1hariHr.attendance";
	}
	
	//연차관리 화면
	@RequestMapping("annual.hari")
	public String annual(Principal principal, Model model) {
		EmpAnn empAnn = empService.getEmpAnn(principal.getName());
		model.addAttribute("empAnn", empAnn);
		
		return "1hariHr.annual";
	}
	
	//사원목록 김진호 2020. 1. 7
	@RequestMapping(value = "personnel/empList.hari", method = RequestMethod.GET)
	public String empList(Model model) {
		List<EmpDto> emplist = null;
		
		try {
			emplist = empService.empList();
			model.addAttribute("emplist", emplist);
		} catch (Exception e) {
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
		int result =0;
		
		try {
			result = empService.empJoin(empdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			view = "redirect:empList.hari";
			model.addAttribute("empdto", empdto);
		} else {
			view = "redirect:empJoin.hari";
			model.addAttribute("사원등록실패");
		}
		return view;
	}

	// 사원정보수정(화면)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.GET)
	public String empModify(int empNum, Model model) {
		try {
			EmpDto emp = empService.empModify(empNum);
			model.addAttribute("emp", emp);
		} catch (Exception e) {
			log.debug("HrController empModify 예외발생: " + e.getMessage());
		}
		return "1hariHr.empModify";
	}

	// 사원정보수정(변경)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.POST)
	public String empUpdate(EmpDto emp, boolean isAdmin) {
		// SecurityContext 객체를 선언
		SecurityContext context = SecurityContextHolder.getContext();
		// 인증권한 객체를 선언
		Authentication authentication = context.getAuthentication();
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
		
		while (iter.hasNext()) {
			GrantedAuthority auth = iter.next();
			if (auth.getAuthority().equals("ROLE_ADMIN")) {
				isAdmin = true;
				break;
			} else {
				isAdmin = false;
				break;
			}
		}
		
		try {
			empService.empUpdate(emp, isAdmin);
		} catch (Exception e) {
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

	/*
	 * 관리자 사원근태관리
	 * 작성자: 김진호
	 * 날짜: 2020. 1. 24
	 */
	@RequestMapping(value = "personnel/taManagement.hari", method = RequestMethod.GET)
	public String taManagement() {
		return "1hariHr.taManagement";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String taManagement(EmpDto emp) {
		return null;
	}
}
