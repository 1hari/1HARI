package kr.coo.onehari.util.controller;

import java.util.Arrays;
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
import kr.coo.onehari.hr.dto.Excel;
import kr.coo.onehari.util.service.ExcelService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("util/")
public class ExcelController {

	@Autowired
	private ExcelService excelservice;
	
	@RequestMapping(value = "excelDownload.hari", method = RequestMethod.POST)
	public String excelDownload(MultipartHttpServletRequest request, Model model) {
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		
		if (iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		List<EmpDto> list = excelservice.excelUpload(file);
		model.addAttribute("list", list);
		
		return "jsonView";
	}
}
