<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>         
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화
    <c:choose>
    	<c:when test="${movie!=null }">
    	수정
    	</c:when>
    	<c:otherwise>
    	입력
    	</c:otherwise>
    </c:choose>
    폼</title>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <style>
        #content{
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

        #content>h2{
            color: #5542BB;
            font-size: 28px;
            font-weight: 900;
            margin-bottom: 10px;
            text-align: center;
        }
        #formBox{
            width: 600px;
            border: 1px solid #5542BB;
            margin: auto;
        }
        #director {
        	width:430px;
        }
        #formBox .row{
            margin: 20px 0;
        }
        #formBox input, #formBox textarea, #formBox select{
            font-size: 20px;
            outline: none;
            font-family: 'Do Hyeon', sans-serif;
			padding:2px 5px;
			 color: #757575;
        }
        
         #formBox textarea {
         	vertical-align: top;
         	resize:none;
         		width:430px;
         }
         
         #actors {
         
         	height:60px;
         	
         }
         #summary {
			height:80px;         
         }
        #formBox input:focus{
            border-color: #8373dd;
        }
        #formBox select:focus{
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
            font-family:"맑은 고딕",sans-serif;
            z-index:10000;
        }

        .tui-calendar td, .tui-calendar th {
            vertical-align: middle;
        }
        
        .list_genre {
        	width:430px;
        	margin-left:120px;
        	margin-top:-40px;
        }
        .item_genre {
        	display: inline-block;
        	width:130px;
        }
        #posterBox {
            width:236px;
            height:340px;
            text-align: center;
            font-size:140px;
            position: absolute;
            top:10px;
            left:120px;
            margin:0px;
            color: #ddd;
            border:1px solid rgb(169, 169, 169);
        }


        #posterBox label {
            width: 236px;
            height:340px;
            position: absolute;
            bottom:0;
            right:0;
            cursor: pointer;
        }
        
        #posterBox label:hover {
            background: rgba(0,0,0,.1);
        }

        #posterRow {
        	height:342px;
	        position: relative;
	        margin:10px;
        }
        
        #posterRow input {
        	display: none;
        }

        #posterImg {
            width:236px;
            height:340px;
            position: absolute;
            left:0;
            top:0;
        }

        #posterBox.no_image .delete {
            display: none;
        }
        
        #posterBox .delete {
            width:30px;
            height:30px;
            border-radius: 30px;
            text-align: center;
            line-height:30px;
            cursor: pointer;
            position: absolute;
            border: none;
            outline: none;
            right:8px;
            top:8px;
            background: #fff;
            display: block;
             box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }

    </style>
