<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장르 리스트</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>
        #genreInputBox{
            width: 998px;
            margin: auto;
			border-bottom:1px dotted #5542bb;
        }
		#content h2 {
            font-size: 50px;
            font-weight: 700;
			color: #5542BB;
			margin: 20px;
            text-align: center;
		}
        #genreBox{
            width: 542px;
            height: 80px;
            font-size: 20px;
            position: relative;
            margin: auto;
            /*background-color: red;*/
            overflow: hidden;
        }
        #genreBox>input{
            width: 500px;
            height: 30px;
            font-family: 'Do Hyeon', sans-serif;
            font-size: 20px;
            padding: 10px 20px;
            border: none;
            border: 1px solid #e0e0e0;
            border-radius: 100px;
            position: absolute;
            left: 0;
            top: 15px;
            color: #8373dd;
			transition:.2s ease-out;
        }
        #genreBox>button{
            height: 30px;
            width: 30px;
            background-color:#ffffff;
            outline: 0;
            border: 0;
            font-size: 20px;
            position: absolute;
            right: 20px;
            top: 25px;
            color:#e0e0e0;
        }
        #genreBox>button:hover{
            color: #8373dd ;
            cursor: pointer;
        }
        #genreBox>input:focus+button{
            color: #8373dd;
        }
        #genreBox>input:focus{
            border: 1px solid #8373dd;
            outline: none;
        }
        #content{
            width: 1000px;
            margin: auto;
			padding-bottom:20px;
        }
        #content #genreList{
            overflow: hidden;
        }
        #content .genre{
            width: 235px;
            height: 80px;
            background-color: #EEEEEE;
            font-size: 18px;
            border: 1px solid #E0E0E0;
            float: left;
            margin-left: 10px;
            margin-bottom: 10px;
            /*margin-bottom: 10px;*/
            position: relative;
			text-align:center;
			line-height:80px;
        }
        #content .genre:hover{
            background-color: #EDE8F9;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        #content .no{
            padding: 1px 3px;
            font-size: 20px;
            font-weight: 600;
            vertical-align: middle;
            background-color: #5542bb;
            color: #ffffff;
        }
        #content .genre_title{
            font-weight: 500;
            font-size: 30px;
            color: #424242;
            /*background-color: yellow;*/
        }
        #content .genre_title>.title{
            vertical-align: middle;
        }
        #content .mania_nickname{
        	width:100px;
        	height: 20px;
        	display:block;
        	/*background: red;*/
        	color: rgba(85, 66, 187,.8);
        	position: absolute;
        	top:5px;
        	left:5px;
        	font-size:18px;
        	text-align: left;
        	line-height: 20px;
        }
        
        #content .delete{
           width: 30px;
            height: 30px;
            font-size: 18px;
            text-align: center;
            line-height: 28px;
            background-color: #BDBDBD;
            position: absolute;
            top: 8px;
            border-radius: 15px;
			transition:.1s ease-out;
			right:8px;
			opacity:.1;
			cursor: pointer;
        }
		#content .genre:hover .delete {
			opacity:1;
		}
        #content .delete:hover{
            background-color: #5542bb ;
			
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        #content .delete button{
            color: #ffffff;
            background:transparent;
            border:none;
            cursor: pointer;
        }
        
        .count_movie {
        	line-height:1em;
        	position:absolute;
        	bottom:5px;
        	right:5px;
        	color:#9E9E9E;
       	    font-size: 20px;
        }

    </style>
</head>
<body>
<c:import url="/WEB-INF/view/template/header.jsp">
<c:param name="cmd" value="genre"></c:param>
</c:import>
    <div id="genreInputBox">
        <h2>장르입력</h2>
        <form id="genreForm" action="/genre" method="post">
            <div id="genreBox">
                <input id="name" name="name" placeholder="장르를 입력하세요" autocomplete="off"/>
                <button id="registerBtn" title="입력"><i class="fas fa-keyboard"></i></button>
            </div><!--#genreBox -->
        </form><!--//#genreForm -->
    </div><!--//#genreInputBox -->
	<h2>장르 목록</h2>
    <ul id="genreList">
    <c:if test="${genres.isEmpty() }">
    	    <li class="genre">
            <h3 class="genre_title">
                <span class="title">장르없음</span>
            </h3><!--//.genre_title -->
        </li><!--//.genre -->
    </c:if>
<c:forEach items="${genres }" var="genre">
		<li class="genre">
            <h3 class="genre_title">
                <i class="no">${genre.no}</i>
                <span class="title">${genre.name}</span>
            </h3><!--//.genre_title -->
            <span class="mania_nickname">${genre.nickname }</span>
            <strong class="count_movie">${genre.movieCount }개</strong>
            <c:if test="${genre.maniaNo==loginMania.no }">
            <div class="delete">
            <form action="/genre" method="post">
	            <input type="hidden" name="_method" value="DELETE">
	            <input type="hidden" name="no" value="${genre.no }">
            <button title="삭제"><i class="fa fa-trash"></i></button>
            </form>
            </div>
            </c:if>
        </li><!--//.genre -->
</c:forEach>
     
    </ul><!--#genreList -->
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>

<c:if test="${msg!=null}">
<script>
	alert("${msg}");
</script>
</c:if>
<script>

	var $genreForm = $("#genreForm");
	var $name = $("#name");
	var genreReg = /^[ㄱ-힣]+$/;
	
	$genreForm.submit(function() {
		
		var name = $name.val().trim();
		
		if(name.length==0) {
			alert("장르명을 입력해주세요~");
			$name.val("").focus();
			return false;
		}
		
		if(!genreReg.test(name)) {
			alert("한글로 입력해주세요!");
			$name.val("").focus();
			return false;
			
		}
		
		
		return true;
	});
	
	
    var $form = $(".delete>form");
    $form.submit(function () {
        return confirm("정말로 삭제하시겠습니까?");
    })

</script>
</body>
</html>