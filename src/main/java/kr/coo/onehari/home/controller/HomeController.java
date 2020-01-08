package kr.coo.onehari.home.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("index.hari")
	public String index() {
		return "home.index";
	}
	
	@RequestMapping("main.hari")
	public String main() {
		return "1hari.main";
	}
	
	//형남 0108 1640~
    @RequestMapping(value="/error403.hari")
    public String accessDeniedPage() throws Exception {
        return "1hari.403";
    }
}

