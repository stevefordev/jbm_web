<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 수정 폼</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/tui-date-picker.css">
<style>
#content {
	width: 1000px;
	margin: auto;
	margin-bottom: 20px;
}

#formBox .row {
	margin: 20px 0;
}

#formBox .label {
	display: inline-block;
	width: 100px;
	font-size: 22px;
	text-align: right;
	font-weight: 700;
	color: #757575;
	margin-right: 10px;
	vertical-align: top;
}

#content>h2 {
	color: #5542BB;
	font-size: 28px;
	font-weight: 900;
	margin-bottom: 10px;
	text-align: center;
}

#formBox {
	width: 600px;
	border: 1px solid #5542BB;
	margin: auto;
}

#director {
	width: 430px;
}

#formBox .row {
	margin: 20px 0;
}

#formBox input, #formBox textarea, #formBox select {
	font-size: 20px;
	outline: none;
	font-family: 'Do Hyeon', sans-serif;
	padding: 2px 5px;
	color: #757575;
}

#formBox textarea {
	vertical-align: top;
	resize: none;
	width: 430px;
}

#actors {
	height: 60px;
}

#summary {
	height: 80px;
}

#formBox input:focus {
	border-color: #8373dd;
}

#formBox select:focus {
	border-color: #8373dd;
}

#btnBox {
	padding: 10px 0;
	text-align: right;
	margin-right: 10px;
}

.genre.row label {
	font-size: 22px;
	font-weight: 700;
	color: #757575;
}

#wrapper .tui-datepicker {
	font-family: "맑은 고딕", sans-serif;
	z-index: 10000;
}

.tui-calendar td, .tui-calendar th {
	vertical-align: middle;
}

.list_genre {
	width: 430px;
	margin-left: 120px;
	margin-top: -40px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/view/template/header.jsp?date=180510"></c:import>
	<h2>영화 수정</h2>
	<div id="formBox">
		<form id="form" action="/movie" method="post">
			<input type="hidden" name="_method" value="PUT" />
			<input type="hidden" name="maniaNo" value="${loginUser.no }" />
			<fieldset>
				<legend class="screen_out">영화 수정 폼</legend>
				<div class="row">
					<label class="label" for="title">영화명</label> <input id="title"
						title="영화명을 입력해주세요" placeholder="영화명 입력" value="${movie.title }" name="title" pattern="[ㄱ-힣|0-9]{1,133}" required />
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="engTitle">영어이름</label> <input
						id="engTitle" title="영어 영화명을 입력해주세요"
						placeholder="영어 영화명 입력" name="engTitle" pattern="[\w]{1,400}" value="${movie.engTitle }" required />
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="director">감독</label> <input id="director"
						title="감독을 입력해주세요" placeholder="감독 입력" value="${movie.director }" name="director" required />
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="actors">배우들</label>
					<textarea id="actors" title="배우들을 입력해주세요" placeholder="배우들 입력"
						name="actors" required>${movie.actors }</textarea>
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="release_date">개봉일</label>
					<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
						<input type="text" id="datepicker-input" name="releaseDate"
							autocomplete="off" aria-label="Date-Time" required> <span
							class="tui-ico-date"></span>
					</div>
					<div id="wrapper" style="margin-top: -1px;"></div>
				</div>
				<!--//.row -->


				<div class="row genre">
					<h3 class="label">장르</h3>
					<div class="list_genre">
						<c:forEach items="${genres }" var="genre">
							<label class="item_genre"> <input type="checkbox" name="genre"
								value="${genre.no }" <c:forEach items="${selectedGenres }" var="selectedGenre">
									<c:if test="${genre.no == selectedGenre.no }">checked</c:if>
								</c:forEach>
								/> ${genre.name }
							</label>
						</c:forEach>
					</div>
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="movieRating">관람가</label> <select
						name="rating" id="movieRating" title="관람가능 연령을 선택해주세요">
						<option value="G" <c:if test="${movie.rating == 'G' }">selected</c:if>>전체관람가</option>
						<option value="Y" <c:if test="${movie.rating == 'Y' }">selected</c:if>>12세 관람가</option>
						<option value="T" <c:if test="${movie.rating == 'T' }">selected</c:if>>15세 관람가</option>
						<option value="A" <c:if test="${movie.rating == 'A' }">selected</c:if>>19세 관람가</option>
					</select>
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="state">개봉상태</label> <select id="state"
						title="관람가능 연령을 선택해주세요" name="state">
						<option value="S" <c:if test="${movie.state == 'S' }">selected</c:if>>개봉중</option>
						<option value="E" <c:if test="${movie.state == 'E' }">selected</c:if>>개봉 종료</option>
					</select>
				</div>
				<!--//.row -->
				<div class="row">
					<label class="label" for="summary">줄거리</label>
					<textarea id="summary" title="줄거리를 입력해주세요" placeholder="줄거리 입력"
						name="summary" required>${movie.summary }</textarea>
				</div>
				<!--//.row -->
				<div class="row" id="profileRow">
					<span class="label">포스터</span> <input type="file" id="poster"
						name="upload" value="${movie.poster }" />
				</div>
				<!--//.row -->
				<div id="btnBox">
					<button type="submit" class="btn" form="form">
						<i class="fas fa-save"></i> 영화 수정
					</button>					
					<a class="btn" href="">취소</a>
				</div>
			</fieldset>
		</form>

	</div>
	<!--//#formBox-->
	<c:import url="/WEB-INF/view/template/footer.jsp?date=180510"></c:import>
	<script src="/js/jquery.js"></script>
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src="/js/tui-date-picker.min.js"></script>
	<script>
		var datepicker = new tui.DatePicker('#wrapper', {
			<c:choose>
				<c:when test="${movie!=null }">
					date : new Date("${movie.releaseDate}"),				
				</c:when>
				<c:otherwise>
					date : new Date(),
				</c:otherwise>
			</c:choose>
			input : {
				element : '#datepicker-input',
				format : 'yyyy-MM-dd'
			},
			language : 'ko'
		});
		
		 var $form = $("#form");
		 var $poster = $("#poster");
		    
		    $(".item_genre>input").click(function() {
			var count = $(".item_genre>input:checked").length;
		    	
		    	console.log(count);
		    })
		    
		    $form.submit(function() {		    	
		    	var count = $(".item_genre>input:checked").length;		    	
		    	if(count==0) {
		    		alert("장르는 반드시 한개이상 선택해야 합니다!!");
		    		return false;
		    	}		    	
		    	var fileCount =  $("#poster")[0].files.length;
		    	
		    	if(fileCount==0) {
		    		alert("영화 포스터는 반드시 입력해야 합니다.");
		    		return false;
		    	}		    	
		    });
		    
		    $poster.on("change", function() {
		    	console.log('poster changed!');
		    	
		    	var data = new FormData();
		    	var file = $poster.get(0).files[0];
		    	data.append('poster', file);
		    	
		        $.ajax({
	                url: '/ajax/poster',
	                type: 'POST',
	                data: data,
	                cache:false,
	                processData: false,	                
	                contentType: false,	                	                
	                success: function(json){
	                    console.log("업로드 성공!!");
	                    //$('#pic').css('background-image', 'url("thumbs/' + json.src + '")');
	                }, error: function(jqXHR, textStatus, errorThrown) {
	                	console.log(textStatus);
	                }
	            });
		    });
	</script>
</body>
</html>