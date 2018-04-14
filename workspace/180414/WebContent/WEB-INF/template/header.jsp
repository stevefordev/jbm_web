<%@page import="org.jbm.board.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Member loginMember = 
	(Member)session.getAttribute("loginMember"); 

%>        
<div id="header">
	<h1><a href="/index.jsp"><img src="img/logo.png" width="40"/><strong>ODEL1</strong> Board</a></h1>
	<% if(loginMember!=null) { %>
    <div id="loginBox">
        <h2 class="screen_out">유저정보</h2>
        <img src="profile/jw.jpg" width="60" height="60" alt="테스터" title="테스터"/>
        <a href="logout.jsp" class="btn">로그아웃</a>
    </div><!--// loginBox  -->
    <%} else { %>    
	<%-- 로그아웃이 되어있으면 보여주는 박스 --%>
	<div id="logoutBox">
		<h2 class="screen_out">로그인</h2>
		<form action="login.jsp" method="post">
			<fieldset>
				<legend class="screen_out">로그인 폼</legend>
					<label for="id" class="screen_out">아이디</label>
					<input type="text" placeholder="아이디"
						   id="id" tabindex="1"
						   accesskey="i"
						   name="id"/>
					<label for="pwd" class="screen_out">비밀번호</label>
					<input type="password" accesskey="p"
						   placeholder="비밀번호"
						   id="pwd" name="pwd" tabindex="2" />
					<button class="btn" accesskey="l"
							tabindex="3" type="submit">로그인</button>
					<a href="joinForm.jsp" tabindex="4" accesskey="j"
					   class="join">회원가입</a>
			</fieldset>
		</form>
	</div><!--// logoutBox -->
	<%} %>
</div><!-- // header -->
<div id="content">
<div class="aux">