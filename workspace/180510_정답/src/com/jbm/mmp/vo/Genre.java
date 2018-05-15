package com.jbm.mmp.vo;

import java.sql.Timestamp;

public class Genre {
	
	private int no, maniaNo, movieCount;
	private String name, nickname, profile;
	private Timestamp regdate;
	
	public Genre() {
		// TODO Auto-generated constructor stub
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
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

	public int getMovieCount() {
		return movieCount;
	}

	public void setMovieCount(int movieCount) {
		this.movieCount = movieCount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	

}
