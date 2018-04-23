<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<style>
    #header h1 {
        position: relative;
        margin: auto;
        width: 250px;
    }

    #content h2 {
        text-align: center;
        font-size: 32px;
        font-weight: bold;
        margin: 20px;
    }

    #joinBox {
        width: 600px;
        margin: auto;
    }

    #joinBox .row {
        margin: 20px 0;
    }

    #joinBox .label {
        width: 160px;
        display: inline-block;
        font-size: 21px;
        text-align: right;
        margin-right: 10px;
        color: #666;
        height: 20px;
        line-height: 20px;
    }

    #joinBox input {
        border: 1px solid #E1E1E1;
        width: 333px;
        height: 28px;
        font-size: 21px;
        font-family: 'bon', sans-serif;
        font-weight: 500;
        padding: 6px;
        color: #606060;
        transition: .2s ease;
    }

    #joinBox #profile {
        font-size: 15px;
        cursor: pointer;
        height: 30px;
    }

    #birthDate {
        display: inline-block;
        text-align: right;
    }

    #birthDate input {
        width: 70px;
    }

    #birthDate label {
        font-size: 21px;
    }

    #profileBox {
        width:140px;
        height:140px;
        text-align: center;
        font-size:140px;
        position: absolute;
        top:10px;
        left:250px;
        margin:0px;
        color: #ddd;
        border-radius: 140px;
    }

    #profileBox.no_image #profileImg {
        display: none;
    }

    #profileBox label {
        width: 40px;
        height:40px;
        position: absolute;
        bottom:4px;
        right:4px;
        background: #9E9E9E;
        font-size:20px;
        line-height:40px;
        text-align: center;
        border-radius: 40px;
        cursor: pointer;
        color:#fff;
        border:2px solid #fff;
    }
    #profileBox label:hover {
        background: #14bab6;
    }

    #profileRow {
        height:160px;
        position: relative;

    }

    #profile {
        display: none;
    }

    #profileImg {
        width:140px;
        height:140px;
        position: absolute;
        left:0;
        top:0;
        background: red;
        border-radius: 140px;
    }

    #profileBox.no_image .delete {
        display: none;
    }

    .delete {
        width:24px;
        height:24px;
        border-radius: 24px;
        text-align: center;
        line-height:24px;
        cursor: pointer;
        position: absolute;
        border: none;
        outline: none;
        right:8px;
        top:8px;
        background: #9E9E9E;
        display: block;
    }

    .delete:hover {
        background: #14bab6;
        color:#fff;
    }

</style>
<body>
<div id="header">
    <h1><a href="index.html"><img src="img/logo.png" width="40"/><strong>ODEL1</strong> Board</a></h1>
</div>
<div id="content">
    <div class="aux">
        <h2>회원가입 폼</h2>
        <div id="joinBox">
            <form method="post" action="">
                <fieldset>
                    <legend class="screen_out">회원가입폼</legend>
                    <div class="row">
                        <label class="label" for="id">아이디</label>
                        <input id="id" name="id"
                               placeholder="영어,숫자로 4~20자 입력"
                               title="영어,숫자로 4~20자 입력"
                               pattern="[\w]{4,20}"
                               required/>
                    </div>
                    <div class="row">
                        <label class="label" for="nickname">별 명</label>
                        <input id="nickname"
                               required pattern="[ㄱ-힣|0-9]{1,10}"
                               placeholder="10자 내로 한글,숫자 입력"
                               title="10자 내로 한글,숫자 입력"
                               name="nickname"/>
                    </div>
                    <div class="row">
                        <label class="label" for="pwd">비밀번호</label>
                        <input type="password" id="pwd"
                               required pattern="[\w]{4,32}"
                               placeholder="4~32자로 입력"
                               title="4~32자로 입력"
                               name="pwd"/>
                    </div>
                    <div class="row">
                        <label class="label" for="confirm">비밀번호 확인</label>
                        <input type="password" id="confirm"
                               pattern="[\w]{4,32}"
                               required placeholder="위와 동일하게 입력"
                               title="위와 동일하게 입력"/>
                    </div>
                    <div class="row">
                        <span class="label" for="birthDate">생년월일</span>
                        <p id="birthDate">
                            <label>
                                <input type="text" id="year" name="year"
                                       required pattern="[1-9]{1}[0-9]{3}"
                                       title="태어난 년도를 입력"
                                       placeholder="년"/>년</label>
                            <label>
                                <input type="text" id="month" name="month"
                                       required pattern="[0-9]{1,2}"
                                       title="태어난 월을 입력"
                                       placeholder="월"/>월
                            </label>
                            <label>
                                <input type="text" id="date" name="date"
                                       required pattern="[0-9]{1,2}"
                                       title="태어난 일을 입력"
                                       placeholder="일"/>일
                            </label>
                        </p>
                    </div>
                    <div class="row" id="profileRow">
                        <span class="label">프로필사진</span>
                        <div id="profileBox" class="fas fa-user-circle no_image">
                        <img src="profile/jw.jpg" width="140" height="140" id="profileImg"/>
                        <label class="fas fa-camera">
                            <input type="file" name="profile" id="profile"/>
                        </label>
                            <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
                        </div>
                    </div>
                    <div class="box_btn">
                        <button class="btn" type="submit">회원가입</button>
                        <button class="btn" type="reset">초기화</button>
                        <a class="btn" href="/index.jsp">index으로</a>
                    </div>
                </fieldset>
            </form>
        </div><!--// joinBox -->
<%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
</html>
    