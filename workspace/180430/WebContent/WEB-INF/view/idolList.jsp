<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이돌 목록 페이지</title>
<style>
table, th, td {
	border: 1px solid #424242;
}
</style>
</head>
<body>
	<h1>아이돌 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>키</th>
				<th>무게</th>
				<th>생일</th>
				<th>그룹 번호</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="idol">
				<tr>
					<td>${idol.no }</td>
					<td>${idol.name }</td>
					<td>${idol.height }</td>
					<td>${idol.weight }</td>
					<td>${idol.birthDate }</td>
					<td>${idol.groupNo }</td>
					<td><a href="delete.html?no=${idol.no }">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>