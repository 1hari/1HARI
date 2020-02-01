package kr.coo.onehari.ta.controller;

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

import kr.coo.onehari.hr.dto.AnnUse;
import kr.coo.onehari.hr.dto.EmpAnn;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.ta.service.TAService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariHr/")
public class TAManagementController {

	@Autowired
	private EmpService empService;

	@Autowired
	private CorpService corpService;

	@Autowired
	private TAService taService;

	/*
	 * 관리자 사원근태관리 작성자: 김진호 날짜: 2020. 1. 24
	 */
	@RequestMapping(value = "personnel/taManagement.hari", method = RequestMethod.GET)
	public String taManagement() {
		return "1hariHr.taManagement";
	}
}
