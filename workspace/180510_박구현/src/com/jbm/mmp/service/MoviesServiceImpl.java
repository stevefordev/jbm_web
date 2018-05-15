package com.jbm.mmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.jbm.mmp.dao.GenresDAO;
import com.jbm.mmp.dao.MovieGenresDAO;
import com.jbm.mmp.dao.MoviesDAO;
import com.jbm.mmp.util.PaginateUtil;
import com.jbm.mmp.vo.Genre;
import com.jbm.mmp.vo.Movie;
import com.jbm.mmp.vo.MovieGenre;

public class MoviesServiceImpl implements MoviesService {

  private MoviesDAO moviesDAO;
  private MovieGenresDAO movieGenresDAO;
  private GenresDAO genresDAO;

  public void setMoviesDAO(MoviesDAO moviesDAO) {
    this.moviesDAO = moviesDAO;
  }

  public void setMovieGenresDAO(MovieGenresDAO movieGenresDAO) {
    this.movieGenresDAO = movieGenresDAO;
  }

  public void setGenresDAO(GenresDAO genresDAO) {
    this.genresDAO = genresDAO;
  }

  @Override
  public Map<String, Object> getMovieList(int page) {
    // TODO Auto-generated method stub

    // 한 페이지에 보여질 게시물 수
    int numPage = 8;

    // 한 페이지에 보여질
    // 페이징 블록 갯수
    int numBlock = 3;

    // 페이징 처리용 Map
    Map<String, Object> pageRange = new HashMap<String, Object>();

    int end = page * numPage;
    int start = end - (numPage - 1);

    pageRange.put("start", start);
    pageRange.put("end", end);

    // 무비 목록(list)
    List<Movie> list = moviesDAO.selectList(pageRange);

    // 모델(View에출력할)용 맵
    Map<String, Object> model = new HashMap<>();

    model.put("movies", list);

    // 페이지네이션 처리
    int total = moviesDAO.selectTotal();

    String url = "/movie/page/";

    String paginate = PaginateUtil.getPaginate(page, total, numPage, numBlock, url);

    model.put("paginate", paginate);

    return model;
  }

  @Override
  public boolean register(Movie movie, int[] genres) {
    // TODO Auto-generated method stub
    try {
      // 영화 정보 디비 입력
      moviesDAO.insert(movie);

      MovieGenre movieGenre = new MovieGenre();
      movieGenre.setMovieNo(movie.getNo());

      // 선택된 장르 만큼 반복하여 movie_genres 디비에 입력 하고
      // genre 테이블에서 movie_count 1씩 증가
      for (int genreNo : genres) {
        movieGenre.setGenreNo(genreNo);
        movieGenresDAO.insert(movieGenre);

        genresDAO.increaseMovieCount(genreNo);
      }
      return true;
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
      return false;
    }
  }

  @Override
  public boolean modify(Movie movie, int[] genres) {
    // TODO Auto-generated method stub
    try {

      // 해당 영화에 선택된 장르의 moviecount 1 감소
      for (Genre genre : genresDAO.selectListByMovieNo(movie.getNo())) {
        System.out.println(genre.getNo());
        genresDAO.decreaseMovieCount(genre.getNo());
      }

      // 기존에 해당 영화에 연결된 장르 정보 삭제
      movieGenresDAO.deleteByMovieNo(movie.getNo());

      // 영화 정보 디비 수정
      moviesDAO.update(movie);

      MovieGenre movieGenre = new MovieGenre();
      movieGenre.setMovieNo(movie.getNo());

      // 선택된 장르 만큼 반복하여 movie_genres 디비에 입력 하고
      // genre 테이블에서 movie_count 1씩 증가
      for (int genreNo : genres) {
        movieGenre.setGenreNo(genreNo);
        movieGenresDAO.insert(movieGenre);

        genresDAO.increaseMovieCount(genreNo);
      }
      return true;
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
      return false;
    }
  }

  @Override
  public Map<String, Object> getMovie(int no) {
    // TODO Auto-generated method stub
    Map<String, Object> map = new HashMap();
    map.put("movie", moviesDAO.selectOne(no));
    map.put("genres", genresDAO.selectListByMovieNo(no));
    return map;
  }

  @Override
  public Map<String, Object> getMovieForUpdate(int no) {
    // TODO Auto-generated method stub
    Map<String, Object> map = new HashMap();
    map.put("movie", moviesDAO.selectOne(no));
    map.put("genres", genresDAO.selectList());
    map.put("selectedGenres", genresDAO.selectListByMovieNo(no));
    return map;
  }

  @Override
  public boolean remove(int no) {
    // TODO Auto-generated method stub
    // 해당 영화에 선택된 장르의 moviecount 1 감소
    for (Genre genre : genresDAO.selectListByMovieNo(no)) {
      System.out.println(genre.getNo());
      genresDAO.decreaseMovieCount(genre.getNo());
    }

    // 기존에 해당 영화에 연결된 장르 정보 삭제
    movieGenresDAO.deleteByMovieNo(no);

    // 영화 정보 디비 삭제
    return 1 == moviesDAO.delete(no);
  }
}
