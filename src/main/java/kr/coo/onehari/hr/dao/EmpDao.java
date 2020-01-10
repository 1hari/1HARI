package kr.coo.onehari.hr.dao;

import java.sql.SQLException;
import java.util.List;

import kr.coo.onehari.hr.dto.EmpDto;

/*
작성자: 김진호
시작: 2020. 1. 7
완료: 
내용: 사원등록 empJoin 작업 시작
*/
public interface EmpDao {

	// 사원목록 김진호 / 2020. 1. 7
	public List<EmpDto> empList() throws ClassNotFoundException, SQLException;
	
	// 사원등록 김진호 / 2020. 1. 7
	public int empJoin(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원등록 김진호 / 2020. 1. 10
	public int subempJoin(EmpDto empdto) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정화면(관리자 권한) 양찬식 / 2020. 1. 8
	public EmpDto empModify(int empNum) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(관리자권한) 양찬식 / 2020. 1. 9
	public int empUpdate(EmpDto emp) throws ClassNotFoundException, SQLException;
	
	// 사원정보수정 변경(관리자권한) 김진호 / 2020. 1. 10
	public int subempUpdate(EmpDto emp) throws ClassNotFoundException, SQLException;
	
	//사원목록(주 table) 김정하 / 2020. 1. 9
	public List<EmpDto> empDefaultList() throws ClassNotFoundException, SQLException;
	
	//사원정보(기안자) 김정하 / 2020. 1. 10
	public EmpDto empDefault(String empNum) throws ClassNotFoundException, SQLException;
}