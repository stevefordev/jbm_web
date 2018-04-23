<%@page import="org.jbm.board.vo.Board"%>
<%@page import="org.jbm.board.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	Map<String, Object> map = new HashMap();
	
	String[] names = {"쯔위", "손예진"};
	
	map.put("names",names);
	
	List<Board> list = BoardDAO.selectListTest(map);
	
	for(Board board:list) {

%>
<%=board.getTitle() %>
<%} %>
