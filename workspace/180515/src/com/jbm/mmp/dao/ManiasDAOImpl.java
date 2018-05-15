package com.jbm.mmp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbm.mmp.vo.Mania;

@Repository
public class ManiasDAOImpl implements ManiasDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Mania mania) {
		return session.insert("manias.insert",mania);
	}
	
	@Override
	public Mania selectById(String id) {
		return session.selectOne("manias.selectById",id);
	}

	@Override
	public Mania selectLogin(Mania mania) {
		return session.selectOne("manias.selectLogin",mania);
	}
}
