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
	
    //형남 0117 비밀번호 초기화, 변경
    @RequestMapping("/empNumEmail.hari")
    public boolean empNumEmail(String empNum, String email) {
        boolean result=false;
        try {
            result =homeService.empNumEmail(empNum, email);
        } catch (Exception e) {
            log.debug("empNumEmail 예외발생: " + e.getMessage());
        }
        return result;
    }
}