<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>영화 목록</title>
</head>
<body>
	<h1>영화목록</h1>
	<table border="1">
		<caption>영화표</caption>
		<thead>
			<tr>
				<th>번호</th>
				<th>영화명</th>
				<th>감독</th>
				<th>개봉일</th>
			</tr>
		</thead>
		<tbody>
			<%
				// 1) 드라이버로딩
				Class.forName("oracle.jdbc.OracleDriver");

				// 2) user, password, url 등
				String user = "test";
				String password = "1111";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";

				// 3) Connection 객체 얻기
				Connection con = DriverManager.getConnection(url, user, password);

				// 4) Statement 객체 생성
				Statement stmt = con.createStatement();

				// 5) SQL 구문
				String sql = "SELECT no, name, director, release_date FROM movies";

				// 6) ResultSet 객체
				ResultSet rs = stmt.executeQuery(sql);
				// while 문
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				
			</tr>
			<%
				}
			%>
		</tbody>

	</table>
</body>
</html>