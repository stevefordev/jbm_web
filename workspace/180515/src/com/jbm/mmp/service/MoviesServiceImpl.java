package com.jbm.mmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.transaction.annotation.Transactional;
import com.jbm.mmp.dao.GenresDAO;
import com.jbm.mmp.dao.MovieGenresDAO;
import com.jbm.mmp.dao.MoviesDAO;
import com.jbm.mmp.util.PaginateUtil;
import com.jbm.mmp.vo.Movie;
import com.jbm.mmp.vo.MovieGenre;
import com.jbm.mmp.vo.PageVO;

public class MoviesServiceImpl implements MoviesService {

  private MoviesDAO moviesDAO;

  public void setMoviesDAO(MoviesDAO moviesDAO) {
    this.moviesDAO = moviesDAO;
  }

  private MovieGenresDAO movieGenresDAO;

  public void setMovieGenresDAO(MovieGenresDAO movieGenresDAO) {
    this.movieGenresDAO = movieGenresDAO;
  }

  private GenresDAO genresDAO;

  public void setGenresDAO(GenresDAO genresDAO) {
    this.genresDAO = genresDAO;
  }


  @Transactional
  @Override
  public boolean register(Movie movie, int[] genres) {

    boolean result = 1 == moviesDAO.insert(movie);

    for (int genre : genres) {

      movieGenresDAO.insert(new MovieGenre(genre, movie.getNo()));

      genresDAO.updateCount(genre);
    }

    return true;
  }


  @Override
  public boolean modify(Movie movie, int[] genres) {
    boolean result = 1 == moviesDAO.update(movie);

    movieGenresDAO.delete(movie.getNo());

    for (int genre : genres) {

      movieGenresDAO.insert(new MovieGenre(genre, movie.getNo()));

      genresDAO.updateCount(genre);
    }

    return true;
  }


  @Override
  public Map<String, Object> getMovies(int no) {

    // 한 페이지에 보여질 게시물 수
    int numPage = 8;

    // 한 페이지에 보여질
    // 페이징 블록 갯수
    int numBlock = 5;

    PageVO pageRange = new PageVO(no, numPage);

    // 아이돌 목록(list)
    List<Movie> list = moviesDAO.selectList(pageRange);

    // 모델(View에출력할)용 맵
    Map<String, Object> model = new HashMap<>();

    model.put("movies", list);

    // 페이지네이션 처리

    int total = moviesDAO.selectTotal();

    String url = "/movie/page/";

    String paginate = PaginateUtil.getPaginate(no, total, numPage, numBlock, url);

    model.put("paginate", paginate);

    return model;
  }


  @Override
  public Map<String, Object> getMovie(int no) {
    // 모델(View에출력할)용 맵
    Map<String, Object> model = new HashMap<>();

    model.put("movie", moviesDAO.selectOne(no));

    // model.put("mania", mainasDAO.selectOne(no));

    model.put("haveGenres", movieGenresDAO.selectList(no));

    model.put("genres", genresDAO.selectList());

    return model;
  }


  @Override
  public boolean remove(int no) {

    // System.out.println("MoviesService.remove()");

    List<MovieGenre> genres = movieGenresDAO.selectList(no);

    movieGenresDAO.delete(no);

    for (MovieGenre genre : genres) {
      System.out.println(genre.getGenreNo());

      genresDAO.updateCount(genre.getGenreNo());

    } // for end

    moviesDAO.delete(no);

    return true;
  }
}
