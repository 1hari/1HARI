package kr.coo.onehari.hr.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.AnnUse;
import kr.coo.onehari.hr.dto.EmpAnn;
import kr.coo.onehari.hr.dto.EmpDto;
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
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);

		try {
			emplist = empdao.empList();
		} catch (Exception e) {
			log.debug("EmpService empList 예외발생: " + e.getMessage());
		}
		return emplist;
	}

	// 사원등록 김진호 2020. 1. 9
	@Transactional
	public int empJoin(EmpDto empdto) throws Exception {
		int result = 0;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);

		try {
			empdto.setPassword(bCryptPasswordEncoder.encode(empdto.getBirth())); // 비밀번호 암호화
			result = empdao.empJoin(empdto);
			result = empdao.subempJoin(empdto);
		} catch (Exception e) {
			log.debug("EmpService empJoin 예외발생: " + e.getMessage());
			throw e;
		}
		return result;
	}

	// 사원정보수정(화면) 2020. 1. 8 양찬식
	public EmpDto empModify(int empNum) {
		EmpDto emp = null;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);

		try {
			emp = empdao.empModify(empNum);
		} catch (Exception e) {
			log.debug("EmpService empModify 예외발생: " + e.getMessage());
		}
		return emp;
	}

	// 사원정보수정(변경) 2020. 1. 10 양찬식
	// 시작 시간 : 오후 3시 20분 끝난시간 3시 25분
	@Transactional
	public int empUpdate(EmpDto empdto, boolean isAdmin) throws Exception {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		int result = 0;

		try {
			if (isAdmin) {
				if (empdto.getRoleName().equals("ROLE_USER")) {
					result = empdao.empUpdate(empdto);
					result = empdao.subempUpdate(empdto);
					result = empdao.deleteRolePersonnel(empdto);
					result = empdao.deleteRoleAdmin(empdto);
				} else if (empdto.getRoleName().equals("ROLE_PERSONNEL")) {
					result = empdao.empUpdate(empdto);
					result = empdao.subempUpdate(empdto);
					result = empdao.insertRoleaPersonnel(empdto);
					result = empdao.deleteRoleAdmin(empdto);
				} else if (empdto.getRoleName().equals("ROLE_ADMIN")) {
					result = empdao.empUpdate(empdto);
					result = empdao.subempUpdate(empdto);
					result = empdao.insertRoleaPersonnel(empdto);
					result = empdao.insertRoleaAdmin(empdto);
				}
			} else {
				result = empdao.empUpdate(empdto);
				result = empdao.subempUpdate(empdto);
			}
		} catch (Exception e) {
			log.debug("EmpService empUpdate 예외발생: " + e.getMessage());
			throw e;
		}
		return result;
	}

	// 사원조회(팀코드,사번,이름,직급)리스트 김정하 2020. 1. 9
	public List<EmpDto> empDefaultList() {
		List<EmpDto> empDefaultList = null;

		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			empDefaultList = empdao.empDefaultList();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("EmpService empDefaultList 예외발생: " + e.getMessage());
		}
		return empDefaultList;
	}

	// 사원조회(팀코드,사번,이름,직급) 김정하 2020. 1. 10
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

	// 사원연차정보 가져오기 김정하 2020. 1. 28
	public EmpAnn getEmpAnn(String empNum) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		EmpAnn empAnn = null;
		try {
			empAnn = empdao.getEmpAnn(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getEmpAnn 예외발생: " + e.getMessage());
		}
		return empAnn;
	}

	// 사원 연차사용목록 가져오기 김정하 2020. 1. 28
	public List<AnnUse> getAnnUseList(String empNum) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		List<AnnUse> annUseList = null;
		try {
			annUseList = empdao.getAnnUseList(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAnnUseList 예외발생: " + e.getMessage());
		}
		return annUseList;
	}

	// 사원 연차1건 가져오기 김정하 2020. 1. 30
	public AnnUse getAnnUse(String signNum) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		AnnUse annUse = null;
		try {
			annUse = empdao.getAnnUse(signNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAnnUseList 예외발생: " + e.getMessage());
		}
		return annUse;
	}

	// 사원목록 Page 김정하 2020. 1. 29
	public List<EmpDto> empListPage(Map<String, String> map) {
		List<EmpDto> emplist = null;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);

		try {
			emplist = empdao.empListPage(map);
		} catch (Exception e) {
			log.debug("EmpService empListPage 예외발생: " + e.getMessage());
		}
		return emplist;
	}

	// 사원목록 page 처리 김정하 2020. 1. 29
	public int empListPageCount(Map<String, String> map) {
		int count = 0;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		try {
			count = empdao.empListPageCount(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("EmpService empListPageCount 예외발생: " + e.getMessage());
		}
		return count;
	}

	// 오형남 CEO 정보 가져오기
	public EmpDto getCEO() {
		EmpDto emp = null;
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		try {
			emp = empdao.getCEO();
		} catch (Exception e) {
			log.debug("EmpService empModify 예외발생: " + e.getMessage());
		}
		return emp;
	}
}
