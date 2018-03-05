package com.jbm.phonebook.servlet;
 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExamServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 응답할 Content-Type 을 지정
		resp.setContentType("text/html; charset=UTF-8");

		// 응답용 객체 생성
		PrintWriter out = resp.getWriter();

		// Servlet 은 java 코드안에 html 을 삽입
		// JSP 는 html 안에 java 코드를 삽입

		// 클라이언트로 응답
		out.println("<!DOCTYPE html>");
		out.println("<html lang='ko'>");		
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>헬로 서블릿</title>");
		out.println("</head><body>");
		
		out.println("<h2>안녕하세요? 박구현입니다.</h2>");
		out.println("<a href='main.jsp'>메인 페이지로</a>");
		
		out.println("</body></html>");
	} // HelloServlet() end

}