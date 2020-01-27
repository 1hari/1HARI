package kr.coo.onehari.hr.service;

import java.security.Principal;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.coo.onehari.hr.dao.EmpDao;
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
	
	//사원정보수정(화면) 2020. 1. 8 양찬식
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

	//사원정보수정(변경) 2020. 1. 10 양찬식 
	//시작 시간 : 오후 3시 20분 끝난시간 3시 25분
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
	
	//형남 0112 출근
	public int insertStartWorkTA(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.insertStartWorkTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertStartWorkTA : " + e.getMessage());
		}
		return result;
	}
	//형남 0112 출근(지각)
	public int insertStartWorkTardyTA(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.insertStartWorkTardyTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertStartWorkTardyTA : " + e.getMessage());
		}
		return result;
	}
	
	//형남 0112 퇴근
	public int insertEndWorkTA(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.insertEndWorkTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertStartWorkTA : " + e.getMessage());
		}
		return result;
	}
	
	//형남 0112 오늘 퇴근이 있는지
	public int todayEndWorkCheck(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.todayEndWorkCheck(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayEndWorkCheck : " + e.getMessage());
		}
		return result;
	}
	
	//형남 0112 오늘 출근이 있는지
	public int todayStartWorkCheck(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.todayStartWorkCheck(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayStartWorkCheck : " + e.getMessage());
		}
		return result;
	}
	
	//형남 0112 오늘 결근인지
	public int todayAbsentCheck(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.todayAbsentCheck(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayAbsentCheck : " + e.getMessage());
		}
		return result;
	}
	
	//형남 0112 오늘 출근이 있는지
	public int getTotalTA(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.getTotalTA(empNum);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getTotalTA : " + e.getMessage());
		}
		return result;
	}
	
    //형남 0113 오늘 출근시간
    public Date getStartWorkTime(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        Date startTime = null;
        int empNum=Integer.parseInt(empNumStr);
        try {
            startTime=dao.getStartWorkTime(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getStartWorkTime : " + e.getMessage());
        }
        return startTime;
    }
    
    //형남 0113 오늘 총 근무시간
    public String getWorkTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getWorkTime(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getWorkTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0113 오늘 총 근무시간
    public String getTodayTotalTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getTodayTotalTime(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTodayTotalTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0113 이번주 현재까지 총 근무시간
    public String getWeekTotalTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getWeekTotalTime(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getWeekTotalTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0113 현재까지 총 근무시간
    public String getTotalTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getTotalTime(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTotalTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0115 이번주 총 근무시간
    public String getWeekWorkTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getWeekWorkTime(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getWeekWorkTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0115 총 근무시간
    public String getTotalWorkTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getTotalWorkTime(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTotalWorkTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0114 dataDate 형식으로 가져오기
    public String getDataDate(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getDataDate(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getDataDate : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0114 이번달 출근기록 yyyy-mm-dd
    public List<String> getStartList(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	List<String> totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getStartList(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getStartList : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0114 이번달 출근기록 yyyy-mm-dd
    public List<String> getTardyList(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	List<String> totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getTardyList(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTardyList : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0114 이번달 퇴근기록 yyyy-mm-dd
    public List<String> getEndList(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        List<String> totalTime = null;
        int empNum=Integer.parseInt(empNumStr);
        try {
            totalTime=dao.getEndList(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getEndList : " + e.getMessage());
        }
        return totalTime;
    }
    
    //형남 0119 이번달 결근기록 yyyy-mm-dd
    public List<String> getAbsentList(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	List<String> totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getAbsentList(empNum);
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getAbsentList : " + e.getMessage());
    	}
    	return totalTime;
    }

    
    //형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
    public int getWork(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        int work = 0;
        int empNum=Integer.parseInt(empNumStr);
        try {
            work=dao.getWork(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getWork : " + e.getMessage());
        }
        return work;
    }

    //형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
    public int getTardy(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        int tardy = 0;
        int empNum=Integer.parseInt(empNumStr);
        try {
            tardy=dao.getTardy(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getTardy : " + e.getMessage());
        }
        return tardy;
    }
    
    //형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
    public int getAbsent(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        int absent = 0;
        int empNum=Integer.parseInt(empNumStr);
        try {
            absent=dao.getAbsent(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getAbsent : " + e.getMessage());
        }
        return absent;
    }
    
    //형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
    public int getAnnual(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        int annual = 0;
        int empNum=Integer.parseInt(empNumStr);
        try {
            annual=dao.getAnnual(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getAnnual : " + e.getMessage());
        }
        return annual;
    }

    //형남 0121 출근 횟수 가져오기(사원 대시보드 차트)
    public int getEarly(String empNumStr) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        int early = 0;
        int empNum=Integer.parseInt(empNumStr);
        try {
            dao.getEarly(empNum);
            early=dao.getEarly(empNum);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getEarly : " + e.getMessage());
        }
        return early;
    }
    
    //형남 0122 존재하는 팀 목록 가져오기
    public List<Integer> getTeamCodeList() {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	List<Integer> teamList = null;
    	try {
            teamList=dao.getTeamCodeList();
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTeamCodeList : " + e.getMessage());
    	}
    	return teamList;
    }
    
    //형남 0123 존재하는 팀 목록 가져오기
    public List<String> getTeamNameList() {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	List<String> teamList = null;
    	try {
    		teamList=dao.getTeamNameList();
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTeamNameList : " + e.getMessage());
    	}
    	return teamList;
    }
    
    //형남 0122 팀 별 근무시간(월)
    public String getTeamMonthWorkTime(int teamCode, int month) {
        EmpDao dao = sqlsession.getMapper(EmpDao.class);
        String totalTime = null;
        try {
            totalTime=dao.getTeamMonthWorkTime(teamCode, month);
        } catch (ClassNotFoundException | SQLException e) {
            log.debug("getTeamMonthWork : " + e.getMessage());
        }
        return totalTime;
    }
    
	//사원정보수정(화면) 2020. 1. 8 양찬식
	public EmpDto getCEO() {
		EmpDto emp = null;
		EmpDao empDao = sqlsession.getMapper(EmpDao.class);
		
		try {
			emp = empDao.getCEO();
		} catch (Exception e) {
			log.debug("EmpService empModify 예외발생: " + e.getMessage());
		}
		return emp;
	}
}

