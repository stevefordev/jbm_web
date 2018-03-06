<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>장르 목록</title>
<style>
	table {
		border-collapse: collapse;
	}
	td, th {
		border:1px solid #424242;
		padding:8px 12px;
	}
</style>
</head>
<body>
	<h1>장르 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>장르명</th>
				
			</tr>			
		</thead>
		<tbody>
			<tr>
				<td colspan="2">아직 없음</td>
				
			</tr>
		</tbody>
	</table>
	
<script type="text/template" id="genreTmpl">

    <@  _.each(genres, function(genre){ @>
    <tr>
        <th><@= genre.no@></th>
        <td><@= genre.name@></td>        
    </tr>
    <@ }) @>
</script>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
	_.templateSettings = {
		    interpolate: /\<\@\=(.+?)\@\>/gim,
		    evaluate: /\<\@(.+?)\@\>/gim,
		    escape: /\<\@\-(.+?)\@\>/gim
		};
	
	var tmp = _.template($("#genreTmpl").html());
	
	function getGenres() {
		$.ajax ({
			url:"ajax/getGenres.jsp",
			data:"",
			dataType:"json",
			error:function (xhr, error, code) {
				console.log(code);
			},
			success:function(data) {
				console.log(data);
				$("tbody").empty();
				$("tbody").html(tmp({genres:data}));
			}
		});
	}
	getGenres();
</script>
</body>
</html>