package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Idol;

public class IdolsDAOImpl implements IdolsDAO {

	// DAO 는 SqlSession에 의존적 그래서 멤버필드로 선언
	private SqlSession session;

	// 의존성 주입 받기 위해서 setter
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Idol> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("idols.selectList");
	}

	@Override
	public int insert(Idol idol) {
		// TODO Auto-generated method stub
		return session.insert("idols.insert", idol);
	}

}
