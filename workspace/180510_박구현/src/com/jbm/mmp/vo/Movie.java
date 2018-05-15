package com.jbm.mmp.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;
import org.springframework.core.env.SystemEnvironmentPropertySource;

public class Movie {
  public enum States {
    SHOW("S", "상영중"), END("E", "상영종료");
    private String code;
    private String title;

    States(String code, String title) {
      this.code = code;
      this.title = title;
    }

    public String getCode() {
      return code;
    }

    public String getTitle() {
      return title;
    }

    public static States findByCode(String code) {
      return Arrays.stream(States.values()).filter(type -> type.getCode().equals(code)).findFirst()
          .get();
    }
  }
  
  public enum Ratings {
    AGEALL("G"), AGE12("Y"), AGE15("T"), AGE19("A");
    private String code;

    Ratings(String code) {
      this.code = code;
    }

    public String getCode() {
      return code;
    }

    /*
     * all, 12, 15, 19 추출
     * */
    public String getTitle() {
      return this.name().substring(3, this.name().length()).toLowerCase();
      
    }

    public static Ratings findByCode(String code) {
      System.out.println(code);
      return Arrays.stream(Ratings.values()).filter(type -> type.getCode().equals(code)).findFirst()
          .get();
    }
  }

  private int no, maniaNo;
  private String title, engTitle, director, actors, summary, poster, state, rating, maniaNickname,
      maniaProfile, stateTitle, ratingTitle;
  private Date releaseDate;
  private Timestamp regdate;

  public Movie() {
    // TODO Auto-generated constructor stub
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getManiaNo() {
    return maniaNo;
  }

  public void setManiaNo(int maniaNo) {
    this.maniaNo = maniaNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getEngTitle() {
    return engTitle;
  }

  public void setEngTitle(String engTitle) {
    this.engTitle = engTitle;
  }

  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }

  public String getActors() {
    return actors;
  }

  public void setActors(String actors) {
    this.actors = actors;
  }

  public String getSummary() {
    return summary;
  }

  public void setSummary(String summary) {
    this.summary = summary;
  }

  public String getPoster() {
    return poster;
  }

  public void setPoster(String poster) {
    this.poster = poster;
  }

  public String getState() {
    return state;
  }

  public String getStateTitle() {
    return States.findByCode(this.state).getTitle();
  }

  public void setState(String state) {
    this.state = state;
  }

  public String getRating() {
    return rating;
  }
  
  public String getRatingTitle() {
    return Ratings.findByCode(this.rating).getTitle();      
  }

  public void setRating(String rating) {
    this.rating = rating;
  }

  public Date getReleaseDate() {
    return releaseDate;
  }

  public void setReleaseDate(Date releaseDate) {
    this.releaseDate = releaseDate;
  }

  public Timestamp getRegdate() {
    return regdate;
  }

  public void setRegdate(Timestamp regdate) {
    this.regdate = regdate;
  }

  public String getManiaNickname() {
    return maniaNickname;
  }

  public void setManiaNickname(String maniaNickname) {
    this.maniaNickname = maniaNickname;
  }

  public String getManiaProfile() {
    return maniaProfile;
  }

  public void setManiaProfile(String maniaProfile) {
    this.maniaProfile = maniaProfile;
  }

}
