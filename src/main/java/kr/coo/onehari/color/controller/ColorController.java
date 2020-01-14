package kr.coo.onehari.color.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/color")
public class ColorController {
	@RequestMapping("/color.hari")
	public String boardList() {
		return "color.color";
	}
}
