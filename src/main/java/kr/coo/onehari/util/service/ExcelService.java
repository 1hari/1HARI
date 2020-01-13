package kr.coo.onehari.util.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.onehari.hr.dto.EmpDto;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ExcelService {
	
	public List<EmpDto> makeList(int[] empNum) {
		List<EmpDto> emplist = new ArrayList<EmpDto>();
		for (int i = 0; i < empNum.length; i++) {
			EmpDto empdto = new EmpDto();
			empdto.setEmpNum(empNum[i]);
			
		}
		return null;
	}

	public List<EmpDto> excelUpload(MultipartFile excelFile) {
		List<EmpDto> empList = new ArrayList<EmpDto>();
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			
			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				EmpDto empdto = new EmpDto();
				XSSFRow row = sheet.getRow(i);
				
				// 행이 존재하지 않으면 Pass
				if (row == null) {
					continue;
				}
				
				XSSFCell cell = null;
				
				// 행의 두 번째 열부터 받아오기
				cell = row.getCell(1);
				if (cell != null) empdto.setEmpNum(Integer.parseInt(cell.getStringCellValue()));
				
				cell = row.getCell(2);
				if (cell != null) empdto.setEmpName(cell.getStringCellValue());
				
				cell = row.getCell(3);
				if (cell != null) empdto.setTeamCode(Integer.parseInt(cell.getStringCellValue()));
				
				cell = row.getCell(4);
				if (cell != null) empdto.setRankCode(Integer.parseInt(cell.getStringCellValue()));
				
				cell = row.getCell(5);
				if (cell != null) empdto.setPositionCode(Integer.parseInt(cell.getStringCellValue()));
				
				cell = row.getCell(6);
				if (cell != null) empdto.setEmploymentCode(Integer.parseInt(cell.getStringCellValue()));
				
				cell = row.getCell(7);
				if (cell != null) empdto.setBirth(cell.getStringCellValue());
				
				cell = row.getCell(8);
				if (cell != null) empdto.setResNum(cell.getStringCellValue());
				
				cell = row.getCell(9);
				if (cell != null) empdto.setPhoneNum(cell.getStringCellValue());
				
				cell = row.getCell(10);
				if (cell != null) empdto.setEmail(cell.getStringCellValue());
				
				cell = row.getCell(11);
				if (cell != null) empdto.setHireDate((Date) cell.getDateCellValue());
				
				cell = row.getCell(12);
				if (cell != null) empdto.setLeaveDate((Date) cell.getDateCellValue());
				
				empList.add(empdto);
			}
		} catch (Exception e) {
			System.out.println("ExcelService Upload 예외발생: " + e.getMessage());
			log.debug("ExcelService Upload 예외발생: " + e.getMessage());
		}
		return empList;
	}
	
	
}
