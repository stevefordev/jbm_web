package com.jbm.mmp.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.jbm.mmp.vo.Genre;

public class GenresDAOImpl implements GenresDAO {
  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public List<Genre> selectList() {
    // TODO Auto-generated method stub
    return session.selectList("genres.selectList");
  }

  @Override
  public Genre selectByName(String name) {
    // TODO Auto-generated method stub
    return session.selectOne("genres.selectByName", name);
  }

  @Override
  public Genre selectByNo(int no) {
    // TODO Auto-generated method stub
    return session.selectOne("genres.selectByNo", no);
  }

  @Override
  public List<Genre> selectListByMovieNo(int no) {
    // TODO Auto-generated method stub
    return session.selectList("genres.selectListByMovieNo", no);
  }

  @Override
  public int delete(int no) {
    // TODO Auto-generated method stub
    return session.delete("genres.delete", no);
  }

  @Override
  public int insert(Genre genre) {
    // TODO Auto-generated method stub
    return session.insert("genres.insert", genre);
  }

  @Override
  public int increaseMovieCount(int no) {
    // TODO Auto-generated method stub
    return session.update("genres.increaseMovieCount", no);
  }

  @Override
  public int decreaseMovieCount(int no) {
    // TODO Auto-generated method stub
    return session.update("genres.decreaseMovieCount", no);
  }

}
