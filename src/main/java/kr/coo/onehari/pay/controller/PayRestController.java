package kr.coo.onehari.pay.controller;


import java.security.Principal;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.pay.service.PayService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/1hariPay")
public class PayRestController {

	@Autowired
	private PayService payService;
	
	// 게시판 리스트 가져오기
	@RequestMapping(value = "/getPayList.hari", method = RequestMethod.POST)
	public  JSONObject getPayList(Principal pri) {
		JSONObject root = payService.getPayList(pri.getName());
		System.out.println(root.toString());
		try {
		} catch (Exception e) {
			log.debug("getPayList 예외발생: " + e.getMessage());
		}
		return root;
	}
}
