<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% if(session.getAttribute("loginUser")!=null) { %> 
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>템플릿</title>
<%@ include file="WEB-INF/template/link.jsp"%>
<style>
.row {
	width: 700px;
	margin: 20px auto;
}

#content label {
	font-size: 30px;
	display: inline-block;
	width: 100px;
	color: #673AB7;
	text-align: right;
	vertical-align: top;
}

#writer, #contents {
	margin-left: 10px;
	width: 550px;
	font: 30px 'Koverwatch', sans-serif;
	padding: 10px;
	color: #673AB7;
	outline: 1px solid #673AB7;
}

#writer:focus, #contents:focus {
	outline: 4px solid #673AB7;
	background: #EDE7F6;
}

#contents {
	height: 300px;
	resize: none;
}
</style>
</head>
<body>
	<%@ include file="WEB-INF/template/header.jsp"%>
	<h2>
		<i class="fas fa-pencil-alt"></i> 방명록 글쓰기
	</h2>
	<form method="post" action="writeGuestbook.jsp">
		<fieldset>
			<legend class="screen_out">글쓰기폼</legend>

			<div class="row">
				<label for="contents">내용</label>
				<textarea id="contents" name="contents" placeholder="내용을 입력"></textarea>

			</div>
			<div class="row box_btn">
				<button type="reset" class="btn">
					<i class="fas fa-recycle"></i> 리 셋
				</button>
				<button type="submit" class="btn">
					<i class="far fa-edit"></i> 방명록 쓰기
				</button>
				<a href="index.jsp" class="btn"><i class="fas fa-align-justify"></i> 방명록으로</a>
			</div>
		</fieldset>
	</form>
	<%@ include file="WEB-INF/template/footer.jsp"%>
</body>
</html>

<%} else { 
	
	response.sendRedirect("index.jsp");
}%>


