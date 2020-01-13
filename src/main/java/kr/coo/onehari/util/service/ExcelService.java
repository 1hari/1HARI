package kr.coo.onehari.util.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import kr.coo.onehari.hr.dto.Excel;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExcelService extends AbstractExcelView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
									HSSFWorkbook workbook, HttpServletRequest request,
									HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment; filename=\"ExcelSamples.xls\";");

		HSSFSheet sheet = createSheet(workbook);
		createColumnLabel(sheet);

		List<Excel> excelList = (List<Excel>) model.get("excelList");
		int rowNum = 1;
		for (Excel index : excelList) {
			createRow(sheet, index, rowNum++);
		}
	}
	/*
	 * 시트 생성
	 * @param HSSFWorkbook workbook
	 * @return 생성된 Sheet
	 */
	private HSSFSheet createSheet(HSSFWorkbook workbook) {
		// 시트 생성
		HSSFSheet sheet = workbook.createSheet();
		// 시트 설정
		workbook.setSheetName(0, "Sheet_01");
		// 시트 열 너비 설정
		sheet.setColumnWidth(0, 128 * 20);
		sheet.setColumnWidth(1, 256 * 20);
		sheet.setColumnWidth(2, 64 * 20);
		sheet.setColumnWidth(3, 256 * 20);
		return sheet;
	}

	/*
	 * Column Label 생성
	 * @param HSSFSheet sheet
	 * @return 
	 */
	private void createColumnLabel(HSSFSheet sheet) {
		// 첫 번째 행을 Label로 생성
		HSSFRow firstRow = sheet.createRow(0);
		// Column Label 설정을 위한 변수 선언
		HSSFCell cell = null;
		
		// 생성된 행의 첫 번째 Cell(열) 생성
		cell = firstRow.createCell(0);
		// 첫 번째 Cell(열) 값 설정
		cell.setCellValue("사번");

		cell = firstRow.createCell(1);
		cell.setCellValue("이름");
		
		cell = firstRow.createCell(2);
		cell.setCellValue("소속");
		
		cell = firstRow.createCell(3);
		cell.setCellValue("직급");
		
		cell = firstRow.createCell(4);
		cell.setCellValue("직책");
		
		cell = firstRow.createCell(5);
		cell.setCellValue("재직구분");
		
		cell = firstRow.createCell(6);
		cell.setCellValue("생년월일");
		
		cell = firstRow.createCell(7);
		cell.setCellValue("주민등록번호");
		
		cell = firstRow.createCell(8);
		cell.setCellValue("핸드폰번호");
		
		cell = firstRow.createCell(9);
		cell.setCellValue("이메일");
		
		cell = firstRow.createCell(10);
		cell.setCellValue("입사일");
		
		// 생성된 행의 열두 번째 Cell(열) 생성
		cell = firstRow.createCell(11);
		// 열두 번째 Cell(열) 값 설정		
		cell.setCellValue("퇴사일");
	}

	private void createRow(HSSFSheet sheet, Excel excel, int rowNum) {
		HSSFRow row = sheet.createRow(rowNum);
		HSSFCell cell = null;
		
		cell = row.createCell(0);
		cell.setCellValue(excel.getIndex());
		
		cell = row.createCell(1);
		cell.setCellValue(excel.getEmpNum());
		
		cell = row.createCell(2);
		cell.setCellValue(excel.getEmpName());
		
		cell = row.createCell(3);
		cell.setCellValue(excel.getTeamCode());
		
		cell = row.createCell(4);
		cell.setCellValue(excel.getRankCode());
		
		cell = row.createCell(5);
		cell.setCellValue(excel.getPositionCode());
		
		cell = row.createCell(6);
		cell.setCellValue(excel.getEmploymentCode());
		
		cell = row.createCell(7);
		cell.setCellValue(excel.getBirth());
		
		cell = row.createCell(8);
		cell.setCellValue(excel.getResNum());
		
		cell = row.createCell(9);
		cell.setCellValue(excel.getPhoneNum());
		
		cell = row.createCell(10);
		cell.setCellValue(excel.getEmail());
		
		cell = row.createCell(11);
		cell.setCellValue(excel.getHireDate());
		
		cell = row.createCell(12);
		cell.setCellValue(excel.getLeaveDate());
	}
}
