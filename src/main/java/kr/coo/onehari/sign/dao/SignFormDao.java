package kr.coo.onehari.sign.dao;

import java.sql.SQLException;
import java.util.List;

import kr.coo.onehari.sign.dto.SignFormDto;

/*
작성자: 김정하
시작: 2020. 1. 8
완료: 
내용: 폼 등록 작업 시작
*/
//전자결재 폼 DAO 
public interface SignFormDao {
	
	//폼 등록 김정하 / 2020. 1. 8
	public int insertForm(SignFormDto form) throws ClassNotFoundException, SQLException;
	
    //폼 리스트 가져오기 김정하 / 2020. 1. 8
    public List<SignFormDto> selectAllForm() throws ClassNotFoundException, SQLException;
	
	//폼 가져오기 김정하 / 2020. 1. 8
    public SignFormDto selectForm(String signFormCode) throws ClassNotFoundException, SQLException;
	
}
