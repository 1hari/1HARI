package kr.coo.onehari.hr.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

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
	
	// 사원등록 시 마지막 사번 가져오기 김진호 2020. 1. 23
	@RequestMapping(value = "getLastEmpNum.hari", method = RequestMethod.POST)
	public int getLastEmpNum() {
		int empNum = 0;
		try {
			empNum = corpservice.getLastEmpNum();
			System.out.println("empNum : " + empNum);
		} catch (Exception e) {
			log.debug("HrRestController getLastEmpNum 예외발생: " + e.getMessage());
		}
		
		return empNum;
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

	// 형남 0110 비밀번호 변경 시 이메일과 사번 일치여부 확인
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

	// 형남 0112 출근하기
	@RequestMapping(value = "startWork.hari", method = RequestMethod.POST)
	public boolean startWork(Principal pri) {
		int result = 0;
		// 요청시간 String
		String tardyDateStr = "110000";
		// 현재시간 Date
		Date curDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("HHmmss");
		// 요청시간을 Date로 parsing 후 time가져오기

		try {
			Date tardyDate = dateFormat.parse(tardyDateStr);
			long tardyDateTime = tardyDate.getTime();
			// 현재시간을 요청시간의 형태로 format 후 time 가져오기
			curDate = dateFormat.parse(dateFormat.format(curDate));
			long curDateTime = curDate.getTime();
			// 현재시간이 지각시간보다 크면(지각)
			if (curDateTime > tardyDateTime) {
				result = empSercive.insertStartWorkTardyTA(pri.getName());
			} else {
				result = empSercive.insertStartWorkTA(pri.getName());
			}
		} catch (Exception e) {
			log.debug("empNumEmail 예외발생: " + e.getMessage());
		}
		return result > 0 ? true : false;
	}

	// 형남 0112 퇴근하기
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

	// 형남 0112 퇴근조회
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

	// 형남 0112 결근조회
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

	// 형남 0112 출근조회
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

	// 형남 0113 총 근무일조회
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

	// 형남 0113 현재까지 근무시간
	@RequestMapping(value = "getWorkTime.hari", method = RequestMethod.POST)
	public String getWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getWorkTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 퇴근시간 가져오기
	@RequestMapping(value = "getTodayTotalTime.hari", method = RequestMethod.POST)
	public String getTodayTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getTodayTotalTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getTodayTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 이번주 현재까지 총 근무시간
	@RequestMapping(value = "getWeekTotalTime.hari", method = RequestMethod.POST)
	public String getWeekTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getWeekTotalTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getWeekTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0113 현재까지 총 근무시간
	@RequestMapping(value = "getTotalTime.hari", method = RequestMethod.POST)
	public String getTotalTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getTotalTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getTotalTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0115 이번주 총 근무시간
	@RequestMapping(value = "getWeekWorkTime.hari", method = RequestMethod.POST)
	public String getWeekWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getWeekWorkTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getWeekWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0115 총 근무시간
	@RequestMapping(value = "getTotalWorkTime.hari", method = RequestMethod.POST)
	public String getTotalWorkTime(Principal pri) {
		String totalTime = null;
		try {
			totalTime = empSercive.getTotalWorkTime(pri.getName());
			if (totalTime == null) {
				totalTime = "empty";
			}
		} catch (Exception e) {
			log.debug("getTotalWorkTime 예외발생: " + e.getMessage());
		}
		return totalTime;
	}

	// 형남 0114 dataDate 형식으로 가져오기
	@RequestMapping(value = "getDataDate.hari", method = RequestMethod.POST)
	public String getDataDate(Principal pri) {
		String dataDate = null;
		try {
			dataDate = empSercive.getDataDate(pri.getName());
			if (dataDate == null) {
				dataDate = "empty";
			}
		} catch (Exception e) {
			log.debug("getDataDate 예외발생: " + e.getMessage());
		}
		return dataDate;
	}

	// 형남 0114 이번달 출근기록 yyyy-mm-dd
	@RequestMapping(value = "getStartList.hari", method = RequestMethod.POST)
	public String getStartList(Principal pri) {
		List<String> startList = null;
		List<String> tardyList = null;
		JSONObject jsonObject = new JSONObject();
		try {
			startList = empSercive.getStartList(pri.getName());
			tardyList = empSercive.getTardyList(pri.getName());
			jsonObject.put("startList", startList);
			jsonObject.put("tardyList", tardyList);
		} catch (Exception e) {
			log.debug("getStartList 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0114 이번달 퇴근, 결근 기록 yyyy-mm-dd
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

	// 사원등록 시 이메일 발송(Velocity) 김진호 2020. 1. 21
	@RequestMapping(value = "personnel/sendMail.hari", method = RequestMethod.POST)
	public String sendMail(HttpServletRequest req, Principal principal) {
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = null;
		String email = req.getParameter("email");
		String empName = req.getParameter("empName");
		String empNum = req.getParameter("empNum");
		String password = req.getParameter("password");
		
		StringBuilder path = new StringBuilder();
		path.append(req.getLocalAddr());
		path.append(":");
		path.append(req.getLocalPort());
		path.append(req.getContextPath());

		try {
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			Map model = new HashMap();
			model.put("email", email);
			model.put("empName", empName);
			model.put("empNum", empNum);
			model.put("password", password);
			model.put("path", path.toString());
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm", "UTF-8", model);
			messageHelper.setFrom("2020.1hari@gmail.com");
			messageHelper.setTo(email);
			StringBuilder subject = new StringBuilder();
			subject.append(empName);
			subject.append(" 님 1HARI 주식회사에 오신 것을 환영합니다.");
			messageHelper.setSubject(subject.toString());
			messageHelper.setText(mailBody, true);
			javaMailSender.send(message);
		} catch (Exception e) {
			log.debug("HrRestController sendMail 예외발생: " + e.getMessage());
		}
		return "redirect:empList.hari";
	}

	// 형남 0121 출근, 지각, 결근 연차, 조퇴 횟수 가져오기(사원 대시보드 차트)
	@RequestMapping(value = "getTA.hari", method = RequestMethod.POST)
	public String getTA(Principal pri) {
		List<Integer> TAList = new ArrayList<Integer>();
		JSONObject jsonObject = new JSONObject();
		try {
			int work = empSercive.getWork(pri.getName());
			int tardy = empSercive.getTardy(pri.getName());
			int absent = empSercive.getAbsent(pri.getName());
			int annual = empSercive.getAnnual(pri.getName());
			int early = empSercive.getEarly(pri.getName());
			TAList.add(work);
			TAList.add(tardy);
			TAList.add(absent);
			TAList.add(annual);
			TAList.add(early);
			jsonObject.put("TAList", TAList);
		} catch (Exception e) {
			log.debug("getTA 예외발생: " + e.getMessage());
		}
		return jsonObject.toJSONString();
	}

	// 형남 0122 팀 별 근무시간 가져오기(전월)
	@RequestMapping(value = "getAllEmpTA.hari", method = RequestMethod.POST)
	public String getAllEmpTA() {
		JSONArray root = new JSONArray();
		JSONArray jsonArray = null;
		List<Integer> teamCodeList = new ArrayList<Integer>();
		List<String> teamNameList = new ArrayList<String>();
		List<String> teamWorkTimeList = null;
		String teamWorkTime = null;
		JSONObject jsonObject = null;
		int count = 0;
		try {
			// 현재 존재하는 팀코드 가져오기
			teamCodeList = empSercive.getTeamCodeList();
			// JSON Data에 넣을 label 값(팀 이름)
			teamNameList = empSercive.getTeamNameList();
			// 모든 팀에 전월 근무시간 가져오기
			for (int teamCode : teamCodeList) {
				// 차트에 들어갈 json 데이터 형식으로 추가
				jsonObject = new JSONObject();

				jsonObject.put("label", teamNameList.get(count));
				jsonObject.put("borderWidth", 1);
				// 팀별 + 월별 근무시간 리스트
				teamWorkTimeList = new ArrayList<String>();
				for (int i = 1; i < 13; i++) {
					jsonArray = new JSONArray();
					teamWorkTime = empSercive.getTeamMonthWorkTime(teamCode, i);// 2001/1,2,3,4,5..
					if (teamWorkTime == null) {
						teamWorkTime = "0";
					}
					String[] timeSplit = teamWorkTime.split(":");

					teamWorkTimeList.add(timeSplit[0]);
				}
				count++;
				jsonObject.put("data", teamWorkTimeList);
				root.add(jsonObject);
			}
		} catch (Exception e) {
			log.debug("getAllEmpTA 예외발생: " + e.getMessage());
		}
		return root.toJSONString();
	}

	// 형남 0123 팀 별 근무시간 가져오기(월별)
	@RequestMapping(value = "getEmpTAMonth.hari", method = RequestMethod.POST)
	public String getEmpTAMonth(String monthStr) {
		int month = Integer.parseInt(monthStr);
		JSONArray root = new JSONArray();
		JSONArray jsonArray = null;
		List<Integer> teamCodeList = new ArrayList<Integer>();
		List<String> teamNameList = new ArrayList<String>();
		List<String> teamWorkTimeList = null;
		String teamWorkTime = null;
		JSONObject jsonObject = null;
		int count = 0;
			try {
				// 현재 존재하는 팀코드 가져오기
				teamCodeList = empSercive.getTeamCodeList();
				// JSON Data에 넣을 label 값(팀 이름)
				teamNameList = empSercive.getTeamNameList();
				// 모든 팀에 전월 근무시간 가져오기
				for (int teamCode : teamCodeList) {
					// 차트에 들어갈 json 데이터 형식으로 추가
					jsonObject = new JSONObject();
					jsonObject.put("label", teamNameList.get(count));
					jsonObject.put("borderWidth", 1);
					// 팀별 + 월별 근무시간 리스트
					teamWorkTimeList = new ArrayList<String>();
					jsonArray = new JSONArray();
					teamWorkTime = empSercive.getTeamMonthWorkTime(teamCode, month);// 2001/1,2,3,4,5..
					if (teamWorkTime == null ) {
						teamWorkTime = "0";
					}
					//split 함수로 잘라서 시간만 가져옴
					String[] timeSplit = teamWorkTime.split(":");
					teamWorkTimeList.add(timeSplit[0]);
					jsonObject.put("data", teamWorkTimeList);
					root.add(jsonObject);
					count++;
				}
			} catch (Exception e) {
				log.debug("getEmpTAMonth 예외발생: " + e.getMessage());
			}
		return root.toJSONString();
	}
	
	@RequestMapping(value = "getTaList.hari", method = RequestMethod.POST)
	public List<EmpDto> getTaList() {
		List<EmpDto> getTaList = null;
		
		try {
			getTaList = empSercive.getTaList();
		} catch (Exception e) {
			log.debug("HrRestController getTaList 예외발생: " + e.getMessage());
		}
		return getTaList;
	}
	
	//대시보드 부서별 연봉통계 셀렉트박스
	@RequestMapping(value = "getSalYear.hari", method = RequestMethod.POST)
	public List<String> getSalYear() {
		List<String> yearList = null;
		
		try {
			yearList = empSercive.getSalYear();
		} catch (Exception e) {
			log.debug("getSalYear 예외발생: " + e.getMessage());
		}
		return yearList;
	}
	
	// 형남 0128 팀별 연봉차트
	@RequestMapping(value = "getTeamSalList.hari", method = RequestMethod.POST)
	public String getTeamSalList(String year) {
		JSONArray root = new JSONArray(); //가장 바깥쪽 배열 - dataset
		JSONArray teamAvgSalArray = null; //data 값
		List<Integer> teamCodeList = new ArrayList<Integer>(); //팀코드 리스트
		List<String> teamNameList = new ArrayList<String>(); //라벨에 넣어줄 팀 이름
		String teamAvgSal = null; //팀 별 평균 연봉
		JSONObject jsonObject = null;
		int count = 0;
			try {
				// 현재 존재하는 팀코드 가져오기
				teamCodeList = empSercive.getTeamCodeList();
				// JSON Data에 넣을 label 값(팀 이름)
				teamNameList = empSercive.getTeamNameList();
				// 모든 팀의 평균연봉 가져와 배열에 하나씩 넣음(dataset 형식에 맞춤)
				for (int teamCode : teamCodeList) {
					// 차트에 들어갈 json 데이터 형식으로 추가
					jsonObject = new JSONObject();
					jsonObject.put("label", teamNameList.get(count));
					jsonObject.put("borderWidth", 1);
					teamAvgSalArray = new JSONArray();
					teamAvgSal = empSercive.getTeamAvgSal(teamCode, year); //팀 별 평균연봉
					if (teamAvgSal == null ) {
						teamAvgSal = "0";
					}
					teamAvgSalArray.add(teamAvgSal);
					jsonObject.put("data", teamAvgSalArray);
					root.add(jsonObject);
					count++; //팀 이름 가져올 때 인덱스값
				}
			} catch (Exception e) {
				log.debug("getEmpTAMonth 예외발생: " + e.getMessage());
			}
		return root.toJSONString();
	}
	
	
	//사원리스트+페이징 가져오기 김정하 2020. 1. 29
	@RequestMapping("getEmpList.hari")
	public Map empList(String pg, String cp, String[] searchCheck, String searchKey){
		//System.out.println(pg);
		//System.out.println(cp);
		//System.out.println(searchCheck);
		//System.out.println(searchKey);
		
		//DB parameter 로 보내는 map
		HashMap<String, String> map = new HashMap<String, String>();
		
		//vue로 내보내는 Map
		HashMap outputMap = new HashMap<>();
		
		int offset = Integer.parseInt(cp);
		
		if(offset == 1) {
			offset = 0;
		}else {
			offset = (offset-1)*Integer.parseInt(pg);
		}
		
		if(searchCheck != null) {
			for(String Check : searchCheck) {
				
					map.put(Check, Check);
				
			}
		}
		map.put("searchKey", searchKey);
		map.put("pg", pg); //page 에 보여줄 갯수
		map.put("cp", Integer.toString(offset)); //보여줄 페이지
		
		List<EmpDto> empList = empSercive.empListPage(map);
		outputMap.put("empList",empList);
		
		int count = empSercive.empListPageCount(map);
		int lastPage = count/Integer.parseInt(pg);
		//System.out.println(lastPage);
		
		if(count%Integer.parseInt(pg) > 0) {
			lastPage++;
		}
		//System.out.println(lastPage);
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		for (int i = 1; i <= lastPage; i++) {
			page.add(i);
		}
		
		//System.out.println(page);

		outputMap.put("page", page);
		outputMap.put("lastPage", lastPage);

		return outputMap;
	}
	
	// 관리자권한 사원근태수정을 위한 사원정보 가져오기 김진호 2020. 1. 29
	@RequestMapping(value = "getEmpTa.hari", method = RequestMethod.POST)
	public EmpDto getEmpTa(int empNum) {
		EmpDto empTa = null;
		try {
			empTa = empSercive.getEmpTa(empNum);
		} catch (Exception e) {
			log.debug("HrRestController getEmpTa 예외발생: " + e.getMessage());
		}
		return empTa;
	}
}