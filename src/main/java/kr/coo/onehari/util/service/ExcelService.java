package kr.coo.onehari.util.service;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.util.util.ExcelRead;
import kr.coo.onehari.util.util.ExcelReadOption;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExcelService {

	public void excelUpload(File destFile) throws Exception {
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
	}
}
