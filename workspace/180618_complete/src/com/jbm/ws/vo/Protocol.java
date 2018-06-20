package com.jbm.ws.vo;


public class Protocol {
	
	private int code;
	private String id,msg,nickname, img, ip;
	
	
	public static final int ASK_JOIN = 1;
	public static final int ASK_LEAVE = 2;

	public static final int JOIN = 3;//실제 join
	public static final int LEAVE = 4;//실제 leave
	public static final int MESSAGE = 5;
	public static final int CHANGE_NICKNAME= 6;
	public static final int CHANGE_IMG = 7;
	
	public Protocol() {
		// TODO Auto-generated constructor stub
	}
	
	public Protocol(int code) {
		this.code = code;
	}
	
	public Protocol(int code, String ip) {
		this.code = code;
		this.ip = ip;
	}
	
	public Protocol(int code,String id, String ip) {
		this.code = code;
		this.id = id;
		this.ip = ip;
	}

	public Protocol(int code, String msg, String nickname,
			String img, String ip) {
		this.code = code;
		this.msg = msg;
		this.nickname = nickname;
		this.img = img;
		this.ip = ip;
	}
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
