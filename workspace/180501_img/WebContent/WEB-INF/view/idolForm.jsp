<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 입력폼</title>
</head>
<body>
	<h1>아이돌 입력 페이지</h1>

	<form action="/test.ims" method="post">
		<fieldset>
			<legend>아이돌 입력폼</legend>
			<p>
				<label>이름 <input name="name" />
				</label>
			</p>
			<p>
				<label>키<input name="height" />
				</label>
			</p>
			<p>
				<label>몸무게 <input name="weight" />
				</label>
			</p>
			<p>
				<label>생일 <input name="birthDate" type="date"/>
				
				</label>
			</p>
			<p>
				<label>groupNo <input name="groupNo" type="number"/>
				</label>
			</p>
			<button>등록</button>
		</fieldset>
	</form>

	<a href="/idolList.ims">아이돌 목록</a>
	<a href="/index.ims">메인 페이지로 이동</a>

</body>
</html>