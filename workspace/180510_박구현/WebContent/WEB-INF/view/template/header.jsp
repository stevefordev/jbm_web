<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<div id="header">
    <div class="aux">
        <h1 class="logo">
            <a href="">
                <img src="/img/logo.png"/>
            </a>
        </h1><!--.logo -->
        <c:if test="${loginUser != null }">
	        <ul id="navList">
	            <li class="nav
				<c:if test="${navMovieOn }">
	            	on
				</c:if>
	            "><a href="/movie/page/1"> 영화</a></li>
	            <li class="nav
				<c:if test="${navGenreOn }">
	            	on
				</c:if>
	
	            "><a href="/genre"> 장르</a></li>
	        </ul><!--#naviList -->
	        <div id="loginBox">
	            <h2 class="screen_out">유저정보</h2>
	            <img src="/profile/${loginUser.profile }" width="60" height="60" alt="${loginUser.nickname }" title="${loginUser.nickname }"
	            onerror="this.src='/profile/default.png'" />
	            <form action="/session" method="post">
	            <input type="hidden" name="_method" value="DELETE"/>
	                <button class="btn"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
	                
	            </form>
	        </div><!--// loginBox  -->
        </c:if>        
    </div><!--//.aux -->
</div><!--//#header -->
<div id="content">
 