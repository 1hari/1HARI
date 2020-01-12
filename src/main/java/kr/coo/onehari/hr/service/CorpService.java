package kr.coo.onehari.hr.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.CorpDao;
import kr.coo.onehari.hr.dto.Employment;
import kr.coo.onehari.hr.dto.Position;
import kr.coo.onehari.hr.dto.Rank;
import kr.coo.onehari.hr.dto.Role;
import kr.coo.onehari.hr.dto.Team;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class CorpService {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 소속목록 가져오기 김진호 200108
	public List<Team> getTeamCodes() {
		List<Team> getTeamCodes = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getTeamCodes = corpdao.getTeamCodes();
		} catch (Exception e) {
			System.out.println("CorpService getTeamCodes 예외발생: " + e.getMessage());
			log.debug("CorpService getTeamCodes 예외발생: " + e.getMessage());
		}
		return getTeamCodes;
	}
	
	// 직책목록 가져오기 김진호 200108
	public List<Position> getPositionCodes() {
		List<Position> getPositionCodes = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getPositionCodes = corpdao.getPositionCodes();
		} catch (Exception e) {
			System.out.println("CorpService getPositionCodes 예외발생: " + e.getMessage());
			log.debug("CorpService getPositionCodes 예외발생: " + e.getMessage());
		}
		return getPositionCodes;
	}
	
	// 직급목록 가져오기 김진호 200108
	public List<Rank> getRankCodes() {
		List<Rank> getRankCodes = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getRankCodes = corpdao.getRankCodes();
		} catch (Exception e) {
			System.out.println("CorpService getRankCodes 예외발생: " + e.getMessage());
			log.debug("CorpService getRankCodes 예외발생: " + e.getMessage());
		}
		return getRankCodes;
	}
	
	// 재직구분목록 가져오기 김진호 200108
	public List<Employment> getEmploymentCodes() {
		List<Employment> getEmploymentCodes = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getEmploymentCodes = corpdao.getEmploymentCodes();
		} catch (Exception e) {
			System.out.println("CorpService getEmploymentCodes 예외발생: " + e.getMessage());
			log.debug("CorpService getEmploymentCodes 예외발생: " + e.getMessage());
		}
		return getEmploymentCodes;
	}
	
	// 권한목록 가져오기 김진호 2020. 1. 12
	public List<Role> getRoles() {
		List<Role> getRoles = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getRoles = corpdao.getRoles();
		} catch (Exception e) {
			System.out.println("CorpService getRoles 예외발생: " + e.getMessage());
			log.debug("CorpService getRoles 예외발생: " + e.getMessage());
		}
		return getRoles;
	}
}
