package kr.coo.onehari.hr.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dao.CorpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Team;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class EmpService {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 사원목록 김진호 200108
	public List<EmpDto> empList() {
		List<EmpDto> emplist = null;
		
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			emplist = empdao.empList();
		} catch (Exception e) {
			log.debug("EmpService empList 예외발생: " + e.getMessage());
			System.out.println("EmpService emplist 예외발생: " + e.getMessage());
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

	//수정된 사원 정보 저장하는 함수 2020. 1. 10 양찬식 
	//시작 시간 : 오후 3시 20분 끝난시간 3시 25분 
	public void empUpdate(EmpDto emp) {
		
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			empdao.empUpdate(emp);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		/*return result;*/
	}
}
