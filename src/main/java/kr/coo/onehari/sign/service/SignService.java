package kr.coo.onehari.sign.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.AnnUse;
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
	
	//전자결재 리스트 (다이나믹쿼리) 김정하 / 2020. 1. 14
	public List<SignDto> selectSignList (Map<String, String> map){
		List<SignDto> selectSignList = null;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {		
			selectSignList = dao.selectSignList(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("selectSign : " + e.getMessage());
		}
		return selectSignList;
	}
	
	//내문서함 페이징 김정하 / 2020. 1. 15
	public int signPage(Map<String, String> map) {
		int count = 0;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {
			count = dao.signPage(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("signPage : " + e.getMessage());
		}
		return count;
	}
	
	//결재하기 김정하 / 2020. 1. 16
	public int signApproval(Map<String, String> map) {
		int count = 0;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		
		try {
			count = dao.signApproval(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("signApproval : " + e.getMessage());
		}
		return count;
	}
	
	//관리자 전자결재 리스트 (다이나믹쿼리) 김정하 / 2020. 1. 22
	public List<SignDto> selectSignAdminList (Map<String, String> map){
		List<SignDto> selectSignList = null;
		SignDao dao = sqlsession.getMapper(SignDao.class);
			
		try {		
			selectSignList = dao.selectSignAdminList(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("selectSign : " + e.getMessage());
		}
		return selectSignList;
	}
		
	//내문서함 페이징 김정하 / 2020. 1. 15
	public int signAdminPage(Map<String, String> map) {
		int count = 0;
		SignDao dao = sqlsession.getMapper(SignDao.class);
			
		try {
			count = dao.signAdminPage(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("signPage : " + e.getMessage());
		}
		return count;
	}
	
	//연차기안 김정하 / 2020. 1. 27
	@Transactional
	public int insertAnn(SignDto sign, AnnUse annUse) throws Exception {
		int result = 0;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		
		try {
			dao.insertSign(sign);
			result = empdao.insertAnnUse(annUse);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("AnnInsert : " + e.getMessage());
			throw e;
		}
		return result;
	}
	
	//연차결재하기 김정하 / 2020. 1. 16
	@Transactional
	public int annSignApproval(Map<String, String> map) throws Exception {
		int count = 0;
		SignDao dao = sqlsession.getMapper(SignDao.class);
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		
		try {
			count = dao.signApproval(map);
			count = empdao.updateAnnUse(map.get("signNum"));
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("signApproval : " + e.getMessage());
			throw e;
		}
		return count;
	}
}
