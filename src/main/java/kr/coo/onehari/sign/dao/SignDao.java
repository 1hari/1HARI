package kr.coo.onehari.sign.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.coo.onehari.sign.dto.SignDto;

/*
작성자: 김정하
시작: 2020. 1. 12
완료: 
내용: 전자결재 등록 작업 시작
*/
//전자결재 DAO 
public interface SignDao {
	
	//전자결재 기안 김정하 / 2020. 1. 12
	public int insertSign(SignDto sign) throws ClassNotFoundException, SQLException;
	
	//전자결재 리스트 (다이나믹쿼리) 김정하 / 2020. 1. 14
	public List<SignDto> selectSignList (Map<String, String> map) throws ClassNotFoundException, SQLException;
	
	//내 문서함 페이징 (다이나믹쿼리) 김정하 / 2020. 1. 15
	public int signPage (Map<String, String> map) throws ClassNotFoundException, SQLException;
	
	//결재하기 김정하 / 2020. 1. 16~
	public int signApproval (Map<String, String> map) throws ClassNotFoundException, SQLException;
	
	//관리자 전체 문서함 페이징 (다이나믹쿼리) 김정하 / 2020. 1. 22
	public int signAdminPage (Map<String, String> map) throws ClassNotFoundException, SQLException;
	
	//관레자 전체 문서함 리스트 (다이나믹쿼리) 김정하 / 2020. 1. 22
	public List<SignDto> selectSignAdminList (Map<String, String> map) throws ClassNotFoundException, SQLException;
}
