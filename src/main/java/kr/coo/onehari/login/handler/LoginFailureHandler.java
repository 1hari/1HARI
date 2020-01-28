package kr.coo.onehari.login.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kr.coo.onehari.login.service.LoginService;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	@Autowired	
	private LoginService loginService;
	
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
        int cnt=loginFailureCount(empNum);
        if(exception instanceof BadCredentialsException) {
            errormsg = "아이디 또는 비밀번호 " + cnt +"회 오류입니다. 다시 확인해주세요.";
        } else if(exception instanceof InternalAuthenticationServiceException) {
        	errormsg = "아이디 또는 비밀번호 " + cnt +"회 오류입니다. 다시 확인해주세요.";
        } else if(exception instanceof DisabledException) {
            errormsg = "계정이 비활성화되었습니다. 관리자에게 문의하세요.";
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = "비밀번호 유효기간이 만료 되었습니다. 관리자에게 문의하세요.";
        }
        System.out.println(errormsg);
//        defaultFailureUrl=request.getContextPath() + "/index.hari?error=" + errormsg;

		request.setAttribute(username, empNum);
		request.setAttribute(userpassword, password);
		//에러메세지 세팅
		request.setAttribute(errormsgname, errormsg);
//		response.sendRedirect(request.getContextPath() + "/index.hari?error=" + errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
	
	protected int loginFailureCount(String username) {
		//실패 카운트 증가
		loginService.countFailure(username);
		//현재 로그인 시도 횟수
		int cnt = loginService.checkFailureCount(username);
        if(cnt>=10) {
        	loginService.disabledUsername(username);
        }
        return cnt;
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
