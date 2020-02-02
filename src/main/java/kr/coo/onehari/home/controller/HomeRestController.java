package kr.coo.onehari.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.home.service.HomeService;
import kr.coo.onehari.hr.dto.EmpDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class HomeRestController {


	@Autowired
	private HomeService homeService;
	
	// 형남 0110 비밀번호 변경 시 이메일과 사번 일치여부 확인
	@RequestMapping(value = "/empNumEmail.hari", method = RequestMethod.POST)
	public boolean empNumEmail(EmpDto emp) {
		boolean isExist = false;
		try {
			isExist = homeService.empNumEmail(emp);
		} catch (Exception e) {
			log.debug("empNumEmail 예외발생: " + e.getMessage());
		}
		return isExist;
	}
	
}