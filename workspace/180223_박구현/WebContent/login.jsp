<%@page import="com.jbm.phonebook.common.JConstants"%>
<%@page import="com.jbm.phonebook.dao.HostsDAO"%>
<%@page import="com.jbm.phonebook.vo.Host"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");

  Host host = new Host(id, pwd);

  String redirectPage = "index.jsp";

  Host loginUser = HostsDAO.selectLogin(host);
  if (loginUser != null) {
    System.out.println("set attri");
    session.setAttribute(JConstants.LOGIN_USER, loginUser);
    redirectPage = "main.jsp";

  } else {
    System.out.println("set attri error");
    session.setAttribute(JConstants.LOGIN_ERROR_MESSAGE, true);
  }

  response.sendRedirect(redirectPage);
%>