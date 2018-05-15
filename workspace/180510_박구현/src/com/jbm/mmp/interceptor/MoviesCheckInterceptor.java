package com.jbm.mmp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.Intercepter;

public class MoviesCheckInterceptor implements HandlerInterceptor {
  /***
   * 컨트롤러 이전 리턴이 true 면 controller 의 메서드 호출 리턴이 false 면 controller 의 메서드 호출 안됨
   */
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    // TODO Auto-generated method stub
    System.out.println("movies 전처리");
     
    return HandlerInterceptor.super.preHandle(request, response, handler);
  }

  /***
   * 컨트롤러 이후
   */
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // TODO Auto-generated method stub
    //HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    
    // 영화 관련 페이지에서는 모두 헤더의 navlist 중 영화 글씨가 확대 될수 있도록 조치
    modelAndView.getModelMap().addAttribute("navMovieOn", true);
  }
}
