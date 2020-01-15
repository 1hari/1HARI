package kr.coo.onehari.util.service;

import java.util.Date;
import java.util.HashMap;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.util.dao.ExcelDao;
import kr.coo.onehari.util.dto.ExcelEmpDto;
import lombok.extern.slf4j.Slf4j;

/*
 * 작성자: 김진호
 * 시작: 2020. 1. 13
 * 내용: Excel Upload/Download
 */

@Service
@Slf4j
public class ExcelService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/**
	 * 엑셀파일로 만들 리스트 생성
	 * 
	 * @param names
	 * @param prices
	 * @param quantities
	 * @return 엑셀파일 리스트
	 */
	public List<EmpDto> makeFruitList(int[] empNum, String[] empName, int[] teamCode, int[] rankCode, int[] positionCode, int[] employmentCode, 
			String[] birth, String[] resNum, String[] phoneNum, String[] email, Date[] hireDate, Date[] leaveDate) {
		List<EmpDto> list = new ArrayList<EmpDto>();
		for (int i = 0; i < empNum.length; i++) {
			EmpDto empdto = new EmpDto();
			list.add(empdto);
		}
		return list;
	}

	/**
	 * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
	 * 
	 * @param list
	 * @return 생성된 워크북
	 */
//	public SXSSFWorkbook makeSimpleEmpExcelWorkbook(List<EmpDto> list) {
//		SXSSFWorkbook workbook = new SXSSFWorkbook();
//
//		// 시트 생성
//		SXSSFSheet sheet = workbook.createSheet("과일표");
//
//		// 시트 열 너비 설정
//		sheet.setColumnWidth(0, 1500);
//		sheet.setColumnWidth(0, 3000);
//		sheet.setColumnWidth(0, 3000);
//		sheet.setColumnWidth(0, 1500);
//
//		// 헤더 행 생
//		Row headerRow = sheet.createRow(0);
//		// 해당 행의 첫번째 열 셀 생성
//		Cell headerCell = headerRow.createCell(0);
//		headerCell.setCellValue("번호");
//		// 해당 행의 두번째 열 셀 생성
//		headerCell = headerRow.createCell(1);
//		headerCell.setCellValue("과일이름");
//		// 해당 행의 세번째 열 셀 생성
//		headerCell = headerRow.createCell(2);
//		headerCell.setCellValue("가격");
//		// 해당 행의 네번째 열 셀 생성
//		headerCell = headerRow.createCell(3);
//		headerCell.setCellValue("수량");
//
//		// 과일표 내용 행 및 셀 생성
//		Row bodyRow = null;
//		Cell bodyCell = null;
//		for (int i = 0; i < list.size(); i++) {
//			EmpDto empdto = list.get(i);
//
//			// 행 생성
//			bodyRow = sheet.createRow(i + 1);
//			// 데이터 번호 표시
//			bodyCell = bodyRow.createCell(0);
//			bodyCell.setCellValue(i + 1);
//			// 데이터 이름 표시
//			bodyCell = bodyRow.createCell(1);
//			bodyCell.setCellValue(empdto.getName());
//			// 데이터 가격 표시
//			bodyCell = bodyRow.createCell(2);
//			bodyCell.setCellValue(empdto.getPrice());
//			// 데이터 수량 표시
//			bodyCell = bodyRow.createCell(3);
//			bodyCell.setCellValue(empdto.getQuantity());
//		}
//
//		return workbook;
//	}

	/**
	 * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소
	 * 
	 * @param list
	 * @return
	 */
//	public SXSSFWorkbook excelFileDownloadProcess(List<EmpDto> list) {
//		return this.makeSimpleEmpExcelWorkbook(list);
//	}

	/**
	 * 업로드한 엑셀파일을 과일 리스트로 만들기
	 * 
	 * @param excelFile
	 * @return 생성한 과일 리스트
	 */
	public List<EmpDto> uploadExcelFile(MultipartFile excelFile) {
		List<EmpDto> list = new ArrayList<EmpDto>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				EmpDto empdto = new EmpDto();
				XSSFRow row = sheet.getRow(i);

				// 행이 존재하기 않으면 패스
				if (null == row) {
					continue;
				}
				XSSFCell cell = null;
//				SimpleDateFormat sdf = new SimpleDateFormat();
//				String hireDate = "";
//				String leaveDate = "";
				
				// 행의 첫 번째 열 받아오기
//				cell = row.getCell(0);
//				System.out.println("0: " + cell);
//				if (null != cell)
//					empdto.setEmpNum((int) cell.getNumericCellValue());
				// 행의 두 번째 열 받아오기
				cell = row.getCell(1);
				if (null != cell)
					empdto.setEmpName(cell.getStringCellValue());
				// 행의 세 번째 열 받아오기
				cell = row.getCell(2);
				if (null != cell)
					empdto.setTeamCode((int) cell.getNumericCellValue());
				// 행의 네 번째 열 받아오기
				cell = row.getCell(3);
				if (null != cell)
					empdto.setRankCode((int) cell.getNumericCellValue());
				// 행의 다섯 번째 열 받아오기
				cell = row.getCell(4);
				if (null != cell)
					empdto.setPositionCode((int) cell.getNumericCellValue());
				// 행의 여섯 번째 열 받아오기
				cell = row.getCell(5);
				if (null != cell)
					empdto.setEmploymentCode((int) cell.getNumericCellValue());
				// 행의 일곱 번째 열 받아오기
				cell = row.getCell(6);
				if (null != cell)
					empdto.setBirth(cell.getStringCellValue());
				// 행의 여덟 번째 열 받아오기
				cell = row.getCell(7);
				if (null != cell)
					empdto.setResNum(cell.getStringCellValue());
				// 행의 아홉 번째 열 받아오기
				cell = row.getCell(8);
				if (null != cell)
					empdto.setPhoneNum(cell.getStringCellValue());
				// 행의 열 번째 열 받아오기
				cell = row.getCell(9);
				if (null != cell)
					empdto.setEmail(cell.getStringCellValue());
				// 행의 열한 번째 열 받아오기
				cell = row.getCell(10);
				if (null != cell)
					empdto.setHireDate(cell.getStringCellValue());
				// 행의 열두 번째 열 받아오기
				cell = row.getCell(11);
				if (null != cell)
					empdto.setLeaveDate(cell.getStringCellValue());

				list.add(empdto);
			}
		} catch (Exception e) {
			System.out.println("ExcelService uploadExcel 예외발생: " + e.getMessage());
			log.debug("ExcelService uploadExcel 예외발생: " + e.getMessage());
		}
		return list;
	}
	
	// Excel 파일 사원등록
	@Transactional
	public List<ExcelEmpDto> insertExcelEmp(ExcelEmpDto excelemp) throws Exception {
		ExcelDao exceldao = sqlsession.getMapper(ExcelDao.class);
		List<ExcelEmpDto> excelEmplist = new ArrayList<ExcelEmpDto>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		try {
			excelEmplist = exceldao.insertExcelEmp(excelemp);
			excelEmplist = exceldao.insertExcelSubEmp(excelemp);
			System.out.println("Service try excelEmplist: " + excelEmplist);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("ExcelService insertExcelEmp 예외발생: " + e.getMessage());
			log.debug("ExcelService insertExcelEmp 예외발생: " + e.getMessage());
			throw e;
		}
		System.out.println("excelEmpList: " + excelEmplist);
		return excelEmplist;
	}
}
