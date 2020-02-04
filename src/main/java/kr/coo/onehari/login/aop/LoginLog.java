package kr.coo.onehari.login.aop;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class LoginLog {
	@After("execution(* kr.coo.onehari.login.handler.LoginSuccessHandler.onAuthenticationSuccess*(..))")
	public void beforeLoginLog(JoinPoint joinPoint) {
		HttpServletRequest req = null;
		Principal principal = null;
		
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpServletRequest) {
				req = (HttpServletRequest) o;
				
			}else if(o instanceof Principal) {
				principal = (Principal) o;
			}
		}
		
		System.out.println("접속ID : " + principal.getName() + " / 접속IP : " + req.getRemoteAddr());
		log.info("접속ID : " + principal.getName() + " / 접속IP : " + req.getRemoteAddr());
	}

}
