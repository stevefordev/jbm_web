package org.jbm.hive_180620;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Hello world!
 *
 */
public class App {
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
    String sql = String.format("SELECT movie_no, title FROM movies WHERE movie_no > %d", 0);

    // 6) 실행 후 결과 실행 및 갯수 얻기
    ResultSet rs = stmt.executeQuery(sql);

    while (rs.next()) {
      System.out.println("번호:" + rs.getString(1) + " / 제목:" + rs.getString(2));
    }

  }
}
