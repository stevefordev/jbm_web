<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@page import="org.jbm.guestbook.vo.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	//1. post 방식 한글 처리
	//filter
	
	//2. 넘어온 파라미터 얻기
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	String contents = request.getParameter("contents");
	
	contents = contents.replaceAll("<", "&lt;");
	contents = contents.replaceAll(">", "&gt;");	
	
	//2.5 
	String ip = request.getRemoteAddr();
	
	//3. Guest객체 생성후 데이터 세팅
	Guest guest = new Guest();
	guest.setContents(contents);
	guest.setIp(ip);
	guest.setNo(no);
	
	System.out.println(guest.toString());
	//4. insert 구문 수행
	int result = GuestbookDAO.update(guest);
	
	response.sendRedirect("index.jsp");
%>