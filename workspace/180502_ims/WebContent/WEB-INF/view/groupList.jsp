<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 목록</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
#main ul {
	width: 95%;
	margin-top: 20px;
	overflow: hidden;
	text-align: center;
	padding-bottom: 15px;
	margin-left: auto;
	margin-right: auto;
	padding-right: 20px;
}

#main li {
	width: calc(33.33333333333% - 22px);
	height: 80px;
	border: 1px solid #424242;
	float: left;
	margin-left: 20px;
	margin-bottom: 20px;
	text-align: center;
	vertical-align: middle;
}

#main li>a {
	display: block;
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 30px;
	text-decoration: none;
	transition: .2s ease;
	position: relative;
	overflow: hidden;
}

#main li>a:hover {
	color: #FF5722;
	font-size: 34px;
	background: #424242;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

#main li>a>.no {
	position: absolute;
	background: #FF5722;
	color: #fff;
	width: 100px;
	height: 26px;
	font-size: 20px;
	text-align: center;
	line-height: 24px;
	transform: rotate(-45deg);
	left: -38px;
	z-index: 1;
	box-shadow: 0 0 4px #fff;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
	<h2>그룹 목록</h2>
	<ul>
		<c:forEach items="${list }" var="group">
			<li><a href="/group/${group.no}"><span
					class="no">${group.no }</span> ${group.name } </a></li>
		</c:forEach>
	</ul>
	<div class="box_btn">
		<a href="/group/register" class="btn"><i class="fas fa-pencil-alt"></i> 그룹 입력</a> <a href="/index" class="btn"><i class="fas fa-external-link-alt"></i> 메인페이지로
			이동</a>
	</div>
	<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
 
</body>
</html>



