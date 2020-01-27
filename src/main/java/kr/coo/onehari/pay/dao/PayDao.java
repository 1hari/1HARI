package kr.coo.onehari.pay.dao;

import java.security.Principal;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.PayDto;

/*
작성자: 김진호
시작: 2020. 1. 7
완료: 
내용: 사원등록 empJoin 작업 시작
*/
public interface PayDao {

	
	//올해 전체 급여리스트
	public List<String> getYears(String empNumStr) throws ClassNotFoundException, SQLException;

	//올해 전체 급여리스트
	public List<PayDto> getPayList(String empNumStr, String year, String month) throws ClassNotFoundException, SQLException;
	
}