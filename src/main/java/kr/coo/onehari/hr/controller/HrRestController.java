package kr.coo.onehari.hr.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
		String dataDate = null;
		try {
			dataDate = empSercive.getDataDate(pri.getName());
			if(dataDate==null) {
				dataDate="empty";
			}
		} catch (Exception e) {
			log.debug("getDataDate 예외발생: " + e.getMessage());
		}
		return dataDate;
	}
	
	//형남 0114 이번달 출근기록 yyyy-mm-dd
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

	@RequestMapping(value = "personnel/sendMail.hari", method = RequestMethod.POST)
	public String sendMail(HttpServletRequest req, Principal principal) {
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = null;
		String mail = req.getParameter("mail");
		String name = req.getParameter("name");
		StringBuilder path = new StringBuilder();
		path.append(req.getLocalAddr());
		path.append(":");
		path.append(req.getLocalPort());
		path.append(req.getContextPath());
		
		try {
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			Map model = new HashMap();
			model.put("mail", mail);
			model.put("name", name);
			model.put("path", path.toString());
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm", "UTF-8", model);
			messageHelper.setFrom("2020.1hari@gmail.com");
			messageHelper.setTo(mail);
			StringBuilder subject = new StringBuilder();
			subject.append(name);
			subject.append(" 님 DOBEE에 사원등록이 되었습니다.");
			messageHelper.setSubject(subject.toString());
			messageHelper.setText(mailBody, true);
			System.out.println("req.getContextPath()" + req.getContextPath());
			javaMailSender.send(message);
		} catch (Exception e) {
			log.debug("HrRestController sendMail 예외발생: " + e.getMessage());
		}
		
		return "redirect:empList.hari";
	}
}
