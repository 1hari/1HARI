package kr.coo.onehari.login.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;

import sun.misc.MessageUtils;

public class LoginFailureHandler {
	//HttpServletRequest 에서 저장되어 있는 파라미터 이름. input 태그 name
	private String username;
	private String userpassword;
	private String errormsgname;
	private String defaultFailureUrl;

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		//getParameter로 아이디와 비밀번호 가져오기
		String empNum = request.getParameter(username);
		String password = request.getParameter(userpassword);
        String errormsg = null;
        
        if(exception instanceof BadCredentialsException) {
            errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = "";
        } else if(exception instanceof DisabledException) {
            errormsg = "";
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = "";
        }

		request.setAttribute(username, empNum);
		request.setAttribute(userpassword, password);
		//에러메세지 세팅
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
