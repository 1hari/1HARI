package kr.coo.onehari.hr.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Team;
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
	
	//사원수정 2020. 1. 8 양찬식
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
	
	//DB에서 TEAMNAME 불러오는 함수 2020. 1. 9 양찬식 
	//시작 시간 : 오전 10시 10분 끝난시간 10시 15분 
	public Team teamCode() {
		Team team = null;

		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			team = empdao.teamCode();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return team;
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
