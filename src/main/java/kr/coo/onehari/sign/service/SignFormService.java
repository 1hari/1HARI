package kr.coo.onehari.sign.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.sign.dao.SignFormDao;
import kr.coo.onehari.sign.dto.SignFormDto;
import lombok.extern.slf4j.Slf4j;

/*
작성자: 김정하
시작: 2020. 1. 8
완료: 
내용: 폼 등록 작업 시작
*/
//전자결재 폼 service
@Slf4j
@Service
public class SignFormService {
	@Autowired
	private SqlSession sqlsession;
	
	//폼 등록하기 김정하 / 2020. 1. 8
	public int insertForm(SignFormDto form) {
		int result = 0;
		SignFormDao dao = sqlsession.getMapper(SignFormDao.class);
		try {
			result = dao.insertForm(form);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertForm : " + e.getMessage());
		}
		return result;
	}
	
    //폼 리스트 가져오기 김정하 / 2020. 1. 8~
    public List<SignFormDto> selectAllForm(){
        List<SignFormDto> list = null;
        SignFormDao dao = sqlsession.getMapper(SignFormDao.class);
        try {
            list = dao.selectAllForm();
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("selectAllForm : " + e.getMessage());
        }
        return list;
    }
	
	//폼 가져오기 김정하 / 2020. 1. 8
	public SignFormDto selectForm(int signFormCode) {
		SignFormDto form = null;
		SignFormDao dao = sqlsession.getMapper(SignFormDao.class);
		try {
			form = dao.selectForm(signFormCode);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("selectForm : " + e.getMessage());
		}
		return form;
	}
	
}
