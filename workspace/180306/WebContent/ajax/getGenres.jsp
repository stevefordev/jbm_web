<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="dao.GenresDAO"%>
<%@page import="vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Genre> genres = GenresDAO.selectList();
	//String json = new Gson().toJson(genres);
	
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(genres);
%> 
<%=json%>
		
	 