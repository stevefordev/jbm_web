package com.jbm.mmp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbm.mmp.vo.Genre;

@Repository
public class GenresDAOImpl implements GenresDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Genre genre) {
		return session.insert("genres.insert",genre);
	}
	
	@Override
	public List<Genre> selectList() {
		return session.selectList("genres.selectList");
	}
	@Override
	public int delete(int no) {
		return session.delete("genres.delete",no);
	}

	@Override
	public int updateCount(int no) {
		return session.update("genres.updateCount",no);
	}
	
	@Override
	public int selectCount(String genre) {
		return session.selectOne("genres.selectCount",genre);
	}
}
