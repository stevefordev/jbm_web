package org.jbm.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.jbm.board.util.SqlSessionUtil;
import org.jbm.board.vo.Board;
import org.jbm.board.vo.PageVO;

public class BoardDAO {
	
	
	public static int updateHit(int no) {
		int result = 0;
		
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			
			result = session.update("board.updateHit",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.close();
			}//if end
		}//try~catch~finally end
		
		
		
		return result;
	}
	
	
	
	public static Board selectOne(int no) {
		Board board = null;
		
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			
			board = session.selectOne("board.selectOne",no);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session !=null) session.close();
		}
		
		
		return board;
	}
	
	
	//parameterType을 맵으로
public static List<Board> selectList(Map<String, Object> pageVO) {
	List<Board> list = null;
	
	SqlSession session = null;
	
	try {
		session = SqlSessionUtil.getSession();
		list = session.selectList("board.selectList2",pageVO);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) session.close();
	}//try~catch~finally end
	
	return list;
	}

//parameterType을 맵으로
public static List<Board> selectListTest(Map<String, Object> map) {
	List<Board> list = null;
	
	SqlSession session = null;
	
	try {
		session = SqlSessionUtil.getSession();
		list = session.selectList("board.selectListTest",map);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(session!=null) session.close();
	}//try~catch~finally end
	
	return list;
}
	
	public static List<Board> selectList(PageVO pageVO) {
		
		List<Board> list = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("board.selectList",pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		
		return list;
	}
	
	public static int selectTotal() {
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			total = session.selectOne("board.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch~finally end
		
		return total;
	}
	
	
	public static int insert(Board board) {
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("board.insert",board);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}//if() end
		}//try~catch~finally end
		
		return result;
	}

}
