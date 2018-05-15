package com.jbm.mmp.dao;

import com.jbm.mmp.vo.MovieGenre;

public interface MovieGenresDAO {

  public int insert(MovieGenre movieGenre);
  
  public int deleteByMovieNo(int no);
}
