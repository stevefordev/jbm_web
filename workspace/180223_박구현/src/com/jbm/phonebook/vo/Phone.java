package com.jbm.phonebook.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Phone {

	private int no, hostNo;
	private String name, phone;
	private char gender;
	private Date birthDate;
	private Timestamp regdate;
	
	private Calendar cal;
	private Calendar today;

	public Phone() {
		// TODO Auto-generated constructor stub
		cal = Calendar.getInstance();
		today = Calendar.getInstance();
	}

	/**
	 * 
	 * @param hostNo
	 * @param name
	 * @param phone
	 * @param gender
	 * @param birthDate
	 */
	public Phone(int hostNo, String name, String phone, char gender, Date birthDate) {
		this.hostNo = hostNo;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
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

	public String getPhone() {
		return phone;
	}

	public String getPhone1() {
		return getPhoneNumber().split("-")[0];
	}

	public String getPhone2() {
		return getPhoneNumber().split("-")[1];
	}

	public String getPhone3() {
		return getPhoneNumber().split("-")[2];
	}

	/***
	 * 가산점: 전화번호 '-' 추가 변경가능한 StringBuilder 를 사용하여,
	 * 통신사 3자리 다음과, 끝 4자리 전 위치에 각각 '-' 문자 삽입 
	 * 
	 * @return "0xx-xxxx-xxxx" or "0xx-xxx-xxxx" 문자열
	 */
	public String getPhoneNumber() {

		StringBuilder sb = new StringBuilder(this.phone);

		sb.insert(3, '-');
		sb.insert(sb.length() - 4, '-');
		return sb.toString();
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getGender() {
		return gender;
	}

	/**
	 * 가산점 : 화면 출력에 남자 / 여자로 표시하기 위해 사용
	 * @return
	 */
	public String getGenderKor() {
		return gender == 'M' ? "남자" : "여자";
	}

	/**
	 * <i> 요소에 클래스명을 삽입하기 위하여 성별에 따른 영어명을 출력
	 * @return
	 */
	public String getGenderEng() {
		return gender == 'M' ? "male" : "female";
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getYear() {
		return cal.get(Calendar.YEAR);
	}

	public int getMonth() {
		return cal.get(Calendar.MONTH) + 1;
	}

	public int getDate() {
		return cal.get(Calendar.DATE);
	}

	/***
	 * 가산점 : 나이 계산 한국 나이처럼 태어나면 1살로 계산
	 * 
	 * 오늘 해당 년도 - 생년 + 1
	 * @return
	 */
	public int getAge() {

		return today.get(Calendar.YEAR) - cal.get(Calendar.YEAR) + 1;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	/**
	 * main.jsp 에서 나이 요소 마우서 호버시에 나오는 타이틀에 적용될 생년월일 한글 문자열
	 * @return
	 */
	public String getBirthDateKor() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일");
		return sdf.format(this.birthDate);
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
		/*
		 * birthDate 가 세팅될대 Calendar 객체도 세팅
		 */
		cal.setTime(this.birthDate);
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s, %s, %s, %s, %d", this.name, this.phone, this.gender, this.birthDate,
				this.getHostNo());
	}
}
