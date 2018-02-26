<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<%--
	
	파일 업로드시
	1) post방식
	2) enctype을 
	   multipart/form-data로 변경
	
	
	
	※ enctype의 기본 : application/x-www-form-urlencoded
	
	 --%>
	<form method="post" 
	enctype="multipart/form-data"
	action="upload.jsp">
		<fieldset>
			<legend>회원가입폼</legend>
			<p>
				<input name="id"
				placeholder="아이디" />
			</p>
			<p>
				<input type="password"
				 name="password"
				placeholder="비밀번호" />
			</p>
			<p>
				<input name="nickname"
				placeholder="닉네임" />
			</p>
			<p>
				<input type="file"
				name="profile">
			</p>
			<p>
				<button>회원가입</button>
			</p>
		</fieldset>
	</form>	
</body>
</html>