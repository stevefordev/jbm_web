<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>게시글 보기</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
	<style>
		#contentsBox {
			width:1100px;
			border:1px solid #9E9E9E;
			margin:auto;
			font-size:22px;
			border-bottom:none;
		}
		#infoBox {
			width:1100px;
			height:160px;
			position: relative;
			border-bottom:1px solid #9E9E9E;
		}
		#no {
			font-size:26px;
			position: absolute;
			top:15px;
			left:-15px;
			background:#14BAB6;
			width:48px;
			height:40px;
			z-index:1;
			text-align: center;
			font-weight:bold;
			color:#fff;
			line-height:40px;
			box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
		#no::after {
			content:"";
			display: block;
			position: absolute;
			border-top:15px solid #0e8783;
			border-left:15px solid transparent;
		}
		#title {
			width:900px;
			position: absolute;
			font-size:28px;
			color:#676767;
			font-weight:bold;
			left:160px;
			top:60px;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow:hidden;
		}
		.card_user {
			left:30px;
			top:20px;
		}
		#regdate {
			position: absolute;
			bottom:12px;
			right:20px;
			font-size:17px;
		}
		#hit {
			position: absolute;
			top:15px;
			right:15px;
		}

		#contents {
			min-height: 500px;
			padding: 30px;
			white-space: pre-line;
			word-break: break-all;
		}
		.box_btn {
			height: 50px;
			border-top:1px solid #9E9E9E;
			padding:20px;
			position: relative;
		}

		#replyBox {
			width:1100px;
			margin:0 auto 20px auto;
			border:1px solid #9E9E9E;

		}
		#replyBox h3 {
			text-align: center;
			font-size:26px;
			margin:16px;
			font-weight:bold;
		}

		#formBox {
			width: 900px;
			height: 110px;
			margin:20px auto;
			position: relative;
		}
		#contentsField {
			width: 760px;
			min-height: 90px;
			padding: 10px;
			border: none;
			color: #333;
			resize: none;
			border:1px solid #9E9E9E;
			font: 19px "Noto Sans KR", "나눔고딕", nanumGothic, "맑은 고딕", malgunGothic, "돋움", dotum, sans-serif;
		}

		#contentsField:focus {
			border-color:#14BAB6;
			outline: 3px solid #14BAB6;
		}

		.box_btn  .btn_like {
			position: absolute;
			left: 20px;
			top: 20.5px;
			width:110px;
			height: 50px;
			border:none;
			font-size:30px;
			background:transparent;
			cursor:pointer;
			border:1px solid #9E9E9E;	
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
			font-size:22px;
			vertical-align:middle;
		}

		#formBox #writeBtn {
			position: absolute;
			right: 0px;
			width: 110px;
			height: 110px;
			padding: 0;
		}

		#replyListBox {
			width: 900px;
			margin: 20px auto;
		}

		#replyListBox ul {
			border-top: 1px solid #9E9E9E;
		}

		#replyListBox li {
			padding: 10px;
			min-height: 140px;
			border-bottom: 2px dotted #bbb;
			overflow: hidden;
			position: relative;
			padding-bottom: 20px;
		}

		#replyListBox .box_reply {
			width: 730px;
			min-height: 100px;
			/* 포지셔닝 컨텍스트 지정 */
			position: relative;
			padding-left: 20px;
			padding-top: 50px;
			left:130px;
			top:0;
		}

		#replyListBox .delete {
			font-size: 19px;
			font-weight: 500;
			position: absolute;
			top: 0;
			right: 0;
			background: #aaa;
			color: #fff;
			text-decoration: none;
			width:32px;
			height:32px;
			border-radius:16px;
			text-align: center;
			padding:0;
			line-height:36px;
		}

		#replyListBox .delete:hover {
			background: #14BAB6;
		}

		#replyListBox .comments {
			width: 680px;
			min-height: 70px;
			background: #b5f4f2;
			border-radius: 0 12px 12px 12px;
			padding: 10px;
			position: relative;
			color: #424242;
			white-space: pre-wrap;
			/* 단어를 브레이크 */
			word-wrap: break-word;
		}

		#replyListBox .box_reply .time {
			top: 26px;
			left: 20px;
			position: absolute;
			font-size: 15px;
		}

		#replyListBox .comments::before {
			content: "";
			display: block;
			position: absolute;
			left: -10px;
			top: 0;
			width: 0;
			height: 0;
			border-bottom: 10px solid transparent;
			border-right: 10px solid #b5f4f2;
		}

		.no_reply {
			text-align: center;
			font-size:22px;
			line-height:140px;
		}

	</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<h2>게시물 보기</h2>
