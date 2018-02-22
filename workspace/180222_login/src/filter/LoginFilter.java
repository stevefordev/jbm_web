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
import javax.servlet.http.HttpSession;

import vo.User;

@WebFilter("/*")
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("LoginFilter");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		
		User loginUser = (User) session.getAttribute("loginUser");

		String[] uris = { "guestbook.jsp", "mypage.jsp" };
		boolean isNeedForward = false;
		String uri = request.getRequestURI();
		for (String s : uris) {
			if (uri.indexOf(s) != -1) {
				isNeedForward = true;
				break;
			}
		}

		if (loginUser == null && isNeedForward) {
			System.out.println("isNeedForward");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(req, res);
		} else {
			chain.doFilter(req, res);
		}
	}
}
