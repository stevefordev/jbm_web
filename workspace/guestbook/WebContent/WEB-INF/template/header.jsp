<%@page import="org.jbm.guestbook.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<div id="header">
	<h1>
		<a href="index.jsp"> <i class="fab fa-nintendo-switch"></i> 구현의
			방명록
		</a>
	</h1>
	<%
		if (loginUser == null) {
	%>
	<div id="loginBox">
		<form action="login.jsp" method="post">
			<fieldset>
				<legend class="screen_out">로그인폼</legend>
				<input name="id" placeholder="아이디" /> <input type='password'
					name="password" placeholder="비밀번호" />
				<button>로그인</button>
			</fieldset>
		</form>
	</div>
	<!-- //#loginBox -->
	<%
		} else {
	%>
	<div id="logoutBox">
		<strong><%=loginUser.getNickname() %> 님</strong> <a href="logout.jsp">로그아웃</a>
	</div>
	<!-- //#"logoutBox" -->
	<%
		}
	%>
</div>
<div id="content">