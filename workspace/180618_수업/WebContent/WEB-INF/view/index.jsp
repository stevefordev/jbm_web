<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓을 이용한 채팅 구현</title>
<link rel="stylesheet" href="css/reset.css" />
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Yeon+Sung&amp;subset=korean" rel="stylesheet">
<style>

html {
	overflow-y: scroll;
}

body {
	font:17px 'Do Hyeon', sans-serif;
	background:#F8F8F8;
}

#wrap {
	width:1200px;
	border:1px solid #4527a0;
	margin:auto;
	overflow: hidden;
}

#header {
	width:1200px;
	height:100px;
	border-bottom:1px solid #4527a0;
	background:#f8f8f8;
	top:0;
	z-index: 9;
}

#header h1 {
	font-size:60px;
	font-weight:900;
	line-height:100px;
	text-align: center;
	color:#4527a0;
}

#content {
	width:1200px;
	min-height:400px;
	position: relative;
}

#footer {
	border-top:1px solid #4527a0;
	width:1200px;
	height:100px;
	text-align: center;
	line-height:100px;
	font-weight:500;
	color:#4527a0;
	clear:both;
	
}
.btn {
	display:inline-block;
	border: 0;
	margin: 0;
	padding: 8px 14px;
	background: #ffc107;
	color: #424242;
	text-decoration: none;
	font-weight: bold;
	font: 500 17px 'Do Hyeon', sans-serif;
}

button.btn {
	cursor: pointer;
	font: bold 17px 'Do Hyeon', sans-serif;
}

.btn:hover {
	background: #c79100;
	box-shadow: 0 0 2px #333;
}



#nickname {
width: 300px;
font: 20px 'Do Hyeon', sans-serif;
}


#msg {
	width: 700px;
	font: 20px  'Do Hyeon', sans-serif;
	padding: 6px;
}

#chattingContentBox {
	width:950px;
	height: 600px;
	border-left: 1px solid #463A84;
	border-right: 1px solid #463A84;
	margin:auto;
	position: relative;
}

#userList {
	width:119px;
	border-right: 1px solid #463A84;
	height: 600px;
	position:absolute;
	left:0;
	top:0;
	overflow-y:scroll;
}
.user {
	width:89px;
	text-align: center;
	padding:5px;
}

.user.mine {
	background:#D1C4E9;
}

.user h3 {
	width:89px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	color:#5E35B1;
}

#chattingBox {
	width: 830px;
	height: 600px;
	position: absolute;
	overflow: hidden;
	right:0;
	top:0;
}

.box_form {
	width: 828px;
	height: 50px;
	position: absolute;
	bottom: 0;
	border-top: 1px solid #4527a0;
	line-height: 50px;
	text-align: center;
}

#chatList {
	width: 817px;
	height: 538px;
	overflow-y: scroll;
	background: #fff;
	box-shadow: 0 0 2px #333;
	margin: 6px;
}

#chatList ul li {
	padding: 8px;
}


#chatList .msg strong {
	font-weight: 500;
	color: #4527a0;
	font-size: 22px;
}

#chatList .card_user {
	left:10px;
	top:10px;
	position: absolute;
	text-align: center;
} 

#chatList .mine .card_user {
	left:auto;
	right:10px;
	top:10px;
}

.card_user img {
	display: block;
	margin:auto;
}

#chatList li {
	padding: 10px;
	min-height: 100px;
	overflow: hidden;
	position: relative;
	padding-bottom: 20px;
}

#chatList .box_reply {
	width: 680px;
	min-height: 80px;
	/* 포지셔닝 컨텍스트 지정 */
	position: relative;
	padding-left: 20px;
	padding-top: 50px;
	left:90px;
	top:0;
}
#chatList .mine .box_reply {
	padding-right: 20px;
	padding-top: 50px;
	left:-20px;
	top:0;
	text-align: right;
}

#chatList .comments {
font-family: 'Yeon Sung', cursive;
	font-size:22px;
	max-width: 660px;
	min-height: 25px;
	background: #b5f4f2;
	border-radius: 0 12px 12px 12px;
	padding: 6px 10px;
	position: relative;
	color: #424242;
	white-space: pre-wrap;
	/* 단어를 브레이크 */
	word-wrap: break-word;
	display: inline-block;
}

