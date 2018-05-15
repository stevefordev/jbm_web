package com.jbm.mmp.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.jbm.mmp.dao.GenresDAO;
import com.jbm.mmp.vo.Genre;

@Service
public class GenresServiceImpl implements GenresService {

  private GenresDAO genresDAO;

  public void setGenresDAO(GenresDAO genresDAO) {
    this.genresDAO = genresDAO;
  }


  @Override
  public boolean register(Genre genre) {

    genre.setName(genre.getName().trim());

    System.out.println("register method");
    if (0 < genresDAO.selectCount(genre.getName())) {
      return false;
    }

    return 1 == genresDAO.insert(genre);

  }

  @Override
  public List<Genre> getGenres() {
    return genresDAO.selectList();
  }

  @Override
  public boolean remove(int no) {
    return 1 == genresDAO.delete(no);
  }

}
