<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Movie Mania Paradise</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="icon" href="/img/favicon.png" />
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.12/css/all.css"
	integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9"
	crossorigin="anonymous">
<style>
html {
	height: 100%;
}

body {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 30px;
	font-weight: 200;
	color: #424242;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: #84CEFF;
	text-align: center;
}

#loginBox {
	width: 800px;
	height: 600px;
	background-image: url("img/popcorn.gif");
	position: absolute;
	left: 50%;
	top: 45%;
	background-repeat: no-repeat;
	margin: -300px 0 0 -400px;
	z-index: 1;
	vertical-align: middle;
	/*border: 1px solid #424242;*/
}

#loginBox>h1 {
	width: 800px;
	font-weight: bold;
	font-size: 50px;
	color: #5542bb;
	/*background: red;*/
	vertical-align: middle;
	position: absolute;
	top: 100px;
}

#loginBox>h1>img, #loginBox>h1>span {
	vertical-align: middle;
}

#loginBox input, #loginBtn {
	width: 230px;
	height: 30px;
	padding: 5px 10px;
	border: 1px solid #fff;
	font: 20px 'Do Hyeon', sans-serif;
	margin: 4px auto;
	background: rgba(255, 255, 255, .5);
	color: #969696;
	transition: .2s ease;
	display: block;
}

#loginBox input:focus {
	background: rgba(255, 255, 255, .9);
	color: #333;
}

#loginBtn {
	height: 76px;
	width: 76px;
	font-size: 20px;
	cursor: pointer;
	display: inline-block;
	box-sizing: content-box;
	position: absolute;
	right: 0;
	top: 0;
	border: none;
}

#loginBtn:hover, #joinLink:hover {
	background: #5542bb;
	color: #fff;
}

#joinLink {
	width: 340px;
	height: 30px;
	padding: 5px 10px;
	font: 20px 'Do Hyeon', sans-serif;
	margin: 4px auto;
	background: rgba(255, 255, 255, .5);
	color: #969696;
	transition: .2s ease;
	display: block;
	text-decoration: none;
	position: absolute;
	bottom: 5px;
	line-height: 30px;
}

#infoBox {
	width: 360px;
	height: 150px;
	position: absolute;
	bottom: 0;
	left: 220px;
}

div.login_box {
	position: absolute;
	left: 0;
}
</style>
<body>
	<div id="loginBox">
		<h1>
			<img width="50" src="img/logo.png" /> <span>영화 매니아 천국</span>
		</h1>
		<div id="infoBox">
			<form action="/session" method="POST">
			
				<fieldset>
					<legend class="screen_out">로그인폼</legend>
					<div class="login_box">
						<label for="id" class="screen_out">아이디</label> <input type="text"
							autofocus required name="id" id="id" placeholder="아이디"
							title="아이디를 입력해주세요." /> <label for="pwd" class="screen_out">비밀번호</label>
						<input type="password" required name="password" id="pwd"
							placeholder="비밀번호" title="비밀번호를 입력해주세요." />
					</div>
					<button id="loginBtn" title="로그인버튼">
						<i class="fas fa-map-signs"></i> 로그인
					</button>
				</fieldset>
			</form>
			<a id="joinLink" href="/mania/join"><i class="fab fa-pinterest"></i>
				회원가입</a>
		</div>
		<!--//infoBox -->
	</div>
	<!--//#loginBox -->

	<c:if test="${loginFail }">
		<script>
			alert("아이디나 비밀번호가 틀렸습니다. 다시 로그인해주세요.");
		</script>
	</c:if>
	<c:if test="${joinSucc }">
		<script>
			alert("회원가입에 성공하였습니다. 로그인해주세요.");
		</script>
	</c:if>
</body>
</html>