<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>IMS</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
#main {
	width: 100%;
	background-image: url(img/bg.jpg),
		linear-gradient(180deg, #FAFAFA 91%, #F3F5F4);
	background-repeat: no-repeat;
	background-position: center bottom;
	background-size: contain;
	background-color: #FCFCFC;
	max-width: none;
}

#loginBox {
	width: 500px;
	height: 260px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -130px 0 0 -250px;
	z-index: 1;
	text-align: center;
}

#loginBox h2 {
	color: #FF5722
}

#loginBox input, #loginBtn {
	width: 450px;
	height: 50px;
	padding: 5px 10px;
	border: 1px solid #FF5722;
	font: 300 20px/50px "Noto Sans KR", sans-serif;
	margin: 4px auto;
	background: rgba(255, 255, 255, .1);
	color: #FF5722;
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
	background: rgba(255, 87, 34, .9);
	color: #fff;
}

#msgBox {
	font-size: 40px;
	color: #FF5722;
	text-shadow: 1px 1px #424242;
	margin: 5px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
	<c:if test="${loginAdmin == null }">
		<div id="loginBox">
			<h2>관리자 로그인</h2>
			<form action="/session" method="post">
				<fieldset>
					<legend class="screen_out">로그인 폼</legend>
					<label for="id" class="screen_out">아이디</label> <input type="text"
						autofocus required id="id" placeholder="아이디" name="id"
						title="아이디를 입력해주세요." /> <label for="pwd" class="screen_out">비밀번호</label>
					<input type="password" required id="pwd" name="password"
						placeholder="비밀번호" title="비밀번호를 입력해주세요." />
					<c:if test="${loginFail != null }">
						<!-- 메세지 출력 박스 -->
						<div id="msgBox">아이디나 비밀번호가 틀렸습니다.</div>
					</c:if>
					<button id="loginBtn" title="로그인버튼">
						<i class="fas fa-sign-in-alt"></i> 로그인
					</button>
				</fieldset>
			</form>
		</div>
	</c:if>
	<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
</body>
</html>
