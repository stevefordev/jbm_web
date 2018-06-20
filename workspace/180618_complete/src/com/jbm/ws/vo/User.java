package com.jbm.ws.vo;



public class User {
	private String id,nickname,img,ip;
	
	public User(Protocol protocol) {
		this.id = protocol.getId();
		this.nickname = protocol.getNickname();
		this.img = protocol.getImg();
		this.ip = protocol.getIp();
	}
	public User() {
		// TODO Auto-generated constructor stub
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
