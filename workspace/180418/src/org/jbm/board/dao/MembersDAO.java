package org.jbm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.jbm.board.util.SqlSessionUtil;
import org.jbm.board.vo.Member;

public class MembersDAO {
	
	public static Member selectLogin(Member member) {
		Member loginMember = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			loginMember = session.selectOne("members.selectLogin",member);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.close();
			}//if end
		}//try~catch~finally end
		
		
		return loginMember;
	}//selectLogin() end
	

}
