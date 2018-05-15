package com.jbm.mmp.dao;

import com.jbm.mmp.vo.Mania;

public interface ManiasDAO {
	/**
	 * 매니아를 입력하는 메서드
	 * @param mania 매니아 정보
	 * @return 입력된 매니아 갯수
	 */
	public int insert(Mania mania);
	
	/**
	 * 로그인을 처리하는 메서드
	 * @param mania : 아이디 / 비밀번호
	 * @return 로그인된 매니아의 정보
	 */
	public Mania selectLogin(Mania mania);
	
	/**
	 * 아이디 중복을 체크하는 메서드
	 * @param id : id
	 * @return 매니아 객체
	 */
	public Mania selectById(String id);
	

}
