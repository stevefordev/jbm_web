package com.jbm.mmp.dao;

import java.util.List;

import com.jbm.mmp.vo.MovieGenre;

public interface MovieGenresDAO {
	
	/**
	 * 해당 무비의 장르를 입력하는 메서드
	 * @param movieGenre 무비번호, 장르번호
	 * @return 입력된 갯수
	 */
	public int insert(MovieGenre movieGenre);
	
	/**
	 * 해당 영화에 대한 장르를 모두 지우는 메서드
	 * @param no 무비번호
	 * @return 지워진 갯수
	 */
	public int delete(int no);
	
	/**
	 * 해당 영화에 대한 장르번호를 얻어오는 메서드
	 * @param no 영화번호
	 * @return 장르리스트
	 */
	public List<MovieGenre> selectList(int no); 

}
