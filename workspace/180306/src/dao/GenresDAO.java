package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import util.SqlSessionUtil;
import vo.Genre; 

public class GenresDAO {

  public static List<Genre> selectList() {
 
    List<Genre> list = null;
    SqlSession session = null;
    try {
      session = SqlSessionUtil.getSession();
      list = session.selectList("genres.selectList");
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null)
        session.close();
    } // try~catch~finally end

    return list;
  }
  
  public static int insert(String name) {
    
    int result = 0;
    
    SqlSession session = null;
    
    try {
      session = SqlSessionUtil.getSession();
      result = session.insert("genres.insert", name);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null)
        session.close();
    } // try~catch~finally end

    return result;
  }
  
public static int delete(int no) {
    
    int result = 0;
    
    SqlSession session = null;
    
    try {
      session = SqlSessionUtil.getSession();
      result = session.delete("genres.delete", no);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (session != null)
        session.close();
    } // try~catch~finally end

    return result;
  }
}
