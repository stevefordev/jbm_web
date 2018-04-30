<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>그룹 목록 페이지</title>
<style>
table, th, td {
	border: 1px solid #424242;
}
</style>
</head>
<body>
	<h1>그룹 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>그룹명</th>
				<th>데뷔일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="group">
				<tr>
					<td>${group.no }</td>
					<td>${group.name }</td>
					<td>${group.debutDate }</td>
					<td><a href="delete.html?no=${group.no }">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>