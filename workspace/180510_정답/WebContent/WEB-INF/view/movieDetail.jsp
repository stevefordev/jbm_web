<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>${movie.title } 상세 페이지</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
		<style>
			
	    #movieInfoBox {
            width:800px;
            min-height:260px;
            margin:auto;
            position: relative;
            top:30px;
            padding-top:100px;

        }

        #posterBox {
            width:236px;
            height:340px;
            position: absolute;
            top:13px;
            left:20px;
            border:2px solid #666;
            box-shadow:0 0 6px #333;
        }
        
        #posterBox img{
             width:236px;
             height:340px;
        }

        #movieInfoBox .header {
            width:500px;
            height:60px;
            position: absolute;
            left:282px;
            top:13px;
        }

        #movieInfoBox .header h3 {
            font-size:28px;
            font-weight:500;
            color:#333;
        }

        #movieInfoBox .header h4 {
            font-weight:300;
            font-size:19px;
            color:#666;
            margin-top:5px;
        }

        #infoDetailBox {
            width:400px;
            height:220px;
            position: relative;
            left:282px;
            bottom:23px;
        }

        #infoDetailBox dt {
            width:50px;
            float: left;
            margin-bottom:20px;
            margin-right:10px;
            font-size:17px;
            font-weight:500;
            color:#666;
            text-align: left;

        }
        #infoDetailBox dd {
            width:340px;
            float: left;
            margin-bottom:20px;
            font-size:17px;
            color:#555;
        }


        #gradeBox strong {
            font-size:21px;
            font-weight:500;
            color:#333;
        }
        #gradeBox span {
            font-size:17px;
            color:#666;
        }

        #writeReplyBox h3, #replyListBox h3 {
            text-align:  center;
            font-size:31px;
            font-weight:500;
            color:#555;
            margin-bottom:10px;
        }



        #giveGradeBox label {
            font-size:32px;
            font-weight:bold;
            color:#FF2E3A;
            text-shadow: 0 0 1px #333;
            height:55px;
            display: block;
            line-height:55px;
        }


        #giveGradeBtnBox button {
            width:12px;
            height:20px;
            border:none;
            padding:0;
            margin:0;
            float: left;
            cursor: pointer;
            background:transparent;
        }




        .box_btn{
            width:800px;
            height: 40px;
            margin:60px auto;
            position: relative;

        }
        .box_btn>.btn{
            position: absolute;

        }
        .box_btn>.delete{
            right: 120px;
        }
        .box_btn>.update{
            right: 205px;
        }
        .box_btn>.list{
            right: 0px;
        }
        
        #maniaInfoBox{
            width: 80px;
            height: 90px;
            position: absolute;
            top:0;
            right: 0;
            font-size : 15px;
            color: rgba(85, 66, 187,.8);
        }
        #maniaInfoBox img{
        	display:block;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            margin:auto;
            vertical-align: middle;
        }
        
        #maniaInfoBox h4{
            text-align: center;
            font-size: 18px;
            margin-top:5px;
        }
        

						
		</style>
	</head>
	<body>
   <c:import url="/WEB-INF/view/template/header.jsp">
   <c:param name="cmd" value="movie"></c:param>
   </c:import>
		
				<div id="movieInfoBox">
					<div class="header">
						<h3>
						<i class="movie_rating
                       <c:choose>
                	<c:when test="${movie.rating=='G'}">
                	rating_all
                	</c:when>
                	<c:when test="${movie.rating=='Y'}">
                	rating_12
                	</c:when>
                	<c:when test="${movie.rating=='T'}">
                	rating_15
                	</c:when>
                	<c:otherwise>
                	rating_19
                	</c:otherwise>
                </c:choose>
                     "></i><!--//.movie_rating -->
                     
						 ${movie.title }(<fmt:formatDate value="${movie.releaseDate }" pattern="YYYY"/>)</h3>
						<h4>${movie.engTitle }</h4>
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
							<dd>
							<c:forEach items="${genres }" var="genre" >
								<c:forEach items="${haveGenres }" var="haveGenre">
									<c:if test="${genre.no eq haveGenre.genreNo}">
									${genre.name }
									</c:if>
								</c:forEach>					
							</c:forEach>
			
							</dd>
							<dt>개봉일</dt>
							<dd><fmt:formatDate value="${movie.releaseDate }" pattern="YYYY년 MM월 dd일"/> </dd>
							<dt>감 독</dt>
							<dd>${movie.director }</dd>
							<dt>출 연</dt>
							<dd>${movie.actors }</dd>
							<dt>줄거리</dt>
							<dd class="summary">${movie.summary }</dd>
						</dl>
					</div>
					<div id="maniaInfoBox">
					<img alt="${movie.nickname }" 
					src="/profile/${movie.profile }" />
					<h4>${movie.nickname }</h4>
					</div>
				</div><!-- movieInfoBox end -->
				<div class="box_btn">
				<c:if test="${movie.maniaNo==loginMania.no }">
		
			<a class="btn update" href="/movie/${movie.no}/update">
			<i class="fas fa-wrench"></i> 
			수정</a>
			<button form="form" class="btn delete"><i class="fas fa-pencil-alt"></i> 삭제</button>
			
			
		<form action="/movie/${movie.no }" method="post" id="form">
	<input type="hidden" name="_method" value="DELETE">
</form>	
</c:if>
<a href="/movie/page/1" class="btn list"><i class="fas fa-th-list"></i> 영화 리스트</a>	
</div>
	    <c:import url="/WEB-INF/view/template/footer.jsp"></c:import>		
		
	</body>
</html>
    