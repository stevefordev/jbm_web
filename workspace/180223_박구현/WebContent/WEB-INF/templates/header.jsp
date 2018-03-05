<%@page import="com.jbm.phonebook.vo.Host"%>
<%@page import="com.jbm.phonebook.common.JConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Host host = (Host)session.getAttribute(JConstants.LOGIN_USER);
%>

<div id="header">
	<div class="aux">
		<h1>
			<a href="main.jsp"><img src="profile/woosung.png" class="profile" /> 
			<span><%=host.getNickname() %>님의 전화번호부</span></a>
		</h1>
		<a href="logout.jsp" class="btn_logout"><i class="fas fa-sign-in-alt"></i>
			로그아웃</a>
	</div><!-- //.aux-->
</div>
<!-- //header -->
<div id="content">