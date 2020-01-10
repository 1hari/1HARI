package kr.coo.onehari.login.dao;

import java.sql.SQLException;

public interface LoginDao {
	//형남 0109 1125~1400
	//로그인 시도횟수 초기화
	public int loginCntInit(int empNum) throws ClassNotFoundException, SQLException;
	
	//로그인 시도 횟수 증가
	public int updateFailureCount(int username) throws ClassNotFoundException, SQLException;
	//로그인 실패 횟수 가져오기
	public int checkFailureCount(int username) throws ClassNotFoundException, SQLException;
	//유저 잠금처리
	public int disabledUsername(int username) throws ClassNotFoundException, SQLException;


}