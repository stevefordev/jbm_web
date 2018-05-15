package com.jbm.mmp.vo;

import java.sql.Timestamp;

public class MovieGenre {

  private int no, genreNo, movieNo;
  private Timestamp regdate;
  
  public MovieGenre() {
    // TODO Auto-generated constructor stub
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getGenreNo() {
    return genreNo;
  }

  public void setGenreNo(int genreNo) {
    this.genreNo = genreNo;
  }

  public int getMovieNo() {
    return movieNo;
  }

  public void setMovieNo(int movieNo) {
    this.movieNo = movieNo;
  }

  public Timestamp getRegdate() {
    return regdate;
  }

  public void setRegdate(Timestamp regdate) {
    this.regdate = regdate;
  }
  
}
