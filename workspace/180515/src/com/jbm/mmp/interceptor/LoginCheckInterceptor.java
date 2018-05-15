package com.jbm.mmp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.jbm.mmp.controller.ManiaController;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Object loginAdmin = request.getSession().getAttribute(ManiaController.LOGIN);
		
		if(loginAdmin==null) {//로그인 객체가 없음
			response.sendRedirect("/index");
			return false;
		}// if end
		
		return true;
		
	}//preHandle end
		
}//LoginCheckInterceptor end
