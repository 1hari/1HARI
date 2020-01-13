package kr.coo.onehari.util.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Excel;
import kr.coo.onehari.util.service.ExcelService;
import kr.coo.onehari.util.util.ExcelRead;
import kr.coo.onehari.util.util.ExcelReadOption;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("util/")
public class ExcelRestController {

	@RequestMapping(value = "excelUpload.hari", method = RequestMethod.POST)
	public String excelUploadAjax(MultipartHttpServletRequest request, Model model) throws Exception {
		MultipartFile excelFile = request.getFile("excelFile");
		System.out.println("엑셀 파일 업로드 컨트롤러");
		if (excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택해 주세요.");
		}

		File destFile = new File("C:\\" + excelFile.getOriginalFilename());
		
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		// Service 단에서 가져온 코드
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("사번", "이름", "소속", "직급", "직책", "재직구분", "생년월일", "주민등록번호", "핸드폰번호", "이메일", "입사일", "퇴사일");
		excelReadOption.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);

		for (Map<String, String> article : excelContent) {
			System.out.println(article.get("사번"));
			System.out.println(article.get("이름"));
			System.out.println(article.get("소속"));
			System.out.println(article.get("직급"));
			System.out.println(article.get("직책"));
			System.out.println(article.get("재직구분"));
			System.out.println(article.get("생년월일"));
			System.out.println(article.get("주민등록번호"));
			System.out.println(article.get("핸드폰번호"));
			System.out.println(article.get("이메일"));
			System.out.println(article.get("입사일"));
			System.out.println(article.get("퇴사일"));
		}

		// userService.excelUpload(destFile); //서비스 부분을 삭제한다.

		// FileUtils.forceDelete(destFile.getAbsolutePath());

		model.addAttribute("excelContent", excelContent);
		return "1hariHr.empList";
	}
}
