package kr.coo.onehari.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("1hariHr/")
public class HrController {
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
	
	//사원리스트 화면
	@RequestMapping("personnel/empList.hari")
	public String empList() {
		return "1hariHr.empList";
	}
	
	//사원등록
	@RequestMapping("personnel/empJoin.hari")
	public String empJoin() {
		return "1hariHr.empJoin";
	}
	
	//사원수정
	@RequestMapping("personnel/empModify.hari")
	public String empModify() {
		return "1hariHr.empModify";
	}
}
