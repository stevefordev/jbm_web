package org.jbm.ims.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jbm.ims.vo.Idol;

import oracle.net.aso.i;


public class IdolsDAOImpl implements IdolsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Idol> selectList() {
		return session.selectList("idols.selectList");
	}
	
	@Override
	public int delete(int no) {
		return session.delete("idols.delete",no);
	}
	
	@Override
	public int insert(Idol idol) {
		return session.insert("idols.insert",idol);
	}
	
	@Override
	public Idol selectOne(int no) {
		return session.selectOne("idols.selectOne",no);
	}
	
	@Override
	public int update(Idol idol) {
		return session.update("idols.update",idol);
	}

}
