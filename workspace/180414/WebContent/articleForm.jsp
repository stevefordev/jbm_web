<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>게시글쓰기</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
<style>

#formBox {
	width:800px;
	margin:auto;
}

#formBox p {
	margin:10px 0;
}

#formBox label {
	display:inline-block;
	width:60px;
	text-align: right;
	font-size:22px;
	font-weight:bold;
	margin-right:6px;
	vertical-align: top;
	line-height: 39px;
}

#formBox input, #formBox textarea {
	font:21px 'kakao',sans-serif;
	border:1px solid #9E9E9E;
	padding:10px 8px;
}

#formBox input:focus,
#formBox textarea:focus {
	border-color:#14bab6;
	outline: 1px solid #14bab6;
	background:#F6F4FF;
}

#title {
	width:710px;
}

#contents {
	width:710px;
	height:400px;
	resize: none;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2>게시글쓰기</h2>
	<div id='formBox'>
		<!--서버로 데이터를 보내는 폼 -->
		<form action="write.html" method="post">
			<fieldset>
				<legend class="screen_out">글쓰기폼</legend>
				<p>
					<label for="title">제 목</label>
					<input type="text" id="title" name="title" placeholder="제목을 입력하세요"/>
				</p>
				<p>
					<label for="contents">내 용</label>
					<textarea cols="60" rows="5" name="contents"  placeholder="내용을 입력하세요"
					id="contents"></textarea>
				</p>
				<p class="box_btn">
					<button class="btn" type="submit">글쓰기</button>
					<button class="btn" type="reset">취 소</button>
					<a class="btn" href="/index.jsp">게시판으로</a>
				</p>
			</fieldset>
		</form>
	</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>
    