package com.jbm.mmp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbm.mmp.vo.Movie;
import com.jbm.mmp.vo.PageVO;

@Repository
public class MoviesDAOImpl implements MoviesDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Movie movie) {
		return session.insert("movies.insert",movie);
	}
	
	@Override
	public int update(Movie movie) {
		return session.update("movies.update",movie);
	}
	
	@Override
	public List<Movie> selectList(PageVO pageVO) {
		return session.selectList("movies.selectList",pageVO);
	}
	
	@Override
	public int selectTotal() {
		return session.selectOne("movies.selectTotal");
	}
	@Override
	public Movie selectOne(int no) {
		return session.selectOne("movies.selectOne",no);
	}
	
	@Override
	public int delete(int no) {
		return session.insert("movies.delete",no);
	}

}
