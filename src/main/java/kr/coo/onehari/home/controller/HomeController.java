package kr.coo.onehari.home.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;


@Controller
public class HomeController {
	
	@RequestMapping("index.hari")
	public String index() {
		return "home.index";
	}
	
	@RequestMapping("emailSubmit.hari")
	public String emailSubmit() {
			//1. 데이터 받기
			String email = "zzzsh789@naver.com";
			//System.out.println(email);
			
			//2.이메일 보내기 위한 변수설정
			String host = "smtp.gmail.com"; //smtp 서버
			String subject = "Eye-fi 인증 이메일입니다."; //보내는 제목 설정
			String fromName = "Eye-fi"; //보내는 이름 설정
			String from = "eyefi1920@gmail.com"; //보내는 메일 계정
			String authNum = HomeController.authNum(); //인증번호
			String content ="<table style='table-layout:fixed; width: 100%; height: 100%; margin: 0; font-weight: 400; margin: 0; text-align: left; padding: 0; Sans-serif;'>"
								+	"<tbody>"
								+	"<tr><td align='center'>"
								+	"<table  style='table-layout:fixed; width: 100%; max-width: 580px; border: 1px solid #e1e1e1; border-radius: 8px; text-align: left;'>"
								+	"<tbody><tr><td align='center' style='padding: 40px 0 45px;'>"
								+	"<a href='#' target='_blank' style='display:' rel='noreferrer noopener'>"
								+	"<img src='/image/logo-20B2AA.png' width='200' border='0' alt='1hari' loading='lazy'></a>"
								+	"</td></tr><tr><td align='center' style='padding-bottom: 24px;'>"
								+	"<img src='https://cdn.collabee.co/static/mail/20190402/partner_invite.png' width='100' height='126' border='0' style='display: block; margin: 0 auto;' loading='lazy'>"
								+	" </td></tr><tr><td align='center' style='font-size: 22px; font-weight: bold; line-height: 1.45; color: #222222; padding-bottom: 16px;'>"
								+	"</td></tr><tr><td align='center' style='font-size: 14px; line-height: 1.57; color: #222222;'>"
								+	"이제 협업은 훨씬 쉬워집니다.<br>"
								+	"메일 인증만 해주신다면!"
								+	"<b>1HARI</b> 가입을 위한 인증을 진행해 주세요.<br>"
								+	"인증을 완료하려면 아래 인증번호를 입력해주세요."
								+	"</td></tr><tr><td style='text-align: center; padding-top: 32px; padding-bottom: 66px;'>"
								+	"<h1>인증번호 ['" + authNum + "']</h1>"
								+	"</td></tr><tr><td align='center' style='font-size: 12px; line-height: 1.5; color: #888888; font-weight: normal; padding: 24px; background-color: #fafafa; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px'>"
								+	"본 메일은 발신전용입니다.<br>Copyright Ⓒ 1hari All"
								+	"Right Reserved"
								+	"</td></tr></tbody>"
								+	"</table>"
								+	"</td>"
								+ "</tr>" 
								+	"</tbody>" 
								+ "</table>";
			
			//3.SMTP 설정 및 메일보내기
			try {
				Properties props = new Properties();
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty ("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port","465");
				props.put("mail.smtp.user",from);
				props.put("mail.smtp.auth","true");
				
				Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
				    protected PasswordAuthentication getPasswordAuthentication(){
					    return new PasswordAuthentication(from,"rhksflwk11!"); // gmail계정
				    }
				});
				
				Message msg = new MimeMessage(mailSession);
				InternetAddress []address1 = {new InternetAddress(email)};
				msg.setFrom(new InternetAddress
		                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
				msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
				msg.setSubject(subject); // 제목설정
				msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
				msg.setContent(content,"text/html; charset=utf-8"); // 내용설정
				
				Transport.send(msg); // 메일보내기
				
			}catch(Exception e){
				System.out.println("Email : " + e.getMessage());
			}
			
			//4.발생시킨 난수 저장
//			request.setAttribute("authNum", authNum);
			
			//5.이동경로 설정
//			ActionForward forward = new ActionForward();
//			forward.setPath("/WEB-INF/views/emailCheck.jsp");
			
			return "1hari.main";
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
	
	@RequestMapping("main.hari")
	public String main() {
		return "1hari.main";
	}
	
	
}

