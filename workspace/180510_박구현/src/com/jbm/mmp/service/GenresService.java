package com.jbm.mmp.service;

import java.util.List;
import com.jbm.mmp.vo.Genre;

public interface GenresService {

  public List<Genre> getGenres();

  public List<Genre> getGenresByMovieNo(int no);

  public Genre getGenreByName(String name);

  public Genre getGenreByNo(int no);

  public boolean remove(int no);

  public boolean register(Genre genre);

}
