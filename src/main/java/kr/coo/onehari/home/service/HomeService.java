package kr.coo.onehari.home.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.home.dao.HomeDao;
import kr.coo.onehari.hr.dto.EmpDto;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class HomeService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//형남 0110 비밀번호 변경 시 이메일과 사번 일치여부 확인
	public boolean empNumEmail(EmpDto emp) {
		HomeDao dao = sqlsession.getMapper(HomeDao.class);
		int result = 0;
		try {
			result=dao.empNumEmail(emp.getEmpNum(), emp.getEmail());
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("empNumEmailService : " + e.getMessage());
		}
		return result > 0 ? true : false;
	}
}

