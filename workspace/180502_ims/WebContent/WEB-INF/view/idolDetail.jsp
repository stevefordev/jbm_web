<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    
<c:if test="${idol==null }">
<%--
<c:redirect url="/idolList.ims"/>
 --%>
<script>
	alert("${param.no}(은)는 잘못된 아이돌번호입니다.");
	location.href="/idolList.ims";
</script>

</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${idol.name }의 상세 페이지</title>
</head>
<body>
<h1>${idol.name }의 상세정보</h1>
<dl>
	<dt>이름</dt>
	<dd>${idol.name }</dd>
	<dt>키</dt>
	<dd>${idol.height }</dd>
	<dt>몸무게</dt>
	<dd>${idol.weight }</dd>
	<dt>생년월일</dt>
	<dd>${idol.birthDate }</dd>
	<dt>그룹</dt>
	<dd>${idol.groupName }</dd>
</dl>
<a href="/updateIdol.ims?no=${idol.no}">수정</a>
<form action="/deleteIdol.ims" method="post">
	<input type="hidden"
	name="no" value="${idol.no }" />
	<button>삭제</button>
</form>
<a href="/idolList.ims">목록으로</a>
</body>
</html>