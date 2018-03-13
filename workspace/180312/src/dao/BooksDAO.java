package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Book;
import vo.PageVO;

public class BooksDAO {
	
	public static int selectTotal() {
		int total = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			total = session.selectOne("books.selectTotal");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return total;
	}
	
	public static List<Book> selectList(PageVO pageVO) {
		List<Book> list = null;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			list = session.selectList("books.selectList",pageVO);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

}
