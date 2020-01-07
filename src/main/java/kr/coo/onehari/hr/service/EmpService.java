package kr.coo.onehari.hr.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.EmpDao;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class EmpService {
	@Autowired
	private SqlSession sqlsession;
	
	public int test() {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		try {
			result = empdao.aa();
			log.info("test 실행");
		} catch (ClassNotFoundException | SQLException e) {
			
		}
		return result;
	}
}
