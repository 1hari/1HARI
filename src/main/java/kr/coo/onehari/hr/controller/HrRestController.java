package kr.coo.onehari.hr.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Employment;
import kr.coo.onehari.hr.dto.Position;
import kr.coo.onehari.hr.dto.Rank;
import kr.coo.onehari.hr.dto.Role;
import kr.coo.onehari.hr.dto.Team;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.my.service.MyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class HrRestController {
	
	@Autowired
	private CorpService corpservice;
	
	@Autowired
	private MyService myService;
	
	@Autowired
	private EmpService empSercive;

	// 사원등록 시 소속 SELECT BOX 김진호 200108
	@RequestMapping(value = "getTeamCode.hari", method = RequestMethod.POST)
	public List<Team> getTeamCodes() {
		List<Team> teamlist = null;
		
		try {
			teamlist = corpservice.getTeamCodes();
		} catch (Exception e) {
			System.out.println("Ajax TeamCode 예외발생: " + e.getMessage());
			log.debug("Ajax TeamCode 예외발생: " + e.getMessage());
		}
		return teamlist;
	}
	
	// 사원등록 시 직책 SELECT BOX 김진호 200108
	@RequestMapping(value = "getPositionCode.hari", method = RequestMethod.POST)
	public List<Position> getPositionCodes() {
		List<Position> positionlist = null;
		
		try {
			positionlist = corpservice.getPositionCodes();
		} catch (Exception e) {
			System.out.println("Ajax PositionCode 예외발생: " + e.getMessage());
			log.debug("Ajax PositionCode 예외발생: " + e.getMessage());
		}
		return positionlist;
	}
	
	// 사원등록 시 직급 SELECT BOX 김진호 200108
	@RequestMapping(value = "getRankCode.hari", method = RequestMethod.POST)
	public List<Rank> getRankCodes() {
		List<Rank> ranklist = null;
		
		try {
			ranklist = corpservice.getRankCodes();
		} catch (Exception e) {
			System.out.println("Ajax RankCode 예외발생: " + e.getMessage());
			log.debug("Ajax RankCode 예외발생: " + e.getMessage());
		}
		return ranklist;
	}
	
	// 사원등록 시 재직구분 SELECT BOX 김진호 200108
	@RequestMapping(value = "getEmploymentCode.hari", method = RequestMethod.POST)
	public List<Employment> getEmploymentCodes() {
		List<Employment> employmentlist = null;
		
		try {
			employmentlist = corpservice.getEmploymentCodes();
		} catch (Exception e) {
			System.out.println("Ajax EmploymentCode 예외발생: " + e.getMessage());
			log.debug("Ajax EmploymentCode 예외발생: " + e.getMessage());
		}
		return employmentlist;
	}
	
	// 사원정보수정 시 권한 SELECT BOX 김진호 200112
	@RequestMapping(value = "getRole.hari", method = RequestMethod.POST)
	public List<Role> getRoles() {
		List<Role> rolelist = null;
		
		try {
			rolelist = corpservice.getRoles();
		} catch (Exception e) {
			System.out.println("Ajax Role 예외발생: " + e.getMessage());
			log.debug("Ajax Role 예외발생: " + e.getMessage());
		}
		return rolelist;
	}
	
	//형남 0110 비밀번호 변경 시 이메일과 사번 일치여부 확인
	@RequestMapping(value = "empNumEmail.hari", method = RequestMethod.POST)
	public boolean empNumEmail(EmpDto emp) {
		boolean isExist = false;
		try {
			isExist = myService.empNumEmail(emp);
		} catch (Exception e) {
			log.debug("empNumEmail 예외발생: " + e.getMessage());
		}
		return isExist;
	}
	
	//형남 0112 출근하기
	@RequestMapping(value = "startWork.hari", method = RequestMethod.POST)
	public boolean startWork(Principal pri) {
		int result = 0;
		//요청시간 String
		String tardyDateStr = "110000";
		//현재시간 Date
		Date curDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("HHmmss");
		//요청시간을 Date로 parsing 후 time가져오기

		try {
			Date tardyDate = dateFormat.parse(tardyDateStr);
			long tardyDateTime = tardyDate.getTime();
			//현재시간을 요청시간의 형태로 format 후 time 가져오기
			curDate = dateFormat.parse(dateFormat.format(curDate));
			long curDateTime = curDate.getTime();
			//현재시간이 지각시간보다 크면(지각)
			if(curDateTime >tardyDateTime) {
				result = empSercive.insertStartWorkTardyTA(pri.getName());
			}else {
				result = empSercive.insertStartWorkTA(pri.getName());
			}
		} catch (Exception e) {
			log.debug("empNumEmail 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}
	
	//형남 0112 퇴근하기
	@RequestMapping(value = "endWork.hari", method = RequestMethod.POST)
	public boolean endWork(Principal pri) {
		int result = 0;
		try {
			result = empSercive.insertEndWorkTA(pri.getName());
		} catch (Exception e) {
			log.debug("endWork 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}
	
	//형남 0112 퇴근조회
	@RequestMapping(value = "todayEndWorkCheck.hari", method = RequestMethod.POST)
	public boolean todayEndWorkCheck(Principal pri) {
		int result = 0;
		try {
			result = empSercive.todayEndWorkCheck(pri.getName());
		} catch (Exception e) {
			log.debug("todayEndWorkCheck 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}
	
	//형남 0112 결근조회
	@RequestMapping(value = "todayAbsentCheck.hari", method = RequestMethod.POST)
	public boolean todayAbsentCheck(Principal pri) {
		int result = 0;
		try {
			result = empSercive.todayAbsentCheck(pri.getName());
		} catch (Exception e) {
			log.debug("todayAbsentCheck 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}
	
	//형남 0112 출근조회
	@RequestMapping(value = "todayStartWorkCheck.hari", method = RequestMethod.POST)
	public boolean todayStartWorkCheck(Principal pri) {
		int result = 0;
		try {
			result = empSercive.todayStartWorkCheck(pri.getName());
		} catch (Exception e) {
			log.debug("todayStartWorkCheck 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}
	
	//형남 0113 총 근무일조회
	@RequestMapping(value = "getTotalTA.hari", method = RequestMethod.POST)
	public int getTotalTA(Principal pri) {
		int result = 0;
		try {
			result = empSercive.getTotalTA(pri.getName());
		} catch (Exception e) {
			log.debug("getTotalTA 예외발생: " + e.getMessage());
		}
		return result;
	}
	
	//형남 0113 현재까지 근무시간
	@RequestMapping(value = "getWorkTime.hari", method = RequestMethod.POST)
	public String getWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getWorkTime(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0113 퇴근시간 가져오기
	@RequestMapping(value = "getTodayTotalTime.hari", method = RequestMethod.POST)
	public String getTodayTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getTodayTotalTime(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getTodayTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0113 이번주 현재까지 총 근무시간
	@RequestMapping(value = "getWeekTotalTime.hari", method = RequestMethod.POST)
	public String getWeekTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getWeekTotalTime(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getWeekTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0113 현재까지 총 근무시간
	@RequestMapping(value = "getTotalTime.hari", method = RequestMethod.POST)
	public String getTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getTotalTime(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0115 이번주 총 근무시간
	@RequestMapping(value = "getWeekWorkTime.hari", method = RequestMethod.POST)
	public String getWeekWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getWeekWorkTime(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getWeekWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0115 총 근무시간
	@RequestMapping(value = "getTotalWorkTime.hari", method = RequestMethod.POST)
	public String getTotalWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getTotalWorkTime(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getTotalWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0114 dataDate 형식으로 가져오기
	@RequestMapping(value = "getDataDate.hari", method = RequestMethod.POST)
	public String getDataDate(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getDataDate(pri.getName());
			if(totalTime==null) {
				totalTime="empty";
			}
		} catch (Exception e) {
			log.debug("getDataDate 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0114 이번달 출근기록 yyyy-mm-dd
	@RequestMapping(value = "getStartList.hari", method = RequestMethod.POST)
	public List<String> getStartList(Principal pri) {
		List<String> totalTime = null;
		try {
			totalTime = empSercive.getStartList(pri.getName());
		} catch (Exception e) {
			log.debug("getStartList 예외발생: " + e.getMessage());
		}
		return totalTime;
	}
	
	//형남 0114 이번달 퇴근, 결근 기록 yyyy-mm-dd
	@RequestMapping(value = "getEndList.hari", method = RequestMethod.POST)
	public String getEndList(Principal pri) {
		JSONObject jsonObject = new JSONObject();
		List<String> endList = null;
		List<String> absentList = null;
		
		try {
			endList = empSercive.getEndList(pri.getName());
			absentList = empSercive.getAbsentList(pri.getName());
			jsonObject.put("endList", endList);
			jsonObject.put("absentList", absentList);
		} catch (Exception e) {
			log.debug("getEndList 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}
	
	//사원 테마색 가져오기 오형남 / 2020. 1. 16
	@RequestMapping(value = "getThemeColor.hari", method = RequestMethod.POST)
	public String getThemeColor(Principal pri) {
		String themeColor = null;
		try {
			themeColor = empSercive.getThemeColor(pri.getName());
			if(themeColor==null) {
				themeColor="empty";
			}
		} catch (Exception e) {
			log.debug("getThemeColor 예외발생: " + e.getMessage());
		}
		return themeColor;
	}
	
	//사원 테마색 가져오기 오형남 / 2020. 1. 16
	@RequestMapping(value = "setThemeColor.hari", method = RequestMethod.POST)
	public int setThemeColor(Principal pri, @RequestParam("color") String value) {
		int themeColor = 0;
		String[] color=value.split(",");
		try {
			themeColor = empSercive.setThemeColor(pri.getName(), color[0].trim());
		} catch (Exception e) {
			log.debug("setThemeColor 예외발생: " + e.getMessage());
		}
		return themeColor;
	}
}
