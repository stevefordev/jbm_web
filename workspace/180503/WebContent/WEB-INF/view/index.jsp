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
/*paginate css*/
.paginate {
	font-size:14px;
	text-align:center;
	height:34px;
	line-height:34px;
	font-weight:500;
	margin: 5px;
}

.paginate a, 
.paginate span,
.paginate strong{
	color:#616161;
	text-decoration:none;
	padding:6px 12px;
	border:1px solid transparent;
	transition:.1s ease;
}

.paginate span {
	color:#E0E0E0;
	border-color:#E0E0E0;
	cursor: not-allowed;
}

.paginate a:hover {
	background:#673AB7;
	border-color:#fff;
	font-weight:900;
	color:#fff;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.paginate strong {
	background:#311B92;
	border-color:#311B92;
	color:#fff;
	cursor: not-allowed;
	font-weight:900;
}

.paginate span.next,
.paginate span.prev {
	border-color:#E1E1E1;
	color:#E1E1E1;
	cursor:default;
	cursor:not-allowed;
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
			${paginate }
		</c:otherwise>
	</c:choose>

</body>
</html>