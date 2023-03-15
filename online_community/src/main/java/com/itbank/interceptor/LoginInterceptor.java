package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.itbank.model.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String url = request.getRequestURL().toString();
		String cpath = request.getContextPath(); 
		HttpSession session = request.getSession();
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		
		if(login == null) {
			response.sendRedirect(cpath += "/member/login?url=" + url);
			System.out.println("인터셉터");
			return false;
		}
		
		
		return true;
	}

	
	
}
