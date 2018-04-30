package vo;

import java.sql.Date;

/*
 * vo, dto, pojo, java bean
 * */
public class Group {

	private int no;
	private String name;
	private Date debutDate;

	public Group() {
		// TODO Auto-generated constructor stub
	}

	public Group(int no, String name) {
		super();
		this.no = no;
		this.name = name;
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
	}

}
