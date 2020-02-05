package kr.coo.onehari.home.dao;

import java.sql.SQLException;

/*
작성자: 오형남
시작: 2020. 2. 2
완료: 2020. 2. 2
내용: index 페이지에서 사용할 기능
*/
public interface HomeDao {

	//형남 0110 비밀번호 변경 시 사번, 이메일 조회
	public int empNumEmail(String empNum, String email) throws ClassNotFoundException, SQLException;
}