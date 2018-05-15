package com.jbm.mmp.service;

import java.util.List;
import java.util.Map;
import com.jbm.mmp.vo.Movie;

public interface MoviesService {

  public Map<String, Object> getMovieList(int page);

  public boolean register(Movie movie, int[] genres);

  public boolean modify(Movie movie, int[] genres);
  
  public Map<String, Object> getMovie(int no);
  
  public Map<String, Object> getMovieForUpdate(int no);
  
  public boolean remove(int no);
}
