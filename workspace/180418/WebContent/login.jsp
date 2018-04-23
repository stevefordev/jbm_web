<%@page import="org.jbm.board.vo.Member"%>
<%@page import="org.jbm.board.dao.MembersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	//SELECT구문
	
	Member member = new Member(id,pwd);
	
	Member xxx = MembersDAO.selectLogin(member);
	
	session.setAttribute("loginMember", xxx);

	String prevUrl = request.getHeader("referer");
	
	//리다이렉트로 index.jsp로
	response.sendRedirect(prevUrl);

%>