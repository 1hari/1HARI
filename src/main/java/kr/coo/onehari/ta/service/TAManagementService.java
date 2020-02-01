package kr.coo.onehari.ta.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.EmpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.ta.dao.TADao;
import kr.coo.onehari.ta.dao.TAManagementDao;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TAManagementService {

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 관리자권한 근태목록 가져오기 김진호 2020. 1. 27
	public List<EmpDto> getTaList(String setDate) {
		TAManagementDao taManagementDao = sqlsession.getMapper(TAManagementDao.class);
		List<EmpDto> getTaList = null;

		try {
			getTaList = taManagementDao.getTaList(setDate);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("EmpService 예외발생: " + e.getMessage());
		}
		return getTaList;
	}

	// 관리자권한 사원근태(비동기) 가져오기 김진호 2020. 1. 29
	public int setEmpTa(Map<String, String> map) {
		TAManagementDao taManagementDao = sqlsession.getMapper(TAManagementDao.class);
		int result = 0;
		try {
			result = taManagementDao.setEmpTa(map);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("EmpService getEmpTa 예외발생: " + e.getMessage());
		}
		return result;
	}
}
