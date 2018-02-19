<%@page import="dao.IdolsDAO"%>
<%@page import="vo.Idol"%>
<%@page import="java.sql.Date"%>
<%@page import="vo.Group"%>
<%@page import="dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// post 방식의 한글 처리
	request.setCharacterEncoding("UTF-8");

	// 넘어온 파라미터 받음
	String name = request.getParameter("name");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	Date birthDate = Date.valueOf(year + "-" + month + "-" + date);
	
	String groupNo = request.getParameter("groupNo");
	
	// insert 구문 수행
	Idol idol = new Idol();
	idol.setName(name);
	idol.setHeight(Integer.parseInt(height));
	idol.setWeight(Integer.parseInt(weight));
	idol.setBirthDate(birthDate);
	idol.setGroupNo(Integer.parseInt(groupNo));
	 
	IdolsDAO.insert(idol);
	response.sendRedirect("idolList.jsp");
%>