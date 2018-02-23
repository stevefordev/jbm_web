 
<%@page import="org.jbm.guestbook.dao.UsersDAO"%>
<%@page import="org.jbm.guestbook.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");

	User user = new User(id, pwd);

	User loginUser = UsersDAO.selectLogin(user);

	session.setAttribute("loginUser", loginUser);
	
	response.sendRedirect("index.jsp");
%>

