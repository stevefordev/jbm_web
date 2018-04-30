package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.Group;

@Repository
public class GroupsDAOImpl implements GroupsDAO {

	// DAO 는 SqlSession에 의존적 그래서 멤버필드로 선언
	private SqlSession session;

	// 의존성 주입 받기 위해서 setter
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Group> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("groups.selectList");
		
	}
}