#chatList .mine .comments {
	border-radius: 12px 0px 12px 12px;
}

#chatList .box_reply .time {
	top: 26px;
	left: 20px;
	position: absolute;
	font-size: 15px;
}
#chatList .mine .comments::before {
	right:-10px;
	left:inherit;
	border:none;
	border-bottom: 10px solid transparent;
	border-left: 10px solid #b5f4f2;
}

#chatList .comments::before {
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

#chatList .ip {
	font-size:15px;
	color:#9575CD;
}

.msg span {
	color:#F44336;
}

img {
	width: 80px;
	height: 80px;
	border-radius: 40px;
	box-shadow: 0 0 4px #333;
}

#loginBox {
	width: 1200px;
	height: 600px;
	background: #4527a0;
	position: absolute;
	left: 0;
	top: 0;
	text-align: center;
	transition: .3s ease-in;
	z-index: 1;
}

#loginBox.off {
	top:800px;
}

#loginBox h2 {
	font-size:30px;
	color: #fff;
}

#loginBox .box_img {
	position: absolute;
	width: 1200px;
	top: 150px;
	overflow: hidden;
}

#loginBox .box_img img {
	margin: 10px;
	cursor: pointer;
}

#loginBox .box_img img.off {
	opacity: .3;
}

#loginBox .box_btn {
	position: absolute;
	width: 1200px;
	height: 100px;
	bottom: 100px;
}
#loginBtn {
	font-size:20px;
}

#loader {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	background: url(../img/loader.gif) no-repeat center;
	z-index: 100;
	background-color: rgba(255, 255, 255, .6);
	display: none;
}

#loader.show {
	display: block;
}


#closeBtn {
	position:absolute;
	right:10px;
	bottom:10px; 
}

</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1>웹소켓을 이용한 채팅</h1>
	</div><!-- //header -->
	<div id="content">
		<div id="chattingContentBox">
			<ul id="userList">
			</ul>
			<div id="chattingBox">
				<div id="chatList">
					<ul>
					</ul>
				</div><!-- //chatList -->
				<div class="box_form">
					<input type="text" name="msg" id="msg" />
					<button id="sendBtn" class="btn">보내기</button>
				</div><!-- //box_form -->
			</div><!-- //chattingBox -->
		</div><!-- //chattingContentBox -->
		<div id="loginBox">
			<div class="box_img">
				<h2>프로필 이미지 선택</h2>
				<img src="img/1.png" />
				<img src="img/2.png" />
				<img src="img/3.png" /> 
				<img src="img/4.png" />
				<img src="img/5.png" />
				<img src="img/6.png" />
				<img src="img/7.png" />
			</div><!--// "box_img" -->
			<div class="box_btn">
				<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력"/>
				<button class="btn" id="loginBtn">채팅시작</button>
			</div><!--// box_btn -->
		</div><!--// "loginBox" -->
		<button class="btn" id="closeBtn">채팅 종료</button>
	</div><!--// "content" -->
	<div id="footer">&copy;2018 jbm.com</div>
	<div id="loader"></div>
</div>

<%-- 임시 메세지 템플릿 --%>
<script type="text/template" id="tmp">
	<li>
	<div class="card_user">
		<img src="img/1.png" alt="테스트"/>
		<strong>테스트</strong>
	</div><!-- //card_user -->
	<div class="box_reply">
			<div class="comments"><@-msg@></div>
		<span class="ip">192.168.0.157</span>			
	</div><!--//box_reply-->
	</li>
</script>

<%-- 유저가 들어오는 템플릿 --%>
<script type="text/template" id="joinTmp">
<li class="msg">
	<img src="<@=user.profile@>" alt="<@=user.nickname@>" />
	<span><strong><@=user.nickname@></strong>님이 들어왔습니다.</span>
	<span class="ip"><@-user.ip@></span>
</li>
</script>

<%-- 유저가 나가는 템플릿 --%>
<script type="text/template" id="leaveTmp">
<li class="msg">
	<img src="<@-user.img@>" alt="<@-user.nickname@>" />
	<span><strong><@-user.nickname@></strong>님이 나갔습니다.</span>
</li>
</script>

