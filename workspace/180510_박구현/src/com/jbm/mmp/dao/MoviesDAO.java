package com.jbm.mmp.dao;

import java.util.List;
import java.util.Map;
import com.jbm.mmp.vo.Movie;

public interface MoviesDAO {

  public List<Movie> selectList(Map<String, Object> pageRange);

  public int selectTotal();

  public int insert(Movie movie);

  public Movie selectOne(int no);
}
