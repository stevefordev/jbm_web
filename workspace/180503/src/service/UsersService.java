package service;

import java.util.List;
import java.util.Map;
import vo.User;

public interface UsersService {

  public User login(User user);
  
  public Map<String, Object> getUserList(int page);
  
  public int getTotal();
}
