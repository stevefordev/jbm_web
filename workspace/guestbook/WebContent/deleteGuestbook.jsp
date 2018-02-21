<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	int result = GuestbookDAO.delete(no);

	response.sendRedirect("index.jsp");
%>