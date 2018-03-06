<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>장르 관리 프로그램</title>
<style>
table {
	border-collapse: collapse;
}

td, th {
	border: 1px solid #424242;
	padding: 8px 12px;
}
</style>
</head>
<body>
	<h1>장르 입력</h1>
	<form id="insertForm">
		<fieldset>
			<legend>장르입력폼</legend>
			<input id="name" placeholder="장르입력" autocomplete="off" />
			<button>장르 입력</button>
		</fieldset>
	</form>
	<h1>장르 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>장르명</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">아직 없음</td>
			</tr>
		</tbody>
	</table>
	<script type="text/template" id="genreTmpl">

    <@  _.each(genres, function(genre){ @>
    <tr>
        <th><@= genre.no@></th>
        <td><@= genre.name@></td>
		<td><button class="btn_delete" data-no=<@= genre.no@> >삭제</button></td>
    </tr>
    <@ }) @>
</script>

	<script src="js/jquery.js"></script>
	<script src="js/underscore-min.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@(.+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		var tmp = _.template($("#genreTmpl").html());

		function getGenres() {
			$.ajax({
				url : "ajax/getGenres.jsp",
				data : "",
				dataType : "json",
				error : function(xhr, error, code) {
					console.log(code);
				},
				success : function(data) {
					console.log(data);
					$("tbody").empty();
					$("tbody").html(tmp({
						genres : data
					}));
				}
			});
		}
		getGenres();

		$('#insertForm').on('submit', function(event) {
			event.preventDefault();
			var name = $("#name").val();
			
			$("#name").val("").focus();
			
			console.log(name);
			$.ajax ({
				url:"ajax/registerGenre.jsp",
				data: { "name" : name },
				dataType:"json",
				type:"post",
				beforesend: function () {
					console.log(name);
				},
				error:function (xhr, error, code) {
					console.log(code);
				},
				success:function(data) {
					console.log(data);
					getGenres();
				}
			});
		});
		
		$("tbody").on("click", ".btn_delete", function() {
			var no = $(this).data("no"); 
			console.log(no);
			
			$.ajax ({
				url:"ajax/deleteGenre.jsp",
				data: { "no" : no },
				dataType:"json",
				type:"get",
				beforesend: function () {
					console.log(name);
				},
				error:function (xhr, error, code) {
					console.log(code);
				},
				success:function(data) {
					console.log(data);
					if (data == true) {
						getGenres();	
					}					
				}
			});
			
		});
	</script>
</body>
</html>