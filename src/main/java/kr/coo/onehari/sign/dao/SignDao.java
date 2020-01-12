package kr.coo.onehari.sign.dao;

import java.sql.SQLException;

import kr.coo.onehari.sign.dto.SignDto;

/*
작성자: 김정하
시작: 2020. 1. 12
완료: 
내용: 전자결재 등록 작업 시작
*/
//전자결재 폼 DAO 
public interface SignDao {
	
	//전자결재 기안 김정하 / 2020. 1. 12
	public int insertSign(SignDto sign) throws ClassNotFoundException, SQLException;
	

}
