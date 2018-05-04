package service;

import java.util.List;
import vo.User;

public interface UsersService {

  public User login(User user);
  
  public List<User> getUserList();
}
