package kr.coo.onehari.sign.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
}
