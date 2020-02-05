package kr.coo.onehari.pay.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.PayDto;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.pay.service.PayService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/ajax")
public class PayRestController {

	@Autowired
	private PayService payService;

	@Autowired
	private EmpService empService;

	// 급여 리스트
	@RequestMapping(value = "/getPayList.hari", method = RequestMethod.POST)
	public JSONObject getPayList(Principal pri, String year, String month) {
		List<String> years = new ArrayList<String>();
		if(payService.getYears(pri.getName()).isEmpty()) {
			years.add("없음");
		}
		years.addAll(payService.getYears(pri.getName()));
		System.out.println(years);
		if (year.equals("init")) {
			year = years.get(0);
		}
		JSONObject root = new JSONObject();
		JSONArray array = new JSONArray();
		List<PayDto> payList = payService.getPayList(pri.getName(), year, month);
		try {
			for (PayDto payDto : payList) {
				JSONObject object = new JSONObject();
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

	// 급여명세서 조회 시 해당 사원정보 가져오기
	@RequestMapping(value = "/getEmp.hari", method = RequestMethod.POST)
	public JSONObject getEmp(Principal pri) {
		JSONObject root = new JSONObject();
		int empNum = Integer.parseInt(pri.getName());
		EmpDto emp = empService.empModify(empNum);
		try {
			root.put("emp", emp);
		} catch (Exception e) {
			log.debug("getPayList 예외발생: " + e.getMessage());
		}
		return root;
	}

	// 사원정보수정(화면)
	@RequestMapping(value = "/getCEO.hari", method = RequestMethod.POST)
	public JSONObject empModify() {
		JSONObject root = new JSONObject();
		EmpDto ceo = empService.getCEO();
		try {
			root.put("CEO", ceo);
		} catch (Exception e) {
			log.debug("getPayList 예외발생: " + e.getMessage());
		}
		return root;
	}
}
