<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <c:import url="/WEB-INF/view/template/link.jsp"></c:import>
    <style>

        #content{
            width: 1000px;
            margin: auto;
			position:relative;
			padding-bottom:100px;
        }
        
        #content a{
            text-decoration: none;
            color: #ffffff;
        }
        #header h1.logo{
            height: 60px;
            width: 50px;
            /*background: red;*/
            position: absolute;
            left: 475px;
        }
/**/
        #content h2 {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            margin: 20px;
        }

        #joinBox {
            width: 600px;
            margin: auto;
            position: relative;
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
            font-family: 'Do Hyeon', sans-serif;
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
            background: #5542BB;
        }

        #profileRow {
        width:140px;
        height:140px;
        position: relative;
        margin:10px;
        }
        #profileRow input {
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
            background: #5542BB;
            color:#fff;
        }
        .box_btn{
            width: 330px;
            height: 40px;
            /*background: red;*/
            position: absolute;
            right: 0;
        }
       #joinBox input:focus{
            color: #8373dd;
            border: 1px solid #8373dd;
            outline: none;
        }
       #joinBox input:focus::placeholder{
            color: #8373dd;
        }
        #content h2 {
            font-size: 50px;
            font-weight: 700;
            color: #5542BB;
            margin: 20px;
            text-align: center;
        }
        
        .msg {
        	font-size:20px;
        	color:#E91E63;
        	text-align:center;
        }
        .msg.ok {
        	color:#2196F3;
        }

    </style>
</head>
<body>
<div id="header">
    <div class="aux">
        <h1 class="logo">
            <a href="/index">
                <img src="/img/logo.png"/>
            </a>
        </h1><!--.logo -->
    </div><!--//.aux -->
</div><!--//#header -->
<div id="content">
        <h2>회원가입 폼</h2>
        <div id="joinBox">
            <form method="post" action="/mania">
            <input id="profile" type="hidden" name="profile" />
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
                    <div class="id msg"></div>
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
                               name="password"/>
                    </div>
                    <div class="row">
                        <label class="label" for="confirm">비밀번호 확인</label>
                        <input type="password" id="confirm"
                               pattern="[\w]{4,32}"
                               required placeholder="위와 동일하게 입력"
                               title="위와 동일하게 입력"/>
                    </div>
                    <div class="row" id="profileRow">
                    <span class="label">프로필사진</span>
                    <div id="profileBox" class="fas fa-user-circle no_image">
                           <img src="" width="140" height="140" id="profileImg"/>
                           <label class="fas fa-camera">
                               <input type="file" name="upload" id="upload"/>
                           </label>
                           <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span></button>
                       </div>
                    </div>
                    <div class="box_btn">
                        <button class="btn" type="submit"><i class="fab fa-pinterest"></i> 회원가입</button>
                        <button class="btn" type="reset"><i class="fas fa-undo-alt"></i> 초기화</button>
                        <a class="btn" href="/index"><i class="fas fa-clipboard-list"></i> index으로</a>
                    </div>
                </fieldset>
            </form>
        </div><!--// joinBox -->
<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
<c:if test="${msg!=null}">
<script>
alert("${msg}");
</script>
</c:if>       
<script src="/js/jquery.js"></script>
<script>
	//입력폼
	var $joinForm = $("#joinBox form");
	//아이디 입력필드
	var $id = $("#id");
	//아이디 유효성검사
	var idReg = /^[a-z|A-Z|0-9]{4,20}$/;
	//아이디 메세지 출력 div
	var $idMsg = $(".id.msg");
	//아이디 체크 확인
	var idCheck = false;
	//파일 업로드 체크 확인
	var profileCheck = false;
	//업로드 필드(input type=file)
	var $upload = $("#upload");
	
	//파일이름(input type=hidden)
	var $profile = $("#profile");
	//업로드된 이미지 보여주는 img요소
	var $profileImg = $("#profileImg");
	
	var $profileBox = $("#profileBox");
	
	//id입력필드에서 포커스가 나가면
	$id.blur(checkId);
	 
	//업로드의 이미지가 변경되면
	$upload.change(uploadProfile);
	 
	//파일 업로드 함수
	function uploadProfile() {
		 
	     var data = new FormData();
	     
	    var file =  $upload.get(0).files[0];
	     
	    data.append('upload', file);
	   	data.append('folder','profile');
	   	data.append('size',160);

	     $.ajax({
	         url: '/ajax/upload',
	         type: "post",
	         dataType: "json",
	         data: data,
	         processData: false,
	         contentType: false,
	         success: function(json) {
	        	 
	        	 
	        	 $profile.val(json.name);
	        	 
	        	 $profileImg.attr("src","/profile/"+json.name);
	        	
	        	 profileCheck = true;
	        	 
	        	 $profileBox.removeClass("no_image");
	        	 
	         }, error: function(jqXHR, textStatus, errorThrown) {
	        	 
	        	 alert(textStatus);
	         }
	     });
	} 
	
	$(".delete").click(function() {
		$profileBox.addClass("no_image");
		$profile.val("");
		$upload.val("");
	   	 $profileImg.attr("src","");
	   	 profileCheck = false;
	});
	
	//아이디 중복검사 함수
	function checkId() {
	
		var id = $id.val();
		
		if(id.length>0 && idReg.test(id)) {
		
		$.ajax({
			url:"/ajax/mania/"+id,
			dataType:"json",
			type:"get",
			error:function() {
				$idMsg.attr("class","id msg ok").text(id+"는 사용해도 좋습니다.");
				idCheck = true;
			},
			success:function(json) {
				
				if(json) {
					$idMsg.attr("class","id msg").text(id+"는 존재하는 아이디입니다.");
					idCheck = false;
					$id.val("").focus();
				}
			}
		});
		
		}else {
			
			$idMsg.attr("class","id msg").text("형식에 맞게 입력해주세요.");
			idCheck = false;
			
		}
		
	}//checkId() end
	
	
	$joinForm.submit(function() {
		checkId();
		
		if(!profileCheck) {
			alert("프로필이미지를 선택해주세요~");
			return false;
		}
		
		if(!idCheck) {
			return false;
		}
		
	});
</script>
</body>
</html>