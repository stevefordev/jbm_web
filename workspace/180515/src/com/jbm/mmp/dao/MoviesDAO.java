package com.jbm.mmp.dao;

import java.util.List;

import com.jbm.mmp.vo.Movie;
import com.jbm.mmp.vo.PageVO;

public interface MoviesDAO {
	
	/**
	 * 영화 입력하는 메서드
	 * @param movie 영화정보
	 * @return 입력된 갯수
	 */
	public int insert(Movie movie);
	
	/**
	 * 영화를 수정하는 메서드
	 * @param movie : 수정할 영화정보
	 * @return 수정된 갯수
	 */
	public int update(Movie movie);
	
	/**
	 * 페이징된 영화를 리스트로 리턴
	 * @param pageVO 페이징 처리 VO
	 * @return 영화 리스트
	 */
	public List<Movie> selectList(PageVO pageVO);
	
	/**
	 * 영화 전체 갯수
	 * @return 영화갯수
	 */
	public int selectTotal();
	
	/**
	 * 영화 한 개의 정보를 얻어오는 메서드
	 * @param no 영화번호
	 * @return 영화정보
	 */
	public Movie selectOne(int no);
	
	/**
	 * 영화를 삭제하는 메서드
	 * @param no 영화번호
	 * @return 지워진 영화갯수
	 */
	public int delete(int no);

}
