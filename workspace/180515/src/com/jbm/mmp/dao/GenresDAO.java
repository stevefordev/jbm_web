package com.jbm.mmp.dao;

import java.util.List;

import com.jbm.mmp.vo.Genre;

public interface GenresDAO {
	
	/**
	 * 장르를 입력하는 메서드
	 * @param genre : 입력할 장르VO
	 * @return 입력된 row의 갯수
	 */
	public int insert(Genre genre);
	
	/**
	 * 해당 장르가 몇 개 인지 얻어오는 메서드
	 * @param genre : 장르명
	 * @return 장르 갯수
	 */
	public int selectCount(String genre);
	
	/**
	 * 해당 장르의 영화갯수를 업데이트 하는 메서드
	 * @param no 장르번호
	 * @return 업데이트 된 장르 갯수
	 */
	public int updateCount(int no);
	
	/**
	 * 장르 전체를 얻어오는 메서드
	 * @return Genre의 List
	 */
	public List<Genre> selectList();
	
	/**
	 * 장르를 지우는 메서드
	 * @param no : 장르번호
	 * @return 지워진 장르의 갯수
	 */
	public int delete(int no);

}
