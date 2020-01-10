package kr.coo.onehari.hr.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 사원목록 김진호 2020. 1. 7
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
	
	// 사원등록 김진호 2020. 1. 9
	@Transactional
	public int empJoin(EmpDto empdto) {
		int result = 0;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		
		try {
//			empdto.setPassword(this.bCryptPasswordEncoder.encode(empdto.getPassword())); // 비밀번호 암호화
			empdto.setPassword("1004");
			empdao.empJoin(empdto);
			empdao.subempJoin(empdto);
			result = empdao.empJoin(empdto);
		} catch (Exception e) {
			System.out.println("EmpService empJoin 예외발생: " + e.getMessage());
			log.debug("EmpService empJoin 예외발생: " + e.getMessage());
		}
		System.out.println("empJoin result: " + result);
		return result;
	}
	
	//사원정보수정(화면) 2020. 1. 8 양찬식
	public EmpDto empModify(int empNum) {
		EmpDto emp = null;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		
		try {
			emp = empdao.empModify(empNum);
		} catch (Exception e) {
			System.out.println("EmpService empModify 예외발생: " + e.getMessage());
			log.debug("EmpService empModify 예외발생: " + e.getMessage());
		}
		return emp;
	}

	//사원정보수정(변경) 2020. 1. 10 양찬식 
	//시작 시간 : 오후 3시 20분 끝난시간 3시 25분
	@Transactional
	public void empUpdate(EmpDto emp) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		int result = 0; // 사원정보수정 확인을 위한 변수
		
		try {
			result = empdao.empUpdate(emp);
			if (result > 0) {
				System.out.println("사원정보수정 성공");
				empdao.subempUpdate(emp);
			} else {
				System.out.println("사원정보수정 실패");
			}
		} catch (Exception e) {
			System.out.println("EmpService empUpdate 예외발생: " + e.getMessage());
			log.debug("EmpService empUpdate 예외발생: " + e.getMessage());
		}
		/*return result;*/
	}
	
	//사원조회(팀코드,사번,이름,직급)리스트 김정하 2020. 1. 9
	public List<EmpDto> empDefaultList(){
		List<EmpDto> empDefaultList = null;
		
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			empDefaultList = empdao.empDefaultList();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("EmpService empDefaultList 예외발생: " + e.getMessage());
		}
		return empDefaultList;
	}
	
	//사원조회(팀코드,사번,이름,직급) 김정하 2020. 1. 10
	public EmpDto empDefault(String empNum) {
		EmpDto empDefault = null;
		
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		try {
			empDefault = empdao.empDefault(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("EmpService empDefault 예외발생: " + e.getMessage());
		}
		return empDefault;
	}
}
