<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="dao.GenresDAO"%>
<%@page import="vo.Genre"%>
<%@page import="java.util.List"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String noStr = request.getParameter("no");
  System.out.println(noStr);

  int result = GenresDAO.delete(Integer.parseInt(noStr));
%>
<%=result==1%>

