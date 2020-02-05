package kr.coo.onehari.ta.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.ta.service.TAManagementService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class TAManagementRestController {

	@Autowired
	private TAManagementService taManagementService;

	// 관리자권한 근태목록 가져오기 김진호 2020. 1. 27
	@RequestMapping(value = "getTaList.hari", method = RequestMethod.POST)
	public List<EmpDto> getTaList(String setDate) {
		List<EmpDto> getTaList = null;
		try {
			getTaList = taManagementService.getTaList(setDate);
		} catch (Exception e) {
			log.debug("HrRestController getTaList 예외발생: " + e.getMessage());
		}
		return getTaList;
	}

	// 관리자권한 사원근태수정을 위한 사원정보 가져오기 김진호 2020. 1. 29
	@RequestMapping(value = "setEmpTa.hari", method = RequestMethod.POST)
	public int setEmpTa(EmpDto empdto, String setDate, String todayStartDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		int result = 0;
		map.put("taDate", empdto.getTaDate());
		map.put("empNum", Integer.toString(empdto.getEmpNum()));
		map.put("todayWork", empdto.getTodayWork());
		map.put("setDate", setDate);
		map.put("todayStartDate", todayStartDate);

		try {
			if(empdto.getTodayWork() == "32400" || empdto.getTodayWork().contentEquals("32400")) {
				result = taManagementService.setEmpTaStartNull(map);
			}else {
				result = taManagementService.setEmpTa(map);
			}
			
		} catch (Exception e) {
			log.debug("HrRestController setEmpTa 예외발생: " + e.getMessage());
		}
		return result;
	}
}