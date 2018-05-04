<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Ajax를 이용해서 멤버목록 출력</title>
</head>
<body>
	<h1>멤버 목록</h1>
	<ul>
		<li>아직 멤버가 없습니다.</li>
	</ul>
	<script type="text/template" id="memberTmp">
	<@_.each(list, function(member) { @>
		<li><img src="/profile/<@=member.profile @>" width="50" height="50" /> <@= member.nickname @></li>
	<@ }) @>
	</script>
	<%-- --%>
	<script src="js/jquery.js"></script>
	<script src="js/underscore-min.js"></script>
	<script>
	_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@(.+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
	</script>
	<script>
	
		var tmp = _.template($("#memberTmp").html());
	
		function getMembers() {
			$.ajax({
				url : '/ajax/members.json',
				dataType : "json",
				data : this.dataset,
				success : function(data) {
					console.log(data);
					$("ul").html(tmp({list:data}));
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			})
		}

		getMembers();
	</script>

</body>
</html>