</head>
<body>
   <c:import url="/WEB-INF/view/template/header.jsp">
   	<c:param name="cmd" value="movie"></c:param>
   </c:import>
    <h2>영화  <c:choose>
    	<c:when test="${movie!=null }">
    	수정
    	</c:when>
    	<c:otherwise>
    	입력
    	</c:otherwise>
    </c:choose></h2>
    <div id="formBox">
    <form method="post" action="/movie" id="form">
    	<input type="hidden" name="poster" id="poster" value="${movie.poster }"/>
    <c:if test="${movie!=null }">
    	<input type="hidden" name="_method" value="PUT" />
    	<input type="hidden" name="no" value="${movie.no }"/>
    </c:if>
            <fieldset>
                <legend class="screen_out">영화  <c:choose>
    	<c:when test="${movie!=null }">
    	수정
    	</c:when>
    	<c:otherwise>
    	입력
    	</c:otherwise>
    </c:choose>폼</legend>
                <div class="row">
                    <label class="label" for="title">영화명</label>
                    <input id="title" required
                    name="title" value="${movie.title }"
                    pattern="[ㄱ-힣|0-9|\s|:]{1,133}"
                    title="영화명 한글로 입력해주세요" placeholder="영화명 입력"/>
                </div><!--//.row -->
                <div class="row">
                    <label class="label" for="engTitle">영어이름</label>
                    <input id="engTitle" required
                     name="engTitle" value="${movie.engTitle }"
                     pattern="[\w|\s]{1,400}"
                     title="영어 영화명을 입력해주세요" placeholder="영어 영화명 입력"/>
                </div><!--//.row -->
                <div class="row">
                    <label class="label" for="director">감독</label>
                    <input id="director" required
                     name="director" value="${movie.director}"
                     title="감독을 입력해주세요" placeholder="감독 입력"/>
                </div><!--//.row -->
                 <div class="row">
                    <label class="label" for="actors">배우들</label>
                    <textarea id="actors" required 
                     name="actors" title="배우들을 입력해주세요" placeholder="배우들 입력">${movie.actors }</textarea>
                </div><!--//.row -->
                <div class="row">
                    <label class="label" for="release_date">개봉일</label>
				                   <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
				        <input type="text" id="datepicker-input" name="releaseDate" autocomplete="off" aria-label="Date-Time">
				        <span class="tui-ico-date"></span>
				    </div>
				    <div id="wrapper" style="margin-top: -1px;"></div>
                </div><!--//.row -->
               
               
                <div class="row genre">
                    <h3 class="label">장르</h3>
                    <div class="list_genre">
                    <c:forEach items="${genres }" var="genre">
                    	<label class="item_genre">
                    	<input type="checkbox"
                    	
                    	 <c:forEach items="${haveGenres }" var="haveGenre">
                	<c:if test="${haveGenre.genreNo==genre.no }">
                		checked
                	</c:if>
                </c:forEach>
                    	
                    	 name="genre" value="${genre.no }" />
                    	${genre.name }
                    	</label>
                    </c:forEach>
                    </div><!--//.row -->
                </div><!--//.row -->
                <div class="row">
                    <label class="label" for="movieRating">관람가</label>
                    
                    <select name="rating" id="movieRating" title="관람가능 연령을 선택해주세요">
                        <option value="G" 
                    	<c:if test="${movie.rating=='G' }">
                    selected
                    </c:if>    
                        >전체관람가</option>
                        <option value="Y"
                        <c:if test="${movie.rating=='Y' }">
                    selected
                    </c:if>
                        >12세 관람가</option>
                        <option value="T"
                        <c:if test="${movie.rating=='T' }">
                    selected
                    </c:if>
                        >15세 관람가</option>
                        <option value="A"
                        <c:if test="${movie.rating=='A' }">
                    selected
                    </c:if>
                        >19세 관람가</option>
                    </select>
                </div><!--//.row -->
                <div class="row">
                    <label class="label" for="state">개봉상태</label>
                    <select name="state" id="state" title="관람가능 연령을 선택해주세요">
                        <option value="S"
                        <c:if test="${movie.state=='S' }">
                    selected
                    </c:if>
                        >개봉중</option>
                        <option value="E"
                        <c:if test="${movie.state=='E' }">
                    selected
                    </c:if>
                        >개봉 종료</option>
                    </select>
                </div><!--//.row -->
                 <div class="row">
                    <label class="label" for="summary">줄거리</label>
                    <textarea id="summary" required name="summary" title="줄거리를 입력해주세요" placeholder="줄거리 입력">${movie.summary }</textarea>
                </div><!--//.row -->
         
                 <div class="row" id="posterRow">
                    <span class="label">포스터</span>
                    <div id="posterBox" 
                    <c:if test="${movie==null }">
                   	 class="no_image"
                    </c:if>
                    >
                          <img 
                           <c:choose>
					    	<c:when test="${movie!=null }">
					    	src="/poster/${movie.poster }"
					    	</c:when>
					    	<c:otherwise>
					    	src="/poster/default.png"
					    	</c:otherwise>
					    </c:choose>
                           width="236" height="340" id="posterImg"/>
                          <label>
                              <input type="file" name="upload" id="upload"/>
                          </label>
                          <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
                      </div>
                  </div>
                <div id="btnBox">
                    <button class="btn" form="form">
             <i class="fas fa-save"></i> 영화 
             <c:choose>
    	<c:when test="${movie!=null }">
    	수정
    	</c:when>
    	<c:otherwise>
    	입력
    	</c:otherwise>
    </c:choose>
         </button>
         <c:if test="${movie==null}">
         <button type="reset" class="btn" form="form">
             <i class="fa fa-undo"></i> 리 셋
         </button>
         </c:if>
         <c:choose>
         	<c:when test="${movie!=null }">
         	 <a class="btn" href="/movie/${movie.no }">취소</a>
         	</c:when>
         	<c:otherwise>
         	 <a class="btn" href="/movie/page/1">
         	 <i class="fas fa-ban"></i>
         	 취소</a>
         	</c:otherwise>
         </c:choose>
        
                </div>
            </fieldset>
        </form>
            
    </div><!--//#formBox-->
    
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script>
var datepicker = new tui.DatePicker('#wrapper', {
	<c:choose>
	<c:when test="${movie!=null }">
	 		date: new Date("${movie.releaseDate}"),
	    	</c:when>
	    	<c:otherwise>
	    	 date: new Date(),
	    	</c:otherwise>
	    </c:choose>
    input: {
        element: '#datepicker-input',
        format: 'yyyy-MM-dd'
    },
    language:'ko'
});

var $form = $("#form");

//파일 업로드 체크 확인
var posterCheck = ${movie!=null};
//업로드 필드(input type=file)
var $upload = $("#upload");

//파일이름(input type=hidden)
var $poster = $("#poster");

//업로드된 이미지 보여주는 img요소
var $posterImg = $("#posterImg");

var $posterBox = $("#posterBox");

//업로드의 이미지가 변경되면
$upload.change(uploadPoster);
 
//파일 업로드 함수
function uploadPoster() {
	 
     var data = new FormData();
     
    var file =  $upload.get(0).files[0];
     
    data.append('upload', file);
   	data.append('folder','poster');
   	data.append('width',236);
   	data.append('height',340);

     $.ajax({
         url: '/ajax/upload',
         type: "post",
         dataType: "json",
         data: data,
         processData: false,
         contentType: false,
         success: function(json) {
        	 
        	 $poster.val(json.name);
        	 
        	 $posterImg.attr("src","/poster/"+json.name);
        	
        	 posterCheck = true;
        	 
        	 $posterBox.removeClass("no_image");
        	 
         }, error: function(jqXHR, textStatus, errorThrown) {
        	 
        	 alert(textStatus);
         }
     });
} 

$(".delete").click(function() {
	$posterBox.addClass("no_image");
	 $upload.val("");
	$poster.val("");
    $posterImg.attr("src","/poster/default.png");
   	posterCheck = false;
});
 
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
    	
    	
    	
    	if(!posterCheck) {
    		alert("영화 포스터는 반드시 입력해야 합니다.");
    		return false;
    	}
    	
    });
    
    
</script>
</body>
</html>