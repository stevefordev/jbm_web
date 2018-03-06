<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="dao.GenresDAO"%>
<%@page import="vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String name = request.getParameter("name");
  System.out.println(name);
  
  int result = GenresDAO.insert(name);
%>
<%=result%>

