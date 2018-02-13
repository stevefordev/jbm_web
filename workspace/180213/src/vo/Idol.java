package vo;

import java.sql.Date;

public class Idol {

	private int no;
	private String name;
	private int height,weight;
	private Date birthDate;	
	private int groupNo;
	 
	public Idol() {
		super();
	}
	 
	public Idol(String name, int height, int weight, Date birthDate, int groupNo) {
		super();
		this.name = name;
		this.height = height;
		this.weight = weight;
		this.birthDate = birthDate;
		this.groupNo = groupNo;
	} 
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
}
