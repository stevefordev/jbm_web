<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>템플릿</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" 
integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" 
crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet">
<link rel="stylesheet" href="/css/template.css"/>
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
	color:#FF5722
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
</style>
</head>
<body>
<header id="header">
    <h1><a href="/">
        <i class="fab fa-java"></i> 아이돌 관리 애플리케이션
    </a>
    </h1>
    <nav id="gnb">
        <h2 class="screen_out">주요 메뉴</h2>
        <ul>
            <li><a href="/group">
                <i class="fab fa-grav"></i>
                그룹 목록</a>
            <li><a href="/idol/page/1">
            <i class="fas fa-user-astronaut"></i>
            아이돌 목록</a>
        </ul>
    </nav>
    <form action="/session" method="post">
    <input type="hidden" name="_method" value="DELETE" />
    <button class="btn logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
    </form>
</header>
<main id="main">
<div class="aux">

		<div id="loginBox">
			<h2>관리자 로그인</h2>
			<form action="/session" method="post">
				<fieldset>
					<legend class="screen_out">로그인 폼</legend>
					<label for="id" class="screen_out">아이디</label> <input type="text"
						autofocus required id="id" placeholder="아이디" title="아이디를 입력해주세요." />
					<label for="pwd" class="screen_out">비밀번호</label> <input
						type="password" required id="pwd" placeholder="비밀번호"
						title="비밀번호를 입력해주세요." />
					<!-- 메세지 출력 박스 -->
					<div id="msgBox"></div>
					<button id="loginBtn" title="로그인버튼">
						<i class="fas fa-sign-in-alt"></i> 로그인
					</button>
				</fieldset>
			</form>
		</div>
		
	</div>
</main>
<footer id="footer">&copy; 2018 ims.org</footer>
</body>
</html>