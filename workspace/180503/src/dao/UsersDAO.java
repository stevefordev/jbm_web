package dao;

import java.util.List;
import vo.User;

public interface UsersDAO {

  public User selectLogin(User user);
  
  public List<User> selectList();
}
