package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
 
import vo.Idol;

public class IdolsDAO {	  

	public static int insert(Idol idol) {
		int result = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			System.out.println(idol.getName());
			result = session.insert("idols.insert", idol);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public static int update(Idol idol) {
		int result = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			System.out.println(idol.getName());
			result = session.insert("idols.update", idol);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	public static List<Idol> selectList() {
		// 리턴 자료형과 같은 지역변수로 선언하고 초기화
		List<Idol> list = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("idols.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public static Idol selectOne(int no) {
		// 리턴 자료형과 같은 지역변수로 선언하고 초기화
		Idol idol = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			idol = session.selectOne("idols.selectOne", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return idol;
	}
	public static int delete(int no) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("idols.delete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return result;
	}
 
}
