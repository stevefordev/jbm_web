package com.jbm.mmp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.Intercepter;

public class LoginCheckInterceptor implements HandlerInterceptor {
  /***
   * 컨트롤러 이전 리턴이 true 면 controller 의 메서드 호출 리턴이 false 면 controller 의 메서드 호출 안됨
   */
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    // TODO Auto-generated method stub
    System.out.println("전처리");

    HttpSession session = request.getSession();

    if (session.getAttribute("loginUser") == null) {
      response.sendRedirect("/");
      return false;
    } else {
      // 로그인 됨
      return true;
    }

    // return HandlerInterceptor.super.preHandle(request, response, handler);
  }

  /***
   * 컨트롤러 이후
   */
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // TODO Auto-generated method stub
    HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
  }
}
