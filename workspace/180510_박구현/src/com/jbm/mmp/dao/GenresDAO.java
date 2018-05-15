package com.jbm.mmp.dao;

import java.util.List;
import com.jbm.mmp.vo.Genre;

public interface GenresDAO {

  public List<Genre> selectList();

  public Genre selectByName(String name);

  public Genre selectByNo(int no);

  public List<Genre> selectListByMovieNo(int no);

  public int delete(int no);

  public int insert(Genre genre);

  public int increaseMovieCount(int no);

  public int decreaseMovieCount(int no);
}
