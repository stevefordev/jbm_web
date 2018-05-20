<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화 리스트</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>

    
        #content{
            width: 1000px;
            margin: auto;
            position:relative;
            padding-bottom:30px;
        }
        #movieList{
            margin-top: 30px;
            overflow: hidden;
        }
        
        #movieList a {
        	color:transparent;
        }
        
        #listBox{
            width: 1000px;
            margin-bottom: 50px;
        }
        #listBox h2 {
            font-size: 50px;
            font-weight: 700;
            color: #5542BB;
            margin: 20px;
            text-align: center;
        }

        .audience_num strong {
            font-size:18px;
        }
        .release_date{
            position: absolute;
            right:10px;
            bottom: 10px;
            color: #BDBDBD;
            font-size: 15px;
        }


        #content .movie:hover .btn {
            opacity:1;
        }


        #content .btn:hover{
            cursor: pointer;
            background-color: #5542bb ;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        
        #content a{
            text-decoration: none;
        }


        #content #insert {
            position:absolute;
            bottom:10px;
            right:0;
        }

        #content #insert:hover {
            background:#5542BB;
            color:#fff;
        }

        /**/
        #listBox li{
            width: 236px;
            height: 450px;
            float: left;
            margin-left: 10px;
            margin-bottom: 30px;
            border: 1px solid #999999;
        }
        
        #listBox li>a{
            width: 236px;
            height: 450px;
            display: block;
            position: relative;
            overflow: hidden;
        }

        #listBox li>a>.summary{
            opacity: 0;
            width: 216px;
            height: 320px;
            background-color: #fff;
            position: absolute;
            left: 0;
            top:0;
            z-index: 1;
            transition: .3s ease;
            font-size: 16px;
            line-height:20px;
            color:#424242;
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap:break-word;
            padding:10px;
            text-align: justify;

        }

        #listBox li>a:hover>.summary {
        opacity: 1;

        }

        #listBox li>a:hover::after{
            opacity: 1;

        }
        #listBox li>a:hover{
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }
        #listBox .info_box{
            position: absolute;
            background-color: #ffffff;
            color: #eee;
            width: 234px;
            height: 100px;
            margin-top: 5px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            bottom:0;
        }



        #listBox li>a:hover .info_box{
            bottom: 0;
        }
        #listBox h3{
            text-align: center;
            font-size: 20px;
            color: #424242;
            margin-top: 20px;
        }
        /**/


        #gradeBox strong {
            font-size:21px;
            font-weight:500;
            color:#333;
        }
        #gradeBox span {
            font-size:17px;
            color:#666;
        }

        #gradeBox .grade_off {
            left:60px;
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
        .grade_box{
            width: 145px;
            height: 20px;
            margin: auto;
            position: relative;
            /*background-color: red;*/
            margin-top: 10px;
        }
        .grade_box span{
            width: 20px;
            height: 20px;
            /*background-color: yellow;*/
            position: absolute;
            right: 0;
            top:0;
            font-size: 20px;
            color: red;


        }
        .grade_off {
            width:120px;
            height:20px;
            background:url(img/grade.png);
            background-position:1px 0;
            position: relative;
        }

        .grade_on {
            width:59px;
            height:20px;
            background:url(img/grade.png);
            background-position: 1px -24px;
            transition:.2s ease;
        }
    </style>
</head>
<body>
    <c:import url="/WEB-INF/view/template/header.jsp">
    	<c:param name="cmd" value="movie"></c:param>
    </c:import>
    <%--
    <section id="searchBox">
        <form id="searchForm" action="" method="get">
            <fieldset>
                <legend class="screen_out">영화검색폼</legend>
                <div>
                    <input id="search" placeholder="검색할 영화를 입력하세요" autocomplete="off"/>
                    <button id="searchBtn"><i class="fa fa-search"></i></button>
                </div>

            </fieldset>
        </form>
    </section>
     --%>
    <section id="listBox">
        <h2>영화목록</h2>
        <ul id="movieList">
        <c:forEach items="${movies }" var="movie">
        
         <li>
                <a class="movie" href="/movie/${movie.no }">
                    <img src="/poster/${movie.poster }" alt="${movie.title }"/>
                    <div class="summary">${movie.summary }</div>
               
                <div class="info_box">
             
                    <h3> <i class="movie_rating
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
                        ${movie.title }</h3>
                    <div class="release_date">
                    <fmt:formatDate value="${movie.releaseDate}" pattern="YYYY.MM.dd"/>
                    <span>개봉</span></div>
                    
                </div>
                 </a>
            </li>
        </c:forEach>   
        </ul><!--#movieList -->
    </section>
	${paginate }
	<a id="insert" class="btn" href="/movie/register"><i class="fa fa-floppy-o"></i><i class="fas fa-save"></i> 영화등록</a>
	
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>