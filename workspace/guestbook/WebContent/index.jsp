<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.jbm.guestbook.vo.Guest"%>
<%@page import="java.util.List"%>
<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Guest> list = GuestbookDAO.selectList();

	//현재 온 사람의 ip
	String ip = request.getRemoteAddr();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>구현의 방명록</title>
<%@ include file="WEB-INF/template/link.jsp"%>
<style>
#content {
	/*마진겹침현상 제거*/
	overflow: hidden;
}

.box_btn, #guestList {
	width: 800px;
	margin: 20px auto;
}

.guest {
	min-height: 80px;
	border: 1px solid #673AB7;
	margin: 10px;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	position: relative;
	padding-bottom: 65px;
}

.guest.none {
	font-size: 40px;
	color: #673AB7;
	text-align: center;
	height: 150px;
	line-height: 150px;
	font-weight: bold;
	padding-bottom: 0px;
}

.guest>.btn {
	font-size: 20px;
	padding: 10px;
	position: absolute;
	top: 10px;
}

.delete {
	right: 10px;
}

.update {
	right: 86px;
}

.box_info {
	position: absolute;
	top: 10px;
	left: 10px;
}

.guest h3 {
	font-size: 26px;
	color: #9575CD;
	display: inline-block;
}

.guest h3 a {
	font-size: 28px;
	color: #673AB7;
	text-decoration: none;
}

.guest h3 a:hover {
	font-weight: bold;
	text-decoration: underline;
}

.guest time {
	font-size: 20px;
	color: #9575CD;
	vertical-align: bottom;
}

.contents {
	width: 750px;
	min-height: 100px;
	white-space: pre-wrap;
	/*
	영어는 띄어쓰기 하지 않으면 하나의 단어로 인식해서
	줄바꿈이 일어나지 않음
	*/
	word-spacingbreak: break-all;
	font-size: 24px;
	color: #512DA8;
	position: relative;
	left: 20px;
	top: 55px;
}
</style>
</head>
<body>
	<%@ include file="WEB-INF/template/header.jsp"%>
	<h2>
		<i class="far fa-clipboard"></i> 방명록
	</h2>

	<ul id="guestList">
		<%
			if (list.isEmpty()) {
		%>
		<li class="guest none"><i class="fas fa-bed"></i> 방명록 글이 없습니다</li>
		<%
			}
		%>

		<%
			for (Guest guest : list) {
		%>

		<li class="guest">
			<div class="box_info">
				<h3>
					<i class="fas fa-comment-alt"></i> <a
						href="http://<%=guest.getIp()%>/index.jsp"><%=guest.getWriter()%></a>
				</h3>
				<time>
					<i class="far fa-clock"></i>
					<%=guest.getRegdate()%>
				</time>
			</div>
			<p class="contents"><%=guest.getContents()%></p>
			<% if (ip.equals(guest.getIp())) { %>
			<a href="updateForm.jsp" title="수정폼으로 이동" class="btn update"><i
				class="fas fa-edit"></i> 수정</a> <a href="deleteGuestbook.jsp?no=<%=guest.getNo() %>"
			title="삭제하기" class="btn delete"><i class="fas fa-eraser"></i> 삭제</a>
			<%
				}
			%>
		</li>

		<%
			}
		%>



	</ul>
	<div class="box_btn">
		<a href="writeForm.jsp" class="btn"><i class="far fa-edit"></i>
			글쓰기</a>
	</div>
	<%@ include file="WEB-INF/template/footer.jsp"%>
</body>
</html>