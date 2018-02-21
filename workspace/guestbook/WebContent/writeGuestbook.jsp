<%@page import="org.jbm.guestbook.vo.Guest"%>
<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1. post 방식 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	//2. 넘어온 파라미터 얻기
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	
	//2.5 
	String ip = request.getRemoteAddr();
	
	//3. Guest객체 생성후 데이터 세팅
	Guest guest = new Guest(writer, contents, ip);
	
	//4. insert 구문 수행
	int result = GuestbookDAO.insert(guest);
	
	//5. index페이지로 리다이렉트
	response.sendRedirect("index.jsp");
%>