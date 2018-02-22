package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class TestFilter2 implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("초기화");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("죽음");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("전 처리2");
		
		//응답객체 인코딩 지정
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		//out.println("TestFilter2 전처리 printing");
		
		chain.doFilter(request, response);
		System.out.println("후 처리2");

	}
}
