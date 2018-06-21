package org.jbm.hive_180620;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JoinApp {

  public static void main(String[] args) throws Exception {
    System.out.println("Hello World!");
    // 1) jdbc 드라이버를 메모리에 로딩
    Class.forName("org.apache.hive.jdbc.HiveDriver");

    System.out.println("드라이버 로딩 완료!");
    // 2) 유저, 비밀번호, url 등 설정
    String user = "hive";
    String password = "hive";
    String url = "jdbc:hive2://192.168.56.101:10000";
    // 3) 커넥션(connection) 객체 생성
    Connection con = DriverManager.getConnection(url, user, password);
    System.out.println("커넥션 연결 성공!!");

    // 4) 구문(statement) 객체 생성
    Statement stmt = con.createStatement();
    System.out.println("구문객체 생성 성공!");

    // 5) 수행 할 SQL 을 작성
    // ex) 명량을 1번 유저가 4.5점 줬어요.
    String sql = String.format(
        "SELECT m.title, g.user_no, g.grade FROM grades g, movies m WHERE g.movie_no = m.movie_no");

    // UNIX 타임(1000분의 1초)
    long start = System.currentTimeMillis();

    // 6) 실행 후 결과 실행 및 갯수 얻기
    ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()) {
      System.out.println(
          String.format("'%s'을 '%d'번 유저가 '%f'점 줬어요", rs.getString(1), rs.getInt(2), rs.getDouble(3)));
    }

    long end = System.currentTimeMillis();

    System.out.println(String.format("%.4f", (end - start) / 1000f) + "초 걸림");

    rs.close();
    stmt.close();
    con.close();
  }
}
