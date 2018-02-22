package vo;

import java.sql.Timestamp;

//id, password, nickname, regdate
public class User {
	private int no;
	private String id;
	private String password;
	private String nickname;
	private Timestamp regdate;
	
	public User() {
		// TODO Auto-generated constructor stub
	}	

	public User(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
 
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}	
	
}
