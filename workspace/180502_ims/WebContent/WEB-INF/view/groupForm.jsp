<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 입력폼</title>
</head>
<body>
	<h1>그룹 입력 페이지</h1>
	<form action="/insertGroup.ims" method="post">
		<fieldset>
			<legend>그룹 입력폼</legend>
			<p>
			<label>이름
			<input name="name"/>
			</label>
			</p>
			<p>
			<label>데뷔년월일(예:2018-5-2)
			<input name="debutDate"/>
			</label>
			</p>
			<button>등록</button>		
		</fieldset>
	</form>
	<a href="/groupList.ims">그룹 목록으로 이동</a>
</body>
</html>