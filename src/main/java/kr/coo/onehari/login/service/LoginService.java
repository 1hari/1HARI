package kr.coo.onehari.login.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.login.dao.LoginDao;
import lombok.extern.slf4j.Slf4j;

/*
작성자: 오형남
시작: 2020. 1. 9
완료: 
내용: 시큐리티 로그인관련 전후 처리
*/
//전자결재 폼 service
@Slf4j
@Service
public class LoginService {

	@Autowired
	private SqlSession sqlsession;

	// 로그인 성공 시 로그인 횟수 초기화
	public int loginCntInit(String str) {
		int result = 0;

		LoginDao dao = sqlsession.getMapper(LoginDao.class);
		try {
			int empNum = Integer.parseInt(str);
			result = dao.loginCntInit(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("loginCntInit : " + e.getMessage());
		}
		return result;
	}

	// 로그인 실패, 로그인 시도횟수 증가
	public void countFailure(String str) {
		LoginDao dao = sqlsession.getMapper(LoginDao.class);
		int result = 0;
		int empNum = Integer.parseInt(str);
		try {
			result = dao.updateFailureCount(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("countFailure : " + e.getMessage());
		}
	}

	// 현재 로그인 시도 횟수
	public int checkFailureCount(String str) {
		Integer result = 0;
		int empNum = Integer.parseInt(str);
		LoginDao dao = sqlsession.getMapper(LoginDao.class);
		try {
			result = dao.checkFailureCount(empNum);
			if (result == null) {
				result = 0;
			}
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("loginCntInit : " + e.getMessage());
		}
		return result;
	}

	// 로그인 잠금처리
	public void disabledUsername(String str) {
		int empNum = Integer.parseInt(str);
		LoginDao dao = sqlsession.getMapper(LoginDao.class);
		try {
			dao.disabledUsername(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("loginCntInit : " + e.getMessage());
		}
	}

}
