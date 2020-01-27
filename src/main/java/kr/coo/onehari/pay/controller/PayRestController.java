package kr.coo.onehari.pay.controller;


import java.security.Principal;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.hr.dto.PayDto;
import kr.coo.onehari.pay.service.PayService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/1hariPay")
public class PayRestController {

	@Autowired
	private PayService payService;
	
	//전체급여 리스트
	@RequestMapping(value = "/getPayList.hari", method = RequestMethod.POST)
	public  JSONObject getPayList(String year, Principal pri) {
		List<String> years = payService.getYears(pri.getName());
		if(year.equals("init")) {
			year=years.get(0);
		}
		JSONObject root=new JSONObject();
		JSONArray array=new JSONArray();
		List<PayDto> payList = payService.getPayListYear(pri.getName(), year);
		try {
			for (PayDto payDto : payList) {
				JSONObject object=new JSONObject();
				object.put("payMonth", payDto.getPayMonth());
				object.put("basicSal", payDto.getBasicSal());
				object.put("payNPension", payDto.getPayNPension());
				object.put("payHInsurance", payDto.getPayHInsurance());
				object.put("payCInsurance", payDto.getPayCInsurance());
				object.put("empInsurance", payDto.getEmpInsurance());
				object.put("payIncomeTax", payDto.getPayIncomeTax());
				object.put("payLIncomeTax", payDto.getPayLIncomeTax());
				array.add(object);
			}
			root.put("payList", array);
			root.put("years", years);
			root.put("empNum", pri.getName());
		
		} catch (Exception e) {
			log.debug("getPayList 예외발생: " + e.getMessage());
		}
		return root;
	}
	
//	@RequestMapping(value = "/getPayListYear.hari", method = RequestMethod.POST)
//	public  JSONObject getPayListYear(Principal pri, String year) {
//		JSONObject root=new JSONObject();
//		JSONArray array=new JSONArray();
//		List<PayDto> payList = payService.getPayListYear(pri.getName(), year);
//		try {
//			for (PayDto payDto : payList) {
//				JSONObject object=new JSONObject();
//				object.put("payMonth", payDto.getPayMonth());
//				object.put("basicSal", payDto.getBasicSal());
//				object.put("payNPension", payDto.getPayNPension());
//				object.put("payHInsurance", payDto.getPayHInsurance());
//				object.put("payCInsurance", payDto.getPayCInsurance());
//				object.put("empInsurance", payDto.getEmpInsurance());
//				object.put("payIncomeTax", payDto.getPayIncomeTax());
//				object.put("payLIncomeTax", payDto.getPayLIncomeTax());
//				array.add(object);
//			}
//			root.put("payList", array);
//			
//		} catch (Exception e) {
//			log.debug("getPayList 예외발생: " + e.getMessage());
//		}
//		return root;
//	}
}
