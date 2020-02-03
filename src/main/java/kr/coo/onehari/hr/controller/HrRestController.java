package kr.coo.onehari.hr.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class HrRestController {

	@Autowired
	private CorpService corpservice;

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
			log.debug("Ajax Role 예외발생: " + e.getMessage());
		}
		return rolelist;
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

	// 사원리스트+페이징 가져오기 김정하 2020. 1. 29
	@RequestMapping("getEmpList.hari")
	public Map empList(String pg, String cp, String[] searchCheck, String searchKey) {
		// System.out.println(pg);
		// System.out.println(cp);
		// System.out.println(searchCheck);
		// System.out.println(searchKey);

		// DB parameter 로 보내는 map
		HashMap<String, String> map = new HashMap<String, String>();

		// vue로 내보내는 Map
		HashMap outputMap = new HashMap<>();

		int offset = Integer.parseInt(cp);

		if (offset == 1) {
			offset = 0;
		} else {
			offset = (offset - 1) * Integer.parseInt(pg);
		}

		if (searchCheck != null) {
			for (String Check : searchCheck) {

				map.put(Check, Check);

			}
		}
		map.put("searchKey", searchKey);
		map.put("pg", pg); // page 에 보여줄 갯수
		map.put("cp", Integer.toString(offset)); // 보여줄 페이지

		List<EmpDto> empList = empSercive.empListPage(map);
		outputMap.put("empList", empList);

		int count = empSercive.empListPageCount(map);
		int lastPage = count / Integer.parseInt(pg);
		// System.out.println(lastPage);

		if (count % Integer.parseInt(pg) > 0) {
			lastPage++;
		}
		// System.out.println(lastPage);
		ArrayList<Integer> page = new ArrayList<Integer>();

		for (int i = 1; i <= lastPage; i++) {
			page.add(i);
		}

		// System.out.println(page);

		outputMap.put("page", page);
		outputMap.put("lastPage", lastPage);

		return outputMap;
	}

}