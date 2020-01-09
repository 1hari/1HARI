package kr.coo.onehari.login.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.login.dao.LoginDao;
import kr.coo.onehari.sign.dao.SignFormDao;
import kr.coo.onehari.sign.dto.SignFormDto;
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
	
	//로그인 성공 시 로그인 횟수 초기화
	public void loginCntInit(String str) {
		int result = 0;
		LoginDao dao = sqlsession.getMapper(LoginDao.class);
		try {
			System.out.println("초기화 함수 시작");
			int empNum= Integer.parseInt(str);
			System.out.println("받은 empNum: " + empNum);
			System.out.println("초기화 전:" + result);
			result = dao.loginCntInit(empNum);
			System.out.println("초기화 후:" + result);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("loginCntInit : " + e.getMessage());
		}
	}

	
}
