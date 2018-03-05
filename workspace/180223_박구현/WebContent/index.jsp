<%@page import="com.jbm.phonebook.common.JConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>전화번호부</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/fontawesome-all.css" />
<link rel="stylesheet" href="css/notosanskr.css" />
<link rel="shortcut icon" href="img/favicon.png">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#intro {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	transition: .5s cubic-bezier(1, .01, .8, 1.16) .3s;
}

#loginBox {
	width: 1200px;
	height: 420px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -200px 0 0 -600px;
	z-index: 1;
	text-align: center;
}

#loginBox>h1 {
	font-weight: 900;
	font-size: 50px;
	color: #fff;
	margin-bottom: 20px;
}

#loginBox input, #loginBtn {
	width: 450px;
	height: 50px;
	padding: 5px 10px;
	border: 1px solid #fff;
	font: 300 20px/50px "Noto Sans KR", sans-serif;
	margin: 4px auto;
	background: rgba(255, 255, 255, .1);
	color: #fff;
	transition: .2s ease;
	position: relative;
	display: block;
}

#loginBox input:focus {
	background: rgba(255, 255, 255, .9);
	color: #333;
}

#loginBtn {
	cursor: pointer;
	display: inline-block;
	box-sizing: content-box;
}

#loginBtn:hover {
	background: rgba(200, 200, 200, .9);
	color: #424242;
}

#joinLink {
	width: 450px;
	height: 50px;
	padding: 5px 10px;
	font: 300 20px/50px "Noto Sans KR", sans-serif;
	margin: 4px auto;
	background: rgba(255, 255, 255, .1);
	color: #fff;
	transition: .2s ease;
	position: relative;
	display: block;
	text-decoration: none;
}

#joinLink:hover {
	background: rgba(255, 255, 255, .9);
	color: #333;
}

#videoContainer {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	overflow: hidden;
}

#videoContainer::after {
	content: "";
	width: 100%;
	height: 100%;
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	background: rgba(0, 0, 0, .5);
}

#videoContainer>video {
	min-width: 100%;
	min-height: 100%;
}

/* 메세지 출력*/
#msgBox {
	margin: 10px;
	position: relative;
	text-align: center;
	color: #fff;
	font-size: 21px;
	font-weight: 900;
}
</style>
</head>
<body>
	<div id="intro">
		<div id="loginBox">
			<h1>
				<i class="fab fa-studiovinari"></i> 멋진 전화번호부
			</h1>
			<form action="login.jsp" method="post">
				<fieldset>
					<legend class="screen_out">로그인폼</legend>
					<label for="id" class="screen_out">아이디</label> 
					<input type="text" autofocus required id="id" name="id" placeholder="아이디" title="아이디를 입력해주세요." /> 
					<label for="pwd" class="screen_out">비밀번호</label>
					<input type="password" required id="pwd" name="pwd" placeholder="비밀번호" title="비밀번호를 입력해주세요." />
					<!-- 메세지 출력 박스 -->
					<%
						// 가산점 : 로그인 아이디 비밀번호가 틀릴 경우 login.jsp 에서 
						// 세션속성에 오류 정보를 세팅하고 index.jsp 로 리다렉트 되며
						// 오류 정보가 있다면 메시지 박스를 출력.
						System.out.println("ddd");
						Object sessionAttribute = session.getAttribute(JConstants.LOGIN_ERROR_MESSAGE);
						if (sessionAttribute != null && (boolean) sessionAttribute == true) {
							/* 가산점 : 새로고침하면 메시지가 사라지기 위해서 세션의 해당 속성을 삭제 */
							//session.removeAttribute(JConstants.LOGIN_ERROR_MESSAGE);
					%>
					<div id="msgBox">아이디나 비밀번호가 틀렸습니다.</div>
					<%
						}
					%>
					<button id="loginBtn" title="로그인버튼">
						<i class="fas fa-map-signs"></i> 로그인
					</button>
				</fieldset>
			</form>
			<a id="joinLink" href="register.jsp"><i class="fab fa-pinterest"></i>
				회원가입</a>
		</div>
		<div id="videoContainer">
			<video autoplay loop id="video">
				<source src="video/loop.mp4" />
			</video>
		</div>
	</div>
</body>
</html>