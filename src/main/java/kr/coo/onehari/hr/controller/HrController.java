package kr.coo.onehari.hr.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.service.EmpService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariHr/")
public class HrController {
	
	@Autowired
	private EmpService empservice;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;
	
	//근태관리 화면
	@RequestMapping("attendance.hari")
	public String attendance() {
		return "1hariHr.attendance";
	}
	
	//연차관리 화면
	@RequestMapping("annual.hari")
	public String annual() {
		return "1hariHr.annual";
	}
	
	//사원목록 김진호 2020. 1. 7
	@RequestMapping(value = "personnel/empList.hari", method = RequestMethod.GET)
	public String empList(Model model) {
		List<EmpDto> emplist = null;
		
		try {
			emplist = empservice.empList();
			model.addAttribute("emplist", emplist);
		} catch (Exception e) {
			System.out.println("사원목록 예외발생: " + e.getMessage());
			log.debug("사원목록 예외발생: " + e.getMessage());
		}
		return "1hariHr.empList";
	}
	
	// 사원등록 김진호 시작 2020. 1. 7 <> 완성 2020. 1. 10
	@RequestMapping(value = "personnel/empJoin.hari", method = RequestMethod.GET)
	public String empJoin() {
		
		return "1hariHr.empJoin";
	}
	
	// 사원등록 김진호 시작 2020. 1. 7 <> 완성 2020. 1. 10
	@RequestMapping(value = "personnel/empJoin.hari", method = RequestMethod.POST)
	public String empJoin(EmpDto empdto, Model model) {
		String view = "";
		int result =0;
		
		try {
			result = empservice.empJoin(empdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		empdto.setEmail(empdto.getEmail()+"@gmail.com"); // 이메일 형식붙여서 DB에 넣을 때
		
		if (result > 0) {
			view = "redirect:empList.hari";
			model.addAttribute("empdto", empdto);
		} else {
			view = "redirect:empJoin.hari";
			model.addAttribute("사원등록실패");
		}
		return view;
	}

	// 사원정보수정(화면)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.GET)
	public String empModify(int empNum, Model model) {
		EmpDto emp = null;
		
		try {
			emp = empservice.empModify(empNum);
			model.addAttribute("emp", emp);
		} catch (Exception e) {
			System.out.println("HrController empModify 예외발생: " + e.getMessage());
			log.debug("HrController empModify 예외발생: " + e.getMessage());
		}
		return "1hariHr.empModify";
	}

	// 사원정보수정(변경)
	@RequestMapping(value = "personnel/empModify.hari", method = RequestMethod.POST)
	public String empUpdate(EmpDto emp) {
		
		try {
			empservice.empUpdate(emp);
		} catch (Exception e) {
			System.out.println("HrController empUpdate 예외발생: " + e.getMessage());
			log.debug("HrController empUpdate 예외발생: " + e.getMessage());
		}
		return "redirect:empList.hari";
		/* return "redirect:empList.hari"; */
		/* return "redirect:personnel/empList.hari"; */
	}
	
	//User - 사원리스트 김정하 / 2020. 1. 12
	@RequestMapping("teamList.hari")
	public String teamList() {
		return "1hariHr.teamList";
	}
	
	@RequestMapping(value = "personnel/sendMail.hari", method = RequestMethod.POST)
	public void sendMail(HttpServletRequest req, Principal principal) {
		System.out.println("ajaxControllerAdmin sendMail() in!!!!!");
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
			
			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(velocityEngineFactoryBean.createVelocityEngine(), "emailTemplate.vm","UTF-8", model);
			messageHelper.setFrom("admin@dobee.com");
			messageHelper.setTo(mail);
			StringBuilder subject = new StringBuilder();
			subject.append(name);
			subject.append("님 DOBEE에 사원등록이 되었습니다.");
			messageHelper.setSubject(subject.toString());
			messageHelper.setText(mailBody,true);
			System.out.println("req.getContextPath()" + req.getContextPath());
			javaMailSender.send(message);
		} catch (Exception e) {
			log.debug("HrController sendMail 예외발생: " + e.getMessage());
		}
	}
}
