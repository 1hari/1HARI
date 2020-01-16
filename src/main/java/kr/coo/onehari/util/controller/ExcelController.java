package kr.coo.onehari.util.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.util.dto.ExcelEmpDto;
import kr.coo.onehari.util.service.ExcelService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("util/")
public class ExcelController {
	
	@Autowired
	private ExcelService excelservice;
	
	@Autowired
	private EmpService empService;

	@RequestMapping(value = "personnel/excelUpload.hari", method = RequestMethod.GET)
	public String excelForm() {
		return "etc.excelForm";
	}

	@RequestMapping(value = "personnel/uploadExcelFile.hari", method = RequestMethod.POST)
	public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if (iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		List<EmpDto> list = excelservice.uploadExcelFile(file);

		model.addAttribute("list", list);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "personnel/insertExcelEmp.hari", method = RequestMethod.POST)
	public String insertExcelEmp(ExcelEmpDto excelemp, Model model) {
		String view = "";
		int result = 0;
		EmpDto emp = new EmpDto();
		
		for(int i = 0; i < excelemp.getEmpdto().size(); i++) {
			emp = excelemp.getEmpdto().get(i);
			emp.setPassword("1004");
			
			try {
				result = empService.empJoin(emp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (result > 0) {
			model.addAttribute("result", result);
		} else {
			model.addAttribute("result", result);
		}
		return view;
	}
}
