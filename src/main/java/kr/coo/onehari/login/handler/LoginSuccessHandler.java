package kr.coo.onehari.login.handler;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler
		implements AuthenticationSuccessHandler {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		System.out.println(authentication.getName() + "     " + authentication.getAuthorities().toString());

		Enumeration params = request.getSession().getAttributeNames();
		while (params.hasMoreElements()) {
			String names = (String) params.nextElement();
			System.out.println(names + " : " + request.getParameter(names) + "<br>");
		}

		System.out.println("INFO : Skein-U202 - 로그인에 성공하였습니다.");

		request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");

		UserManager usermanager = sqlSession.getMapper(UserManager.class);
		HttpSession session = request.getSession();
		Member member = usermanager.getUser(authentication.getName());
		if (member.getMember_level() >= 2 && member.getMember_level() < 5) {
			MemberNN membernn = usermanager.getMemberNN(member.getMember_id());
			Location location = usermanager.getLocation(membernn.getLocation_no());
			session.setAttribute("Membernn", membernn);
			session.setAttribute("Location", location);
		}

		session.setAttribute("Member", member);

		if (session != null) {
			String redirectUrl = (String) session.getAttribute("prevPage");
			if (redirectUrl != null) {
				session.removeAttribute("prevPage");
				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
			} else {
				super.onAuthenticationSuccess(request, response, authentication);
			}
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
		/*
		 * String url = request.getContextPath(); response.sendRedirect(url);
		 */

	}

}