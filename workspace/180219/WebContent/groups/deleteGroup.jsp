<%@page import="dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//유저에게 보여지는 페이지 아님

	// 파라미터의 자료형은 무조건 String
	// no 파라미터를 받음

	String noStr = request.getParameter("no");
	int result = GroupsDAO.delete(Integer.parseInt(noStr));
	
	// groupList.jsp 로 이동 : redirect 방식 이동
	response.sendRedirect("groupList.jsp");
%>