package kr.coo.onehari.login.dao;

import java.sql.SQLException;

public interface LoginDao {
	//형남 0109 1125~
	//로그인 시도횟수 초기화
	public int loginCntInit(int empNum) throws ClassNotFoundException, SQLException;
}