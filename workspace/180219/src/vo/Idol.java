package vo;

import java.sql.Date;
import java.util.Calendar;

public class Idol {

	private int no;
	private String name;
	private int height,weight;
	private Date birthDate;	
	private int groupNo;
	// 여러 메서드에서 같이 사용하는 변수
		// 멤버필드로
	private Calendar cal;
	
	public Idol() {
		//멤버필드의 초기화
		cal = Calendar.getInstance();

	}
	 
	public Idol(String name, int height, int weight, Date birthDate, int groupNo) {
		super();
		this.name = name;
		this.height = height;
		this.weight = weight;
		this.birthDate = birthDate;
		this.groupNo = groupNo;
	} 
	
	public int getYear() {
		return cal.get(Calendar.YEAR);
		
	}

	public int getMonth() {
		return cal.get(Calendar.MONTH) +1;
		
	}

	public int getDate() {
		return cal.get(Calendar.DATE);
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
		/*
		 * birthDate 가 세팅될대 Calendar 객체도 세팅
		 * */
		cal.setTime(this.birthDate);
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
}
