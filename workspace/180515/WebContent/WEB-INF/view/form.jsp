<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
label {
	width: 200px;
	display: block;
	float: left;
	display: block;
}

p {
	overflow: hidden;
}
</style>
</head>
<body>
	<form action="/movie" method="post">
		<input type="hidden" name="entTitle" value="SCORE" /> <input
			type="hidden" name="releaseDate" value="2017-10-19" /> <input
			type="hidden" name="state" value="E" /> <input type="hidden"
			name="director" value="맷 슈레이더" /> <input type="hidden" name="actors"
			value="한스 짐머, 대니 엘프만, 존 윌리엄스" /> <input type="hidden" name="rating"
			value="G" /> <input type="hidden" name="poster" value="score.jpg" />
		<input type="hidden" name="maniaNo" value="12" /> <input
			type="hidden" name="summary" value="아주 멋진 영화" />
		<fieldset>
			<legend>영화등록 폼</legend>
			<input type="text" name="title" placeholder="영화이름" />

			<p>
				<c:forEach items="${genres }" var="genre">
					<label> <input type="checkbox" name="genre"
						value="${genre.no }" /> ${genre.name }
					</label>
				</c:forEach>
			</p>


			<button>등록</button>
		</fieldset>

	</form>
</body>
</html>