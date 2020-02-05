package kr.coo.onehari.home.controller;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

import kr.coo.onehari.my.service.MyService;
import kr.coo.onehari.sign.service.SignService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private MyService myService;
	
	@Autowired
	private SignService signService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("/index.hari")
	public String index() {
		return "home.index";
	}
	
	//형남 0110 이메일인증
	@RequestMapping("/emailSubmit.hari")
	public String emailSubmit(@RequestParam("email") String email, Model model) {
			
			//1.이메일 보내기 위한 변수설정
			String host = "smtp.gmail.com"; //smtp 서버
			String subject = "1HARI HR SYSTEM 비밀번호 변경을 위한 인증메일 입니다."; //보내는 제목 설정
			String fromName = "1HARI"; //보내는 이름 설정
			String from = "2020.1hari@gmail.com"; //보내는 메일 계정
			String authNum = HomeController.authNum(); //인증번호
			String content = "<table class=\"body\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f4f7fb; width: 100%;\">"
							+ "<tbody>"
							+ "<tr>"
							+ "<td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>"
							+ "<td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; Margin: 0 auto !important;\">"
							+ "<div style=\"box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;\">"
							+ "<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #fff; border-radius: 3px; width: 100%;\">"
							+ "<tbody>"
							+ "<tr>"
							+ "<td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">"
							+ "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">"
							+ "<tbody>"
							+ "<tr>"
							+ "<td align=\"center\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">"
							+ "<img src=\"https://i.imgur.com/cAZKLW8.png\" title=\"Letter.png\"/>"
							+ "<h2><span style=\"color: #807266;\">1HARI HR SYSTEM</span></h2>"
							+ "<h3>비밀번호 변경을 위한 인증메일 입니다.</h3>"
							+ "<p>발송된 <b>인증코드</b>를 입력하면</p>"
							+ "<p>비밀번호 변경을 하실 수 있습니다.</p>"
							+ "<h2>인증코드 [" + authNum + "]</h2>"
							+ "<p>인증코드 보안에 유의해 주시기 바랍니다.</p>"
							+ "<table align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin: 24px auto; padding: 0; text-align: center;\">"
							+ "<tbody>"
							+ "<tr>"
							+ "<td align=\"center\">"
							+ "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
							+ "<tbody>"
							+ "<tr>"
							+ "<td align=\"center\">"
							+ "<img src=\"https://i.imgur.com/AddSkzb.gif\" title=\"Logo_1HaRi.gif\"/>"
							+ "</td></tr></tbody></table>"
							+ "</td></tr></tbody></table><br>"
							+ "<p style=\"font-size: 12px; color: #969faa; text-align: center\">"
							+ "본 메일은 발신전용입니다.<br>"
							+ "Copyright Ⓒ 1HARI All Right Reserved"
							+ "</p>"
							+ "</td></tr></tbody></table>"
							+ "</td></tr></tbody></table>";
			
			//2.SMTP 설정 및 메일보내기
			try {
				Properties props = new Properties();
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty ("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port","587");
				props.put("mail.smtp.user",from);
				props.put("mail.smtp.auth","true");
				
				Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
				    protected PasswordAuthentication getPasswordAuthentication(){
					    return new PasswordAuthentication(from, "admin1hari"); // gmail계정
				    }
				});
				
				Message msg = new MimeMessage(mailSession);
				InternetAddress []address1 = {new InternetAddress(email)};
				msg.setFrom(new InternetAddress
		                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
				msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
				msg.setSubject(subject); // 제목설정
				msg.setSentDate(new Date()); // 보내는 날짜 설정
				msg.setContent(content,"text/html; charset=utf-8"); // 내용설정
				
				Transport.send(msg); // 메일보내기
				
			}catch(Exception e){
				System.out.println("Email : " + e.getMessage());
			}
			model.addAttribute("authNum", authNum);
			
			return "etc.emailCheck";
		}
		//난수발생 함수
		public static String authNum() {
			Random ran = new Random();
			StringBuffer buffer = new StringBuffer();
			int num = 0;
			
			do {
				num = ran.nextInt(75)+48;
				if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					buffer.append((char)num);
				}else {
					buffer.append(num);
				}
			}while(buffer.length() < 10);
			
			return buffer.toString();
		}
	
	@RequestMapping("/main.hari")
	public String main(Model model, Principal principal) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		//System.out.println(code);
		
		String loginUser = principal.getName();
		
		map.put("loginUser", loginUser); //현재 로그인한 사번
		
		//진행중문서
		map.put("code", "1"); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서 / 5. 결재한 문서
		int count = signService.signPage(map);
		model.addAttribute("ongoing",count);
		//System.out.println("진행중 : " + count);
		
		//반려문서
		map.put("code", "3"); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서 / 5. 결재한 문서
		count = signService.signPage(map);
		model.addAttribute("reject",count);
		//System.out.println("반려 : " + count);
		
		//결재할문서
		map.put("code", "4"); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서 / 5. 결재한 문서
		count = signService.signPage(map);
		model.addAttribute("approve",count);
		//System.out.println("결재할: " + count);
		
		//완료문서
		map.put("code", "2"); //결재분류 : 0.전체 / 1.기안 / 2.완료 / 3.반려 / 4.결재할 문서 / 5. 결재한 문서
		count = signService.signPage(map);
		model.addAttribute("complete",count);
		//System.out.println("완료 : " + count);
		
		return "1hari.main";
	}
	
	@RequestMapping("/accessDenied.hari")
	public String accessDenied() {
		return "1hari.accessDenied";
	}
	
	//형남 0110 비밀번호 초기화, 변경
	@RequestMapping("/updatePassword.hari")
	public String updatePassword(@RequestParam("empNum") String empNum, @RequestParam("newPassword") String password) {
		try {
			password = bCryptPasswordEncoder.encode(password);
			myService.updatePassword(empNum, password);
		} catch (Exception e) {
			System.out.println("updatePassword 예외발생: " + e.getMessage());
			log.debug("updatePassword 예외발생: " + e.getMessage());
		}
		return "redirect: index.hari";
	}
	

}

