<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${movie.title } 상세 페이지</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
#movieInfoBox {
	width: 800px;
	min-height: 340px;
	margin: auto;
	position: relative;
	top: 30px;
	padding-top: 100px;
}

#posterBox {
	width: 202px;
	height: 290px;
	position: absolute;
	top: 13px;
	left: 20px;
	border: 2px solid #666;
	box-shadow: 0 0 6px #333;
}

#posterBox img {
	width: 202px;
	height: 290px;
}

#movieInfoBox .header {
	width: 300px;
	height: 60px;
	position: absolute;
	left: 262px;
	top: 13px;
}

#movieInfoBox .header h3 {
	font-size: 28px;
	font-weight: 500;
	color: #333;
}

#movieInfoBox .header h4 {
	font-weight: 300;
	font-size: 19px;
	color: #666;
}

#infoDetailBox {
	width: 400px;
	height: 220px;
	position: relative;
	left: 262px;
	bottom: 23px;
}

#infoDetailBox dt {
	width: 50px;
	float: left;
	margin-bottom: 20px;
	margin-right: 10px;
	font-size: 17px;
	font-weight: 500;
	color: #333;
	text-align: left;
}

#infoDetailBox dd {
	width: 340px;
	float: left;
	margin-bottom: 20px;
	font-size: 17px;
	color: #555;
}

#gradeBox strong {
	font-size: 21px;
	font-weight: 500;
	color: #333;
}

#gradeBox span {
	font-size: 17px;
	color: #666;
}

#writeReplyBox h3, #replyListBox h3 {
	text-align: center;
	font-size: 31px;
	font-weight: 500;
	color: #555;
	margin-bottom: 10px;
}

#giveGradeBox label {
	font-size: 32px;
	font-weight: bold;
	color: #FF2E3A;
	text-shadow: 0 0 1px #333;
	height: 55px;
	display: block;
	line-height: 55px;
}

#giveGradeBtnBox button {
	width: 12px;
	height: 20px;
	border: none;
	padding: 0;
	margin: 0;
	float: left;
	cursor: pointer;
	background: transparent;
}

.box_btn {
	width: 800px;
	height: 40px;
	margin: 60px auto;
	position: relative;
}

.box_btn>.btn {
	position: absolute;
}

.box_btn>.delete {
	right: 120px;
}

.box_btn>.update {
	right: 205px;
}

.box_btn>.list {
	right: 0px;
}

#maniaInfoBox {
	width: 110px;
	height: 90px;
	position: absolute;
	top: 0;
	right: 0;
	font-size: 15px;
	color: rgba(85, 66, 187, .8);
}

#maniaInfoBox span {
	text-align: center;
	vertical-align: middle;
	font-size: 15px;
}

#maniaInfoBox li {
	width: 110px;
	height: 60px;
}

#maniaInfoBox h2 {
	width: 110px;
	height: 20px;
	text-align: center;
	font-size: 18px;
	margin-bottom: 10px;
}

#maniaInfoBox img {
	width: 60px;
	height: 60px;
	border-radius: 30px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/view/template/header.jsp?date=180510"></c:import>
	
	<div id="movieInfoBox">
        <div class="header">
            <h3><i class="fa fa-youtube-play"></i>${movie.title }(<fmt:formatDate pattern="yyyy" value="${movie.releaseDate }" />)</h3>
            <h4>${movie.engTitle }(<fmt:formatDate pattern="yyyy" value="${movie.releaseDate }" />)</h4>
        </div><!-- .header end -->
        <div id="posterBox">
            <img src="/poster/${movie.poster }"
                 title="${movie.title }"
                 alt="${movie.title }"/>
        </div><!-- posterBox end -->

        <div id="infoDetailBox">
            <h4 class="screen_out">${movie.title } 상세 정보</h4>
            <dl>
                <dt>장 르</dt>
                <dd><c:forEach items="${genres }" var="genre">
                ${genre.name }
                </c:forEach></dd>
                <dt>개봉일</dt>
                <dd><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${movie.releaseDate }" /></dd>
                <dt>감 독</dt>
                <dd>${movie.director }</dd>
                <dt>출 연</dt>
                <dd>${movie.actors }</dd>
                <dt>줄거리</dt>
                <dd class="summary">${movie.summary }</dd>
            </dl>
        </div>
        <div id="maniaInfoBox">
            <ul id="maniaDetailBox">
                <li><span>${movie.maniaNickname}</span><img alt="${movie.maniaNickname }" src="/profile/${movie.maniaProfile }" /> </li>
            </ul>

        </div>
    </div><!-- movieInfoBox end -->

    <div class="box_btn">
	    <c:if test="${ loginUser.no == movie.maniaNo }">
	        <a class="btn update" href="/movie/${movie.no}/update">
	            <i class="fas fa-wrench"></i>
	            수정</a>
	        <button form="form" class="btn delete"><i class="fas fa-pencil-alt"></i> 삭제</button>
	     </c:if>
        <a class="btn list" href="/movie/page/1"><i class="fas fa-th-list"></i> 영화 리스트</a>
    </div>
	
	<c:import url="/WEB-INF/view/template/footer.jsp?date=180510"></c:import>
	<script src="/js/jquery.js"></script>
	<script>
		
	</script>
</body>
</html>