package kr.coo.onehari.util.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	private EmpService empService;
	
	@Autowired
	private ExcelService excelService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; // 비밀번호 암호화

	@RequestMapping(value = "personnel/excelUpload.hari", method = RequestMethod.GET)
	public String excelForm(String isOk, String msg, Model model) {
		model.addAttribute("isOk", isOk);
		model.addAttribute("msg", msg);
		
		return "1hariPopUp.excelUploadForm";
	}

	@RequestMapping(value = "personnel/uploadExcelFile.hari", method = RequestMethod.POST)
	public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if (iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		List<EmpDto> list = excelService.uploadExcelFile(file);
		model.addAttribute("list", list);
		
		return "jsonView";
	}
	
	@RequestMapping(value = "personnel/insertExcelEmp.hari", method = RequestMethod.POST)
	public String insertExcelEmp(ExcelEmpDto excelemp, Model model) {
		String isOk = "";
		String msg = "";
		int result = 0;
		EmpDto emp = new EmpDto();
		
		for(int i = 0; i < excelemp.getEmpdto().size(); i++) {
			emp = excelemp.getEmpdto().get(i);
			
			try {
				emp.setPassword(bCryptPasswordEncoder.encode(emp.getBirth()));
				result = empService.empJoin(emp);
			} catch (Exception e) {
				log.debug("Excel Controller insertExcelEmp 예외발생: " + e.getMessage());
			}
		}
		
		if (result > 0) {
			isOk = "true";
			msg = "Excel 저장하기 완료!";
		} else {
			isOk = "false";
			msg = "Excel 저장하기 오류!";
		}
		
		model.addAttribute("isOk", isOk);
		model.addAttribute("msg", msg);
		
		return "1hariPopUp.excelUploadForm";
	}
	
	@RequestMapping(value = "personnel/excelDownload.hari", method = RequestMethod.POST)
	public String downloadExcelFile(Model model) {
		List<EmpDto> list = excelService.excelEmpList();
		
		SXSSFWorkbook workbook = excelService.excelFileDownloadProcess(list);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).getEmpNum();
			list.get(i).getEmpName();
			list.get(i).getTeamCode();
			list.get(i).getRankCode();
			list.get(i).getPositionCode();
			list.get(i).getEmploymentCode();
			list.get(i).getBirth();
			list.get(i).getResNum();
			list.get(i).getPhoneNum();
			list.get(i).getEmail();
			list.get(i).getHireDate();
			list.get(i).getLeaveDate();
		}
		
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "사원목록");
		
		// return "redirect:../../1hariHr/personnel/empList.hari";
		return "excelDownloadView";
	}
	
	@RequestMapping(value = "personnel/excelFormDownload.hari", method = RequestMethod.POST)
	public String excelFormDownload(Model model) {
		SXSSFWorkbook workbook = excelService.excelFileDownloadProcess();
		
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "사원목록양식");
		
		return "excelDownloadView";
	}
}
