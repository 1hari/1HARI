package kr.coo.onehari.ta.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.ta.dao.TADao;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TAService {

	@Autowired
	private SqlSession sqlsession;

	// 형남 0112 출근
	public int insertStartWorkTA(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.insertStartWorkTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertStartWorkTA : " + e.getMessage());
		}
		return result;
	}

	// 형남 0112 사원 출근 기능(지각)
	public int insertStartWorkTardyTA(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.insertStartWorkTardyTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertStartWorkTardyTA : " + e.getMessage());
		}
		return result;
	}

	// 형남 0112 사원 퇴근 기능
	public int insertEndWorkTA(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.insertEndWorkTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertEndWorkTA : " + e.getMessage());
		}
		return result;
	}

	// 형남 0112 오늘 퇴근기록이 있는지 체크, 출퇴근 버튼 띄어주는데 사용
	public int todayEndWorkCheck(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.todayEndWorkCheck(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayEndWorkCheck : " + e.getMessage());
		}
		return result;
	}

	// 형남 0112 오늘 출근기록이 있는지 체크, 출퇴근 버튼 띄어주는데 사용
	public int todayStartWorkCheck(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.todayStartWorkCheck(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayStartWorkCheck : " + e.getMessage());
		}
		return result;
	}

	// 형남 0112 오늘 결근기록이 있는지 체크, 있으면 출퇴근 버튼 숨김
	public int todayAbsentCheck(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.todayAbsentCheck(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayAbsentCheck : " + e.getMessage());
		}
		return result;
	}

	// 형남 0112 퇴근 시 오늘 근태관리 페이지에 총 근무시간 출력
	public int getTotalTA(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int result = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			result = dao.getTotalTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTotalTA : " + e.getMessage());
		}
		return result;
	}

	// 형남 0113 오늘 출근시간
	public Date getStartWorkTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		Date startTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			startTime = dao.getStartWorkTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getStartWorkTime : " + e.getMessage());
		}
		return startTime;
	}

	// 형남 0113 오늘 총 근무시간
	public String getWorkTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getWorkTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getWorkTime : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 오늘 총 근무시간
	public String getTodayTotalTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getTodayTotalTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTodayTotalTime : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 이번주 현재까지 총 근무시간
	public String getWeekTotalTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getWeekTotalTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getWeekTotalTime : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 현재까지 총 근무시간
	public String getTotalTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getTotalTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTotalTime : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0115 이번주 총 근무시간
	public String getWeekWorkTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getWeekWorkTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getWeekWorkTime : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0115 총 근무시간
	public String getTotalWorkTime(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getTotalWorkTime(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTotalWorkTime : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0114 dataDate 형식으로 가져오기
	public String getDataDate(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getDataDate(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getDataDate : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0114 이번달 출근기록 yyyy-mm-dd
	public List<String> getStartList(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getStartList(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getStartList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0202 이번달 출근기록 yyyy-mm-dd
	public List<String> getStartList(String empNumStr, String calYear, String calMonth) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getStartListCal(empNum, calYear, calMonth);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getStartList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0114 이번달 지각기록 yyyy-mm-dd
	public List<String> getTardyList(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getTardyList(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTardyList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0202 이번달 지각기록 yyyy-mm-dd
	public List<String> getTardyList(String empNumStr, String calYear, String calMonth) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getTardyListCal(empNum, calYear, calMonth);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTardyList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0114 이번달 퇴근기록 yyyy-mm-dd
	public List<String> getEndList(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getEndList(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getEndList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0202 이번달 퇴근기록 캘린더 yyyy-mm-dd
	public List<String> getEndList(String empNumStr, String calYear, String calMonth) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getEndListCal(empNum, calYear, calMonth);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getEndList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0119 이번달 결근기록 yyyy-mm-dd
	public List<String> getAbsentList(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getAbsentList(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAbsentList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0202 이번달 결근기록 캘린더 yyyy-mm-dd
	public List<String> getAbsentList(String empNumStr, String calYear, String calMonth) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getAbsentListCal(empNum, calYear, calMonth);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAbsentList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0131 이번달 연차기록 yyyy-mm-dd
	public List<String> getAnntList(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getAnntList(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAnntList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0202 이번달 연차기록 캘린더 yyyy-mm-dd
	public List<String> getAnntList(String empNumStr, String calYear, String calMonth) {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> totalTime = null;
		int empNum = Integer.parseInt(empNumStr);
		try {
			totalTime = dao.getAnntListCal(empNum, calYear, calMonth);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAnntList : " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
	public int getWork(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int work = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			work = dao.getWork(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getWork : " + e.getMessage());
		}
		return work;
	}

	// 형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
	public int getTardy(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int tardy = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			tardy = dao.getTardy(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTardy : " + e.getMessage());
		}
		return tardy;
	}

	// 형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
	public int getAbsent(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int absent = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			absent = dao.getAbsent(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAbsent : " + e.getMessage());
		}
		return absent;
	}

	// 형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
	public int getAnnual(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int annual = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			annual = dao.getAnnual(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getAnnual : " + e.getMessage());
		}
		return annual;
	}

	// 형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
	public int getEarly(String empNumStr) {
		TADao dao = sqlsession.getMapper(TADao.class);
		int early = 0;
		int empNum = Integer.parseInt(empNumStr);
		try {
			dao.getEarly(empNum);
			early = dao.getEarly(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getEarly : " + e.getMessage());
		}
		return early;
	}

	// 형남 0122 존재하는 팀 목록 가져오기
	public List<Integer> getTeamCodeList() {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<Integer> teamList = null;
		try {
			teamList = dao.getTeamCodeList();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTeamCodeList : " + e.getMessage());
		}
		return teamList;
	}

	// 형남 0123 존재하는 팀 목록 가져오기
	public List<String> getTeamNameList() {
		TADao dao = sqlsession.getMapper(TADao.class);
		List<String> teamList = null;
		try {
			teamList = dao.getTeamNameList();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTeamNameList : " + e.getMessage());
		}
		return teamList;
	}

	// 형남 0122 팀 별 근무시간(월)
	public String getTeamMonthWorkTime(int teamCode, int month, int year) {
		TADao dao = sqlsession.getMapper(TADao.class);
		String totalTime = null;
		try {
			totalTime = dao.getTeamMonthWorkTime(teamCode, month, year);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTeamMonthWork : " + e.getMessage());
		}
		return totalTime;
	}

	// 대시보드 부서별 연봉 연도 셀렉트박스
	public List<String> getSalYear() {
		TADao TADao = sqlsession.getMapper(TADao.class);
		List<String> yearList = null;

		try {
			yearList = TADao.getSalYear();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getSalYear 예외발생: " + e.getMessage());
		}
		return yearList;
	}
	
	// 형남 0202 대시보드 근무시간 통계 차트 연도 셀렉트박스
	public List<String> getWorkTimeYear() {
		TADao TADao = sqlsession.getMapper(TADao.class);
		List<String> yearList = null;
		
		try {
			yearList = TADao.getWorkTimeYear();
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getWorkTimeYear 예외발생: " + e.getMessage());
		}
		return yearList;
	}

	// 대시보드 부서별 평균 연봉
	public String getTeamAvgSal(int teamCode, String year) {
		TADao TADao = sqlsession.getMapper(TADao.class);
		String teamAvgSal = null;

		try {
			teamAvgSal = TADao.getTeamAvgSal(teamCode, year);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTeamAvgSal 예외발생: " + e.getMessage());
		}
		return teamAvgSal;
	}
}
