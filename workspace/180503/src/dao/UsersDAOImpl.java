package dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import vo.User;

@Repository
public class UsersDAOImpl implements UsersDAO {

  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public User selectLogin(User user) {
    // TODO Auto-generated method stub
    return session.selectOne("users.selectLogin", user);
  }

  @Override
  public List<User> selectList(Map<String, Object> pageRange) {
    // TODO Auto-generated method stub
    return session.selectList("users.selectList", pageRange);
  }

  @Override
  public int selectTotal() {
    // TODO Auto-generated method stub
    return session.selectOne("users.selectTotal");
  }
}
