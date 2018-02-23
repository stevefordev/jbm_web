package org.jbm.guestbook.vo;

import java.sql.Timestamp;

public class Guest {

	private int no;
	private String writer;
	private String contents;
	private String ip;
	private Timestamp regdate;
	private int userNo;
	
	public Guest() {

	}

	public Guest(String writer, String contents, String ip, int userNo) {
		super();
		this.writer = writer;
		this.contents = contents;
		this.ip = ip;
		this.userNo = userNo;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		
		return String.format("%d %s %s %s", this.no, this.writer, this.contents, this.ip);
	}
}
