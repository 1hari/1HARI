package kr.coo.onehari.hr.dao;

import java.sql.SQLException;
import java.util.List;

/*
작성자: 김진호
시작: 2020. 1. 8
완료: 
*/
public interface CorpDao {

	// 소속목록 김진호 200108
	public List<String> getTeamCodes() throws ClassNotFoundException, SQLException;
	
	// 직책목록 김진호 200108
	public List<String> getPositionCodes() throws ClassNotFoundException, SQLException;
	
	// 직급목록 김진호 200108
	public List<String> getRankCodes() throws ClassNotFoundException, SQLException;
	
	// 재직구분 김진호 200108
	public List<String> getEmploymentCodes() throws ClassNotFoundException, SQLException;
}