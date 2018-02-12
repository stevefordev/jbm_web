package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 응답할 Content-Type 을 지정
		resp.setContentType("text/html; charset=UTF-8");

		// 응답용 객체 생성
		PrintWriter out = resp.getWriter();

		// Servlet 은 java 코드안에 html 을 삽입
		// JSP 는 html 안에 java 코드를 삽입

		// 클라이언트로 응답
		out.println("헤헤헤헤~~~~");

		System.out.println("후후~");
	} // HelloServlet() end

} 
 
