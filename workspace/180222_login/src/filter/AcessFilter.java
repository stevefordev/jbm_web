package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

public class AcessFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("AcessFilter");
		HttpServletRequest request = (HttpServletRequest) req;

		String[] uris = { "login.jsp", "logout.jsp" };

		String uri = request.getRequestURI();
		boolean isNeedChain = true;
		for (String s : uris) {
			if (uri.indexOf(s) != -1) {
				isNeedChain = false;
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(req, res);
				break;
			}
		}
		if (isNeedChain)
			chain.doFilter(req, res);
	}
}
