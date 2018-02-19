<%@page import="vo.Idol"%>
<%@page import="dao.IdolsDAO"%>
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
	String groupNo = request.getParameter("groupNo");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	 
	Date birthDate = Date.valueOf(year + "-" + month + "-" + date);
 
	Idol idol = new Idol();
	idol.setNo(Integer.parseInt(no));
	idol.setName(name);
	idol.setWeight(Integer.parseInt(weight));
	idol.setHeight(Integer.parseInt(height));
	idol.setBirthDate(birthDate);
	idol.setGroupNo(Integer.parseInt(groupNo));
	
	IdolsDAO.update(idol);

	// idolList.jsp 로 리다이렉트
	response.sendRedirect("idolList.jsp");
%>