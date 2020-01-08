package kr.coo.onehari.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;

@Controller
public class HomeController {
	@Autowired
	private SignFormService service;
	
	@RequestMapping("index.hari")
	public String index() {
		return "home.index";
	}
	
	//품의서 리스트 김정하 / 2020. 1. 8~
	@RequestMapping("main.hari")
	public String main(Model model) {
		List<SignFormDto> list = service.selectAllForm(); 
		model.addAttribute("list", list);
		return "1hari.main";
	}
	
	//형남 0108 1640~
    @RequestMapping(value="/error403.hari")
    public String accessDeniedPage() throws Exception {
        return "1hari.403";
    }
}

