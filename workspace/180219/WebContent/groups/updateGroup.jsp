<%@page import="java.sql.Date"%>
<%@page import="vo.Group"%>
<%@page import="dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// post 방식의 한글 처리
	request.setCharacterEncoding("UTF-8");

	// 넘어온 파라미터 받음
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");

	Date debutDate = Date.valueOf(year + "-" + month + "-" + date);
	// insert 구문 수행
	Group group = new Group();
	group.setNo(Integer.parseInt(no));
	group.setName(name);
	group.setDebutDate(debutDate);
	GroupsDAO.update(group);

	// groupList.jsp 로 리다이렉트
	response.sendRedirect("groupList.jsp");
%>