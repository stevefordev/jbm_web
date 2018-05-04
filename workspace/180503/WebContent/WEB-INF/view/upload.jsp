<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>업로드 테스트</title>
<link rel="stylesheet" href="/css/fontawesome-all.css" />
<style>
#selectImage {
	width: 200px;
	height: 200px;
	display: block;
	border: 1px solid #424242;
	cursor: pointer;
	text-align: center;
	position: relative;
	margin: 10px 0;
}

.fa-camera {
	position: absolute;
	left: 0;
	top: 0;
	width: 200px;
	height: 200px;
	display: block;
	font-size: 150px;
	line-height: 200px;
}

#image {
	width: 200px;
	height: 200px;
	position: absolute;
	opacity: 0;
	left: 0;
	top: 0;
	cursor: pointer;
}

#imageCanvas {
	position: absolute;
	left: 0;
	top: 0;
	background: #fff;
	display: none;
}

#selectImage.selected #imageCanvas {
	display: block;
}

#selectImage.selected #deleteBtn {
	z-index: 2;
	display: block;
}

#selectImage.selected #loader {
	display: none;
}

#deleteBtn {
	position: absolute;
	right: 0;
	top: 0;
	width: 30px;
	height: 30px;
	border-radius: 15px;
	padding: 0;
	border: none;
	font-size: 30px;
	background: transparent;
	display: none;
	cursor: pointer;
}

#loader {
	width: 200px;
	height: 200px;
	background: url(img/loader.gif);
	background-repeat: no-repeat;
	background-position: center;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #fff;
	z-index: 3;
	cursor: default;
	display: none;
}
</style>
</head>
<body>
	<h1>업로드 테스트</h1>
	<form action="upload.html" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>업로드폼</legend>
			<input type="text" name="name" placeholder="이름" />
			<div id="selectImage" class="">
				<button type="button" id="deleteBtn">
					<i class="fa fa-times-circle"></i>
				</button>
				<i class="fa fa-camera"></i>
				<canvas id="imageCanvas" width="200" height="200"></canvas>
				<input type="file" name="image" id="image">
				<div id="loader"></div>
			</div>
			<button>업로드</button>
		</fieldset>
	</form>
	<c:if test="${src!=null }">
		<h2>프로필이미지</h2>
		<img src="profile/${src }" />
		<h2>실제이미지</h2>
		<img src="upload/${src }" />
	</c:if>
	<script src="/js/jquery.js"></script>
	<script>
		var $image = $("#image"), $canvas = $("#imageCanvas"), canvas = $canvas
				.get(0), ctx = canvas.getContext("2d"), $loader = $("#loader"), $selectImage = $("#selectImage"), $deleteBtn = $("#deleteBtn");

		$deleteBtn.click(function() {
			$selectImage.removeClass("selected");
			ctx.clearRect(0, 0, 200, 200);
			$image.val("");
		});

		$image.change(function() {

			$loader.show();

			var file = this.files[0];

			var reg = /^image\//;

			if (!reg.test(file.type)) {

				$loader.hide();
				alert("이미지를 선택해주세요~");

				$image.val("");

				return;
			}

			var reader = new FileReader();

			//파일을 DataURL로 읽어옵니다.
			reader.readAsDataURL(file);

			//다 읽었으면 onload 이벤트 발생
			reader.onload = function() {
				//alert("다 읽었어요!");

				//alert(reader.result);

				//$("img").attr("src",reader.result);

				//이미지 객체 생성후

				img = new Image();
				img.src = reader.result;

				//이미지 로딩후
				img.onload = function() {

					var x = 0;
					var y = 0;

					var width = img.width;
					var height = img.height;

					var rate = width / height;

					// alert(rate);

					if (rate >= 1) {

						//alert("가로더김");
						width = height;
						x = (img.width - img.height) / 2;

					} else {
						// alert("세로더김");
						height = width;
						y = (img.height - img.width) / 2;
					}

					img.width = 200;
					img.height = 200;
					ctx.clearRect(0, 0, 200, 200);
					ctx.drawImage(img, x, y, width, height, 0, 0, 200, 200);

					$loader.hide();

					$selectImage.addClass("selected");

				};
			};

		});
	</script>
</body>
</html>