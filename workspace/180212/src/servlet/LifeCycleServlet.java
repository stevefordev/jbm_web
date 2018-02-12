package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycleServlet extends HttpServlet {

	// 1. 기본생성자를 호출하여 생성
	public LifeCycleServlet() {
		System.out.println("태어났어요~");
	}

	// 2. 객체생성후 할일이 있으면 이곳에
	// init : initialize 의 줄임말
	@Override
	public void init() throws ServletException {
		System.out.println("초기화(준비)!");
	}

	// 3. 유저가 요청할때마다 작동
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		System.out.println("서비스");
		// GET 방식이면 doGet
		// POST방식이면 doPost 호출
	}

	// 4. 서버가 꺼지거나 refresh 될때
	// 죽임
	@Override
	public void destroy() {
		System.out.println("죽었어요 ㅜㅜ");
	}
}
