<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>MODEL1 게시판</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<style>
		#content #articleList {
			width:1000px;
			margin:10px auto;
		}
		.article {
			border-bottom:1px solid #e6e7e7;
			margin:10px 0;
		}

		.article a {
			display: block;
			height:140px;
			position: relative;
		}
		.article a:hover {
			background: #e6e7e7;
		}

		.article .title {
			position: absolute;
			left:150px;
			line-height: 140px;
			font-size:24px;
			color:#676767;
			width:820px;
			white-space: nowrap;
			word-break: break-all;
			text-overflow: ellipsis;
			overflow: hidden;
		}

		.article a:hover .title {
			color:#14bab6;
			font-size:28px;
			font-weight:bold;
		}
		.article time {
			position: absolute;
			bottom:20px;
			right:20px;
			font-size:20px;
		}
		.article .hit {
			position: absolute;
			color:#9E9E9E;
			bottom:22px;
			left:150px;
		}
		.article .comment {
			position: absolute;
			right:20px;
			top:20px;
			font-size:20px;
			color:#14bab6;
		}
		.article .title span {
			vertical-align: middle;
		}
		.box_btn {
			width:1100px;
		}

		.no_article {
			text-align:center;
			font-size:28px;
			height:200px;
			line-height:200px;
		}
		.btn_like {
			position: absolute;
			left:200px;
			bottom:17px;
			width:90px;
			height: 30px;
			border:none;
			font-size:20px;
			background:transparent;
			cursor:pointer;
			border:none;
			color:#9E9E9E;
			line-height:30px;
			text-align: center;
		}
		.btn_like i {
			color:red;
			vertical-align:middle;
		}
		.btn_like .far {
			display:inline;
		}

		.btn_like.like .far {
			display:none;
		}
		.btn_like .fas {
			display:none;
		}

		.btn_like.like .fas {
			display:inline;
		}

		.num_like{
			font-size:18px;
			vertical-align:middle;
		}

	</style>
</head>
<body>
	<%@ include file="/WEB-INF/template/header.jsp" %>
	<h2>게시글 목록</h2>
	<p class="no_article">
	아직 게시글이 없습니다.
	</p>
	<ul id="articleList">
		<li class="article">
			<a href="article.jsp">
				<div class="card_user">
					<img src="profile/jw.jpg" width="100" />
					<strong>테스터</strong>
				</div>
				<h3 class="title">
				제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
				</h3>
				<time>20분 전</time>
				<strong class="comment"><i class="fa fa-comment"></i> 21222</strong>
				<span class="hit"><i class="fa fa-eye"></i> 100</span>
				<div class="btn_like">
					<i class="fas fa-heart"></i>
					<i class="far fa-heart"></i>
					<span class="screen_out">좋아요</span>
					<strong class="num_like">1000</strong>
				</div>
			</a>
		</li>
		<li class="article">
			<a href="article.html">
				<div class="card_user">
					<img src="profile/jw.jpg" width="100" />
					<strong>테스터</strong>
				</div>
				<h3 class="title">
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
					제목입니다.제목입니다.제목입니다.
				</h3>
				<time>20분 전</time>
				<strong class="comment"><i class="fa fa-comment"></i> 21222</strong>
				<span class="hit"><i class="fa fa-eye"></i> 100</span>
				<div class="btn_like">
					<i class="fas fa-heart"></i>
					<i class="far fa-heart"></i>
					<span class="screen_out">좋아요</span>
					<strong class="num_like">1000</strong>
				</div>
			</a>
		</li>
	</ul>
	<div class="paginate">
		<!-- 이전 페이지 이동 :  비활성 -->
		<span title="이전 페이지 없음"><i class="fa fa-chevron-left"></i></span>
		<!-- 이전 페이지 이동 :  활성 -->
		<a href='' title="이전 페이지로"><i class="fa fa-chevron-left"></i><span class="screen_out">이전 페이지</span></a>
		<!-- 페이지들 -->
		<a href="" title="1">1</a>
		<a href="" title="2">2</a>
		<strong title="현재 3페이지">3</strong>
		<a href="" title="4">4</a>
		<a href="" title="5">5</a>
		<!-- 다음 페이지 이동 :  활성 -->
		<a href='' title="다음 페이지로"><i class="fa fa-chevron-right"></i><span class="screen_out">다음 페이지</span></a>
		<!-- 다음 페이지 이동 :  비활성 -->
		<span title="다음 페이지 없음"><i class="fa fa-chevron-right"></i></span>
	</div><!--//paginate-->

	<div class="box_btn">
		<a href="articleForm.jsp" class="btn">글쓰기</a>
	</div>
	<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>
 