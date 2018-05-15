package com.jbm.mmp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbm.mmp.vo.MovieGenre;

@Repository
public class MovieGenresDAOImpl implements MovieGenresDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(MovieGenre movieGenre) {
		return session.insert("movieGenres.insert",movieGenre);
	}

	@Override
	public int delete(int no) {
		return session.delete("movieGenres.delete",no);
	}
	
	@Override
	public List<MovieGenre> selectList(int no) {
		return session.selectList("movieGenres.selectList",no);
	}
}
