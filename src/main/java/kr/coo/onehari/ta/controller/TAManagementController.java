package kr.coo.onehari.ta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariHr/")
public class TAManagementController {

	/*
	 * 관리자 사원근태관리 작성자: 김진호 날짜: 2020. 1. 24
	 */
	@RequestMapping(value = "personnel/taManagement.hari", method = RequestMethod.GET)
	public String taManagement() {
		return "1hariHr.taManagement";
	}
}
