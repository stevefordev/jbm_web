<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	if (id.equals("test") && pwd.equals("1234")) {
		//세션객체의 주요(!!!) 메서드
		session.setAttribute("user", id);
		//session.getAttribute(arg0);

	} else {
		session.setAttribute("user", null);
	}
	response.sendRedirect("index.jsp");
%>