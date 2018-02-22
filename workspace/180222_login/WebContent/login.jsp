<%@page import="dao.UsersDAO"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	User user = new User(id, pwd);

	User loginUser = UsersDAO.selectLogin(user);

	session.setAttribute("loginUser", loginUser);
	
	response.sendRedirect("index.jsp");
%>

