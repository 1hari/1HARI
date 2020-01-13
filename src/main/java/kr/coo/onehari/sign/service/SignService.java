package kr.coo.onehari.sign.service;

import java.sql.SQLException;
import java.util.List;

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
	
	//문서기안 김정하 / 2020. 1. 8
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
	
	//전자결재 기안 리스트 (전자결재 홈) 김정하 / 2020. 1. 13
	public List<SignDto> selectSignDraftListHome(String draftEmp){
		List<SignDto> signDraftList = null;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {
			signDraftList = dao.selectSignDraftListHome(draftEmp);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("selectSignDraftListHome : " + e.getMessage());
		}
		return signDraftList;
	}
	
	//전자결재 완료 리스트 (전자결재 홈) 김정하 / 2020. 1. 13
	public List<SignDto> selectSignCompleteListHome(String draftEmp){
		List<SignDto> signCompletetList = null;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {
			signCompletetList = dao.selectSignCompleteListHome(draftEmp);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("selectSignCompleteListHome : " + e.getMessage());
		}
		return signCompletetList;
	}
	
	public List<SignDto> selectSignReturnListHome (String draftEmp){
		List<SignDto> signReturnList = null;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {
			signReturnList = dao.selectSignReturnListHome(draftEmp);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("selectSignCompleteListHome : " + e.getMessage());
		}
		return signReturnList;
	}
}
