package util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {

	private static SqlSessionFactory factory;

	// 인스턴스 멤버필드의 초기화 : 생성자
	// static 멤버필드의 초기화 : static 영역
	static {
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader("config/mybatis-config.xml");
		} catch (Exception e) {
			e.printStackTrace();
		}

		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

		factory = builder.build(reader);
	}

	public static SqlSession getSession() {
		return factory.openSession(true);
	}
}
