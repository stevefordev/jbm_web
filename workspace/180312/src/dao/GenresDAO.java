package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Genre;
import vo.PageVO;

public class GenresDAO {
	
	public static int selectTotal() {
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			total = session.selectOne("genres.selectTotal");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return total;
	}
	
	public static List<Genre> selectList(PageVO pageVO) {
		List<Genre> list = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			list = session.selectList("genres.selectList",pageVO);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

}
