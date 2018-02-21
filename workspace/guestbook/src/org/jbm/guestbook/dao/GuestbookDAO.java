package org.jbm.guestbook.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.jbm.guestbook.util.SqlSessionUtil;
import org.jbm.guestbook.vo.Guest;

public class GuestbookDAO {

	public static int insert(Guest guest) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("guestbook.insert", guest);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end
		
		return result;
	}
	
	public static int delete(int no) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("guestbook.delete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end
		
		return result;
	}
	
	public static List<Guest> selectList() {
		List<Guest> list = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("guestbook.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end
		
		return list;
	}
}
