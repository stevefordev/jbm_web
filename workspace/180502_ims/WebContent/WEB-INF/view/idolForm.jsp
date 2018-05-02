<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 
<c:choose>
	<c:when test="${idol==null}">
		입력
	</c:when>
	<c:otherwise>
		수정
	</c:otherwise>
</c:choose>
폼</title>
</head>
<body>
	<h1>아이돌 
<c:choose>
	<c:when test="${idol==null}">
		입력
	</c:when>
	<c:otherwise>
		수정
	</c:otherwise>
</c:choose>
 페이지</h1>
	<form method="post">
	<c:if test="${idol!=null}">
		<input type="hidden"
		name="no" value="${idol.no }">
	</c:if>
		<fieldset>
			<legend>아이돌 
			<c:choose>
	<c:when test="${idol==null}">
		입력
	</c:when>
	<c:otherwise>
		수정
	</c:otherwise>
</c:choose>
			폼</legend>
			<p>
			<label>이름
			<input name="name"
			value="${idol.name }"/>
			</label>
			</p>
			<p>
			<label>키
			<input name="height"
			value="${idol.height }"/>
			</label>
			</p>		
			<p>
			<label>몸무게
			<input name="weight"
			value="${idol.weight }"/>
			</label>
			</p>
			<p>
			<label>생년월일(예:2018-5-2)
			<input name="birthDate"
			value="${idol.birthDate }"/>
			</label>
			</p>
			<p>
			<c:forEach items="${groups }"
			var="group">
			<label>
				<input type="radio"
				name="groupNo" 
				<c:if test="${idol.groupNo==group.no}">
				checked
				</c:if>
				value="${group.no }">
				${group.name }
			</label>
			</c:forEach>
			</p>
			<button>아이돌
			<c:choose>
				<c:when test="${idol==null}">
					입력
				</c:when>
				<c:otherwise>
					수정
				</c:otherwise>
			</c:choose>
</button>		
		</fieldset>
	</form>
	<c:choose>
	<c:when test="${idol==null}">
<a href="/idolList.ims">아이돌 목록으로 이동</a>
	</c:when>
	<c:otherwise>
<a href="/idolDetail.ims?no=${idol.no}">상세페이지로 이동</a>
	</c:otherwise>
</c:choose>
	
</body>
</html>