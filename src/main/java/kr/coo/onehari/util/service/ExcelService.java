package kr.coo.onehari.util.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.EmpDto;
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
	 * @param exceldto 
	 * 
	 * @param names
	 * @param prices
	 * @param quantities
	 * @return 엑셀파일 리스트
	 */
	public List<EmpDto> excelEmpList() {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		List<EmpDto> emplist = null;
		
		try {
			emplist = empdao.empList();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("ExcelService excelEmpList 예외발생: " + e.getMessage());
		}
		return emplist;
	}

	/**
	 * 사원목록을 간단한 엑셀 워크북 객체로 생성
	 * 
	 * @param list
	 * @return 생성된 워크북
	 */
	public SXSSFWorkbook makeSimpleEmpExcelWorkbook(List<EmpDto> list) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("사원목록");
		
		// 셀 스타일 설정
		CellStyle centerStyle = workbook.createCellStyle();
		centerStyle.setAlignment(HorizontalAlignment.CENTER);
		centerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		CellStyle indentStyle = workbook.createCellStyle();
		indentStyle.setIndention((short) 1);
		indentStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		// 입력 설명
//		// 행 추적을 위한 변수
//		int rowLocation = 0;
		
		Row mergeRow = null;
		Cell mergeCell = null;
		
		// 병합 행
		mergeRow = sheet.createRow(0);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("사번 입력금지");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 11));
		
		mergeRow = sheet.createRow(1);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("모든 셀 서식은 텍스트 형식으로 설정하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 11));
		
		mergeRow = sheet.createRow(2);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("소속코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 2001 : 총무팀 ],  [ 2002 : 인사팀 ], [ 2003 : 영업팀 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 2, 11));
		
		mergeRow = sheet.createRow(3);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("직급코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(3, 3, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 3001 : 대표 ],  [ 3002 : 이사 ], [ 3003 : 부장 ], [ 3004 : 과장 ], [ 3005 : 대리 ], [ 3006 : 사원 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(3, 3, 2, 11));
		
		mergeRow = sheet.createRow(4);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("직책코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 4001 : CEO ],  [ 4002 : 팀장 ], [ 4003 : 파트장 ], [ 4004 : 팀원 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(4, 4, 2, 11));
		
		mergeRow = sheet.createRow(5);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("재직구분코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 5001 : 재직 ],  [ 5002 : 휴직 ], [ 5003 : 퇴직 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(5, 5, 2, 11));
		
		mergeRow = sheet.createRow(6);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("생년월일 형식은 6자리로 입력하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(6, 6, 0, 11));
		
		mergeRow = sheet.createRow(7);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("핸드폰번호는 (-)를 포함하여 입력하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(7, 7, 0, 11));
		
		mergeRow = sheet.createRow(8);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("이메일은 Gmail 아이디만 입력하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(8, 8, 0, 11));
		
		mergeRow = sheet.createRow(9);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("입사일 / 퇴사일은 'yyyy-mm-dd' 형식으로 입력하세요. (주의) 셀 서식은 텍스트");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(9, 9, 0, 11));
		
		// 헤더 행 생
		Row headerRow = sheet.createRow(10);
		// 해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("사번");
		sheet.setColumnWidth(0, 2400);
		// 해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("사원이름");
		sheet.setColumnWidth(1, 2800);
		// 해당 행의 세번째 열 셀 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("소속");
		sheet.setColumnWidth(2, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("직급");
		sheet.setColumnWidth(3, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("직책");
		sheet.setColumnWidth(4, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("재직구분");
		sheet.setColumnWidth(5, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("생년월일");
		sheet.setColumnWidth(6, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("주민등록번호");
		sheet.setColumnWidth(7, 3600);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("핸드폰번호");
		sheet.setColumnWidth(8, 4000);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("이메일");
		sheet.setColumnWidth(9, 4000);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("입사일");
		sheet.setColumnWidth(10, 3200);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("퇴사일");
		sheet.setColumnWidth(11, 3200);
		
		for (int i = 0; i < headerRow.getLastCellNum(); i++) {
			headerRow.getCell(i).setCellStyle(centerStyle);
		}
		
		// 입력예제 생성
		Row exampleRow = null;
		Cell exampleCell = null;
		
		// 행 생성
		exampleRow = sheet.createRow(11);
		
		// 입력예제 내용 생성 및 입력
		exampleCell = exampleRow.createCell(0);
		exampleCell.setCellValue("입력예제");
		exampleCell = exampleRow.createCell(1);
		exampleCell.setCellValue("홍길동");
		exampleCell = exampleRow.createCell(2);
		exampleCell.setCellValue("2001");
		exampleCell = exampleRow.createCell(3);
		exampleCell.setCellValue("3001");
		exampleCell = exampleRow.createCell(4);
		exampleCell.setCellValue("4001");
		exampleCell = exampleRow.createCell(5);
		exampleCell.setCellValue("5001");
		exampleCell = exampleRow.createCell(6);
		exampleCell.setCellValue("900101");
		exampleCell = exampleRow.createCell(7);
		exampleCell.setCellValue("1231231");
		exampleCell = exampleRow.createCell(8);
		exampleCell.setCellValue("010-1234-1234");
		exampleCell = exampleRow.createCell(9);
		exampleCell.setCellValue("hong");
		exampleCell = exampleRow.createCell(10);
		exampleCell.setCellValue("2020-01-01");
		exampleCell = exampleRow.createCell(11);
		exampleCell.setCellValue("2020-01-10");
		
		for (int i = 0; i < exampleRow.getLastCellNum(); i++) {
			exampleRow.getCell(i).setCellStyle(centerStyle);
		}

		// 내용 행 및 셀 생성
		Row bodyRow = null;
		Cell bodyCell = null;
		
		for (int i = 0; i < list.size(); i++) {
			EmpDto empdto = list.get(i);

			// 행 생성
			bodyRow = sheet.createRow(i + 12);
			
			// 사번 입력
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(empdto.getEmpNum());
			// 사원이름 입력
			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(empdto.getEmpName());
			// 소속 입력
			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(empdto.getTeamCode());
			// 직급
			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(empdto.getRankCode());
			// 직책
			bodyCell = bodyRow.createCell(4);
			bodyCell.setCellValue(empdto.getPositionCode());
			// 재직구분
			bodyCell = bodyRow.createCell(5);
			bodyCell.setCellValue(empdto.getEmploymentCode());
			// 생년월일
			bodyCell = bodyRow.createCell(6);
			bodyCell.setCellValue(empdto.getBirth());
			// 주민등록번호
			bodyCell = bodyRow.createCell(7);
			bodyCell.setCellValue(empdto.getResNum());
			// 핸드폰번호
			bodyCell = bodyRow.createCell(8);
			bodyCell.setCellValue(empdto.getPhoneNum());
			// 이메일
			bodyCell = bodyRow.createCell(9);
			bodyCell.setCellValue(empdto.getEmail());
			// 입사일
			bodyCell = bodyRow.createCell(10);
			bodyCell.setCellValue(empdto.getHireDate());
			// 퇴사일
			bodyCell = bodyRow.createCell(11);
			bodyCell.setCellValue(empdto.getLeaveDate());
			
			for (int j = 0; j < bodyRow.getLastCellNum(); j++) {
				bodyRow.getCell(j).setCellStyle(centerStyle);
			}
		}
		return workbook;
	}

	/**
	 * 사원목록 입력을 위한 양식 엑셀 워크북 객체로 생성
	 * 
	 * @return 생성된 워크북
	 */
	public SXSSFWorkbook makeSimpleEmpExcelFormWorkbook() {
		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("사원목록");
		
		// 셀 스타일 설정
		CellStyle centerStyle = workbook.createCellStyle();
		centerStyle.setAlignment(HorizontalAlignment.CENTER);
		centerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		CellStyle indentStyle = workbook.createCellStyle();
		indentStyle.setIndention((short) 1);
		indentStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		// 입력 설명
//		// 행 추적을 위한 변수
//		int rowLocation = 0;
		
		Row mergeRow = null;
		Cell mergeCell = null;
		
		// 병합 행
		mergeRow = sheet.createRow(0);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("사번 입력금지");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 11));
		
		mergeRow = sheet.createRow(1);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("모든 셀 서식은 텍스트 형식으로 설정하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 11));
		
		mergeRow = sheet.createRow(2);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("소속코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 2001 : 총무팀 ],  [ 2002 : 인사팀 ], [ 2003 : 영업팀 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(2, 2, 2, 11));
		
		mergeRow = sheet.createRow(3);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("직급코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(3, 3, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 3001 : 대표 ],  [ 3002 : 이사 ], [ 3003 : 부장 ], [ 3004 : 과장 ], [ 3005 : 대리 ], [ 3006 : 사원 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(3, 3, 2, 11));
		
		mergeRow = sheet.createRow(4);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("직책코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(4, 4, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 4001 : CEO ],  [ 4002 : 팀장 ], [ 4003 : 파트장 ], [ 4004 : 팀원 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(4, 4, 2, 11));
		
		mergeRow = sheet.createRow(5);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("재직구분코드");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(5, 5, 0, 1));
		mergeCell = mergeRow.createCell(2);
		mergeCell.setCellValue("[ 5001 : 재직 ],  [ 5002 : 휴직 ], [ 5003 : 퇴직 ]");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(5, 5, 2, 11));
		
		mergeRow = sheet.createRow(6);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("생년월일 형식은 6자리로 입력하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(6, 6, 0, 11));
		
		mergeRow = sheet.createRow(7);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("핸드폰번호는 (-)를 포함하여 입력하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(7, 7, 0, 11));
		
		mergeRow = sheet.createRow(8);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("이메일은 Gmail 아이디만 입력하세요.");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(8, 8, 0, 11));
		
		mergeRow = sheet.createRow(9);
		mergeCell = mergeRow.createCell(0);
		mergeCell.setCellValue("입사일 / 퇴사일은 'yyyy-mm-dd' 형식으로 입력하세요. (주의) 셀 서식은 텍스트");
		mergeCell.setCellStyle(indentStyle);
		sheet.addMergedRegion(new CellRangeAddress(9, 9, 0, 11));
		
		// 헤더 행 생
		Row headerRow = sheet.createRow(10);
		// 해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("사번");
		sheet.setColumnWidth(0, 2400);
		// 해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("사원이름");
		sheet.setColumnWidth(1, 2800);
		// 해당 행의 세번째 열 셀 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("소속");
		sheet.setColumnWidth(2, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("직급");
		sheet.setColumnWidth(3, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("직책");
		sheet.setColumnWidth(4, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("재직구분");
		sheet.setColumnWidth(5, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("생년월일");
		sheet.setColumnWidth(6, 2400);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("주민등록번호");
		sheet.setColumnWidth(7, 3600);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("핸드폰번호");
		sheet.setColumnWidth(8, 4000);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("이메일");
		sheet.setColumnWidth(9, 4000);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("입사일");
		sheet.setColumnWidth(10, 3200);
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("퇴사일");
		sheet.setColumnWidth(11, 3200);
		
		for (int i = 0; i < headerRow.getLastCellNum(); i++) {
			headerRow.getCell(i).setCellStyle(centerStyle);
		}
		
		// 입력예제 생성
		Row exampleRow = null;
		Cell exampleCell = null;
		
		// 행 생성
		exampleRow = sheet.createRow(11);
		
		// 입력예제 내용 생성 및 입력
		exampleCell = exampleRow.createCell(0);
		exampleCell.setCellValue("입력예제");
		exampleCell = exampleRow.createCell(1);
		exampleCell.setCellValue("홍길동");
		exampleCell = exampleRow.createCell(2);
		exampleCell.setCellValue("2001");
		exampleCell = exampleRow.createCell(3);
		exampleCell.setCellValue("3001");
		exampleCell = exampleRow.createCell(4);
		exampleCell.setCellValue("4001");
		exampleCell = exampleRow.createCell(5);
		exampleCell.setCellValue("5001");
		exampleCell = exampleRow.createCell(6);
		exampleCell.setCellValue("900101");
		exampleCell = exampleRow.createCell(7);
		exampleCell.setCellValue("1231231");
		exampleCell = exampleRow.createCell(8);
		exampleCell.setCellValue("010-1234-1234");
		exampleCell = exampleRow.createCell(9);
		exampleCell.setCellValue("hong");
		exampleCell = exampleRow.createCell(10);
		exampleCell.setCellValue("2020-01-01");
		exampleCell = exampleRow.createCell(11);
		exampleCell.setCellValue("2020-01-10");
		
		for (int i = 0; i < exampleRow.getLastCellNum(); i++) {
			exampleRow.getCell(i).setCellStyle(centerStyle);
		}
		return workbook;
	}
	
	/**
	 * 생성한 엑셀 워크북을 컨트롤러에서 다운로드 하게 해줄 메서드(사원목록)
	 * 
	 * @param list
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess(List<EmpDto> list) {
		return this.makeSimpleEmpExcelWorkbook(list);
	}
	
	/**
	 * 생성한 엑셀 워크북을 컨트롤러에서 다운로드 하게 해줄 메서드(양식)
	 * 
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess() {
		return this.makeSimpleEmpExcelFormWorkbook();
	}

	/**
	 * 업로드한 엑셀파일을 사원목록으로 만들기
	 * 
	 * @param excelFile
	 * @return 생성한 사원목록
	 */
	public List<EmpDto> uploadExcelFile(MultipartFile excelFile) {
		List<EmpDto> list = new ArrayList<EmpDto>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			@SuppressWarnings("resource")
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			for (int i = 12; i < sheet.getLastRowNum() + 1; i++) {
				// 입력 예제 다음 행부터 데이터를 받아오기 위해 i = 12
				EmpDto empdto = new EmpDto();
				XSSFRow row = sheet.getRow(i);

				// 행이 존재하기 않으면 패스
//				if (null == row) { // 값을 제대로 받아오지 못해서 주석처리
//					continue;
//				}
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
			log.debug("ExcelService uploadExcel 예외발생: " + e.getMessage());
		}
		return list;
	}
	
	// Excel 파일 사원등록
//	@Transactional
//	public int insertExcelEmp(HashMap<String, List<EmpDto>> map) throws Exception {
//		ExcelDao exceldao = sqlsession.getMapper(ExcelDao.class);
//				
//		int result = 0;
//		try {
//			result = exceldao.insertExcelEmp(map);
//			result = exceldao.insertExcelSubEmp(map);
//		} catch (ClassNotFoundException | SQLException e) {
//			System.out.println("ExcelService insertExcelEmp 예외발생: " + e.getMessage());
//			log.debug("ExcelService insertExcelEmp 예외발생: " + e.getMessage());
//			throw e;
//		}
//		return result;
//	}
}
