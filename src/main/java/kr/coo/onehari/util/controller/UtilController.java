package kr.coo.onehari.util.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.coo.onehari.hr.dto.Excel;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("util/")
public class UtilController {

	@RequestMapping("excel.hari")
	public String excelDownload(Model model) {
		List<Excel> excelList = Arrays.asList(
//				new Excel(11, 12, 13, 14, "첫번째 줄")
				);
		return null;
	}
}
