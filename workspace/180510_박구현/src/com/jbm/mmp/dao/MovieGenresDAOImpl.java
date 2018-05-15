package com.jbm.mmp.dao;

import org.apache.ibatis.session.SqlSession;
import com.jbm.mmp.vo.MovieGenre;

public class MovieGenresDAOImpl implements MovieGenresDAO {
  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public int insert(MovieGenre movieGenre) {
    // TODO Auto-generated method stub
    return session.insert("movieGenres.insert", movieGenre);
  }
  
  @Override
  public int deleteByMovieNo(int no) {
    // TODO Auto-generated method stub
    return session.delete("movieGenres.deleteByMovieNo", no);
  }
}
