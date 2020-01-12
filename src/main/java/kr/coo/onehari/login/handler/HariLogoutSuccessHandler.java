package kr.coo.onehari.login.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;


public class HariLogoutSuccessHandler implements LogoutSuccessHandler{	

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
                             Authentication authentication) throws IOException, ServletException {
        if (authentication != null && authentication.getDetails() != null) {
            try {
                 System.out.println("request.getSession().getId(): " +  request.getSession().getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("index.hari");
    }
    
    

}