<%-- 메세지 템플릿 --%>
<script type="text/template" id="msgTmp">
<li
<@ if(user.id==id) {@>
	class='mine'			
<@ } @>
>
	<div class="card_user">
		<img src="<@-user.profile@>" alt="<@-user.nickname@>"/>
		<strong><@-user.nickname@></strong>
	</div><!-- //card_user -->
	<div class="box_reply">
		<div class="comments"><@-user.msg@></div>
<@ if(user.id!=id) {@>
	<span class="ip"><@-user.ip@></span>		
<@ } @>
		</div><!--//box_reply-->
</li>
</script>

<%-- 유저 리스트 템플릿 --%>		
<script type="text/template" id="userListTmp">
<@ _.each(users,function(user){ @>
<li class="user
<@ if(user.id==myId) {@>
	mine			
<@ } @>
">
	<img src="<@=user.img@>"/>
	 <h3><@=user.nickname@></h3>
</li>
<@})@>
</script>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
	
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
	};
	
	//메세지 템플릿
	var msgTmp = _.template($("#msgTmp").html());
	
	//join할때 쓰는 템플릿
	var joinTmp = _.template($("#joinTmp").html());
	
	

	//채팅시작 버튼
	var $loginBtn = $("#loginBtn");
	//프로필 입력 창
    var $loginBox = $("#loginBox");
	//로딩이미지
    var $loader = $("#loader");
	//메세지 입력 input
    var $msg = $("#msg");
	//메세지 입력 버튼
	var $sendBtn = $("#sendBtn");
	//서버와 연결 끊는 버튼
	var $closeBtn = $("#closeBtn");
	//채팅리스트 ul
	var $chatList = $("#chatList ul");
	
	
    //ws객체
    var ws = null;
    
    //ws가 가진 메서드
    // 1) close() : 서버와 닫음
    // 2) send(msg) : 서버로 메세지 보내기
    
    
	//보내기 버튼을 클릭했을때    
    $sendBtn.click(sendMsg);
    
    $msg.keyup(function(e) {
    	
    	if(e.keyCode==13) {
    		sendMsg();
    	}//end
    	
    });//keyup();
    
    function sendMsg() {
    	
    	//유저가 입력한 msg를 얻어옴
    	var msg = $msg.val().trim();
    	
    	if(msg.length>0) {

    		var protocol = 
    			new Protocol(4,id,nickname,profile,msg,ip);
    		
    		//console.log(protocol);
    		
    		//ws.send(JSON.stringify(json));
    		
    		var json = JSON.stringify(protocol);
    		
    		//console.log(json);
    		
    		ws.send(json);

    	}//if end

    	//유저가 입력한 msg 지움
    	$msg.val("").focus();
    	
    }//sendMsg() end
    
    
    $closeBtn.click(function() {
    	//서버와 연결 끊음
    	ws.close();
    });//click() end
    
    
  	//프로필 사진이름
	var profile = "";
	//닉네임 이름
	var nickname = "";
	//ip 
	var ip = "";
	//id
	var id = "";
	
	
	//프로필 사진들
	var $profileImg = $("#loginBox img");
	
	$profileImg.click(function() {
		
		var $this = $(this);
		
		if($this.hasClass("on")) {
			$profileImg.attr("class","");
			profile = "";
		}else {
			profile = $this.attr("class","on").attr("src");
			//console.log(profile);
			
			$profileImg.not(this).attr("class","off");
		}//if~else end
	});//click() end
	
	//닉네임 입력 input
	var $nickname = $("#nickname");
	
	$nickname.keyup(function(e) {
		if(e.keyCode==13) {
			handshakingWebSocket();
		}
	});//keyup end

    $loginBtn.click(function() {
    	
    	//호출
    	handshakingWebSocket();
    	
    });//click() end
    
    //서버와 웹소켓 연결하는 함수
    //(handshaking)
    function handshakingWebSocket() {
		
		if(profile=="") {
			alert("프로필이미지를 선택해주세요~");
			return;
		}//if end
		
		nickname = $nickname.val().trim();
		
		if(nickname.length==0) {
			alert("닉네임을 입력해주세요~");
			$nickname.val("").focus();
			return;
		}//if end
    	
    	//서버와 연결될때까지 로딩이미지
    	$loader.addClass("show");
    	
    	ws = new WebSocket("ws://192.168.0.157/chat");
    	
    	//ws은 4가지 이벤트
    	//(open, close, error, message)
    	$(ws).on("open",function(){
    			
	    		//로그인 박스 열림
	        	$loginBox.addClass("off");
        	
    			console.log("열렸음!");
    			//열렸으니까 채팅 가능하게
    			$loader.removeClass("show");

    			//자동으로 포커스 지정
    			$msg.focus();
    			
    		 })
    	     .on("close",function(){
    	    	 
    	    	 console.log("닫혔음!");
    	    	 
    	    	 //ws 초기화
    	    	 ws = null;
    	    	 //프로필,닉네임 초기화
    	    	 profile = "";
    	    	 nickname = "";
    	    	 $profileImg.attr("class","");
    	    	 $nickname.val("");
    	    	 
    	    	 //로딩이미지 숨기기
    	    	 $loader.removeClass("show");
    	    	 //로그인박스 다시 보여주기
    	    	 $loginBox.removeClass("off");
    	    	 
    	     })
    	     .on("error",function(){
    	    	 alert("에러발생!");
    	     })
    	     .on("message",function(e){
    	    	 
	   	    	 //e는 jquery의 이벤트객체
	   	    	 
	   	    	 //e.originalEvent는 자바스크팁트 
	   	    	 //이벤트 객체
    	    	var evt = e.originalEvent;
    	    	 
	   	    	 //이게 실제 데이터(문자열 json)
	   	    	 var data = evt.data;
	   	    	 
	   	    	 //실제 json객체
	   	    	 var protocol = JSON.parse(data);
	   	    	 
	   	    	 //console.log(protocol);
	   	    	 
	   	    	 //console.log(protocol.code);
	   	    	 
	   	    	 switch (protocol.code) {
	   	    	 case 1 : 
	   	    		 
	   	    		 //코드 2, 이미지, 닉네임 넣고
	   	    		 //보내기
	   	    		 sendProfile(protocol);
	   	    		 
	   	    		 break;
	   	    	 case 2 :
	   	    		 	//유저가 들어옴
	   	    			join(protocol);
	   	    		 break;
	   	    	 case 3 : 
	   	    		 break;
	   	    	 case 4 : 
	   	    		 displayMsg(protocol);
	   	    		 break;
	   	    	 default :
	   	    	 
	   	    	 }//switch end
    	    	 
    	     });
    	
    }//handshakingWebSocket()
    
    //유저가 들어왔기 때문에
    //joinTmp와 userListTmp을 이용하여
    //님이 들어왔습니다 와
    // 유저리스트 갱신
    function join(protocol) {
    	
    	$chatList.append(joinTmp({user:protocol}));
    	
 		var height = $chatList.height();
	   	 
	   	 $("#chatList").animate({scrollTop:height},100);
    	
    }//join() end
    
    //새로운 유저의 정보를 서버로
    //보내는 함수(code : 2)
    function sendProfile(protocol) {
    	
    	//서버에서 보낸 ip와
    	//id를 자바스크립트의 변수에 대입
    	ip = protocol.ip;
    	id = protocol.id;
    	
    	protocol.code = 2;//코드 2
    	protocol.profile = profile;
    	protocol.nickname = nickname;
    	
    	var json = 
    		JSON.stringify(protocol);
    	
    	console.log(protocol);
    	console.log(json);
		
    	//서버로 보냄
    	ws.send(json);
    	
    }//sendProfile end
    
   
    
    //넘어온 프로토콜을 출력
    function displayMsg(protocol) {
		    	 
	   	 $chatList.append(msgTmp({user:protocol}));
		    	 
	   	 var height = $chatList.height();
	   	 
	   	 $("#chatList").animate({scrollTop:height},100);
    	
    }//displayMsg() end

    
    //어설픈 생성자 함수형 
    function Protocol(code,id,nickname,profile,msg,ip) {
    	this.code = code;
    	this.id = id;
    	this.nickname = nickname;
    	this.profile = profile;
    	this.msg = msg;
    	this.ip = ip;
    }
    
    //console.log(new Protocol());
    

</script>
</body>
</html>