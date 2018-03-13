<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class='paginate'>
<span title="이전 페이지 없음"><i class="fas fa-caret-left"></i></span>
<strong title='현재 1페이지'>1</strong>
<a href='paginate.jsp?page=2' title='2'>2</a>
<a href='paginate.jsp?page=3' title='3'>3</a>
<a href='paginate.jsp?page=4' title='4'>4</a>
<a href='paginate.jsp?page=5' title='5'>5</a>
<a href='paginate.jsp?page=2' title='다음 페이지로'>
	<i class='fas fa-caret-right'></i><span class='screen_out'>다음 페이지</span>
</a>
</div>

</body>
</html>