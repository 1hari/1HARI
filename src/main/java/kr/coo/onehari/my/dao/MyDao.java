package kr.coo.onehari.my.dao;

import java.sql.SQLException;

import kr.coo.onehari.hr.dto.EmpDto;

/*
작성자: 오형남
시작: 2020. 1. 10
완료: 
내용: 사원(개인) 관련 기능
*/
public interface MyDao {
	//형남 0110 비밀번호 변경 시 사번, 이메일 조회
	public int empNumEmail(int empNum, String email) throws ClassNotFoundException, SQLException;
	//형남 0110 유저 잠금처리
	public int updatePassword(int empNum, String password) throws ClassNotFoundException, SQLException;

	// 김진호 2020. 1. 20 개인정보 프로필 정보수정
	public int myinfoUpdate(EmpDto empdto) throws ClassNotFoundException, SQLException;
}