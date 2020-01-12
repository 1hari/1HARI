package kr.coo.onehari.hr.dao;

import java.sql.SQLException;
import java.util.List;

import kr.coo.onehari.hr.dto.Employment;
import kr.coo.onehari.hr.dto.Position;
import kr.coo.onehari.hr.dto.Rank;
import kr.coo.onehari.hr.dto.Role;
import kr.coo.onehari.hr.dto.Team;

/*
작성자: 김진호
시작: 2020. 1. 8
완료: 
*/
public interface CorpDao {

	// 소속목록 김진호 2020. 1. 8
	public List<Team> getTeamCodes() throws ClassNotFoundException, SQLException;
	
	// 직책목록 김진호 2020. 1. 8
	public List<Position> getPositionCodes() throws ClassNotFoundException, SQLException;
	
	// 직급목록 김진호 2020. 1. 8
	public List<Rank> getRankCodes() throws ClassNotFoundException, SQLException;
	
	// 재직구분 김진호 2020. 1. 8
	public List<Employment> getEmploymentCodes() throws ClassNotFoundException, SQLException;
	
	// 권한 김진호 2020. 1. 12
	public List<Role> getRoles() throws ClassNotFoundException, SQLException;
}