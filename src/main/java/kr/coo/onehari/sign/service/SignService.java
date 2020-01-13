package kr.coo.onehari.sign.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.sign.dao.SignDao;
import kr.coo.onehari.sign.dto.SignDto;
import lombok.extern.slf4j.Slf4j;

/*
작성자: 김정하
시작: 2020. 1. 12
완료: 
내용: 전자결재 기안 작업 시작
*/
//전자결재 service
@Slf4j
@Service
public class SignService {
	@Autowired
	private SqlSession sqlsession;
	
	//폼 등록하기 김정하 / 2020. 1. 8
	public int insertSign(SignDto sign) {
		int result = 0;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {
			result = dao.insertSign(sign);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertSign : " + e.getMessage());
		}
		return result;
	}
}
