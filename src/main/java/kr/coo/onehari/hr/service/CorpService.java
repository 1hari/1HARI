package kr.coo.onehari.hr.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dao.CorpDao;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class CorpService {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 소속목록 가져오기 김진호 200108
	public List<String> getTeamCodes() {
		List<String> getTeamCodes = null;
		
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
	public List<String> getPositionCodes() {
		List<String> getPositionCodes = null;
		
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
	public List<String> getRankCodes() {
		List<String> getRankCodes = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getRankCodes = corpdao.getTeamCodes();
		} catch (Exception e) {
			System.out.println("CorpService getRankCodes 예외발생: " + e.getMessage());
			log.debug("CorpService getRankCodes 예외발생: " + e.getMessage());
		}
		return getRankCodes;
	}
	
	// 재직구분목록 가져오기 김진호 200108
	public List<String> getEmploymentCodes() {
		List<String> getEmploymentCodes = null;
		
		try {
			CorpDao corpdao = sqlsession.getMapper(CorpDao.class);
			getEmploymentCodes = corpdao.getTeamCodes();
		} catch (Exception e) {
			System.out.println("CorpService getEmploymentCodes 예외발생: " + e.getMessage());
			log.debug("CorpService getEmploymentCodes 예외발생: " + e.getMessage());
		}
		return getEmploymentCodes;
	}
}
