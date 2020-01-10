package kr.coo.onehari.haricolor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class haricolorController {
	
	@RequestMapping("colorChange.hari")
	public String hariColor() {
		return "haricolor.colorChange";
	}
	
	
	
}

