<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>User Web Service</title>
<style>
h2 * {
	vertical-align: middle;
}
</style>

</head>
<body>
	<h1>놀라운 유저 웹서비스</h1>
	<c:choose>
		<c:when test="${loginUser==null}">

			<h2>로그인</h2>
			<form action="log.html" method="post">
				<fieldset>
					<legend>로그인폼</legend>
					<p>
						<input name="id" placeholder="아이디" />
					</p>
					<p>
						<input type="password" name="password" placeholder="비밀번호" />
					</p>
					<button>로그인</button>
				</fieldset>
			</form>
			<c:if test="${loginFail }">
				<script>
					alert("아이디 혹은 비밀번호가 틀렸습니다.");
				</script>
			</c:if>
		</c:when>
		<c:otherwise>

			<h2>
				<img src="/profile/${loginUser.profile}" width="50" height="50" />
				<span>손예진님 환영합니다.</span>
			</h2>
			<a href="log.html">로그아웃</a>
			<h3>멤버 목록</h3>
			<ul>
				<c:forEach items="${list }" var="user">

					<li><img src="/profile/${user.profile}" width="50" height="50" /> ${user.no } ${user.id } ${user.nickname }</li>
				</c:forEach>
			</ul>
		</c:otherwise>
	</c:choose>

</body>
</html>