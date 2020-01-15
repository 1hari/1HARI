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
import kr.coo.onehari.util.service.ExcelService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("util/")
public class ExcelController {
	
	@Autowired
	private ExcelService excelservice;

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
	public String insertExcelEmp(EmpDto empdto, Model model) {
		String view = "";
		List<EmpDto> excelEmplist = null;
		
		try {
			excelEmplist = excelservice.insertExcelEmp(empdto);
		} catch (Exception e) {
			System.out.println("ExcelController insertExcelEmp 예외발생: " + e.getMessage());
			log.debug("ExcelController insertExcelEmp 예외발생: " + e.getMessage());
		}
		
		if (excelEmplist != null) {
			view = "redirect:personnel/excelUpload.hari";
			model.addAttribute("Excel 사원등록 실패");
		} else {
			view = "redirect:1hariHr.empList";
			model.addAttribute("excelEmplist", excelEmplist);
		}
		return view;
	}
}
