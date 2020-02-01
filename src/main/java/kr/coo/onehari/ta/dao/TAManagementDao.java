package kr.coo.onehari.ta.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.coo.onehari.hr.dto.AnnUse;
import kr.coo.onehari.hr.dto.EmpAnn;
import kr.coo.onehari.hr.dto.EmpDto;

/*
작성자: 오형남
시작: 2020. 2. 2 
완료: 
내용: 근태관련 작업
*/
public interface TAManagementDao {
	// 관리자 근태목록 김진호 2020. 1. 27
	public List<EmpDto> getTaList(String setDate) throws ClassNotFoundException, SQLException;

	// 연차정보 김진호 2020. 1. 29
	public int setEmpTa(Map<String, String> map) throws ClassNotFoundException, SQLException;
}