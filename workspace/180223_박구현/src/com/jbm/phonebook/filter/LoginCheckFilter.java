package com.jbm.phonebook.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.jbm.phonebook.common.JConstants;
import com.jbm.phonebook.vo.Host;

/***
 * .jsp 페이지에 한해서 로그인 여부에 따라서 필터링을 거쳐 허용 가능한 페이지로 이동
 * 
 * @author KUHYUN PARK
 *
 */
public class LoginCheckFilter implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    System.out.println("LoginCheckFilter Start");

    HttpServletRequest req = (HttpServletRequest) request;

    // 요청한 페이지 uri 를 호출
    String uri = req.getRequestURI();

    System.out.println(uri);

    // jsp 요청만 로그인 체크 필터 적용 이외(js,css,images ... 등은 제외)
    if (!uri.matches(".*(jsp)")) {
      chain.doFilter(request, response);
      return;
    }

    // 로그인한 유저인지 세션 속성에서 확인
    HttpSession session = req.getSession();
    Host host = (Host) session.getAttribute(JConstants.LOGIN_USER);

    // 로그인 여부 체크
    if (host == null) {
      // 비로그인 상태인 경우 이고
      // 요청한 주소가 index.jsp 와 login.jsp가 아닌경우
      if (uri.indexOf("index.jsp") == -1 && uri.indexOf("login.jsp") == -1) {

        // 비로그인 상태 일때는 항상 강제로 index.jsp 로 페이지 이동
        HttpServletResponse res = (HttpServletResponse) response;
        res.sendRedirect("index.jsp");
        return;
      }
    } else {
      // 로그인 한 상태인 경우 이고
      // 요청한 주소가 index.jsp 이거나 login.jsp 인 경우
      if (uri.indexOf("index.jsp") != -1 || uri.indexOf("login.jsp") != -1) {

        // 로그인 상태이므로 index.jsp or login.jsp 페이지 호출시 main.jsp 로 이동
        HttpServletResponse res = (HttpServletResponse) response;
        res.sendRedirect("main.jsp");
        return;
      }

      // update 와 register 는 get 방식으로 넘어가면 안되무로 필터링 처리
      if (uri.indexOf("update.jsp") != -1 || uri.indexOf("register.jsp") != -1) {
        if (req.getMethod().equalsIgnoreCase("GET")) {
          // 세션 오류속성을 생성 하고 main.jsp 로 이동
          // 메인페이지에서 세션의 요청 오류 속성 존재 여부에 따라서 메시지 처리
          session.setAttribute(JConstants.REQUEST_ERROR_MESSAGE, true);
          HttpServletResponse res = (HttpServletResponse) response;
          res.sendRedirect("main.jsp");
          return;
        }
      }
    } // if end


    chain.doFilter(request, response);
    System.out.println("LoginCheckFilter end");
    if (uri.indexOf("index.jsp") > -1) {
      session.removeAttribute(JConstants.LOGIN_ERROR_MESSAGE);
    }

  } // doFilter() end

} // LoginCheckFilter end
