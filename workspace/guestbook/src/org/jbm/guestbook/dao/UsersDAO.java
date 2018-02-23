package org.jbm.guestbook.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.jbm.guestbook.util.SqlSessionUtil;
import org.jbm.guestbook.vo.User;
 
public class UsersDAO {
 
	public static User selectLogin(User user) {
		User loginUser = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			loginUser = session.selectOne("users.selectLogin", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end
		
		return loginUser;
	}
}
