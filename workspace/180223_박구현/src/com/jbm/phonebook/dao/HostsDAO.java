package com.jbm.phonebook.dao;
 
import org.apache.ibatis.session.SqlSession;

import com.jbm.phonebook.util.SqlSessionUtil;
import com.jbm.phonebook.vo.Host;
 
public class HostsDAO {
	
	/**
	 * 로그인 유효성을 검증하기 위해서 사용
	 * 로그인 폼에 입력된 데이터와 비교
	 * @param host
	 * @return
	 */
	public static Host selectLogin(Host host) {
		Host loginUser = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			loginUser = session.selectOne("hosts.selectLogin", host);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end
		
		return loginUser;
	}
}
