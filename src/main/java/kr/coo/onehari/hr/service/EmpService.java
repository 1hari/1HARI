package kr.coo.onehari.hr.service;

import java.sql.SQLException;
import java.util.Date;
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
import kr.coo.onehari.my.dao.MyDao;
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
	public void empUpdate(EmpDto empdto) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		try {
			if (empdto.getRoleName().equals("ROLE_USER")) {
				empdao.empUpdate(empdto);
				empdao.subempUpdate(empdto);
				empdao.deleteRolePersonnel(empdto);
				empdao.deleteRoleAdmin(empdto);
			} else if (empdto.getRoleName().equals("ROLE_PERSONNEL")) {
				empdao.empUpdate(empdto);
				empdao.subempUpdate(empdto);
				empdao.insertRoleaPersonnel(empdto);
				empdao.deleteRoleAdmin(empdto);
			} else if (empdto.getRoleName().equals("ROLE_ADMIN")) {
				empdao.empUpdate(empdto);
				empdao.subempUpdate(empdto);
				empdao.insertRoleaPersonnel(empdto);
				empdao.insertRoleaAdmin(empdto);
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
	
	//형남 0112 출근
	public int insertStartWorkTA(String empNumStr) {
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		int result = 0;
		int empNum=Integer.parseInt(empNumStr);
		try {
			result=dao.insertStartWorkTA(empNum);
			if(result >0) {
				System.out.println("출근 등록 성공");
			}else {
				System.out.println("출근 등록 실패");
			}
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("insertStartWorkTA : " + e.getMessage());
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
			if(result >0) {
				System.out.println("퇴근 등록 성공");
			}else {
				System.out.println("퇴근 등록 실패");
			}
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
			if(result >0) {
				System.out.println("퇴근기록 있음");
			}else {
				System.out.println("퇴근기록 없음");
			}
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
			if(result >0) {
				System.out.println("출근기록 있음");
			}else {
				System.out.println("출근기록 없음");
			}
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("todayStartWorkCheck : " + e.getMessage());
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
			if(result >0) {
				System.out.println("출근기록: " + result);
			}else {
				System.out.println("출근기록 없음");
			}
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
            if(startTime !=null) {
                System.out.println("출근시간: " + startTime);
            }else {
                System.out.println("출근시간 못가져옴");
            }
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
    		if(totalTime !=null) {
    			System.out.println("현재까지 근무시간: " + totalTime);
    		}else {
    			System.out.println("현재까지 근무시간 못가져옴");
    		}
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
    		if(totalTime !=null) {
    			System.out.println("오늘 총 근무시간: " + totalTime);
    		}else {
    			System.out.println("오늘 총 근무시간 못가져옴");
    		}
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTodayTotalTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0113 이번주 총 근무시간
    public String getWeekTotalTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getWeekTotalTime(empNum);
    		if(totalTime !=null) {
    			System.out.println("이번주 총 근무시간: " + totalTime);
    		}else {
    			System.out.println("이번주 총 근무시간 못가져옴");
    		}
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getWeekTotalTime : " + e.getMessage());
    	}
    	return totalTime;
    }
    
    //형남 0113 총 근무시간
    public String getTotalTime(String empNumStr) {
    	EmpDao dao = sqlsession.getMapper(EmpDao.class);
    	String totalTime = null;
    	int empNum=Integer.parseInt(empNumStr);
    	try {
    		totalTime=dao.getTotalTime(empNum);
    		if(totalTime !=null) {
    			System.out.println(" 총 근무시간: " + totalTime);
    		}else {
    			System.out.println("총 근무시간 못가져옴");
    		}
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getTotalTime : " + e.getMessage());
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
    		if(totalTime !=null) {
    			System.out.println("dataDate: " + totalTime);
    		}else {
    			System.out.println("dataDate 못가져옴");
    		}
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
    		if(totalTime !=null) {
    			System.out.println("getStartList: " + totalTime);
    		}else {
    			System.out.println("getStartList 못가져옴");
    		}
    	} catch (ClassNotFoundException | SQLException e) {
    		log.debug("getStartList : " + e.getMessage());
    	}
    	return totalTime;
    }
    

}
