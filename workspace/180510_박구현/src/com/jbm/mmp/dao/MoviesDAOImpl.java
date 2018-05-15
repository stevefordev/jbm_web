package com.jbm.mmp.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import com.jbm.mmp.vo.Movie;

public class MoviesDAOImpl implements MoviesDAO {
  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public List<Movie> selectList(Map<String, Object> pageRange) {
    // TODO Auto-generated method stub
    return session.selectList("movies.selectList", pageRange);
  }

  @Override
  public int selectTotal() {
    // TODO Auto-generated method stub
    return session.selectOne("movies.selectTotal");
  }

  @Override
  public Movie selectOne(int no) {
    // TODO Auto-generated method stub
    return session.selectOne("movies.selectOne", no);
  }

  @Override
  public int insert(Movie movie) {
    // TODO Auto-generated method stub
    return session.insert("movies.insert", movie);
  }

  @Override
  public int update(Movie movie) {
    // TODO Auto-generated method stub
    return session.insert("movies.update", movie);
  }

  @Override
  public int delete(int no) {
    // TODO Auto-generated method stub
    return session.delete("movies.delete", no);
  }
}
