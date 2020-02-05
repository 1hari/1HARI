package kr.coo.onehari.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/1hariPay")
public class PayController {
	@RequestMapping("/payList.hari")
	public String boardList() {
		return "1hariPay.payList";
	}
	
	@RequestMapping("/getPayPopUp.hari")
	public String getPayPopUp(@RequestParam("year") String year, @RequestParam("month") String month, Model model)  {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		return "1hariPopUp.payPopUp";
	}
}
