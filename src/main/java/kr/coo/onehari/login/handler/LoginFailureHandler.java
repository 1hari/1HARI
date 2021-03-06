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
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	private LoginService loginService;

	// HttpServletRequest 에서 저장되어 있는 파라미터 이름. input 태그 name
	private String username;
	private String userpassword;
	private String errormsgname;
	private String defaultFailureUrl;

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// getParameter로 아이디와 비밀번호 가져오기
		String empNum = request.getParameter(username);
		String password = request.getParameter(userpassword);
		String errormsg = null;
		int cnt = loginFailureCount(empNum);
		if (cnt != 0) {
			if (exception instanceof BadCredentialsException) {
				errormsg = "아이디 또는 비밀번호 " + cnt + "회 오류입니다. ,5회 오류 시 계정이 비활성화 됩니다.";
			} else if (exception instanceof InternalAuthenticationServiceException) {
				errormsg = "아이디 또는 비밀번호 " + cnt + "회 오류입니다. ,5회 오류 시 계정이 비활성화 됩니다.";
			} else if (exception instanceof DisabledException) {
				errormsg = "계정이 비활성화되었습니다. ,이메일 인증 후 비밀번호를 변경해주세요.";
			} else if (exception instanceof CredentialsExpiredException) {
				errormsg = "비밀번호 유효기간이 만료 되었습니다. 관리자에게 문의하세요.";
			}
		} else {
			if (exception instanceof BadCredentialsException) {
				errormsg = "존재하지 않는 사번입니다. ,관리자에게 문의해주세요.";
			} else if (exception instanceof InternalAuthenticationServiceException) {
				errormsg = "존재하지 않는 사번입니다. ,관리자에게 문의해주세요.";
			}
		}

		request.setAttribute(username, empNum);
		request.setAttribute(userpassword, password);

		// 에러메세지 세팅
		request.setAttribute(errormsgname, errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	protected int loginFailureCount(String username) {
		// 실패 카운트 증가
		loginService.countFailure(username);
		// 현재 로그인 시도 횟수
		int cnt = loginService.checkFailureCount(username);
		if (cnt >= 4) {
			loginService.disabledUsername(username);
		}
		return cnt;
	}
}