<div id="contentsBox">
	<div id="infoBox">
		<dl>
			<dt class="screen_out">번호</dt>
			<dd id="no">1</dd>
			<dt class="screen_out">글쓴이정보</dt>
			<dd class="card_user">
				<img src="profile/jw.jpg" width="100" />
				<strong>테스터</strong>
			</dd>
			<dt class="screen_out">글쓴시간</dt>
			<dd>
				<time id="regdate">2018년 4월 10일 4시 32분 23.345초</time>
			</dd>
			<dt class="screen_out">조회수</dt>
			<dd id="hit">
				<i class="fa fa-eye"></i> 88
			</dd>
		</dl>
		<h3 id="title">제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.제목입니다.</h3>
	</div>
	<p id="contents">내용이 쭈욱 들어갑니다~~~</p>

	<div class="box_btn">
			<button class="btn_like">
			<i class="fas fa-heart"></i>
			<i class="far fa-heart"></i>
			<span class="screen_out">좋아요</span>
			<strong class="num_like">1000</strong>
			</button>
		<div id="boxBtn">
		<a href="updateForm.html" class="btn" id="modifyBtn">수 정</a>
		<a href="delete.html" class="btn" id="deleteBtn">삭 제</a>
		<a href="/index.jsp" class="btn">게시판으로</a>
		</div>
	</div>
</div>
<div id="replyBox">
	<h3><i class="fa fa-comment"></i> 댓글 10000개</h3>
	<div id="formBox">
	<form action="writeReply.html" method="post">	
		<textarea maxlength="140" id="contentsField" placeholder="새 글을 입력합니다."></textarea>
		<button id="writeBtn" class="btn">올리기</button>
	</form>
	</div><!--//formBox-->
<p class="no_reply">댓글이 아직 없습니다.</p>

		<div id="replyListBox">
			<ul>
				<li>
					<div class="card_user">
						<img src="profile/jw.jpg" width="100"/>
						<strong>테스터</strong>
					</div><!-- //card_user -->
			<div class="box_reply">
				<div class="comments">내용ㅇㅇ잉ㄹㅇ</div>
				<a href="deleteReply.html" class="btn delete">
					<i class="fas fa-times"></i>
					<span class="screen_out">삭제</span>
				</a>
				<time class="time" data-time="">10분 전</time>
			</div><!--//box_reply-->
		</li>
		<li>
			<div class="card_user">
				<img src="profile/jw.jpg" width="100"/>
				<strong>테스터</strong>
			</div><!-- //card_user -->
			<div class="box_reply">
				<div class="comments">내용ㅇㅇ잉ㄹㅇ</div>
				<a href="deleteReply.html" class="btn delete">
					<i class="fas fa-times"></i>
					<span class="screen_out">삭제</span>
				</a>
				<time class="time" data-time="">10분 전</time>
			</div><!--//box_reply-->
		</li>
		<li>
			<div class="card_user">
				<img src="profile/jw.jpg" width="100"/>
				<strong>테스터</strong>
			</div><!-- //card_user -->
			<div class="box_reply">
				<div class="comments">내용ㅇㅇ잉ㄹㅇ</div>
				<a href="deleteReply.html" class="btn delete">
					<i class="fa fa-times"></i>
					<span class="screen_out">삭제</span>
				</a>
				<time class="time" data-time="">10분 전</time>
			</div><!--//box_reply-->
		</li>
		<li>
			<div class="card_user">
				<img src="profile/jw.jpg" width="100"/>
				<strong>테스터</strong>
			</div><!-- //card_user -->
			<div class="box_reply">
				<div class="comments">내용ㅇㅇ잉ㄹㅇ</div>
				<a href="deleteReply.html" class="btn delete">
					<i class="fa fa-times"></i>
					<span class="screen_out">삭제</span>
				</a>
				<time class="time" data-time="">10분 전</time>
			</div><!--//box_reply-->
		</li>
		<li>
			<div class="card_user">
				<img src="profile/jw.jpg" width="100"/>
				<strong>테스터</strong>
			</div><!-- //card_user -->
			<div class="box_reply">
				<div class="comments">내용ㅇㅇ잉ㄹㅇ</div>
				<a href="deleteReply.html" class="btn delete">
					<i class="fa fa-times"></i>
					<span class="screen_out">삭제</span>
				</a>
				<time class="time" data-time="">10분 전</time>
			</div><!--//box_reply-->
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
</div><!--//replyListBox -->
</div><!--//replyBox-->
<%@ include file="/WEB-INF/template/footer.jsp" %>	
<script src="js/jquery.js"></script>

</body>
</html>
    