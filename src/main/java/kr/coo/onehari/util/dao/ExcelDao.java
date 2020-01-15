package kr.coo.onehari.util.dao;

import java.sql.SQLException;
import java.util.List;

import kr.coo.onehari.hr.dto.EmpDto;

/*
 * 작성자: 김진호
 * 시작: 2020. 1. 15
 * 내용: Excel Upload/Download
 */
public interface ExcelDao {

	// Upload Excel 파일 내용을 DB에 넣기
	public List<EmpDto> insertExcelEmp(EmpDto empdto) throws ClassNotFoundException, SQLException;

	// Upload Excel 파일 내용을 DB에 넣기
	public List<EmpDto> insertExcelSubEmp(EmpDto empdto) throws ClassNotFoundException, SQLException;
}
