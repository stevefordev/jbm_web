package dao;

import java.util.List;
import java.util.Map;
import vo.User;

public interface UsersDAO {

  public User selectLogin(User user);
  
  public List<User> selectList(Map<String, Object> pageRange);
  
  public int selectTotal();
}
