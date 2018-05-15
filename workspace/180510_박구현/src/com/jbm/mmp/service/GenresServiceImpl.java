package com.jbm.mmp.service;

import java.util.List;
import com.jbm.mmp.dao.GenresDAO;
import com.jbm.mmp.vo.Genre;

public class GenresServiceImpl implements GenresService {

  private GenresDAO genresDAO;

  public void setGenresDAO(GenresDAO genresDAO) {
    this.genresDAO = genresDAO;
  }

  @Override
  public List<Genre> getGenres() {
    // TODO Auto-generated method stub
    return genresDAO.selectList();
  }

  @Override
  public List<Genre> getGenresByMovieNo(int no) {
    // TODO Auto-generated method stub
    return genresDAO.selectListByMovieNo(no);
  }
  @Override
  public Genre getGenreByName(String name) {
    // TODO Auto-generated method stub
    return genresDAO.selectByName(name);
  }

  @Override
  public Genre getGenreByNo(int no) {
    // TODO Auto-generated method stub
    return genresDAO.selectByNo(no);
  }

  @Override
  public boolean remove(int no) {
    // TODO Auto-generated method stub
    return 1 == genresDAO.delete(no);
  }

  @Override
  public boolean register(Genre genre) {
    // TODO Auto-generated method stub
    return 1 == genresDAO.insert(genre);
  }
}
