package com.ezen.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		
		List<String> roleNames = new ArrayList<String>();	
		
		auth.getAuthorities().forEach(auth2 -> roleNames.add(auth2.getAuthority()));

		log.warn("roleNames>>>>" + roleNames);
		
//		if(roleNames.contains("A")) {
//			response.sendRedirect("/test/admin");
//			return ;
//		}else if(roleNames.contains("B")){
//			response.sendRedirect("/test/member");
//			return ;
//		}
		
		response.sendRedirect("/book/bookMain");
	}

}
