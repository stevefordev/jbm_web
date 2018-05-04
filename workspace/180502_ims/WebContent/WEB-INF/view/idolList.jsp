<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록</title>
<link rel="stylesheet" href="/css/reset.css"/>
<style>
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
<h1>아이돌 목록</h1>
<ul>
<c:forEach items="${idols}" var="idol">	
	<li> 
	    <a href="/idolDetail.ims?no=${idol.no}">
	    ${idol.no}번
	    ${idol.name }
	    </a>
	</li>
</c:forEach>	
</ul>

${paginate }
<a href="/insertIdol.ims">아이돌 등록</a>
<a href="/index.ims">메인페이지로 이동</a>

</body>
</html>