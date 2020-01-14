package kr.coo.onehari.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/1hariPay")
public class PayController {
	@RequestMapping("/payList.hari")
	public String boardList() {
		return "1hariPay.payList";
	}
}
