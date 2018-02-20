package vo;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

public class Group {

	private int no;
	private String name;
	private Date debutDate;
	// 여러 메서드에서 같이 사용하는 변수
	// 멤버필드로
	private Calendar cal;
	
	public Group() {
		//멤버필드의 초기화
		cal = Calendar.getInstance();
	}

	public Group(String name, Date debutDate) {
		super();
		this.name = name;
		this.debutDate = debutDate;
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

	public Date getDebutDate() {
		return debutDate;
	}

	public void setDebutDate(Date debutDate) {
		this.debutDate = debutDate;
		
		/*
		 * debutDate 가 세팅될대 Calendar 객체도 세팅
		 * */
		cal.setTime(this.debutDate);
	}

	@Override
	public String toString() {
		return "번호:" + this.no + " / 그룹명:" + this.name + " / 데뷔일:" + this.debutDate;
	}

}
