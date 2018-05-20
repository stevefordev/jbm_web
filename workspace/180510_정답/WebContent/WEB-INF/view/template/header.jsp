<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<div id="header">
    <div class="aux">
        <h1 class="logo">
            <a href="/movie/page/1">
                <img src="/img/logo.png"/>
            </a>
        </h1><!--.logo -->
        <ul id="navList">
            <li class="nav
            <c:if test="${param.cmd=='movie'}"> 
            on
            </c:if>
            "><a href="/movie/page/1"> 영화</a></li>
            <li class="nav
            <c:if test="${param.cmd=='genre'}"> 
            on
            </c:if>
            "><a href="/genre"> 장르</a></li>
        </ul><!--#naviList -->
        <div id="loginBox">
            <h2 class="screen_out">유저정보</h2>
            <img src="/profile/${loginMania.profile }" width="60" height="60" alt="${loginMania.nickname }" title="${loginMania.nickname }"/>
            <form action="/session" method="post">
            <input type="hidden" name="_method" value="DELETE" />
                <button class="btn"><i class="fas fa-sign-out-alt"></i> 로그아웃</button>
            </form>
        </div><!--// loginBox  -->
    </div><!--//.aux -->
</div><!--//#header -->
<div id="content">