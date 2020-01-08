package kr.coo.onehari.hr.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class EmpService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<EmpDto> empList() {
		List<EmpDto> emplist = null;
		
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			emplist = empdao.empList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return emplist;
	}
	
	
	public EmpDto empModify(int empNum) {
		EmpDto emp = null;
		
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			emp = empdao.empModify(empNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return emp;
	}
	
	
//	public int test() {
//		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
//		int result = 0;
//		try {
//			result = empdao.aa();
//			log.info("test 실행");
//		} catch (ClassNotFoundException | SQLException e) {
//			
//		}
//		return result;
//	}
}
